<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vidio extends Model
{
    protected $fillable = [
        'kategori_vidio_id',
        'judul_vidio',
        'keterangan',
        'sumber_youtube',
        'is_active',
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriVidio::class, 'kategori_vidio_id');
    }
}
