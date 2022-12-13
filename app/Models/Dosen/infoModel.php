<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class infoModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'idPengumuman';
    protected $casts = ['idPengumuman' => 'string'];
    protected $table = "pengumuman";
    protected $guarded = [];
}
