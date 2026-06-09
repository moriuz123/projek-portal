<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Vidio;
use Illuminate\Http\Request;

class VidioController extends Controller
{
    // GET semua video
    public function index()
    {
        $vidios = Vidio::with('kategori')
            ->where('is_active', 1)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json($vidios);
    }

    // GET detail video
    public function show($id)
    {
        $vidio = Vidio::with('kategori')->findOrFail($id);
        return response()->json($vidio);
    }
}
