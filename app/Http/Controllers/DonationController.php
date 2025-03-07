<?php

namespace App\Http\Controllers;

use App\Helper;
use App\Models\AdminSettings;
use App\Models\Donation;
use App\Models\DonationHistory;
use App\Models\LiveComments;
use App\Models\Notifications;
use App\Models\PaymentGateways;
use App\Models\Referrals;
use App\Models\ReferralTransactions;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use FileUploader;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Image;
use Illuminate\Support\Str;
use Srmklive\PayPal\Services\PayPal as PayPalClient;

class DonationController extends Controller
{
    protected $settings;

    public function __construct()
    {
        $this->settings = AdminSettings::first();
    }

    public function index()
    {
        if (!$this->checkAccess()) {
            abort(403);
        }
        $user = auth()->user();
        $donations = \App\Models\Donation::withSum('activeHistories','gross_amount')
            ->where('user_id', $user->id)
            ->orderByDesc('created_at')
            ->get();
        $donations = $donations->map(function ($donation) {
            $collected = $donation->active_histories_sum_gross_amount ?? 0;
            $percentage = $donation->amount > 0 ? ($collected / $donation->amount) * 100 : 0;
            $percentage = min($percentage, 100);
            $donation->collected_percentage = round($percentage, 2);
            return $donation;
        });
        $histories = DonationHistory::with(['donor'=>function ($q){
            $q->select('id','username');
        }])
            ->whereHas('donor')
            ->where('user_id',$user->id)
            ->orderByDesc('created_at')
            ->paginate(10);
        return view('users.donation_index')->with([
                'donations' => $donations,
                'histories'=>$histories
            ]
        );
    }

    public function create()
    {
        if (!$this->checkAccess()) {
            abort(403);
        }
        return view('users.donation_create');
    }

    public function store(Request $request)
    {
        $request['fileuploader-list-preview'] = json_decode($request['fileuploader-list-preview']);
        $this->validate($request, [
            'title' => ['required', 'max:255'],
            'description' => ['required'],
            'amount' => ['required', 'min:10', 'numeric'],
            'fileuploader-list-preview' => ['required', 'array']
        ], [
            'fileuploader-list-preview.required' => 'The thumbnail field is required.'
        ]);
        $filename = null;
        if ($request['fileuploader-list-preview']) {
            if (!empty($request['fileuploader-list-preview'])) {
                $filename = $request['fileuploader-list-preview'][0]->file;
            }
        }
        $donation = new Donation();
        $donation->user_id = auth()->id();
        $donation->title = $request->title;
        $donation->description = $request->description;
        $donation->amount = $request->amount;
        $donation->status = $request->active_status ? 1 : 0;
        $donation->preview = $filename;
        $donation->save();
        return redirect('donation')->withStatus(trans('admin.success_add'));
    }

    public function edit($id)
    {
        if (!$this->checkAccess()) {
            abort(403);
        }
        $donation = Donation::find($id);
        if (empty($donation)) {
            return redirect('settings/donation');
        }
        return view('users.donation_edit')->with([
            'donation' => $donation,
            'imageUrl' => $donation->preview ? asset('/public/uploads/donation/' . $donation->preview) : null
        ]);
    }

    public function update($id, Request $request)
    {
        $exist = Donation::find($id);
        if (empty($exist)) {
            return redirect('settings/donation');
        }
        $request['fileuploader-list-preview'] = json_decode($request['fileuploader-list-preview']);
        $this->validate($request, [
            'title' => ['required', 'max:255'],
            'description' => ['required'],
            'amount' => ['required', 'min:10', 'numeric'],
            'fileuploader-list-preview' => ['required', 'array']
        ], [
            'fileuploader-list-preview.required' => 'The thumbnail field is required.'
        ]);
        $filename = null;
        if ($request['fileuploader-list-preview']) {
            if (!empty($request['fileuploader-list-preview'])) {
                $filename = $request['fileuploader-list-preview'][0]->file;
                $pos = strpos($filename, '/public/uploads/donation');
                if ($pos !== false) {
                    $fileExplode = explode('/public/uploads/donation/', $filename);
                    $filename = end($fileExplode);
                }
            }
        }
        $exist->title = $request->title;
        $exist->description = $request->description;
        $exist->amount = $request->amount;
        $exist->status = $request->active_status ? 1 : 0;
        $exist->preview = $filename;
        $exist->save();
        return redirect('donation')->withStatus(trans('admin.success_update'));
    }

