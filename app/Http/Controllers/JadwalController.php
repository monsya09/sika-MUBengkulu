<?php

namespace App\Http\Controllers;

use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jurnalPerkuliahanModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\presensiModel;
use App\Models\Dosen\ruanganKelasModel;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JadwalController extends Controller
{
    // private $no;

    // public function __construct()
    // {
    //     $this->no = 1;
    // }
    public function index()
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jadwal = KelasKuliahModel::where('nidn', $dosen->nidn)->get();
        return view('package_dosen.jadwal', compact('jadwal', 'no'));
    }

    public function krsNilai()
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $krsNilai = krsModel::where('idKelasKuliah', 1)->whereHas('kelaskuliah', function($q){
            $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        })->get();
        // $jadwal = DosenJadwalModel::where('nidn', $dosen->nidn)->get();
        return view('package_dosen.jadwal', compact('krsNilai', 'no'));
    }

    public function jurnal($id)
    {
        // return $jurnal[0]->kelaskuliah;
        $untukJumlah = krsModel::where('idKelasKuliah', $id)->whereHas('kelaskuliah', function($q){
            $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        })->count();

        $jurnal = jurnalPerkuliahanModel::where('idKelasKuliah', $id)->whereHas('kelaskuliah', function($q){
            $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        })->get();
        $namaMK = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        return view('package_dosen.jurnalPerkuliahan', compact('untukJumlah', 'jurnal', 'namaMK', 'id'));
    }

    public function presensi($id)
    {
        # code...
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        // $hasilPresensi = presensiModel::where();
        $presensi = krsModel::where('idKelasKuliah', $id)->whereHas('kelaskuliah', function($q){
            $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));
        })->get();
        // return $hasilPresensi;
        return view('package_dosen.presensi', compact('presensi'));
    }
}
