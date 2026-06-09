<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\KritikSaran;
use Illuminate\Http\Request;

class KritikSaranController extends Controller
{
    // Ambil semua kritik & saran (jika nanti mau ditampilkan)
    public function index()
    {
        return response()->json(KritikSaran::orderBy('id', 'desc')->get());
    }

    // Simpan data baru dari form frontend
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama' => 'required|string|max:100',
            'email' => 'nullable|email|max:100',
            'judul' => 'required|string|max:150',
            'isi_kritik' => 'required|string',
            'no_hpusr' => 'nullable|string|max:20',
        ]);

        $validated['tanggal'] = now();
        $validated['status'] = 0; // default belum dibalas
        $validated['balas'] = null;

        KritikSaran::create($validated);

        return response()->json([
            'message' => 'Kritik dan saran berhasil dikirim.',
            'success' => true
        ]);
    }
}
