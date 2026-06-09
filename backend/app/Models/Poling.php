<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Poling extends Model
{
    protected $table = 'poling';
    protected $primaryKey = 'poling_id';
    public $timestamps = false;

    protected $fillable = [
        'pilihan',
        'type',
        'rating',
        'status',
        'id',
    ];

    // Relasi jika perlu nanti
    public function pertanyaan()
    {
        return $this->belongsTo(Poling::class, 'id', 'poling_id');
    }

    public function jawaban()
    {
        return $this->hasMany(Poling::class, 'id', 'poling_id');
    }

    
}
