-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2022 pada 05.06
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
  `status` enum('Diterima','Ditolak') DEFAULT NULL,
  `pesanBimbingan` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bimbingankrs`
--

INSERT INTO `bimbingankrs` (`idBimbinganKRS`, `idKRS`, `idPembimbingAkademik`, `status`, `pesanBimbingan`, `created_at`, `updated_at`) VALUES
(7, 2, 3, 'Diterima', NULL, NULL, '2022-10-16 18:24:30'),
(9, 1, 1, 'Diterima', NULL, NULL, '2022-10-16 18:24:20'),
(10, 7, 3, 'Diterima', NULL, NULL, '2022-10-16 18:24:30'),
(11, 3, 2, NULL, NULL, NULL, NULL),
(12, 4, 4, NULL, NULL, NULL, NULL),
(13, 5, 4, 'Diterima', NULL, NULL, '2022-10-16 18:24:20');

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
-- Struktur dari tabel `detailkhs`
--

CREATE TABLE `detailkhs` (
  `idDetailKHS` varchar(50) NOT NULL,
  `idKRS` int(5) DEFAULT NULL,
  `idKelasKuliah` int(5) DEFAULT NULL,
  `nilaiTugas` int(5) DEFAULT NULL,
  `nilaiUTS` int(5) DEFAULT NULL,
  `nilaiUAS` int(5) DEFAULT NULL,
  `bobotTugas` decimal(5,2) DEFAULT NULL,
  `bobotUTS` decimal(5,2) DEFAULT NULL,
  `bobotUAS` decimal(5,2) DEFAULT NULL,
  `nilaiAkhir` decimal(5,2) DEFAULT NULL,
  `semester` int(5) DEFAULT NULL,
  `statusPenilaian` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailkhs`
--

INSERT INTO `detailkhs` (`idDetailKHS`, `idKRS`, `idKelasKuliah`, `nilaiTugas`, `nilaiUTS`, `nilaiUAS`, `bobotTugas`, `bobotUTS`, `bobotUAS`, `nilaiAkhir`, `semester`, `statusPenilaian`, `created_at`, `updated_at`) VALUES
('1-1', 1, 1, NULL, NULL, NULL, NULL, NULL, '100.00', '0.00', 4, 'final', '2022-11-25 19:51:18', '2022-11-25 19:51:18'),
('1-2', 2, 1, NULL, NULL, NULL, NULL, NULL, '100.00', '0.00', 4, 'final', '2022-11-25 19:51:18', '2022-11-25 19:51:18'),
('3-5', 5, 3, NULL, NULL, 80, NULL, NULL, '100.00', '80.00', 6, NULL, '2022-11-25 20:06:23', '2022-11-25 20:06:31'),
('5-7', 7, 5, NULL, NULL, 80, NULL, NULL, '100.00', '80.00', 3, 'final', '2022-11-25 20:13:23', '2022-11-25 20:13:23');

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
  `idTahunAkademik` int(5) DEFAULT NULL,
  `idProgramStudi` varchar(10) DEFAULT NULL,
  `tglRegistrasiMulai` date DEFAULT NULL,
  `tglRegistrasiSelesai` date DEFAULT NULL,
  `tglKRSMulai` date DEFAULT NULL,
  `tglKRSSelesai` date DEFAULT NULL,
  `tglUTSMulai` date DEFAULT NULL,
  `tglUTSSelesai` date DEFAULT NULL,
  `tglUASMulai` date DEFAULT NULL,
  `tglUASSelesai` date DEFAULT NULL,
  `tglPenilaianMulai` date DEFAULT NULL,
  `tglPenilaianSelesai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwalakademik`
--

INSERT INTO `jadwalakademik` (`idJadwalAkademik`, `idTahunAkademik`, `idProgramStudi`, `tglRegistrasiMulai`, `tglRegistrasiSelesai`, `tglKRSMulai`, `tglKRSSelesai`, `tglUTSMulai`, `tglUTSSelesai`, `tglUASMulai`, `tglUASSelesai`, `tglPenilaianMulai`, `tglPenilaianSelesai`) VALUES
(2, 20212, '55-201', NULL, NULL, NULL, NULL, '2022-05-19', '2022-05-31', '2022-07-31', '2022-08-10', '2022-04-04', '2022-11-26'),
(3, 20211, '55-201', '2021-05-03', '2022-05-16', '2022-05-17', '2022-05-31', '2022-07-25', '2022-08-01', '2022-09-12', '2022-09-26', '2021-04-10', '2021-04-24');

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
  `idJurnal` varchar(50) NOT NULL,
  `pertemuan` varchar(20) NOT NULL,
  `idKelasKuliah` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `jamMulai` time DEFAULT NULL,
  `jamSelesai` time DEFAULT NULL,
  `materi` varchar(225) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnalperkuliahan`
--

INSERT INTO `jurnalperkuliahan` (`idJurnal`, `pertemuan`, `idKelasKuliah`, `tanggal`, `jamMulai`, `jamSelesai`, `materi`, `created_at`, `updated_at`) VALUES
('202115-1', '202115-01', 5, '2020-09-30', '09:00:00', '11:00:00', 'Materi 1', '2022-11-29 21:11:05', '2022-11-29 21:11:53'),
('202121-1', '202121-01', 1, '2022-11-30', '09:00:00', '11:30:00', 'Materi 1', '2022-11-29 19:06:24', '2022-11-29 19:06:24'),
('202121-10', '202121-10', 1, '2023-01-25', '09:00:00', '11:30:00', 'Materi 10', '2022-11-29 21:00:48', '2022-11-29 21:00:48'),
('202121-11', '202121-11', 1, '2023-02-22', '09:00:00', '11:30:00', 'Materi 11', '2022-11-29 21:01:02', '2022-11-29 21:01:02'),
('202121-12', '202121-12', 1, '2023-03-01', '09:00:00', '11:30:00', 'Materi 12', '2022-11-29 21:01:17', '2022-11-29 21:01:17'),
('202121-13', '202121-13', 1, '2023-03-29', '09:00:00', '11:30:00', 'Materi 13', '2022-11-29 21:01:36', '2022-11-29 21:01:36'),
('202121-14', '202121-14', 1, '2023-03-29', '09:00:00', '11:30:00', 'Materi 14', '2022-11-29 21:01:53', '2022-11-29 21:01:53'),
('202121-15', '202121-15', 1, '2023-04-05', '09:00:00', '11:30:00', 'Materi 15', '2022-11-29 21:05:55', '2022-11-29 21:05:55'),
('202121-16', '202121-16', 1, '2023-04-07', '09:00:00', '11:30:00', 'UAS', '2022-11-29 21:06:38', '2022-11-29 21:06:38'),
('202121-2', '202121-02', 1, '2023-01-04', '09:00:00', '11:30:00', 'Materi 2', '2022-11-29 20:44:34', '2022-11-29 20:44:34'),
('202121-3', '202121-03', 1, '2022-12-09', '09:00:00', '11:30:00', 'Materi 3', '2022-11-29 20:44:51', '2022-11-29 20:44:51'),
('202121-4', '202121-04', 1, '2022-12-21', '09:00:00', '11:30:00', 'Materi 4', '2022-11-29 20:45:11', '2022-11-29 20:45:11'),
('202121-5', '202121-05', 1, '2022-12-21', '09:00:00', '11:30:00', 'Materi 5', '2022-11-29 20:45:29', '2022-11-29 20:45:29'),
('202121-6', '202121-06', 1, '2023-01-19', '09:00:00', '11:30:00', 'Materi 6', '2022-11-29 20:49:09', '2022-11-29 20:49:09'),
('202121-7', '202121-07', 1, '2023-01-24', '09:00:00', '11:30:00', 'Materi 7', '2022-11-29 20:49:25', '2022-11-29 20:49:25'),
('202121-8', '202121-08', 1, '2023-01-25', '09:00:00', '11:30:00', 'Materi 8', '2022-11-29 20:49:42', '2022-11-29 20:49:42'),
('202121-9', '202121-09', 1, '2023-01-31', '09:00:00', '11:30:00', 'Materi 9', '2022-11-29 20:51:30', '2022-11-29 20:51:30'),
('202123-1', '202123-01', 3, '2022-11-30', '09:00:00', '11:00:00', 'Materi 1', '2022-11-29 21:08:18', '2022-11-29 21:08:18'),
('202123-2', '202123-02', 3, '2022-12-15', '09:00:00', '11:00:00', 'jjj', '2022-11-30 02:20:14', '2022-11-30 02:20:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelaskuliah`
--

