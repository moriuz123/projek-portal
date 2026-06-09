<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Str;

class KategoriDokumen extends Model
{
    use HasFactory;

    protected $fillable = ['nama', 'slug'];

    protected static function booted(): void
    {
        static::saving(function ($model) {
            // Update slug jika nama berubah atau slug kosong
            if ($model->isDirty('nama') || empty($model->slug)) {
                $model->slug = Str::slug($model->nama);
            }
        });
    }
}
