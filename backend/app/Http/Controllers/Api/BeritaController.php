<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Berita;

class BeritaController extends Controller
{
    // 🔹 Semua berita (default 6 terbaru)
    public function index()
    {
        $beritas = Berita::with('kategori') // ✅ Tambahkan ini
            ->published()
            ->orderBy('tanggal_publish', 'desc')
            ->limit(10)
            ->get()
            ->map(function ($item) {
                $item->image = $item->thumbnail
                    ? Storage::url($item->thumbnail)
                    : asset('images/default-thumbnail.jpg');
                return $item;
            });

        return response()->json($beritas);
    }

    // 🔹 Detail berita by slug
    public function show($slug)
    {
        $berita = Berita::with('kategori')
            ->published()
            ->where('slug', $slug)
            ->firstOrFail();

        // ✅ Tambah counter views otomatis
        $berita->increment('views');

        // ✅ Siapkan gambar thumbnail
        $berita->image = $berita->thumbnail
            ? Storage::url($berita->thumbnail)
            : asset('images/default-thumbnail.jpg');

        return response()->json($berita);
    }

    // 🔹 Filter berita berdasarkan kategori slug
    public function byKategori($slug)
    {
        $beritas = Berita::with('kategori') // ✅ Tambahkan ini
            ->byKategoriSlug($slug)
            ->published()
            ->orderBy('tanggal_publish', 'desc')
            ->get()
            ->map(function ($item) {
                $item->image = $item->thumbnail
                    ? Storage::url($item->thumbnail)
                    : asset('images/default-thumbnail.jpg');
                return $item;
            });

        return response()->json($beritas);
    }

    // 🔹 Berita terbaru (default 5)
    public function latest()
    {
        $beritas = Berita::with('kategori') // ✅ Tambahkan ini
            ->latestNews()
            ->get();

        return response()->json($beritas);
    }

    // 🔹 Berita populer (default 5)
    public function popular()
    {
        $beritas = Berita::with('kategori') // ✅ Tambahkan ini
            ->popularNews()
            ->get();

        return response()->json($beritas);
    }
}
