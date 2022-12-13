<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class modeKuliahModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idModelKuliah';
    protected $casts = ['idModeKuliah' => 'string'];
    protected $table ="modekuliah";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'idModeKuliah');
    }
}
