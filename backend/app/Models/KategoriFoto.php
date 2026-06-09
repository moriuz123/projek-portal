<?php
// app/Models/KategoriFoto.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class KategoriFoto extends Model
{
    protected $fillable = ['nama', 'slug', 'cover'];

    public function fotos()
    {
        return $this->hasMany(Foto::class);
    }

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $model->slug = Str::slug($model->nama);
        });
    }
}
