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
                @if ($data == 'selesai')
                    {{ '' }}
                @else
                    <div class="animate-bounce">Waktu pengisian nilai tinggal <mark>{{ $deadLine}} hari</mark> lagi, akan berakhir pada {{ date('d-m-Y', strtotime($akhir));}}</div>
                @endif
                <div class="w-full sm:w-auto sm:mt-0 sm:ml-auto md:ml-0 mr-2">
                    <div class="relative text-gray-700 dark:text-gray-300">
                    </div>
                </div>
                <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0"></div>
                <div class="hidden md:block mx-auto"></div>
                @if(isset($bobot)?$bobot->statusPenilaian == 'final':'' or $data == 'selesai') 
                    <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                        <div class="dropdown w-1/2 sm:w-auto">
                            <button class="dropdown-toggle btn btn-warning w-full sm:w-auto" aria-expanded="false"> <i data-feather="printer" class="w-4 h-4 mr-2"></i> Cetak <i data-feather="chevron-down" class="w-4 h-4 ml-auto sm:ml-2"></i> </button>
                            <div class="dropdown-menu w-40">
                                <div class="dropdown-menu__content box dark:bg-dark-1 p-2">
                                    <a href="/cetakDetailKhs/{{ $jadwal->idKelasKuliah }}" target="blank" class="flex items-center p-2 transition duration-300 ease-in-out bg-white dark:bg-dark-1 hover:bg-gray-200 dark:hover:bg-dark-2 rounded-md"> <i data-feather="printer" class="w-4 h-4 mr-2"></i> Detail nilai</a>
                                    <a href="/cetakKhs/{{ $jadwal->idKelasKuliah }}" target="blank" class="flex items-center p-2 transition duration-300 ease-in-out bg-white dark:bg-dark-1 hover:bg-gray-200 dark:hover:bg-dark-2 rounded-md"> <i data-feather="printer" class="w-4 h-4 mr-2"></i> Nilai </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                        <a href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview-bobot" class="btn btn-success" style="pointer-events: none; cursor: default;"><i data-feather="activity" class="w-4 h-4 mr-2 hidden"></i>Bobot Penilaian</a>
                    </div>
                    <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                        <a href="javascript:;" data-toggle="modal" data-target="#prosesFinalisasiKHS" class="btn btn-warning-soft" style="pointer-events: none; cursor: default;"><i data-feather="database" class="w-4 h-4 mr-2"></i>Finalisasi Nilai</a>
                    </div>
                    <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                        <button disabled type="button" class="btn btn-primary" onclick="document.getElementById('formNilai').submit()">Simpan</button>
                    </div>  
                @else
                    <div class="w-full sm:w-auto mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                        <a href="javascript:;" data-toggle="modal" data-target="#header-footer-modal-preview-bobot" class="btn btn-success"><i data-feather="activity" class="w-4 h-4 mr-2"></i>Bobot Penilaian</a>
                    </div>
                    @if ($Mhs == '[]')
                        <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                            <a href="javascript:;" data-toggle="modal" data-target="#prosesFinalisasiKHS" class="btn btn-warning-soft" style="pointer-events: none; cursor: default;"><i data-feather="database" class="w-4 h-4 mr-2"></i>Finalisasi Nilai</a>
                        </div>
                        <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                            <button disabled type="button" class="btn btn-primary" onclick="document.getElementById('formNilai').submit()">Simpan</button>
                        </div>  
                    @else
                        <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                            <a href="javascript:;" data-toggle="modal" data-target="#prosesFinalisasiKHS" class="btn btn-warning-soft"><i data-feather="database" class="w-4 h-4 mr-2"></i>Finalisasi Nilai</a>
                        </div>
                        <div class="w-full sm:w-auto mt-3 mr-2 sm:mt-0 sm:ml-auto md:ml-0">
                            <button type="button" class="btn btn-primary" onclick="document.getElementById('formNilai').submit()">Simpan</button>
                        </div>   
                    @endif
                @endif
            </div>
            <div class="col-span-12 -mb-6 intro-y">
                @if($Mhs == '[]')
                    <div class="alert alert-warning show flex items-center mb-2" role="alert"> <i data-feather="alert-circle" class="w-6 h-6 mr-2"></i> 
                        <marquee behavior="alternate" direction="right">Tentukkan presentase bobot penilaian terlebih dahulu</marquee>  
                    </div>
                @endif
                <form id="formNilai" action="/simpanDetailKhs" method="post">{{-- form --}}
                    @csrf
                    @php 
                        $row = 0; 
                    @endphp
                    <input name="idKelasKuliah" type="hidden" value="{{ $jadwal->idKelasKuliah }}">
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>NPM</th>
                            <th>Kehadiran</th>
                            <th>Tugas <div class="text-xs">{{ isset($bobot)?$bobot->bobotTugas:'' }}%</div></th>
                            <th>UTS <div class="text-xs">{{ isset($bobot)?$bobot->bobotUTS:'' }}%</div></th>
                            <th>UAS <div class="text-xs">{{ isset($bobot)?$bobot->bobotUAS:'' }}%</div></th>
                            <th>Nilai Angka</th>
                            <th>Nilai Huruf</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($Mhs as $m)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $m->krs->mahasiswa->nama_mhs }}</td>
                            <td>{{ $m->krs->mahasiswa->npm }}</td>
                            <td>@foreach ($presensi as $p)
                                    @if ($p->idKRS == $m->idKRS)
                                        {{ number_format(($p->hadir/$jumlahPertemuan * 100), 2) }}%
                                    @endif
                                @endforeach
                            </td>
                            <input name="idKRS{{ $row }}" type="hidden" value="{{ $m->idKRS }}">
                            <td><input @if ($bobot->statusPenilaian == 'final')
                                @disabled(true)
                            @endif class="form-control form-control-sm w-20 border-theme-20" name="nilaiTugas{{ $row }}" type="number" value="{{ $m->nilaiTugas }}"></td>
                            <td><input @if ($bobot->statusPenilaian == 'final')
                                @disabled(true)
                            @endif class="form-control form-control-sm w-20 border-theme-20" name="nilaiUTS{{ $row }}" type="number" value="{{ $m->nilaiUTS }}"></td>
                            <td><input @if ($bobot->statusPenilaian == 'final')
                                @disabled(true)
                            @endif class="form-control form-control-sm w-20 border-theme-20" name="nilaiUAS{{ $row }}" type="number" value="{{ $m->nilaiUAS }}"></td>
                            <td>{{ $m->nilaiAkhir }}</td>
                            <td>@if ($m->nilaiAkhir == NULL)
                                {{ '' }}
                                @elseif ($m->nilaiAkhir > 80)
                                {{ "A" }}
                                @elseif($m->nilaiAkhir > 75)
                                {{ "B" }}
                                @elseif($m->nilaiAkhir > 60)
                                {{ "C" }}
                                @elseif($m->nilaiAkhir > 50)
                                {{ "D" }}
                                @else
                                {{ "E" }}                               
                            @endif</td>
                        </tr>
                            @php $row++ @endphp
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
{{-- Modal input bobot --}}
<div id="header-footer-modal-preview-bobot" class="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- BEGIN: Modal Header -->
            <div class="modal-header">
                <h2 class="font-medium text-base mr-auto">Bobot Penilaian</h2>
            </div> <!-- END: Modal Header -->
            <!-- BEGIN: Modal Body -->
        <form action="/detailKhs/bobot" method="post">
            @csrf
            <input name="jadwal" type="hidden" value="{{ $jadwal->idKelasKuliah }}">
            
            <div class="modal-body grid grid-cols-12 gap-4 gap-y-3">
                <div class="col-span-12 sm:col-span-12"> 
                    <label for="modal-form-2" class="form-label">Tugas(%)</label>
                    <input name="tugas" type="number" class="form-control" value="{{ isset($bobot)?$bobot->bobotTugas:'' }}"> 
                </div>
                <div class="col-span-12 sm:col-span-12"> 
                    <label for="modal-form-3" class="form-label">Ujian Tengah Semester(%)</label> 
                    <input name="uts" type="number" class="form-control" value="{{ isset($bobot)?$bobot->bobotUTS:''}}"> 
                </div>
                <div class="col-span-12 sm:col-span-12"> 
                    <label for="modal-form-4" class="form-label">Ujian Akhir Semester(%)</label> 
                    <input name="uas" type="number" class="form-control" value="{{ isset($bobot)?$bobot->bobotUAS:'' }}"> 
                </div>
            </div> <!-- END: Modal Body -->
            <!-- BEGIN: Modal Footer -->
            <div class="modal-footer text-right"> 
                <button type="button" data-dismiss="modal" class="btn btn-outline-secondary w-20 mr-1">Cancel</button> 
                <button type="submit" class="btn btn-primary w-20">Simpan</button> 
            </div> <!-- END: Modal Footer -->
        </form>
        </div>
    </div>
