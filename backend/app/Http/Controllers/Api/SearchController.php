<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Berita;
use App\Models\Dokumen;
use App\Models\Opd;
use App\Models\InformasiLayanan;
use App\Models\Pengumuman;
use App\Models\Agenda;
use App\Models\DataAplikasi; // ✅ Penambahan modul DataAplikasi
use App\Models\Kecamatan; // ✅ Penambahan model Kecamatan


class SearchController extends Controller
{
    public function search(Request $request)
    {
        $q = $request->query('q');

        if (!$q) {
            return response()->json([
                'berita' => [],
                'dokumen' => [],
                'opd' => [],
                'layanan' => [],
                'pengumuman' => [],
                'agenda' => [],
                'aplikasi' => [], // ✅ Tambahan hasil kosong untuk DataAplikasi
                'kecamatan' => [], // ✅ Penambahan hasil kosong untuk Kecamatan
            ]);
        }

        $results = [
            'berita' => Berita::where('judul', 'like', "%$q%")
                ->orWhere('konten', 'like', "%$q%")
                ->get(),

            'dokumen' => Dokumen::where('judul', 'like', "%$q%")->get(),

            'opd' => Opd::where('nama', 'like', "%$q%")->get(),

            'layanan' => InformasiLayanan::where('judul', 'like', "%$q%")->get(),

            'pengumuman' => Pengumuman::where('judul', 'like', "%$q%")
                ->orWhere('isi', 'like', "%$q%")
                ->get(),

            'agenda' => Agenda::where('judul', 'like', "%$q%")
                ->orWhere('deskripsi', 'like', "%$q%")
                ->get(),

            // ✅ Penambahan query DataAplikasi
            'aplikasi' => DataAplikasi::where('nama', 'like', "%$q%")
                ->orWhere('deskripsi', 'like', "%$q%")
                ->get(),

            // ✅ Penambahan query Kecamatan
            'kecamatan' => Kecamatan::where('nama', 'like', "%$q%")
                ->orWhere('deskripsi', 'like', "%$q%")
                ->get(),
        ];


        return response()->json($results);
    }
}
