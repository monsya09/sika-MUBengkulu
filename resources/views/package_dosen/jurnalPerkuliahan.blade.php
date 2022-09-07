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
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mr-3 sm:mt-0 sm:ml-auto md:ml-0">
                    <a href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview" class="btn btn-primary">Tambah Jurnal<i data-feather="plus" class="w-4 h-4"></i></a></div>
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
                        @foreach ($jurnal as $j)
                        <tr>
                            <td>{{ $j->pertemuan}}</td>
                            <td>{{ $j->tanggal }}</td>
                            <td>10:00 ~ 12:00</td>
                            <td>{{ $j->materi }}</td>
                            <td>{{  $j->capaianMateri }}</td>
                            <td>{{ $untukJumlah }}</td>
                            <td>15</td>
                            <td>5</td>
                            <td><a href="/jurnal/presensi/{{ $j->id }}" class="text-theme-20 font-bold">Presensi</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{{-- Modal form tambah jurnal --}}
<div id="header-footer-modal-preview" class="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- BEGIN: Modal Header -->
            <div class="modal-header">
                <h2 class="font-medium text-base mr-auto">Broadcast Message</h2> <button class="btn btn-outline-secondary hidden sm:flex"> <i data-feather="file" class="w-4 h-4 mr-2"></i> Download Docs </button>
                <div class="dropdown sm:hidden"> <a class="dropdown-toggle w-5 h-5 block" href="javascript:;" aria-expanded="false"> <i data-feather="more-horizontal" class="w-5 h-5 text-gray-600 dark:text-gray-600"></i> </a>
                    <div class="dropdown-menu w-40">
                        <div class="dropdown-menu__content box dark:bg-dark-1 p-2"> <a href="javascript:;" class="flex items-center p-2 transition duration-300 ease-in-out bg-white dark:bg-dark-1 hover:bg-gray-200 dark:hover:bg-dark-2 rounded-md"> <i data-feather="file" class="w-4 h-4 mr-2"></i> Download Docs </a> </div>
                    </div>
                </div>
            </div> <!-- END: Modal Header -->
            <!-- BEGIN: Modal Body -->
            <div class="modal-body grid grid-cols-12 gap-4 gap-y-3">
                <div class="col-span-12 sm:col-span-6"> <label for="modal-form-1" class="form-label">Pertemuan</label> <input id="modal-form-1" type="text" class="form-control" placeholder="example@gmail.com"> </div>
                <div class="col-span-12 sm:col-span-6"> <label for="modal-form-2" class="form-label">Tanggal</label> <input id="modal-form-2" type="text" class="form-control" placeholder="example@gmail.com"> </div>
                <div class="col-span-12 sm:col-span-6"> <label for="modal-form-3" class="form-label">Jam</label> <input id="modal-form-3" type="text" class="form-control" placeholder="Important Meeting"> </div>
                <div class="col-span-12 sm:col-span-6"> <label for="modal-form-4" class="form-label">Materi</label> <input id="modal-form-4" type="text" class="form-control" placeholder="Job, Work, Documentation"> </div>
                <div class="col-span-12 sm:col-span-6"> <label for="modal-form-5" class="form-label">Capaian materi</label> <input id="modal-form-5" type="text" class="form-control" placeholder="Job, Work, Documentation"> </div>
            </div> <!-- END: Modal Body -->
            <!-- BEGIN: Modal Footer -->
            <div class="modal-footer text-right"> <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> <button type="button" class="btn btn-primary w-20">Send</button> </div> 
            <!-- END: Modal Footer -->
        </div>
    </div>
</div> <!-- END: Modal form tambah jurnal -->

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