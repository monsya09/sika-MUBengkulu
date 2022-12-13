<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\infoModel;
use Illuminate\Http\Request;

class infoController extends Controller
{
    public function index()
    {
        $info = infoModel::where('tujuan', 'Dosen')
        ->orWhere('tujuan', 'All')->get();
        return view('package_dosen.info', compact('info'));
    }
}
