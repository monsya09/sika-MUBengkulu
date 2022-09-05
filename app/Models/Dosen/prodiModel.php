<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class prodiModel extends Model
{
    use HasFactory;
    protected $table = "programstudi";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idProgramStudi');
    }
}