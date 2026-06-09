<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Agenda;
use Illuminate\Http\Request;

class AgendaController extends Controller
{
    public function index()
    {
        $agendas = Agenda::orderBy('tanggal_mulai', 'desc')->get();

        return response()->json([
            'status' => 'success',
            'data' => $agendas,
        ]);
    }

    // 🔹 Tambahan untuk detail agenda
    public function show($id)
    {
        $agenda = Agenda::find($id);

        if (!$agenda) {
            return response()->json([
                'status' => 'error',
                'message' => 'Agenda tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'data' => $agenda,
        ]);
    }
}
