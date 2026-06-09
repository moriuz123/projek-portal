<?php
// app/Models/Page.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HalamanStatis extends Model
{
    protected $fillable = ['judul', 'slug', 'isi', 'cover'];
}
