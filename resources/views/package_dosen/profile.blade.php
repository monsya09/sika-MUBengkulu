@extends('package_dosen.template_dosen')
@section('judul', 'Nilai')
@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@stop
@section('konten')
<div class="content content--top-nav ">
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">
            Profile Layout
        </h2>
    </div>
    <!-- BEGIN: Profile Info -->
    <div class="intro-y box px-5 pt-5 mt-5">
        <div class="flex flex-col lg:flex-row border-b border-gray-200 dark:border-dark-5 pb-5 -mx-5">
            <div class="flex flex-1 px-5 items-center justify-center lg:justify-start">
                <div class="w-20 h-20 sm:w-24 sm:h-24 flex-none lg:w-32 lg:h-32 image-fit relative">
                    <img alt="Tinker Tailwind HTML Admin Template" class="rounded-full" src="dist/images/profile-8.jpg">
                </div>
                <div class="ml-5">
                    <div class="w-24 sm:w-40 truncate sm:whitespace-normal font-medium text-lg">Leonardo DiCaprio</div>
                    <div class="text-gray-600">Frontend Engineer</div>
                </div>
            </div>
            <div class="mt-6 lg:mt-0 flex-1 dark:text-gray-300 px-5 border-l border-r border-gray-200 dark:border-dark-5 border-t lg:border-t-0 pt-5 lg:pt-0">
                <div class="font-medium text-center lg:text-left lg:mt-3">Contact Details</div>
                <div class="flex flex-col justify-center items-center lg:items-start mt-4">
                    <div class="truncate sm:whitespace-normal flex items-center"> <i data-feather="mail" class="w-4 h-4 mr-2"></i> leonardodicaprio@left4code.com </div>
                    <div class="truncate sm:whitespace-normal flex items-center mt-3"> <i data-feather="instagram" class="w-4 h-4 mr-2"></i> Instagram Leonardo DiCaprio </div>
                    <div class="truncate sm:whitespace-normal flex items-center mt-3"> <i data-feather="twitter" class="w-4 h-4 mr-2"></i> Twitter Leonardo DiCaprio </div>
                </div>
            </div>
            <div class="mt-6 lg:mt-0 flex-1 flex items-center justify-center px-5 border-t lg:border-0 border-gray-200 dark:border-dark-5 pt-5 lg:pt-0">
                <div class="text-center rounded-md w-20 py-3">
                    <div class="font-medium text-theme-25 dark:text-theme-22 text-xl">201</div>
                    <div class="text-gray-600">Orders</div>
                </div>
                <div class="text-center rounded-md w-20 py-3">
                    <div class="font-medium text-theme-25 dark:text-theme-22 text-xl">1k</div>
                    <div class="text-gray-600">Purchases</div>
                </div>
                <div class="text-center rounded-md w-20 py-3">
                    <div class="font-medium text-theme-25 dark:text-theme-22 text-xl">492</div>
                    <div class="text-gray-600">Reviews</div>
                </div>
            </div>
        </div>
        <div class="nav nav-tabs flex-col sm:flex-row justify-center lg:justify-start" role="tablist">
            <a id="profile-tab" data-toggle="tab" data-target="#profile" href="javascript:;" class="py-4 sm:mr-8 flex items-center active" role="tab" aria-controls="profile" aria-selected="true"> <i class="w-4 h-4 mr-2" data-feather="user"></i> Profile </a>
            <a id="account-tab" data-toggle="tab" data-target="#account" href="javascript:;" class="py-4 sm:mr-8 flex items-center" role="tab" aria-selected="false"> <i class="w-4 h-4 mr-2" data-feather="shield"></i> Account </a>
            <a id="change-password-tab" data-toggle="tab" data-target="#change-password" href="javascript:;" class="py-4 sm:mr-8 flex items-center" role="tab" aria-selected="false"> <i class="w-4 h-4 mr-2" data-feather="lock"></i> Change Password </a>
            <a id="settings-tab" data-toggle="tab" data-target="#settings" href="javascript:;" class="py-4 sm:mr-8 flex items-center" role="tab" aria-selected="false"> <i class="w-4 h-4 mr-2" data-feather="settings"></i> Settings </a>
        </div>
    </div>
    <!-- END: Profile Info -->
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