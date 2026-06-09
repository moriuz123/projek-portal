<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Foto extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'kategori_foto_id',
        'gambar',
        'deskripsi',
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriFoto::class, 'kategori_foto_id');
    }
}
