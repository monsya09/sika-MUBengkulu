<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class presensiDosenModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idPresensiDosen';
    protected $casts = ['idPresensiDosen' => 'string'];
    protected $table = "presensidosen";
    protected $guarded = [];

    public function jurnalPerkuliahan()
    {
        return $this->belongsTo(jurnalPerkuliahanModel::class, 'idJurnal', 'idJurnal');
    }
}
