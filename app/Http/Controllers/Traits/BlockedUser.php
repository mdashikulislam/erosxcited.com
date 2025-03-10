<?php
namespace App\Http\Controllers\Traits;
trait BlockedUser
{
    public function blockedUser()
    {
        $blockedUsers = auth()->user()->restrictions()->pluck('user_restricted');
        $blockedByUsers = \DB::table('restrictions')
            ->where('user_restricted', auth()->id())
            ->pluck('user_id');
        return $blockedUsers->merge($blockedByUsers)->unique()->toArray();
    }
}
