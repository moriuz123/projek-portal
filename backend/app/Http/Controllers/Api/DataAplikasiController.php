<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\DataAplikasi;
use Illuminate\Http\Request;

class DataAplikasiController extends Controller
{
    public function index(Request $request)
    {
        $kategori = $request->query('kategori');
        $jenis = $request->query('jenis');
        $search = $request->query('search');

        $query = DataAplikasi::select('id', 'nama', 'icon', 'link', 'deskripsi', 'kategori', 'jenis');

        if ($kategori) {
            $query->where('kategori', $kategori);
        }

        if ($jenis) {
            $query->where('jenis', $jenis);
        }

        if ($search) {
            $query->where('nama', 'like', '%' . $search . '%');
        }

        $data = $query->get();

        return response()->json([
            'status' => 'success',
            'data' => $data,
        ]);
    }
}
