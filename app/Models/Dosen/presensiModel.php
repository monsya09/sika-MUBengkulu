<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class presensiModel extends Model
{
    use HasFactory;
    protected $table = "presensimhs";

    public function krs()
    {
        return $this->belongsTo(krsModel::class, 'idKRS', 'idKRS');
    }
}
