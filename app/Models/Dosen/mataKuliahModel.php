<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mataKuliahModel extends Model
{
    use HasFactory;
    protected $table = "matakuliah";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idMataKuliah');
    }
    
}
