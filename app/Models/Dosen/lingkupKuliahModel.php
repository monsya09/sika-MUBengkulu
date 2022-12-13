<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class lingkupKuliahModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idLingkupKuliah';
    protected $casts = ['idLingkupKuliah' => 'string'];
    protected $table = "lingkupkuliah";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idLingkupKuliah');
    }
}
