@extends('package_dosen.template_dosen')
@section('judul', 'Bimbingan KRS')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@vite(['resources/css/app.css', 'resources/js/app.js'])
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            <div class="col-span-12 sm:col-span-4 sm:col-start-1 mt-6 sm:ml-8">
                <div class="intro-y box mt-5 lg:mt-0">
                    <div class="relative flex items-center p-5">
                        <div class="w-20 h-20 sm:w-24 sm:h-24 image-fit">
                            @if ($krs->fotoMhs == '-')
                                <img alt="x" class="rounded-full" src="/storage/foto/no_image.jpg">
                            @else
                                <img alt="foto" class="rounded-full" src="/storage/foto/{{ $krs->fotoMhs }}">
                            @endif
                        </div>
                        <div class="ml-4 mr-auto">
                            <div class="font-medium text-base">{{ $krs->nama_mhs }}</div> 
                            <div class="text-gray-600">{{ $krs->npm }}</div>
                            <div class="text-gray-600">{{ $krs->programStudi }}</div>
                            <div class="text-gray-600">Angkatan {{ $krs->angkatan }}</div>
                            <div class="text-gray-600">T.A. {{ $krs->idTahunAkademik }}</div>
                        </div>
                    </div>
                    <div class="p-5 border-t border-gray-200 dark:border-dark-5">
                        <a class="flex items-center text-theme-25 dark:text-theme-22 font-medium" href=""> <i data-feather="activity" class="w-4 h-4 mr-2"></i> Personal Information </a>
                        <a class="flex items-center mt-1" href=""> IP Semester lalu: {{ $ip }}</a>
                        <a class="flex items-center mt-1" href=""> SKS yang bisa diambil: {{ $maxSks }}</a>
                        <a class="flex items-center mt-1" href=""> Total seluruh SKS yang sudah diambil:
                            @foreach ($credits as $c)
                                @if ($krs->npm == $c->npm)
                                    {{ $c->credits }}
                                @endif
                            @endforeach
                        </a>
                    </div>
                    <div class="p-5 border-t border-gray-200 dark:border-dark-5">
                    </div>
                </div>
            </div>
            <div class="col-span-12 sm:col-span-8 sm:col-start-5 col-start-1 sm:mt-8 sm:mr-8 intro-y">
                @if($krs->status == "Ditolak")
                <div class="alert alert-danger show mb-2" role="alert">KRS ditolak karena {{ $krs->pesanBimbingan }}</div>
                @elseif($krs->status == "Diterima")
                <div class="alert alert-success show mb-2" role="alert">KRS diterima {{ $krs->pesanBimbingan }}</div>
                @else
                {{ '' }}
                @endif
                
                <table id="example" class="row-border" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Kode MK</th>
                            <th>Matakuliah</th>
                            <th>Semester</th>
                            <th>Sks</th>
                        </tr>
                    </thead>
                    <tbody> 
                        @foreach ($krsPerMhs as $k)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $k->idMataKuliah }}</td>
                            <td>{{ $k->namaMataKuliah }}</td>
                            <td>{{ $k->semester }}</td>
                            <td class="text-right">{{ $k->totalSKSMK }}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <td class="text-right" colspan="4">Total SKS</td>
                            <td class="text-right">{{ $krsPerMhs->sum('totalSKSMK') }}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="mt-4">
                    @if ($krs->status == "Diterima" | $krs->status =="Ditolak")
                    <a href="/bimbingan/now" class="btn btn-sm btn-warning"><i data-feather="skip-back"></i>Kembali</a>                   
                    @else
                    <a href="/bimbingan/now" class="btn btn-sm btn-warning"><i data-feather="skip-back"></i>Kembali</a> 
                    <a href="javascript:;" data-toggle="modal" data-target="#catatan" class="btn btn-sm btn-danger mt-2"><i data-feather="x"></i>Tolak</a>
                    <a href="javascript:;" data-toggle="modal" data-target="#krsDiterima" class="btn btn-sm btn-success mt-2"><i data-feather="check"></i>Diterima</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<div id="catatan" class="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- BEGIN: Modal Header -->
            <div class="modal-header">
                <h2 class="font-medium text-base mr-auto">Catatan Bimbingan</h2>
            </div> <!-- END: Modal Header -->
            <!-- BEGIN: Modal Body -->
            <form action="/bimbingan/krsDitolak" method="post">
                @csrf
                @php
                    $row=0;
                @endphp
                @foreach ($krsPerMhs as $kpm)
                    <input name="idBim{{ $row }}" type="hidden" value="{{ $kpm->idBimbinganKRS }}">
                    <input name="idKRS{{ $row }}" type="hidden" value="{{ $kpm->idKRS }}">
                    @php $row++ @endphp
                @endforeach
                <input name="row" type="hidden" value="{{ $row }}">
            <div class="modal-body grid grid-cols-12 gap-4 gap-y-3">
                <div class="col-span-12 sm:col-span-12"> <label for="modal-form-1" class="form-label">
                    <h2 class="text-base">Tuliskan catatan penolakan pada kolom di bawah ini!!</h2></label></div>
                <div class="col-span-12 sm:col-span-12"><textarea name="catatan" class="w-full rounded-md" rows="3" placeholder="Catatan bimbingan KRS"></textarea> </div>
            </div> <!-- END: Modal Body -->
            <!-- BEGIN: Modal Footer -->
            <div class="modal-footer text-right">
                <button type="button" data-dismiss="modal" class="inline-block px-6 py-2.5 bg-yellow-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-yellow-600 hover:shadow-lg focus:bg-yellow-600 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-yellow-700 active:shadow-lg transition duration-150 ease-in-out">Cencel</button>
                <button type="Submit" class="inline-block px-6 py-2.5 bg-blue-600 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">Simpan</button>
            </div> <!-- END: Modal Footer -->
            </form>
        </div>
    </div>
