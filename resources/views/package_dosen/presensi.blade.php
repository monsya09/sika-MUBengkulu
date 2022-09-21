@extends('package_dosen.template_dosen')
@section('judul', 'Jadwal')
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
            <form action="/jurnal/presensi/store" method="post">
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
                            <td>{{ $p->npm }}</td>
                            <td>{{ $p->mahasiswa->nama_mhs }}</td>
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
                                            <label class="form-check-label" for="radio-switch-6">TA</label> 
                                        </div>
                                    </div>
                                    <input name="npm{{ $row }}" type="hidden" value="{{ $p->npm }}">
                            </td>
                            <td><input class="form-control w-52" type="text" name="keterangan{{ $row }}" value="{{ $p->keterangan }}" placeholder="isikan keterangan"></td>
                        </tr>
                        @php $row++ @endphp   
                                               
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-2 sm:mt-0 sm:ml-auto md:ml-0">
                    <a href="{{ URL::previous() }}" class="btn btn-warning mr-2">Kembali</a>
                    <button type="submit" class="btn btn-primary shadow-md">Simpan</button>
                </div>
            </div>
            <input name="row" type="hidden" value="{{$row}}">
            </form>
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
</script>
@stop
@endsection