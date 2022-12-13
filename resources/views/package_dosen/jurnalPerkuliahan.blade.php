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
                        <div class="font-medium text-base">{{ $jadwal->matakuliah->namaMataKuliah }}({{ $jadwal->matakuliah->idMataKuliah }})</div>
                        <div class="text-gray-600">{{ $jadwal->hariKuliah }}/{{ $jadwal->jamMulaiKuliah }}</div>
                        <div class="text-gray-600">{{ $jadwal->matakuliah->semester }}{{ $jadwal->masterkelas->kelas }}-{{ $jadwal->idTahunAkademik }}</div>
                        <div class="text-gray-600">{{ $jadwal->matakuliah->kurikulum->programstudi->programStudi }}</div>
                        <div class="text-theme-25">
                            
                            {{-- @if ($progres == 0)
                            <div class="progress h-4 w-32 rounded">
                                <div style="width:0% " class="progress-bar bg-theme-25 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                            </div>
                            @else
                            <a href="/jurnal/presensiDosen/{{ isset($jadwal)?$jadwal->idKelasKuliah:'' }}">
                                <div class="progress h-4 w-32 rounded">
                                    <div style="width:{{ $progres/16*100 }}% " class="progress-bar bg-theme-25 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ $progres/16*100 }}%</div>
                                </div>
                                klik untuk melihat kehadiran dosen
                            </a>
                            @endif --}}
                            <a class="tooltip" title="{{ $progres/16*100 }}%" href="/jurnal/presensiDosen/{{ $jadwal->idKelasKuliah }}">
                                <div class="progress h-4 w-20 rounded">
                                    @if ($progres < 5 )
                                        <div style="width:{{ $progres/16*100 }}% " class="progress-bar bg-theme-21 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    @elseif ($progres < 8)
                                        <div style="width:{{ $progres/16*100 }}% " class="progress-bar bg-theme-15 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    @elseif ($progres < 16)
                                        <div style="width:{{ $progres/16*100 }}% " class="progress-bar bg-theme-27 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                            {{ $progres/16*100 }}% 
                                        </div>
                                    @elseif($progres == 16)
                                        <div style="width:{{ $progres/16*100 }}% " class="progress-bar bg-theme-20 rounded" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                            {{ "Complete" }}
                                        </div>
                                    @endif
                                </div>
                                klik untuk melihat kehadiran dosen
                            </a>
                        </div>
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mr-3 sm:mt-0 mt-4 sm:ml-auto md:ml-0">
                    @if ($jurnal->count() >= 16)
                    <a style="pointer-events: none; cursor: default;" href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview" class="btn btn-primary">Tambah Jurnal<i data-feather="plus" class="w-4 h-4"></i></a>
                    @else
                    <a href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview" class="btn btn-primary">Tambah Jurnal<i data-feather="plus" class="w-4 h-4"></i></a>
                    @endif
                </div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0">
                    <a href="/cetakPresensi/{{ isset($jadwal)?$jadwal->idKelasKuliah:'' }}" class="mr-1">
                        @if(empty($jurnal))
                        <button disabled class="btn btn-warning-soft">Cetak Presensi<i data-feather="printer" class="w-4 h-4 mr-1"></i></button>
                        @else
                        <button class="btn btn-warning-soft">Cetak Presensi<i data-feather="printer" class="w-4 h-4 mr-2 mr-1"></i></button>
                        @endif  
                    </a>
                </div>
                <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0">
                    <a href="/cetakJurnal/{{ $jadwal->idKelasKuliah }}}" class="mr-1">
                        @if(empty($jurnal) | $jurnal->count() < 16  )
                        <button disabled class="btn btn-success">Cetak Jurnal<i data-feather="printer" class="w-4 h-4"></i></button>
                        @else
                        <button class="btn btn-success">Cetak Jurnal<i data-feather="printer" class="w-4 h-4 mr-2"></i></button>
                        @endif  
                    </a>
                </div>
            </div>
            <div class="col-span-12 sm:px-8 intro-y">
                @if(empty($jurnal))
                    <table id="example" class="row-border" style="width:100%">
                        <thead>
                            <tr>
                                <th>Pertemuan</th>
                                <th>Hari/Tangal</th>
                                <th>Jam</th>
                                <th>Materi</th>
                                <th>Jumlah Mhs</th>
                                <th>Hadir</th>
                                <th>Tidak Hadir</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="8" class="text-center">
                                    Belum ada data jurnal perkuliah
                                    <a href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview" class="text-theme-21">
                                        klik untuk tambah data
                                    </a>
                                </td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                                <td style="display: none;"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                @else
                {{-- @error('pertemuan')
                <div class="alert alert-warning alert-dismissible show flex items-center mb-2" role="alert"> 
                    <i data-feather="alert-octagon" class="w-6 h-6 mr-2"></i>
                        Data pertemuan yang dimasukkan sudah ada, masukkan yang lain!!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"> 
                        <i data-feather="x" class="w-4 h-4"></i> 
                    </button> 
                </div>
                @enderror --}}
                {{-- <div class="mb-2"><span class="px-2 py-1 rounded-full bg-theme-20 text-white mr-1">Hari Tanggal</span></div> --}}
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>Pertemuan</th>
                            <th>Hari/Tangal</th>
                            <th>Jam</th>
                            <th>Materi</th>
                            <th>Jumlah Mhs</th>
                            <th>Hadir</th>
                            <th>Tidak Hadir</th>
                            <th>Opsi</th>
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
                            <td><a class="text-theme-20" href="/jurnal/presensi/{{ $j->idJurnal }}">Presensi</a>{{ " " }}|
                                <a href="javascript:;" data-toggle="modal" data-target="#edit-modal-preview{{ $j->idJurnal}}" class="text-theme-25"><i data-feather="edit"></i></a>|
                                <a href="javascript:;" data-toggle="modal" data-target="#delete-modal-preview{{ $j->idJurnal}}" class="text-theme-21"><i data-feather="trash-2"></i></a>
                            </td>
                        </tr>

                        {{-- Modal form edit jurnal --}}
                        <div id="edit-modal-preview{{ $j->idJurnal}}" class="modal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- BEGIN: Modal Header -->
                                    <div class="modal-header">
                                        <h2 class="font-medium text-base text-theme-20 mr-auto">Form tambah jurnal perkuliahan</h2>
                                    </div> <!-- END: Modal Header -->
                                    <!-- BEGIN: Modal Body -->
                                    <form action="/jurnal/update/{{ $j->idJurnal}}" method="get">
                                        @csrf
                                        <input name="idKelasKuliah" type="hidden" value="{{ $j->idKelasKuliah }}">
                                        <input name="idTA" type="hidden" value="{{ $jadwal->idTahunAkademik }}">
                                    <div class="modal-body grid grid-cols-12 gap-2 gap-y-3">
                                        <div class="col-span-3 sm:col-span-3"> <label for="modal-form-1" class="form-label">Pertemuan</label> <input name="pertemuan" type="text" class="form-control @error('pertemuan') is-invalid @enderror" required value="{{ number_format(substr($j->pertemuan,-2)) }}"></div>
                                        <div class="col-span-3 sm:col-span-3"> <label for="modal-form-2" class="form-label">Tanggal</label> <input name="tanggal" type="date" class="form-control" placeholder="tanggal" required value="{{ $j->tanggal }}"> </div>
                                        <div class="col-span-3 sm:col-span-3"> <label for="modal-form-3" class="form-label">Start</label> <input name="jamMulai" type="text" class="form-control" value="{{ $j->jamMulai }}" required> </div>
                                        <div class="col-span-3 sm:col-span-3"> <label for="modal-form-4" class="form-label">End</label> <input name="jamSelesai" type="text" class="form-control" value="{{ $j->jamSelesai }}" required> </div>
                                        <div class="col-span-12 sm:col-span-12"> <label for="modal-form-5" class="form-label">Materi</label><textarea class="form-control"  name="materi" id="" cols="30" rows="3">{{ $j->materi }}</textarea></div>
                                        <div class="col-span-12 sm:col-span-12"> <label for="modal-form-6" class="form-label">Capaian materi</label> <textarea class="form-control"  name="capaian" id="" cols="30" rows="4">{{ $j->capaianMateri }}</textarea></div>
                                    </div> <!-- END: Modal Body -->
                                    <!-- BEGIN: Modal Footer -->
                                    <div class="modal-footer text-right"> <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> <button type="submit" class="btn btn-primary w-20">Simpan</button> </div> 
                                    <!-- END: Modal Footer -->
                                    </form>
                                </div>
                            </div>
                        </div> <!-- END: Modal form edit jurnal -->
                        <!-- Modal Hapus -->
                        <div id="delete-modal-preview{{ isset($j)?$j->idJurnal:''}}" class="modal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body p-0">
                                        <div class="p-5 text-center"> <i data-feather="x-circle" class="w-16 h-16 text-theme-21 mx-auto mt-3"></i>
                                            <div class="text-3xl mt-5">Yakin akan dihapus?</div>
                                            <div class="text-gray-600 mt-2">jika sudah dihapus tidak bisa dikembalikan lagi</div>
                                        </div>
                                        <div class="px-5 pb-8 text-center"> <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-24 dark:border-dark-5 dark:text-gray-300 mr-1">Cancel</button> 
                                            <a href="/jurnal/hapus/{{ isset($j)?$j->idJurnal:''}}" data-toggle="modal" class="btn btn-danger w-24">Hapus</a> </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- END: Modal Content -->
                        <!-- End modal Hapus -->
                        @endforeach
                    </tbody>

                @endif
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
                <h2 class="font-medium text-base text-theme-20 mr-auto">Form tambah jurnal perkuliahan</h2>
            </div> <!-- END: Modal Header -->
            <!-- BEGIN: Modal Body -->
            <form action="/jurnal/store" method="post">
                @csrf
                <input name="idTA" type="hidden" value="{{ isset($jadwal)?$jadwal->idTahunAkademik: '' }}">
                <input name="idKelasKuliah" type="hidden" value="{{ isset($jadwal)?$jadwal->idKelasKuliah: '' }}">
                <input name="idmk" type="hidden" value="{{ isset($jadwal)?$jadwal->idMataKuliah: '' }}">
                <input name="idMasterKelas" type="hidden" value="{{ isset($jadwal)?$jadwal->idMasterKelas: '' }}">
            <div class="modal-body grid grid-cols-12 gap-2 gap-y-3">
                <div class="col-span-3 sm:col-span-3"> <label for="modal-form-1" class="form-label">Pertemuan</label> <input name="pertemuan" type="text" class="form-control @error('pertemuan') is-invalid @enderror" required></div>
                <div class="col-span-3 sm:col-span-3"> <label for="modal-form-2" class="form-label">Tanggal</label> <input name="tanggal" type="date" class="form-control" placeholder="" required> </div>
                <div class="col-span-3 sm:col-span-3"> <label for="modal-form-3" class="form-label">Start</label> <input name="jamMulai" type="text" class="form-control" value="{{ isset($jadwal)?$jadwal->jamMulaiKuliah: '' }}" required> </div>
                <div class="col-span-3 sm:col-span-3"> <label for="modal-form-4" class="form-label">End</label> <input name="jamSelesai" type="text" class="form-control" value="{{ isset($jadwal)?$jadwal->jamSelesaiKuliah: '' }}" required> </div>
                <div class="col-span-12 sm:col-span-12"> <label for="modal-form-5" class="form-label">Materi</label><textarea class="form-control"  name="materi" id="" cols="30" rows="3" required>{{ old('materi') }}</textarea></div>
                </div> <!-- END: Modal Body -->
            <!-- BEGIN: Modal Footer -->
            <div class="modal-footer text-right"> <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> <button type="submit" class="btn btn-primary w-20">Simpan</button> </div> 
            <!-- END: Modal Footer -->
            </form>
        </div>
    </div>
</div> <!-- END: Modal form tambah jurnal -->

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