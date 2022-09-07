-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Sep 2022 pada 04.25
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikamuv1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `idAgama` int(5) NOT NULL,
  `agama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`idAgama`, `agama`) VALUES
(1, 'Islam'),
(2, 'Kristen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alattransportasi`
--

CREATE TABLE `alattransportasi` (
  `idAlatTransportasi` int(5) NOT NULL,
  `alattransportasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `alattransportasi`
--

INSERT INTO `alattransportasi` (`idAlatTransportasi`, `alattransportasi`) VALUES
(1, 'Motor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahanajar`
--

CREATE TABLE `bahanajar` (
  `idBahanAjar` int(5) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `pertemuanKuliah` int(5) NOT NULL,
  `bahanAjar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbingankrs`
--

CREATE TABLE `bimbingankrs` (
  `idBimbinganKRS` int(5) NOT NULL,
  `idKRS` int(5) NOT NULL,
  `idPembimbingAkademik` int(5) NOT NULL,
  `statusKRS` enum('Disetujui','Tidak Disetujui') NOT NULL,
  `pesanBimbingan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deskripsimatakuliah`
--

CREATE TABLE `deskripsimatakuliah` (
  `idDeskripsiMK` int(5) NOT NULL,
  `idRPS` int(5) NOT NULL,
  `cpl` varchar(1000) NOT NULL,
  `cpmk` varchar(1000) NOT NULL,
  `deskripsiMK` varchar(1000) NOT NULL,
  `pustaka` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(20) NOT NULL,
  `namaDosen` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fotoDosen` varchar(255) NOT NULL,
  `idAgama` int(5) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `idStatus` varchar(5) NOT NULL,
  `jalan` varchar(500) NOT NULL,
  `jkDosen` enum('Laki-laki','Perempuan') NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `kodePos` varchar(10) NOT NULL,
  `nik` varchar(25) NOT NULL,
  `noHP` varchar(25) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `tempatLahir` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nidn`, `namaDosen`, `email`, `fotoDosen`, `idAgama`, `idProgramStudi`, `idStatus`, `jalan`, `jkDosen`, `kecamatan`, `kelurahan`, `kodePos`, `nik`, `noHP`, `npwp`, `rt`, `rw`, `tempatLahir`) VALUES
('0201078501', 'Monsya Juansen', 'monsyajuansen@umb.ac.id', '', 1, '55-201', 'A', 'Jalan-jalan', 'Laki-laki', 'Muara Bangkahulu', 'Bentiring', '36212', '1704030107850027', '0812345678', '123123123', '21', '2', 'Kaur'),
('12345678', 'Imanullah', 'iman@email.com', '', 1, '55-201', 'A', 'Alamat di jalan ini', 'Laki-laki', 'Singaran Pati', 'Timur Indah', '36211', '1704030107850099', '081111111111', '1231111', '1', '2', 'Jember');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `idFakultas` varchar(10) NOT NULL,
  `namaFakultas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`idFakultas`, `namaFakultas`) VALUES
('FT', 'Fakultas Teknik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwalakademik`
--

CREATE TABLE `jadwalakademik` (
  `idJadwalAkademik` int(5) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `tglRegistrasiMulai` date NOT NULL,
  `tglRegistrasiSelesai` date NOT NULL,
  `tglKRSMulai` date NOT NULL,
  `tglKRSSelesai` date NOT NULL,
  `tglUTSMulai` date NOT NULL,
  `tglUTSSelesai` date NOT NULL,
  `tglUASMulai` date NOT NULL,
  `tglUASSelesai` date NOT NULL,
  `tglPenilaianMulai` date NOT NULL,
  `tglPenilaianSelesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenismatakuliah`
--

CREATE TABLE `jenismatakuliah` (
  `idJenisMataKuliah` int(5) NOT NULL,
  `jenisMataKuliah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenismatakuliah`
--

INSERT INTO `jenismatakuliah` (`idJenisMataKuliah`, `jenisMataKuliah`) VALUES
(1, 'Wajib Program Studi'),
(2, 'Wajib Nasional'),
(3, 'Pilihan'),
(4, 'Peminatan'),
(5, 'Tugas Akhir/Skripsi/Tesis/Desirtasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenispresensi`
--

CREATE TABLE `jenispresensi` (
  `idJenisPresensi` varchar(50) NOT NULL,
  `namaPresensi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenispresensi`
--

INSERT INTO `jenispresensi` (`idJenisPresensi`, `namaPresensi`) VALUES
('1', 'Mandiri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenistinggal`
--

CREATE TABLE `jenistinggal` (
  `idJenisTinggal` int(5) NOT NULL,
  `jenistinggal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenistinggal`
--

INSERT INTO `jenistinggal` (`idJenisTinggal`, `jenistinggal`) VALUES
(1, 'Sewa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenisujian`
--

CREATE TABLE `jenisujian` (
  `idJenisUjian` int(5) NOT NULL,
  `namaJenisUjian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnalperkuliahan`
--

CREATE TABLE `jurnalperkuliahan` (
  `id` varchar(10) NOT NULL,
  `pertemuan` int(2) NOT NULL,
  `idKelasKuliah` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `materi` varchar(225) NOT NULL,
  `capaianMateri` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnalperkuliahan`
--

INSERT INTO `jurnalperkuliahan` (`id`, `pertemuan`, `idKelasKuliah`, `tanggal`, `materi`, `capaianMateri`) VALUES
('1', 1, 1, '2022-09-02', 'Pengantar IoT', 'Mahasiswa mengenal apa itu IoT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelaskuliah`
--

CREATE TABLE `kelaskuliah` (
  `idKelasKuliah` int(5) NOT NULL,
  `hariKuliah` varchar(50) NOT NULL,
  `idKelasmhs` int(5) NOT NULL,
  `idLingkupKuliah` int(5) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `idModeKuliah` int(5) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `idRuaganKelas` int(5) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `jamMulaiKuliah` time NOT NULL,
  `jamSelesaiKuliah` time NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `tanggalAkhirEfektif` date NOT NULL,
  `tanggalAwalEfektif` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelaskuliah`
--

INSERT INTO `kelaskuliah` (`idKelasKuliah`, `hariKuliah`, `idKelasmhs`, `idLingkupKuliah`, `idMataKuliah`, `idModeKuliah`, `idProgramStudi`, `idRuaganKelas`, `idTahunAkademik`, `jamMulaiKuliah`, `jamSelesaiKuliah`, `nidn`, `tanggalAkhirEfektif`, `tanggalAwalEfektif`) VALUES
(1, 'Senin', 1, 1, 'WP06114', 2, '55-201', 1, 20212, '09:00:00', '11:30:00', '0201078501', '2022-06-10', '2022-03-03'),
(3, 'Selasa', 1, 1, 'WP06123', 1, '55-201', 1, 20212, '09:00:00', '11:00:00', '0201078501', '2022-06-10', '2022-08-10'),
(4, 'Senin', 1, 1, 'WP06114', 2, '55-201', 1, 20212, '09:00:00', '11:30:00', '12345678', '2022-06-10', '2022-08-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelasmhs`
--

CREATE TABLE `kelasmhs` (
  `idKelasmhs` int(5) NOT NULL,
  `namaKelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelasmhs`
--

INSERT INTO `kelasmhs` (`idKelasmhs`, `namaKelas`) VALUES
(1, '6A'),
(2, '6B'),
(3, '6C'),
(4, '1A'),
(5, '1B'),
(6, '2A'),
(7, '2B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kewarganegaraan`
--

CREATE TABLE `kewarganegaraan` (
  `idKewarganegaraan` int(5) NOT NULL,
  `kewarganegaraan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kewarganegaraan`
--

INSERT INTO `kewarganegaraan` (`idKewarganegaraan`, `kewarganegaraan`) VALUES
(62, 'WNI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `idKHS` int(5) NOT NULL,
  `idKRS` int(5) NOT NULL,
  `idKelasKuliah` int(5) NOT NULL,
  `nilaiPresensi` int(5) NOT NULL,
  `nilaiTugas` int(5) NOT NULL,
  `nilaiUTS` int(5) NOT NULL,
  `nilaiUAS` int(5) NOT NULL,
  `nilaiAkhir` int(5) NOT NULL,
  `gradeNilai` varchar(5) NOT NULL,
  `semester` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `idKRS` int(5) NOT NULL,
  `idKelasKuliah` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`idKRS`, `idKelasKuliah`, `npm`) VALUES
(1, 1, '2'),
(2, 1, '3'),
(3, 4, '4'),
(4, 1, '5'),
(5, 3, '6');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurikulum`
--

CREATE TABLE `kurikulum` (
  `idKurikulum` int(5) NOT NULL,
  `tahunKurikulum` year(4) NOT NULL,
  `namaKurikulum` varchar(255) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `mulaiBerlaku` date NOT NULL,
  `jmlSKSMKPilihan` int(5) NOT NULL,
  `jmlSKSMKWajib` int(5) NOT NULL,
  `jmlSeluruhSKS` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kurikulum`
--

INSERT INTO `kurikulum` (`idKurikulum`, `tahunKurikulum`, `namaKurikulum`, `idProgramStudi`, `mulaiBerlaku`, `jmlSKSMKPilihan`, `jmlSKSMKWajib`, `jmlSeluruhSKS`) VALUES
(1, 2022, 'Kurikulum FT-IF 2022', '55-201', '2022-07-30', 15, 130, 145);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lingkupkuliah`
--

CREATE TABLE `lingkupkuliah` (
  `idLingkupKuliah` int(5) NOT NULL,
  `namaLingkupKuliah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lingkupkuliah`
--

INSERT INTO `lingkupkuliah` (`idLingkupKuliah`, `namaLingkupKuliah`) VALUES
(1, 'internal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(10) NOT NULL,
  `nama_mhs` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tangal_lahir` date NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `idAgama` int(5) NOT NULL,
  `idKewarganegaraan` int(5) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nisn` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `jalan` varchar(500) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `handphone` varchar(20) NOT NULL,
  `dusun` varchar(50) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `idJenisTinggal` int(5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idAlatTransportasi` int(5) NOT NULL,
  `idOrangTuaWali` int(5) NOT NULL,
  `kebutuhanKhusus` enum('Ya','Tidak') NOT NULL,
  `idProgramMhs` varchar(20) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `fotoMhs` varchar(50) NOT NULL,
  `angkatan` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mhs`, `jenis_kelamin`, `tangal_lahir`, `tempat_lahir`, `idAgama`, `idKewarganegaraan`, `nik`, `nisn`, `npwp`, `jalan`, `telephone`, `handphone`, `dusun`, `rt`, `rw`, `kelurahan`, `kecamatan`, `idJenisTinggal`, `email`, `idAlatTransportasi`, `idOrangTuaWali`, `kebutuhanKhusus`, `idProgramMhs`, `idProgramStudi`, `fotoMhs`, `angkatan`) VALUES
('1', 'Nadia Paris Susanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Barat No. 325, Bontang 27540, Jateng', '(+62) 800 5356 7448', '(+62) 449 6081 366', '0', '0', '0', '0', '0', 1, 'zpermata@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('10', 'Shakila Maryati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Suryo No. 998, Pagar Alam 62686, Riau', '0667 9159 097', '(+62) 753 1985 782', '0', '0', '0', '0', '0', 1, 'ega78@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('11', 'Vega Uwais', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Pelajar Pejuang 45 No. 230, Palangka Raya 65451, Babel', '(+62) 337 6589 5736', '(+62) 23 1167 0996', '0', '0', '0', '0', '0', 1, 'yriyanti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('12', 'Irma Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. M.T. Haryono No. 622, Bitung 53857, Aceh', '(+62) 893 595 051', '(+62) 637 2797 8844', '0', '0', '0', '0', '0', 1, 'sakti58@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('13', 'Yuliana Maryati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baladewa No. 563, Palopo 32174, Sumsel', '0426 3808 1424', '0549 9326 4449', '0', '0', '0', '0', '0', 1, 'mayasari.atma@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('14', 'Zelda Rahayu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Basoka Raya No. 213, Ambon 70316, Sultra', '0285 5854 194', '0431 6571 2347', '0', '0', '0', '0', '0', 1, 'ryuliarti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('15', 'Putu Ibrahim Lazuardi S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Cut Nyak Dien No. 953, Cilegon 21733, Sultra', '(+62) 668 0933 2404', '0677 5998 171', '0', '0', '0', '0', '0', 1, 'hidayanto.lembah@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('16', 'Johan Kusuma Prasetya S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Suharso No. 322, Cirebon 20292, Sulbar', '0550 5005 0536', '(+62) 550 8956 313', '0', '0', '0', '0', '0', 1, 'qsaputra@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('17', 'Endra Jaswadi Damanik S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Baladewa No. 227, Administrasi Jakarta Timur 75509, Kalsel', '(+62) 542 3304 857', '0787 0031 486', '0', '0', '0', '0', '0', 1, 'safitri.utama@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('18', 'Titin Wastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bakit  No. 251, Pekanbaru 37755, Sumut', '0433 2945 6231', '(+62) 925 0445 9650', '0', '0', '0', '0', '0', 1, 'zwijayanti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('19', 'Dacin Tampubolon M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Salatiga No. 93, Pekalongan 62165, Kaltara', '0707 4434 029', '0483 9696 3363', '0', '0', '0', '0', '0', 1, 'iriyanti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('2', 'Puti Aisyah Lailasari S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Flora No. 200, Banda Aceh 92979, Bengkulu', '0421 3517 633', '(+62) 352 8407 1289', '0', '0', '0', '0', '0', 1, 'septi.hidayat@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('20', 'Imam Rajata S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Dewi Sartika No. 571, Tual 63609, Jabar', '0245 4253 5630', '0402 6131 0951', '0', '0', '0', '0', '0', 1, 'yhastuti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('21', 'Ratna Yuniar S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Asia Afrika No. 663, Pangkal Pinang 40972, Sulut', '0840 6781 6527', '0429 6850 9611', '0', '0', '0', '0', '0', 1, 'dian50@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('22', 'Cahyono Narpati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jayawijaya No. 650, Sibolga 51501, Bengkulu', '(+62) 996 6279 5127', '0436 8983 7773', '0', '0', '0', '0', '0', 1, 'garda.wijayanti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('23', 'Chandra Zulkarnain S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Teuku Umar No. 317, Administrasi Jakarta Timur 14658, Banten', '0244 7087 191', '(+62) 824 760 801', '0', '0', '0', '0', '0', 1, 'ade.yolanda@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('24', 'Amalia Mardhiyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakau Griya Utama No. 338, Surakarta 80408, Malut', '0991 6464 3865', '(+62) 744 0077 870', '0', '0', '0', '0', '0', 1, 'asirwanda10@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('25', 'Kawaya Jail Napitupulu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Laksamana No. 859, Lubuklinggau 35932, Kalsel', '0981 6674 8348', '(+62) 857 2514 972', '0', '0', '0', '0', '0', 1, 'pwasita@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('26', 'Kenes Hardiansyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tambak No. 905, Langsa 10642, Malut', '(+62) 911 9722 3494', '0419 3123 468', '0', '0', '0', '0', '0', 1, 'anastasia.safitri@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('27', 'Zizi Lestari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Raden No. 612, Palopo 51672, Bengkulu', '(+62) 342 2762 5293', '0299 8805 7857', '0', '0', '0', '0', '0', 1, 'fitria.yuniar@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('28', 'Wani Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baan No. 114, Lhokseumawe 54608, Sumsel', '(+62) 541 4409 674', '0713 6689 048', '0', '0', '0', '0', '0', 1, 'bakiono19@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('29', 'Michelle Kasiyah Wijayanti S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Muwardi No. 490, Sabang 66323, Sulsel', '(+62) 26 1922 072', '(+62) 601 4867 0052', '0', '0', '0', '0', '0', 1, 'jaka.pratama@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('3', 'Vinsen Drajat Sitompul S.IP', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gardujati No. 954, Tual 90338, Pabar', '0835 6405 463', '0427 0463 5096', '0', '0', '0', '0', '0', 1, 'timbul07@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('30', 'Jail Daliman Halim S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Suniaraja No. 998, Depok 51747, Aceh', '(+62) 642 9793 556', '(+62) 961 8402 052', '0', '0', '0', '0', '0', 1, 'znababan@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('31', 'Jail Reksa Tampubolon S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cikutra Barat No. 824, Tomohon 57811, Aceh', '(+62) 992 1634 0711', '(+62) 862 9862 0200', '0', '0', '0', '0', '0', 1, 'radika.padmasari@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('32', 'Wisnu Wahyudin S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Pasirkoja No. 718, Payakumbuh 44981, NTT', '(+62) 810 1651 5185', '(+62) 982 4677 8438', '0', '0', '0', '0', '0', 1, 'spuspita@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('33', 'Surya Nainggolan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sentot Alibasa No. 905, Cimahi 49853, Papua', '(+62) 542 5346 290', '0746 8046 800', '0', '0', '0', '0', '0', 1, 'kayla20@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('34', 'Halim Adriansyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Babadan No. 34, Tebing Tinggi 10083, Jabar', '0586 9431 7994', '(+62) 402 6546 557', '0', '0', '0', '0', '0', 1, 'carla.prastuti@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('35', 'Oni Hassanah S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. PHH. Mustofa No. 897, Prabumulih 37817, Kepri', '(+62) 491 2343 929', '0705 3262 379', '0', '0', '0', '0', '0', 1, 'iuyainah@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('36', 'Salimah Betania Purwanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Suryo No. 433, Tegal 80526, Kepri', '0680 2075 8252', '(+62) 637 6833 8866', '0', '0', '0', '0', '0', 1, 'rhutasoit@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('37', 'Gaduh Banara Saragih M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sumpah Pemuda No. 139, Palu 93065, Kepri', '0265 1632 1397', '024 1417 6252', '0', '0', '0', '0', '0', 1, 'budiman.laras@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('38', 'Mujur Jailani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Umalas No. 514, Pangkal Pinang 61995, Sulteng', '(+62) 823 5182 7778', '(+62) 616 6380 4924', '0', '0', '0', '0', '0', 1, 'hpurnawati@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('39', 'Zelaya Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bakau No. 770, Lhokseumawe 38735, Gorontalo', '0451 3022 797', '(+62) 633 0641 696', '0', '0', '0', '0', '0', 1, 'osantoso@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('4', 'Kenari Saragih S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Ir. H. Juanda No. 493, Sungai Penuh 95830, Sumut', '0802 7878 1009', '(+62) 918 1153 064', '0', '0', '0', '0', '0', 1, 'darmanto.melani@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('40', 'Edi Saragih', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. S. Parman No. 184, Bontang 68681, Kaltara', '0286 2308 2291', '0708 1116 946', '0', '0', '0', '0', '0', 1, 'klazuardi@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('41', 'Baktiadi Nalar Jailani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Labu No. 636, Medan 92254, DIY', '0864 4582 156', '(+62) 594 3652 0141', '0', '0', '0', '0', '0', 1, 'salman12@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('42', 'Jatmiko Anggabaya Suwarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Soekarno Hatta No. 852, Madiun 66222, Kaltara', '0938 4399 6482', '0375 2218 398', '0', '0', '0', '0', '0', 1, 'hwinarsih@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('43', 'Cager Candrakanta Tampubolon S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. BKR No. 794, Palu 69021, Sulteng', '0647 1182 9625', '022 4500 523', '0', '0', '0', '0', '0', 1, 'hakim.yosef@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('44', 'Elisa Pratiwi S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Badak No. 755, Cimahi 78642, Bali', '0523 6435 861', '0441 4984 7227', '0', '0', '0', '0', '0', 1, 'farida.capa@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('45', 'Widya Hasanah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Orang No. 96, Bitung 56059, Babel', '(+62) 409 1971 8534', '0804 964 192', '0', '0', '0', '0', '0', 1, 'hutasoit.nova@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('46', 'Hartaka Dabukke M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bakau No. 16, Kendari 13067, Malut', '0383 3980 874', '(+62) 455 2586 5253', '0', '0', '0', '0', '0', 1, 'patricia.pratiwi@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('47', 'Irma Hariyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ir. H. Juanda No. 624, Kupang 13089, Kalbar', '0371 9303 124', '(+62) 565 4827 393', '0', '0', '0', '0', '0', 1, 'nurdiyanti.cindy@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('48', 'Syahrini Suryatmi M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Gegerkalong Hilir No. 759, Banda Aceh 84819, Maluku', '0972 8676 0782', '0358 0804 6400', '0', '0', '0', '0', '0', 1, 'asuwarno@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('49', 'Yunita Elvina Yuliarti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kyai Gede No. 681, Administrasi Jakarta Selatan 14495, Kalsel', '(+62) 808 6044 411', '0441 1792 6530', '0', '0', '0', '0', '0', 1, 'opan38@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('5', 'Fathonah Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baha No. 603, Pariaman 22529, Sulsel', '0217 3672 8352', '0264 7091 1693', '0', '0', '0', '0', '0', 1, 'ipratiwi@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('50', 'Galak Wijaya', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Gambang No. 921, Denpasar 46293, Kalbar', '(+62) 559 9749 399', '(+62) 761 1375 8179', '0', '0', '0', '0', '0', 1, 'fsitompul@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('6', 'Septi Yolanda S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Cikutra Timur No. 180, Bogor 36303, Sulteng', '0235 9332 679', '0532 7340 445', '0', '0', '0', '0', '0', 1, 'iwahyuni@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('7', 'Surya Saefullah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Rajawali Barat No. 876, Padang 35632, Sumbar', '0688 6655 3416', '(+62) 369 8104 3347', '0', '0', '0', '0', '0', 1, 'cawuk.prasetyo@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('8', 'Michelle Samiah Haryanti M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bara No. 438, Tomohon 30881, Sumsel', '(+62) 967 2625 5768', '(+62) 939 5904 105', '0', '0', '0', '0', '0', 1, 'kartika95@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('9', 'Garang Narpati S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baladewa No. 646, Tomohon 83772, Papua', '(+62) 422 8423 904', '0786 3239 4148', '0', '0', '0', '0', '0', 1, 'uli.haryanto@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022);

-- --------------------------------------------------------

--
-- Struktur dari tabel `masterbiaya`
--

CREATE TABLE `masterbiaya` (
  `idMasterBiaya` int(5) NOT NULL,
  `idNamaBiaya` int(5) NOT NULL,
  `sesiBiaya` int(5) NOT NULL,
  `Biaya` int(20) NOT NULL,
  `tglMulaiPembiayaan` date NOT NULL,
  `tglSelesaiPembiayaan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `idMataKuliah` varchar(20) NOT NULL,
  `idKurikulum` int(5) NOT NULL,
  `semester` int(5) NOT NULL,
  `namaMataKuliah` varchar(255) NOT NULL,
  `idJenisMataKuliah` int(5) NOT NULL,
  `statusSyarat` enum('Ya','Tidak') NOT NULL,
  `idMataKuliahPrasyarat` int(5) DEFAULT NULL,
  `totalSKSMK` int(5) NOT NULL,
  `sksTatapMuka` int(5) NOT NULL,
  `sksPraktikum` int(5) DEFAULT NULL,
  `sksPraktekLapangan` int(5) DEFAULT NULL,
  `sksSimulasi` int(5) DEFAULT NULL,
  `modePembelajaran` enum('Online','Offline','Campuran') NOT NULL,
  `tglEfektif` date DEFAULT NULL,
  `tglAkhirEfektif` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`idMataKuliah`, `idKurikulum`, `semester`, `namaMataKuliah`, `idJenisMataKuliah`, `statusSyarat`, `idMataKuliahPrasyarat`, `totalSKSMK`, `sksTatapMuka`, `sksPraktikum`, `sksPraktekLapangan`, `sksSimulasi`, `modePembelajaran`, `tglEfektif`, `tglAkhirEfektif`) VALUES
('WP06114', 1, 2, 'PENGANTAR SISTEM DIGITAL', 1, 'Ya', 0, 3, 3, NULL, NULL, NULL, 'Offline', NULL, NULL),
('WP06123', 1, 1, 'TEORI BAHASA DAN AUTOMATA', 1, 'Tidak', NULL, 3, 3, NULL, NULL, NULL, 'Offline', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliahprasyarat`
--

CREATE TABLE `matakuliahprasyarat` (
  `idMataKuliahPrasyarat` int(5) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `idMataKuliahSyarat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matakuliahprasyarat`
--

INSERT INTO `matakuliahprasyarat` (`idMataKuliahPrasyarat`, `idMataKuliah`, `idMataKuliahSyarat`) VALUES
(3, 'WP06114', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliahsyarat`
--

CREATE TABLE `matakuliahsyarat` (
  `idMataKuliahSyarat` int(5) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `nilaiMinimum` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matakuliahsyarat`
--

INSERT INTO `matakuliahsyarat` (`idMataKuliahSyarat`, `idMataKuliah`, `nilaiMinimum`) VALUES
(2, 'WP06123', '80');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modekuliah`
--

CREATE TABLE `modekuliah` (
  `idModeKuliah` int(5) NOT NULL,
  `modeKuliah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `modekuliah`
--

INSERT INTO `modekuliah` (`idModeKuliah`, `modeKuliah`) VALUES
(1, 'online'),
(2, 'offline');

-- --------------------------------------------------------

--
-- Struktur dari tabel `namabiaya`
--

CREATE TABLE `namabiaya` (
  `idNamaBiaya` int(5) NOT NULL,
  `namaBiaya` varchar(255) NOT NULL,
  `jmlSesiBiaya` int(5) NOT NULL,
  `jmlTotalBiaya` int(20) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `idProgramMhs` varchar(20) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orangtuawali`
--

CREATE TABLE `orangtuawali` (
  `idOrangTuaWali` int(5) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tangalLahir` date NOT NULL,
  `idPendidikanOrtu` int(5) NOT NULL,
  `idPekerjaanOrtu` int(5) NOT NULL,
  `idPenghasilanOrtu` int(5) NOT NULL,
  `status` enum('Ayah','Ibu','Wali') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orangtuawali`
--

INSERT INTO `orangtuawali` (`idOrangTuaWali`, `nik`, `nama`, `tangalLahir`, `idPendidikanOrtu`, `idPekerjaanOrtu`, `idPenghasilanOrtu`, `status`) VALUES
(1, '1704030107850099', 'Budi', '1978-08-03', 1, 1, 1, 'Wali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pekerjaanortu`
--

CREATE TABLE `pekerjaanortu` (
  `idPekerjaanOrtu` int(5) NOT NULL,
  `pekerjaanOrtu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pekerjaanortu`
--

INSERT INTO `pekerjaanortu` (`idPekerjaanOrtu`, `pekerjaanOrtu`) VALUES
(1, 'Tani');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idPembayaran` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `idMasterBiaya` int(5) NOT NULL,
  `totalNominal` int(20) DEFAULT NULL,
  `kodeBank` varchar(20) DEFAULT NULL,
  `kodeChannel` varchar(20) DEFAULT NULL,
  `kodeTerminal` varchar(20) DEFAULT NULL,
  `nomorPembayaran` varchar(20) DEFAULT NULL,
  `tanggalTransaksi` date DEFAULT NULL,
  `nomorJurnalPembukuan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembimbingakademik`
--

CREATE TABLE `pembimbingakademik` (
  `idPembimbingAkademik` int(5) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `npm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembimbingta`
--

CREATE TABLE `pembimbingta` (
  `idPembimbingTA` int(5) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `statusPembimbingTA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendidikanortu`
--

CREATE TABLE `pendidikanortu` (
  `idPendidikanOrtu` int(5) NOT NULL,
  `pendidikan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pendidikanortu`
--

INSERT INTO `pendidikanortu` (`idPendidikanOrtu`, `pendidikan`) VALUES
(1, 'S1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penghasilanortu`
--

CREATE TABLE `penghasilanortu` (
  `idPenghasilanOrtu` int(5) NOT NULL,
  `penghasilan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penghasilanortu`
--

INSERT INTO `penghasilanortu` (`idPenghasilanOrtu`, `penghasilan`) VALUES
(1, '5000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `idPengumuman` int(5) NOT NULL,
  `isiPengumuman` varchar(500) NOT NULL,
  `tujuan` enum('Mahasiswa','Dosen','Prodi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensidosen`
--

CREATE TABLE `presensidosen` (
  `idPresensiDosen` int(5) NOT NULL,
  `idDeskripsiMK` int(5) NOT NULL,
  `idJenisPresensi` varchar(50) NOT NULL,
  `idKelasKuliah` int(5) NOT NULL,
  `imgPresensi` varchar(50) NOT NULL,
  `jamMulai` time NOT NULL,
  `jamSelesai` time NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `pertemuan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensimhs`
--

CREATE TABLE `presensimhs` (
  `idPresensiMhs` int(5) NOT NULL,
  `idJenisPresensi` varchar(50) NOT NULL,
  `idKRS` int(5) DEFAULT NULL,
  `kehadiran` int(1) NOT NULL,
  `imgPresensi` varchar(50) NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `presensimhs`
--

INSERT INTO `presensimhs` (`idPresensiMhs`, `idJenisPresensi`, `idKRS`, `kehadiran`, `imgPresensi`, `latitude`, `longitude`) VALUES
(2, '1', 1, 1, 'jj.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `programmhs`
--

CREATE TABLE `programmhs` (
  `idProgramMhs` varchar(20) NOT NULL,
  `namaProgram` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `programmhs`
--

INSERT INTO `programmhs` (`idProgramMhs`, `namaProgram`) VALUES
('1', 'S1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `programstudi`
--

CREATE TABLE `programstudi` (
  `idProgramStudi` varchar(10) NOT NULL,
  `programStudi` varchar(255) NOT NULL,
  `idFakultas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `programstudi`
--

INSERT INTO `programstudi` (`idProgramStudi`, `programStudi`, `idFakultas`) VALUES
('55-201', 'Teknik Informatika', 'FT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registrasimhs`
--

CREATE TABLE `registrasimhs` (
  `idRegistrasiMhs` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `statusRegistrasi` enum('Registrasi','Belum Registrasi') NOT NULL DEFAULT 'Belum Registrasi',
  `tglRegistrasi` date NOT NULL,
  `idStatus` varchar(5) NOT NULL DEFAULT 'TA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayatbimbinganta`
--

CREATE TABLE `riwayatbimbinganta` (
  `idRiwayatTA` int(5) NOT NULL,
  `idTugasAkhir` int(5) NOT NULL,
  `tanggalBimbingan` date NOT NULL,
  `komentar` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rps`
--

CREATE TABLE `rps` (
  `idRPS` int(5) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `dokumenRPS` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangankelas`
--

CREATE TABLE `ruangankelas` (
  `idRuaganKelas` int(5) NOT NULL,
  `kapasitasRuangan` int(5) NOT NULL,
  `lantai` int(5) NOT NULL,
  `letakKampus` varchar(50) NOT NULL,
  `namaGedung` varchar(50) NOT NULL,
  `namaRuangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ruangankelas`
--

INSERT INTO `ruangankelas` (`idRuaganKelas`, `kapasitasRuangan`, `lantai`, `letakKampus`, `namaGedung`, `namaRuangan`) VALUES
(1, 36, 2, 'Kampus 1', 'Gedung C', 'Lab MM2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `idStatus` varchar(5) NOT NULL,
  `statusMhs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `status`
--

INSERT INTO `status` (`idStatus`, `statusMhs`) VALUES
('A', 'Aktif'),
('C', 'Cuti'),
('TA', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statustamhs`
--

CREATE TABLE `statustamhs` (
  `idStatusTA` int(5) NOT NULL,
  `idRiwayatTA` int(5) NOT NULL,
  `idJenisUjian` int(5) NOT NULL,
  `kelayakan` varchar(20) NOT NULL,
  `idPembimbingTA` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahunakademik`
--

CREATE TABLE `tahunakademik` (
  `idTahunAkademik` int(5) NOT NULL,
  `semesterAkademik` enum('Ganjil','Genap') NOT NULL,
  `namaSemester` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tahunakademik`
--

INSERT INTO `tahunakademik` (`idTahunAkademik`, `semesterAkademik`, `namaSemester`) VALUES
(20212, 'Genap', 'Genap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transkrip`
--

CREATE TABLE `transkrip` (
  `idTranskrip` int(5) NOT NULL,
  `idKHS` int(5) NOT NULL,
  `ip` int(5) NOT NULL,
  `totalSKS` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugasakhir`
--

CREATE TABLE `tugasakhir` (
  `idTugasAkhir` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `idPembimbingTA` int(5) NOT NULL,
  `judul` varchar(500) NOT NULL,
  `fileTA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Monsya Juansen', 'monsyajuansen@umb.ac.id', NULL, '$2y$10$0B1hPLxdBlxeT7eu3DosIu5gNMtvhkdcCbmhmcEYPz3SnGY06aEm6', NULL, '2022-08-14 19:19:14', '2022-08-14 19:19:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`idAgama`);

--
-- Indeks untuk tabel `alattransportasi`
--
ALTER TABLE `alattransportasi`
  ADD PRIMARY KEY (`idAlatTransportasi`);

--
-- Indeks untuk tabel `bahanajar`
--
ALTER TABLE `bahanajar`
  ADD PRIMARY KEY (`idBahanAjar`),
  ADD KEY `idMataKuliah` (`idMataKuliah`);

--
-- Indeks untuk tabel `bimbingankrs`
--
ALTER TABLE `bimbingankrs`
  ADD PRIMARY KEY (`idBimbinganKRS`),
  ADD KEY `idKRS` (`idKRS`),
  ADD KEY `idPembimbingAkademik` (`idPembimbingAkademik`);

--
-- Indeks untuk tabel `deskripsimatakuliah`
--
ALTER TABLE `deskripsimatakuliah`
  ADD PRIMARY KEY (`idDeskripsiMK`),
  ADD KEY `idRPS` (`idRPS`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`),
  ADD KEY `idAgama` (`idAgama`),
  ADD KEY `idProgramStudi` (`idProgramStudi`),
  ADD KEY `idStatus` (`idStatus`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`idFakultas`);

--
-- Indeks untuk tabel `jadwalakademik`
--
ALTER TABLE `jadwalakademik`
  ADD PRIMARY KEY (`idJadwalAkademik`),
  ADD KEY `idProgramStudi` (`idProgramStudi`),
  ADD KEY `idTahunAkademik` (`idTahunAkademik`);

--
-- Indeks untuk tabel `jenismatakuliah`
--
ALTER TABLE `jenismatakuliah`
  ADD PRIMARY KEY (`idJenisMataKuliah`);

--
-- Indeks untuk tabel `jenispresensi`
--
ALTER TABLE `jenispresensi`
  ADD PRIMARY KEY (`idJenisPresensi`);

--
-- Indeks untuk tabel `jenistinggal`
--
ALTER TABLE `jenistinggal`
  ADD PRIMARY KEY (`idJenisTinggal`);

--
-- Indeks untuk tabel `jenisujian`
--
ALTER TABLE `jenisujian`
  ADD PRIMARY KEY (`idJenisUjian`);

--
-- Indeks untuk tabel `jurnalperkuliahan`
--
ALTER TABLE `jurnalperkuliahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelaskuliah`
--
ALTER TABLE `kelaskuliah`
  ADD PRIMARY KEY (`idKelasKuliah`),
  ADD KEY `idKelasmhs` (`idKelasmhs`),
  ADD KEY `idLingkupKuliah` (`idLingkupKuliah`),
  ADD KEY `idModeKuliah` (`idModeKuliah`),
  ADD KEY `idProgramStudi` (`idProgramStudi`),
  ADD KEY `idTahunAkademik` (`idTahunAkademik`),
  ADD KEY `idMataKuliah` (`idMataKuliah`),
  ADD KEY `idRuangKelas` (`idRuaganKelas`),
  ADD KEY `nidn` (`nidn`);

--
-- Indeks untuk tabel `kelasmhs`
--
ALTER TABLE `kelasmhs`
  ADD PRIMARY KEY (`idKelasmhs`);

--
-- Indeks untuk tabel `kewarganegaraan`
--
ALTER TABLE `kewarganegaraan`
  ADD PRIMARY KEY (`idKewarganegaraan`);

--
-- Indeks untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`idKHS`),
  ADD KEY `idKelasKuliah` (`idKelasKuliah`),
  ADD KEY `idKRS` (`idKRS`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`idKRS`),
  ADD KEY `npm` (`npm`),
  ADD KEY `idKelasKuliah` (`idKelasKuliah`);

--
-- Indeks untuk tabel `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`idKurikulum`),
  ADD KEY `idProgramStudi` (`idProgramStudi`);

--
-- Indeks untuk tabel `lingkupkuliah`
--
ALTER TABLE `lingkupkuliah`
  ADD PRIMARY KEY (`idLingkupKuliah`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`),
  ADD KEY `idAgama` (`idAgama`),
  ADD KEY `idKewarganegaraan` (`idKewarganegaraan`),
  ADD KEY `idJenisTinggal` (`idJenisTinggal`),
  ADD KEY `idAlatTransportasi` (`idAlatTransportasi`),
  ADD KEY `idOrangTuaWali` (`idOrangTuaWali`),
  ADD KEY `idProgramMhs` (`idProgramMhs`),
  ADD KEY `idProgramStudi` (`idProgramStudi`);

--
-- Indeks untuk tabel `masterbiaya`
--
ALTER TABLE `masterbiaya`
  ADD PRIMARY KEY (`idMasterBiaya`),
  ADD KEY `idNamaBiaya` (`idNamaBiaya`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`idMataKuliah`),
  ADD KEY `idKurikulum` (`idKurikulum`),
  ADD KEY `idJenisMataKuliah` (`idJenisMataKuliah`);

--
-- Indeks untuk tabel `matakuliahprasyarat`
--
ALTER TABLE `matakuliahprasyarat`
  ADD PRIMARY KEY (`idMataKuliahPrasyarat`),
  ADD KEY `idMataKuliah` (`idMataKuliah`),
  ADD KEY `idMataKuliahSyarat` (`idMataKuliahSyarat`);

--
-- Indeks untuk tabel `matakuliahsyarat`
--
ALTER TABLE `matakuliahsyarat`
  ADD PRIMARY KEY (`idMataKuliahSyarat`),
  ADD KEY `idMataKuliah` (`idMataKuliah`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modekuliah`
--
ALTER TABLE `modekuliah`
  ADD PRIMARY KEY (`idModeKuliah`);

--
-- Indeks untuk tabel `namabiaya`
--
ALTER TABLE `namabiaya`
  ADD PRIMARY KEY (`idNamaBiaya`),
  ADD KEY `idProgramMhs` (`idProgramMhs`),
  ADD KEY `idProgramStudi` (`idProgramStudi`),
  ADD KEY `idTahunAkademik` (`idTahunAkademik`);

--
-- Indeks untuk tabel `orangtuawali`
--
ALTER TABLE `orangtuawali`
  ADD PRIMARY KEY (`idOrangTuaWali`),
  ADD KEY `idPendidikanOrtu` (`idPendidikanOrtu`),
  ADD KEY `idPekerjaanOrtu` (`idPekerjaanOrtu`),
  ADD KEY `idPenghasilanOrtu` (`idPenghasilanOrtu`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pekerjaanortu`
--
ALTER TABLE `pekerjaanortu`
  ADD PRIMARY KEY (`idPekerjaanOrtu`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idPembayaran`),
  ADD KEY `idMasterBiaya` (`idMasterBiaya`),
  ADD KEY `npm` (`npm`);

--
-- Indeks untuk tabel `pembimbingakademik`
--
ALTER TABLE `pembimbingakademik`
  ADD PRIMARY KEY (`idPembimbingAkademik`),
  ADD KEY `npm` (`npm`),
  ADD KEY `nidn` (`nidn`);

--
-- Indeks untuk tabel `pembimbingta`
--
ALTER TABLE `pembimbingta`
  ADD PRIMARY KEY (`idPembimbingTA`);

--
-- Indeks untuk tabel `pendidikanortu`
--
ALTER TABLE `pendidikanortu`
  ADD PRIMARY KEY (`idPendidikanOrtu`);

--
-- Indeks untuk tabel `penghasilanortu`
--
ALTER TABLE `penghasilanortu`
  ADD PRIMARY KEY (`idPenghasilanOrtu`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`idPengumuman`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `presensidosen`
--
ALTER TABLE `presensidosen`
  ADD PRIMARY KEY (`idPresensiDosen`),
  ADD KEY `idDeskripsiMK` (`idDeskripsiMK`),
  ADD KEY `idJenisPresensi` (`idJenisPresensi`),
  ADD KEY `idKelasKuliah` (`idKelasKuliah`);

--
-- Indeks untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  ADD PRIMARY KEY (`idPresensiMhs`),
  ADD KEY `idKelasKuliah` (`idKRS`),
  ADD KEY `idJenisPresensi` (`idJenisPresensi`);

--
-- Indeks untuk tabel `programmhs`
--
ALTER TABLE `programmhs`
  ADD PRIMARY KEY (`idProgramMhs`);

--
-- Indeks untuk tabel `programstudi`
--
ALTER TABLE `programstudi`
  ADD PRIMARY KEY (`idProgramStudi`),
  ADD KEY `idFakultas` (`idFakultas`);

--
-- Indeks untuk tabel `registrasimhs`
--
ALTER TABLE `registrasimhs`
  ADD PRIMARY KEY (`idRegistrasiMhs`),
  ADD KEY `idTahunAkademik` (`idTahunAkademik`),
  ADD KEY `idStatusMhs` (`idStatus`),
  ADD KEY `npm` (`npm`);

--
-- Indeks untuk tabel `riwayatbimbinganta`
--
ALTER TABLE `riwayatbimbinganta`
  ADD PRIMARY KEY (`idRiwayatTA`),
  ADD KEY `idTugasAkhir` (`idTugasAkhir`);

--
-- Indeks untuk tabel `rps`
--
ALTER TABLE `rps`
  ADD PRIMARY KEY (`idRPS`),
  ADD KEY `idMataKuliah` (`idMataKuliah`);

--
-- Indeks untuk tabel `ruangankelas`
--
ALTER TABLE `ruangankelas`
  ADD PRIMARY KEY (`idRuaganKelas`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indeks untuk tabel `statustamhs`
--
ALTER TABLE `statustamhs`
  ADD PRIMARY KEY (`idStatusTA`),
  ADD KEY `idJenisUjian` (`idJenisUjian`),
  ADD KEY `idPembimbingTA` (`idPembimbingTA`),
  ADD KEY `idRiwayatTA` (`idRiwayatTA`);

--
-- Indeks untuk tabel `tahunakademik`
--
ALTER TABLE `tahunakademik`
  ADD PRIMARY KEY (`idTahunAkademik`);

--
-- Indeks untuk tabel `transkrip`
--
ALTER TABLE `transkrip`
  ADD KEY `idKHS` (`idKHS`);

--
-- Indeks untuk tabel `tugasakhir`
--
ALTER TABLE `tugasakhir`
  ADD PRIMARY KEY (`idTugasAkhir`),
  ADD KEY `idPembimbingTA` (`idPembimbingTA`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `idAgama` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bahanajar`
--
ALTER TABLE `bahanajar`
  MODIFY `idBahanAjar` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bimbingankrs`
--
ALTER TABLE `bimbingankrs`
  MODIFY `idBimbinganKRS` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deskripsimatakuliah`
--
ALTER TABLE `deskripsimatakuliah`
  MODIFY `idDeskripsiMK` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwalakademik`
--
ALTER TABLE `jadwalakademik`
  MODIFY `idJadwalAkademik` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenismatakuliah`
--
ALTER TABLE `jenismatakuliah`
  MODIFY `idJenisMataKuliah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jenisujian`
--
ALTER TABLE `jenisujian`
  MODIFY `idJenisUjian` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelaskuliah`
--
ALTER TABLE `kelaskuliah`
  MODIFY `idKelasKuliah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kelasmhs`
--
ALTER TABLE `kelasmhs`
  MODIFY `idKelasmhs` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `khs`
--
ALTER TABLE `khs`
  MODIFY `idKHS` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `idKRS` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `idKurikulum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lingkupkuliah`
--
ALTER TABLE `lingkupkuliah`
  MODIFY `idLingkupKuliah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `masterbiaya`
--
ALTER TABLE `masterbiaya`
  MODIFY `idMasterBiaya` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `matakuliahprasyarat`
--
ALTER TABLE `matakuliahprasyarat`
  MODIFY `idMataKuliahPrasyarat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `matakuliahsyarat`
--
ALTER TABLE `matakuliahsyarat`
  MODIFY `idMataKuliahSyarat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `modekuliah`
--
ALTER TABLE `modekuliah`
  MODIFY `idModeKuliah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `namabiaya`
--
ALTER TABLE `namabiaya`
  MODIFY `idNamaBiaya` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `idPembayaran` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembimbingakademik`
--
ALTER TABLE `pembimbingakademik`
  MODIFY `idPembimbingAkademik` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembimbingta`
--
ALTER TABLE `pembimbingta`
  MODIFY `idPembimbingTA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `idPengumuman` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensidosen`
--
ALTER TABLE `presensidosen`
  MODIFY `idPresensiDosen` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  MODIFY `idPresensiMhs` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `registrasimhs`
--
ALTER TABLE `registrasimhs`
  MODIFY `idRegistrasiMhs` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayatbimbinganta`
--
ALTER TABLE `riwayatbimbinganta`
  MODIFY `idRiwayatTA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rps`
--
ALTER TABLE `rps`
  MODIFY `idRPS` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `statustamhs`
--
ALTER TABLE `statustamhs`
  MODIFY `idStatusTA` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tugasakhir`
--
ALTER TABLE `tugasakhir`
  MODIFY `idTugasAkhir` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bahanajar`
--
ALTER TABLE `bahanajar`
  ADD CONSTRAINT `bahanajar_ibfk_1` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`);

--
-- Ketidakleluasaan untuk tabel `bimbingankrs`
--
ALTER TABLE `bimbingankrs`
  ADD CONSTRAINT `bimbingankrs_ibfk_1` FOREIGN KEY (`idKRS`) REFERENCES `krs` (`idKRS`),
  ADD CONSTRAINT `bimbingankrs_ibfk_2` FOREIGN KEY (`idPembimbingAkademik`) REFERENCES `pembimbingakademik` (`idPembimbingAkademik`);

--
-- Ketidakleluasaan untuk tabel `deskripsimatakuliah`
--
ALTER TABLE `deskripsimatakuliah`
  ADD CONSTRAINT `deskripsimatakuliah_ibfk_1` FOREIGN KEY (`idRPS`) REFERENCES `rps` (`idRPS`);

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`idAgama`) REFERENCES `agama` (`idAgama`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`),
  ADD CONSTRAINT `dosen_ibfk_3` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`);

--
-- Ketidakleluasaan untuk tabel `jadwalakademik`
--
ALTER TABLE `jadwalakademik`
  ADD CONSTRAINT `jadwalakademik_ibfk_1` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`),
  ADD CONSTRAINT `jadwalakademik_ibfk_2` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`);

--
-- Ketidakleluasaan untuk tabel `kelaskuliah`
--
ALTER TABLE `kelaskuliah`
  ADD CONSTRAINT `kelaskuliah_ibfk_1` FOREIGN KEY (`idKelasmhs`) REFERENCES `kelasmhs` (`idKelasmhs`),
  ADD CONSTRAINT `kelaskuliah_ibfk_2` FOREIGN KEY (`idLingkupKuliah`) REFERENCES `lingkupkuliah` (`idLingkupKuliah`),
  ADD CONSTRAINT `kelaskuliah_ibfk_3` FOREIGN KEY (`idModeKuliah`) REFERENCES `modekuliah` (`idModeKuliah`),
  ADD CONSTRAINT `kelaskuliah_ibfk_4` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`),
  ADD CONSTRAINT `kelaskuliah_ibfk_5` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`),
  ADD CONSTRAINT `kelaskuliah_ibfk_6` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`),
  ADD CONSTRAINT `kelaskuliah_ibfk_7` FOREIGN KEY (`idRuaganKelas`) REFERENCES `ruangankelas` (`idRuaganKelas`),
  ADD CONSTRAINT `kelaskuliah_ibfk_8` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`);

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`idKelasKuliah`) REFERENCES `kelaskuliah` (`idKelasKuliah`),
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`idKRS`) REFERENCES `krs` (`idKRS`);

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_4` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`),
  ADD CONSTRAINT `krs_ibfk_5` FOREIGN KEY (`idKelasKuliah`) REFERENCES `kelaskuliah` (`idKelasKuliah`);

--
-- Ketidakleluasaan untuk tabel `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD CONSTRAINT `kurikulum_ibfk_1` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`idAgama`) REFERENCES `agama` (`idAgama`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`idKewarganegaraan`) REFERENCES `kewarganegaraan` (`idKewarganegaraan`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`idJenisTinggal`) REFERENCES `jenistinggal` (`idJenisTinggal`),
  ADD CONSTRAINT `mahasiswa_ibfk_4` FOREIGN KEY (`idAlatTransportasi`) REFERENCES `alattransportasi` (`idAlatTransportasi`),
  ADD CONSTRAINT `mahasiswa_ibfk_5` FOREIGN KEY (`idOrangTuaWali`) REFERENCES `orangtuawali` (`idOrangTuaWali`),
  ADD CONSTRAINT `mahasiswa_ibfk_7` FOREIGN KEY (`idProgramMhs`) REFERENCES `programmhs` (`idProgramMhs`),
  ADD CONSTRAINT `mahasiswa_ibfk_8` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`);

--
-- Ketidakleluasaan untuk tabel `masterbiaya`
--
ALTER TABLE `masterbiaya`
  ADD CONSTRAINT `masterbiaya_ibfk_1` FOREIGN KEY (`idNamaBiaya`) REFERENCES `namabiaya` (`idNamaBiaya`);

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`idKurikulum`) REFERENCES `kurikulum` (`idKurikulum`),
  ADD CONSTRAINT `matakuliah_ibfk_2` FOREIGN KEY (`idJenisMataKuliah`) REFERENCES `jenismatakuliah` (`idJenisMataKuliah`);

--
-- Ketidakleluasaan untuk tabel `matakuliahprasyarat`
--
ALTER TABLE `matakuliahprasyarat`
  ADD CONSTRAINT `matakuliahprasyarat_ibfk_1` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`),
  ADD CONSTRAINT `matakuliahprasyarat_ibfk_2` FOREIGN KEY (`idMataKuliahSyarat`) REFERENCES `matakuliahsyarat` (`idMataKuliahSyarat`);

--
-- Ketidakleluasaan untuk tabel `matakuliahsyarat`
--
ALTER TABLE `matakuliahsyarat`
  ADD CONSTRAINT `matakuliahsyarat_ibfk_1` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`);

--
-- Ketidakleluasaan untuk tabel `namabiaya`
--
ALTER TABLE `namabiaya`
  ADD CONSTRAINT `namabiaya_ibfk_1` FOREIGN KEY (`idProgramMhs`) REFERENCES `programmhs` (`idProgramMhs`),
  ADD CONSTRAINT `namabiaya_ibfk_2` FOREIGN KEY (`idProgramStudi`) REFERENCES `programstudi` (`idProgramStudi`),
  ADD CONSTRAINT `namabiaya_ibfk_3` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`);

--
-- Ketidakleluasaan untuk tabel `orangtuawali`
--
ALTER TABLE `orangtuawali`
  ADD CONSTRAINT `orangtuawali_ibfk_1` FOREIGN KEY (`idPendidikanOrtu`) REFERENCES `pendidikanortu` (`idPendidikanOrtu`),
  ADD CONSTRAINT `orangtuawali_ibfk_2` FOREIGN KEY (`idPekerjaanOrtu`) REFERENCES `pekerjaanortu` (`idPekerjaanOrtu`),
  ADD CONSTRAINT `orangtuawali_ibfk_3` FOREIGN KEY (`idPenghasilanOrtu`) REFERENCES `penghasilanortu` (`idPenghasilanOrtu`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`idMasterBiaya`) REFERENCES `masterbiaya` (`idMasterBiaya`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`);

--
-- Ketidakleluasaan untuk tabel `pembimbingakademik`
--
ALTER TABLE `pembimbingakademik`
  ADD CONSTRAINT `pembimbingakademik_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`),
  ADD CONSTRAINT `pembimbingakademik_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`);

--
-- Ketidakleluasaan untuk tabel `presensidosen`
--
ALTER TABLE `presensidosen`
  ADD CONSTRAINT `presensidosen_ibfk_1` FOREIGN KEY (`idDeskripsiMK`) REFERENCES `deskripsimatakuliah` (`idDeskripsiMK`),
  ADD CONSTRAINT `presensidosen_ibfk_2` FOREIGN KEY (`idJenisPresensi`) REFERENCES `jenispresensi` (`idJenisPresensi`),
  ADD CONSTRAINT `presensidosen_ibfk_3` FOREIGN KEY (`idKelasKuliah`) REFERENCES `kelaskuliah` (`idKelasKuliah`);

--
-- Ketidakleluasaan untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  ADD CONSTRAINT `presensimhs_ibfk_2` FOREIGN KEY (`idJenisPresensi`) REFERENCES `jenispresensi` (`idJenisPresensi`);

--
-- Ketidakleluasaan untuk tabel `programstudi`
--
ALTER TABLE `programstudi`
  ADD CONSTRAINT `programstudi_ibfk_1` FOREIGN KEY (`idFakultas`) REFERENCES `fakultas` (`idFakultas`);

--
-- Ketidakleluasaan untuk tabel `registrasimhs`
--
ALTER TABLE `registrasimhs`
  ADD CONSTRAINT `registrasimhs_ibfk_1` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`),
  ADD CONSTRAINT `registrasimhs_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`),
  ADD CONSTRAINT `registrasimhs_ibfk_3` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`);

--
-- Ketidakleluasaan untuk tabel `riwayatbimbinganta`
--
ALTER TABLE `riwayatbimbinganta`
  ADD CONSTRAINT `riwayatbimbinganta_ibfk_1` FOREIGN KEY (`idTugasAkhir`) REFERENCES `tugasakhir` (`idTugasAkhir`);

--
-- Ketidakleluasaan untuk tabel `rps`
--
ALTER TABLE `rps`
  ADD CONSTRAINT `rps_ibfk_1` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`);

--
-- Ketidakleluasaan untuk tabel `statustamhs`
--
ALTER TABLE `statustamhs`
  ADD CONSTRAINT `statustamhs_ibfk_1` FOREIGN KEY (`idJenisUjian`) REFERENCES `jenisujian` (`idJenisUjian`),
  ADD CONSTRAINT `statustamhs_ibfk_2` FOREIGN KEY (`idPembimbingTA`) REFERENCES `pembimbingta` (`idPembimbingTA`),
  ADD CONSTRAINT `statustamhs_ibfk_3` FOREIGN KEY (`idRiwayatTA`) REFERENCES `riwayatbimbinganta` (`idRiwayatTA`);

--
-- Ketidakleluasaan untuk tabel `transkrip`
--
ALTER TABLE `transkrip`
  ADD CONSTRAINT `transkrip_ibfk_1` FOREIGN KEY (`idKHS`) REFERENCES `khs` (`idKHS`);

--
-- Ketidakleluasaan untuk tabel `tugasakhir`
--
ALTER TABLE `tugasakhir`
  ADD CONSTRAINT `tugasakhir_ibfk_1` FOREIGN KEY (`idPembimbingTA`) REFERENCES `pembimbingta` (`idPembimbingTA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
