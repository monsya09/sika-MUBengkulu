<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class masterModel extends Model
{
    use HasFactory;
    protected $table = "masterkelas";
    
    public function kelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idMasterKelas');
    }

    public function krs()
    {
        return $this->hasMany(krsModel::class, 'idMasterKelas');
    }
}
