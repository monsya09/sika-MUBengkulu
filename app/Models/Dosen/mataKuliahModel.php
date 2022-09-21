<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mataKuliahModel extends Model
{
    use HasFactory;
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
    
}
