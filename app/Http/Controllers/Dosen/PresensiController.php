<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jurnalPerkuliahanModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\masterModel;
use App\Models\Dosen\presensiModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PresensiController extends Controller
{
    public function index($id)
    {
        # code...
        $no = 1;
        // $auth = Auth::user()->email; //indentifikasi user
        // $dosen = DosenModel::where('email', $auth)->first();
        // // $hasilPresensi = presensiModel::where();
        // $presensi = krsModel::where('idKelasKuliah', $id)->whereHas('kelaskuliah', function($q){
        //     $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        // })->get();
        $semester = presensiModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal','=', 'presensimhs.idJurnal')
        ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idKelasKuliah')
        ->join('masterkelas', 'masterkelas.idMasterKelas', '=', 'kelaskuliah.idMasterKelas')
        ->join('matakuliah', 'matakuliah.idMataKuliah', '=', 'kelaskuliah.idMataKuliah')
        ->where('presensimhs.idJurnal', $id)
        ->first();
        $jurnal = jurnalPerkuliahanModel::where('idJurnal', $id)->first();
        $presensi = presensiModel::where('idJurnal', $id)->get();
        return view('package_dosen.presensi', compact('jurnal','presensi', 'no', 'semester'));
    }

    public function store(Request $request)
    {
        for ($i=0; $i < $request->row; $i++) { 
            presensiModel::where('idJurnal', $request->idJurnal)
            ->where('npm', request('npm'.$i))
            ->update([
                'kehadiran' => request('hadir'.$i),
                'keterangan' => request('keterangan'.$i)
            ]
            );
        }

        return back()->with('sukses', 'presensi berhasil disimpan');
    }
}
