<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Dokumen;
use App\Models\KategoriDokumen;
use Illuminate\Http\Request;

class DokumenController extends Controller
{
    public function index()
    {
        $dokumen = Dokumen::with('kategori')
            ->latest()
            ->get();

        return response()->json($dokumen);
    }

    public function show($slug)
    {
        $dokumen = Dokumen::with('kategori')->where('slug', $slug)->firstOrFail();

        return response()->json($dokumen);
    }

    /**
     * Ambil dokumen berdasarkan kategori slug
     */
    public function byKategori($slug)
    {
        $kategori = KategoriDokumen::where('slug', $slug)->firstOrFail();

        $dokumen = Dokumen::with('kategori')
            ->where('kategori_dokumen_id', $kategori->id)
            ->latest()
            ->get();

        return response()->json([
            'kategori' => $kategori,
            'dokumen' => $dokumen
        ]);
    }
}
