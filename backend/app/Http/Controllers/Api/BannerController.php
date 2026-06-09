<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;

class BannerController extends Controller
{
    /**
     * Ambil semua banner atau filter berdasarkan kategori (query parameter)
     * Contoh:
     * - GET /api/banner           -> semua banner
     * - GET /api/banner?kategori=infografis  -> banner kategori infografis
     */
    public function index(Request $request)
    {
        $query = Banner::select('id', 'judul', 'gambar', 'slug', 'kategori', 'category', 'created_at');

        if ($request->has('kategori')) {
            $query->where('kategori', $request->query('kategori'));
        }

        $banners = $query->get()->map(function ($banner) {
            // Karena path 'gambar' di DB sudah lengkap, tinggal tambah prefix 'storage/'
            $banner->gambar_url = asset('storage/' . $banner->gambar);
            return $banner;
        });

        return response()->json($banners);
    }

    public function byKategori($kategori)
    {
        $banners = Banner::where('kategori', $kategori)
            ->select('id', 'judul', 'gambar', 'slug', 'kategori', 'created_at')
            ->get()
            ->map(function ($banner) {
                $banner->gambar_url = asset('storage/' . $banner->gambar);
                return $banner;
            });

        return response()->json($banners);
    }
}
