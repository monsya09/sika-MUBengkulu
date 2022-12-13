@extends('package_dosen.template_dosen')
@section('judul', 'Bimbingan KRS')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6 mt-2">
    <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-2">
        <div class="relative flex items-center p-3">
            <div class="w-20 h-20 sm:w-24 sm:h-24 image-fit">
                <img alt="foto" class="rounded-full" src="/dist/images/grading.jpg">
            </div>
            <div class="ml-4 mr-auto">
                <div class="font-medium text-base">Data Bimbingan KRS</div>
                <div class="text-gray-600">Tahun Akademik {{ $tahunAkademik->idTahunAkademik }}</div>
                <div class="text-gray-600">{{ $tahunAkademik->programStudi }}</div>
            </div>
        </div>
    </div>
</div>
<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            {{-- <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="mr-2"><strong>Tahun Akademik</strong></div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                <form action="/bimbingan/filter" method="post">
                    @csrf
                        <input value="{{ isset($tahunAkademik)?$tahunAkademik->idTahunAkademik:'' }}"
                        name="ta" type="text" class="form-control w-32 box placeholder-theme-13 rounded-full border-transparent" required>
                    </div>
                </div>
                <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0"><button class="btn btn-primary dark:text-theme-10 tooltip" title="Lihat jadwal per tahun akademik" type="submit">Lihat</button></div>
                </form>
                <div class="hidden md:block mx-auto"></div>
            </div> --}}
            <div class="col-span-12 mt-2 -mb-6 intro-y">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>NPM</th>
                            <th>Prodi</th>
                            <th>Fakultas</th>
                            <th>Angkatan</th>
                            <th>Status KRS</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($bim as $b)
                        <tr>
                            <td>{{ $b->nama_mhs }}</td>
                            <td>{{ $b->npm  }}</td>
                            <td>{{ $b->programStudi  }}</td>
                            <td>{{ $b->namaFakultas }}</td>
                            <td>{{ $b->angkatan }}</td>
                            <td>@if ($b->status== "Diterima")
                                    <a href="/bimbingankrs/{{ $b->npm }}/{{ isset($tahunAkademik)?$tahunAkademik->idTahunAkademik:''  }}" class="text-theme-20">{{ $b->status }}</a>
                                @elseif($b->status== "Ditolak")
                                    <a href="/bimbingankrs/{{ $b->npm }}/{{ isset($tahunAkademik)?$tahunAkademik->idTahunAkademik:''  }}" class="text-theme-21">{{ $b->status }}</a>
                                @else
                                    <a href="/bimbingankrs/{{ $b->npm }}/{{ isset($tahunAkademik)?$tahunAkademik->idTahunAkademik:''  }}" class="text-theme-29">Pengajuan</a>
                                @endif
                            </td>
                            <td><a href="/bimbingankrs/{{ $b->npm }}/{{ isset($tahunAkademik)?$tahunAkademik->idTahunAkademik:''  }}" class="text-theme-30"><i data-feather="maximize" class="w-4 h-4"></i> lihat KRS</a></td>
                        </tr>
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
@stop
@endsection