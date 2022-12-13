<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ruanganKelasModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idRuangKelas';
    protected $casts = ['idProgramStudi' => 'string'];
    protected $table = "ruangankelas";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idRuaganKelas');
    }
}
