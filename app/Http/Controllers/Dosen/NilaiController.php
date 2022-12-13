<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\krsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NilaiController extends Controller
{
    public function index($id)
    {
        // $no = 1;
        // $auth = Auth::user()->email; //indentifikasi user
        // $dosen = DosenModel::where('email', $auth)->first();
        // $krsNilai = krsModel::where('idKelasKuliah', 1)->whereHas('kelaskuliah', function($q){
        //     $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        // })->get();
        // // $jadwal = DosenJadwalModel::where('nidn', $dosen->nidn)->get();
        // return view('package_dosen.jadwal', compact('krsNilai', 'no'));
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $Mhs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->get();

        for ($i=0; $i < $Mhs->count(); $i++) { 
            # code...
        }
        return view('package_dosen.nilai', compact('Mhs', 'no', 'jadwal'));
    }
}
