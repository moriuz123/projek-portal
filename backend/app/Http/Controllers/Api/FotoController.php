<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Foto;

class FotoController extends Controller
{
    // Ambil semua data foto
    public function index()
    {
        $fotos = Foto::with('kategori')->latest()->get();
        return response()->json($fotos);
    }

    // Ambil detail foto berdasarkan id
    public function show($id)
    {
        $foto = Foto::with('kategori')->findOrFail($id);
        return response()->json($foto);
    }
}
