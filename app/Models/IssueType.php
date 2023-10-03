<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class IssueType extends Model
{
    use HasFactory;

      protected $fillable = [
        'name',
        'status',
    ];
    
    protected $table = 'issue_type';
    
}
