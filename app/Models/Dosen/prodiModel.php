<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class prodiModel extends Model
{
    use HasFactory;
    protected $table = "programstudi";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idProgramStudi');
    }

    public function Mahasiswa()
    {
        return $this->hasMany(prodiModel::class, 'idProgramStudi');
    }

    public function krs()
    {
        return $this->hasManyThrough(krsModel::class, MahasiswaModel::class,
        'idProgramStudi', // Foreign key on the "mahasiswa" table...
        'npm', // Foreign key on the "krs" table...
        'idProgramStudi', // Local key on the "prodi" table...
        'npm' // Local key on the "npm" table...        
    );
    }
}
