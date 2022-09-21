<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class jurnalPerkuliahanModel extends Model
{
    use HasFactory;
    protected $table = "jurnalperkuliahan";
    protected $guarded = [];

    public function KelasKuliah()
    {
        return $this->belongsTo(KelasKuliahModel::class, 'idKelasKuliah', 'idKelasKuliah');
    }

    public function presensiMhs()
    {
        return $this->hasMany(presensiModel::class, 'idJurnal');
    }
}
