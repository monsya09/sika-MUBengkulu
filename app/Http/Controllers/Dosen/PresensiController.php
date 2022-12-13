<?php

namespace App\Http\Controllers\Dosen;
use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\jurnalPerkuliahanModel;
use App\Models\Dosen\KelasKuliahModel;
use App\Models\Dosen\krsModel;
use App\Models\Dosen\presensiDosenModel;
use App\Models\Dosen\presensiModel;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class PresensiController extends Controller
{
    public function index($id)
    {
        # code...
        $no = 1;
        $semester = presensiModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal','=', 'presensimhs.idJurnal')
        ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idKelasKuliah')
        ->join('masterkelas', 'masterkelas.idMasterKelas', '=', 'kelaskuliah.idMasterKelas')
        ->join('matakuliah', 'matakuliah.idMataKuliah', '=', 'kelaskuliah.idMataKuliah')
        ->where('presensimhs.idJurnal', $id)
        ->first();
        $jurnal = jurnalPerkuliahanModel::where('idJurnal', $id)->first();
        $presensi = presensiModel::where('idJurnal', $id)->get();
        $bukti = presensiDosenModel::where('idJurnal', $id)
        ->first();
        return view('package_dosen.presensi', compact('jurnal','presensi', 'no', 'semester', 'bukti'));
    }

    public function store(Request $request)
    {
        // $ip = $request->ip();
        $ip = "114.5.163.226";
        $loc = \Location::get($ip);
        for ($i=0; $i < $request->row; $i++) { 
            presensiModel::where('idJurnal', $request->idJurnal)
            ->where('idKRS', request('krs'.$i))
            ->update([
                'kehadiran' => request('hadir'.$i),
                'keterangan' => request('keterangan'.$i)
            ]
            );
        }

        $getData = jurnalPerkuliahanModel::where('idJurnal', $request->idJurnal)->first();
        presensiDosenModel::upsert([
            'idPresensiDosen' => $getData->idJurnal.'-'.$getData->idKelasKuliah,
            'idJurnal' => $getData->idJurnal,
            'latitude' => $loc->latitude,
            'longitude' => $loc->longitude
        ], ['idPresensiDosen']);
        return back()->with('sukses', 'presensi berhasil disimpan');
    }

    public function lihatPresensi($id, Request $request)
    {
        $jadwal = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $presensiDosen = presensiDosenModel::join('jurnalperkuliahan', 'jurnalperkuliahan.idJurnal', 'presensidosen.idJurnal')
        ->join('kelaskuliah', 'kelaskuliah.idKelasKuliah', 'jurnalperkuliahan.idkelasKuliah')
        ->where('kelaskuliah.idKelasKuliah', $id)->get();
        return view('package_dosen.presensiDosen', compact('presensiDosen', 'jadwal'));
    }

    public function presensiDosen_bukti(Request $request)
    {

        // $validatedData = $request->validate([
        //     'file' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
    
        //    ]);
        // $image = $request->file('file');
        // $fileName = $request->file('file')->getClientOriginalName();
        // $request->file('file')->storeAs('public/bukti', $fileName);
        // $getData = jurnalPerkuliahanModel::where('idJurnal', $request->idJurnal)->first();
        // presensiDosenModel::where('idJurnal', $getData->idJurnal)->update([
        //     'imgPresensi' => $fileName
        // ]);
        // return back()->with('sukses', 'bukti telah ditambahkan');
        try {
            $this->validate($request, [
                'file' => 'required|image|mimes:jpg,jpeg,png',
            ]);
            $getData = jurnalPerkuliahanModel::where('idJurnal', $request->idJurnal)->first();
            $image = $request->file('file');
            // $input['imagename'] = time().'.'.$image->extension();
            $fileName = $getData->idJurnal.'.'.$image->extension();
            $filePath = storage_path('app\public\bukti');
            $img = Image::make($image->path());
            $img->resize(200, 200, function ($const) {
                $const->aspectRatio();
            })->save($filePath.'/'.$fileName);
            presensiDosenModel::where('idJurnal', $getData->idJurnal)->update(['imgPresensi' => $fileName]);
            return back()->with('sukses', 'bukti telah ditambahkan');  
        } catch (\Throwable $th) {
            return back()->with('error', 'Masukkan file dengan format jpg/jpeg/png');
        }



    }

    public function cetakPresensi($id)
    {
        $auth = Auth::user()->email; //indentifikasi user
        $dosen = DosenModel::where('email', $auth)->first();
        $jad = KelasKuliahModel::where('idKelasKuliah', $id)->first();
        $pres = krsModel::where('idMataKuliah', $jad->idMataKuliah)
        ->where('idMasterKelas', $jad->idMasterKelas)
        ->where('idTahunAkademik', $jad->idTahunAkademik)
        ->where('statusKRS', 'Diterima')
        ->get();
        $pertemuan = jurnalPerkuliahanModel::where('idKelasKuliah', $id)
        ->orderby('pertemuan')->get();
        $pdf = Pdf::loadView('package_dosen.cetakPresensi', compact('pres', 'pertemuan', 'dosen', 'jad')) ;
        return $pdf->setPaper('a4', 'potrait')->stream();
    }
}
