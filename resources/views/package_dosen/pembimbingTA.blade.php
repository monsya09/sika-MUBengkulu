@extends('package_dosen.template_dosen')
@section('judul', 'Bimbingan TA')
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
                <div class="font-medium text-base">Data Mahasiswa Bimbingan TA</div>
                <div class="text-gray-600">{{ $dosen->programstudi->fakultas->namaFakultas }}</div>
                <div class="text-gray-600">{{ $dosen->programstudi->programStudi }}</div>
            </div>
        </div>
    </div>
</div>
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
            </div>
            <div class="col-span-12 -mb-6 intro-y">
                <form id="formNilai" action="/simpanDetailKhs" method="post">{{-- form --}}
                    @csrf
                    @php 
                        $row = 0; 
                    @endphp
                    {{-- <input name="idKelasKuliah" type="hidden" value="{{ $jadwal->idKelasKuliah }}"> --}}
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>NPM</th>
                            <th>Angkatan</th>
                            <th>Pembimbing 1</th>
                            <th>Pembimbing 2</th>
                            <th>Status TA</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($pt as $item)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $item->mahasiswa->nama_mhs }}</td>
                            <td>{{ $item->mahasiswa->npm }}</td>
                            <td>{{ $item->mahasiswa->angkatan }}</td>
                            <td>@foreach ($item->mahasiswa->dosen as $d)
                                    @if ($d->nidn == $item->nidn and $item->statusPembimbingTA == "Pembimbing 1")
                                        <span class="font-bold" style="font-style: italic">{{ $d->namaDosen }}</span>
                                    @endif
                                    @if ($d->nidn != $item->nidn and $item->statusPembimbingTA == "Pembimbing 2")
                                    {{ $d->namaDosen }}
                                    @endif
                                    {{-- {{ $d }} --}}
                                @endforeach
                            </td>
                            <td>@foreach ($item->mahasiswa->dosen as $d)
                                    @if ($d->nidn == $item->nidn and $item->statusPembimbingTA == "Pembimbing 2")
                                        <span class="font-bold" style="font-style: italic">{{ $d->namaDosen }}</span>
                                    @endif
                                    @if ($d->nidn != $item->nidn and $item->statusPembimbingTA == "Pembimbing 1")
                                        {{ $d->namaDosen }}
                                    @endif
                                @endforeach
                            </td>
                            <td>Bimbingan ke-2</td>
                            <td><a href="/riwayatBimbinganTA/{{ $item->npm }}" class="text-theme-30"><i data-feather="maximize" class="w-4 h-4"></i>Riwayat Bimbingan</a></td>
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
            scrollX:true
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