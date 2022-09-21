<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class presensiModel extends Model
{
    use HasFactory;
    protected $table = "presensimhs";
    protected $guarded = [];

    public function krs()
    {
        return $this->belongsTo(krsModel::class, 'idKRS', 'idKRS');
    }

    public function jurnalPerkuliahan()
    {
        return $this->belongsTo(jurnalPerkuliahanModel::class, 'idJurnal', 'idJurnal');
    }

    public function mahasiswa()
    {
        return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    }
}
