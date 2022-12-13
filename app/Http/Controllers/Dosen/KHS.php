<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\detailKhsModel;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\KhsModel;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KHS extends Controller
{
    public function prosesFinalisasi(Request $request){
        $jadwalKelas = KelasKuliahModel::where('idKelasKuliah', $request->jadwalKelas)
        ->first();
        $detailKhs = detailKhsModel::where('idKelasKuliah', $request->jadwalKelas)->get();
        foreach ($detailKhs as $k) {
            if ($k->nilaiAkhir > 80) {
                $gradeNilai = 'A';
            }elseif ($k->nilaiAkhir > 75) {
                $gradeNilai = 'B';
            }elseif ($k->nilaiAkhir > 65) {
                $gradeNilai = 'C';
            }elseif ($k->nilaiAkhir > 50) {
                $gradeNilai = 'D';
            }else{
                $$gradeNilai = 'E';
            };
            detailKhsModel::where('idKelasKuliah', $request->jadwalKelas)
            ->update([
                'statusPenilaian' => 'final'
            ]);
            KhsModel::upsert([
                'idKHS' => $k->idKelasKuliah.'-'.$k->idKRS,
                'idKRS'=> $k->idKRS,
                'idKelasKuliah' => $k->idKelasKuliah,
                'nilaiAkhir' => $k->nilaiAkhir,
                'gradeNilai' => $gradeNilai,
                'semester' => $k->semester
            ],['idKHS']);
        }
        return back()->with('sukses', 'Nilai berhasil difinalisasi');
    }

    public function cetakKhs($id)
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();

        $getKhs = KhsModel::where('idKelasKuliah', $id)->first();
        $cetak = KhsModel::where('idKelasKuliah', $id)->get();
        $pdf = Pdf::loadView('package_dosen.cetakKhs', compact('getKhs', 'cetak', 'dosen', 'no')) ;
        return $pdf->setPaper('a4', 'potrait')->stream();
    }
}
