<?php

use App\Http\Controllers\Dosen\BimbinganCotroller;
use App\Http\Controllers\Dosen\dashController;
use App\Http\Controllers\Dosen\detailKHS;
use App\Http\Controllers\Dosen\DosenController;
use App\Http\Controllers\Dosen\infoController;
use App\Http\Controllers\Dosen\JurnalController;
use App\Http\Controllers\Dosen\KelasKuliahController;
use App\Http\Controllers\Dosen\KHS;
use App\Http\Controllers\Dosen\PembimbingTugasAkhirCon;
use App\Http\Controllers\Dosen\PresensiController;
use App\Http\Controllers\Dosen\riwayatBimTaController;
use App\Http\Controllers\Dosen\RpsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['middleware' => 'auth'], function(){
    Route::get('/dashboard',[dashController::class, 'index'])->name('dashboard');
    Route::get('/info',[infoController::class, 'index']);
    Route::get('/profil', [DosenController::class, 'profil']);
    
    // Route::post('/bill_', [BillController::class, 'insert'])->middleware(['auth'])->name('bill_');

    Route::get('/jadwal/now', [KelasKuliahController::class, 'index']);
    Route::post('/jadwal/filter', [KelasKuliahController::class, 'filter']);
    Route::get('/jadwal/all', [KelasKuliahController::class, 'all']);
    Route::get('/downloadRps', [RpsController::class, 'download']);

    Route::get('/jurnal/{id}', [JurnalController::class, 'index'])->name('jurnal');
    Route::post('/jurnal/store', [JurnalController::class, 'store']);
    Route::get('/jurnal/update/{id}', [JurnalController::class, 'update']);
    Route::get('/jurnal/hapus/{id}', [JurnalController::class, 'hapus']);
    Route::get('/cetakJurnal/{id}', [JurnalController::class, 'cetakJurnal']);
    Route::get('/jurnal/presensi/{id}', [PresensiController::class, 'index']);
    Route::get('/cetakPresensi/{id}', [PresensiController::class, 'cetakPresensi']);
    Route::post('/jurnal/presensi/store', [PresensiController::class, 'store']);
    Route::get('/jurnal/presensiDosen/{id}',[PresensiController::class, 'lihatPresensi']);
    Route::post('/presensiDosen_bukti',[PresensiController::class, 'presensiDosen_bukti']);

    Route::get('/bimbingan/now',[BimbinganCotroller::class, 'BimbinganKrstahunAktif'])->name('bimbingan');
    Route::get('/mahasiswaBimbingan', [BimbinganCotroller::class, 'dataMhsBimbinganAkademik']);
    Route::post('/bimbingan/filter',[BimbinganCotroller::class, 'filter'])->name('bimbingan.filter');
    Route::get('/bimbingan/all',[BimbinganCotroller::class, 'all'])->name('bimbingan.all');
    Route::get('/mahasiswaBimbingan/rincianKrs/{npm}',[BimbinganCotroller::class, 'rincianKrs']);
    Route::get('/bimbingankrs/{id}/{ta}',[BimbinganCotroller::class, 'perMahasiswa']);
    Route::post('/bimbingan/krsDitolak',[BimbinganCotroller::class, 'krsDitolak']);
    Route::post('/bimbingan/krsDiterima',[BimbinganCotroller::class, 'krsDiterima']);

    Route::get('/pembimbingTA', [PembimbingTugasAkhirCon::class, 'index']);
    Route::get('/riwayatBimbinganTA/{id}', [riwayatBimTaController::class, 'index']);
    Route::post('/catatanStore',[riwayatBimTaController::class, 'catatanStore']);

    Route::get('/detailKhs/{id}', [detailKHS::class, 'index']);
    Route::post('/detailKhs/bobot', [detailKHS::class, 'bobotPresentase']);
    Route::post('/simpanDetailKhs', [detailKHS::class, 'simpanDetailKhs']);
    Route::post('/prosesFinalisasiNilai',[KHS::class, 'prosesFinalisasi']);
    Route::get('/cetakDetailKhs/{id}', [detailKHS::class, 'cetakDetail']);
    Route::get('/cetakKhs/{id}', [KHS::class, 'cetakKhs']);
    
});
require __DIR__.'/auth.php';
