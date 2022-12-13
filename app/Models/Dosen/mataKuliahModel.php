<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mataKuliahModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idMataKuliah';
    protected $casts = ['idMataKuliah' => 'string'];
    protected $table = "matakuliah";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idMataKuliah');
    }

    public function jurnalPerkuliahan()
    {
        return $this->hasManyThrough(jurnalPerkuliahanModel::class, KelasKuliahModel::class,
        'idMataKuliah', // Foreign key on the "kelaskuliah" table...
        'idKelasKuliah', // Foreign key on the "jurnalPerkuliahan" table...
        'idMataKuliah', // Local key on the "dosen" table...
        'idKelasKuliah' // Local key on the "kelaskuliah" table...     
    );
    }

    public function krs()
    {
        return $this->hasMany(krsModel::class, 'idMataKuliah');
    }

    public function bimbingankrs()
    {
        return $this->hasManyThrough(BimbinganKrsModel::class, krsModel::class,
        'idMataKuliah', // Foreign key on the "krs" table...
        'idKRS', // Foreign key on the "bimbingan" table...
        'idMataKuliah', // Local key on the "matakuliah" table...
        'idKRS' // Local key on the "KRS" table...     
    );
    }

    public function kurikulum()
    {
        return $this->belongsTo(kurikulumModel::class, 'idKurikulum', 'idKurikulum');
    }

    public function rps()
    {
        return $this->hasOne(RpsModel::class, 'idMataKuliah');
    }
    
}
