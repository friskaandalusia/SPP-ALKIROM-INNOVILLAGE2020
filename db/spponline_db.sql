-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 04:36 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spponline_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `description` text,
  `input_date` timestamp NULL DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `nama_lengkap`, `password`, `email`, `description`, `input_date`, `last_update`) VALUES
(1, 'admin', 'Admin', 'f8822ef4a963d285977e0ee201ac4d6b', 'admin@example.com', '<p>Admin default</p>', '2018-12-30 21:32:54', '2020-11-23 11:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('019bafa9c08acdbb373520ad77b20ccac860b4f2', '::1', 1553532150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333533313938363b),
('29b369c036df91d05f0d974a4c66629cf7ee7377', '::1', 1553532455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333533323435323b);

-- --------------------------------------------------------

--
-- Table structure for table `pembangunan`
--

CREATE TABLE `pembangunan` (
  `kode_bayar` varchar(11) NOT NULL,
  `siswa_nisn` int(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `jmlh_byr` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembangunan`
--

INSERT INTO `pembangunan` (`kode_bayar`, `siswa_nisn`, `tgl_byr`, `jmlh_byr`, `bendahara`, `bukti_bayar`) VALUES
('BGN001', 2147483646, '2020-11-23', 200000, 'suharti', 'BGN0011.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `kode_keluar` varchar(11) NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `ket` text NOT NULL,
  `biaya` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`kode_keluar`, `tgl_pengeluaran`, `ket`, `biaya`, `bendahara`, `bukti_bayar`) VALUES
('KLR004', '2020-11-23', 'Alat Sound System', 650000, 'suharti', 'KLR004.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `kode_siswa` varchar(11) NOT NULL,
  `siswa_nisn` varchar(11) NOT NULL,
  `siswa_nama` varchar(255) DEFAULT NULL,
  `siswa_tmpt_lhr` varchar(45) DEFAULT NULL,
  `siswa_tgl_lhr` date DEFAULT NULL,
  `siswa_jk` varchar(11) NOT NULL,
  `siswa_tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`kode_siswa`, `siswa_nisn`, `siswa_nama`, `siswa_tmpt_lhr`, `siswa_tgl_lhr`, `siswa_jk`, `siswa_tgl_masuk`) VALUES
('SSW001', '2147483646', 'Doyok', 'Dumai', '1999-10-20', 'Laki-laki', '2019-01-01'),
('SSW002', '2147483647', 'Muhamad Rezki', 'Dumai', '2000-11-21', 'Laki-laki', '2019-01-01'),
('SSW003', '6701194035', 'Friska A', 'Lampung', '2001-06-28', 'Perempuan', '2010-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `kode_bayar` varchar(11) NOT NULL,
  `kode_siswa` varchar(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `biaya_spp` double NOT NULL,
  `total_biaya` double NOT NULL,
  `bendahara` varchar(25) NOT NULL,
  `bukti_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`kode_bayar`, `kode_siswa`, `tgl_byr`, `biaya_spp`, `total_biaya`, `bendahara`, `bukti_bayar`) VALUES
('SPP001', 'SSW001', '2019-03-22', 100000, 100000, 'Upik', 'SPP0011.jpg'),
('SPP004', 'SSW002', '2019-04-11', 100000, 100000, 'Upik', 'SPP004.jpg'),
('SPP005', 'SSW003', '2020-11-17', 1200000, 2400000, 'suharti', 'SPP0051.jpg'),
('SPP006', 'SSW001', '2019-02-20', 1200000, 1200000, 'suharti', 'SPP006.jpg'),
('SPP007', 'SSW002', '2019-02-05', 120000, 100000, 'Upik', 'SPP007.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `spp_detail`
--

CREATE TABLE `spp_detail` (
  `kode_bayar` varchar(11) NOT NULL,
  `kode_siswa` varchar(11) NOT NULL,
  `bulan` varchar(12) NOT NULL,
  `tahun` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp_detail`
--

INSERT INTO `spp_detail` (`kode_bayar`, `kode_siswa`, `bulan`, `tahun`) VALUES
('SPP005', 'SSW003', 'Desember', '2010'),
('SPP001', 'SSW001', 'Januari', '2019'),
('SPP004', 'SSW002', 'Januari', '2019'),
('SPP006', 'SSW001', 'Februari', '2019'),
('SPP007', 'SSW002', 'Februari', '2019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pembangunan`
--
ALTER TABLE `pembangunan`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`kode_keluar`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kode_siswa`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`kode_bayar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
