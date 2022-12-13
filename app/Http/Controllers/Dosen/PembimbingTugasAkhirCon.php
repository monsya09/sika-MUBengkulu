<?php

namespace App\Http\Controllers\Dosen;
use App\Http\Controllers\Controller;
use App\Models\Dosen\DosenModel;
use App\Models\Dosen\MahasiswaModel;
use Illuminate\Support\Facades\DB;
use App\Models\Dosen\PembimbingTugasAkhir;
use App\Models\Dosen\tahunAkademikModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PembimbingTugasAkhirCon extends Controller
{
    //
    public function index()
    {
        try {
            $no = 1;
            $auth = Auth::user()->email; //indentifikasi user
            $dosen = DosenModel::where('email', $auth)->first();
            $ta = tahunAkademikModel::where('status', ('aktif'))->first();
            $pt = PembimbingTugasAkhir::where('nidn', $dosen->nidn)->get();
            $pt2 = [];
            foreach ($pt as $key) {
                $hasil = PembimbingTugasAkhir::where('npm', $key->npm)
                ->where('nidn', '!=', $key->nidn)->get();
                foreach ($hasil as $value) {
                    array_push($pt2, $value);
                }
            }
            return view('package_dosen.pembimbingTA', compact('dosen', 'pt', 'no', 'pt2'));
        } catch (\Throwable $th) {
            return view('package_dosen.pembimbingTA', compact('dosen'));
        }
    }
}
