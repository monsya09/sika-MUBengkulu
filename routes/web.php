<?php
use App\Http\Controllers\JadwalController;
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

    Route::get('/jadwal', [JadwalController::class, 'index']);
    Route::get('/jurnal-{id}', [JadwalController::class, 'jurnal'])->name('jurnal');
    Route::get('/presensi', [JadwalController::class, 'presensi']);
});
require __DIR__.'/auth.php';
