<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\HalamanStatis;
use Illuminate\Http\Request;

class HalamanStatisController extends Controller
{
    // Ambil semua halaman statis
    public function index()
    {
        $data = HalamanStatis::select('id', 'judul', 'slug', 'isi', 'cover', 'created_at', 'updated_at')
            ->orderBy('updated_at', 'desc')
            ->get();

        return response()->json([
            'status' => 'success',
            'data' => $data
        ]);
    }

    // Ambil detail halaman statis berdasarkan slug
    public function show($slug)
    {
        $page = HalamanStatis::where('slug', $slug)->first();

        if (!$page) {
            return response()->json([
                'status' => 'error',
                'message' => 'Halaman tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'data' => $page
        ]);
    }
}
