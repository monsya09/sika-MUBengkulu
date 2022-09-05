<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class lingkupKuliahModel extends Model
{
    use HasFactory;
    protected $table = "lingkupkuliah";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idLingkupKuliah');
    }
}
