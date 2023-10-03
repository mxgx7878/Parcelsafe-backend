<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Safes extends Model
{
    use HasFactory;

    
    protected $table = 'safes';
    
    // public function user(): HasOne
    // {
    //     return $this->hasOne(User::class, 'id', 'user_id')->select(['id', 'name']);
    // }
}
