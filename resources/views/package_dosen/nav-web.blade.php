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
            <a href="{{ url('jadwal/now') }}" class="top-menu {{ Request::is('jadwal*')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="calendar"></i> </div>
                <div class="top-menu__title">
                    Jadwal 
                </div>
            </a>
        </li>
        {{-- <li>
            <a href="{{ url('bimbingan') }}" class="top-menu {{ Request::is('bimbingan*')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="users"></i> </div>
                <div class="top-menu__title">
                    Bimbingan KRS
                </div>
            </a>
        </li> --}}
        <li>
            <a href="javascript:;" class="top-menu menu {{ Request::is('mahasiswaBimbingan*')?'top-menu--active':''}}
            || {{ Request::is('bimbingan*')?'top-menu--active':''}}">
                <div class="menu__icon"> <i data-feather="edit"></i> </div>
                <div class="top-menu__title"> Bimbingan <i data-feather="chevron-down" class="top-menu__sub-icon "></i> </div>
            </a>
            <ul class="{{ Request::is('mahasiswaBimbingan')?'top-menu__sub-open':''}} || {{ Request::is('bimbingan')?'top-menu__sub-open':''}}">
                <li>
                    <a href="{{ url('mahasiswaBimbingan') }}" class="top-menu {{ Request::is('mahasiswaBimbingan*')?'top-menu--active':'' }}">
                        <div class="top-menu__icon"> <i data-feather="activity"></i> </div>
                        <div class="top-menu__title"> Mahasiswa BA </div>
                    </a>
                </li>
                <li>
                    <a href="{{ url('bimbingan/now') }}" class="top-menu {{ Request::is('bimbingan*')?'top-menu--active':'' }}">
                        <div class="top-menu__icon"> <i data-feather="activity"></i> </div>
                        <div class="top-menu__title"> Bimbingan KRS  </div>
                    </a>
                </li>
                <li>
                    <a href="{{ url('pembimbingTA') }}" class="top-menu {{ Request::is('bimbinganSkripsi')?'top-menu--active':'' }}">
                        <div class="top-menu__icon"> <i data-feather="activity"></i> </div>
                        <div class="top-menu__title"> Pembimbing TA  </div>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="{{ url('profil') }}" class="top-menu {{ Request::is('profil*')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="user"></i> </div>
                <div class="top-menu__title">
                    Profile
                </div>
            </a>
        </li>
        <li>
            <a href="{{ url('info') }}" class="top-menu {{ Request::is('info*')?'top-menu--active':'' }}">
                <div class="top-menu__icon"> <i data-feather="file-text"></i> </div>
                <div class="top-menu__title">
                    Info
                </div>
            </a>
        </li>
    </ul>
</nav>
<!-- END: Top Menu -->