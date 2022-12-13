<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FakultasModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idFakultas';
    protected $casts = ['idFakultas' => 'string'];
    protected $table = "fakultas";

    public function programstudi()
    {
        return $this->hasMany(prodiModel::class, 'idFakultas');
    }
}
