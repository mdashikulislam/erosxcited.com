<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Donation extends Model
{
    protected $table = 'donations';
    protected $fillable =['user_id','title','description','status','preview','amount'];

    public function scopeActiveItem()
    {
        return $this->where('status', '1');
    }
    public function users()
    {
        return $this->hasOne(User::class,'id','user_id');
    }

    public function histories()
    {
        return $this->hasMany(DonationHistory::class,'donation_id','id');
    }
    public function activeHistories()
    {
        return $this->hasMany(DonationHistory::class,'donation_id','id')->where('status', '1');
    }
}
