<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use PhpParser\Node\Stmt\Return_;

class MahasiswaModel extends Model
{
    use HasFactory;
    protected $table = "mahasiswa";

    public function krs()
    {
        return $this->hasMany(krsModel::class, 'npm');
    }
}