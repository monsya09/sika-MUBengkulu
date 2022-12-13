</html>
 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Cetak Jurnal</title>     
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
<body>
    <div class="container-fluid ">
        <img src="dist/images/kop1.jpg" class="img-fluid" alt="Responsive image" width="100%">
    </div>
    <div class="container-fluid ">
        <div class="row">
            <div class="col-12 text-center"><strong>Jurnal Perkuliahan </strong></div>
        </div>
    </div> 
    
    <div class="container-fluid mb-2 mt-2">
        <div class="row">
            <table id="example" class="display pl-3" style="width:100%">
                <tbody>
                    <tr style="font-size: 10 ; line-height: 1em;" class="p-0">
                        <td>Matakuliah</td>
                        <td>: {{ $jadwal->matakuliah->namaMataKuliah }}</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        {{-- <td>Dosen Pengampu</td>
                        <td>: {{ $dosen->namaDosen }}</td> --}}
                    </tr>
                    <tr style="font-size: 10 ; line-height: 1em;" class="p-0">
                        <td>Program Studi</td>
                        <td>: {{ $jadwal->programstudi->programStudi }}</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        {{-- <td>Tahun Akademik</td>
                        <td>: 20221</td> --}}
                    </tr>
                    <tr style="font-size: 10 ; line-height: 1em;" class="p-0">
                        <td>T.A.</td>
                        <td>: {{ $jadwal->tahunAkademik->idTahunAkademik }}</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        {{-- <td></td> --}}
                    </tr>
                    <tr style="font-size: 10 ; line-height: 1em;" class="p-0">
                        <td>Semester/kelas</td>
                        <td>: {{ $jadwal->matakuliah->semester }}/{{ $jadwal->masterkelas->kelas }}</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        {{-- <td></td> --}}
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

<main class="container-fluid">
    <div class="row" style="margin-right:5 ;">
        <table class="table table-sm" style="margin-left:10 ; font-size: 10 ;">
            <thead>
                <tr>
                    <th>Pertemuan</th>
                    <th>Hari/Tangal</th>
                    <th>Jam</th>
                    <th>Materi</th>
                    <th>Jumlah Mhs</th>
                    <th>Hadir</th>
                    <th>Tidak Hadir</th>
                </tr>
            </thead>

            <tbody>
                @foreach ($jurnal as $j)
                <tr>
                    <td>{{ number_format(substr($j->pertemuan,-2)) }}</td>
                    <td>{{ $j->tanggal }}</td>
                    <td>{{ $j->jamMulai }}~{{ $j->jamSelesai }}</td>
                    <td>{{ $j->materi }}</td>
                    <td>{{ $jumlahMhs }}</td>
                    <td>@foreach($hadir as $item)
                            @if ($item->idJurnal == $j->idJurnal)
                                {{ $item->hadir }}
                            @endif
                        @endforeach
                    </td>
                    <td>@foreach ($hadir as $item)
                            @if ($item->idJurnal == $j->idJurnal)
                                {{ $jumlahMhs-($item->hadir) }}
                            @endif
                        @endforeach
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div class="container-fluid">
        <div class="row">
            <table id="example" class="display pl-3 pr-5" style="width:100%">
                <tbody>
                    <tr style="font-size: 10 ;">
                        <td class="w-1/2 text-left"><br>Mengetahui,<br>Ketua Prodi<br><br><br><br><u>Ketua Prodi</u><br>NIDN: 00000000</td>
                        <td class="w-1/2 text-right">Bengkulu, {{date('d-m-Y') }} <br> <br>Dosen Pengampu<br><br><br><br><u>{{ $dosen->namaDosen }}</u><br>NIDN: {{ $dosen->nidn }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>

<div class="container fixed-bottom">
    <div class="col text-center text-muted"><small>sikamu/umb/{{date('Y-m-d H:i:s') }}</small> </div>
</div>

<script>$(document).ready(function() {
    var table = $('#example').DataTable( {
            responsive: true,
            scrollX:true
        } )
        .columns.adjust()
        .responsive.recalc();
        } );
</script>

</body>
</html>