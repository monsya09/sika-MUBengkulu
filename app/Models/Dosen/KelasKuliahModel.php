<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KelasKuliahModel extends Model
{
    use HasFactory;
    protected $table = "kelaskuliah";

    public function krs()
    {
        return $this->hasMany(krsModel::class, 'idKelasKuliah');
    }

    public function Dosen()
    {
        return $this->belongsTo(DosenModel::class, 'nidn', 'nidn');
    }

    public function kelasMhs()
    {
        return $this->belongsTo(kelasMhsModel::class, 'idKelasmhs', 'idKelasmhs');
    }

    public function lingkupKuliah()
    {
        return $this->belongsTo(lingkupKuliahModel::class, 'idLingkupKuliah', 'idLingkupKuliah');
    }

    public function mataKuliah()
    {
        return $this->belongsTo(mataKuliahModel::class, 'idMataKuliah', 'idMataKuliah');
    }

    public function modeKuliah()
    {
        return $this->belongsTo(modeKuliahModel::class, 'idModeKuliah', 'idModeKuliah');
    }

    public function programStudi()
    {
        return $this->belongsTo(prodiModel::class, 'idProgramStudi', 'idProgramStudi');
    }

    public function ruanganKelas()
    {
        return $this->belongsTo(ruanganKelasModel::class, 'idRuaganKelas', 'idRuaganKelas');
    }

    public function tahunAkademik()
    {
        return $this->belongsTo(tahunAkademikModel::class, 'idTahunAkademik', 'idTahunAkademik');
    }

    public function jurnalPerkuliahan()
    {
        return $this->hasMany(jurnalPerkuliahanModel::class, 'idKelasKuliah');
    }

}
