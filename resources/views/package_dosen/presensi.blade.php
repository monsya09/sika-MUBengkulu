@extends('package_dosen.template_dosen')
@section('judul', 'Jurnal/presensi')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@stop
@section('konten')

<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-6">
        <div class="grid grid-cols-12 gap-6">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="mr-2"><strong>{{ $jurnal->kelaskuliah->matakuliah->namaMataKuliah}}-{{ isset($semester)?$semester->semester:''}}{{ isset($semester)?$semester->kelas:'' }} &nbsp Pertemuan ke-{{ number_format(substr($jurnal->pertemuan,-2)) }}</strong></div>
                <div class="w-full sm:w-auto sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mr-3 sm:mt-0 sm:ml-auto md:ml-0"></div>
            </div>
            <div class="col-span-12 mt-2 -mb-6 intro-y">
                @if (isset($bukti)?$bukti->imgPresensi == NULL:'')
                <a href="javascript:;" data-toggle="modal" data-target="#simpan-presensi">
                    <div class="alert alert-warning show mb-2 text-center" role="alert">Klik untuk menambahkan foto sebagai bukti kehadiran dosen</div>
                </a>

                @endif
            <form id="formPresensi" action="/jurnal/presensi/store" method="post" enctype="multipart/form-data">
                @csrf
                @php 
                    $row = 0; 
                @endphp
                <input name="idJurnal" type="hidden" value="{{ $jurnal->idJurnal }}">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>NPM</th>
                            <th>Nama</th>
                            <th>Kehadiran</th>
                            <th>Keterangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($presensi as $p)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $p->krs->npm }}</td>
                            <td>{{ $p->krs->mahasiswa->nama_mhs }}</td>
                            <td>
                                    <div class="flex flex-col sm:flex-row mt-2">
                                        <div class="form-check mr-2"> 
                                            <input id="radio-switch-4" class="form-check-input" type="radio" name="hadir{{ $row }}" value="1" {{ $p->kehadiran == '1'? 'checked': '' }} > 
                                            <label class="form-check-label" for="radio-switch-4">Hadir</label> 
                                        </div>
                                        <div class="form-check mr-2 mt-2 sm:mt-0"> 
                                            <input id="radio-switch-5" class="form-check-input" type="radio" name="hadir{{ $row }}" value="0.20" {{ $p->kehadiran == '0.20'? 'checked': '' }}> 
                                            <label class="form-check-label" for="radio-switch-5">Izin</label> 
                                        </div>
                                        <div class="form-check mr-2 mt-2 sm:mt-0"> 
                                            <input id="radio-switch-6" class="form-check-input" type="radio" name="hadir{{ $row }}" value="0" {{ $p->kehadiran == '0'? 'checked': '' }}> 
                                            <label class="form-check-label" for="radio-switch-6">TK</label> 
                                        </div>
                                    </div>
                                    <input name="krs{{ $row }}" type="hidden" value="{{ $p->idKRS }}">
                            </td>
                            <td><input class="form-control w-full" type="text" name="keterangan{{ $row }}" value="{{ $p->keterangan }}" placeholder="isikan keterangan"></td>
                        </tr>
                        @php $row++ @endphp                   
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-2 sm:mt-0 sm:ml-auto md:ml-0">
                    <a href="/jurnal/{{ $jurnal->kelaskuliah->idKelasKuliah }}" class="btn btn-warning mr-2">Kembali</a>
                    <button type="button" onclick="document.getElementById('formPresensi').submit();" class="btn btn-primary shadow-md">Simpan</button>
                    {{-- <a href="javascript:;" data-toggle="modal" data-target="#simpan-presensi" class="text-theme-21">Simpan</a> --}}
                </div>
            </div>
            <input name="row" type="hidden" value="{{$row}}">
            </form>
        </div>
    </div>
</div>

<div id="simpan-presensi" class="modal" aria-hidden="true" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="p-5 text-center"> <i data-feather="info" class="w-16 h-16 text-theme-15 mx-auto mt-3"></i>
                    <div class="mt-2">Masukkan foto sebagai bukti kehadiran dosen</div>
                </div>
                <form enctype="multipart/form-data" method="post" action="/presensiDosen_bukti/" data-file-types="image/jpeg|image/png|image/jpg" action="/file-upload"> 
                    @csrf
                    <input type="hidden" name="idJurnal" value="{{ $jurnal->idJurnal}}">
                    <div class="fallback"> 
                        <input name="file" type="file" /> 
                    </div> 
                    <div class="modal-footer text-right"> 
                        <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> 
                        <button type="submit" class="btn btn-primary w-20">simpan</button> 
                    </div> <!-- END: Modal Footer -->
                </form> 
            </div>
        </div>
    </div>
</div> <!-- END: Modal Content -->
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
</script>
<script>
    @if(Session::has('sukses'))
        toastr.success("{{ Session::get('sukses')}}")
    @endif
    @if(Session::has('error'))
        toastr.error("{{ Session::get('error')}}")
    @endif
</script>
@stop
@endsection