</div> <!-- END: Modal Content -->

<div id="krsDiterima" class="modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body p-0">
                <div class="p-5 text-center"> <i data-feather="check-circle" class="w-16 h-16 text-theme-20 mx-auto mt-3"></i>
                    <div class="text-gray-600 mt-2">Pastikan bawha KRS yang diajukan sudah benar dan tepat!</div>
                </div>
                <div class="px-5 pb-8 text-center"> 
                <form action="/bimbingan/krsDiterima" method="post">
                    @csrf
                    @php
                        $baris=0;
                    @endphp
                    @foreach ($krsPerMhs as $diterima)
                        <input name="idBim{{ $baris }}" type="hidden" value="{{ $diterima->idBimbinganKRS }}">
                        <input name="idKRS{{ $baris }}" type="hidden" value="{{ $diterima->idKRS }}">
                        @php
                        $baris++;
                        @endphp
                    @endforeach
                    <input name="baris" type="hidden" value="{{ $baris }}">
                    <button type="button" data-dismiss="modal" class="inline-block px-6 py-2.5 bg-yellow-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-yellow-600 hover:shadow-lg focus:bg-yellow-600 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-yellow-700 active:shadow-lg transition duration-150 ease-in-out">Kembali</button>
                    <button type="submit" class="inline-block px-6 py-2.5 bg-green-500 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-green-600 hover:shadow-lg focus:bg-green-600 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-green-700 active:shadow-lg transition duration-150 ease-in-out">Diterima</button>
                </form>
                </div>
            </div>
        </div>
    </div>
</div> <!-- END: Modal Content -->

@section('js')
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>$(document).ready(function() {
    var table = $('#example').DataTable( {
            paging: false,
            info:false,
            responsive: true,
            scrollX:true
        } )
        .columns.adjust()
        .responsive.recalc();
        } );
</script>
@stop
@endsection