<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\jadwalAkademikModel;
use App\Models\Dosen\MahasiswaModel;
use App\Models\Dosen\tahunAkademikModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class dashController extends Controller
{
    public function index()
    {
        $ta = tahunAkademikModel::where('status', 'aktif')->first();
        $angkatan = [];
        $t = Carbon::now()->year;
        $a = 4;
        while ($a >= 0) {
            $tahun = $t - $a;
            array_push($angkatan, $tahun);
            $a-=1;
        }
        $tahunMasuk = json_encode($angkatan);
        $jumlahMhs = [];
        foreach ($angkatan as $ang) {
            $getMhs = MahasiswaModel::where('angkatan', $ang)->count();
                array_push($jumlahMhs, $getMhs);
        }
        $mhsCount = json_encode($jumlahMhs);

        $mahasiswa = MahasiswaModel::where('angkatan', $t)
        ->select(DB::raw('count(npm) as jumMhs, angkatan, idProgramStudi'))
        ->groupby('angkatan', 'idProgramStudi')
        ->get();
        $mhsP = [];
        foreach ($mahasiswa as $m) {
            $hasil = $m->jumMhs;
            array_push($mhsP, $hasil);
        }

        $p = [];
        foreach ($mahasiswa as $m) {
            $getProdi = $m->programstudi->programStudi;
            array_push($p, $getProdi);
        }

        $mhsProdi = json_encode($mhsP);
        $prodi = json_encode($p);


        $jadAkademik = jadwalAkademikModel::where('idTahunAkademik', $ta->idTahunAkademik)->first();
        return view('package_dosen.dashboard', compact('ta','tahunMasuk','mhsCount', 'mhsProdi', 'prodi', 'jadAkademik'));
    }
}
