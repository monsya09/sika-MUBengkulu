<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BimbinganKrsModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idBimbinganKRS';
    protected $casts = ['idBimbinganKRS' => 'string'];
    protected $table = "bimbingankrs";

    public function krs()
    {
        return $this->belongsTo(krsModel::class, 'idKRS', 'idKRS');
    }

    public function pembimbingakademik()
    {
        return $this->belongsTo(PAModel::class, 'idPembimbingAkademik', 'idPembimbingAkademik');
    }
}
