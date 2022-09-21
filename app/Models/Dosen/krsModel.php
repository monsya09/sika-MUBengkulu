<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class krsModel extends Model
{
    use HasFactory;
    protected $table = "krs";

    // public function Mahasiswa()
    // {
    //     return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    // }

    // public function KelasKuliah()
    // {
    //     return $this->belongsTo(KelasKuliahModel::class, 'idKelasKuliah', 'idkelasKuliah');
    // }

    public function Mahasiswa()
    {
        return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    }

    public function mataKuliah()
    {
        return $this->belongsTo(mataKuliahModel::class, 'idMataKuliah', 'idMataKuliah');
    }

    public function tahunAkademik()
    {
        return $this->belongsTo(tahunAkademikModel::class, 'idTahunAkademik', 'idTahunAkademik');
    }

    public function masterKelas()
    {
        return $this->belongsTo(masterModel::class, 'idMasterKelas', 'idMasterKelas');
    }
}
