<!-- BEGIN: Top Menu -->
<nav class="top-nav text-xs bg-primary-6 py-2 mx-16 rounded-bl-xl rounded-br-xl">
    <ul>
        <li>
            <a href="{{ url('dashboard') }}" class="top-menu {{ Request::is('dashboard')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="home"></i> </div>
                <div class="top-menu__title">
                    Dashboard 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('jadwal') }}" class="top-menu {{ Request::is('jadwal')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="calendar"></i> </div>
                <div class="top-menu__title">
                    Jadwal 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('jurnal') }}" class="top-menu {{ Request::is('jurnal*')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="file-text"></i> </div>
                <div class="top-menu__title">
                    Jurnal Perkuliahan
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('rps') }}" class="top-menu {{ Request::is('rps')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="file-text"></i> </div>
                <div class="top-menu__title">
                    RPS 
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('mahasiswa') }}" class="top-menu {{ Request::is('mahasiswa')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="users"></i> </div>
                <div class="top-menu__title">
                    Mahasiswa (PA)
                </div>
            </a>
        </li>
    </ul>
</nav>
<!-- END: Top Menu -->