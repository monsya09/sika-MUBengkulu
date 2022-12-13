<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jurnalPerkuliahanModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\presensiDosenModel;
use App\Models\Dosen\presensiModel;
use App\Models\Dosen\tahunAkademikModel;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JurnalController extends Controller
{
    public function index($id)
    {
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $jumlahMhs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->count();

        $presensiDosen = presensiDosenModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', 'presensidosen.idJurnal')
        ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idkelasKuliah')
        ->where('kelaskuliah.idKelasKuliah', $jadwal->idKelasKuliah)->get();
        $progres = $presensiDosen->count();

        $jurnal = jurnalPerkuliahanModel::where('idKelasKuliah', $id)->get();
        $jur = jurnalPerkuliahanModel::where('idKelasKuliah', $id)->first();
        $hadir = presensiModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', '=', 'presensimhs.idJurnal')
        ->join('kelaskuliah', 'jurnalperkuliahan.idKelasKuliah', '=', 'kelaskuliah.idkelasKuliah')
        ->select(DB::raw('count(kehadiran) as hadir, presensimhs.idJurnal'))
        ->groupby('presensimhs.idJurnal')
        ->where('jurnalperkuliahan.idKelasKuliah', $id)
        ->where('kehadiran', 1)
        ->get();
        return view('package_dosen.jurnalPerkuliahan', compact('jumlahMhs', 'jurnal', 'jadwal', 'hadir', 'progres','jur'));
    }

    public function store(Request $request)
    {     
        // $krs = krsModel::where('idKelasKuliah', $request->idKelasKuliah)->get();
        $krs = krsModel::where('idMataKuliah', $request->idmk)
        ->where('idMasterKelas', $request->idMasterKelas)
        ->where('idTahunAkademik', $request->idTA)
        ->where('statusKRS', 'Diterima')
        ->get();
        
        try { 
            jurnalPerkuliahanModel::create([
                'idJurnal' => $request->idTA.$request->idKelasKuliah."-".$request->pertemuan,
                'pertemuan' => $request->idTA.$request->idKelasKuliah."-".str_pad($request->pertemuan, 2, '0', STR_PAD_LEFT),
                'tanggal' => $request->tanggal,
                'jamMulai' => $request->jamMulai,
                'jamSelesai' => $request->jamSelesai,
                'idKelasKuliah' => $request->idKelasKuliah,
                'materi' => $request->materi
            ]);
          } catch(\Illuminate\Database\QueryException $ex){ 
            return back()->with('error', 'Dupilikat data!!!');
            // Note any method of class PDOException can be called on $ex.
          }

        for ($i=0; $i < $krs->count(); $i++) { 
            presensiModel::create([
                'idJenisPresensi' => 1,
                'idKelasKuliah' => $request->idKelasKuliah,
                'idJurnal' => $request->idTA.$request->idKelasKuliah."-".$request->pertemuan,
                'idKRS' => $krs[$i]->idKRS
            ]);
        }

        return back()->with('berhasilSimpan', 'data berhasil disimpan');
    }

    public function update($id, Request $request)     
    {
        try { 
            jurnalPerkuliahanModel::where('idJurnal', $id)
            ->update([
                'idJurnal' => $request->idTA.$request->idKelasKuliah."-".$request->pertemuan,
                'pertemuan' => $request->idTA.$request->idKelasKuliah."-".str_pad($request->pertemuan, 2, '0', STR_PAD_LEFT),
                'tanggal' => $request->tanggal,
                'jamMulai' => $request->jamMulai,
                'jamSelesai' => $request->jamSelesai,
                'idKelasKuliah' => $request->idKelasKuliah,
                'materi' => $request->materi
            ]);

            //mengupdate idjurnal pada table presensi
            presensiModel::where('idJurnal', $id)
            ->update([
                'idJurnal' => $request->idTA.$request->idKelasKuliah."-".$request->pertemuan,
            ]);

            return back()->with('edit', 'data berhasil diedit');
          } catch(\Illuminate\Database\QueryException $ex){ 
            return back()->with('error', 'Pertemuan tidak boleh sama!!!');
          }
    }

    public function hapus($id)     
    {
        presensiModel::where('idJurnal', $id)->delete();
        presensiDosenModel::where('idJurnal', $id)->delete();
        jurnalPerkuliahanModel::where('idJurnal', $id)->delete();
        return back()->with('hapus', 'data berhasil dihapus');
    }

    public function cetakJurnal($id)
    {
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jurnal = jurnalPerkuliahanModel::where('idKelasKuliah', $id)
        ->orderby('pertemuan')->get();
        $jurnal1 = jurnalPerkuliahanModel::where('idKelasKuliah', $id)
        ->orderby('pertemuan')->first();
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $jumlahMhs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->count();
        $hadir = presensiModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', '=', 'presensimhs.idJurnal')
        ->join('kelaskuliah', 'jurnalperkuliahan.idKelasKuliah', '=', 'kelaskuliah.idkelasKuliah')
        ->select(DB::raw('count(kehadiran) as hadir, presensimhs.idJurnal'))
        ->groupby('presensimhs.idJurnal')
        ->where('jurnalperkuliahan.idKelasKuliah', $jadwal->idKelasKuliah)
        ->where('kehadiran', 1)
        ->get();
        $pdf = Pdf::loadView('package_dosen.cetakJurnal', compact('jadwal','jurnal','dosen', 'hadir', 'jumlahMhs')) ;
        return $pdf->setPaper('a4', 'potrait')->stream();
    }
}
