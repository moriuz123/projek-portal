<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Storage;


class Dokumen extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'kategori_dokumen_id',
        'slug',
        'sumber',
        'file_path',
        'link_drive',
        'tanggal_unggah'
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriDokumen::class, 'kategori_dokumen_id');
    }



    public function getFileUrlAttribute()
    {
        return $this->file_path ? Storage::url($this->file_path) : null;
    }
}
