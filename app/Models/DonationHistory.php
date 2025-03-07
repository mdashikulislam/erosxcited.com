<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DonationHistory extends Model
{
    protected $table = 'donation_histories';
    protected $fillable = [
        'donation_id',
        'user_id',
        'donor_id',
        'gross_amount',
        'net_amount',
        'status',
    ];

    public function users()
    {
        return $this->hasOne(User::class,'id','user_id');
    }
    public function donor()
    {
        return $this->hasOne(User::class,'id','donor_id');
    }
}
