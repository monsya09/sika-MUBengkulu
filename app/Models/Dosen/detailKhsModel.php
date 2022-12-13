<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detailKhsModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idDetailKHS';
    protected $casts = ['idDetailKHS' => 'string'];
    protected $table = "detailkhs";
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