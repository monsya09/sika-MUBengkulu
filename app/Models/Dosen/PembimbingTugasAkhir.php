<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PembimbingTugasAkhir extends Model
{
    use HasFactory;
    protected $primaryKey = 'idPembimbingTa';
    protected $casts = ['idPembimbingTa' => 'string'];
    protected $table = "pembimbingta";
    protected $guarded = [];

    public function mahasiswa()
    {
        return $this->belongsTo(MahasiswaModel::class, 'npm', 'npm');
    }

    public function dosen()
    {
        return $this->belongsTo(DosenModel::class, 'nidn', 'nidn');
    }

    public function TugasAkhir()
    {
        return $this->hasMany(TugasAkhirModel::class, 'idPembimbingTA');
    }
}
