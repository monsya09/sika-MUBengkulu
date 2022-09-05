@extends('package_dosen.template_dosen')
@section('judul', 'Jaurnal')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="text-theme-20 mr-2"><strong>Jurnal Perkuliahan "{{ $namaMK->matakuliah->namaMataKuliah }}/{{ $namaMK->programstudi->programStudi }}-{{ $namaMK->kelasmhs->namaKelas }}"</strong></div>
                <div class="w-full sm:w-auto sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0"><a href="" class="btn btn-success">Cetak Jurnal<i data-feather="printer" class="w-4 h-4"></i></a></div>
            </div>
            <div class="col-span-12 mt-2 -mb-6 intro-y">
                {{-- <div class="mb-2"><span class="px-2 py-1 rounded-full bg-theme-20 text-white mr-1">Hari Tanggal</span></div> --}}
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>Pertemuan</th>
                            <th>Hari/Tangal</th>
                            <th>Jam</th>
                            <th>Materi</th>
                            <th>Capaian Materi</th>
                            <th>Jumlah Mhs</th>
                            <th>Hadir</th>
                            <th>Tidak Hadir</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Senin/12-08-2022</td>
                            <td>10:00 ~ 12:00</td>
                            <td>Pengenalan Aplikasi Mobile</td>
                            <td>ini capaian</td>
                            <td>20</td>
                            <td>15</td>
                            <td>5</td>
                            <td><a href="/jurnal-1-presensi-" class="text-theme-20 font-bold">Presensi</a></td>
                        </tr>
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