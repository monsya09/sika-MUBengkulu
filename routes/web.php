<?php

use App\Http\Controllers\Dosen\JurnalController;
use App\Http\Controllers\Dosen\KelasKuliahController;
use App\Http\Controllers\Dosen\PresensiController;
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
    Route::get('/dashboard', function () {
        return view('package_dosen.dashboard');
    })->name('dashboard');

    Route::get('/jadwal', [KelasKuliahController::class, 'index']);
    Route::post('/jadwal/filter', [KelasKuliahController::class, 'filter']);
    Route::get('/jadwal/all', [KelasKuliahController::class, 'all']);
    Route::get('/jurnal/{id}', [JurnalController::class, 'index'])->name('jurnal');
    Route::post('/jurnal/store', [JurnalController::class, 'store']);
    Route::get('/jurnal/update/{id}', [JurnalController::class, 'update']);
    Route::get('/jurnal/hapus/{id}', [JurnalController::class, 'hapus']);
    Route::get('/jurnal/presensi/{id}', [PresensiController::class, 'index']);
    Route::post('/jurnal/presensi/store', [PresensiController::class, 'store']);
    
});
require __DIR__.'/auth.php';
