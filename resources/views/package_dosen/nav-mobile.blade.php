<!-- BEGIN: Mobile Menu -->
<div class="mobile-menu mobile-menu--light md:hidden">
    <div class="mobile-menu-bar">
        <a href="" class="flex mr-auto">
            <img class="w-6" src="dist/images/umb.svg">
            <span class="text-white text-lg ml-3"> SIKA<span class="font-medium" style="color: rgb(247, 139, 0);">MU</span> </span>
        </a>
        <a href="javascript:;" id="mobile-menu-toggler"> <i data-feather="bar-chart-2" class="w-8 h-8 text-gray-600 dark:text-white transform -rotate-90"></i> </a>
    </div>
    <ul class="mobile-menu-box py-5 hidden">
        <li>
            <a href="{{ url('dashboard') }}" class="menu {{ Request::is('dashboard')?'menu--active':'' }}">
                <div class="menu__icon"> <i data-feather="home"></i> </div>
                <div class="menu__title">
                    Dashboard 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('jadwal') }}" class="menu {{ Request::is('jadwal')?'menu--active':'' }}">
                <div class="menu__icon"> <i data-feather="calendar"></i> </div>
                <div class="menu__title">
                    Jadwal 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('jurnal') }}" class="menu {{ Request::is('jurnal*')?'menu--active':'' }}">
                <div class="menu__icon"> <i data-feather="file-text"></i> </div>
                <div class="menu__title">
                    Jurnal Perkuliahan
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('rps') }}" class="menu {{ Request::is('rps')?'menu--active':'' }}">
                <div class="menu__icon"> <i data-feather="file-text"></i> </div>
                <div class="menu__title">
                    RPS 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('mahasiswa') }}" class="menu {{ Request::is('mahasiswa')?'menu--active':'' }}">
                <div class="menu__icon"> <i data-feather="users"></i> </div>
                <div class="menu__title">
                    Mahasiswa (PA)
                </div>
            </a>
        </li>
    </ul>
</div>
<!-- END: Mobile Menu -->