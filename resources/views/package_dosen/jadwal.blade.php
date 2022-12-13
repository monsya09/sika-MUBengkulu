@extends('package_dosen.template_dosen')
@section('judul', 'Jadwal')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="mr-2"><strong>Tahun Akademik</strong></div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                <form action="/jadwal/filter" method="post">
                    @csrf
                        <input name="ta" type="text" class="form-control w-32 box placeholder-theme-13 rounded-full border-transparent" placeholder="eg.20221" required>
                    </div>
                </div>
                <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0"><button class="btn btn-primary dark:text-theme-10 tooltip" title="Lihat jadwal per tahun akademik" type="submit">Lihat</button></div>
                </form>
                <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0"><a href="/jadwal/all"  class="btn btn-rounded-warning">All</a></div>
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0"><a href="" class="btn btn-success">Cetak Jadwal<i data-feather="printer" class="w-4 h-4"></i></a></div>
            </div>
            <div class="col-span-12 mt-2 -mb-6 intro-y">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th rowspan="2">No</th>
                            <th rowspan="2">Kode MK</th>
                            <th rowspan="2">Nama MK</th>
                            <th rowspan="2">SKS</th>
                            <th colspan="4">Jadwal Kuliah</th>
                        </tr>
                        <tr>
                            <th>Hari</th>
                            <th>Jam</th>
                            <th>Kelas</th>
                            <th>Ruang</th>
                            <th>TA</th>
                            <th>RPS</th>
                            <th>Progres</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($jadwal as $j)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $j->idMataKuliah }}</td>
                            <td>{{ $j->matakuliah->namaMataKuliah }}</td>
                            <td>{{ $j->matakuliah->totalSKSMK }}</td>
                            <td>{{ $j->hariKuliah }}</td>
                            <td>{{ $j->jamMulaiKuliah }} ~ {{ $j->jamSelesaiKuliah}} </td>
                            <td>{{ $j->matakuliah->semester.$j->masterkelas->kelas}}</td>
                            <td>{{ $j->ruangankelas->namaRuangan }}</td>
                            <td>{{ $j->tahunakademik->idTahunAkademik }}</td>
                            <td>
                                <a href="javascript:;" data-toggle="modal" data-target="#krs-{{ $j->idMataKuliah }}" class="text-theme-25"><i data-feather="file-text" class="w-4 h-4"></i>lihat</a> 
                                {{-- <a class="text-theme-25" href="/downloadRps" target="_blank" rel="noopener noreferrer">download</a></td> --}}
                            <td>
                                @foreach ($progres as $p)
                                    @if ($j->idKelasKuliah == $p->idKelasKuliah)
                                        <a class="tooltip" title="{{ $p->jumlahHadir/16*100 }}%" href="/jurnal/presensiDosen/{{ $j->idKelasKuliah }}">
                                            <div class="progress h-4 w-20 rounded">
                                                @if ($p->jumlahHadir < 5 )
                                                    <div style="width:{{ $p->jumlahHadir/16*100 }}% " class="progress-bar bg-theme-21 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                @elseif ($p->jumlahHadir < 8)
                                                    <div style="width:{{ $p->jumlahHadir/16*100 }}% " class="progress-bar bg-theme-15 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                    </div>
                                                @elseif ($p->jumlahHadir < 16)
                                                    <div style="width:{{ $p->jumlahHadir/16*100 }}% " class="progress-bar bg-theme-27 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                        {{ $p->jumlahHadir/16*100 }}%  
                                                    </div>
                                                @elseif($p->jumlahHadir == 16)
                                                    <div style="width:{{ $p->jumlahHadir/16*100 }}% " class="progress-bar bg-theme-20 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                        {{ "Complete" }}
                                                    </div>
                                                @endif
                                            </div>
                                        </a>
                                    @endif
                                @endforeach
                            </td>

                            <td><a href="/jurnal/{{ $j->idKelasKuliah }}" class="text-theme-20 font-bold"><i data-feather="file-text"></i>Aktivitas</a> | 
                                <a href="/detailKhs/{{ $j->idKelasKuliah }}" class="text-theme-22 font-bold">Nilai</a>
                            </td>
                        </tr>
                        <!-- BEGIN: Super Large Modal Content -->
                        <div id="krs-{{ $j->idMataKuliah }}" class="modal w-fit" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-body p-4 text-center">
                                        <div class="mb-2"><button class="btn btn-sm btn-success" type="button">Cetak KRS <i data-feather="printer" class="w-4 h-4 mr-2"></i></button></div>
                                        <iframe id="ipdf" src="/storage/krs/krs1.pdf" width="100%" height="900"></iframe>
                                        {{-- <embed class="w-auto" type="application/pdf" src="/storage/krs/krs1.pdf"></embed> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END: Super Large Modal Content -->
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

@section('js')
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>$(document).ready(function() {
    var table = $('#example').DataTable( {
            responsive: true,
            scrollX:true
        } )
        .columns.adjust()
        .responsive.recalc();
        } );
</script>
<script type="text/javascript">
    $("button").click(function(){
        var myIframe = document.getElementById("ipdf").contentWindow;
            myIframe.focus();
            myIframe.print();
            return false;
    });
</script>
@stop
@endsection