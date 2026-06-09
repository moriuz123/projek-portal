<?php
// app/Models/Pengumuman.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pengumuman extends Model
{
    protected $table = 'pengumumen';

    protected $fillable = [
        'judul',
        'slug',
        'isi',
        'gambar',

        'file_lampiran',
        'tgl_pelaksanaan',
        'mulai_tayang',
        'selesai_tayang',
        'status',
    ];
}
