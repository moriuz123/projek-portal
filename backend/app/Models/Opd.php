<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Opd extends Model
{
    protected $fillable = [
        'nama',
        'slug',
        'singkatan',
        'pimpinan',
        'deskripsi',
        'email',
        'telepon',
        'website',
        'alamat',
        'logo',
        'foto_kantor',
        'peta_embed',
        'urutan',
        'is_published',
    ];
}
