
<!DOCTYPE html>
<!--
Template Name: Tinker - HTML Admin Dashboard Template
Author: Left4code
Website: http://www.left4code.com/
Contact: muhammadrizki@left4code.com
Purchase: https://themeforest.net/user/left4code/portfolio
Renew Support: https://themeforest.net/user/left4code/portfolio
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<html lang="en" class="light">
    <!-- BEGIN: Head -->
    <head>
        <meta charset="utf-8">
        <link href="dist/images/logo.svg" rel="shortcut icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Tinker admin is super flexible, powerful, clean & modern responsive tailwind admin template with unlimited possibilities.">
        <meta name="keywords" content="admin template, Tinker Admin Template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="LEFT4CODE">
        <title>@yield('judul')</title>
        <!-- BEGIN: CSS Assets-->
        <link rel="stylesheet" href="/dist/css/app.css" />
        @yield('css')
        <!-- END: CSS Assets-->
        <!-- Scripts -->
        {{-- @vite(['resources/css/app.css', 'resources/js/app.js']) --}}
    </head>
    <!-- END: Head -->
    <body class="main">
        @include('package_dosen.nav-mobile')
        @include('package_dosen.top-bar')
        @include('package_dosen.nav-web')
        <!-- BEGIN: Content -->
        <div class="content content--top-nav" style="width: 98%; margin-left: auto; margin-right: auto;">
        @yield('konten')
        </div>
        <!-- END: Content -->
        <!-- BEGIN: JS Assets-->
        <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=["your-google-map-api"]&libraries=places"></script>
        <script>    function random_color() {
            const letters = '0123456789ABCDEF'.split('');
            let color = '#';
    
            for (let i = 0; i < 6; i++) {
                color += letters[Math.round(Math.random() * 15)];
            }
            
            return color;
            }
        </script>
        <script src="/dist/js/app.js"></script>
        @yield('js')
        <!-- END: JS Assets-->
    </body>
</html>