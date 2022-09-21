<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jurnalPerkuliahanModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\presensiModel;
use App\Models\Dosen\tahunAkademikModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JurnalController extends Controller
{
    public function index($id)
    {
        // $jurnal = jurnalPerkuliahanModel::where('idKelasKuliah', $id)->whereHas('kelaskuliah', function($q){
        //     $q->where('nidn', (DosenModel::where('email', (Auth::user()->email))->first()->nidn));

        // })->get(); contoh pemanggilan hasManyTrough
        // $jumlahMhs = krsModel::where('idKelasKuliah', $id)->count();
        // $krs = krsModel::where('idKelasKuliah', $id)->first();
        $no = 1;
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $jumlahMhs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->count();

        $krs = krsModel::where('idMataKuliah', $jadwal->idMataKuliah)
        ->where('idMasterKelas', $jadwal->idMasterKelas)
        ->where('idTahunAkademik', $jadwal->idTahunAkademik)
        ->first();
        $jurnal = jurnalPerkuliahanModel::where('idKelasKuliah', $id)->get();
        return view('package_dosen.jurnalPerkuliahan', compact('jumlahMhs', 'krs', 'jurnal', 'jadwal'));
    }

    public function store(Request $request)
    {     
        // $krs = krsModel::where('idKelasKuliah', $request->idKelasKuliah)->get();
        $krs = krsModel::where('idMataKuliah', $request->idmk)
        ->where('idMasterKelas', $request->idMasterKelas)
        ->where('idTahunAkademik', $request->idTA)
        ->get();
        
        try { 
            jurnalPerkuliahanModel::create([
                'idJurnal' => $request->idKelasKuliah."-".$request->pertemuan,
                'pertemuan' => $request->idKelasKuliah."-".str_pad($request->pertemuan, 2, '0', STR_PAD_LEFT),
                'tanggal' => $request->tanggal,
                'jamMulai' => $request->jamMulai,
                'jamSelesai' => $request->jamSelesai,
                'idKelasKuliah' => $request->idKelasKuliah,
                'materi' => $request->materi,
                'capaianMateri' => $request->capaian
            ]);
          } catch(\Illuminate\Database\QueryException $ex){ 
            return back()->with('error', 'Dupilikat data!!!');
            // Note any method of class PDOException can be called on $ex.
          }

        for ($i=0; $i < $krs->count(); $i++) { 
            presensiModel::create([
                'idJenisPresensi' => 1,
                'idJurnal' => $request->idKelasKuliah."-".$request->pertemuan,
                'npm' => $krs[$i]->npm
            ]);
        }

        return back()->with('berhasilSimpan', 'data berhasil disimpan');
    }

    public function update($id, Request $request)     
    {
        try { 
            jurnalPerkuliahanModel::where('idJurnal', $id)
            ->update([
                'pertemuan' => $request->idKelasKuliah."-".str_pad($request->pertemuan, 2, '0', STR_PAD_LEFT),
                'tanggal' => $request->tanggal,
                'jamMulai' => $request->jamMulai,
                'jamSelesai' => $request->jamSelesai,
                'idKelasKuliah' => $request->idKelasKuliah,
                'materi' => $request->materi,
                'capaianMateri' => $request->capaian
            ]);
            return back()->with('edit', 'data berhasil diedit');
          } catch(\Illuminate\Database\QueryException $ex){ 
            return back()->with('error', 'Pertemuan tidak boleh sama!!!');
            // Note any method of class PDOException can be called on $ex.
          }
        // jurnalPerkuliahanModel::where('idJurnal', $id)
        // ->update([
        //     'pertemuan' => $request->pertemuan,
        //     'tanggal' => $request->tanggal,
        //     'jamMulai' => $request->jamMulai,
        //     'jamSelesai' => $request->jamSelesai,
        //     'idKelasKuliah' => $request->idKelasKuliah,
        //     'materi' => $request->materi,
        //     'capaianMateri' => $request->capaian
        // ]);
        // return back()->with('edit', 'data berhasil diedit');
    }

    public function hapus($id)     
    {
        presensiModel::where('idJurnal', $id)->delete();
        jurnalPerkuliahanModel::where('idJurnal', $id)->delete();
        return back()->with('hapus', 'data berhasil dihapus');
    }
}
