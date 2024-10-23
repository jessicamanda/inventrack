-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2024 at 02:57 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_anggota` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `jk` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `pass_foto` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `jk`, `alamat`, `no_hp`, `pass_foto`) VALUES
('AG001', 'agus', 'Perempuan', 'lumajang', '2910034', '');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_jenisbarang` int NOT NULL,
  `nama_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `spesifikasi` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` int NOT NULL,
  `foto_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_jenisbarang`, `nama_barang`, `spesifikasi`, `jumlah`, `foto_barang`) VALUES
('BR004', 3, 'Laptop ASUS ', 'core i3', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenisbarang` int NOT NULL,
  `jenisbarang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenisbarang`, `jenisbarang`) VALUES
(3, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `kembalikan`
--

CREATE TABLE `kembalikan` (
  `id_kembali` int NOT NULL,
  `id_anggota` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_barang` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_kembali` int NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_kembalikan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kembalikan`
--

INSERT INTO `kembalikan` (`id_kembali`, `id_anggota`, `id_barang`, `jumlah_kembali`, `tgl_pinjam`, `tgl_kembali`, `tgl_kembalikan`) VALUES
(15, 'AG001', 'BR001', 1, '2024-09-12', '2024-09-12', '2024-09-12'),
(16, 'AG001', 'BR004', 4, '2024-10-08', '2024-10-22', '2024-10-08'),
(17, 'AG001', 'BR004', 2, '2024-10-08', '2024-10-24', '2024-10-08'),
(18, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-16', '2024-10-08'),
(19, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-25', '2024-10-08'),
(20, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-08', '2024-10-08'),
(21, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-08', '2024-10-08'),
(22, 'AG001', 'BR004', 2, '2024-10-08', '2024-10-08', '2024-10-08'),
(23, 'AG001', 'BR004', 2, '2024-10-08', '2024-10-08', '2024-10-08'),
(24, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-08', '2024-10-08'),
(25, 'AG001', 'BR004', 2, '2024-10-08', '2024-10-08', '2024-10-08'),
(26, 'AG001', 'BR004', 2, '2024-10-08', '2024-10-08', '2024-10-08'),
(27, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-08', '2024-10-08'),
(28, 'AG001', 'BR004', 1, '2024-10-08', '2024-10-08', '2024-10-08');

--
-- Triggers `kembalikan`
--
DELIMITER $$
CREATE TRIGGER `kembali` AFTER INSERT ON `kembalikan` FOR EACH ROW BEGIN

UPDATE  barang SET jumlah = jumlah + NEW.jumlah_kembali WHERE id_barang = NEW.id_barang;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator'),
(2, 'petugas', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_pinjam` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_anggota` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_barang` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_pinjam` int NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `pinjam`
--
DELIMITER $$
CREATE TRIGGER `pinjam` AFTER INSERT ON `pinjam` FOR EACH ROW BEGIN

UPDATE  barang SET jumlah = jumlah - NEW.jumlah_pinjam WHERE id_barang = NEW.id_barang;

END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenisbarang`);

--
-- Indexes for table `kembalikan`
--
ALTER TABLE `kembalikan`
  ADD PRIMARY KEY (`id_kembali`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenisbarang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kembalikan`
--
ALTER TABLE `kembalikan`
  MODIFY `id_kembali` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
