<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class jadwalAkademikModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idJadwalAkademik';
    protected $casts = ['idJadwalAkademik' => 'string'];
    protected $table = "jadwalakademik";
    protected $guarded = [];

    public function tahunakademik()
    {
        return $this->belongsTo(tahunAkademikModel::class, 'idTahunAkademik', 'idTahunAkademik');
    }
}
