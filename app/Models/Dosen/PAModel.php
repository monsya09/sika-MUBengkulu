<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PAModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idPembimbingAkademik';
    protected $casts = ['idPembimbingAkademik' => 'string'];
    protected $table = "pembimbingakademik";

    public function Mahasiswa()
    {
        return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    }

    public function Dosen()
    {
        return $this->belongsTo(DosenModel::class, 'nidn', 'nidn');
    }

    public function bimbingankrs()
    {
        return $this->hasMany(BimbinganKrsModel::class, 'idPembimbingAkademik');
    }
}
