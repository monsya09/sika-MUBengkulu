@extends('package_dosen.template_dosen')
@section('judul', 'Jaurnal')
@section('css')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-2 mt-4">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center">
                <div class="relative flex items-center">
                    <div class="w-20 h-20 sm:w-24 sm:h-24 image-fit">
                        <img alt="foto" class="rounded-full" src="/dist/images/jurnal.jpg">
                    </div>
                    <div class="ml-4 mr-auto">
                        <div class="font-medium text-base"></div>
                        <div class="text-gray-600"></div>
                        <div class="text-gray-600"></div>
                        <div class="text-gray-600"></div>
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0">
                </div>
            </div>
            <div class="col-span-12 sm:px-8 intro-y">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th class="w-20">Link file TA</th>
                            <th class="w-10">Bimbingan ke</th>
                            <th class="w-20">Hari/Tangal</th>
                            <th class="w-10">Status</th>
                            <th class="w-52">Catatan</th>
                            <th class="w-10">Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($riwayat as $r)
                            <tr>
                                <td><a href="{{ $r->fileTA }}" class="text-theme-25" target="_blank" rel="noopener noreferrer"><i data-feather="file-text" class="w-4 h-4"></i>lihat file</a> </td>
                                <td>{{ $r->bimbingan }}</td>
                                <td>{{ $r->tanggalBimbingan }}</td>
                                <td>
                                    @if (empty($r->status))
                                        <span style="font-style: italic" class="text-theme-29">{{ "Menunggu jadwal bimbingan" }}</span>
                                    @endif
                                    {{ $r->status }}</td>
                                <td>
                                    @if (empty($r->komentar))
                                        <a href="javascript:;" data-toggle="modal" data-target="#tambahKomentar-{{ $r->idRiwayatTA }}" class="text-theme-25"><i data-feather="edit" class="w-4 h-4"></i>tulis catatan</a>
                                    @else
                                        {{ $r->komentar }}
                                    @endif
                                </td>
                                <td><a href="javascript:;" data-toggle="modal" data-target="#krs" class="text-theme-25"><i data-feather="edit" class="w-4 h-4"></i></a></td>
                            </tr>
                            {{-- Modal form tambah jurnal --}}
                            <div id="tambahKomentar-{{ $r->idRiwayatTA }}" class="modal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- BEGIN: Modal Header -->
                                        <div class="modal-header">
                                            <h2 class="font-medium text-base text-theme-20 mr-auto">Catatan Bimbingan</h2>
                                        </div> <!-- END: Modal Header -->
                                        <!-- BEGIN: Modal Body -->
                                        <form action="/catatanStore" method="post">
                                            @csrf
                                            <input name="idRiwayat" type="hidden" value="{{ $r->idRiwayatTA }}">
                                            <input name="idTugasAkhir" type="hidden" value="{{ $r->idTugasAkhir }}">
                                        <div class="modal-body grid grid-cols-12 gap-2 gap-y-3">
                                            <div class="col-span-12 sm:col-span-4"> <label for="modal-form-1" class="form-label">Bimbingan Ke</label> <input name="bimbingan" type="text" class="form-control" value="{{ $r->bimbingan }}" disabled></div>
                                            <div class="col-span-12 sm:col-span-4"> <label for="modal-form-2" class="form-label">Tanggal</label> <input name="tanggal" type="date" class="form-control" placeholder="" required> </div>
                                            <div class="col-span-12 sm:col-span-4">
                                                <label for="modal-form-6" class="form-label">Status</label>
                                                <select name="status" class="form-select">
                                                    <option value="Perbaikan">Perbaikan</option>
                                                    <option value="Acc">Acc</option>
                                                </select>
                                            </div>
                                            <div class="col-span-12 sm:col-span-12"> 
                                            </div>
                                            <div class="col-span-12 sm:col-span-12"> 
                                                <label for="modal-form-5" class="form-label">Catatan</label>
                                                <textarea class="form-control"  name="catatan" id="" cols="30" rows="5" required>{{ old('materi') }}</textarea></div>
                                            </div> 
                                            <!-- END: Modal Body -->
                                        <!-- BEGIN: Modal Footer -->
                                        <div class="modal-footer text-right"> <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> <button type="submit" class="btn btn-primary w-20">Simpan</button> </div> 
                                        <!-- END: Modal Footer -->
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- END: Modal form tambah jurnal -->
                        @endforeach
                    </tbody>
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
</script>
<script>
    toastr.options = {
        "positionClass": "toast-top-center"
    }

    @if(Session::has('error'))
        toastr.error("{{ Session::get('error')}}")
    @endif
    @if(Session::has('berhasilSimpan'))
        toastr.success("{{ Session::get('berhasilSimpan')}}")
    @endif

    @if(Session::has('hapus'))
        toastr.warning("{{ Session::get('hapus')}}")
    @endif
</script>
@stop
@endsection