CREATE TABLE `kelaskuliah` (
  `idKelasKuliah` int(5) NOT NULL,
  `hariKuliah` varchar(50) NOT NULL,
  `idMasterKelas` int(2) DEFAULT NULL,
  `idLingkupKuliah` int(5) NOT NULL,
  `idMataKuliah` varchar(20) DEFAULT NULL,
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

INSERT INTO `kelaskuliah` (`idKelasKuliah`, `hariKuliah`, `idMasterKelas`, `idLingkupKuliah`, `idMataKuliah`, `idModeKuliah`, `idProgramStudi`, `idRuaganKelas`, `idTahunAkademik`, `jamMulaiKuliah`, `jamSelesaiKuliah`, `nidn`, `tanggalAkhirEfektif`, `tanggalAwalEfektif`) VALUES
(1, 'Senin', 1, 1, 'WP06114', 2, '55-201', 1, 20212, '09:00:00', '11:30:00', '0201078501', '2022-06-10', '2022-03-03'),
(3, 'Selasa', 1, 1, 'WP06123', 1, '55-201', 1, 20212, '09:00:00', '11:00:00', '0201078501', '2022-06-10', '2022-08-10'),
(4, 'Senin', 1, 1, 'WP06114', 2, '55-201', 1, 20212, '09:00:00', '11:30:00', '12345678', '2022-06-10', '2022-08-03'),
(5, 'Selasa', 1, 1, 'WP06789', 2, '55-201', 1, 20211, '09:00:00', '11:00:00', '0201078501', '2022-06-10', '2022-08-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelasmhs`
--

CREATE TABLE `kelasmhs` (
  `idKelasmhs` int(5) NOT NULL,
  `idMasterKelas` varchar(1) DEFAULT NULL,
  `npm` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelasmhs`
--

INSERT INTO `kelasmhs` (`idKelasmhs`, `idMasterKelas`, `npm`) VALUES
(1, '1', '1'),
(2, '1', '10'),
(3, '1', '11'),
(4, '2', '12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelengkapanskripsi`
--

CREATE TABLE `kelengkapanskripsi` (
  `idKelengkapanSkripsi` int(5) NOT NULL,
  `idPengajuanSkripsi` int(5) NOT NULL,
  `idSyaratSkripsi` int(5) NOT NULL,
  `dokumenSyarat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `idKHS` varchar(50) NOT NULL,
  `idKRS` int(5) DEFAULT NULL,
  `idKelasKuliah` int(5) DEFAULT NULL,
  `nilaiAkhir` decimal(5,2) DEFAULT NULL,
  `gradeNilai` varchar(1) DEFAULT NULL,
  `semester` int(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`idKHS`, `idKRS`, `idKelasKuliah`, `nilaiAkhir`, `gradeNilai`, `semester`, `created_at`, `updated_at`) VALUES
('1-1', 1, 1, '0.00', 'E', 4, '2022-11-25 19:51:18', '2022-11-25 19:51:18'),
('1-2', 2, 1, '0.00', 'E', 4, '2022-11-25 19:51:18', '2022-11-25 19:51:18'),
('3-5', 5, 3, '80.00', 'B', 6, '2022-11-25 20:07:20', '2022-11-25 20:07:20'),
('5-7', 7, 5, '80.00', 'B', 3, '2022-11-25 20:13:23', '2022-11-29 21:15:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `idKRS` varchar(50) NOT NULL,
  `idMataKuliah` varchar(20) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `idMasterKelas` int(2) NOT NULL,
  `statusKRS` enum('Diterima','Ditolak') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`idKRS`, `idMataKuliah`, `idTahunAkademik`, `npm`, `idMasterKelas`, `statusKRS`, `created_at`, `updated_at`) VALUES
('1', 'WP06114', 20212, '1', 1, 'Diterima', NULL, '2022-10-16 18:24:20'),
('2', 'WP06114', 20212, '10', 1, 'Diterima', NULL, '2022-10-16 18:24:30'),
('3', 'WP06114', 20212, '11', 1, NULL, NULL, NULL),
('4', 'WP06114', 20212, '12', 1, NULL, NULL, NULL),
('5', 'WP06123', 20212, '1', 1, 'Diterima', NULL, '2022-10-16 18:24:20'),
('6', 'WP06114', 20212, '13', 1, NULL, NULL, NULL),
('7', 'WP06789', 20211, '10', 1, 'Diterima', NULL, '2022-10-16 18:24:30');

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
('1', 'Nadia Paris Susanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Barat No. 325, Bontang 27540, Jateng', '(+62) 800 5356 7448', '(+62) 449 6081 366', '0', '0', '0', '0', '0', 1, 'zpermata@example.org', 1, 1, 'Tidak', '1', '55-201', '/storage/foto/mhs.jpg', 2020),
('10', 'Shakila Maryati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Suryo No. 998, Pagar Alam 62686, Riau', '0667 9159 097', '(+62) 753 1985 782', '0', '0', '0', '0', '0', 1, 'ega78@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2020),
('100', 'Ikhsan Wardaya Suryono S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Mahakam No. 348, Manado 53514, Maluku', '(+62) 305 6684 2876', '(+62) 479 6613 820', '0', '0', '0', '0', '0', 1, 'eka26@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('101', 'Candra Megantara S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bahagia  No. 239, Administrasi Jakarta Pusat 67590, NTT', '(+62) 939 1026 2980', '0465 8583 772', '0', '0', '0', '0', '0', 1, 'hardana.rahayu@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('102', 'Hasim Situmorang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Sudirman No. 62, Ternate 86945, Lampung', '(+62) 465 5090 034', '0860 0204 151', '0', '0', '0', '0', '0', 1, 'wacana.jasmin@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('103', 'Rusman Wasita S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ronggowarsito No. 689, Administrasi Jakarta Timur 68227, Jambi', '(+62) 324 6358 306', '025 7736 4311', '0', '0', '0', '0', '0', 1, 'lulut.anggriawan@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('104', 'Gabriella Yulia Nurdiyanti M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sutan Syahrir No. 240, Bogor 66897, Malut', '0505 4918 264', '(+62) 896 5850 4928', '0', '0', '0', '0', '0', 1, 'zulkarnain.asmuni@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('105', 'Langgeng Ramadan S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Urip Sumoharjo No. 979, Tarakan 27597, Aceh', '(+62) 20 4132 058', '(+62) 622 2633 0527', '0', '0', '0', '0', '0', 1, 'ihabibi@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('106', 'Clara Lailasari M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Adisucipto No. 239, Balikpapan 75641, Jambi', '(+62) 613 4006 569', '0457 2909 8309', '0', '0', '0', '0', '0', 1, 'susanti.jindra@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('107', 'Putri Zahra Prastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Sutami No. 16, Depok 11080, Sulteng', '(+62) 506 3891 557', '(+62) 770 8829 323', '0', '0', '0', '0', '0', 1, 'handayani.hasna@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('108', 'Paulin Dian Laksita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Hasanuddin No. 666, Jambi 96533, Sumbar', '(+62) 989 2665 102', '0338 3307 4868', '0', '0', '0', '0', '0', 1, 'titi.waskita@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('109', 'Putri Utami S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Aceh No. 771, Payakumbuh 22529, Kepri', '(+62) 479 6491 955', '022 5800 5139', '0', '0', '0', '0', '0', 1, 'wpurwanti@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('11', 'Vega Uwais', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Pelajar Pejuang 45 No. 230, Palangka Raya 65451, Babel', '(+62) 337 6589 5736', '(+62) 23 1167 0996', '0', '0', '0', '0', '0', 1, 'yriyanti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2020),
('110', 'Emas Wahyudin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Zamrud No. 475, Mojokerto 80183, Kalsel', '(+62) 828 2830 7647', '0455 0323 7246', '0', '0', '0', '0', '0', 1, 'usamah.ajeng@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('111', 'Yulia Humaira Oktaviani M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ters. Kiaracondong No. 923, Binjai 58871, Maluku', '0717 1842 701', '0790 0362 2125', '0', '0', '0', '0', '0', 1, 'cakrawala99@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('112', 'Vivi Febi Hariyah S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Muwardi No. 558, Administrasi Jakarta Pusat 35780, Papua', '0814 094 488', '0944 5775 1138', '0', '0', '0', '0', '0', 1, 'yuliana.usamah@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('113', 'Wira Siregar', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sutan Syahrir No. 958, Batu 99047, Kepri', '0439 3857 8881', '(+62) 20 7173 601', '0', '0', '0', '0', '0', 1, 'kamal.maulana@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('114', 'Lega Situmorang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Haji No. 103, Kendari 58678, NTT', '(+62) 462 6717 762', '(+62) 513 9500 184', '0', '0', '0', '0', '0', 1, 'dwidodo@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('115', 'Hamzah Embuh Damanik', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Thamrin No. 561, Pematangsiantar 14409, Malut', '0922 3727 028', '(+62) 487 4431 2809', '0', '0', '0', '0', '0', 1, 'mansur.jasmani@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('116', 'Karen Karen Zulaika', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Panjaitan No. 940, Bukittinggi 58836, Sumbar', '(+62) 874 3639 9004', '(+62) 852 461 869', '0', '0', '0', '0', '0', 1, 'raharja.uyainah@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('117', 'Ana Hasanah M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gading No. 273, Solok 45513, Babel', '0331 5380 3099', '(+62) 296 8718 426', '0', '0', '0', '0', '0', 1, 'sarah39@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('118', 'Salimah Nasyidah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Basmol Raya No. 13, Denpasar 40422, Babel', '0373 0823 5380', '(+62) 531 1159 2758', '0', '0', '0', '0', '0', 1, 'daruna33@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('119', 'Almira Mardhiyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Hang No. 331, Banjar 87576, Lampung', '0992 6052 333', '(+62) 275 1143 2208', '0', '0', '0', '0', '0', 1, 'tprayoga@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('12', 'Irma Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. M.T. Haryono No. 622, Bitung 53857, Aceh', '(+62) 893 595 051', '(+62) 637 2797 8844', '0', '0', '0', '0', '0', 1, 'sakti58@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2020),
('120', 'Cawuk Anggriawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ikan No. 674, Bau-Bau 55449, Sulbar', '(+62) 996 5077 266', '(+62) 653 7713 438', '0', '0', '0', '0', '0', 1, 'vwidiastuti@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('121', 'Darman Edi Tarihoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Pattimura No. 365, Pagar Alam 90038, Sulut', '(+62) 424 3181 6942', '0536 1298 203', '0', '0', '0', '0', '0', 1, 'fujiati.chelsea@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('122', 'Lulut Rajata S.I.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Lembong No. 632, Magelang 27260, Sulut', '025 0954 552', '(+62) 663 7302 790', '0', '0', '0', '0', '0', 1, 'saefullah.talia@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('123', 'Ikhsan Nugroho', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gardujati No. 266, Tegal 53619, Sulteng', '0655 8026 675', '0837 1221 108', '0', '0', '0', '0', '0', 1, 'jbudiyanto@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('124', 'Respati Saragih S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Banda No. 163, Bandung 36297, Riau', '0200 1229 8198', '0543 5287 181', '0', '0', '0', '0', '0', 1, 'opurnawati@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('125', 'Jaiman Pangestu', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Abdul. Muis No. 222, Padangpanjang 77810, Sulteng', '(+62) 435 3259 562', '(+62) 827 5088 389', '0', '0', '0', '0', '0', 1, 'rnuraini@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('126', 'Sakura Nurul Nuraini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Pasir Koja No. 698, Sabang 98073, Riau', '(+62) 592 5036 289', '0343 8202 9293', '0', '0', '0', '0', '0', 1, 'irma.saputra@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('127', 'Warsa Wibisono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Padma No. 366, Yogyakarta 42415, Sumsel', '0845 486 374', '(+62) 468 4309 571', '0', '0', '0', '0', '0', 1, 'qwijayanti@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('128', 'Ulva Ayu Suartini M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. K.H. Wahid Hasyim (Kopo) No. 955, Sukabumi 46639, Kaltara', '0993 2303 4772', '(+62) 999 3727 8532', '0', '0', '0', '0', '0', 1, 'susanti.empluk@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('129', 'Aurora Lailasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Kyai Gede No. 553, Metro 95854, Sumut', '0821 211 349', '0729 1758 356', '0', '0', '0', '0', '0', 1, 'wpadmasari@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('13', 'Yuliana Maryati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baladewa No. 563, Palopo 32174, Sumsel', '0426 3808 1424', '0549 9326 4449', '0', '0', '0', '0', '0', 1, 'mayasari.atma@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2020),
('130', 'Bambang Jaiman Maheswara S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Monginsidi No. 795, Kediri 22645, NTT', '(+62) 26 3579 9071', '0557 0098 423', '0', '0', '0', '0', '0', 1, 'pprasetya@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('131', 'Praba Widodo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Lada No. 392, Bitung 79836, Sumbar', '0464 7937 721', '(+62) 386 3694 941', '0', '0', '0', '0', '0', 1, 'hana10@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('132', 'Karna Cahyo Prayoga', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Astana Anyar No. 7, Tidore Kepulauan 17507, NTT', '(+62) 906 1674 9645', '(+62) 805 8870 6358', '0', '0', '0', '0', '0', 1, 'dirja33@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('133', 'Dinda Vivi Suartini', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bakhita No. 293, Gunungsitoli 47898, Papua', '(+62) 244 5402 5322', '0599 3612 330', '0', '0', '0', '0', '0', 1, 'victoria.natsir@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('134', 'Salwa Amalia Astuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Basoka Raya No. 920, Tual 90531, Kalsel', '0867 432 562', '(+62) 521 6441 141', '0', '0', '0', '0', '0', 1, 'adriansyah.karsa@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('135', 'Prakosa Lembah Hutasoit M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Gardujati No. 677, Pekanbaru 45955, Gorontalo', '0432 6652 1298', '0200 2317 996', '0', '0', '0', '0', '0', 1, 'ophelia.fujiati@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('136', 'Harsana Gadang Zulkarnain', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gotong Royong No. 261, Administrasi Jakarta Timur 11698, Kalsel', '0596 7611 9457', '0222 0368 6108', '0', '0', '0', '0', '0', 1, 'jarwa55@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('137', 'Farah Astuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baan No. 630, Tanjungbalai 37123, Lampung', '(+62) 433 3483 7885', '0515 8825 401', '0', '0', '0', '0', '0', 1, 'imangunsong@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('138', 'Tiara Hariyah S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Antapani Lama No. 564, Balikpapan 16413, Bali', '(+62) 28 0262 896', '(+62) 626 6802 0355', '0', '0', '0', '0', '0', 1, 'nugraha.hutagalung@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('139', 'Shakila Fathonah Hariyah S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bak Mandi No. 515, Jayapura 56606, NTB', '0616 4390 4686', '0236 1922 9059', '0', '0', '0', '0', '0', 1, 'makuta05@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('14', 'Zelda Rahayu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Basoka Raya No. 213, Ambon 70316, Sultra', '0285 5854 194', '0431 6571 2347', '0', '0', '0', '0', '0', 1, 'ryuliarti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('140', 'Eli Oliva Lestari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gedebage Selatan No. 750, Mojokerto 47164, Kalsel', '(+62) 944 0187 539', '022 2431 0483', '0', '0', '0', '0', '0', 1, 'eman63@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('141', 'Prakosa Firgantoro', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Hang No. 465, Sabang 68614, NTB', '(+62) 658 7698 9131', '(+62) 703 3873 037', '0', '0', '0', '0', '0', 1, 'agnes60@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('142', 'Lantar Sitorus', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Orang No. 128, Semarang 96749, Bali', '0897 533 155', '0963 7298 991', '0', '0', '0', '0', '0', 1, 'zmayasari@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('143', 'Tami Haryanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. W.R. Supratman No. 237, Pematangsiantar 19247, Sumbar', '0608 7321 4691', '(+62) 377 3284 3853', '0', '0', '0', '0', '0', 1, 'oskar.januar@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('144', 'Wani Ajeng Hariyah S.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baranangsiang No. 71, Bontang 83160, Maluku', '022 8191 380', '(+62) 487 0316 1292', '0', '0', '0', '0', '0', 1, 'darmaji75@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('145', 'Ilyas Salahudin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Raya Setiabudhi No. 818, Payakumbuh 96733, Kalteng', '(+62) 392 8328 873', '0729 0275 6627', '0', '0', '0', '0', '0', 1, 'pia.susanti@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('146', 'Mulya Cahyanto Hutagalung S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ki Hajar Dewantara No. 751, Pekanbaru 27303, Sumbar', '(+62) 805 5402 1318', '0914 2646 7691', '0', '0', '0', '0', '0', 1, 'adriansyah.raden@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('147', 'Asirwada Asman Narpati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Sutami No. 212, Tomohon 11004, Pabar', '0504 5964 4096', '(+62) 693 2641 0607', '0', '0', '0', '0', '0', 1, 'iyulianti@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('148', 'Zahra Mayasari S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Babakan No. 88, Palangka Raya 75471, Jambi', '(+62) 659 1379 693', '(+62) 552 6371 463', '0', '0', '0', '0', '0', 1, 'daliman.aryani@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('149', 'Taufan Siregar S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Salatiga No. 445, Manado 73172, NTB', '0866 936 123', '0598 4846 677', '0', '0', '0', '0', '0', 1, 'qmardhiyah@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('15', 'Putu Ibrahim Lazuardi S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Cut Nyak Dien No. 953, Cilegon 21733, Sultra', '(+62) 668 0933 2404', '0677 5998 171', '0', '0', '0', '0', '0', 1, 'hidayanto.lembah@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('150', 'Paris Rahmawati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Ki Hajar Dewantara No. 626, Makassar 48661, Sumsel', '(+62) 802 279 122', '0386 4410 5314', '0', '0', '0', '0', '0', 1, 'liman.siregar@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('151', 'Widya Febi Kusmawati S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Halim No. 827, Banjarmasin 82589, Jabar', '0903 7884 2627', '0669 4283 0816', '0', '0', '0', '0', '0', 1, 'zrahimah@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('152', 'Indra Enteng Wibisono M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Krakatau No. 504, Manado 56858, Pabar', '(+62) 849 323 081', '(+62) 559 5453 848', '0', '0', '0', '0', '0', 1, 'hutasoit.gilda@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('153', 'Ulya Hafshah Farida S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sampangan No. 614, Kupang 99628, Sumut', '0926 6099 387', '0966 6012 8177', '0', '0', '0', '0', '0', 1, 'lasmanto.usada@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('154', 'Dewi Nurdiyanti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Cikutra Timur No. 761, Tangerang 93393, Jambi', '(+62) 811 911 996', '0499 7991 5314', '0', '0', '0', '0', '0', 1, 'irawan.mumpuni@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('155', 'Malika Ajeng Agustina', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jend. A. Yani No. 509, Pagar Alam 26317, Kalsel', '(+62) 367 6897 9709', '0838 443 512', '0', '0', '0', '0', '0', 1, 'syahrini23@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('156', 'Eluh Hardiansyah S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Baan No. 487, Jayapura 95810, Kaltim', '022 4995 818', '0826 8803 4211', '0', '0', '0', '0', '0', 1, 'dian.halim@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('157', 'Malika Ciaobella Oktaviani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Ahmad Dahlan No. 316, Batam 87111, Jateng', '0300 0451 974', '0984 9694 6698', '0', '0', '0', '0', '0', 1, 'muni.pratiwi@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('158', 'Rika Mayasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Pacuan Kuda No. 540, Sorong 78565, Sumsel', '0489 3465 4931', '0820 333 267', '0', '0', '0', '0', '0', 1, 'sabar44@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('159', 'Makuta Santoso M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baranang Siang No. 349, Padang 56337, Gorontalo', '0529 8070 9681', '0537 3484 9037', '0', '0', '0', '0', '0', 1, 'laksita.garan@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('16', 'Johan Kusuma Prasetya S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Suharso No. 322, Cirebon 20292, Sulbar', '0550 5005 0536', '(+62) 550 8956 313', '0', '0', '0', '0', '0', 1, 'qsaputra@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('160', 'Gasti Kusmawati S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Lumban Tobing No. 726, Magelang 56149, Sumsel', '0626 3816 797', '0812 508 620', '0', '0', '0', '0', '0', 1, 'ika30@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('161', 'Nabila Purwanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Pattimura No. 873, Tegal 67066, Jambi', '0713 7014 214', '(+62) 240 0639 1463', '0', '0', '0', '0', '0', 1, 'januar.bancar@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('162', 'Luis Tamba', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ki Hajar Dewantara No. 156, Subulussalam 22250, Kalbar', '027 6499 7302', '0512 3620 066', '0', '0', '0', '0', '0', 1, 'nasab.farida@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('163', 'Hairyanto Eka Suryono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Pasteur No. 595, Binjai 56215, Sulut', '(+62) 970 5854 2940', '(+62) 22 2036 428', '0', '0', '0', '0', '0', 1, 'pharyanto@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('164', 'Juli Handayani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Astana Anyar No. 615, Singkawang 75479, Kepri', '(+62) 392 9957 507', '(+62) 372 5895 314', '0', '0', '0', '0', '0', 1, 'calista65@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('165', 'Diah Vivi Lailasari S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Kartini No. 61, Bandung 67871, Kaltim', '0209 2435 695', '(+62) 603 4916 0657', '0', '0', '0', '0', '0', 1, 'xlestari@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('166', 'Ratih Hastuti S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Suryo No. 970, Semarang 59914, Sulbar', '0566 3857 5727', '(+62) 643 3682 261', '0', '0', '0', '0', '0', 1, 'soleh02@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('167', 'Heryanto Sitompul', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Panjaitan No. 707, Subulussalam 13425, Bengkulu', '(+62) 763 2999 8943', '(+62) 954 5955 720', '0', '0', '0', '0', '0', 1, 'intan38@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('168', 'Muni Narpati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Supomo No. 822, Pematangsiantar 47478, Jabar', '(+62) 830 3117 4888', '(+62) 379 9299 395', '0', '0', '0', '0', '0', 1, 'kusumo.rahmat@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('169', 'Putri Puspita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Rajawali No. 519, Pagar Alam 24241, Jambi', '(+62) 515 9317 9500', '0249 4072 7957', '0', '0', '0', '0', '0', 1, 'hwidiastuti@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('17', 'Endra Jaswadi Damanik S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Baladewa No. 227, Administrasi Jakarta Timur 75509, Kalsel', '(+62) 542 3304 857', '0787 0031 486', '0', '0', '0', '0', '0', 1, 'safitri.utama@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('170', 'Erik Haryanto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Krakatau No. 960, Banjarbaru 63144, NTT', '(+62) 860 894 606', '(+62) 267 1909 3912', '0', '0', '0', '0', '0', 1, 'xyuniar@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('171', 'Karman Widodo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Agus Salim No. 101, Cilegon 73233, Kaltim', '0379 1324 0232', '0610 1886 3726', '0', '0', '0', '0', '0', 1, 'makuta53@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('172', 'Rahman Waskita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Monginsidi No. 629, Palangka Raya 77752, Kalbar', '(+62) 720 1871 5313', '0811 8119 939', '0', '0', '0', '0', '0', 1, 'dwahyuni@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('173', 'Banara Salahudin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basudewo No. 336, Surabaya 13318, Aceh', '0809 307 005', '(+62) 480 5108 580', '0', '0', '0', '0', '0', 1, 'karimah.mandasari@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('174', 'Asmuni Winarno M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ciumbuleuit No. 960, Palu 71228, Papua', '0833 5984 746', '0246 7954 672', '0', '0', '0', '0', '0', 1, 'jsiregar@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('175', 'Okta Suwarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Juanda No. 199, Tomohon 56791, Jateng', '0983 8261 577', '(+62) 26 0553 1634', '0', '0', '0', '0', '0', 1, 'riyanti.cahyadi@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('176', 'Hasna Usada S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gading No. 648, Samarinda 53759, Jateng', '(+62) 22 2888 0707', '(+62) 273 5393 6253', '0', '0', '0', '0', '0', 1, 'wahyudin.endah@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('177', 'Gatot Gunarto S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Dr. Junjunan No. 403, Probolinggo 22341, Sulbar', '(+62) 803 7312 2877', '0386 2608 7640', '0', '0', '0', '0', '0', 1, 'warta53@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('178', 'Hani Hesti Rahimah S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Tubagus Ismail No. 332, Administrasi Jakarta Pusat 91606, Kalsel', '0591 8306 2239', '0599 7616 702', '0', '0', '0', '0', '0', 1, 'kiandra31@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('179', 'Carla Laksita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Adisucipto No. 872, Manado 82603, Jateng', '0443 1695 0302', '0383 3708 670', '0', '0', '0', '0', '0', 1, 'aurora99@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('18', 'Titin Wastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bakit  No. 251, Pekanbaru 37755, Sumut', '0433 2945 6231', '(+62) 925 0445 9650', '0', '0', '0', '0', '0', 1, 'zwijayanti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('180', 'Murti Vero Samosir S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Jamika No. 762, Administrasi Jakarta Barat 85868, Kalteng', '0466 2608 540', '0219 4612 938', '0', '0', '0', '0', '0', 1, 'rnasyiah@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('181', 'Queen Yulianti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Wahid No. 242, Banjarmasin 57463, NTT', '029 0544 5987', '0676 7368 317', '0', '0', '0', '0', '0', 1, 'lala29@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('182', 'Nyoman Jarwi Pradana M.Ak', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Uluwatu No. 123, Mataram 90833, NTT', '(+62) 21 2057 3186', '0499 6529 528', '0', '0', '0', '0', '0', 1, 'athamrin@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('183', 'Garang Permadi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ciumbuleuit No. 430, Solok 36136, Riau', '(+62) 812 954 073', '0478 5097 654', '0', '0', '0', '0', '0', 1, 'gunawan.manah@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('184', 'Salwa Agustina', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Raden No. 172, Kediri 54513, Kalteng', '0409 7193 735', '0941 9155 3851', '0', '0', '0', '0', '0', 1, 'ardianto.cakrabirawa@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('185', 'Okta Wasita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Ki Hajar Dewantara No. 337, Probolinggo 35957, DKI', '(+62) 236 2998 741', '0537 3832 350', '0', '0', '0', '0', '0', 1, 'cakrabuana.irawan@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('186', 'Lukman Rusman Sihombing', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Ekonomi No. 734, Gorontalo 95904, Kepri', '0668 3860 4980', '0208 0432 188', '0', '0', '0', '0', '0', 1, 'akurniawan@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('187', 'Zelda Irma Wulandari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bhayangkara No. 886, Manado 56174, Malut', '0662 4441 841', '0583 2477 3740', '0', '0', '0', '0', '0', 1, 'firmansyah.marsito@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('188', 'Chelsea Fitria Kusmawati S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Wahidin No. 301, Blitar 52023, Jatim', '0775 4569 931', '0274 9122 2116', '0', '0', '0', '0', '0', 1, 'bahuraksa.nasyidah@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('189', 'Ilsa Novitasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Abdullah No. 957, Serang 27488, Sulteng', '0658 3809 625', '(+62) 422 4071 4117', '0', '0', '0', '0', '0', 1, 'tugiman40@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('19', 'Dacin Tampubolon M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Salatiga No. 93, Pekalongan 62165, Kaltara', '0707 4434 029', '0483 9696 3363', '0', '0', '0', '0', '0', 1, 'iriyanti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('190', 'Maria Mulyani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Ujung No. 73, Tual 72326, Pabar', '(+62) 815 6351 881', '0782 6812 0767', '0', '0', '0', '0', '0', 1, 'okta83@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('191', 'Mutia Wastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Juanda No. 509, Solok 80817, Sultra', '(+62) 788 4376 442', '024 2059 596', '0', '0', '0', '0', '0', 1, 'mustofa.ophelia@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('192', 'Ganep Irawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sukabumi No. 645, Blitar 48739, Maluku', '(+62) 538 2595 119', '0376 7455 901', '0', '0', '0', '0', '0', 1, 'yuliarti.jagaraga@example.org', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('193', 'Devi Fujiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. B.Agam Dlm No. 956, Gunungsitoli 43397, Jateng', '0936 7276 1707', '0899 0379 924', '0', '0', '0', '0', '0', 1, 'hutagalung.dina@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('194', 'Gadang Candra Sihotang M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. BKR No. 267, Denpasar 37285, Kaltim', '0584 7211 8087', '020 7615 501', '0', '0', '0', '0', '0', 1, 'cwasita@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('195', 'Endra Yoga Manullang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Kalimalang No. 978, Gunungsitoli 26764, Sulsel', '(+62) 324 5748 564', '(+62) 26 5986 0067', '0', '0', '0', '0', '0', 1, 'vino14@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('196', 'Mustika Waskita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Jayawijaya No. 739, Cirebon 35522, Kaltara', '(+62) 573 0795 379', '(+62) 335 0466 8372', '0', '0', '0', '0', '0', 1, 'vmandala@example.com', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('197', 'Kunthara Labuh Prasasta S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Sentot Alibasa No. 505, Tanjung Pinang 95430, DIY', '0537 5213 6379', '0823 6579 780', '0', '0', '0', '0', '0', 1, 'gangsar.maulana@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('198', 'Salwa Purwanti S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Elang No. 870, Kotamobagu 45733, Kalbar', '0525 9447 8388', '0712 9896 804', '0', '0', '0', '0', '0', 1, 'mariadi.zulkarnain@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('199', 'Mahesa Halim Siregar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Dewi Sartika No. 461, Sawahlunto 38902, Sultra', '(+62) 420 9503 0785', '(+62) 679 3227 4242', '0', '0', '0', '0', '0', 1, 'kania05@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('2', 'Puti Aisyah Lailasari S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Flora No. 200, Banda Aceh 92979, Bengkulu', '0421 3517 633', '(+62) 352 8407 1289', '0', '0', '0', '0', '0', 1, 'septi.hidayat@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('20', 'Imam Rajata S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Dewi Sartika No. 571, Tual 63609, Jabar', '0245 4253 5630', '0402 6131 0951', '0', '0', '0', '0', '0', 1, 'yhastuti@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('200', 'Baktiono Mandala', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Batako No. 598, Tarakan 87245, Pabar', '(+62) 766 6005 1527', '(+62) 841 6303 3014', '0', '0', '0', '0', '0', 1, 'devi19@example.net', 1, 1, 'Tidak', '1', '14201', '-', 2022),
('201', 'Bakianto Martaka Simbolon', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Ronggowarsito No. 229, Palopo 30866, Lampung', '0575 2828 5142', '(+62) 904 2983 9284', '0', '0', '0', '0', '0', 1, 'dodo.prasasta@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('202', 'Johan Sihotang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Abdul. Muis No. 255, Magelang 42563, Jatim', '(+62) 969 3264 274', '(+62) 365 8915 5881', '0', '0', '0', '0', '0', 1, 'yuliana.kuswandari@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('203', 'Darmanto Ibrani Mandala', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sukajadi No. 439, Banjarbaru 61730, NTB', '0509 6478 4172', '(+62) 430 9773 8799', '0', '0', '0', '0', '0', 1, 'ganep05@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('204', 'Budi Maryadi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Achmad Yani No. 491, Palembang 50651, Papua', '0801 0112 445', '(+62) 858 4620 1324', '0', '0', '0', '0', '0', 1, 'lega.aryani@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('205', 'Suci Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Jend. A. Yani No. 724, Tanjung Pinang 15503, Jatim', '0358 7134 223', '0753 1179 100', '0', '0', '0', '0', '0', 1, 'zelaya95@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('206', 'Abyasa Banawa Habibi M.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Nakula No. 625, Pagar Alam 52764, Jatim', '(+62) 20 2419 312', '0895 231 994', '0', '0', '0', '0', '0', 1, 'whalimah@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('207', 'Gilda Kuswandari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Merdeka No. 858, Pematangsiantar 73090, Jabar', '0420 8974 300', '021 3514 727', '0', '0', '0', '0', '0', 1, 'jsuryono@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('208', 'Ghaliyati Pertiwi S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Diponegoro No. 933, Surakarta 90085, Sultra', '(+62) 28 1452 9442', '0323 6038 1584', '0', '0', '0', '0', '0', 1, 'kania.widodo@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('209', 'Simon Zulkarnain', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Veteran No. 148, Balikpapan 54250, Maluku', '(+62) 499 8609 4627', '(+62) 747 2428 707', '0', '0', '0', '0', '0', 1, 'halima.iswahyudi@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('21', 'Ratna Yuniar S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Asia Afrika No. 663, Pangkal Pinang 40972, Sulut', '0840 6781 6527', '0429 6850 9611', '0', '0', '0', '0', '0', 1, 'dian50@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('210', 'Kamidin Wibisono S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Supono No. 396, Bekasi 24480, Kalteng', '020 8628 665', '(+62) 591 9322 4554', '0', '0', '0', '0', '0', 1, 'whalim@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('211', 'Warsa Hakim', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bazuka Raya No. 446, Banjarmasin 76047, Riau', '(+62) 370 3907 132', '(+62) 809 4687 3128', '0', '0', '0', '0', '0', 1, 'bakti85@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('212', 'Fathonah Oktaviani M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Madiun No. 312, Tomohon 65920, Jatim', '(+62) 330 6769 1126', '024 2238 6465', '0', '0', '0', '0', '0', 1, 'kemba.usamah@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('213', 'Padma Oktaviani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Dago No. 73, Bitung 52155, Kalteng', '0747 6214 7950', '0797 8732 0503', '0', '0', '0', '0', '0', 1, 'msafitri@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('214', 'Prasetyo Caket Damanik', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Kalimalang No. 388, Makassar 96062, Kepri', '0786 6732 1890', '(+62) 980 4650 4989', '0', '0', '0', '0', '0', 1, 'laksita.dian@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('215', 'Melinda Safitri M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Ikan No. 110, Administrasi Jakarta Selatan 19680, Sulsel', '0444 1829 513', '0947 8386 676', '0', '0', '0', '0', '0', 1, 'rendy.hariyah@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('216', 'Queen Nuraini S.E.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bayam No. 346, Magelang 85532, Jatim', '(+62) 792 9183 964', '0481 1430 185', '0', '0', '0', '0', '0', 1, 'dagel46@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('217', 'Mala Safitri', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Industri No. 170, Tebing Tinggi 94488, DKI', '0547 4418 012', '0601 0269 7545', '0', '0', '0', '0', '0', 1, 'tina43@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('218', 'Samiah Rahimah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Gremet No. 453, Sorong 64103, NTT', '0872 1643 823', '(+62) 464 5283 0195', '0', '0', '0', '0', '0', 1, 'kjanuar@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('219', 'Luis Vinsen Anggriawan S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Badak No. 72, Palopo 11910, Kalsel', '0246 4675 2823', '028 3130 7599', '0', '0', '0', '0', '0', 1, 'bharyanti@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('22', 'Cahyono Narpati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jayawijaya No. 650, Sibolga 51501, Bengkulu', '(+62) 996 6279 5127', '0436 8983 7773', '0', '0', '0', '0', '0', 1, 'garda.wijayanti@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('220', 'Kamila Kusmawati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Wora Wari No. 524, Banjarbaru 68804, Kalbar', '029 9668 994', '0981 1340 195', '0', '0', '0', '0', '0', 1, 'samosir.luis@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('221', 'Lidya Rahayu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Juanda No. 709, Pangkal Pinang 98651, Riau', '0306 5596 088', '(+62) 860 179 939', '0', '0', '0', '0', '0', 1, 'eja60@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('222', 'Diah Ika Astuti S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Baja No. 828, Depok 13754, Malut', '0821 5136 2738', '0621 3494 347', '0', '0', '0', '0', '0', 1, 'ymardhiyah@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('223', 'Dina Julia Hassanah S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Samanhudi No. 944, Makassar 33443, Kalsel', '(+62) 898 4385 8803', '(+62) 806 326 062', '0', '0', '0', '0', '0', 1, 'gzulaika@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('224', 'Lala Puji Melani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gremet No. 347, Bandung 49461, Jambi', '0691 7102 889', '(+62) 479 7250 593', '0', '0', '0', '0', '0', 1, 'lpurnawati@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('225', 'Kunthara Mansur', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Pattimura No. 90, Jambi 69609, Sumut', '(+62) 209 9110 6826', '(+62) 311 6371 684', '0', '0', '0', '0', '0', 1, 'ana.hidayat@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('226', 'Halima Hariyah S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Haji No. 567, Sabang 35451, Gorontalo', '0855 5056 169', '(+62) 902 5264 2452', '0', '0', '0', '0', '0', 1, 'hartaka.namaga@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('227', 'Prabowo Marsito Hakim M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bass No. 126, Semarang 36102, NTT', '0616 0877 7711', '0819 0716 1223', '0', '0', '0', '0', '0', 1, 'lala.wijayanti@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('228', 'Xanana Lazuardi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gardujati No. 781, Tebing Tinggi 30774, Sulut', '0856 5695 354', '(+62) 581 3119 127', '0', '0', '0', '0', '0', 1, 'rina.hartati@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('229', 'Mujur Saputra', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bahagia  No. 997, Palangka Raya 95741, Sumsel', '0216 1298 034', '(+62) 410 7709 0968', '0', '0', '0', '0', '0', 1, 'ypermadi@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('23', 'Chandra Zulkarnain S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Teuku Umar No. 317, Administrasi Jakarta Timur 14658, Banten', '0244 7087 191', '(+62) 824 760 801', '0', '0', '0', '0', '0', 1, 'ade.yolanda@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('230', 'Wasis Hakim', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ekonomi No. 376, Ternate 52828, Sulut', '0405 9241 827', '(+62) 24 6631 283', '0', '0', '0', '0', '0', 1, 'hidayanto.hani@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('231', 'Dina Aryani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bhayangkara No. 897, Denpasar 87722, Banten', '(+62) 399 5838 439', '0316 7389 377', '0', '0', '0', '0', '0', 1, 'gina06@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('232', 'Elisa Puspita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Kiaracondong No. 639, Pariaman 17743, Sulteng', '0340 8993 6636', '(+62) 20 3891 527', '0', '0', '0', '0', '0', 1, 'frahimah@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('233', 'Ayu Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Cokroaminoto No. 933, Tegal 73489, NTT', '0897 8887 6881', '0479 4736 353', '0', '0', '0', '0', '0', 1, 'vwibisono@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('234', 'Praba Edison Manullang S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Imam Bonjol No. 53, Tangerang Selatan 67294, Kaltim', '0818 650 908', '(+62) 776 1517 634', '0', '0', '0', '0', '0', 1, 'rmelani@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('235', 'Himawan Permadi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bakit  No. 527, Manado 66832, Jateng', '(+62) 787 0325 4726', '0312 2292 9060', '0', '0', '0', '0', '0', 1, 'fyuliarti@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('236', 'Makuta Dabukke S.H.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Pasteur No. 648, Bandar Lampung 98040, Bengkulu', '(+62) 24 0970 684', '(+62) 602 9415 4371', '0', '0', '0', '0', '0', 1, 'ani.riyanti@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('237', 'Puji Halimah S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cikutra Timur No. 899, Pematangsiantar 72995, Kepri', '(+62) 785 3668 9908', '(+62) 631 1060 943', '0', '0', '0', '0', '0', 1, 'michelle.nuraini@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('238', 'Omar Danuja Hutasoit S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tentara Pelajar No. 21, Mojokerto 30877, Jabar', '(+62) 891 3869 6855', '(+62) 746 2049 186', '0', '0', '0', '0', '0', 1, 'ajeng89@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('239', 'Garang Sitompul', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gegerkalong Hilir No. 205, Padang 73113, Sulteng', '(+62) 20 3576 0301', '0881 775 179', '0', '0', '0', '0', '0', 1, 'latupono.mutia@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('24', 'Amalia Mardhiyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakau Griya Utama No. 338, Surakarta 80408, Malut', '0991 6464 3865', '(+62) 744 0077 870', '0', '0', '0', '0', '0', 1, 'asirwanda10@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('240', 'Cinthia Yulianti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Sutarto No. 204, Jambi 23933, Gorontalo', '(+62) 971 7525 9332', '0585 6242 8200', '0', '0', '0', '0', '0', 1, 'maras.handayani@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('241', 'Karen Yulianti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Sutan Syahrir No. 471, Bau-Bau 14575, Aceh', '(+62) 316 0234 9227', '(+62) 611 6039 933', '0', '0', '0', '0', '0', 1, 'pertiwi.oliva@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('242', 'Yulia Irma Pudjiastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Salam No. 9, Kendari 33797, Kaltara', '(+62) 951 7005 508', '(+62) 445 4652 0209', '0', '0', '0', '0', '0', 1, 'putri.mardhiyah@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('243', 'Jumadi Himawan Kuswoyo S.Sos', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Umalas No. 834, Lubuklinggau 31135, NTB', '0510 4284 3253', '(+62) 837 8592 022', '0', '0', '0', '0', '0', 1, 'victoria.pratama@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('244', 'Margana Dongoran S.E.I', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Wahidin No. 539, Bandung 14929, Kalbar', '0631 5889 809', '(+62) 831 9314 095', '0', '0', '0', '0', '0', 1, 'prastuti.fitria@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('245', 'Okto Mitra Putra', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bara Tambar No. 378, Palangka Raya 53700, Pabar', '(+62) 26 3491 0480', '(+62) 977 3136 0804', '0', '0', '0', '0', '0', 1, 'shania.mansur@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('246', 'Ivan Adriansyah S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Flores No. 68, Palu 33948, Malut', '(+62) 379 8582 1837', '(+62) 798 1087 5871', '0', '0', '0', '0', '0', 1, 'rosman74@example.net', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('247', 'Mumpuni Setiawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Untung Suropati No. 353, Pontianak 96198, Kaltim', '0746 2322 653', '0485 3464 881', '0', '0', '0', '0', '0', 1, 'pia32@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('248', 'Sakti Suwarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gambang No. 991, Padang 40836, Papua', '0705 3461 6495', '(+62) 395 6865 3359', '0', '0', '0', '0', '0', 1, 'michelle.halimah@example.com', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('249', 'Perkasa Galak Siregar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. R.M. Said No. 589, Banjar 86692, Jatim', '(+62) 594 3910 8583', '(+62) 990 7066 4801', '0', '0', '0', '0', '0', 1, 'kusumo.mariadi@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('25', 'Kawaya Jail Napitupulu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Laksamana No. 859, Lubuklinggau 35932, Kalsel', '0981 6674 8348', '(+62) 857 2514 972', '0', '0', '0', '0', '0', 1, 'pwasita@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('250', 'Bakidin Saragih', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Siliwangi No. 463, Medan 50633, DKI', '0915 8989 914', '(+62) 307 9808 1599', '0', '0', '0', '0', '0', 1, 'maryanto.yuliarti@example.org', 1, 1, 'Tidak', '1', '14901', '-', 2022),
('251', 'Dina Lili Mardhiyah M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Wahidin Sudirohusodo No. 740, Manado 87770, Pabar', '0753 4704 6419', '0885 352 245', '0', '0', '0', '0', '0', 1, 'januar.ibrani@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('252', 'Vanesa Puji Yuliarti S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Ketandan No. 865, Padangpanjang 58176, DKI', '0782 6299 4092', '(+62) 819 3732 742', '0', '0', '0', '0', '0', 1, 'puti43@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('253', 'Jais Thamrin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Jaksa No. 671, Tual 89888, Sulsel', '0619 7918 9469', '0329 6056 2093', '0', '0', '0', '0', '0', 1, 'kuswandari.cakrabuana@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('254', 'Balapati Hidayanto M.M.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gremet No. 420, Bogor 71419, Malut', '(+62) 297 0717 677', '(+62) 28 3275 4787', '0', '0', '0', '0', '0', 1, 'fathonah.zulaika@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('255', 'Unggul Manullang', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Gremet No. 287, Sorong 25395, Gorontalo', '(+62) 237 9052 313', '0515 8108 2181', '0', '0', '0', '0', '0', 1, 'sihombing.laksana@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('256', 'Nadia Cindy Mayasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Babakan No. 253, Cirebon 31329, Riau', '(+62) 364 9197 9465', '(+62) 893 2429 686', '0', '0', '0', '0', '0', 1, 'eoktaviani@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('257', 'Gadang Hutapea S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Elang No. 737, Pasuruan 45795, Aceh', '(+62) 390 8302 807', '(+62) 303 8327 4629', '0', '0', '0', '0', '0', 1, 'cawisadi24@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('258', 'Hana Pratiwi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ir. H. Juanda No. 492, Padangsidempuan 40991, NTT', '0286 8594 547', '(+62) 356 9681 9647', '0', '0', '0', '0', '0', 1, 'laksmiwati.rina@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('259', 'Banawi Nasrullah Mustofa', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Babakan No. 921, Surakarta 92482, Malut', '0263 1572 4496', '(+62) 272 5977 1695', '0', '0', '0', '0', '0', 1, 'labuh40@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('26', 'Kenes Hardiansyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tambak No. 905, Langsa 10642, Malut', '(+62) 911 9722 3494', '0419 3123 468', '0', '0', '0', '0', '0', 1, 'anastasia.safitri@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('260', 'Keisha Halimah S.IP', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ters. Jakarta No. 535, Salatiga 31348, DIY', '0348 6139 778', '(+62) 447 9107 6182', '0', '0', '0', '0', '0', 1, 'makuta33@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('261', 'Kayla Novitasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Cikapayang No. 510, Palangka Raya 73216, Kaltara', '0726 6604 3945', '(+62) 581 5131 6348', '0', '0', '0', '0', '0', 1, 'lidya65@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('262', 'Kartika Hastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sudiarto No. 208, Bau-Bau 74026, Sulsel', '0600 5394 619', '(+62) 948 4687 169', '0', '0', '0', '0', '0', 1, 'maryadi.kuswandari@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('263', 'Lega Kusumo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ciwastra No. 547, Bitung 36717, Bali', '0544 2379 048', '0582 5358 475', '0', '0', '0', '0', '0', 1, 'ade75@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('264', 'Ega Balapati Firgantoro', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Jagakarsa No. 998, Administrasi Jakarta Utara 49207, Kepri', '(+62) 967 6692 8728', '0558 3637 2720', '0', '0', '0', '0', '0', 1, 'maryanto.setiawan@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022);
INSERT INTO `mahasiswa` (`npm`, `nama_mhs`, `jenis_kelamin`, `tangal_lahir`, `tempat_lahir`, `idAgama`, `idKewarganegaraan`, `nik`, `nisn`, `npwp`, `jalan`, `telephone`, `handphone`, `dusun`, `rt`, `rw`, `kelurahan`, `kecamatan`, `idJenisTinggal`, `email`, `idAlatTransportasi`, `idOrangTuaWali`, `kebutuhanKhusus`, `idProgramMhs`, `idProgramStudi`, `fotoMhs`, `angkatan`) VALUES
('265', 'Dipa Kusuma Tampubolon M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. HOS. Cjokroaminoto (Pasirkaliki) No. 916, Palangka Raya 61286, NTT', '(+62) 876 027 011', '(+62) 841 2245 4305', '0', '0', '0', '0', '0', 1, 'dalima58@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('266', 'Prayitna Liman Pratama', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Bagis Utama No. 661, Pagar Alam 65366, Sumut', '0687 8031 0549', '0958 2314 543', '0', '0', '0', '0', '0', 1, 'erik60@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('267', 'Mulya Legawa Iswahyudi M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Abdul. Muis No. 444, Tanjung Pinang 30738, Bali', '(+62) 858 6028 0167', '(+62) 561 3111 937', '0', '0', '0', '0', '0', 1, 'winarsih.aisyah@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('268', 'Rachel Yuliarti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bara No. 442, Tarakan 26428, NTB', '(+62) 415 7460 492', '(+62) 21 3651 1963', '0', '0', '0', '0', '0', 1, 'unggul.laksmiwati@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('269', 'Rusman Drajat Waskita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Arifin No. 203, Subulussalam 13299, Sulsel', '(+62) 957 2565 8468', '0553 1182 5717', '0', '0', '0', '0', '0', 1, 'lailasari.agnes@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('27', 'Zizi Lestari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Raden No. 612, Palopo 51672, Bengkulu', '(+62) 342 2762 5293', '0299 8805 7857', '0', '0', '0', '0', '0', 1, 'fitria.yuniar@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('270', 'Prayoga Rama Gunawan M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bakau Griya Utama No. 399, Tanjungbalai 72140, Riau', '(+62) 27 9674 3444', '(+62) 746 7706 794', '0', '0', '0', '0', '0', 1, 'budiman.laras@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('271', 'Jefri Kurniawan S.Pt', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Cikapayang No. 390, Bukittinggi 59258, Jateng', '0423 5203 346', '0367 2955 320', '0', '0', '0', '0', '0', 1, 'wulan.padmasari@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('272', 'Tasnim Rajasa', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bakhita No. 868, Sabang 74531, Gorontalo', '0863 2705 088', '0490 2732 693', '0', '0', '0', '0', '0', 1, 'aisyah.hartati@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('273', 'Edi Prasasta', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Cikutra Timur No. 72, Banjarmasin 15030, Jatim', '0812 229 992', '0743 3809 898', '0', '0', '0', '0', '0', 1, 'usamah.vinsen@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('274', 'Gilda Novitasari M.Kom.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Yos No. 800, Kediri 41706, Kaltara', '0382 8063 732', '(+62) 977 4399 009', '0', '0', '0', '0', '0', 1, 'sabar.mardhiyah@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('275', 'Lulut Zulkarnain', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Jakarta No. 521, Sabang 37258, NTB', '(+62) 240 3907 754', '0687 8565 8740', '0', '0', '0', '0', '0', 1, 'usman87@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('276', 'Gada Nasrullah Sihombing M.Ak', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Ters. Kiaracondong No. 657, Kupang 78786, Kepri', '(+62) 29 1603 5257', '0216 0191 6487', '0', '0', '0', '0', '0', 1, 'ffujiati@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('277', 'Winda Susanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Warga No. 729, Bitung 49339, Kaltim', '0545 5163 754', '(+62) 531 0548 3165', '0', '0', '0', '0', '0', 1, 'radit.pradipta@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('278', 'Latika Tina Fujiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Sam Ratulangi No. 317, Gunungsitoli 68755, Kaltim', '(+62) 985 1953 8357', '(+62) 934 8327 800', '0', '0', '0', '0', '0', 1, 'rudi.zulaika@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('279', 'Tira Hartati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Babah No. 247, Banjarmasin 59642, Lampung', '027 0450 5901', '0823 6681 504', '0', '0', '0', '0', '0', 1, 'wbudiman@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('28', 'Wani Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baan No. 114, Lhokseumawe 54608, Sumsel', '(+62) 541 4409 674', '0713 6689 048', '0', '0', '0', '0', '0', 1, 'bakiono19@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('280', 'Sabar Luhung Irawan S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Jend. Sudirman No. 480, Mojokerto 38721, Sulteng', '(+62) 293 7996 6825', '(+62) 546 3322 1744', '0', '0', '0', '0', '0', 1, 'manah67@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('281', 'Prakosa Embuh Maulana', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baja Raya No. 218, Banda Aceh 31097, DKI', '(+62) 904 5367 232', '(+62) 563 3423 0008', '0', '0', '0', '0', '0', 1, 'xlailasari@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('282', 'Endah Prastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Yos No. 350, Pangkal Pinang 36939, Sumsel', '0926 4747 9691', '0945 3740 326', '0', '0', '0', '0', '0', 1, 'tirtayasa.januar@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('283', 'Samiah Aisyah Lestari S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Hasanuddin No. 322, Tangerang 32217, NTT', '(+62) 882 9219 574', '(+62) 630 0779 0993', '0', '0', '0', '0', '0', 1, 'trahmawati@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('284', 'Kartika Azalea Uyainah S.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sudiarto No. 719, Sungai Penuh 89556, Jateng', '(+62) 259 8000 566', '(+62) 28 9710 9277', '0', '0', '0', '0', '0', 1, 'hoktaviani@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('285', 'Hamima Sarah Hassanah S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. M.T. Haryono No. 257, Depok 10065, NTT', '(+62) 465 5690 5168', '(+62) 498 1902 8044', '0', '0', '0', '0', '0', 1, 'pratiwi.lamar@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('286', 'Michelle Nasyidah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Pelajar Pejuang 45 No. 286, Padangsidempuan 12959, Sumut', '0833 6881 500', '0525 1068 542', '0', '0', '0', '0', '0', 1, 'artanto19@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('287', 'Wardaya Najmudin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Antapani Lama No. 249, Padangpanjang 10326, Jabar', '0206 7956 4459', '(+62) 948 3826 361', '0', '0', '0', '0', '0', 1, 'ajiman70@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('288', 'Humaira Maya Rahimah S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Yogyakarta No. 757, Kediri 68814, Sulsel', '0964 0078 990', '0988 8512 0256', '0', '0', '0', '0', '0', 1, 'jasmin.setiawan@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('289', 'Kayla Rahayu M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Dipenogoro No. 119, Pagar Alam 60172, NTB', '(+62) 556 2906 695', '0896 261 914', '0', '0', '0', '0', '0', 1, 'galak16@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('29', 'Michelle Kasiyah Wijayanti S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Muwardi No. 490, Sabang 66323, Sulsel', '(+62) 26 1922 072', '(+62) 601 4867 0052', '0', '0', '0', '0', '0', 1, 'jaka.pratama@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('290', 'Salimah Hasanah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Achmad No. 777, Lubuklinggau 55362, Sumsel', '(+62) 975 3702 491', '0501 4988 630', '0', '0', '0', '0', '0', 1, 'zaenab.oktaviani@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('291', 'Pandu Dongoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bhayangkara No. 525, Bogor 17784, Kalteng', '0265 8042 105', '(+62) 639 8152 253', '0', '0', '0', '0', '0', 1, 'kemba.wahyudin@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('292', 'Winda Oliva Hariyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Kusmanto No. 144, Balikpapan 32372, Sulsel', '(+62) 315 0702 0942', '(+62) 277 9200 2344', '0', '0', '0', '0', '0', 1, 'edongoran@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('293', 'Elma Paris Pudjiastuti S.I.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Lumban Tobing No. 50, Sungai Penuh 89142, Jatim', '(+62) 345 4420 7842', '0932 7773 9789', '0', '0', '0', '0', '0', 1, 'salsabila38@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('294', 'Tania Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Gajah Mada No. 397, Palembang 65918, NTB', '0630 6227 223', '(+62) 983 6342 3960', '0', '0', '0', '0', '0', 1, 'tari.narpati@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('295', 'Raditya Eluh Sihotang S.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Antapani Lama No. 434, Banjarbaru 79982, Babel', '0284 6200 9599', '(+62) 849 4359 471', '0', '0', '0', '0', '0', 1, 'stamba@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('296', 'Anom Kuswoyo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Astana Anyar No. 373, Gorontalo 20884, Bengkulu', '(+62) 25 4791 501', '0698 5092 5388', '0', '0', '0', '0', '0', 1, 'wwibowo@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('297', 'Cawuk Sihotang', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Yos No. 309, Singkawang 78345, Sulbar', '(+62) 556 3756 616', '(+62) 22 3184 0404', '0', '0', '0', '0', '0', 1, 'hasanah.gamanto@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('298', 'Citra Tina Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bakit  No. 744, Kendari 51504, Kaltara', '(+62) 884 6685 7030', '(+62) 364 8774 639', '0', '0', '0', '0', '0', 1, 'kunthara10@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('299', 'Aditya Umaya Megantara S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Achmad Yani No. 893, Tebing Tinggi 51921, Kalsel', '0831 842 358', '0609 7593 109', '0', '0', '0', '0', '0', 1, 'natalia14@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('3', 'Vinsen Drajat Sitompul S.IP', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gardujati No. 954, Tual 90338, Pabar', '0835 6405 463', '0427 0463 5096', '0', '0', '0', '0', '0', 1, 'timbul07@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('30', 'Jail Daliman Halim S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Suniaraja No. 998, Depok 51747, Aceh', '(+62) 642 9793 556', '(+62) 961 8402 052', '0', '0', '0', '0', '0', 1, 'znababan@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('300', 'Latif Nardi Irawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Yohanes No. 484, Cilegon 25022, Sulteng', '(+62) 983 4898 417', '0822 3367 5605', '0', '0', '0', '0', '0', 1, 'rahmi.hardiansyah@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2022),
('301', 'Kurnia Adika Wahyudin S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Ters. Jakarta No. 125, Palu 44153, Sulsel', '(+62) 931 8225 339', '0841 3081 2249', '0', '0', '0', '0', '0', 1, 'baktiadi.melani@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('302', 'Aditya Ardianto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Dipenogoro No. 807, Pontianak 20184, Kalsel', '0738 2100 673', '(+62) 29 0770 491', '0', '0', '0', '0', '0', 1, 'diana16@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('303', 'Raden Budiyanto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Babadak No. 634, Cimahi 90147, Sumbar', '0201 5750 908', '(+62) 392 7333 3436', '0', '0', '0', '0', '0', 1, 'betania.habibi@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('304', 'Tina Hariyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Umalas No. 541, Padangpanjang 33671, Kepri', '0925 4623 1927', '020 3087 3839', '0', '0', '0', '0', '0', 1, 'maman26@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('305', 'Jono Situmorang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Tangkuban Perahu No. 997, Tomohon 16298, DIY', '(+62) 672 6074 257', '(+62) 420 1916 349', '0', '0', '0', '0', '0', 1, 'ibudiman@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('306', 'Zulaikha Halimah M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bank Dagang Negara No. 330, Madiun 51405, Sulut', '0669 4774 987', '(+62) 589 5125 3078', '0', '0', '0', '0', '0', 1, 'panji13@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('307', 'Gilda Padmasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bara Tambar No. 745, Jayapura 31911, Sulbar', '0503 4703 437', '0435 6200 176', '0', '0', '0', '0', '0', 1, 'zulfa.puspita@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('308', 'Widya Rahayu', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. B.Agam Dlm No. 693, Dumai 44170, Banten', '(+62) 313 9019 151', '0681 4241 6445', '0', '0', '0', '0', '0', 1, 'suci.uwais@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('309', 'Mulya Najmudin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Dipenogoro No. 804, Tarakan 38050, Kalbar', '0274 2115 076', '(+62) 641 9902 1059', '0', '0', '0', '0', '0', 1, 'cyulianti@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('31', 'Jail Reksa Tampubolon S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cikutra Barat No. 824, Tomohon 57811, Aceh', '(+62) 992 1634 0711', '(+62) 862 9862 0200', '0', '0', '0', '0', '0', 1, 'radika.padmasari@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('310', 'Azalea Tania Puspita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Pasirkoja No. 959, Bukittinggi 92016, Sumut', '(+62) 419 8991 600', '(+62) 24 3181 941', '0', '0', '0', '0', '0', 1, 'padma15@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('311', 'Kezia Utami', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Jayawijaya No. 36, Salatiga 58453, Riau', '0800 326 923', '(+62) 655 3626 1190', '0', '0', '0', '0', '0', 1, 'hasim.megantara@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('312', 'Bahuraksa Hutapea', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Suryo No. 713, Semarang 78109, Sulteng', '0803 4207 7639', '(+62) 299 9533 948', '0', '0', '0', '0', '0', 1, 'mayasari.syahrini@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('313', 'Agnes Mutia Nuraini', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bakti No. 692, Gunungsitoli 74103, Bengkulu', '0282 3762 4574', '0633 6502 220', '0', '0', '0', '0', '0', 1, 'gilang99@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('314', 'Cahya Widodo M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Tangkuban Perahu No. 449, Payakumbuh 33294, NTB', '(+62) 560 5242 432', '(+62) 304 9515 7482', '0', '0', '0', '0', '0', 1, 'gtamba@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('315', 'Intan Sudiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sugiyopranoto No. 390, Bukittinggi 47200, Sulteng', '(+62) 460 9439 5921', '0283 4513 514', '0', '0', '0', '0', '0', 1, 'kani16@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('316', 'Pangeran Kurniawan S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Kartini No. 256, Blitar 73235, Bengkulu', '0363 5907 289', '0366 1980 883', '0', '0', '0', '0', '0', 1, 'sihombing.eka@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('317', 'Atma Lazuardi S.I.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Bacang No. 147, Pontianak 46546, Bengkulu', '0472 8157 5648', '(+62) 847 6263 371', '0', '0', '0', '0', '0', 1, 'cindy78@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('318', 'Mitra Najam Firmansyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Honggowongso No. 35, Payakumbuh 49376, Sumsel', '0363 8281 960', '0789 1377 8770', '0', '0', '0', '0', '0', 1, 'irma51@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('319', 'Dian Fujiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Dahlia No. 227, Parepare 63340, Riau', '(+62) 597 0282 3664', '(+62) 22 5013 7783', '0', '0', '0', '0', '0', 1, 'maryati.chandra@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('32', 'Wisnu Wahyudin S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Pasirkoja No. 718, Payakumbuh 44981, NTT', '(+62) 810 1651 5185', '(+62) 982 4677 8438', '0', '0', '0', '0', '0', 1, 'spuspita@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('320', 'Raditya Naradi Sihombing S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bata Putih No. 604, Bogor 46814, Gorontalo', '(+62) 538 1012 665', '(+62) 855 5491 2415', '0', '0', '0', '0', '0', 1, 'safitri.suci@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('321', 'Darijan Aswani Permadi M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Dipatiukur No. 127, Sungai Penuh 50673, Kalsel', '0973 8241 2229', '(+62) 365 3976 253', '0', '0', '0', '0', '0', 1, 'harsana12@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('322', 'Ulya Kuswandari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bagis Utama No. 524, Mojokerto 13704, Sulbar', '027 8288 040', '(+62) 464 2405 1496', '0', '0', '0', '0', '0', 1, 'yoga.usamah@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('323', 'Sakura Farida', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Umalas No. 619, Langsa 18745, Sulsel', '(+62) 456 2063 1208', '0764 6454 9313', '0', '0', '0', '0', '0', 1, 'cnababan@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('324', 'Genta Zizi Wahyuni S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gambang No. 913, Administrasi Jakarta Utara 11671, Jatim', '(+62) 283 1838 0667', '(+62) 755 1278 5608', '0', '0', '0', '0', '0', 1, 'ulva06@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('325', 'Suci Permata', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Imam Bonjol No. 514, Administrasi Jakarta Barat 26795, Banten', '025 4700 6813', '(+62) 881 2989 373', '0', '0', '0', '0', '0', 1, 'budiyanto.rachel@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('326', 'Putri Lestari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. W.R. Supratman No. 298, Tanjungbalai 32035, NTB', '0345 2487 9400', '(+62) 24 2065 739', '0', '0', '0', '0', '0', 1, 'estiawan80@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('327', 'Ganep Sinaga', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Orang No. 388, Probolinggo 14933, Kalsel', '0970 9377 454', '0787 0203 952', '0', '0', '0', '0', '0', 1, 'bahuwirya59@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('328', 'Cahyono Irfan Maryadi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Rajawali Barat No. 8, Tangerang Selatan 78869, Riau', '0687 9637 4227', '0294 2393 974', '0', '0', '0', '0', '0', 1, 'ikuswandari@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('329', 'Jaswadi Haryanto', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Uluwatu No. 829, Banjar 68983, Sumsel', '0962 5233 334', '(+62) 588 3329 978', '0', '0', '0', '0', '0', 1, 'ibrahim.januar@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('33', 'Surya Nainggolan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sentot Alibasa No. 905, Cimahi 49853, Papua', '(+62) 542 5346 290', '0746 8046 800', '0', '0', '0', '0', '0', 1, 'kayla20@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('330', 'Kenzie Lazuardi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Abdul. Muis No. 702, Salatiga 32544, Babel', '(+62) 412 8569 3013', '0943 1230 2683', '0', '0', '0', '0', '0', 1, 'hhariyah@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('331', 'Hesti Utami', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Kali No. 471, Salatiga 37999, Kaltim', '(+62) 559 7782 8088', '0320 8782 0516', '0', '0', '0', '0', '0', 1, 'bajragin.mandala@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('332', 'Cakrawangsa Mahendra S.Sos', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Barat No. 241, Palu 77314, Jambi', '(+62) 937 5186 713', '0241 9453 3408', '0', '0', '0', '0', '0', 1, 'winarsih.melinda@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('333', 'Clara Mulyani M.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. K.H. Maskur No. 200, Tebing Tinggi 97121, DIY', '(+62) 581 9421 813', '0243 9353 3911', '0', '0', '0', '0', '0', 1, 'hsitorus@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('334', 'Yuni Melinda Prastuti S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Diponegoro No. 737, Mataram 72914, Aceh', '(+62) 921 5423 309', '0915 1819 0891', '0', '0', '0', '0', '0', 1, 'wpadmasari@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('335', 'Balijan Gunawan S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Basuki Rahmat  No. 615, Padang 45800, Sulteng', '(+62) 856 121 729', '0303 5053 3375', '0', '0', '0', '0', '0', 1, 'gamani10@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('336', 'Nasrullah Utama S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Jayawijaya No. 21, Yogyakarta 67691, Riau', '026 0200 7546', '(+62) 458 9736 106', '0', '0', '0', '0', '0', 1, 'pranowo.usyi@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('337', 'Cinthia Ilsa Fujiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Adisumarmo No. 145, Tegal 55446, Banten', '0767 0025 710', '(+62) 578 8618 398', '0', '0', '0', '0', '0', 1, 'adiarja.firmansyah@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('338', 'Marsudi Situmorang', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Suryo Pranoto No. 169, Binjai 42863, Sulut', '0945 7783 734', '(+62) 899 2431 457', '0', '0', '0', '0', '0', 1, 'uyainah.nilam@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('339', 'Raisa Kuswandari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Eka No. 110, Pontianak 80687, Kalsel', '(+62) 287 2802 6136', '(+62) 935 5799 995', '0', '0', '0', '0', '0', 1, 'elvina34@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('34', 'Halim Adriansyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Babadan No. 34, Tebing Tinggi 10083, Jabar', '0586 9431 7994', '(+62) 402 6546 557', '0', '0', '0', '0', '0', 1, 'carla.prastuti@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('340', 'Widya Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bakin No. 160, Administrasi Jakarta Pusat 16892, Aceh', '0430 7419 2719', '(+62) 888 1418 810', '0', '0', '0', '0', '0', 1, 'ajiono.pangestu@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('341', 'Perkasa Bancar Santoso S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Rajiman No. 850, Tarakan 77574, Sumsel', '(+62) 509 1164 205', '(+62) 975 8808 142', '0', '0', '0', '0', '0', 1, 'indra.napitupulu@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('342', 'Siti Wastuti S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Hasanuddin No. 930, Padangpanjang 93760, NTT', '0558 0116 977', '(+62) 531 4372 800', '0', '0', '0', '0', '0', 1, 'ani38@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('343', 'Gara Hasim Pratama S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bakit  No. 771, Tangerang Selatan 56973, Kaltara', '(+62) 346 5347 9811', '(+62) 386 0427 7472', '0', '0', '0', '0', '0', 1, 'pranowo.nasrullah@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('344', 'Malika Maida Safitri S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Untung Suropati No. 596, Kupang 52083, Sumsel', '(+62) 546 8172 1308', '(+62) 883 763 460', '0', '0', '0', '0', '0', 1, 'chalim@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('345', 'Panji Kurniawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tangkuban Perahu No. 400, Bitung 90216, Sumut', '0496 7775 2320', '(+62) 927 1866 496', '0', '0', '0', '0', '0', 1, 'tomi.iswahyudi@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('346', 'Sari Dian Winarsih S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Pasir Koja No. 405, Tegal 77404, Sumbar', '(+62) 462 3588 3879', '0606 4811 4558', '0', '0', '0', '0', '0', 1, 'irma.wijayanti@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('347', 'Nadia Sudiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Halim No. 799, Denpasar 67319, Maluku', '0369 1915 197', '(+62) 828 910 524', '0', '0', '0', '0', '0', 1, 'wasita.mulya@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('348', 'Syahrini Fitriani Usamah S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Antapani Lama No. 249, Payakumbuh 25733, DIY', '(+62) 444 8093 814', '(+62) 244 6600 9627', '0', '0', '0', '0', '0', 1, 'alika83@example.net', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('349', 'Ghaliyati Aryani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bank Dagang Negara No. 960, Ambon 22029, DIY', '(+62) 883 1730 6945', '(+62) 735 3184 5842', '0', '0', '0', '0', '0', 1, 'shania.gunarto@example.org', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('35', 'Oni Hassanah S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. PHH. Mustofa No. 897, Prabumulih 37817, Kepri', '(+62) 491 2343 929', '0705 3262 379', '0', '0', '0', '0', '0', 1, 'iuyainah@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('350', 'Julia Mulyani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Jamika No. 676, Kotamobagu 11889, Aceh', '(+62) 681 0089 1501', '0662 6973 505', '0', '0', '0', '0', '0', 1, 'saragih.farhunnisa@example.com', 1, 1, 'Tidak', '1', '54201', '-', 2018),
('351', 'Elisa Dinda Yuniar S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Kalimalang No. 503, Kendari 24151, Maluku', '(+62) 670 6973 5125', '0771 8454 392', '0', '0', '0', '0', '0', 1, 'sihombing.padma@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('352', 'Gangsa Raihan Januar M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Basoka Raya No. 179, Ambon 59944, Sulteng', '(+62) 870 0066 1756', '0977 3792 569', '0', '0', '0', '0', '0', 1, 'mansur.irfan@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('353', 'Tirta Tirta Prasasta S.E.I', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Sukajadi No. 806, Langsa 29846, Kepri', '(+62) 698 4103 372', '0850 5259 130', '0', '0', '0', '0', '0', 1, 'wani.suwarno@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('354', 'Gilda Nuraini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Thamrin No. 716, Tual 97714, Sulteng', '0243 1290 8238', '(+62) 939 2517 680', '0', '0', '0', '0', '0', 1, 'farida.kamidin@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('355', 'Julia Usada', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Raya Setiabudhi No. 975, Administrasi Jakarta Pusat 93264, Jambi', '(+62) 327 6899 874', '0734 0055 4593', '0', '0', '0', '0', '0', 1, 'gutami@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('356', 'Bagya Danu Uwais M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. K.H. Wahid Hasyim (Kopo) No. 305, Probolinggo 51135, Sulut', '0801 3662 799', '0844 027 472', '0', '0', '0', '0', '0', 1, 'safina56@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('357', 'Danang Nugroho', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Baladewa No. 706, Bau-Bau 11023, Sulbar', '(+62) 705 5558 104', '0983 6552 6147', '0', '0', '0', '0', '0', 1, 'lutfan.yuliarti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('358', 'Dipa Kuswoyo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Imam Bonjol No. 731, Tebing Tinggi 69816, Lampung', '(+62) 551 1890 1037', '(+62) 933 6044 0308', '0', '0', '0', '0', '0', 1, 'hadi.hassanah@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('359', 'Ganda Iswahyudi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bahagia No. 911, Semarang 73248, Kaltim', '(+62) 532 9957 818', '(+62) 257 9989 482', '0', '0', '0', '0', '0', 1, 'krajasa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('36', 'Salimah Betania Purwanti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Suryo No. 433, Tegal 80526, Kepri', '0680 2075 8252', '(+62) 637 6833 8866', '0', '0', '0', '0', '0', 1, 'rhutasoit@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('360', 'Rahmi Anggraini S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Baya Kali Bungur No. 858, Gorontalo 55680, Gorontalo', '0561 8198 361', '(+62) 27 3165 0699', '0', '0', '0', '0', '0', 1, 'ira43@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('361', 'Shania Fujiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Baan No. 83, Administrasi Jakarta Pusat 22829, Sultra', '0729 0561 818', '(+62) 689 3403 9394', '0', '0', '0', '0', '0', 1, 'mayasari.prabu@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('362', 'Hairyanto Widodo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Suryo Pranoto No. 861, Banjarmasin 43773, Lampung', '(+62) 21 3407 5953', '0918 2711 6722', '0', '0', '0', '0', '0', 1, 'palastri.jail@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('363', 'Karen Anggraini S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Labu No. 102, Semarang 24813, DKI', '(+62) 655 4789 3984', '0728 1374 742', '0', '0', '0', '0', '0', 1, 'gtamba@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('364', 'Clara Purnawati S.Pt', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Adisucipto No. 779, Lhokseumawe 95785, Maluku', '0280 4143 9852', '(+62) 354 2559 861', '0', '0', '0', '0', '0', 1, 'andriani.zaenab@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('365', 'Tedi Ardianto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bakti No. 235, Administrasi Jakarta Utara 35955, Sumsel', '0235 2054 000', '0480 2192 6237', '0', '0', '0', '0', '0', 1, 'laksita.mumpuni@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('366', 'Gada Prabowo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Achmad No. 482, Surakarta 36018, Riau', '(+62) 837 3945 5715', '(+62) 969 2264 072', '0', '0', '0', '0', '0', 1, 'bagya42@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('367', 'Yessi Kezia Nasyidah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Kyai Mojo No. 414, Palembang 13017, Jatim', '(+62) 349 3950 5597', '0828 7563 054', '0', '0', '0', '0', '0', 1, 'utami.among@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('368', 'Puti Yuliarti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ekonomi No. 470, Administrasi Jakarta Barat 73957, NTB', '0718 5652 287', '0296 9594 5926', '0', '0', '0', '0', '0', 1, 'lembah09@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('369', 'Dian Malika Uyainah S.Psi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Karel S. Tubun No. 57, Padang 75376, Sumbar', '0743 9582 6821', '(+62) 663 7270 527', '0', '0', '0', '0', '0', 1, 'darimin.yuniar@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('37', 'Gaduh Banara Saragih M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sumpah Pemuda No. 139, Palu 93065, Kepri', '0265 1632 1397', '024 1417 6252', '0', '0', '0', '0', '0', 1, 'budiman.laras@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('370', 'Yahya Halim', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Sukabumi No. 587, Lhokseumawe 68376, Jabar', '(+62) 874 8069 2653', '(+62) 634 1184 528', '0', '0', '0', '0', '0', 1, 'luwes.susanti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('371', 'Ina Mayasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Setiabudhi No. 77, Ternate 10603, Jabar', '(+62) 972 5198 470', '(+62) 295 5083 050', '0', '0', '0', '0', '0', 1, 'janet.firgantoro@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('372', 'Ayu Andriani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Raden No. 513, Parepare 30536, Babel', '(+62) 915 3682 362', '(+62) 27 8330 651', '0', '0', '0', '0', '0', 1, 'candrakanta55@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('373', 'Zulaikha Nasyidah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Kalimalang No. 535, Pangkal Pinang 29137, Sumut', '(+62) 282 4314 8403', '(+62) 918 1072 4642', '0', '0', '0', '0', '0', 1, 'handayani.dacin@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('374', 'Atma Suwarno M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Sugiyopranoto No. 287, Singkawang 82518, Sultra', '022 9238 3352', '0628 2972 449', '0', '0', '0', '0', '0', 1, 'nrima20@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('375', 'Jumari Galih Latupono', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Elang No. 989, Kediri 61955, Babel', '(+62) 657 3834 5680', '(+62) 26 5655 645', '0', '0', '0', '0', '0', 1, 'zhassanah@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('376', 'Hairyanto Santoso', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Bahagia No. 918, Dumai 70895, Kepri', '0796 8708 919', '(+62) 676 4505 4228', '0', '0', '0', '0', '0', 1, 'anita.anggraini@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('377', 'Yoga Baktianto Firmansyah S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Qrisdoren No. 749, Bitung 52753, Pabar', '(+62) 580 1072 5870', '0730 8707 821', '0', '0', '0', '0', '0', 1, 'aisyah33@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('378', 'Salsabila Lailasari S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Basuki Rahmat  No. 913, Banjar 58801, Babel', '(+62) 878 9539 3925', '020 1951 8469', '0', '0', '0', '0', '0', 1, 'usada.taufan@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('379', 'Tantri Hariyah S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Madiun No. 135, Kendari 45537, Kalbar', '0619 5807 696', '(+62) 649 4312 0205', '0', '0', '0', '0', '0', 1, 'kasusra.usada@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('38', 'Mujur Jailani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Umalas No. 514, Pangkal Pinang 61995, Sulteng', '(+62) 823 5182 7778', '(+62) 616 6380 4924', '0', '0', '0', '0', '0', 1, 'hpurnawati@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('380', 'Taufan Kanda Santoso S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakti No. 556, Sungai Penuh 44788, Sulbar', '(+62) 863 1728 292', '(+62) 805 811 482', '0', '0', '0', '0', '0', 1, 'jpudjiastuti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('381', 'Edi Halim', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Dipenogoro No. 562, Salatiga 73796, Sumsel', '(+62) 890 295 408', '0913 3236 334', '0', '0', '0', '0', '0', 1, 'laksita.cawisadi@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('382', 'Galang Dongoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Abdul No. 497, Serang 60861, NTT', '0846 8603 304', '(+62) 872 9917 4406', '0', '0', '0', '0', '0', 1, 'prayogo.sitorus@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('383', 'Raihan Agus Sirait', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. W.R. Supratman No. 608, Pagar Alam 11057, Sultra', '(+62) 538 8928 0943', '(+62) 494 8752 1473', '0', '0', '0', '0', '0', 1, 'rahmi18@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('384', 'Kanda Soleh Habibi S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Nanas No. 139, Tomohon 17775, Babel', '(+62) 708 7807 0573', '0481 1533 036', '0', '0', '0', '0', '0', 1, 'pwidiastuti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('385', 'Hardi Mandala M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Abdul No. 713, Banda Aceh 27217, Riau', '0806 172 235', '(+62) 303 5263 374', '0', '0', '0', '0', '0', 1, 'winarno.vanya@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('386', 'Dadap Santoso S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Kebangkitan Nasional No. 687, Tegal 35701, Kalteng', '026 8217 2000', '0298 3626 045', '0', '0', '0', '0', '0', 1, 'rdongoran@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('387', 'Edi Januar S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bagas Pati No. 461, Administrasi Jakarta Pusat 82306, Kalbar', '(+62) 29 5837 708', '(+62) 968 8652 489', '0', '0', '0', '0', '0', 1, 'saefullah.ilsa@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('388', 'Silvia Melani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Wora Wari No. 665, Sawahlunto 85100, NTB', '(+62) 802 0770 847', '0945 2023 6432', '0', '0', '0', '0', '0', 1, 'kuswoyo.edi@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('389', 'Zaenab Nasyiah S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Yoga No. 625, Bitung 38990, NTT', '0741 7962 2137', '(+62) 603 0224 3781', '0', '0', '0', '0', '0', 1, 'ajimat.permata@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('39', 'Zelaya Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bakau No. 770, Lhokseumawe 38735, Gorontalo', '0451 3022 797', '(+62) 633 0641 696', '0', '0', '0', '0', '0', 1, 'osantoso@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('390', 'Ivan Hidayanto', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kyai Gede No. 911, Kotamobagu 54811, DIY', '(+62) 478 3331 660', '0922 3442 7556', '0', '0', '0', '0', '0', 1, 'salman.maheswara@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('391', 'Carub Prasetyo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. BKR No. 494, Tual 29840, Babel', '025 9758 8416', '0719 6646 7329', '0', '0', '0', '0', '0', 1, 'heryanto39@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('392', 'Tami Eva Usamah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Baja Raya No. 88, Ambon 45374, Pabar', '(+62) 565 3046 631', '0550 8454 581', '0', '0', '0', '0', '0', 1, 'yuliana91@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('393', 'Dina Lidya Kuswandari S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Sentot Alibasa No. 583, Pasuruan 56537, Kalteng', '0774 3749 962', '(+62) 839 770 518', '0', '0', '0', '0', '0', 1, 'cengkir93@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('394', 'Hani Diah Wulandari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baan No. 61, Kotamobagu 61548, Maluku', '0703 3179 7082', '(+62) 539 9460 521', '0', '0', '0', '0', '0', 1, 'hutasoit.jaya@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('395', 'Ajimin Caturangga Prasasta S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bass No. 749, Bengkulu 47294, Kalbar', '0953 3543 9112', '0358 9957 7374', '0', '0', '0', '0', '0', 1, 'mardhiyah.perkasa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('396', 'Karman Haryanto', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Casablanca No. 849, Pematangsiantar 64851, DIY', '(+62) 544 0786 663', '(+62) 373 5664 2514', '0', '0', '0', '0', '0', 1, 'pudjiastuti.cakrabirawa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('397', 'Liman Pranowo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Yos No. 973, Gunungsitoli 65553, Sulsel', '020 5247 4185', '(+62) 24 5049 7159', '0', '0', '0', '0', '0', 1, 'ruwais@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('398', 'Viman Edward Simanjuntak', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Pacuan Kuda No. 161, Tasikmalaya 63351, Banten', '(+62) 863 244 342', '(+62) 842 8307 1353', '0', '0', '0', '0', '0', 1, 'rrahayu@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('399', 'Cakrabirawa Wibisono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bacang No. 798, Palangka Raya 64429, Kepri', '(+62) 803 893 884', '0396 9030 8287', '0', '0', '0', '0', '0', 1, 'yunita.mansur@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('4', 'Kenari Saragih S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Ir. H. Juanda No. 493, Sungai Penuh 95830, Sumut', '0802 7878 1009', '(+62) 918 1153 064', '0', '0', '0', '0', '0', 1, 'darmanto.melani@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('40', 'Edi Saragih', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. S. Parman No. 184, Bontang 68681, Kaltara', '0286 2308 2291', '0708 1116 946', '0', '0', '0', '0', '0', 1, 'klazuardi@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('400', 'Kawaca Praba Pratama M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Rumah Sakit No. 439, Salatiga 87114, Malut', '(+62) 895 4027 6188', '(+62) 623 3635 0034', '0', '0', '0', '0', '0', 1, 'harjo62@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('401', 'Bagya Estiawan Setiawan M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baing No. 363, Bandar Lampung 12917, Kaltara', '0442 5928 774', '0879 2713 931', '0', '0', '0', '0', '0', 1, 'xsantoso@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('402', 'Embuh Ardianto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Imam No. 736, Palembang 31256, DIY', '0916 5184 6385', '0228 6864 5898', '0', '0', '0', '0', '0', 1, 'aisyah.dabukke@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('403', 'Hani Oktaviani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. S. Parman No. 169, Tarakan 36183, Bali', '(+62) 496 0773 269', '0896 8052 9701', '0', '0', '0', '0', '0', 1, 'jyulianti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('404', 'Diah Mandasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Imam Bonjol No. 789, Metro 64321, Jatim', '0867 279 717', '0707 4772 2204', '0', '0', '0', '0', '0', 1, 'bwinarno@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('405', 'Puti Nuraini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gading No. 891, Kediri 93822, Jambi', '(+62) 725 9149 2885', '(+62) 313 9921 0347', '0', '0', '0', '0', '0', 1, 'bsamosir@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('406', 'Ganda Carub Saefullah S.E.I', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Dipenogoro No. 112, Balikpapan 87649, Jatim', '(+62) 28 8442 4297', '0963 3619 7951', '0', '0', '0', '0', '0', 1, 'jessica77@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('407', 'Kasiyah Wijayanti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Rajawali No. 528, Prabumulih 14354, Kalsel', '(+62) 333 7576 325', '(+62) 227 2690 0458', '0', '0', '0', '0', '0', 1, 'zizi88@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('408', 'Jaeman Tamba', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bayan No. 304, Palu 80747, Jambi', '027 0116 9959', '0505 4357 2488', '0', '0', '0', '0', '0', 1, 'rahmawati.zulfa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('409', 'Ifa Rahmawati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gotong Royong No. 529, Sawahlunto 15084, Gorontalo', '0818 8096 2575', '0489 0409 861', '0', '0', '0', '0', '0', 1, 'anajmudin@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('41', 'Baktiadi Nalar Jailani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Labu No. 636, Medan 92254, DIY', '0864 4582 156', '(+62) 594 3652 0141', '0', '0', '0', '0', '0', 1, 'salman12@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('410', 'Jamalia Andriani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Dipatiukur No. 614, Sibolga 91725, Bengkulu', '0714 1517 5968', '(+62) 544 1297 6108', '0', '0', '0', '0', '0', 1, 'paulin.putra@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('411', 'Zelda Halimah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baranang No. 838, Lhokseumawe 25336, DIY', '0559 4510 6880', '0524 8857 457', '0', '0', '0', '0', '0', 1, 'laras75@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('412', 'Winda Gilda Laksmiwati M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bara Tambar No. 573, Tanjungbalai 36562, Kaltim', '(+62) 883 6326 713', '(+62) 318 0530 660', '0', '0', '0', '0', '0', 1, 'anggriawan.jarwa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('413', 'Eko Prasetya Mandala', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Abdul Rahmat No. 400, Manado 96084, Sulteng', '0486 5961 329', '(+62) 879 970 261', '0', '0', '0', '0', '0', 1, 'pradana.daniswara@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('414', 'Okto Hardiansyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ekonomi No. 870, Kotamobagu 30714, Riau', '(+62) 293 6247 2103', '0329 7199 5305', '0', '0', '0', '0', '0', 1, 'jasmin.hakim@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('415', 'Ayu Halimah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Diponegoro No. 59, Surakarta 90154, Sultra', '0351 9568 6121', '0799 2133 963', '0', '0', '0', '0', '0', 1, 'qpermata@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('416', 'Hari Ganjaran Saputra', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bata Putih No. 490, Tanjungbalai 52774, Sultra', '0764 3191 1312', '(+62) 479 0205 2501', '0', '0', '0', '0', '0', 1, 'lsuartini@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('417', 'Prabawa Mandala S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baranang Siang Indah No. 736, Administrasi Jakarta Barat 68118, Maluku', '(+62) 350 0908 336', '0724 2950 3626', '0', '0', '0', '0', '0', 1, 'shalimah@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('418', 'Adika Eko Marpaung', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bara Tambar No. 865, Samarinda 31830, Banten', '0518 1300 0066', '(+62) 20 5071 7224', '0', '0', '0', '0', '0', 1, 'puti.mandala@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('419', 'Karja Winarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Babadak No. 405, Mojokerto 95949, Jabar', '(+62) 290 1172 1203', '(+62) 29 9249 4780', '0', '0', '0', '0', '0', 1, 'nnajmudin@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('42', 'Jatmiko Anggabaya Suwarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Soekarno Hatta No. 852, Madiun 66222, Kaltara', '0938 4399 6482', '0375 2218 398', '0', '0', '0', '0', '0', 1, 'hwinarsih@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('420', 'Victoria Suartini', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Jakarta No. 66, Probolinggo 15232, Kaltara', '0899 016 197', '(+62) 270 3431 7733', '0', '0', '0', '0', '0', 1, 'qfirgantoro@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('421', 'Galih Dwi Jailani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Samanhudi No. 687, Batam 10264, DKI', '0494 6413 2253', '0377 7612 770', '0', '0', '0', '0', '0', 1, 'ulya.pudjiastuti@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('422', 'Cinthia Rika Namaga S.E.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Badak No. 411, Kupang 90033, Lampung', '(+62) 700 2262 569', '0295 5517 0777', '0', '0', '0', '0', '0', 1, 'rdongoran@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('423', 'Lalita Wastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Untung Suropati No. 589, Pematangsiantar 62456, Jabar', '(+62) 666 6887 7387', '(+62) 943 5919 4599', '0', '0', '0', '0', '0', 1, 'ywahyuni@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('424', 'Maimunah Sadina Lailasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Supomo No. 583, Tanjungbalai 55051, DIY', '0575 2446 103', '0663 4146 9624', '0', '0', '0', '0', '0', 1, 'samsul.mayasari@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('425', 'Prabu Simanjuntak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Katamso No. 656, Salatiga 32233, DIY', '0766 1679 789', '0728 6846 5701', '0', '0', '0', '0', '0', 1, 'tomi85@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('426', 'Soleh Thamrin S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jaksa No. 178, Palembang 14108, Kalbar', '(+62) 362 0401 241', '022 7834 0102', '0', '0', '0', '0', '0', 1, 'uyainah.dasa@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('427', 'Paramita Putri Nasyiah S.Sos', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Otista No. 347, Cirebon 22787, Riau', '(+62) 411 7770 650', '0880 8878 1985', '0', '0', '0', '0', '0', 1, 'ayu32@example.com', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('428', 'Ajimat Ramadan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Ciwastra No. 125, Yogyakarta 11880, Sulteng', '(+62) 378 5121 7118', '(+62) 825 388 294', '0', '0', '0', '0', '0', 1, 'jail.sitompul@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('429', 'Dipa Prayoga', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Flora No. 437, Singkawang 30054, Jateng', '(+62) 301 3559 831', '0700 6215 2561', '0', '0', '0', '0', '0', 1, 'ciaobella.tamba@example.net', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('43', 'Cager Candrakanta Tampubolon S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. BKR No. 794, Palu 69021, Sulteng', '0647 1182 9625', '022 4500 523', '0', '0', '0', '0', '0', 1, 'hakim.yosef@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022);
INSERT INTO `mahasiswa` (`npm`, `nama_mhs`, `jenis_kelamin`, `tangal_lahir`, `tempat_lahir`, `idAgama`, `idKewarganegaraan`, `nik`, `nisn`, `npwp`, `jalan`, `telephone`, `handphone`, `dusun`, `rt`, `rw`, `kelurahan`, `kecamatan`, `idJenisTinggal`, `email`, `idAlatTransportasi`, `idOrangTuaWali`, `kebutuhanKhusus`, `idProgramMhs`, `idProgramStudi`, `fotoMhs`, `angkatan`) VALUES
('430', 'Asmuni Megantara', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Basuki Rahmat  No. 147, Palu 57974, Gorontalo', '(+62) 936 3165 6728', '0843 2754 684', '0', '0', '0', '0', '0', 1, 'okusumo@example.org', 1, 1, 'Tidak', '1', '54211', '-', 2019),
('431', 'Eka Hartaka Hardiansyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Untung Suropati No. 81, Batam 13944, NTT', '0264 9012 5872', '0869 607 589', '0', '0', '0', '0', '0', 1, 'bella.thamrin@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('432', 'Aris Permadi S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sam Ratulangi No. 298, Sabang 85971, Kalbar', '0555 0630 3977', '0831 406 189', '0', '0', '0', '0', '0', 1, 'salahudin.ganda@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('433', 'Gabriella Rahimah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Wora Wari No. 451, Metro 83814, Pabar', '(+62) 698 2423 194', '(+62) 946 8552 140', '0', '0', '0', '0', '0', 1, 'tkuswandari@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('434', 'Paramita Cinthia Rahmawati S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Tambak No. 812, Payakumbuh 52634, Papua', '0668 8277 3800', '(+62) 543 7393 1695', '0', '0', '0', '0', '0', 1, 'ofirgantoro@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('435', 'Tantri Prastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Pahlawan No. 915, Ternate 84764, Kalteng', '0883 1906 3950', '0866 9025 7473', '0', '0', '0', '0', '0', 1, 'yusuf75@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('436', 'Belinda Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Hasanuddin No. 155, Banjarmasin 42034, Sulsel', '(+62) 631 3074 492', '0418 8323 8396', '0', '0', '0', '0', '0', 1, 'haryanto.cawisono@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('437', 'Bakda Ramadan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Cikutra Timur No. 99, Bogor 37790, NTB', '(+62) 992 4711 1908', '0409 2001 5761', '0', '0', '0', '0', '0', 1, 'ulya.dongoran@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('438', 'Cayadi Karja Rajasa', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Halim No. 8, Batu 46065, Lampung', '(+62) 807 231 250', '0676 3430 1820', '0', '0', '0', '0', '0', 1, 'uwais.natalia@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('439', 'Aurora Winda Mardhiyah S.IP', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Soekarno Hatta No. 924, Jayapura 14335, Sulteng', '(+62) 312 4843 023', '0895 828 055', '0', '0', '0', '0', '0', 1, 'rafi07@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('44', 'Elisa Pratiwi S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Badak No. 755, Cimahi 78642, Bali', '0523 6435 861', '0441 4984 7227', '0', '0', '0', '0', '0', 1, 'farida.capa@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('440', 'Karma Hardiansyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bakau Griya Utama No. 114, Sawahlunto 83361, Jateng', '026 6398 976', '(+62) 531 9669 8427', '0', '0', '0', '0', '0', 1, 'adriansyah.anom@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('441', 'Mahesa Lasmono Kuswoyo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Wahidin Sudirohusodo No. 431, Surakarta 48008, Jateng', '(+62) 243 7720 392', '0573 5628 944', '0', '0', '0', '0', '0', 1, 'maulana.umar@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('442', 'Cahyanto Kawaya Sitompul S.E.I', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Abdullah No. 108, Semarang 65775, Jabar', '(+62) 238 9150 3152', '0449 7549 002', '0', '0', '0', '0', '0', 1, 'hakim.kartika@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('443', 'Daruna Upik Prabowo M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Eka No. 546, Banjarmasin 14653, Sulut', '(+62) 674 6733 2362', '021 9863 585', '0', '0', '0', '0', '0', 1, 'salimah52@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('444', 'Dartono Natsir', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Villa No. 158, Mataram 87841, Kaltim', '0298 0669 3256', '(+62) 770 6136 1712', '0', '0', '0', '0', '0', 1, 'kuswandari.sarah@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('445', 'Faizah Handayani M.M.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bakti No. 750, Pematangsiantar 87942, Sulteng', '(+62) 489 2687 6163', '0486 3025 547', '0', '0', '0', '0', '0', 1, 'asirwada42@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('446', 'Dian Widiastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Daan No. 324, Tarakan 79656, Jabar', '(+62) 490 2192 744', '0363 3196 2937', '0', '0', '0', '0', '0', 1, 'bajragin52@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('447', 'Mahmud Saptono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Salatiga No. 92, Magelang 67964, Kaltara', '(+62) 588 0835 9532', '(+62) 958 6646 4226', '0', '0', '0', '0', '0', 1, 'ysitorus@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('448', 'Ellis Almira Laksita M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Daan No. 691, Semarang 67127, DIY', '0340 1877 5163', '0779 9873 2501', '0', '0', '0', '0', '0', 1, 'kasiran.farida@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('449', 'Aswani Halim', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Merdeka No. 945, Payakumbuh 64574, Sulbar', '(+62) 641 5476 701', '(+62) 855 1876 668', '0', '0', '0', '0', '0', 1, 'tania25@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('45', 'Widya Hasanah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Orang No. 96, Bitung 56059, Babel', '(+62) 409 1971 8534', '0804 964 192', '0', '0', '0', '0', '0', 1, 'hutasoit.nova@example.org', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('450', 'Lidya Suartini M.Kom.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Mulyadi No. 352, Subulussalam 16429, Riau', '(+62) 210 9755 758', '0515 2008 1955', '0', '0', '0', '0', '0', 1, 'gunarto.chelsea@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('451', 'Taufan Saefullah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Elang No. 862, Bitung 25301, DIY', '(+62) 301 6769 883', '(+62) 983 9039 874', '0', '0', '0', '0', '0', 1, 'dinda.mahendra@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('452', 'Emin Gangsa Wibowo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Babah No. 251, Padang 88908, Jabar', '0926 1574 313', '(+62) 964 3441 8398', '0', '0', '0', '0', '0', 1, 'ssihotang@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('453', 'Sadina Halimah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Pattimura No. 740, Ternate 83128, Sumbar', '(+62) 305 3934 032', '(+62) 281 6538 822', '0', '0', '0', '0', '0', 1, 'iswahyudi.martana@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('454', 'Putri Permata', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tambak No. 546, Probolinggo 24877, Kaltim', '0761 0222 094', '(+62) 585 2948 8144', '0', '0', '0', '0', '0', 1, 'kamila78@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('455', 'Purwa Irsad Nainggolan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Imam Bonjol No. 964, Blitar 88429, Sumbar', '(+62) 760 3227 1247', '0451 1122 9547', '0', '0', '0', '0', '0', 1, 'jane.nurdiyanti@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('456', 'Gabriella Lailasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Gambang No. 444, Padang 92088, Jateng', '(+62) 287 5410 090', '(+62) 612 7755 840', '0', '0', '0', '0', '0', 1, 'garang94@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('457', 'Argono Taswir Sihombing S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Pacuan Kuda No. 876, Palembang 98875, Jatim', '(+62) 353 0915 633', '(+62) 544 3323 334', '0', '0', '0', '0', '0', 1, 'dalima65@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('458', 'Purwadi Harimurti Sinaga S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gremet No. 812, Sawahlunto 90864, Jambi', '0488 3255 491', '0587 8899 6516', '0', '0', '0', '0', '0', 1, 'paulin.handayani@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('459', 'Tina Uyainah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ciwastra No. 589, Pontianak 47944, Babel', '0657 9910 949', '(+62) 737 7278 997', '0', '0', '0', '0', '0', 1, 'dagel.nashiruddin@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('46', 'Hartaka Dabukke M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bakau No. 16, Kendari 13067, Malut', '0383 3980 874', '(+62) 455 2586 5253', '0', '0', '0', '0', '0', 1, 'patricia.pratiwi@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('460', 'Tri Prasetya Wacana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Rajiman No. 209, Kupang 72821, Sumbar', '0371 0936 845', '0668 3597 8898', '0', '0', '0', '0', '0', 1, 'danu35@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('461', 'Oliva Wahyuni', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Ronggowarsito No. 750, Cilegon 76744, DIY', '(+62) 595 1685 316', '(+62) 477 3898 887', '0', '0', '0', '0', '0', 1, 'rangga.rahayu@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('462', 'Karja Simanjuntak S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Wahidin No. 664, Salatiga 98281, Kalbar', '0519 0470 9753', '(+62) 751 5605 577', '0', '0', '0', '0', '0', 1, 'msuryatmi@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('463', 'Ulya Kania Aryani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Ir. H. Juanda No. 506, Pangkal Pinang 15501, Sumsel', '(+62) 711 8804 8495', '(+62) 243 6431 3129', '0', '0', '0', '0', '0', 1, 'vanya.irawan@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('464', 'Bella Zamira Zulaika', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kali No. 35, Padangsidempuan 85482, Jambi', '0801 9323 120', '(+62) 26 8610 0434', '0', '0', '0', '0', '0', 1, 'adriansyah.ivan@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('465', 'Uli Ajeng Pratiwi M.M.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ikan No. 791, Dumai 64686, Sumsel', '(+62) 449 2683 4514', '0667 2491 052', '0', '0', '0', '0', '0', 1, 'estiawan96@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('466', 'Cagak Kusumo', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sumpah Pemuda No. 875, Bengkulu 86128, Malut', '0629 0176 5897', '0255 7441 8292', '0', '0', '0', '0', '0', 1, 'wsuartini@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('467', 'Bahuwarna Cakrabirawa Salahudin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Lumban Tobing No. 654, Padang 63275, Riau', '0250 9558 694', '024 8952 379', '0', '0', '0', '0', '0', 1, 'victoria85@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('468', 'Salsabila Yulianti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Pasirkoja No. 844, Blitar 41320, Sulteng', '0660 0392 4233', '0883 592 670', '0', '0', '0', '0', '0', 1, 'widya39@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('469', 'Ghaliyati Suartini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Teuku Umar No. 961, Tangerang Selatan 30164, Sumsel', '(+62) 358 2100 890', '021 2215 2939', '0', '0', '0', '0', '0', 1, 'dina.rahmawati@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('47', 'Irma Hariyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ir. H. Juanda No. 624, Kupang 13089, Kalbar', '0371 9303 124', '(+62) 565 4827 393', '0', '0', '0', '0', '0', 1, 'nurdiyanti.cindy@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('470', 'Hamima Nuraini', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Surapati No. 575, Bitung 89196, NTT', '(+62) 797 2902 3906', '(+62) 664 1247 0289', '0', '0', '0', '0', '0', 1, 'tusada@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('471', 'Cakrajiya Maulana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Yap Tjwan Bing No. 363, Palu 32505, Jatim', '(+62) 412 9787 370', '0814 3512 884', '0', '0', '0', '0', '0', 1, 'palastri.ajiman@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('472', 'Bambang Gunawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Ketandan No. 133, Subulussalam 32118, Jateng', '0381 4139 852', '(+62) 809 928 278', '0', '0', '0', '0', '0', 1, 'ulya.sudiati@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('473', 'Cici Laksmiwati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Pattimura No. 845, Pagar Alam 91018, Riau', '(+62) 29 4709 303', '0733 0326 5376', '0', '0', '0', '0', '0', 1, 'wage.anggraini@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('474', 'Bahuwirya Maheswara S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Suniaraja No. 400, Tangerang 55561, Kalteng', '027 0939 228', '0520 3938 355', '0', '0', '0', '0', '0', 1, 'cprasasta@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('475', 'Eka Carla Mandasari M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Dewi Sartika No. 423, Tebing Tinggi 92555, Sumbar', '0708 5308 4628', '0764 8256 0737', '0', '0', '0', '0', '0', 1, 'ganep.yolanda@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('476', 'Maria Yulianti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Badak No. 405, Singkawang 12510, Jambi', '0933 0678 003', '(+62) 394 7332 470', '0', '0', '0', '0', '0', 1, 'rafid59@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('477', 'Kurnia Ardianto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Rajiman No. 35, Bitung 35552, Sumut', '(+62) 748 2897 886', '(+62) 958 1165 7298', '0', '0', '0', '0', '0', 1, 'gpermadi@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('478', 'Gina Puspasari S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Honggowongso No. 766, Tanjung Pinang 37465, Sulbar', '0851 5014 821', '0261 8231 044', '0', '0', '0', '0', '0', 1, 'winarsih.rahman@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('479', 'Titin Puspita S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Eka No. 597, Sabang 40003, Lampung', '(+62) 380 9145 684', '0542 1195 4978', '0', '0', '0', '0', '0', 1, 'hhutagalung@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('48', 'Syahrini Suryatmi M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Gegerkalong Hilir No. 759, Banda Aceh 84819, Maluku', '0972 8676 0782', '0358 0804 6400', '0', '0', '0', '0', '0', 1, 'asuwarno@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('480', 'Radika Gangsar Tampubolon S.Gz', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Babah No. 894, Padang 36443, Jatim', '0805 3992 4470', '(+62) 29 3727 5407', '0', '0', '0', '0', '0', 1, 'sudiati.kairav@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('481', 'Samiah Kusmawati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Dr. Junjunan No. 197, Administrasi Jakarta Selatan 12602, Sultra', '0581 4711 167', '(+62) 248 4768 5686', '0', '0', '0', '0', '0', 1, 'ida.hidayat@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('482', 'Cawisono Adikara Setiawan M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Dipenogoro No. 187, Mataram 85735, Kaltara', '0879 4261 748', '(+62) 527 3795 5511', '0', '0', '0', '0', '0', 1, 'hidayanto.kawaca@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('483', 'Yunita Cici Mayasari S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Rumah Sakit No. 733, Makassar 58947, Papua', '(+62) 635 0874 168', '0791 8619 447', '0', '0', '0', '0', '0', 1, 'putri56@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('484', 'Samsul Adriansyah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bahagia No. 285, Palangka Raya 93281, Kaltim', '0974 9224 0734', '0743 8640 9014', '0', '0', '0', '0', '0', 1, 'wasita.nasim@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('485', 'Rahmi Fujiati S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Otto No. 703, Sukabumi 73599, Jateng', '(+62) 519 9305 286', '0642 6600 3716', '0', '0', '0', '0', '0', 1, 'makuta.hastuti@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('486', 'Gasti Yolanda', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Radio No. 386, Pekalongan 81420, DIY', '0218 7696 7673', '(+62) 482 3525 4618', '0', '0', '0', '0', '0', 1, 'maimunah04@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('487', 'Harja Sirait', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Merdeka No. 642, Solok 79360, Papua', '(+62) 724 5689 8589', '0494 6135 716', '0', '0', '0', '0', '0', 1, 'eli22@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('488', 'Indah Farida', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bahagia No. 828, Cimahi 27411, Maluku', '0805 1419 7112', '0525 4754 9077', '0', '0', '0', '0', '0', 1, 'firgantoro.ami@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('489', 'Emong Ramadan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Rajawali Barat No. 141, Administrasi Jakarta Utara 45983, Kaltim', '(+62) 752 4825 688', '0536 5479 168', '0', '0', '0', '0', '0', 1, 'karma.hassanah@example.org', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('49', 'Yunita Elvina Yuliarti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kyai Gede No. 681, Administrasi Jakarta Selatan 14495, Kalsel', '(+62) 808 6044 411', '0441 1792 6530', '0', '0', '0', '0', '0', 1, 'opan38@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('490', 'Yessi Hafshah Suryatmi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Abang No. 225, Tanjung Pinang 69644, Sumsel', '(+62) 22 4893 1817', '0321 9012 6572', '0', '0', '0', '0', '0', 1, 'zaenab.usamah@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('491', 'Novi Uyainah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Hang No. 33, Lubuklinggau 34095, DKI', '0564 6836 013', '0348 3659 8751', '0', '0', '0', '0', '0', 1, 'asmadi65@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('492', 'Yulia Hasanah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ters. Pasir Koja No. 68, Subulussalam 90487, Bali', '(+62) 884 4256 588', '(+62) 844 615 058', '0', '0', '0', '0', '0', 1, 'csaptono@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('493', 'Koko Wasita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Bah Jaya No. 237, Bekasi 13725, Banten', '(+62) 804 2677 9045', '(+62) 923 9011 7240', '0', '0', '0', '0', '0', 1, 'carub.pangestu@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('494', 'Amalia Farida', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bhayangkara No. 362, Administrasi Jakarta Selatan 18648, Sulbar', '(+62) 435 3302 5262', '(+62) 969 3695 828', '0', '0', '0', '0', '0', 1, 'jdabukke@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('495', 'Kambali Usman Irawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bhayangkara No. 553, Samarinda 48336, Papua', '0248 9857 0596', '0252 3003 805', '0', '0', '0', '0', '0', 1, 'purnawati.putri@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('496', 'Ayu Puspita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Ketandan No. 318, Tasikmalaya 15321, Kalsel', '(+62) 245 6861 0322', '0965 7023 8539', '0', '0', '0', '0', '0', 1, 'hasna.uyainah@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('497', 'Bala Manah Siregar', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baja No. 970, Madiun 45891, NTB', '0549 2370 258', '(+62) 868 781 787', '0', '0', '0', '0', '0', 1, 'emas.sirait@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('498', 'Jayeng Setiawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sutoyo No. 719, Cilegon 93751, Sultra', '0642 2029 786', '0456 5357 688', '0', '0', '0', '0', '0', 1, 'michelle.handayani@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('499', 'Padma Puput Rahayu S.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. B.Agam 1 No. 619, Pasuruan 14237, Kaltara', '027 4743 5734', '(+62) 21 0331 5869', '0', '0', '0', '0', '0', 1, 'cakrabuana53@example.net', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('5', 'Fathonah Sudiati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baha No. 603, Pariaman 22529, Sulsel', '0217 3672 8352', '0264 7091 1693', '0', '0', '0', '0', '0', 1, 'ipratiwi@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('50', 'Galak Wijaya', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Gambang No. 921, Denpasar 46293, Kalbar', '(+62) 559 9749 399', '(+62) 761 1375 8179', '0', '0', '0', '0', '0', 1, 'fsitompul@example.net', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('500', 'Vanesa Iriana Nasyiah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Sugiyopranoto No. 555, Pasuruan 34012, Pabar', '(+62) 852 8144 6634', '(+62) 914 0167 3042', '0', '0', '0', '0', '0', 1, 'lembah02@example.com', 1, 1, 'Tidak', '1', '54231', '-', 2020),
('501', 'Among Sirait', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Baing No. 319, Sorong 79691, Sulbar', '(+62) 477 6093 9636', '0380 0619 803', '0', '0', '0', '0', '0', 1, 'mlaksmiwati@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('502', 'Ridwan Anggriawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Tubagus Ismail No. 512, Lhokseumawe 55811, Sulteng', '0421 0706 9447', '(+62) 432 6991 6980', '0', '0', '0', '0', '0', 1, 'balijan46@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('503', 'Ade Padmasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baladewa No. 407, Administrasi Jakarta Selatan 16677, Papua', '(+62) 903 7510 1871', '0510 6700 9720', '0', '0', '0', '0', '0', 1, 'zsalahudin@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('504', 'Yance Uyainah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Katamso No. 989, Palu 99039, Kalbar', '0861 9988 8538', '(+62) 809 0536 8265', '0', '0', '0', '0', '0', 1, 'anita54@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('505', 'Okta Saputra', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Flores No. 830, Medan 19448, Sumut', '0435 8226 040', '023 0176 8631', '0', '0', '0', '0', '0', 1, 'nsinaga@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('506', 'Luluh Tarihoran', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Dipenogoro No. 972, Binjai 39264, Sulsel', '0273 8942 231', '(+62) 692 0244 6962', '0', '0', '0', '0', '0', 1, 'fujiati.calista@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('507', 'Daru Sihombing', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sukabumi No. 264, Probolinggo 54092, Kaltim', '0205 6781 615', '(+62) 21 9397 3164', '0', '0', '0', '0', '0', 1, 'among14@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('508', 'Betania Usamah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Dipenogoro No. 674, Bau-Bau 79958, Lampung', '0825 7091 318', '(+62) 753 1918 372', '0', '0', '0', '0', '0', 1, 'kajen.pudjiastuti@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('509', 'Laila Maryati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Teuku Umar No. 898, Denpasar 36968, Sulbar', '(+62) 460 4245 7658', '(+62) 858 532 643', '0', '0', '0', '0', '0', 1, 'raditya01@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('51', 'Ulva Melani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sutarto No. 356, Padangsidempuan 68731, Kalsel', '(+62) 873 237 796', '(+62) 406 3407 516', '0', '0', '0', '0', '0', 1, 'maryati.tirta@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('510', 'Kasiran Sitompul', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Babadan No. 381, Tual 73725, Sulsel', '(+62) 372 0485 9772', '0727 6900 229', '0', '0', '0', '0', '0', 1, 'jnovitasari@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('511', 'Putri Purnawati S.E.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Urip Sumoharjo No. 895, Sawahlunto 62131, Sumsel', '(+62) 24 4217 709', '0621 0013 3245', '0', '0', '0', '0', '0', 1, 'opan57@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('512', 'Kuncara Budiman S.E.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Imam Bonjol No. 862, Semarang 20699, Jambi', '0251 3686 0310', '0565 6669 5447', '0', '0', '0', '0', '0', 1, 'prayogo.mansur@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('513', 'Restu Alika Aryani M.M.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gading No. 386, Palu 39092, Gorontalo', '0790 4286 5370', '0539 0555 667', '0', '0', '0', '0', '0', 1, 'panca45@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('514', 'Maryanto Salahudin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ciwastra No. 202, Mataram 58678, Maluku', '0561 5427 8539', '(+62) 884 8300 123', '0', '0', '0', '0', '0', 1, 'jati.farida@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('515', 'Ian Pradana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cikutra Timur No. 467, Tebing Tinggi 87042, NTB', '0585 4571 5665', '0690 5243 515', '0', '0', '0', '0', '0', 1, 'harto41@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('516', 'Dartono Kuswoyo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sumpah Pemuda No. 859, Administrasi Jakarta Selatan 88368, Kalsel', '0448 6035 821', '025 6413 1155', '0', '0', '0', '0', '0', 1, 'mahendra.yessi@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('517', 'Karimah Safitri', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Nanas No. 316, Banda Aceh 55824, Riau', '(+62) 746 9486 7043', '0365 9294 7364', '0', '0', '0', '0', '0', 1, 'vramadan@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('518', 'Dian Suartini M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Gegerkalong Hilir No. 990, Pasuruan 84884, Gorontalo', '(+62) 208 5576 060', '0921 0933 8761', '0', '0', '0', '0', '0', 1, 'melani.asman@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('519', 'Keisha Novi Puspita S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baing No. 700, Administrasi Jakarta Pusat 57767, Aceh', '(+62) 875 9464 246', '0505 9384 613', '0', '0', '0', '0', '0', 1, 'ade.purwanti@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('52', 'Faizah Maryati M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Warga No. 324, Dumai 52718, NTB', '(+62) 631 8552 430', '(+62) 902 1719 081', '0', '0', '0', '0', '0', 1, 'rangga30@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('520', 'Hafshah Fujiati M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Astana Anyar No. 483, Kotamobagu 44439, Bengkulu', '(+62) 666 5770 0992', '(+62) 927 7900 4180', '0', '0', '0', '0', '0', 1, 'adongoran@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('521', 'Mutia Zizi Riyanti M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bakit  No. 178, Bogor 39388, Riau', '0871 539 348', '0657 6220 7239', '0', '0', '0', '0', '0', 1, 'sitompul.maras@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('522', 'Mustika Sihombing S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Pattimura No. 456, Yogyakarta 62013, Sumsel', '0296 5253 6308', '0914 3898 021', '0', '0', '0', '0', '0', 1, 'kasiyah.putra@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('523', 'Tasnim Santoso', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kalimantan No. 972, Banda Aceh 44730, Pabar', '(+62) 981 3955 048', '(+62) 21 2992 713', '0', '0', '0', '0', '0', 1, 'jelita.usamah@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('524', 'Ina Malika Nasyiah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Ciwastra No. 481, Solok 55672, Kalteng', '(+62) 20 5644 2594', '0488 6770 151', '0', '0', '0', '0', '0', 1, 'rahayu.zelaya@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('525', 'Calista Septi Riyanti S.Sos', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cokroaminoto No. 875, Ambon 51389, Aceh', '(+62) 678 4162 990', '0651 4620 4647', '0', '0', '0', '0', '0', 1, 'samosir.wani@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('526', 'Luis Sihotang M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Otista No. 349, Semarang 25058, Jabar', '029 1433 3603', '(+62) 535 0115 669', '0', '0', '0', '0', '0', 1, 'msantoso@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('527', 'Vanya Permata M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Baya Kali Bungur No. 745, Pariaman 14707, DIY', '0345 3166 0677', '(+62) 844 5503 740', '0', '0', '0', '0', '0', 1, 'aswani41@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('528', 'Hasan Wibowo S.E.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Villa No. 721, Padangpanjang 86545, Gorontalo', '(+62) 602 1487 626', '(+62) 523 7570 1576', '0', '0', '0', '0', '0', 1, 'banara51@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('529', 'Imam Situmorang', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Industri No. 303, Banjarbaru 73363, Banten', '(+62) 804 5660 4396', '027 6846 762', '0', '0', '0', '0', '0', 1, 'yulia.firgantoro@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('53', 'Kenes Wahyudin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sampangan No. 152, Probolinggo 77911, Banten', '(+62) 881 9996 3610', '0912 9824 8642', '0', '0', '0', '0', '0', 1, 'yolanda.gamanto@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('530', 'Mahdi Simanjuntak', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Lumban Tobing No. 501, Padang 34159, Papua', '0584 1344 204', '0260 0828 155', '0', '0', '0', '0', '0', 1, 'iwaskita@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('531', 'Hartana Pratama', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Baja Raya No. 240, Surakarta 78550, Kaltara', '(+62) 778 3385 101', '(+62) 522 6810 7098', '0', '0', '0', '0', '0', 1, 'qhandayani@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('532', 'Jaya Anggriawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cemara No. 32, Yogyakarta 38525, Jambi', '(+62) 659 0979 1446', '(+62) 871 7944 1328', '0', '0', '0', '0', '0', 1, 'oliva62@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('533', 'Ridwan Kenari Lazuardi S.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basoka No. 456, Banjarbaru 17278, Kaltara', '(+62) 796 0019 771', '021 2901 8753', '0', '0', '0', '0', '0', 1, 'samsul.mulyani@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('534', 'Wardi Maryadi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Abang No. 132, Kendari 91098, Aceh', '(+62) 233 2129 880', '0609 8873 580', '0', '0', '0', '0', '0', 1, 'qmaheswara@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('535', 'Calista Farida S.I.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakhita No. 302, Cilegon 23689, Kaltim', '0442 8206 1453', '0546 8778 2508', '0', '0', '0', '0', '0', 1, 'pradana.ana@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('536', 'Damu Kardi Situmorang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Baranang No. 88, Solok 49918, Jatim', '(+62) 213 4612 774', '(+62) 503 9825 344', '0', '0', '0', '0', '0', 1, 'januar.salsabila@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('537', 'Kadir Lazuardi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baya Kali Bungur No. 214, Bima 46079, Sultra', '0716 3439 8226', '(+62) 210 4555 0541', '0', '0', '0', '0', '0', 1, 'tarihoran.banara@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('538', 'Kadir Budiyanto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakin No. 18, Banjarbaru 87071, Jateng', '(+62) 576 9273 949', '(+62) 740 8592 190', '0', '0', '0', '0', '0', 1, 'puji.zulkarnain@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('539', 'Rina Nurdiyanti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Yogyakarta No. 348, Banjarmasin 46208, Kaltara', '0345 9514 165', '(+62) 407 5567 341', '0', '0', '0', '0', '0', 1, 'yolanda.satya@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('54', 'Gading Maryadi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Basoka Raya No. 376, Serang 98226, Bengkulu', '0451 0002 347', '0480 6973 176', '0', '0', '0', '0', '0', 1, 'januar.bambang@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('540', 'Mahesa Jagapati Samosir', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baik No. 458, Batu 49094, Kepri', '(+62) 805 9144 5893', '(+62) 611 8069 9458', '0', '0', '0', '0', '0', 1, 'ntarihoran@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('541', 'Ira Aryani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Badak No. 782, Madiun 88628, Sumbar', '(+62) 520 9610 582', '(+62) 29 3163 1677', '0', '0', '0', '0', '0', 1, 'upik82@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('542', 'Ajimat Wibowo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bakhita No. 954, Tangerang 26898, Pabar', '0724 6087 543', '0679 0565 9140', '0', '0', '0', '0', '0', 1, 'padmasari.rendy@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('543', 'Ida Uyainah M.Ak', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Bakau No. 256, Ternate 27013, Kalbar', '0721 6504 9048', '(+62) 394 5231 855', '0', '0', '0', '0', '0', 1, 'sihotang.belinda@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('544', 'Gambira Kuswoyo S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Wahidin Sudirohusodo No. 903, Palembang 29672, DIY', '(+62) 979 6035 868', '0935 0963 1815', '0', '0', '0', '0', '0', 1, 'ida.napitupulu@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('545', 'Zulaikha Melani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Salam No. 857, Surabaya 95060, Kepri', '(+62) 279 4798 413', '0766 4163 610', '0', '0', '0', '0', '0', 1, 'palastri.raisa@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('546', 'Kenari Nashiruddin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bass No. 329, Banda Aceh 75282, Pabar', '029 5576 603', '(+62) 590 9970 561', '0', '0', '0', '0', '0', 1, 'viktor09@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('547', 'Latika Raina Hariyah S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sudirman No. 438, Surakarta 31542, Sumbar', '(+62) 22 7683 617', '(+62) 296 0672 2418', '0', '0', '0', '0', '0', 1, 'cinthia.permata@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('548', 'Vicky Kuswandari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Otto No. 412, Jayapura 93356, Malut', '(+62) 537 5896 509', '0690 6986 4436', '0', '0', '0', '0', '0', 1, 'mustofa.luthfi@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('549', 'Sabrina Namaga', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Taman No. 810, Gunungsitoli 20240, Sulteng', '(+62) 843 4376 4689', '(+62) 957 6620 013', '0', '0', '0', '0', '0', 1, 'anggraini.humaira@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('55', 'Gina Laras Hastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sunaryo No. 392, Kotamobagu 43901, Malut', '(+62) 22 5961 650', '(+62) 201 1263 658', '0', '0', '0', '0', '0', 1, 'anastasia10@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('550', 'Putri Fathonah Utami M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bambon No. 307, Padangsidempuan 95797, Maluku', '(+62) 939 7056 931', '(+62) 345 2135 166', '0', '0', '0', '0', '0', 1, 'handayani.latif@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('551', 'Shakila Nurul Mulyani S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bhayangkara No. 977, Bima 74039, Jatim', '0572 4812 587', '0352 5821 7548', '0', '0', '0', '0', '0', 1, 'marbun.ana@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('552', 'Zelda Zaenab Anggraini S.E.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Kalimantan No. 527, Pematangsiantar 30512, Sultra', '0971 0350 2323', '(+62) 823 399 611', '0', '0', '0', '0', '0', 1, 'msaputra@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('553', 'Bakiman Siregar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Gajah No. 917, Mataram 57455, Pabar', '0651 9206 5993', '0334 4840 0458', '0', '0', '0', '0', '0', 1, 'habibi.putri@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('554', 'Danu Prayoga', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Jend. Sudirman No. 557, Pontianak 93707, Bali', '(+62) 757 5567 368', '(+62) 747 0811 8421', '0', '0', '0', '0', '0', 1, 'cindy.nurdiyanti@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('555', 'Amelia Puspita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Yos Sudarso No. 315, Tangerang 49374, NTB', '0580 2838 2069', '(+62) 672 1996 2735', '0', '0', '0', '0', '0', 1, 'aswani93@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('556', 'Kariman Lazuardi S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Abang No. 865, Pematangsiantar 42578, Papua', '0971 3650 7732', '(+62) 249 1982 8839', '0', '0', '0', '0', '0', 1, 'gara.hasanah@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('557', 'Pardi Megantara S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bara Tambar No. 732, Bandar Lampung 60035, Lampung', '(+62) 559 8033 257', '0796 8296 264', '0', '0', '0', '0', '0', 1, 'tutami@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('558', 'Padma Ira Nasyiah M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Raden No. 997, Denpasar 98043, Sulut', '(+62) 252 6368 930', '(+62) 675 3180 512', '0', '0', '0', '0', '0', 1, 'bkusumo@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('559', 'Jayeng Nashiruddin M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bakin No. 131, Gorontalo 85184, Riau', '0445 0003 9270', '026 5902 123', '0', '0', '0', '0', '0', 1, 'jirawan@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('56', 'Jayadi Lasmanto Gunarto', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Adisucipto No. 848, Tidore Kepulauan 14963, Sumsel', '0934 0391 693', '0472 9438 0862', '0', '0', '0', '0', '0', 1, 'bakidin.prasetyo@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('560', 'Mumpuni Wacana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Ciwastra No. 988, Mojokerto 14438, Kepri', '0901 8687 2627', '(+62) 811 0702 075', '0', '0', '0', '0', '0', 1, 'saragih.rahmi@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('561', 'Elisa Palastri', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gotong Royong No. 98, Tarakan 49545, Kaltara', '(+62) 400 0991 972', '(+62) 729 5328 9902', '0', '0', '0', '0', '0', 1, 'karsana.saragih@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('562', 'Lili Hastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Setiabudhi No. 93, Blitar 73727, Kalsel', '(+62) 21 0454 340', '(+62) 978 3087 372', '0', '0', '0', '0', '0', 1, 'bagya88@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('563', 'Raisa Yuni Padmasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bak Air No. 707, Administrasi Jakarta Pusat 62989, Sumsel', '(+62) 894 9686 110', '(+62) 317 3719 591', '0', '0', '0', '0', '0', 1, 'cutama@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('564', 'Murti Cakrawala Dongoran S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Ters. Pasir Koja No. 424, Prabumulih 72882, Jateng', '(+62) 665 7995 8440', '(+62) 736 7689 5261', '0', '0', '0', '0', '0', 1, 'lili39@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('565', 'Wani Rahmi Suryatmi M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Muwardi No. 995, Cilegon 33640, Sulbar', '0461 9723 776', '0489 7012 1995', '0', '0', '0', '0', '0', 1, 'teddy.sirait@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('566', 'Maida Yuniar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bagas Pati No. 664, Tarakan 32126, Sumsel', '(+62) 482 7758 181', '(+62) 23 5938 4761', '0', '0', '0', '0', '0', 1, 'dirja.waskita@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('567', 'Dinda Lailasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Raden No. 48, Surabaya 50102, Pabar', '(+62) 285 2524 815', '0496 7126 2797', '0', '0', '0', '0', '0', 1, 'wnugroho@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('568', 'Kawaca Prakasa', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Warga No. 901, Kupang 16448, Kaltara', '(+62) 500 6639 240', '0373 7438 579', '0', '0', '0', '0', '0', 1, 'fitria84@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('569', 'Kunthara Cahya Marbun', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Jend. Sudirman No. 638, Tanjungbalai 34911, Sumut', '0505 6836 7015', '0569 6114 8608', '0', '0', '0', '0', '0', 1, 'mulyani.mustofa@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('57', 'Galuh Permadi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Sadang Serang No. 24, Banjarbaru 10899, Lampung', '(+62) 621 0463 7767', '(+62) 367 6297 888', '0', '0', '0', '0', '0', 1, 'hidayanto.gina@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('570', 'Garda Cakrabirawa Simbolon', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Kiaracondong No. 906, Surakarta 66099, Sumsel', '0884 9972 063', '0228 9867 7784', '0', '0', '0', '0', '0', 1, 'winarsih.utama@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('571', 'Chelsea Ina Agustina', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Monginsidi No. 918, Parepare 69290, Sumsel', '0345 8632 3245', '(+62) 619 8955 4535', '0', '0', '0', '0', '0', 1, 'jwahyuni@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('572', 'Garang Mujur Wahyudin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Muwardi No. 754, Denpasar 42240, Sumut', '0594 0099 4917', '0888 2369 4773', '0', '0', '0', '0', '0', 1, 'putra.jais@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('573', 'Tantri Dina Melani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Ters. Jakarta No. 511, Surabaya 71565, Sulbar', '(+62) 894 7228 1577', '(+62) 202 2314 6464', '0', '0', '0', '0', '0', 1, 'azalea28@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('574', 'Ganda Kurniawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Adisucipto No. 846, Palangka Raya 39289, Kaltim', '0915 3477 0849', '(+62) 970 8799 0483', '0', '0', '0', '0', '0', 1, 'padmasari.almira@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('575', 'Dodo Suryono M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basuki No. 881, Prabumulih 62331, Lampung', '022 6920 217', '(+62) 660 6968 8781', '0', '0', '0', '0', '0', 1, 'heru.mangunsong@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('576', 'Natalia Usamah M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Antapani Lama No. 355, Administrasi Jakarta Barat 96415, Sulsel', '(+62) 750 2052 7716', '0935 7736 9052', '0', '0', '0', '0', '0', 1, 'sakura.megantara@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('577', 'Atmaja Ramadan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Panjaitan No. 792, Administrasi Jakarta Selatan 74528, Jateng', '0388 3353 977', '0952 4290 505', '0', '0', '0', '0', '0', 1, 'januar.lanang@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('578', 'Harimurti Prasasta', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Basuki No. 780, Kupang 45316, Sulut', '(+62) 820 1473 682', '(+62) 545 5442 119', '0', '0', '0', '0', '0', 1, 'hastuti.kamaria@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('579', 'Wani Agnes Permata M.TI.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Sam Ratulangi No. 178, Administrasi Jakarta Timur 64395, Kaltim', '0625 4603 714', '0287 7599 516', '0', '0', '0', '0', '0', 1, 'zulaikha.rajata@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('58', 'Ozy Waluyo Zulkarnain S.Ked', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Acordion No. 999, Administrasi Jakarta Barat 35904, Jambi', '(+62) 480 9121 2763', '(+62) 827 3987 0840', '0', '0', '0', '0', '0', 1, 'mustofa.waluyo@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('580', 'Anita Padmasari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. R.M. Said No. 567, Binjai 36001, Gorontalo', '(+62) 575 2346 278', '029 8038 537', '0', '0', '0', '0', '0', 1, 'sabrina.winarsih@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('581', 'Maria Yuliarti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Raya Setiabudhi No. 414, Banjar 35081, Aceh', '(+62) 202 7777 602', '0440 1415 0051', '0', '0', '0', '0', '0', 1, 'cbudiman@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('582', 'Saiful Prakasa', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Basmol Raya No. 591, Sawahlunto 68901, Kaltara', '0472 9060 4867', '(+62) 399 4329 322', '0', '0', '0', '0', '0', 1, 'vanesa.halim@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('583', 'Tugiman Asman Pradana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Baung No. 404, Palopo 41648, Maluku', '(+62) 594 4348 5544', '(+62) 808 620 173', '0', '0', '0', '0', '0', 1, 'winarsih.harsanto@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('584', 'Zizi Kusmawati S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Villa No. 837, Bau-Bau 95452, Gorontalo', '(+62) 882 908 927', '(+62) 403 5673 8008', '0', '0', '0', '0', '0', 1, 'lintang86@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('585', 'Septi Palastri', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ters. Kiaracondong No. 816, Jambi 37122, Kepri', '0251 2773 1391', '(+62) 706 4487 352', '0', '0', '0', '0', '0', 1, 'elma35@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('586', 'Gangsa Tarihoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Katamso No. 438, Tual 53989, Sultra', '(+62) 759 6849 5047', '025 9731 136', '0', '0', '0', '0', '0', 1, 'belinda52@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('587', 'Azalea Lili Hassanah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Rajawali No. 769, Batam 36843, Kaltara', '0308 1792 0178', '(+62) 29 5974 225', '0', '0', '0', '0', '0', 1, 'winda.handayani@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('588', 'Heru Karta Saragih S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Gajah No. 517, Bima 51369, Gorontalo', '(+62) 373 6230 4728', '(+62) 747 7520 797', '0', '0', '0', '0', '0', 1, 'msiregar@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('589', 'Eva Yuliarti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Yoga No. 761, Bandung 34196, Kalsel', '024 8580 1617', '0844 8495 419', '0', '0', '0', '0', '0', 1, 'marbun.hani@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('59', 'Olivia Lailasari S.E.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bazuka Raya No. 389, Yogyakarta 89013, Sulut', '0360 2746 735', '(+62) 776 2739 743', '0', '0', '0', '0', '0', 1, 'kayun.yuniar@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('590', 'Hamzah Pradipta', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sugiyopranoto No. 47, Pekalongan 14092, Kalsel', '0315 6094 873', '0667 9805 0661', '0', '0', '0', '0', '0', 1, 'rajata.hilda@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('591', 'Kamila Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Basket No. 16, Cilegon 72336, Maluku', '(+62) 924 4590 8001', '0461 8224 159', '0', '0', '0', '0', '0', 1, 'gawati48@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('592', 'Bajragin Mustofa', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Salatiga No. 5, Padangpanjang 60849, Jateng', '(+62) 332 0628 5041', '(+62) 396 4620 952', '0', '0', '0', '0', '0', 1, 'ellis.lailasari@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('593', 'Humaira Silvia Winarsih S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Umalas No. 311, Manado 67932, Lampung', '0302 8287 782', '0914 9630 523', '0', '0', '0', '0', '0', 1, 'sakura43@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('594', 'Sarah Wulandari', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bayam No. 744, Kotamobagu 67521, NTT', '0777 8803 799', '(+62) 23 6227 346', '0', '0', '0', '0', '0', 1, 'ella.uyainah@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('595', 'Reza Sinaga S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Babadan No. 119, Bitung 53044, Aceh', '0251 9514 9472', '0270 0722 602', '0', '0', '0', '0', '0', 1, 'ikhsan.sitorus@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('596', 'Umay Widodo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Nangka No. 557, Pagar Alam 64246, Jabar', '(+62) 21 0933 642', '(+62) 23 0120 2911', '0', '0', '0', '0', '0', 1, 'laras.mandasari@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021);
INSERT INTO `mahasiswa` (`npm`, `nama_mhs`, `jenis_kelamin`, `tangal_lahir`, `tempat_lahir`, `idAgama`, `idKewarganegaraan`, `nik`, `nisn`, `npwp`, `jalan`, `telephone`, `handphone`, `dusun`, `rt`, `rw`, `kelurahan`, `kecamatan`, `idJenisTinggal`, `email`, `idAlatTransportasi`, `idOrangTuaWali`, `kebutuhanKhusus`, `idProgramMhs`, `idProgramStudi`, `fotoMhs`, `angkatan`) VALUES
('597', 'Vanya Uyainah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bagas Pati No. 165, Tomohon 53900, DKI', '(+62) 388 2363 3736', '021 5514 495', '0', '0', '0', '0', '0', 1, 'dhalim@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('598', 'Kani Permata', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Yohanes No. 28, Sawahlunto 88379, Maluku', '(+62) 221 6093 2091', '(+62) 391 5881 839', '0', '0', '0', '0', '0', 1, 'gkuswoyo@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('599', 'Irfan Siregar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ekonomi No. 326, Batu 88818, Sulut', '(+62) 309 7688 192', '0317 0609 7073', '0', '0', '0', '0', '0', 1, 'suci.winarno@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('6', 'Septi Yolanda S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Cikutra Timur No. 180, Bogor 36303, Sulteng', '0235 9332 679', '0532 7340 445', '0', '0', '0', '0', '0', 1, 'iwahyuni@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('60', 'Daniswara Hutasoit', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tambak No. 297, Metro 32885, Lampung', '020 0303 8481', '0514 8342 6675', '0', '0', '0', '0', '0', 1, 'prayitna24@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('600', 'Latika Laksita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Gremet No. 408, Kotamobagu 59166, Sumut', '027 2276 689', '(+62) 727 3679 742', '0', '0', '0', '0', '0', 1, 'yyuniar@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('601', 'Ifa Yuliarti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bahagia  No. 149, Pariaman 62855, Kepri', '0491 2814 1066', '0342 4241 3434', '0', '0', '0', '0', '0', 1, 'jaeman.wasita@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('602', 'Ibrani Gading Wijaya S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Banal No. 83, Blitar 17659, Papua', '(+62) 793 9564 559', '0781 0408 237', '0', '0', '0', '0', '0', 1, 'estiono.wastuti@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('603', 'Violet Pertiwi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Ikan No. 941, Bogor 75589, Maluku', '0335 5192 7632', '0741 1989 167', '0', '0', '0', '0', '0', 1, 'latif32@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('604', 'Lurhur Gunarto', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Kiaracondong No. 568, Gunungsitoli 54601, Kalsel', '(+62) 771 4963 278', '0296 9768 199', '0', '0', '0', '0', '0', 1, 'damanik.rachel@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('605', 'Gilda Suartini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Imam No. 81, Tangerang Selatan 71151, Jateng', '0503 5394 5409', '0941 9983 493', '0', '0', '0', '0', '0', 1, 'prasasta.sabar@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('606', 'Yulia Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Diponegoro No. 171, Singkawang 55338, Maluku', '0348 1961 723', '027 8006 4633', '0', '0', '0', '0', '0', 1, 'hlaksita@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('607', 'Intan Wulandari M.TI.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Baik No. 819, Sawahlunto 19044, Kalteng', '(+62) 510 3849 3910', '(+62) 369 1860 2635', '0', '0', '0', '0', '0', 1, 'mriyanti@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('608', 'Jaeman Damanik', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Sunaryo No. 11, Palu 30810, Kaltim', '0880 7844 2393', '(+62) 482 1427 1293', '0', '0', '0', '0', '0', 1, 'qhalim@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('609', 'Kawaca Ganep Dabukke S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Mulyadi No. 946, Bitung 70502, Papua', '0767 9190 5006', '0311 3184 516', '0', '0', '0', '0', '0', 1, 'raihan.ardianto@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('61', 'Karya Tarihoran S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Gegerkalong Hilir No. 549, Mataram 20495, Malut', '(+62) 836 0861 8655', '(+62) 22 8196 2597', '0', '0', '0', '0', '0', 1, 'firgantoro.erik@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('610', 'Nyoman Saragih', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sutami No. 263, Banjar 69264, Jateng', '(+62) 21 2567 2575', '(+62) 627 1298 964', '0', '0', '0', '0', '0', 1, 'npuspita@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('611', 'Damar Suryono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Tambun No. 217, Madiun 13803, Jatim', '0923 7530 653', '0919 2996 2840', '0', '0', '0', '0', '0', 1, 'yusuf56@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('612', 'Edward Marbun', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basmol Raya No. 288, Jambi 82735, Jateng', '0952 1808 6275', '(+62) 360 8443 8699', '0', '0', '0', '0', '0', 1, 'hardi.marpaung@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('613', 'Eluh Tamba', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Dago No. 857, Tangerang Selatan 37942, Lampung', '0291 4613 254', '0523 6868 1448', '0', '0', '0', '0', '0', 1, 'jarwi53@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('614', 'Yuni Syahrini Puspita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Gremet No. 174, Bima 39548, DKI', '(+62) 324 8048 010', '0678 7135 2488', '0', '0', '0', '0', '0', 1, 'gading49@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('615', 'Asirwada Rafi Mandala M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Wahid Hasyim No. 933, Administrasi Jakarta Selatan 58297, Malut', '0317 4902 487', '0861 5898 671', '0', '0', '0', '0', '0', 1, 'suartini.titi@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('616', 'Kayun Irawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bayan No. 438, Sawahlunto 93830, Sumut', '0874 293 238', '0511 1803 575', '0', '0', '0', '0', '0', 1, 'hasanah.wawan@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('617', 'Oskar Hidayat', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Katamso No. 84, Kendari 72584, Kalbar', '(+62) 637 8844 200', '0639 0204 6208', '0', '0', '0', '0', '0', 1, 'oskar88@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('618', 'Zahra Sudiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. K.H. Wahid Hasyim (Kopo) No. 220, Metro 33848, Sulbar', '(+62) 29 8460 8261', '0407 4712 754', '0', '0', '0', '0', '0', 1, 'elvina.santoso@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('619', 'Rama Maulana', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Orang No. 70, Samarinda 22853, Jateng', '0748 8550 553', '(+62) 25 7824 0853', '0', '0', '0', '0', '0', 1, 'vega15@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('62', 'Wirda Yulianti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cihampelas No. 273, Gunungsitoli 24770, Sultra', '0326 2149 9684', '0651 6303 015', '0', '0', '0', '0', '0', 1, 'dacin.rahayu@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('620', 'Daniswara Nashiruddin', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Padang No. 61, Gorontalo 43442, Kalsel', '(+62) 235 3182 847', '0952 5136 933', '0', '0', '0', '0', '0', 1, 'xpurnawati@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('621', 'Cakrajiya Mansur S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Otista No. 301, Sukabumi 84171, Sulbar', '0479 4034 7814', '0655 5533 7501', '0', '0', '0', '0', '0', 1, 'gamani.kuswoyo@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('622', 'Gandi Firgantoro', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bagis Utama No. 680, Pematangsiantar 58655, NTT', '0426 7264 1426', '(+62) 811 0992 624', '0', '0', '0', '0', '0', 1, 'qramadan@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('623', 'Gading Nainggolan S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bakhita No. 451, Samarinda 36105, Pabar', '0292 7577 179', '(+62) 715 4821 673', '0', '0', '0', '0', '0', 1, 'nugroho.cahyono@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('624', 'Kajen Mahendra', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Basudewo No. 346, Lhokseumawe 64937, Lampung', '(+62) 344 5964 119', '0834 8261 4460', '0', '0', '0', '0', '0', 1, 'xpuspasari@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('625', 'Limar Napitupulu S.Psi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Padang No. 967, Depok 51889, Sultra', '(+62) 342 3236 499', '(+62) 428 7612 751', '0', '0', '0', '0', '0', 1, 'purwanti.rini@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('626', 'Sari Laksmiwati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Tambak No. 627, Kendari 14868, Lampung', '0542 7773 1258', '(+62) 428 6769 375', '0', '0', '0', '0', '0', 1, 'saragih.jamil@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('627', 'Zelda Hastuti S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jaksa No. 305, Depok 37513, NTT', '0995 1580 4461', '0455 0603 936', '0', '0', '0', '0', '0', 1, 'farida.padma@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('628', 'Luluh Mangunsong S.T.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Flora No. 253, Palangka Raya 73150, Jabar', '(+62) 667 8994 519', '(+62) 807 661 567', '0', '0', '0', '0', '0', 1, 'wfujiati@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('629', 'Sari Yulianti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Uluwatu No. 31, Lhokseumawe 25777, Sumsel', '0822 5547 491', '0700 7477 831', '0', '0', '0', '0', '0', 1, 'permadi.edi@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('63', 'Widya Usamah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Veteran No. 764, Tanjungbalai 35320, Malut', '(+62) 728 3498 992', '(+62) 678 4781 7964', '0', '0', '0', '0', '0', 1, 'hsitompul@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('630', 'Elvina Melani', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Baranang Siang No. 319, Tanjung Pinang 18117, DKI', '0847 9814 855', '(+62) 720 7004 6320', '0', '0', '0', '0', '0', 1, 'ivan28@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('631', 'Harjaya Nashiruddin', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Nanas No. 638, Tanjungbalai 72353, NTB', '(+62) 432 7358 564', '(+62) 387 1946 663', '0', '0', '0', '0', '0', 1, 'kamidin80@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('632', 'Usyi Tari Puspita M.M.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Babah No. 942, Dumai 19728, Jatim', '(+62) 553 5017 4083', '0727 2913 992', '0', '0', '0', '0', '0', 1, 'gina44@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('633', 'Harja Jono Napitupulu S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Tangkuban Perahu No. 582, Batam 22806, Kaltara', '0855 5943 2860', '0856 5880 764', '0', '0', '0', '0', '0', 1, 'ahartati@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('634', 'Balamantri Dongoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Moch. Yamin No. 873, Kediri 82292, Jabar', '0409 5604 6843', '(+62) 671 3455 957', '0', '0', '0', '0', '0', 1, 'halimah.mahmud@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('635', 'Ulya Iriana Fujiati S.Gz', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bass No. 587, Tarakan 43888, DIY', '(+62) 26 1313 7848', '0869 5732 591', '0', '0', '0', '0', '0', 1, 'mutia.nababan@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('636', 'Malika Winarsih', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jend. Sudirman No. 378, Surabaya 44001, DIY', '0497 1701 024', '(+62) 570 0644 7575', '0', '0', '0', '0', '0', 1, 'nasab20@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('637', 'Queen Nadia Mayasari', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Baranang Siang No. 325, Administrasi Jakarta Utara 48472, Sumsel', '0551 4543 4280', '0550 9278 986', '0', '0', '0', '0', '0', 1, 'wijayanti.malik@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('638', 'Zelda Wastuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Peta No. 785, Makassar 77614, NTT', '(+62) 406 4516 087', '(+62) 837 2452 9722', '0', '0', '0', '0', '0', 1, 'jamalia.simanjuntak@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('639', 'Rendy Daniswara Nugroho', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Taman No. 457, Cilegon 19609, Sultra', '(+62) 404 4241 189', '(+62) 954 5259 2073', '0', '0', '0', '0', '0', 1, 'gunawan.agnes@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('64', 'Irwan Pratama', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bah Jaya No. 694, Banjarbaru 83226, Bengkulu', '0368 2278 898', '(+62) 568 6316 9644', '0', '0', '0', '0', '0', 1, 'diana.wulandari@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('640', 'Eka Padma Yolanda S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. S. Parman No. 64, Binjai 36644, Kalteng', '(+62) 848 3156 400', '0408 1321 1992', '0', '0', '0', '0', '0', 1, 'xpratiwi@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('641', 'Unggul Saefullah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Yos No. 54, Samarinda 18954, Kepri', '(+62) 962 8506 7190', '(+62) 872 074 680', '0', '0', '0', '0', '0', 1, 'narpati.ifa@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('642', 'Natalia Palastri S.Pt', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Sutarto No. 47, Ambon 41139, Sumut', '0466 5081 5319', '0898 1745 541', '0', '0', '0', '0', '0', 1, 'hartana.mulyani@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('643', 'Tina Agustina', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. R.M. Said No. 89, Balikpapan 34591, DIY', '(+62) 809 706 183', '0448 4597 333', '0', '0', '0', '0', '0', 1, 'firmansyah.rama@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('644', 'Ajeng Dalima Lailasari M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. M.T. Haryono No. 464, Parepare 47859, Sulteng', '0903 5409 4249', '0874 2251 378', '0', '0', '0', '0', '0', 1, 'uhardiansyah@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('645', 'Aurora Farida', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Gremet No. 612, Samarinda 43361, Jateng', '(+62) 696 2839 7402', '028 3303 3621', '0', '0', '0', '0', '0', 1, 'xnovitasari@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('646', 'Eva Yolanda S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Cemara No. 617, Salatiga 37778, Jatim', '0508 8526 1757', '0849 0833 579', '0', '0', '0', '0', '0', 1, 'gsinaga@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('647', 'Ganep Mandala', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Honggowongso No. 286, Tidore Kepulauan 47143, Jabar', '(+62) 349 3132 307', '0837 4388 239', '0', '0', '0', '0', '0', 1, 'prasetyo.karya@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('648', 'Imam Siregar S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Salak No. 743, Banda Aceh 25841, Maluku', '(+62) 20 5714 0312', '(+62) 739 4141 9593', '0', '0', '0', '0', '0', 1, 'mariadi80@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('649', 'Darimin Latupono', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Ujung No. 392, Malang 28608, Jatim', '0226 2450 454', '(+62) 28 4839 440', '0', '0', '0', '0', '0', 1, 'aslijan12@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('65', 'Keisha Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Juanda No. 758, Kotamobagu 59933, Jateng', '(+62) 920 2445 8057', '0652 1454 737', '0', '0', '0', '0', '0', 1, 'silvia.haryanti@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('650', 'Dalima Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Flora No. 264, Sabang 16904, NTB', '0864 424 246', '(+62) 808 081 958', '0', '0', '0', '0', '0', 1, 'mahendra.lembah@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('651', 'Slamet Adika Mandala', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Jaksa No. 40, Banjarmasin 12015, Bali', '0852 148 384', '0315 4608 7951', '0', '0', '0', '0', '0', 1, 'rina.yuniar@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('652', 'Clara Rahmi Uyainah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Orang No. 760, Dumai 38495, Sulbar', '0870 668 613', '(+62) 657 0147 7137', '0', '0', '0', '0', '0', 1, 'kiswahyudi@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('653', 'Violet Handayani M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jagakarsa No. 958, Lubuklinggau 86422, DKI', '(+62) 890 3841 585', '0985 5925 391', '0', '0', '0', '0', '0', 1, 'rama.samosir@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('654', 'Maman Pranawa Pranowo S.Sos', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baja No. 912, Pekanbaru 46802, NTT', '(+62) 713 8332 977', '0656 2873 7069', '0', '0', '0', '0', '0', 1, 'samosir.agus@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('655', 'Ade Anggraini', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bah Jaya No. 253, Denpasar 14513, Kaltara', '(+62) 235 7837 737', '(+62) 22 8602 6219', '0', '0', '0', '0', '0', 1, 'purwanto.sitompul@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('656', 'Lantar Suwarno', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Bara No. 33, Jayapura 13150, Jateng', '0410 5538 557', '027 4138 957', '0', '0', '0', '0', '0', 1, 'prabowo.rahmawati@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('657', 'Sabri Rahmat Kurniawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Babadan No. 402, Tegal 65963, DIY', '(+62) 789 9294 392', '0667 1892 557', '0', '0', '0', '0', '0', 1, 'dalima.hariyah@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('658', 'Hasna Ophelia Purnawati S.H.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Untung Suropati No. 607, Pariaman 80163, Aceh', '(+62) 581 6175 809', '0265 6520 420', '0', '0', '0', '0', '0', 1, 'mangunsong.marwata@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('659', 'Putri Padmasari M.Pd', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Baiduri No. 657, Padangpanjang 46748, Sumut', '(+62) 442 3212 635', '(+62) 568 1970 0509', '0', '0', '0', '0', '0', 1, 'hasanah.bakijan@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('66', 'Najwa Queen Andriani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sutami No. 463, Pontianak 47083, Bengkulu', '(+62) 927 0782 593', '(+62) 304 0274 987', '0', '0', '0', '0', '0', 1, 'cahyono48@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('660', 'Prabu Hardiansyah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Pasteur No. 188, Solok 34733, Papua', '(+62) 261 3368 5092', '(+62) 271 9124 3226', '0', '0', '0', '0', '0', 1, 'suartini.heryanto@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('661', 'Perkasa Cemani Tarihoran', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basket No. 292, Padang 47894, Babel', '(+62) 622 8617 110', '0245 4758 080', '0', '0', '0', '0', '0', 1, 'hendra01@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('662', 'Darsirah Ardianto', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Ters. Pasir Koja No. 646, Banda Aceh 31051, Papua', '(+62) 532 4349 2755', '(+62) 314 3472 268', '0', '0', '0', '0', '0', 1, 'rnapitupulu@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('663', 'Tari Oni Laksmiwati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sutoyo No. 848, Metro 42424, Sumbar', '(+62) 991 4890 637', '(+62) 955 7101 668', '0', '0', '0', '0', '0', 1, 'iyuliarti@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('664', 'Yuni Utami S.T.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Tambak No. 100, Batam 59158, Kepri', '(+62) 746 9240 7760', '0790 7566 977', '0', '0', '0', '0', '0', 1, 'yuliarti.warji@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('665', 'Ajimat Kemal Tamba S.Psi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bak Air No. 612, Tangerang Selatan 51929, Kalbar', '0889 847 766', '0947 7334 1452', '0', '0', '0', '0', '0', 1, 'vanesa.nuraini@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('666', 'Syahrini Agustina', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Tubagus Ismail No. 782, Sibolga 21579, Jabar', '(+62) 816 1378 464', '0716 1373 112', '0', '0', '0', '0', '0', 1, 'yrahayu@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('667', 'Karsana Prakasa', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bagis Utama No. 858, Blitar 76701, Gorontalo', '0440 4570 5663', '0673 7189 675', '0', '0', '0', '0', '0', 1, 'wijayanti.titin@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('668', 'Mustofa Mansur', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Jakarta No. 961, Prabumulih 67266, Jabar', '(+62) 790 7615 883', '0457 3101 333', '0', '0', '0', '0', '0', 1, 'elma76@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('669', 'Melinda Astuti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Kusmanto No. 416, Cimahi 54432, DKI', '0811 3432 0026', '0294 7839 0513', '0', '0', '0', '0', '0', 1, 'ebudiyanto@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('67', 'Lanjar Prakasa', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Gotong Royong No. 309, Cimahi 76097, NTB', '0677 6682 042', '0946 5938 0342', '0', '0', '0', '0', '0', 1, 'nilam46@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('670', 'Siska Aryani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jamika No. 646, Salatiga 30152, Kalteng', '0453 2059 6736', '0655 0656 261', '0', '0', '0', '0', '0', 1, 'queen94@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('671', 'Bajragin Jasmani Napitupulu M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bagis Utama No. 360, Palangka Raya 57989, Bengkulu', '(+62) 640 3617 524', '(+62) 818 5169 6622', '0', '0', '0', '0', '0', 1, 'panca.mandasari@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('672', 'Makuta Siregar', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Moch. Toha No. 941, Dumai 71120, DKI', '(+62) 724 0287 9563', '021 9974 982', '0', '0', '0', '0', '0', 1, 'puji.haryanti@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('673', 'Gadang Carub Mandala S.E.I', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jaksa No. 965, Bengkulu 99428, Jateng', '0432 8123 380', '(+62) 448 6650 4816', '0', '0', '0', '0', '0', 1, 'rahmi68@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('674', 'Silvia Zizi Pratiwi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sumpah Pemuda No. 721, Metro 20376, Sultra', '(+62) 807 9574 377', '(+62) 743 2457 4862', '0', '0', '0', '0', '0', 1, 'zamira01@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('675', 'Makuta Budiyanto S.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Radio No. 990, Makassar 32660, NTB', '0691 5187 127', '0256 3541 5440', '0', '0', '0', '0', '0', 1, 'epudjiastuti@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('676', 'Lanang Sihombing', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Ir. H. Juanda No. 277, Gorontalo 25042, Kalbar', '0220 2909 604', '(+62) 837 262 831', '0', '0', '0', '0', '0', 1, 'salahudin.dinda@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('677', 'Maman Jatmiko Kusumo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Sutami No. 48, Pariaman 95502, Sumsel', '0330 5148 4854', '0774 3961 8536', '0', '0', '0', '0', '0', 1, 'fujiati.cager@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('678', 'Nova Wastuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Lumban Tobing No. 191, Subulussalam 76964, Pabar', '0360 1209 6777', '(+62) 375 4491 8665', '0', '0', '0', '0', '0', 1, 'talia.farida@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('679', 'Asmadi Gunawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Raden No. 370, Sabang 68244, DKI', '(+62) 368 9789 830', '0267 9811 6387', '0', '0', '0', '0', '0', 1, 'nashiruddin.mulyono@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('68', 'Jaka Maryadi', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sutarto No. 503, Sabang 65239, Sumsel', '(+62) 416 7853 8169', '0638 8302 0362', '0', '0', '0', '0', '0', 1, 'jrahayu@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('680', 'Ajimin Rajasa', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Basuki Rahmat  No. 743, Bitung 80915, Jambi', '0719 7805 332', '(+62) 566 3186 6962', '0', '0', '0', '0', '0', 1, 'harimurti.gunawan@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('681', 'Padma Handayani', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Yap Tjwan Bing No. 382, Sungai Penuh 67760, Sulteng', '0286 5795 537', '(+62) 361 7349 3024', '0', '0', '0', '0', '0', 1, 'zahra.waskita@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('682', 'Cagak Prasetya', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Setia Budi No. 937, Palu 30422, Sulteng', '0929 8573 9973', '0765 4076 381', '0', '0', '0', '0', '0', 1, 'citra23@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('683', 'Rudi Hutapea', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Dipatiukur No. 389, Tegal 46562, Bali', '(+62) 799 1128 0634', '0212 8700 845', '0', '0', '0', '0', '0', 1, 'harsaya.pradipta@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('684', 'Galih Sihotang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Bak Mandi No. 38, Pekalongan 76213, Jambi', '(+62) 817 3267 6531', '(+62) 913 3244 2023', '0', '0', '0', '0', '0', 1, 'fputra@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('685', 'Vega Tarihoran', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Surapati No. 417, Ambon 76612, Sumut', '0883 6712 279', '0495 6407 137', '0', '0', '0', '0', '0', 1, 'jono.nasyidah@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('686', 'Victoria Najwa Utami S.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Imam No. 240, Probolinggo 55187, Riau', '0981 4009 9452', '0615 1731 0716', '0', '0', '0', '0', '0', 1, 'kania98@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('687', 'Atmaja Kacung Setiawan M.Kom.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bak Mandi No. 965, Batam 14853, Banten', '020 3729 008', '(+62) 288 3887 0402', '0', '0', '0', '0', '0', 1, 'sakura67@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('688', 'Siska Laksita S.Ked', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Cut Nyak Dien No. 461, Denpasar 99411, Sumut', '(+62) 250 4490 3468', '0456 2987 290', '0', '0', '0', '0', '0', 1, 'utama.ilsa@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('689', 'Banara Suwarno M.Ak', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Bakau No. 31, Metro 56745, Sulut', '0289 1778 403', '028 4366 0104', '0', '0', '0', '0', '0', 1, 'mmaryadi@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('69', 'Dacin Manullang', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Honggowongso No. 109, Subulussalam 27701, Sultra', '0672 2549 064', '(+62) 262 4985 692', '0', '0', '0', '0', '0', 1, 'harja.melani@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('690', 'Titi Prastuti S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Tambak No. 156, Sibolga 58949, Sulbar', '0604 5876 0567', '0874 5001 8458', '0', '0', '0', '0', '0', 1, 'tantri26@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('691', 'Galar Rajata', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Sentot Alibasa No. 966, Parepare 43225, Sumut', '0374 1173 0159', '0413 2101 1615', '0', '0', '0', '0', '0', 1, 'balamantri.prakasa@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('692', 'Joko Narpati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Tentara Pelajar No. 224, Samarinda 81708, Riau', '(+62) 510 2898 1762', '0654 3880 0475', '0', '0', '0', '0', '0', 1, 'hpradipta@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('693', 'Nova Susanti', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Daan No. 427, Kendari 76576, Sulteng', '0583 4281 6461', '0850 8121 6210', '0', '0', '0', '0', '0', 1, 'narpati.lala@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('694', 'Nasab Kurniawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Basoka Raya No. 990, Pekalongan 67124, Kaltara', '(+62) 668 0756 8930', '0425 2977 741', '0', '0', '0', '0', '0', 1, 'gyuniar@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('695', 'Devi Zulaika S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Soekarno Hatta No. 637, Parepare 83083, Kalteng', '0885 717 146', '0561 8720 599', '0', '0', '0', '0', '0', 1, 'cengkir.riyanti@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('696', 'Vivi Fujiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Baing No. 451, Salatiga 66205, Sumut', '(+62) 353 3017 040', '(+62) 351 6194 416', '0', '0', '0', '0', '0', 1, 'umar.marpaung@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('697', 'Keisha Uyainah M.Kom.', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Mulyadi No. 580, Manado 96993, Bali', '0978 7992 738', '(+62) 841 0295 386', '0', '0', '0', '0', '0', 1, 'najmudin.lasmanto@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('698', 'Sakura Astuti', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Bahagia No. 217, Administrasi Jakarta Selatan 44982, Banten', '(+62) 271 5945 1666', '(+62) 633 3159 889', '0', '0', '0', '0', '0', 1, 'damu.susanti@example.com', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('699', 'Putri Jamalia Rahimah S.H.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Sutami No. 953, Cilegon 82095, Kalsel', '0204 3464 680', '022 2693 5131', '0', '0', '0', '0', '0', 1, 'slamet.mardhiyah@example.org', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('7', 'Surya Saefullah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Rajawali Barat No. 876, Padang 35632, Sumbar', '0688 6655 3416', '(+62) 369 8104 3347', '0', '0', '0', '0', '0', 1, 'cawuk.prasetyo@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('70', 'Gangsar Firgantoro', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Suryo No. 174, Cirebon 92219, DIY', '(+62) 447 8922 7548', '0625 0859 398', '0', '0', '0', '0', '0', 1, 'cornelia41@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('700', 'Utama Sitompul M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Basoka No. 624, Padangsidempuan 67963, Sulut', '0321 5868 229', '0430 5092 394', '0', '0', '0', '0', '0', 1, 'uhidayanto@example.net', 1, 1, 'Tidak', '1', '74201', '-', 2021),
('71', 'Gamani Gandi Firgantoro', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Imam Bonjol No. 452, Surakarta 54364, DIY', '(+62) 932 2746 610', '(+62) 702 0226 147', '0', '0', '0', '0', '0', 1, 'julia19@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('72', 'Tomi Wadi Maulana', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Babakan No. 248, Balikpapan 39558, Gorontalo', '0443 4110 001', '(+62) 240 8959 5085', '0', '0', '0', '0', '0', 1, 'abyasa06@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('73', 'Timbul Nugroho', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sudirman No. 537, Surakarta 74252, Babel', '(+62) 21 0171 2856', '(+62) 853 8833 8032', '0', '0', '0', '0', '0', 1, 'pertiwi.diana@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('74', 'Bahuraksa Irawan', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Hang No. 892, Tasikmalaya 73899, Pabar', '(+62) 814 4700 568', '(+62) 817 223 443', '0', '0', '0', '0', '0', 1, 'nurul04@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('75', 'Ihsan Sinaga', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Jagakarsa No. 344, Bengkulu 39788, Jabar', '0378 5707 762', '(+62) 29 7782 350', '0', '0', '0', '0', '0', 1, 'ifa20@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('76', 'Titi Nasyidah', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Suharso No. 641, Bontang 98267, Sulbar', '0809 3059 2783', '(+62) 29 5604 7910', '0', '0', '0', '0', '0', 1, 'daru85@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('77', 'Luwes Jaeman Wacana S.Kom', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Nanas No. 694, Palangka Raya 90753, Sultra', '(+62) 352 7405 098', '(+62) 797 1472 0424', '0', '0', '0', '0', '0', 1, 'winarno.ani@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('78', 'Prabu Dabukke', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Bambu No. 791, Bontang 84169, Babel', '027 1409 4952', '0902 6723 335', '0', '0', '0', '0', '0', 1, 'anastasia57@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('79', 'Bagas Kurniawan M.M.', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. Gotong Royong No. 844, Sorong 45509, Jabar', '(+62) 223 1300 832', '0517 9603 5359', '0', '0', '0', '0', '0', 1, 'asetiawan@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('8', 'Michelle Samiah Haryanti M.Pd', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Bara No. 438, Tomohon 30881, Sumsel', '(+62) 967 2625 5768', '(+62) 939 5904 105', '0', '0', '0', '0', '0', 1, 'kartika95@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('80', 'Vicky Fujiati', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Kartini No. 750, Manado 58550, Gorontalo', '(+62) 563 0711 378', '(+62) 750 5352 968', '0', '0', '0', '0', '0', 1, 'wacana.jane@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('81', 'Marsudi Maulana', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Suryo No. 518, Banjar 71423, Pabar', '(+62) 27 0071 468', '0618 6471 5972', '0', '0', '0', '0', '0', 1, 'padmasari.agnes@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('82', 'Bakiadi Hakim', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Wahidin Sudirohusodo No. 891, Bandar Lampung 27198, Sumsel', '(+62) 655 0859 4742', '(+62) 692 8570 174', '0', '0', '0', '0', '0', 1, 'ana.yuliarti@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('83', 'Yuni Rahmi Laksita', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Rajawali Timur No. 879, Pagar Alam 72206, Kaltim', '0521 1879 8454', '0305 8370 6669', '0', '0', '0', '0', '0', 1, 'ulestari@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('84', 'Puti Laksmiwati', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Daan No. 935, Magelang 70148, Pabar', '(+62) 404 1149 437', '0850 670 469', '0', '0', '0', '0', '0', 1, 'prayoga.vera@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('85', 'Cagak Wasita', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Dk. Kebonjati No. 415, Balikpapan 22319, Banten', '(+62) 683 2155 234', '0681 6366 3028', '0', '0', '0', '0', '0', 1, 'haryanto.jasmani@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('86', 'Karen Ulva Agustina', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Surapati No. 271, Tanjung Pinang 38911, Sultra', '(+62) 709 0566 645', '(+62) 920 2701 4419', '0', '0', '0', '0', '0', 1, 'cindy.purwanti@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('87', 'Cagak Dasa Napitupulu', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Veteran No. 431, Subulussalam 71651, Kepri', '(+62) 729 2626 924', '0582 7851 104', '0', '0', '0', '0', '0', 1, 'palastri.amelia@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('88', 'Artanto Arsipatra Prayoga S.I.Kom', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sam Ratulangi No. 482, Samarinda 62774, Jabar', '(+62) 379 4796 377', '027 8359 058', '0', '0', '0', '0', '0', 1, 'firmansyah.vanya@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('89', 'Farah Hastuti S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Daan No. 906, Depok 73618, Gorontalo', '(+62) 831 3194 9998', '0582 9661 6329', '0', '0', '0', '0', '0', 1, 'ilsa12@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('9', 'Garang Narpati S.Farm', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Baladewa No. 646, Tomohon 83772, Papua', '(+62) 422 8423 904', '0786 3239 4148', '0', '0', '0', '0', '0', 1, 'uli.haryanto@example.com', 1, 1, 'Tidak', '1', '55-201', '-', 2022),
('90', 'Tedi Cahyo Setiawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ds. Sunaryo No. 252, Tasikmalaya 41084, Kaltim', '(+62) 340 2161 274', '(+62) 352 3156 580', '0', '0', '0', '0', '0', 1, 'samsul.hariyah@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('91', 'Elvina Farida', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Pacuan Kuda No. 91, Serang 61804, Banten', '0276 2314 648', '021 5118 455', '0', '0', '0', '0', '0', 1, 'purnawati.dariati@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('92', 'Tami Nilam Uyainah', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Kpg. S. Parman No. 967, Pematangsiantar 33782, Jabar', '0592 3792 395', '0806 3044 0653', '0', '0', '0', '0', '0', 1, 'wani31@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('93', 'Balidin Widodo', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Tentara Pelajar No. 758, Probolinggo 83223, Jabar', '(+62) 390 3139 6416', '(+62) 691 1120 512', '0', '0', '0', '0', '0', 1, 'maryati.nurul@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('94', 'Rafid Pradipta S.Pt', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Ki. Bhayangkara No. 962, Bitung 58563, NTB', '0893 5258 767', '(+62) 585 3622 098', '0', '0', '0', '0', '0', 1, 'galak.santoso@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('95', 'Bakianto Irawan', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jr. Cikutra Barat No. 247, Banjarmasin 73707, Riau', '(+62) 22 4333 350', '(+62) 413 9606 946', '0', '0', '0', '0', '0', 1, 'irsad65@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('96', 'Gamani Ardianto M.Farm', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Gg. Baya Kali Bungur No. 636, Bekasi 79313, Sultra', '(+62) 647 5307 602', '(+62) 609 4808 9624', '0', '0', '0', '0', '0', 1, 'galiono.aryani@example.com', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('97', 'Kenari Habibi', 'Laki-laki', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Moch. Ramdan No. 459, Bitung 74896, Malut', '(+62) 311 3168 078', '(+62) 23 9703 9594', '0', '0', '0', '0', '0', 1, 'dina.sihombing@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('98', 'Padmi Putri Zulaika', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Psr. Juanda No. 266, Kotamobagu 37532, Babel', '(+62) 429 1702 859', '0845 4003 0741', '0', '0', '0', '0', '0', 1, 'handayani.ami@example.net', 1, 1, 'Tidak', '1', '13201', '-', 2022),
('99', 'Genta Puspasari S.IP', 'Perempuan', '1992-11-09', '0', 1, 62, '0', '0', '0', 'Jln. Sadang Serang No. 934, Manado 46463, Sulsel', '0346 2051 947', '0667 0284 3274', '0', '0', '0', '0', '0', 1, 'aisyah.palastri@example.org', 1, 1, 'Tidak', '1', '13201', '-', 2022);

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
-- Struktur dari tabel `masterkelas`
--

CREATE TABLE `masterkelas` (
  `idMasterKelas` int(2) NOT NULL,
  `kelas` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masterkelas`
--

INSERT INTO `masterkelas` (`idMasterKelas`, `kelas`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

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
('WP06114', 1, 4, 'PENGANTAR SISTEM DIGITAL', 1, 'Ya', 0, 3, 3, NULL, NULL, NULL, 'Offline', NULL, NULL),
('WP06123', 1, 6, 'TEORI BAHASA DAN AUTOMATA', 1, 'Tidak', NULL, 3, 3, NULL, NULL, NULL, 'Offline', NULL, NULL),
('WP06789', 1, 3, 'Keamanan Sistem', 1, 'Tidak', NULL, 3, 3, NULL, NULL, NULL, 'Offline', NULL, NULL);

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

--
-- Dumping data untuk tabel `pembimbingakademik`
--

INSERT INTO `pembimbingakademik` (`idPembimbingAkademik`, `nidn`, `npm`) VALUES
(1, '0201078501', '1'),
(2, '12345678', '11'),
(3, '0201078501', '10'),
(4, '0201078501', '12'),
(5, '0201078501', '21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembimbingta`
--

CREATE TABLE `pembimbingta` (
  `idPembimbingTA` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `statusPembimbingTA` enum('Pembimbing 1','Pembimbing 2') NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembimbingta`
--

INSERT INTO `pembimbingta` (`idPembimbingTA`, `npm`, `nidn`, `statusPembimbingTA`, `idProgramStudi`) VALUES
(2, '1', '0201078501', 'Pembimbing 1', '55-201'),
(3, '10', '0201078501', 'Pembimbing 2', '55-201');

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
-- Struktur dari tabel `pengajuanskripsi`
--

CREATE TABLE `pengajuanskripsi` (
  `idPengajuanSkripsi` int(5) NOT NULL,
  `npm` varchar(10) NOT NULL,
  `idTahunAkademik` int(5) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL,
  `statusAjuan` enum('Accepted','Ajuan','Di Tolak') NOT NULL,
  `catatan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `idPresensiDosen` varchar(50) NOT NULL,
  `idJurnal` varchar(50) DEFAULT NULL,
  `imgPresensi` varchar(50) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `presensidosen`
--

INSERT INTO `presensidosen` (`idPresensiDosen`, `idJurnal`, `imgPresensi`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
('202115-1-5', '202115-1', NULL, '1.1494', '104.0249', '2022-11-29 21:12:01', '2022-11-29 21:12:01'),
('202121-1-1', '202121-1', '202121-1.jpg', '1.1494', '104.0249', '2022-11-29 19:06:34', '2022-12-01 00:59:29'),
('202121-10-1', '202121-10', NULL, '1.1494', '104.0249', '2022-11-29 21:02:12', '2022-11-29 21:02:12'),
('202121-11-1', '202121-11', NULL, '1.1494', '104.0249', '2022-11-29 21:02:22', '2022-11-29 21:02:22'),
('202121-12-1', '202121-12', NULL, '1.1494', '104.0249', '2022-11-29 21:02:32', '2022-11-29 21:02:32'),
('202121-13-1', '202121-13', NULL, '1.1494', '104.0249', '2022-11-29 21:02:43', '2022-11-29 21:02:43'),
('202121-14-1', '202121-14', NULL, '1.1494', '104.0249', '2022-11-29 21:02:55', '2022-11-29 21:02:55'),
('202121-15-1', '202121-15', NULL, '1.1494', '104.0249', '2022-11-29 21:06:07', '2022-11-29 21:06:07'),
('202121-16-1', '202121-16', NULL, '1.1494', '104.0249', '2022-11-29 21:06:47', '2022-11-29 21:06:47'),
('202121-2-1', '202121-2', '202121-2.jpg', '1.1494', '104.0249', '2022-11-29 20:45:38', '2022-12-01 01:25:06'),
('202121-3-1', '202121-3', '202121-3.jpg', '1.1494', '104.0249', '2022-11-29 20:45:49', '2022-12-01 01:25:32'),
('202121-4-1', '202121-4', '202121-4.jpg', '1.1494', '104.0249', '2022-11-29 20:46:00', '2022-12-01 18:45:46'),
('202121-5-1', '202121-5', NULL, '1.1494', '104.0249', '2022-11-29 20:46:15', '2022-11-29 20:46:15'),
('202121-6-1', '202121-6', NULL, '1.1494', '104.0249', '2022-11-29 20:49:53', '2022-11-30 00:27:44'),
('202121-7-1', '202121-7', NULL, '1.1494', '104.0249', '2022-11-29 20:50:04', '2022-11-29 20:50:04'),
('202121-8-1', '202121-8', NULL, '1.1494', '104.0249', '2022-11-29 20:50:15', '2022-11-29 20:50:15'),
('202121-9-1', '202121-9', NULL, '1.1494', '104.0249', '2022-11-29 21:02:01', '2022-11-29 21:02:01'),
('202123-1-3', '202123-1', NULL, '1.1494', '104.0249', '2022-11-29 21:08:29', '2022-11-29 21:08:29'),
('202123-2-3', '202123-2', NULL, '1.1494', '104.0249', '2022-11-30 02:20:39', '2022-11-30 02:20:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensimhs`
--

CREATE TABLE `presensimhs` (
  `idPresensiMhs` int(5) NOT NULL,
  `idJenisPresensi` varchar(50) DEFAULT NULL,
  `idKelasKuliah` int(5) DEFAULT NULL,
  `idKRS` varchar(50) DEFAULT NULL,
  `idJurnal` varchar(20) DEFAULT NULL,
  `kehadiran` decimal(3,2) DEFAULT NULL,
  `keterangan` text DEFAULT '-',
  `imgPresensi` varchar(50) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `presensimhs`
--

INSERT INTO `presensimhs` (`idPresensiMhs`, `idJenisPresensi`, `idKelasKuliah`, `idKRS`, `idJurnal`, `kehadiran`, `keterangan`, `imgPresensi`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(233, '1', 1, '1', '202121-1', '1.00', '-', NULL, NULL, NULL, '2022-11-29 19:06:25', '2022-11-29 19:06:34'),
(234, '1', 1, '2', '202121-1', '0.00', '-', NULL, NULL, NULL, '2022-11-29 19:06:25', '2022-11-29 19:06:34'),
(235, '1', 1, '1', '202121-2', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:44:34', '2022-11-29 20:45:37'),
(236, '1', 1, '2', '202121-2', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:44:34', '2022-11-29 20:45:37'),
(237, '1', 1, '1', '202121-3', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:44:51', '2022-11-29 20:45:49'),
(238, '1', 1, '2', '202121-3', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:44:51', '2022-11-29 20:45:49'),
(239, '1', 1, '1', '202121-4', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:45:11', '2022-11-29 20:46:00'),
(240, '1', 1, '2', '202121-4', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:45:11', '2022-11-29 20:46:00'),
(241, '1', 1, '1', '202121-5', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:45:29', '2022-11-29 20:46:15'),
(242, '1', 1, '2', '202121-5', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:45:29', '2022-11-29 20:46:15'),
(243, '1', 1, '1', '202121-6', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:49:09', '2022-11-30 00:27:44'),
(244, '1', 1, '2', '202121-6', '0.20', '-', NULL, NULL, NULL, '2022-11-29 20:49:09', '2022-11-30 00:27:44'),
(245, '1', 1, '1', '202121-7', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:49:25', '2022-11-29 20:50:04'),
(246, '1', 1, '2', '202121-7', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:49:25', '2022-11-29 20:50:04'),
(247, '1', 1, '1', '202121-8', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:49:42', '2022-11-29 20:50:15'),
(248, '1', 1, '2', '202121-8', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:49:42', '2022-11-29 20:50:15'),
(249, '1', 1, '1', '202121-9', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:51:30', '2022-11-29 21:02:01'),
(250, '1', 1, '2', '202121-9', '1.00', '-', NULL, NULL, NULL, '2022-11-29 20:51:30', '2022-11-29 21:02:01'),
(251, '1', 1, '1', '202121-10', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:00:48', '2022-11-29 21:02:12'),
(252, '1', 1, '2', '202121-10', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:00:48', '2022-11-29 21:02:12'),
(253, '1', 1, '1', '202121-11', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:02', '2022-11-29 21:02:22'),
(254, '1', 1, '2', '202121-11', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:02', '2022-11-29 21:02:22'),
(255, '1', 1, '1', '202121-12', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:17', '2022-11-29 21:02:31'),
(256, '1', 1, '2', '202121-12', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:17', '2022-11-29 21:02:31'),
(257, '1', 1, '1', '202121-13', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:36', '2022-11-29 21:02:43'),
(258, '1', 1, '2', '202121-13', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:36', '2022-11-29 21:02:43'),
(259, '1', 1, '1', '202121-14', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:53', '2022-11-29 21:02:55'),
(260, '1', 1, '2', '202121-14', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:01:53', '2022-11-29 21:02:55'),
(261, '1', 1, '1', '202121-15', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:05:55', '2022-11-29 21:06:07'),
(262, '1', 1, '2', '202121-15', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:05:55', '2022-11-29 21:06:07'),
(263, '1', 1, '1', '202121-16', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:06:38', '2022-11-29 21:06:47'),
(264, '1', 1, '2', '202121-16', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:06:38', '2022-11-29 21:06:47'),
(265, '1', 3, '5', '202123-1', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:08:18', '2022-11-29 21:08:28'),
(266, '1', 5, '7', '202115-1', '1.00', '-', NULL, NULL, NULL, '2022-11-29 21:11:05', '2022-11-29 21:12:01'),
(267, '1', 3, '5', '202123-2', '1.00', '-', NULL, NULL, NULL, '2022-11-30 02:20:14', '2022-11-30 02:20:39');

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
('13201', 'Kesehatan Masyarakat', 'FIKES'),
('14201', 'Ilmu Keperawatan', 'FIKES'),
('14901', 'Profesi Ners', 'FIKES'),
('20201', 'Teknik Elektro', 'FT'),
('54201', 'Agribisnis', 'FPP'),
('54211', 'Agroteknologi', 'FPP'),
('54231', 'Peternakan', 'FPP'),
('55-201', 'Teknik Informatika', 'FT'),
('57201', 'Sistem Informasi', 'FT'),
('60202', 'Ekonomi Islam', 'FEBI'),
('61201', 'Manajemen', 'FEBI'),
('62201', 'Akuntansi', 'FEBI'),
('63201', 'Ilmu Administrasi Negara', 'FISIPOL'),
('69201', 'Sosiologi', 'FISIPOL'),
('70201', 'Ilmu Komunikasi', 'FISIPOL'),
('70233', 'Komunikasi dan Penyiaran Islam', 'FAI'),
('74201', 'Ilmu Hukum', 'FH'),
('84105', 'Pendidikan Biologi Pasca', 'PASCA'),
('84202', 'Pendidikan Matematika', 'FKIP'),
('84205', 'Pendidikan Biologi', 'FKIP'),
('86208', 'Pendidikan Agama Islam', 'FAI'),
('87203', 'Pendidikan Ekonomi', 'FKIP'),
('87205', 'Pendidikan Pancasila Dan Kewarganegaraan', 'FKIP'),
('88201', 'Pendidikan Bahasa Dan Sastra Indonesia', 'FKIP'),
('88203', 'Pendidikan Bahasa Inggris', 'FKIP');

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
-- Struktur dari tabel `syaratskripsi`
--

CREATE TABLE `syaratskripsi` (
  `idSyaratSkripsi` int(5) NOT NULL,
  `namaSyarat` varchar(500) NOT NULL,
  `idProgramStudi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `syaratskripsi`
--

INSERT INTO `syaratskripsi` (`idSyaratSkripsi`, `namaSyarat`, `idProgramStudi`) VALUES
(1, 'Sertifikat Toefl', '55201'),
(2, 'Sertifikat Apalah', '55201');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahunakademik`
--

CREATE TABLE `tahunakademik` (
  `idTahunAkademik` int(5) NOT NULL,
  `semesterAkademik` enum('Ganjil','Genap') NOT NULL,
  `namaSemester` varchar(255) DEFAULT NULL,
  `status` enum('aktif','tidak aktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tahunakademik`
--

INSERT INTO `tahunakademik` (`idTahunAkademik`, `semesterAkademik`, `namaSemester`, `status`) VALUES
(20202, 'Genap', 'Genap', 'tidak aktif'),
(20211, 'Ganjil', 'Ganjil', 'tidak aktif'),
(20212, 'Genap', 'Genap', 'aktif'),
(20221, 'Ganjil', 'Ganjil', 'tidak aktif');

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
-- Indeks untuk tabel `detailkhs`
--
ALTER TABLE `detailkhs`
  ADD PRIMARY KEY (`idDetailKHS`),
  ADD KEY `idKelasKuliah` (`idKelasKuliah`),
  ADD KEY `idKRS` (`idKRS`);

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
  ADD PRIMARY KEY (`idJurnal`),
  ADD UNIQUE KEY `pertemuan` (`pertemuan`);

--
-- Indeks untuk tabel `kelaskuliah`
--
ALTER TABLE `kelaskuliah`
  ADD PRIMARY KEY (`idKelasKuliah`),
  ADD KEY `idKelasmhs` (`idMasterKelas`),
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
-- Indeks untuk tabel `kelengkapanskripsi`
--
ALTER TABLE `kelengkapanskripsi`
  ADD PRIMARY KEY (`idKelengkapanSkripsi`);

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
  ADD KEY `idKelasmhs` (`idMasterKelas`),
  ADD KEY `idMataKuliah` (`idMataKuliah`),
  ADD KEY `idTahunAkademik` (`idTahunAkademik`),
  ADD KEY `npm` (`npm`);

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
-- Indeks untuk tabel `masterkelas`
--
ALTER TABLE `masterkelas`
  ADD PRIMARY KEY (`idMasterKelas`);

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
-- Indeks untuk tabel `pengajuanskripsi`
--
ALTER TABLE `pengajuanskripsi`
  ADD PRIMARY KEY (`idPengajuanSkripsi`);

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
  ADD PRIMARY KEY (`idPresensiDosen`);

--
-- Indeks untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  ADD PRIMARY KEY (`idPresensiMhs`),
  ADD KEY `idKelasKuliah` (`idJurnal`),
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
-- Indeks untuk tabel `syaratskripsi`
--
ALTER TABLE `syaratskripsi`
  ADD PRIMARY KEY (`idSyaratSkripsi`);

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
  MODIFY `idBimbinganKRS` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `idJadwalAkademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idKelasKuliah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kelasmhs`
--
ALTER TABLE `kelasmhs`
  MODIFY `idKelasmhs` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT untuk tabel `masterkelas`
--
ALTER TABLE `masterkelas`
  MODIFY `idMasterKelas` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idPembayaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembimbingakademik`
--
ALTER TABLE `pembimbingakademik`
  MODIFY `idPembimbingAkademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembimbingta`
--
ALTER TABLE `pembimbingta`
  MODIFY `idPembimbingTA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  MODIFY `idPresensiMhs` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

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
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`idAgama`) REFERENCES `agama` (`idAgama`);

--
-- Ketidakleluasaan untuk tabel `jadwalakademik`
--
ALTER TABLE `jadwalakademik`
  ADD CONSTRAINT `jadwalakademik_ibfk_2` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`);

--
-- Ketidakleluasaan untuk tabel `kelaskuliah`
--
ALTER TABLE `kelaskuliah`
  ADD CONSTRAINT `kelaskuliah_ibfk_1` FOREIGN KEY (`idMasterKelas`) REFERENCES `kelasmhs` (`idKelasmhs`),
  ADD CONSTRAINT `kelaskuliah_ibfk_2` FOREIGN KEY (`idLingkupKuliah`) REFERENCES `lingkupkuliah` (`idLingkupKuliah`),
  ADD CONSTRAINT `kelaskuliah_ibfk_3` FOREIGN KEY (`idModeKuliah`) REFERENCES `modekuliah` (`idModeKuliah`),
  ADD CONSTRAINT `kelaskuliah_ibfk_5` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`),
  ADD CONSTRAINT `kelaskuliah_ibfk_7` FOREIGN KEY (`idRuaganKelas`) REFERENCES `ruangankelas` (`idRuaganKelas`),
  ADD CONSTRAINT `kelaskuliah_ibfk_8` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`),
  ADD CONSTRAINT `kelaskuliah_ibfk_9` FOREIGN KEY (`idMataKuliah`) REFERENCES `matakuliah` (`idMataKuliah`);

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`idKelasKuliah`) REFERENCES `kelaskuliah` (`idKelasKuliah`);

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`idTahunAkademik`) REFERENCES `tahunakademik` (`idTahunAkademik`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`idAgama`) REFERENCES `agama` (`idAgama`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`idKewarganegaraan`) REFERENCES `kewarganegaraan` (`idKewarganegaraan`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`idJenisTinggal`) REFERENCES `jenistinggal` (`idJenisTinggal`),
  ADD CONSTRAINT `mahasiswa_ibfk_4` FOREIGN KEY (`idAlatTransportasi`) REFERENCES `alattransportasi` (`idAlatTransportasi`),
  ADD CONSTRAINT `mahasiswa_ibfk_5` FOREIGN KEY (`idOrangTuaWali`) REFERENCES `orangtuawali` (`idOrangTuaWali`);

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
-- Ketidakleluasaan untuk tabel `presensimhs`
--
ALTER TABLE `presensimhs`
  ADD CONSTRAINT `presensimhs_ibfk_2` FOREIGN KEY (`idJenisPresensi`) REFERENCES `jenispresensi` (`idJenisPresensi`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
