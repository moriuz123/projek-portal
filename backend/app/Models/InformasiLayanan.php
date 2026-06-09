<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InformasiLayanan extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'deskripsi',
        'slug',
        'cover',
        'kontak',
        'unit_pelaksana',
        'status',
    ];
}
