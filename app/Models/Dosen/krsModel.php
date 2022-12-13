<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class krsModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idKRS';
    protected $casts = ['idKRS' => 'string'];
    protected $table = "krs";
    protected $guarded = [];

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

    public function bimbingankrs()
    {
        return $this->hasOne(BimbinganKrsModel::class, 'idKRS');
    }

    public function presensimhs()
    {
        return $this->hasMany(presensiModel::class, 'idKRS');
    }

    public function jurnalperkuliahan()
    {
        return $this->belongsToMany(jurnalPerkuliahanModel::class, 'presensimhs', 'idKRS', 'idJurnal')
        ->withPivot('kehadiran');
    }
    
    public function detailKhs()
    {
        return $this->hasMany(detailKhsModel::class, 'idKRS');
    }

    public function Khs()
    {
        return $this->hasMany(KhsModel::class, 'idKRS');
    }
    
}
