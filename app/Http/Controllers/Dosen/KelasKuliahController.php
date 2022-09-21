<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\tahunAkademikModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KelasKuliahController extends Controller
{
    public function index()
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $ta = tahunAkademikModel::where('status', 'aktif')->first();
            $jadwal = KelasKuliahModel::where('nidn', $dosen->nidn)->where('idTahunAkademik', $ta->idTahunAkademik)->get();
            return view('package_dosen.jadwal', compact('jadwal', 'no'));
        } catch (\Throwable $jadwal) {
            return view('package_dosen.jadwal', compact('jadwal'));
        }

    }

    public function filter(Request $request)
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $jadwal = KelasKuliahModel::where('nidn', $dosen->nidn)->where('idTahunAkademik', $request->ta)->get();
            return view('package_dosen.jadwal', compact('jadwal', 'no'));
        } catch (\Throwable $jadwal) {
            return view('package_dosen.jadwal', compact('jadwal'));
        }
    }

    public function all()
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $jadwal = KelasKuliahModel::where('nidn', $dosen->nidn)->get();
            return view('package_dosen.jadwal', compact('jadwal', 'no'));
        } catch (\Throwable $jadwal) {
            return view('package_dosen.jadwal', compact('jadwal'));
        }
    }
}
