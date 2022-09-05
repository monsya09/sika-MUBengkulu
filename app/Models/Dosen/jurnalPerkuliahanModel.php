<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class jurnalPerkuliahanModel extends Model
{
    use HasFactory;
    protected $table = "jurnalperkuliahan";

    public function KelasKuliah()
    {
        return $this->belongsTo(KelasKuliahModel::class, 'idKelasKuliah');
    }
}
