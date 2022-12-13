<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\presensiDosenModel;
use App\Models\Dosen\tahunAkademikModel;
use GeoIp2\Record\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class KelasKuliahController extends Controller
{
    public function index()
    {
        // $clientIP = request()->ip();
        // $clientIP = '114.5.163.226';
        // $locationData = \Location::get($clientIP);

        // dd($locationData);
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $ta = tahunAkademikModel::where('status', 'aktif')->first();
            $jadwal = KelasKuliahModel::where('nidn', $dosen->nidn)->where('idTahunAkademik', $ta->idTahunAkademik)->get();
            $progres = [];
            foreach ($jadwal as $j) {
                $presensiDosen = presensiDosenModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', 'presensidosen.idJurnal')
                ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idkelasKuliah')
                ->select(DB::raw('count(presensidosen.idJurnal) as jumlahHadir, kelaskuliah.idKelasKuliah'))
                ->groupby('kelaskuliah.idKelasKuliah')
                ->where('kelaskuliah.idKelasKuliah', $j->idKelasKuliah)
                ->get();
                foreach ($presensiDosen as $value) {
                    array_push($progres, $value);
                }
            }
            return view('package_dosen.jadwal', compact('jadwal', 'no', 'progres'));
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
            $progres = [];
            foreach ($jadwal as $j) {
                $presensiDosen = presensiDosenModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', 'presensidosen.idJurnal')
                ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idkelasKuliah')
                ->select(DB::raw('count(presensidosen.idJurnal) as jumlahHadir, kelaskuliah.idKelasKuliah'))
                ->groupby('kelaskuliah.idKelasKuliah')
                ->where('kelaskuliah.idKelasKuliah', $j->idKelasKuliah)
                ->get();
                foreach ($presensiDosen as $value) {
                    array_push($progres, $value);
                }
            }
            return view('package_dosen.jadwal', compact('jadwal', 'no', 'progres'));
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
            $progres = [];
            foreach ($jadwal as $j) {
                $presensiDosen = presensiDosenModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', 'presensidosen.idJurnal')
                ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idkelasKuliah')
                ->select(DB::raw('count(presensidosen.idJurnal) as jumlahHadir, kelaskuliah.idKelasKuliah'))
                ->groupby('kelaskuliah.idKelasKuliah')
                ->where('kelaskuliah.idKelasKuliah', $j->idKelasKuliah)
                ->get();
                foreach ($presensiDosen as $value) {
                    array_push($progres, $value);
                }
            }
            return view('package_dosen.jadwal', compact('jadwal', 'no', 'progres'));
        } catch (\Throwable $jadwal) {
            return view('package_dosen.jadwal', compact('jadwal'));
        }
    }
}
