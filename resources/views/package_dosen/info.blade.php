{{-- <div class="grid grid-cols-12 gap-6 mt-5">
    <div class="col-span-12 mt-2">
        <input type="text" class="form-control" placeholder="Search..." name="search" id="search"> --}}
        {{-- <input type="text" class="form-controller" id="search" name="search"> --}}
        {{-- @foreach ($info as $i)
        <div class="p-5">
            <div class="text-base font-medium truncate">{{ $i->judul }}</div>
            <div class="text-gray-500 mt-1">{{ $i->updated_at }}</div>
            <div class="text-gray-600 text-justify mt-1">{{ $i->isiPengumuman }}</div>
        </div>
        @endforeach
    </div>
</div> --}}

@extends('package_dosen.template_dosen')
@section('judul', 'Jadwal')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@stop
@section('konten')
<div class="grid grid-cols-12 gap-6 mt-5">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">
            <div class="col-span-12 mt-2 -mb-6 intro-y sm:px-10">
                <table id="example" class="row-border mr-12 mt-12" style="width:100%">
                    <thead>
                        <tr>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($info as $i)
                        <tr>
                            <td>
                                <div class="p-3">
                                    <div class="text-base font-medium truncate">{{ $i->judul }}</div>
                                    <div class="text-gray-500 mt-1">{{ $i->updated_at }}</div>
                                    <div class="text-gray-600 text-justify mt-1">{{ $i->isiPengumuman }}</div>
                                </div>
                            </td>
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
            scrollX:true,
            "ordering": false
        } )
        .columns.adjust()
        .responsive.recalc();
        } );
</script>
<script>
function checkSKS (checkbox, value)
        {
            if (checkbox.checked == true) {
                sksDiambil += value;
                if (sksDiambil > 24)
                Swal.fire({
                    icon: 'error',
                    title: sksDiambil +' SKS',
                    text: 'Jumlah SKS Yang Dipilih Kelebihan',
                    footer: '<a href=""></a>'
                })
                
            } else {
                sksDiambil -= value;
            }
            document.getElementById('terpilih').innerHTML = sksDiambil;
        }
</script>
@stop
@endsection