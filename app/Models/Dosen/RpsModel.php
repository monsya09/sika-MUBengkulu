<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RpsModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idRPS';
    protected $casts = ['idRPS' => 'string'];
    protected $table = "rps";

    public function mataKuliah()
    {
        return $this->belongsTo(mataKuliahModel::class, 'idMataKuliah', 'idMataKuliah');
    }
}