    public function destroy($id)
    {
        $exist = Donation::find($id);
        if (empty($exist)) {
            return redirect('donation');
        }
        $exist->delete();
        return redirect('donation')->withStatus(trans('admin.success_delete'));
    }

    public function mediaDelete()
    {
        return response()->json([
            'success' => true
        ]);
    }

    function checkAccess()
    {
        $currentUser = auth()->user();
        if ($currentUser == 'admin') {
            return false;
        }
        if ($currentUser->verified_id != 'yes') {
            return false;
        }
        return true;
    }


    public function mediaUpload(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'preview' => 'required|mimes:jpg,png,jpe,jpeg|max:' . $this->settings->file_size_allowed,
        ]);

        if ($validator->fails()) {
            return response()->json([
                'isSuccess' => false,
                'hasWarnings' => true,
                'warnings' => $validator->errors(),
                'files' => []
            ], 422);
        }

        $path = 'uploads/donation/';

        if ($request->hasFile('preview')) {
            $photo = $request->file('preview');
            $extension = $photo->getClientOriginalExtension();
            $fileName = strtolower(auth()->user()->username . '-' . auth()->id() . time() . Str::random(10) . '.' . $extension);

            // Resize and encode image using Intervention Image
            $imgAvatar = Image::make($photo)->encode($extension);
            //$store = Storage::disk('public')->put($path.$fileName, (string) $imgAvatar);
            $store = Storage::put($path . $fileName, $imgAvatar, 'public');
            if ($store) {
                $fileSize = $photo->getSize();
                $fileSizeKB = round($fileSize / 1024, 2);

                return response()->json([
                    'hasWarnings' => false,
                    'isSuccess' => true,
                    'warnings' => [],
                    'files' => [
                        [
                            'extension' => $extension,
                            'format' => 'image',
                            'name' => $fileName,
                            'size' => $fileSize,
                            'size2' => "{$fileSizeKB} KB",
                            'type' => $photo->getMimeType(),
                            'uploaded' => true,
                            'replaced' => false
                        ]
                    ]
                ]);
            } else {
                return response()->json([
                    'isSuccess' => false,
                    'hasWarnings' => true,
                    'warnings' => ['Error uploading file'],
                    'files' => []
                ], 500);
            }
        }

        return response()->json([
            'isSuccess' => false,
            'hasWarnings' => true,
            'warnings' => ['No file uploaded'],
            'files' => []
        ], 400);
    }

    public function send(Request $request)
    {
        $user = User::where('id', auth()->id())->firstOrFail();
        if ($this->settings->currency_position == 'right') {
            $currencyPosition = 2;
        } else {
            $currencyPosition = null;
        }
        $messages = array(
            'amount.min' => trans('general.amount_minimum' . $currencyPosition, ['symbol' => $this->settings->currency_symbol, 'code' => $this->settings->currency_code]),
            'amount.max' => trans('general.amount_maximum' . $currencyPosition, ['symbol' => $this->settings->currency_symbol, 'code' => $this->settings->currency_code]),
        );
        $validator = Validator::make($request->all(), [
            'amount' => 'required|integer|min:1',
            'payment_gateway_donate' => 'required',
        ], $messages);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->getMessageBag()->toArray(),
            ]);
        }
        $donation = Donation::with('users')->whereHas('users')->where('id', $request->id)->first();
        if (auth()->id() == $donation->users->id) {
            return response()->json([
                "success" => false,
                "errors" => ['error' => __('general.cannot_donate_to_yourself')]
            ]);
        }
        switch ($request->payment_gateway_donate) {
            case 'wallet':
                return $this->sendTipWallet($request);
                break;

            case 'PayPal':
                return $this->sendDonatePayPal($request);
                break;
        }
        return response()->json([
            'success' => false,
            'errors' => 'Payment gateway not found',
        ]);
    }

    protected function sendTipWallet(Request $request)
    {
        $donation = Donation::with('users')->whereHas('users')->where('id', $request->id)->first();
        if (empty($donation)) {
            return response()->json([
                "success" => false,
                "errors" => ['error' => __('general.donation_not_found')]
            ]);
        }
        $amount = $request->amount;
        if (auth()->user()->wallet < Helper::amountGross($amount)) {
            return response()->json([
                "success" => false,
                "errors" => ['error' => __('general.not_enough_funds')]
            ]);
        }
        $earnings = $this->earningsAdminUser($donation->users->custom_fee, $amount, null, null);
        $this->transaction('w_' . str_random(25),
            auth()->id(),
            0,
            $donation->users->id,
            $amount,
            $earnings['user'],
            $earnings['admin'],
            'Wallet',
            'donation',
            $earnings['percentageApplied'],
            auth()->user()->taxesPayable());
            auth()->user()->decrement('wallet', Helper::amountGross($amount));
            $donation->users->increment('balance', $earnings['user']);
            $history = new DonationHistory();
            $history->donation_id = $donation->id;
            $history->user_id = $donation->users->id;
            $history->donor_id = auth()->id();
            $history->gross_amount = $amount;
            $history->net_amount = $earnings['user'];
            $history->status = '1';
            $history->save();
            
            if (!$request->isLive) {
                Notifications::send($donation->users->id, auth()->id(), '20', auth()->id());
            }
            
            return response()->json([
                "success" => true,
                "wallet" => Helper::userWallet()
            ]);

    }

    public function earningsAdminUser($userCustomFee, $amount, $paymentFee, $paymentFeeCents)
    {
        $settings = AdminSettings::first();
        $feeCommission = $userCustomFee == 0 ? $settings->fee_commission : $userCustomFee;
        if (isset($paymentFee)) {
            $processorFees = $amount - ($amount * $paymentFee / 100) - $paymentFeeCents;

            // Earnings Net User
            $earningNetUser = $processorFees - ($processorFees * $feeCommission / 100);
            // Earnings Net Admin
            $earningNetAdmin = $processorFees - $earningNetUser;
        } else {
            // Earnings Net User
            $earningNetUser = $amount - ($amount * $feeCommission / 100);

            // Earnings Net Admin
            $earningNetAdmin = ($amount - $earningNetUser);
        }

        if (isset($paymentFee)) {
            $paymentFees = $paymentFeeCents == 0.00 ? $paymentFee . '% + ' : $paymentFee . '%' . ' + ' . $paymentFeeCents . ' + ';
        } else {
            $paymentFees = null;
        }

        // Percentage applied
        $percentageApplied = $paymentFees . $feeCommission . '%';


        if ($settings->currency_code == 'JPY') {
            $userEarning = floor($earningNetUser);
            $adminEarning = floor($earningNetAdmin);
        } else {
            $userEarning = number_format($earningNetUser, 2, '.', '');
            $adminEarning = number_format($earningNetAdmin, 2, '.', '');
        }

        return [
            'user' => $userEarning,
            'admin' => $adminEarning,
            'percentageApplied' => $percentageApplied
        ];

    }

    public function sendDonatePayPal(Request $request)
    {
        $payment = PaymentGateways::whereId(1)->whereName('PayPal')->firstOrFail();
        $donation = Donation::with('users')->whereHas('users')->where('id', $request->id)->first();
        if (empty($donation)) {
            return response()->json([
                "success" => false,
                "errors" => ['error' => __('general.donation_not_found')]
            ]);
        }

        $urlSuccess = route('paypal.success');
        $urlCancel = url('paypal/donate/cancel', $donation->users->username);
        try {
            $provider = new PayPalClient();
            $token = $provider->getAccessToken();
            $provider->setAccessToken($token);
            $order = $provider->createOrder([
                "intent" => "CAPTURE",
                'application_context' =>
                    [
                        'return_url' => $urlSuccess,
                        'cancel_url' => $urlCancel,
                        'shipping_preference' => 'NO_SHIPPING'
                    ],
                "purchase_units" => [
                    [
                        "amount" => [
                            "currency_code" => $this->settings->currency_code,
                            "value" => Helper::amountGross($request->amount),
                            'breakdown' => [
                                'item_total' => [
                                    "currency_code" => $this->settings->currency_code,
                                    "value" => Helper::amountGross($request->amount)
                                ],
                            ],
                        ],
                        'description' => __('general.donate_for') . ' @' . $donation->users->username,

                        'items' => [
                            [
                                'name' => __('general.donate_for') . ' @' . $donation->users->username,
                                'category' => 'DIGITAL_GOODS',
                                'quantity' => '1',
                                'unit_amount' => [
                                    "currency_code" => $this->settings->currency_code,
                                    "value" => Helper::amountGross($request->amount)
                                ],
                            ],
                        ],
                        'custom_id' => http_build_query([
                            'id' => $donation->id,
                            'amount' => $request->amount,
                            'sender' => auth()->id(),
                            'taxes' => auth()->user()->taxesPayable(),
                            'type' => 'donation'
                        ]),
                    ],
                ],
            ]);
            return response()->json([
                'success' => true,
                'url' => $order['links'][1]['href']
            ]);
        } catch (\Exception $e) {
            \Log::debug($e);

            return response()->json([
                'errors' => ['error' => $e->getMessage()]
            ]);
        }
    }

    public function transaction(
        $txnId,
        $userId,
        $subscriptionsId,
        $subscribed,
        $amount,
        $userEarning,
        $adminEarning,
        $paymentGateway,
        $type,
        $percentageApplied,
        $taxes,
        $approved = '1'
    )
    {
        $settings = AdminSettings::first();

        $referred =  null;

        // Insert Transaction
        $txn = new Transactions();
        $txn->txn_id = $txnId;
        $txn->user_id = $userId;
        $txn->subscriptions_id = $subscriptionsId;
        $txn->subscribed = $subscribed;
        $txn->amount = $amount;
        $txn->earning_net_user = $userEarning;
        $txn->earning_net_admin = $referred ? $referred['adminEarning'] : $adminEarning;
        $txn->payment_gateway = $paymentGateway;
        $txn->type = $type;
        $txn->percentage_applied = $percentageApplied;
        $txn->approved = $approved;
        $txn->referred_commission = $referred ? true : false;
        $txn->taxes = $taxes;
        $txn->direct_payment = $stripeConnect ?? false;
        $txn->save();
        return $txn;
    }
    protected function referred($userId, $adminEarning, $type)
    {
        if (config('settings.referral_system') == 'on') {
            $referred = Referrals::whereUserId($userId)->first();
            if ($referred) {
                $referredBy = User::find($referred->referred_by);
                if ($referredBy) {
                    $transactions = ReferralTransactions::whereUserId($userId)->count();
                    if (config('settings.referral_transaction_limit') == 'unlimited'
                        || $transactions < config('settings.referral_transaction_limit')
                    ) {

                        $adminEarningFinal = $adminEarning - ($adminEarning * config('settings.percentage_referred')/100);

                        $earningNetUser = ($adminEarning - $adminEarningFinal);
                        $adminEarning   = ($adminEarning - $earningNetUser);

                        if (config('settings.currency_code') == 'JPY') {
                            $earningNetUser = floor($earningNetUser);
                            $adminEarning   = floor($adminEarning);
                        } else {
                            $earningNetUser = round($earningNetUser, 2, PHP_ROUND_HALF_DOWN);
                            $adminEarning   = round($adminEarning, 2, PHP_ROUND_HALF_DOWN);
                        }

                        if ($earningNetUser != 0) {
                            // Insert User Earning
                            $newTransaction = new ReferralTransactions();
                            $newTransaction->referrals_id = $referred->id;
                            $newTransaction->user_id = $referred->user_id;
                            $newTransaction->referred_by = $referred->referred_by;
                            $newTransaction->earnings = $earningNetUser;
                            $newTransaction->type = $type;
                            $newTransaction->save();

                            // Add Earnings to User
                            $referred->referredBy()->increment('balance', $earningNetUser);

                            // Notify to user - destination, author, type, target
                            Notifications::send($referred->referred_by, $referred->referred_by, 11, $referred->referred_by);

                            return [
                                'txnId' => $newTransaction->id,
                                'adminEarning' => $adminEarning
                            ];
                        }
                    }
                }//=== $referredBy
            }// $referred
        }// referral_system On

        return false;
    }
}
