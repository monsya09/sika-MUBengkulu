<?php

namespace App\Http\Controllers;

use App\Models\mahasiswa;
use App\Models\masterbiaya;
use App\Models\namabiaya;
use App\Models\pembayaran;
use App\Models\programstudi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BillController extends Controller
{
    public function show()
    {
        $studies = programstudi::orderBy('programStudi', 'asc')->get();
        $costs = [];
        $students = [];
        $fees = [];
        if(request('study')) {
            $costs = namabiaya::where('idProgramStudi', request('study'))->where('idTahunAkademik', '=', request('academic'))->get();
            if(request('cost')) {
                $students = mahasiswa::where('idProgramStudi', request('study'))->where('angkatan', 'like', '%'.request('year').'%')->get();
                $fees = masterbiaya::where('idNamaBiaya', request('cost'))->get();
            }
        }
        $message = null;
        $message = DB::connection('baku')->select('select * from pengumuman');
        if(session('message'))
            $message = session('message');
        return view('bill')
        ->with('message', $message)
        ->with('academic', request('academic'))
        ->with('study', request('study'))
        ->with('year', request('year'))
        ->with('cost', request('cost'))
        ->with('studies', $studies)
        ->with('costs', $costs)
        ->with('students', $students)
        ->with('fees', $fees);
    }

    public function insert()
    {
        switch (request('table')) {
            case 'masterBiaya':
                $newData = masterbiaya::firstOrCreate(
                    ['idNamaBiaya' => request('idNamaBiaya'), 'sesiBiaya' => request('sesiBiaya')],
                    ['Biaya' => request('Biaya'), 'tglMulaiPembiayaan' => request('tglMulaiPembiayaan'), 'tglSelesaiPembiayaan' => request('tglSelesaiPembiayaan')]
                );
                $newData->save();
            break;
            case 'pembayaran':
                $cost = namabiaya::find(request('idNamaBiaya'));
                $newData = new pembayaran();
                $newData->npm = request('npm');
                $newData->idMasterBiaya = request('idMasterBiaya');
                $newData->totalNominal = $cost->jmlTotalBiaya;
                $newData->kodeBank = 0;
                $newData->kodeChannel = 0;
                $newData->kodeTerminal = 0;
                $newData->nomorPembayaran = 0;
                $newData->tanggalTransaksi = null;
                $newData->nomorJurnalPembukuan = 0;
                $newData->save();
            break;
            case 'test':
                $cost = DB::insert('insert into pembayaran(npm, idMasterBiaya, totalNominal, kodeBank, kodeChannel, kodeTerminal, nomorPembayaran, tanggalTransaksi, nomorJurnalPembukuan) values(58, 34, 1500000, 0, 0, 0, 0, null, 0);');
            break;
        }
        return redirect()->back()->with('message', 'insert success...');
    }
}