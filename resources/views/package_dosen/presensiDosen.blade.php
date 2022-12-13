@extends('package_dosen.template_dosen')
@section('judul', 'Nilai')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6 mt-2">
    <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-2">
        <div class="relative flex items-center p-3">
            <div class="w-20 h-20 sm:w-24 sm:h-24 image-fit">
                <img alt="foto" class="rounded-full" src="/dist/images/grading.jpg">
            </div>
            <div class="ml-4 mr-auto">
                <div class="font-medium text-base">{{ $jadwal->matakuliah->namaMataKuliah }}({{ $jadwal->matakuliah->idMataKuliah }})</div>
                <div class="text-gray-600">{{ $jadwal->hariKuliah }}/{{ $jadwal->jamMulaiKuliah }}</div>
                <div class="text-gray-600">{{ $jadwal->matakuliah->semester }}{{ $jadwal->masterkelas->kelas }}</div>
                <div class="text-gray-600">{{ $jadwal->matakuliah->kurikulum->programstudi->programStudi }}</div>
            </div>
        </div>
    </div>
</div>

<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center">
                <div class="w-full sm:w-auto sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
            </div>
            <div class="col-span-12 -mb-6 intro-y">
                <form id="formNilai" action="/simpanDetailKhs" method="post">{{-- form --}}
                    @csrf
                    @php 
                        $row = 0; 
                    @endphp
                    <input name="idKelasKuliah" type="hidden" value="{{ $jadwal->idKelasKuliah }}">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th rowspan="2">Pertemuan</th>
                            <th colspan="2">Jadwal</th>
                        </tr>
                        <tr>
                            <th>Hari/Tanggal</th>
                            <th>Jam</th>
                            <th>Jam Presensi</th>
                            <th>Materi</th>
                            <th>Bukti Kehadiran</th>
                        </tr> 
                    </thead>
                    <tbody>
                        @foreach ($presensiDosen as $item)
                            <tr>
                                <td>{{ number_format(substr($item->pertemuan,-2)) }}</td>
                                <td>{{ $item->hariKuliah }}/{{ $item->tanggal }}</td>
                                <td>{{ $item->jamMulai }}/{{ $item->jamSelesai}}</td>
                                <td>{{ $item->created_at}}</td>
                                <td>{{ $item->materi }}</td>
                                <td>@if(empty($item->imgPresensi ))
                                        <img style="width: 50px; height: 50px; " alt="foto" class="" src="/storage/bukti/noImage.jpg">
                                    @else
                                        <img style="width: 50px; height: 50px; " alt="foto" class="" src="/storage/bukti/{{ $item->imgPresensi }}">
                                    @endif </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="text-right mt-2"></div>
                <input name="row" type="hidden" value="{{ $row }}">
                </form>
            </div>
        </div>
    </div>
</div>
@section('js')
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>$(document).ready(function() {
    var table = $('#example').DataTable( {
            responsive: true,
            scrollX:true,
            paging: false
        } )
        .columns.adjust()
        .responsive.recalc();
        } );

        $('button').click(function () {
        var data = table.$('input, select').serialize();
        });
</script>
<script>
    toastr.options = {
        "positionClass": "toast-top-center"
    }
    @if(Session::has('error'))
        toastr.error("{{ Session::get('error')}}")
    @endif
    @if(Session::has('sukses'))
        toastr.success("{{ Session::get('sukses')}}")
    @endif
</script>
@stop
@endsection