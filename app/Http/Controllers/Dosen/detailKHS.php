<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\detailKhsModel;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jadwalAkademikModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\KhsModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\presensiModel;
use App\Models\Dosen\tahunAkademikModel;
use Barryvdh\DomPDF\Facade\Pdf;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class detailKHS extends Controller
{
    public function index($id)
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $krs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->get();
        $presensi = presensiModel::where('idKelasKuliah', $id)
        ->where('kehadiran', 1)
        ->select(DB::raw('sum(kehadiran) as hadir, idKelasKuliah, idKRS'))
        ->groupby('idKelasKuliah', 'idKRS')
        ->get();

        $Pertemuan = presensiModel::where('idKelasKuliah', $id)
        ->where('kehadiran', '!=', Null)
        ->select('idJurnal')
        ->groupBy('idJurnal')
        ->get();
        $jumlahPertemuan = $Pertemuan->count();
        $ta= jadwalAkademikModel::where('idTahunAkademik',$jadwal->idTahunAkademik)->first();
        $tanggalSekarang = $today = date("Y-m-d");
        $awalPenilaian =  $ta->tglPenilaianMulai;
        $akhirPenilaian = $ta->tglPenilaianSelesai;
        $akhir = $akhirPenilaian;

        $datetime1 = new DateTime($akhirPenilaian);
        $datetime2 = new DateTime($tanggalSekarang);
        $interval = $datetime1->diff($datetime2);
        $deadLine = $interval->format('%a');//selisih tanggal

        if($tanggalSekarang < $awalPenilaian)
        {
            $data = 'belum';
        }elseif($tanggalSekarang >=$akhirPenilaian) {
            $data = 'selesai';
        }else{
            $data = 'isi';
        }

        if ($data == 'selesai') {
            $getDetailKhs = detailKhsModel::where('idKelasKuliah', $jadwal->idKelasKuliah)->get();
            if ($getDetailKhs == '[]') {
                for ($i=0; $i < $krs->count() ; $i++) { 
                    detailKhsModel::upsert([
                        'idDetailKHS' => $jadwal->idKelasKuliah.'-'.$krs[$i]->idKRS,
                        'idKRS' => $krs[$i]->idKRS,
                        'idKelasKuliah' => $jadwal->idKelasKuliah,
                        'bobotUAS' => 100,
                        'nilaiAkhir' => 0,
                        'semester' => $jadwal->matakuliah->semester,
                        'statusPenilaian' => 'final'
                    ],['idDetailKHS']);

                    KhsModel::upsert([
                        'idKHS' => $jadwal->idKelasKuliah.'-'.$krs[$i]->idKRS,
                        'idKRS' => $krs[$i]->idKRS,
                        'idKelasKuliah' => $jadwal->idKelasKuliah,
                        'nilaiAkhir' => 0,
                        'gradeNilai' => 'E',
                        'semester' => $jadwal->matakuliah->semester,
                    ],['idKHS']);
                }
                
            }else{

                foreach ($getDetailKhs as $get) {
                    if ($get->nilaiAkhir > 80) {
                        $gradeNilai = 'A';
                    }elseif ($get->nilaiAkhir > 75) {
                        $gradeNilai = 'B';
                    }elseif ($get->nilaiAkhir > 65) {
                        $gradeNilai = 'C';
                    }elseif ($get->nilaiAkhir > 50) {
                        $gradeNilai = 'D';
                    }else{
                        $gradeNilai = 'E';
                    }
                    // detailKhsModel::upsert([
                    //     'idDetailKHS' => $get->idDetailKHS,
                    //     'idKRS' => $get->idKRS,
                    //     'idKelasKuliah' => $get->idKelasKuliah,
                    //     'nilaiTugas' => $get->nilaiTugas,
                    //     'nilaiUTS' => $get->nilaiUTS,
                    //     'nilaiUAS' => $get->nilaiUAS,
                    //     'bobotTugas' => $get->bobotTugas,
                    //     'bobotUTS' => $get->bobotUTS,
                    //     'bobotUAS' => $get->bobotUAS,
                    //     'nilaiAkhir' => $get->nilaiAkhir,
                    //     // 'gradeNilai' => $gradeNilai,
                    //     'semester' => $get->semester,
                    //     'statusPenilaian' => 'final'
                    //     ],['idDetailKHS']);
                    // }

                    KhsModel::upsert([
                        'idKHS' => $jadwal->idKelasKuliah.'-'.$get->idKRS,
                        'idKRS' => $get->idKRS,
                        'idKelasKuliah' => $jadwal->idKelasKuliah,
                        'nilaiAkhir' => $get->nilaiAkhir,
                        'gradeNilai' => $gradeNilai,
                        'semester' => $jadwal->matakuliah->semester,
                    ],['idKHS']);
                }
            }
        }
        $Mhs = detailKhsModel::where('idKelasKuliah', $jadwal->idKelasKuliah)->get();
        $bobot = detailKhsModel::where('idKelasKuliah', $jadwal->idKelasKuliah)->first();
        return view('package_dosen.detailKhs', compact('Mhs', 'no', 'jadwal', 'bobot', 'presensi', 'jumlahPertemuan', 'akhir', 'data', 'deadLine'));
    }


    public function bobotPresentase(Request $request)
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jad = KelasKuliahModel::where('idKelasKuliah', $request->jadwal)->first();
        $krs = krsModel::where('idMataKuliah', $jad->idMataKuliah)
        ->where('idMasterKelas', $jad->idMasterKelas)
        ->where('idTahunAkademik', $jad->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->get();
        if ($request->tugas + $request->uts + $request->uas > 100) {
            return back()->with('error', 'Error!!! Bobot lebih dari 100%');
        }elseif ($request->tugas + $request->uts + $request->uas < 100) {
            return back()->with('error', 'Error!!! Bobot kurang dari 100%');
        }else {

        if ($request->tugas == 0) {
            $request->tugas = Null;
        }
        if ($request->uts == 0) {
            $request->uts = Null;
        }
        if ($request->uas == 0) {
            $request->uas = Null;
        }
        for ($i=0; $i < $krs->count(); $i++) { 
            detailKhsModel::upsert([
                'idDetailKHS' => $request->jadwal.'-'.$krs[$i]->idKRS,
                'idKRS' => $krs[$i]->idKRS,
                'idKelasKuliah' => $jad->idKelasKuliah,
                'bobotTugas' => $request->tugas,
                'bobotUTS' => $request->uts,
                'bobotUAS' => $request->uas,
                'semester' => $jad->matakuliah->semester
            ],['idDetailKHS']);
        }
        return back()->with('sukses', 'Bobot berhasil disimpan');
        }
    }

    public function simpanDetailKhs(Request $request)
    {
        $bobot = detailKhsModel::where('idKelasKuliah', $request->idKelasKuliah)->first();
        // return $bobot->bobotTugas;
        for ($i=0; $i < $request->row; $i++) {
            detailKhsModel::where('idKRS', request('idKRS'.$i))
            ->update([
                'nilaiTugas' => request('nilaiTugas'.$i),
                'nilaiUTS' => request('nilaiUTS'.$i),
                'nilaiUAS' => request('nilaiUAS'.$i),
                'nilaiAkhir' => $bobot->bobotTugas*request('nilaiTugas'.$i)/100 + $bobot->bobotUTS*request('nilaiUTS'.$i)/100 + $bobot->bobotUAS*request('nilaiUAS'.$i)/100
            ]);
        }
        if ($bobot->bobotTugas == '') {
            for ($i=0; $i < $request->row ; $i++) { 
                detailKhsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'nilaiTugas' => Null
                ]);
            }
        }
        if ($bobot->bobotUTS == '') {
            for ($i=0; $i < $request->row ; $i++) { 
                detailKhsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'nilaiUTS' => Null
                ]);
            }
        }
        if ($bobot->bobotUAS == '') {
            for ($i=0; $i < $request->row ; $i++) { 
                detailKhsModel::where('idKRS', request('idKRS'.$i))
                ->update([
                    'nilaiUAS' => Null
                ]);
            }
        }
        return back()->with('sukses', 'Nilai berhasil disimpan');
    }

    public function cetakDetail($id)
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();

        $getDetail = detailKhsModel::where('idKelasKuliah', $id)->first();
        $getDetailKhs = detailKhsModel::where('idKelasKuliah', $id)
        ->get();
        $pdf = Pdf::loadView('package_dosen.cetakDetailKhs', compact('getDetail', 'getDetailKhs', 'dosen', 'no')) ;
        return $pdf->setPaper('a4', 'potrait')->stream();
    }
}
