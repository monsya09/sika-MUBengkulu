<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ruangKelasModel extends Model
{
    use HasFactory;
    protected $table = "ruangankelas";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idRuanganKelas');
    }
}
