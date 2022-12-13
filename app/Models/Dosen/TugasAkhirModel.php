<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasAkhirModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idTugasAkhir';
    protected $casts = ['idTugasAkhir' => 'string'];
    protected $table = "tugasakhir";

    public function pembimbingTa()
    {
        return $this->belongsTo(TugasAkhirModel::class, 'idPembimbingTA', 'idPembimbingTA');
    }

    public function riwayatBimbinganTa()
    {
        return $this->hasMany(riwayatBimbinganTA::class, 'idRiwayatTA');
    }
}
