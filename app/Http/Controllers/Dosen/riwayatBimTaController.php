<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\riwayatBimbinganTA;
use App\Models\Dosen\TugasAkhirModel;
use Illuminate\Http\Request;

class riwayatBimTaController extends Controller
{
    //
    public function index($id)
    {
        $riwayat = riwayatBimbinganTA::join('tugasakhir', 'tugasakhir.idTugasAkhir', 'riwayatbimbinganTA.idTugasAkhir')
        ->where('npm', $id)->get();
        return view('package_dosen.riwayatBimbinganTA', compact('riwayat'));
    }

    public function catatanStore(Request $request)
    {
        $simpanCatatan = riwayatBimbinganTA::where('idRiwayatTA', $request->idRiwayat )
        ->update([
            'tanggalBimbingan' => $request->tanggal,
            'komentar' => $request->catatan
        ]);

        $status= TugasAkhirModel::where('idTugasAkhir', $request->idTugasAkhir )
        ->update([
            'status' => $request->status
        ]);
        return back();
    }
}
