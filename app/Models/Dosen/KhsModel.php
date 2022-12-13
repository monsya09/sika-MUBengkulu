<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KhsModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idKHS';
    protected $table = "khs";
    protected $casts = ['idKHS' => 'string'];
    protected $guarded = [];

    public function kelasKuliah()
    {
        return $this->belongsTo(KelasKuliahModel::class, 'idKelasKuliah', 'idKelasKuliah');
    }

    public function krs()
    {
        return $this->belongsTo(krsModel::class, 'idKRS', 'idKRS');
    }
}
