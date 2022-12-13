<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\BimbinganKrsModel;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\KhsModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\PAModel;
use App\Models\Dosen\tahunAkademikModel;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BimbinganCotroller extends Controller
{
    public function BimbinganKrstahunAktif()
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $ta = tahunAkademikModel::where('status', ('aktif'))->first();

            $bimbingan = BimbinganKrsModel::join('pembimbingakademik', 'pembimbingakademik.idPembimbingAkademik', '=', 'bimbingankrs.idPembimbingAkademik')
            ->join('krs', 'krs.idKRS', '=', 'bimbingankrs.idKRS')
            ->join('mahasiswa', 'krs.npm', '=', 'mahasiswa.npm')
            ->join('programstudi', 'programstudi.idProgramStudi', '=', 'mahasiswa.idProgramStudi')
            ->join('fakultas', 'fakultas.idFakultas', '=', 'programstudi.idFakultas')
            ->where('pembimbingakademik.nidn', $dosen->nidn)
            ->where('idTahunAkademik', $ta->idTahunAkademik)
            ->select('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik')
            ->groupby('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik');
            $bim = $bimbingan->get();
            $tahunAkademik = $bimbingan->first();
            return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
        } catch (\Throwable $bim) {
            return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
        }

    }

    // public function filter(Request $request)
    // {
    //     try {
    //         $no = 1;
    //         $auth = Auth::user()->email; //indentifikasi user
    //         $dosen = DosenModel::where('email', $auth)->first();
    //         $bimbingan = BimbinganKrsModel::join('pembimbingakademik', 'pembimbingakademik.idPembimbingAkademik', '=', 'bimbingankrs.idPembimbingAkademik')
    //         ->join('krs', 'krs.idKRS', '=', 'bimbingankrs.idKRS')
    //         ->join('mahasiswa', 'krs.npm', '=', 'mahasiswa.npm')
    //         ->join('programstudi', 'programstudi.idProgramStudi', '=', 'mahasiswa.idProgramStudi')
    //         ->join('fakultas', 'fakultas.idFakultas', '=', 'programstudi.idFakultas')
    //         ->where('pembimbingakademik.nidn', $dosen->nidn)
    //         ->where('idTahunAkademik', $request->ta)
    //         ->select('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik')
    //         ->groupby('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik');
    //         $bim = $bimbingan->get();
    //         $tahunAkademik = $bimbingan->first();
    //         return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
    //     } catch (\Throwable $bim) {
    //         return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
    //     }
    // }

    // public function all()
    // {
    //     try {
    //         $no = 1;
    //         $auth = Auth::user()->email; //indentifikasi user
    //         $dosen = DosenModel::where('email', $auth)->first();
    //         $bimbingan = BimbinganKrsModel::join('pembimbingakademik', 'pembimbingakademik.idPembimbingAkademik', '=', 'bimbingankrs.idPembimbingAkademik')
    //         ->join('krs', 'krs.idKRS', '=', 'bimbingankrs.idKRS')
    //         ->join('mahasiswa', 'krs.npm', '=', 'mahasiswa.npm')
    //         ->join('programstudi', 'programstudi.idProgramStudi', '=', 'mahasiswa.idProgramStudi')
    //         ->join('fakultas', 'fakultas.idFakultas', '=', 'programstudi.idFakultas')
    //         ->where('pembimbingakademik.nidn', $dosen->nidn)
    //         ->select('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik')
    //         ->groupby('mahasiswa.nama_mhs', 'krs.npm', 'programstudi.programStudi', 'fakultas.namaFakultas', 'mahasiswa.angkatan', 'status', 'idTahunAkademik');
    //         $bim = $bimbingan->get();
    //         $tahunAkademik = $bimbingan->first();
    //         return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
    //     } catch (\Throwable $bim) {
    //         return view('package_dosen.bimbinganKrs', compact('bim', 'tahunAkademik'));
    //     }
    // }

    public function dataMhsBimbinganAkademik()
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $credits = KhsModel::join('krs', 'krs.idKRS', 'khs.idKRS')
        ->join('matakuliah', 'matakuliah.idMataKuliah', 'krs.idMataKuliah')
        ->select(DB::raw('sum(matakuliah.totalSKSMK) as credits, krs.npm'))
        ->groupby('krs.npm')
        ->where('nilaiAkhir', '>', 20)
        ->get();
        $mhs = PAModel::where('nidn', $dosen->nidn)
        ->select('nidn','npm')->groupBy('nidn', 'npm')
        ->get();
        return view('package_dosen.pembimbingAK', compact('mhs', 'no', 'credits', 'dosen'));
    }

    // public static function hitungIp($npm, $tahunIni)
    // { 
	// $khs = KhsModel::join('krs', 'krs.idKRS', '=', 'khs.idKRS')
    //     ->where('npm', $npm)->where('khs.semester', $tahunIni)->get();
    //     $ip = 0;
    //     $sum = 0;
    //     foreach ($khs as $value) {
    //         $nilai = 0;
    //         switch ($value->gradeNilai) {
    //             case 'A':
    //                 $nilai = 4;
    //                 break;
    //             case 'B':
    //                 $nilai = 3;
    //                 break;
    //             case 'C':
    //                 $nilai = 2;
    //                 break;
    //             case 'D':
    //                 $nilai = 1;
    //                 break;
    //             default:
    //                 break;
    //         }
    //         $sum += $nilai;
    //     }
    //     if (sizeof($khs)>0)
    //         return $ip = $sum / sizeof($khs);
    //     else
    //         return $ip = $sum;
    // }

    public function perMahasiswa($id, $ta)
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $credits = KhsModel::join('krs', 'krs.idKRS', 'khs.idKRS')
            ->join('matakuliah', 'matakuliah.idMataKuliah', 'krs.idMataKuliah')
            ->select(DB::raw('sum(matakuliah.totalSKSMK) as credits, krs.npm'))
            ->groupby('krs.npm')
            ->where('nilaiAkhir', '>', 20)
            ->get();

            if (substr($ta,-1) == 1) {
                $tAk = $ta - 9;
            }else{
                $tAk = $ta - 1;
            }

            // $ip = KhsModel::join('krs', 'krs.idKRS', 'khs.idKRS')
            // ->select(DB::raw('sum(nilaiAkhir) as na, krs.npm'))
            // ->groupby('krs.npm')
            // ->where('krs.npm', $id)
            // ->where('idTahunAkademik', $tAk)
            // ->get();

            $khs = KhsModel::join('krs', 'krs.idKRS', 'khs.idKRS')
            ->where('krs.npm', $id)
            ->where('idTahunAkademik', $tAk)
            ->get();
            $ip = 0;
            $sum = 0;
            foreach ($khs as $value) {
                $nilai = 0;
                switch ($value->gradeNilai) {
                    case 'A':
                        $nilai = 4;
                        break;
                    case 'B':
                        $nilai = 3;
                        break;
                    case 'C':
                        $nilai = 2;
                        break;
                    case 'D':
                        $nilai = 1;
                        break;
                    default:
                        break;
                }
                $sum += $nilai;
            }
            if (sizeof($khs)>0)
                $ip = $sum / sizeof($khs);
            else
                $ip = $sum;

            if ($ip >= 3.1)
                $maxSks = 24;
            else
                $maxSks = 18;
                
            $PerMhs = BimbinganKrsModel::join('pembimbingakademik', 'pembimbingakademik.idPembimbingAkademik', '=', 'bimbingankrs.idPembimbingAkademik')
            ->join('krs', 'krs.idKRS', '=', 'bimbingankrs.idKRS')
            ->join('matakuliah', 'matakuliah.idMataKuliah', '=', 'krs.idMataKuliah')
            ->join('mahasiswa', 'krs.npm', '=', 'mahasiswa.npm')
            ->join('programstudi', 'programstudi.idProgramStudi', '=', 'mahasiswa.idProgramStudi')
            ->join('fakultas', 'fakultas.idFakultas', '=', 'programstudi.idFakultas')
            ->where('pembimbingakademik.nidn', $dosen->nidn)
            ->where('idTahunAkademik', $ta)
            ->where('mahasiswa.npm', $id);
            
            $krsPerMhs= $PerMhs->get();
            $krs= $PerMhs->first();
            
            // return $krsPerMhs;
            return view('package_dosen.bimbinganPerMhs', compact('krsPerMhs', 'no', 'krs', 'credits', 'ip', 'maxSks'));
        } catch (\Throwable $krsPerMhs) {
            return view('package_dosen.bimbinganKrs', compact('krsPerMhs', 'no'));
        }
    }

    public function rincianKrs($npm)
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $PerMhs = BimbinganKrsModel::join('pembimbingakademik', 'pembimbingakademik.idPembimbingAkademik', '=', 'bimbingankrs.idPembimbingAkademik')
            ->join('krs', 'krs.idKRS', '=', 'bimbingankrs.idKRS')
            ->join('matakuliah', 'matakuliah.idMataKuliah', '=', 'krs.idMataKuliah')
            ->join('mahasiswa', 'krs.npm', '=', 'mahasiswa.npm')
            ->join('programstudi', 'programstudi.idProgramStudi', '=', 'mahasiswa.idProgramStudi')
            ->join('fakultas', 'fakultas.idFakultas', '=', 'programstudi.idFakultas')
            ->where('pembimbingakademik.nidn', $dosen->nidn)
            ->where('mahasiswa.npm', $npm)
            ->where('status', 'Diterima')
            ->orderBy('idTahunAkademik', 'desc');
            
            $krsPerMhs= $PerMhs->get();
            $krs= $PerMhs->first();
            return view('package_dosen.rincianKrsMhs', compact('krsPerMhs', 'no', 'krs'));
        } catch (\Throwable $krsPerMhs) {
            return view('package_dosen.rincianKrsMhs', compact('krsPerMhs', 'no'));
        }
    }

    public function krsDitolak(Request $request)
    {
        try {
            for ($i=0; $i < $request->row; $i++) {
                BimbinganKrsModel::where('idBimbinganKRS', request('idBim'.$i))
                ->update([
                    'pesanBimbingan' => $request->catatan,
                    'status' => "Ditolak"
                ]);

                krsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'statusKRS' => "Ditolak"
                ]);
            }
            return redirect('/bimbingan');
        } catch (\Throwable $krsPerMhs) {
            return redirect('/bimbingan');
        }
    }
    public function krsDiterima(Request $request)
    {
        try {
            for ($i=0; $i < $request->baris; $i++) {
                BimbinganKrsModel::where('idBimbinganKRS', request('idBim'.$i))
                ->update([
                    'status' => "Diterima"
                ]);

                krsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'statusKRS' => "Diterima"
                ]);

                krsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'statusKRS' => "Diterima"
                ]);
            }
            return redirect('/bimbingan');
        } catch (\Throwable $krsPerMhs) {
            return redirect('/bimbingan');
        }
    }
}
