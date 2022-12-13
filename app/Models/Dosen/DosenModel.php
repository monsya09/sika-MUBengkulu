<?php

namespace App\Models\Dosen;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DosenModel extends Model
{
    use HasFactory;
    protected $primaryKey = 'nidn';
    protected $casts = ['nidn' => 'string'];
    protected $table = "dosen";

    public function KelasKuliah()
    {
        return $this->hasMany(KelasKuliahModel::class, 'nidn');
    }

    public function krs()
    {
        return $this->hasManyThrough(krsModel::class, KelasKuliahModel::class,
        'nidn', // Foreign key on the "kelaskuliah" table...
        'idKelasKuliah', // Foreign key on the "krs" table...
        'nidn', // Local key on the "dosen" table...
        'idKelasKuliah' // Local key on the "kelaskuliah" table...        
    );
    }

    public function jurnalPerkuliahan()
    {
        return $this->hasManyThrough(jurnalPerkuliahanModel::class, KelasKuliahModel::class,
        'nidn', // Foreign key on the "kelaskuliah" table...
        'idKelasKuliah', // Foreign key on the "jurnalPerkuliahan" table...
        'nidn', // Local key on the "dosen" table...
        'idKelasKuliah' // Local key on the "kelaskuliah" table...        
    );
    }

    public function pembimbingkrs()
    {
        return $this->hasMany(PAModel::class, 'nidn');
    }

    public function bimbingankrs()
    {
        return $this->hasManyThrough(BimbinganKrsModel::class, PAModel::class,
        'nidn', // Foreign key on the "Pembimbing akademik" table...
        'idPembimbingAkademik', // Foreign key on the "bimbingankrs" table...
        'nidn', // Local key on the "dosen" table...
        'idPembimbingAkademik' // Local key on the "pembimbingakademik" table...        
    );
    }

    public function programstudi()
    {
        return $this->belongsTo(prodiModel::class, 'idProgramStudi', 'idProgramStudi');
    }

    public function pembimbingTa()
    {
        return $this->hasMany(PembimbingTugasAkhir::class, 'nidn');
    }

    public function mahasiswa()
    {
        return $this->belongsToMany(MahasiswaModel::class, 'pembimbingta', 'npm', 'nidn');
    }

}
