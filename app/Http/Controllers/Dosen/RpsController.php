<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use App\Models\Dosen\RpsModel;
use Illuminate\Http\Request;

class RpsController extends Controller
{
    //
    public function download()
    {
        $rps = RpsModel::all();
        return view('package_dosen.downloadRps');
    }
}
