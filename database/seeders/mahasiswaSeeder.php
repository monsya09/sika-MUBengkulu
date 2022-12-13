<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class mahasiswaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $faker = Faker::create('id_ID');
 
    	for($i = 501; $i <= 700; $i++){
              DB::table("mahasiswa")->insert([
                "npm" => $i,
                "nama_mhs" => $faker->name(),
                "jenis_kelamin" => $faker->randomElement(["Laki-laki", "Perempuan"]),
                "tangal_lahir" => "1992-11-09",
                "tempat_lahir" => "0",
                "idAgama" => "1",
                "idKewarganegaraan" => "62",
                "nik" => "0",
                "nisn" => "0",
                "npwp" => "0",
                "jalan" => $faker->address,
                "telephone" => $faker->phoneNumber,
                "handphone" => $faker->phoneNumber,
                "dusun" => "0",
                "rt" => "0",
                "rw" => "0",
                "kelurahan" => "0",
                "kecamatan" => "0",
                "idJenisTinggal" => "1",
                "email" => $faker->safeEmail,
                "idAlatTransportasi" => "1",
                "idOrangTuaWali" => "1",
                "kebutuhanKhusus" => "Tidak",
                "idProgramMhs" => "1",
                "idProgramStudi" => "74201",
                "fotoMhs" => "-",
                "angkatan" => "2021",
            ]);
 
    	}
    }
}
