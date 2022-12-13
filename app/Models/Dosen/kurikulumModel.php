<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class kurikulumModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idKurikulum';
    protected $casts = ['idKurikulum' => 'string'];
    protected $table = "kurikulum";

    public function mataKuliah()
    {
        return $this->hasMany(mataKuliahModel::class, 'idKurikulum');
    }

    public function programStudi()
    {
        return $this->belongsTo(prodiModel::class, 'idProgramStudi', 'idProgramStudi');
    }
}
