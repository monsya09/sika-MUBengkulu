<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class presensiModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idPresesnsiMhs';
    protected $casts = ['idPresesnsiMhs' => 'string'];
    protected $table = "presensimhs";
    protected $guarded = [];

    // public function mahasiswa()
    // {
    //     return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    // }

    public function krs()
    {
        return $this->belongsTo(krsModel::class, 'idKRS', 'idKRS');
    }

    public function jurnalPerkuliahan()
    {
        return $this->belongsTo(presensiModel::class, 'idJurnal', 'idJurnal');
    }
}
