<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class jurnalPerkuliahanModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idJurnal';
    protected $casts = ['idJurnal' => 'string'];
    protected $table = "jurnalperkuliahan";
    protected $guarded = [];

    public function KelasKuliah()
    {
        return $this->belongsTo(KelasKuliahModel::class, 'idKelasKuliah', 'idKelasKuliah');
    }

    public function presensimhs()
    {
        return $this->hasMany(presensiModel::class, 'idJurnal');
    }

    public function krs()
    {
        return $this->belongsToMany(krsModel::class, 'presensimhs', 'idKRS', 'idJurnal');
    }

    public function presensiDosen()
    {
        return $this->hasMany(presensiDosenModel::class, 'idJurnal');
    }
}
