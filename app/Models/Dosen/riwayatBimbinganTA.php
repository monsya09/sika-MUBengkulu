<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class riwayatBimbinganTA extends Model
{
    use HasFactory;
    protected $primaryKey = 'idRiwayatTA';
    protected $casts = ['idRiwayatTA' => 'string'];
    protected $table = "riwayatbimbinganta";

    public function TugasAkhir()
    {
        return $this->belongsTo(TugasAkhirModel::class, 'idRiwayatTA', 'idRiwayatTA');
    }
}
