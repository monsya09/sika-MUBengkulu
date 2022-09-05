<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DosenModel extends Model
{
    use HasFactory;
    protected $table = "dosen";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'nidn');
    }

    public function krs()
    {
        return $this->hasManyThrough(krsModel::class, KelasKuliahModel::class,
        'nidn', // Foreign key on the "kelaskuliah" table...
        'idKelasKuliah', // Foreign key on the "krs" table...
        'nidn', // Local key on the "dosen" table...
        'idKelasKuliah' // Local key on the "kelaskuliah" table...        
    );
    }
}