</div> <!-- END: Modal Content -->
{{-- End modal input bobot --}}

<!-- BEGIN: finalisasi -->
<div id="prosesFinalisasiKHS" class="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body p-0">
                <form action="/prosesFinalisasiNilai" method="post">
                    @csrf
                    @php
                        $baris = 0;
                    @endphp
                    @foreach ($Mhs as $mhs)
                        <input name="id_krs{{ $baris }}" type="hidden" value="{{ $mhs->idKRS }}">
                        @php
                            $baris++
                        @endphp
                    @endforeach
                    <input name="baris" type="hidden" value="{{ $baris }}">
                    <input name="jadwalKelas" type="hidden" value="{{ $jadwal->idKelasKuliah }}">
                <div class="p-5 text-center">
                    <i data-feather="alert-circle" class="w-16 h-16 text-theme-15 mx-auto mt-3"></i> 
                    <div class="text-3xl mt-5">Proses finalisasi niai?!</div>
                    <div class="text-gray-600 mt-2">
                        Jika nilai sudah difinalisasi maka nilai tidak bisa disunting kembali
                        <br>
                        Tekan Ok untuk memproses, batal untuk membatalkan
                    </div>
                </div>
                <div class="px-5 pb-8 text-center">
                    <button type="button" data-dismiss="modal" class="btn btn-warning w-24 dark:border-dark-5 dark:text-gray-300 mr-1">Batal</button>
                    <button type="submit" class="btn btn-primary w-24">Ok</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- END: finalisasi -->
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