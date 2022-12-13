@extends('package_dosen.template_dosen')
@section('judul', 'Dashboard')
@section('konten')
<div class="grid grid-cols-12 gap-6 mt-5">
    <!-- BEGIN: Notification -->
    <div class="col-span-12 mt-2 -mb-6 intro-y">
        <div class="alert alert-dismissible show box bg-theme-25 text-white flex items-center mb-6" role="alert">
            <span>
                Tinggalkanlah yang meragukanmu pada apa yang tidak meragukanmu. Sesungguhnya kejujuran lebih menenangkan jiwa, sedangkan dusta (menipu) akan menggelisahkan jiwa (HR. Tirmidzi no. 2518 dan Ahmad 1/200)
            </span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"> <i data-feather="x" class="w-4 h-4"></i> </button>
        </div>
    </div>
    <!-- BEGIN: Notification -->
    <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
        <div class="report-box zoom-in">
            <div class="box p-5">
                <div class="flex">
                    <i data-feather="calendar" class="report-box__icon text-theme-15 dark:text-theme-25"></i> 
                </div>
                <div class="text-base font-medium leading-8 mt-6">
                    <label for="floatingInput" class="text-gray-700">
                        {{ date('d-m-Y', strtotime($jadAkademik->tglUTSMulai)) }} to {{ date('d-m-Y', strtotime($jadAkademik->tglUTSSelesai)) }}
                    </label>
                 </div>
                <div class="text-base text-gray-600 mt-1">Priode perkuliahan</div>
            </div>
        </div>
    </div>
    <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
        <div class="report-box zoom-in">
            <div class="box p-5">
                <div class="flex">
                    <i data-feather="calendar" class="report-box__icon text-theme-20 dark:text-theme-25"></i> 
                </div>
                <div class="text-base font-medium leading-8 mt-6">
                    <label for="floatingInput" class="text-gray-700">
                        {{ date('d-m-Y', strtotime($jadAkademik->tglUTSMulai)) }} to {{ date('d-m-Y', strtotime($jadAkademik->tglUTSSelesai)) }}
                    </label>
                </div>
                <div class="text-base text-gray-600 mt-1">Priode UTS</div>
            </div>
        </div>
    </div>
    <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
        <div class="report-box zoom-in">
            <div class="box p-5">
                <div class="flex">
                    <i data-feather="calendar" class="report-box__icon text-theme-21 dark:text-theme-25"></i> 
                </div>
                <div class="text-base font-medium leading-8 mt-6">
                    <label for="floatingInput" class="text-gray-700">
                        {{ date('d-m-Y', strtotime($jadAkademik->tglUASMulai)) }} to {{ date('d-m-Y', strtotime($jadAkademik->tglUASSelesai)) }}
                    </label>
                </div>
                <div class="text-sm text-gray-600 mt-1">Priode UAS </div>
            </div>
        </div>
    </div>
    <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
        <div class="report-box zoom-in">
            <div class="box p-5">
                <div class="flex">
                    <i data-feather="calendar" class="report-box__icon text-theme-24 dark:text-theme-25"></i> 
                </div>
                <div class="text-base font-medium leading-8 mt-6">
                    <label for="floatingInput" class="text-gray-700">{{ date('d-m-Y', strtotime($jadAkademik->tglPenilaianMulai)) }} to {{ date('d-m-Y', strtotime($jadAkademik->tglPenilaianSelesai)) }}
                    </label>
                </div>
                <div class="text-base text-gray-600 mt-1">Priode Pengisian Nilai</div>
            </div>
        </div>
    </div>
</div>
<div class="grid grid-cols-12 gap-6 mt-8">
    <div class="col-span-12 2xl:col-span-9">
        <div class="grid grid-cols-12 gap-6">           
            <!-- BEGIN: Sales Report -->
            <div class="col-span-12 lg:col-span-6 mt-2">
                <div class="intro-y block sm:flex items-center h-10">
                    <h2 class="text-lg font-medium truncate mr-5">
                        Jumlah Mahasiswa 5 Tahun Terakhir
                    </h2>
                </div>
                <div class="intro-y box p-5 mt-12 sm:mt-2">
                    <div class="shadow-lg rounded-lg overflow-hidden">
                        <div class="py-3 px-5 bg-gray-50">Data Mahasiswa per Angkatan</div>
                        <canvas height="169" class="mt-1" id="chartLine"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-span-12 lg:col-span-6 mt-2">
                <div class="intro-y block sm:flex items-center h-10">
                    <h2 class="text-lg font-medium truncate mr-5">
                        Jumlah Mahasiswa per Prodi TA {{ $ta->idTahunAkademik }}
                    </h2>
                </div>
                <div class="intro-y box p-5 mt-12 sm:mt-2">
                    <div class="shadow-lg rounded-lg overflow-hidden">
                        <div class="py-3 px-5 bg-gray-50">Data Mahasiswa per Prodi TA {{ $ta->idTahunAkademik }}</div>
                        <canvas height="169" class="mt-1" id="chartBar"></canvas>
                    </div>
                </div>
            </div>
            <!-- END: Sales Report -->
            </div>
        </div>
    </div>
</div>

@section('js')
    <!-- Required chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var mhsProdi  = <?php echo $mhsProdi ?>;
    var prodi  = <?php echo $prodi ?>;
    const labelsBarChart = prodi;
  const dataBarChart = {
    labels: labelsBarChart,
    datasets: [
      {
        label: "Jumlah Mahasiswa",
        backgroundColor: "hsl(252, 82.9%, 67.8%)",
        borderColor: "hsl(252, 82.9%, 67.8%)",
        data: mhsProdi,
      },
    ],
  };

  const configBarChart = {
    type: "bar",
    data: dataBarChart,
    options: {},
  };

  var chartBar = new Chart(
    document.getElementById("chartBar"),
    configBarChart
  );
</script>
<script>
    var angkatan = <?php echo $tahunMasuk ?>;
    var mhs = <?php echo $mhsCount ?>;
    const labels = angkatan;
    const data = {
        labels: labels,
        datasets: [
        {
            label: "Jumlah Mahasiswa",
            backgroundColor: "hsl(252, 82.9%, 67.8%)",
            borderColor: "hsl(252, 82.9%, 67.8%)",
            data: mhs,
        },
        ],
    };

    const configLineChart = {
        type: "line",
        data,
        options: {},
    };

    var chartLine = new Chart(
        document.getElementById("chartLine"),
        configLineChart
    );
</script>
@stop
@endsection