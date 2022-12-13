<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class PengumumanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $faker = Faker::create('en_US');
 
    	for($i = 100; $i <= 200; $i++){
              DB::table("pengumuman")->insert([
                "judul" => $faker->sentence,
                "isiPengumuman" => 'qui officia deserunt mollit anim id est laborum.',
                "tujuan" => $faker->randomElement(["Mahasiswa", "Dosen", "Karyawan", "All"]),
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
 
    	}
    }
}
