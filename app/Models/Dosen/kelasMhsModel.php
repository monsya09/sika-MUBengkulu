<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class kelasMhsModel extends Model
{
    use HasFactory;
    protected $table = "kelasmhs";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idKelasmhs');
    }
}
