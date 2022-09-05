@extends('package_dosen.template_dosen')
@section('judul', 'Jadwal')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
@stop
@section('konten')

<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 2xl:col-span-6">
        <div class="grid grid-cols-12 gap-6">
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="mr-2"><strong>Pertemuan ke- </strong></div>
            </div>
            <div class="col-span-12 mt-2 -mb-6 intro-y">
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
                        <tr>
                            <td>1</td>
                            <td>0123</td>
                            <td>Anton</td>
                            <td>
                                <div class="flex flex-col sm:flex-row mt-2">
                                    <div class="form-check mr-2">
                                        <input id="radio-switch-4" class="form-check-input" type="radio" name="horizontal_radio_button" value="horizontal-radio-chris-evans">
                                        <label class="form-check-label" for="radio-switch-4">Hadir</label>
                                    </div>
                                    <div class="form-check mr-2 mt-2 sm:mt-0">
                                        <input id="radio-switch-5" class="form-check-input" type="radio" name="horizontal_radio_button" value="horizontal-radio-liam-neeson">
                                        <label class="form-check-label" for="radio-switch-5">Izin</label>
                                    </div>
                                    <div class="form-check mr-2 mt-2 sm:mt-0">
                                        <input id="radio-switch-6" class="form-check-input" type="radio" name="horizontal_radio_button" value="horizontal-radio-daniel-craig">
                                        <label class="form-check-label" for="radio-switch-6">Sakit</label>
                                    </div>
                                    <div class="form-check mr-2 mt-2 sm:mt-0">
                                        <input id="radio-switch-6" class="form-check-input" type="radio" name="horizontal_radio_button" value="horizontal-radio-daniel-craig">
                                        <label class="form-check-label" for="radio-switch-6">TK</label>
                                    </div>
                                </div>
                            </td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-6">
                <div class="hidden md:block mx-auto"></div>
                <div class="w-full sm:w-auto mt-2 sm:mt-0 sm:ml-auto md:ml-0"><a href="{{url('jurnal')}}" class="btn btn-warning mr-2">Kembali</a><a href="" class="btn btn-primary">Simpan</a></i></a></div>
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