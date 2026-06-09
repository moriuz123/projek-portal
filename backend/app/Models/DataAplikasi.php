<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataAplikasi extends Model
{
    protected $fillable = [
        'nama',
        'slug',
        'jenis',
        'kategori', // ✅ DITAMBAHKAN INI
        'deskripsi',
        'link',
        'icon',
        'opd_pelaksana',
    ];
}
