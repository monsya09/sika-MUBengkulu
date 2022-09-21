<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tahunAkademikModel extends Model
{
    use HasFactory;
    protected $table = "tahunakademik";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idTahunAkademik');
    }

    public function krs()
    {
        return $this->hasMany(krsModel::class, 'idTahunAkademik');
    }
}
