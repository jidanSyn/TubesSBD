-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 08:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_water`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_sumber_air`
--

CREATE TABLE `jenis_sumber_air` (
  `id_jenis_sumber_air` int(11) NOT NULL,
  `nama_jenis_sumber_air` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_sumber_air`
--

INSERT INTO `jenis_sumber_air` (`id_jenis_sumber_air`, `nama_jenis_sumber_air`) VALUES
(1, 'Mata air'),
(2, 'Sumur'),
(3, 'Waduk'),
(4, 'Danau'),
(5, 'Sungai');

-- --------------------------------------------------------

--
-- Table structure for table `sumber_air`
--

CREATE TABLE `sumber_air` (
  `id_sumber_air` int(11) NOT NULL,
  `nama_sumber_air` varchar(100) NOT NULL,
  `kondisi_sumber_air` varchar(100) DEFAULT NULL,
  `suhu(c)` decimal(10,0) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `pH` decimal(10,1) NOT NULL,
  `layak_minum` varchar(10) NOT NULL,
  `id_jenis_sumber_air` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sumber_air`
--

INSERT INTO `sumber_air` (`id_sumber_air`, `nama_sumber_air`, `kondisi_sumber_air`, `suhu(c)`, `warna`, `pH`, `layak_minum`, `id_jenis_sumber_air`, `id_wilayah`) VALUES
(1, 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', 3, 3),
(2, 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', 5, 2),
(3, 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', 1, 1),
(4, 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', 5, 4),
(5, 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', 1, 7),
(6, 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', 3, 5),
(7, 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', 2, 6),
(8, 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', 4, 8),
(9, 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', 4, 9),
(10, 'Sungai Bengawan Solo', 'Rusak Parak', '29', 'Keruh', '7.8', 'Tidak', 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sumber_air_upaya_peningkatan`
--

CREATE TABLE `sumber_air_upaya_peningkatan` (
  `id_sumber_air_upaya_peningkatan` int(11) NOT NULL,
  `id_sumber_air` int(11) NOT NULL,
  `id_upaya_peningkatan_ketersediaan_air` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sumber_air_upaya_peningkatan`
--

INSERT INTO `sumber_air_upaya_peningkatan` (`id_sumber_air_upaya_peningkatan`, `id_sumber_air`, `id_upaya_peningkatan_ketersediaan_air`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 7),
(4, 2, 1),
(5, 2, 2),
(6, 2, 7),
(7, 3, 2),
(8, 3, 4),
(9, 3, 5),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 4, 4),
(14, 5, 4),
(15, 5, 5),
(16, 6, 2),
(17, 6, 3),
(18, 6, 4),
(19, 7, 1),
(20, 7, 2),
(21, 7, 5),
(22, 7, 6),
(23, 8, 1),
(24, 8, 2),
(25, 8, 5),
(26, 9, 2),
(27, 9, 3),
(28, 9, 4),
(29, 10, 2),
(30, 10, 3),
(31, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `upaya_peningkatan_ketersediaan_air`
--

CREATE TABLE `upaya_peningkatan_ketersediaan_air` (
  `id_upaya_ketersediaan_air` int(11) NOT NULL,
  `nama_upaya` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upaya_peningkatan_ketersediaan_air`
--

INSERT INTO `upaya_peningkatan_ketersediaan_air` (`id_upaya_ketersediaan_air`, `nama_upaya`) VALUES
(1, ' Memberikan kesadaran terhadap masyarakat tentang arti lingkungan hidup sehingga manusia lebih mencintai lingkungan hidupnya.'),
(2, 'Pengawasan terhadap penggunaan jenis-jenis zat kimia dan pestisida karena dapat menimbulkan pencemaran air.'),
(3, 'Memperluas gerakan penghijauan.'),
(4, 'Menempatkan daerah industri atau tempat-tempat pabrik jaug dari sekitar daerah perumahan-pemukiman.'),
(5, 'Keamanan terhadap air minum harus mendapat perhatian yang khusus, baik dari pemrintah maupun kita sebagai warga masyarakat.'),
(6, 'Menggunakan air bersih dengan bijaksana atau seperlunya saja'),
(7, 'Tidak membuang sampah sembarangan');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id_wilayah` int(11) NOT NULL,
  `nama_wilayah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id_wilayah`, `nama_wilayah`) VALUES
(1, 'Subang'),
(2, 'Bandung'),
(3, 'Purwakarta'),
(4, 'Jakarta'),
(5, 'Yogyakarta'),
(6, 'Semarang'),
(7, 'Padang'),
(8, 'Balikpapan'),
(9, 'Bali'),
(10, 'Solo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_sumber_air`
--
ALTER TABLE `jenis_sumber_air`
  ADD PRIMARY KEY (`id_jenis_sumber_air`);

--
-- Indexes for table `sumber_air`
--
ALTER TABLE `sumber_air`
  ADD PRIMARY KEY (`id_sumber_air`),
  ADD KEY `id_jenis_sumber_air` (`id_jenis_sumber_air`),
  ADD KEY `wilayah` (`id_wilayah`);

--
-- Indexes for table `sumber_air_upaya_peningkatan`
--
ALTER TABLE `sumber_air_upaya_peningkatan`
  ADD PRIMARY KEY (`id_sumber_air_upaya_peningkatan`),
  ADD KEY `id_sumber_air` (`id_sumber_air`),
  ADD KEY `id_upaya_peningkatan` (`id_upaya_peningkatan_ketersediaan_air`);

--
-- Indexes for table `upaya_peningkatan_ketersediaan_air`
--
ALTER TABLE `upaya_peningkatan_ketersediaan_air`
  ADD PRIMARY KEY (`id_upaya_ketersediaan_air`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id_wilayah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_sumber_air`
--
ALTER TABLE `jenis_sumber_air`
  MODIFY `id_jenis_sumber_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sumber_air`
--
ALTER TABLE `sumber_air`
  MODIFY `id_sumber_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sumber_air_upaya_peningkatan`
--
ALTER TABLE `sumber_air_upaya_peningkatan`
  MODIFY `id_sumber_air_upaya_peningkatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `upaya_peningkatan_ketersediaan_air`
--
ALTER TABLE `upaya_peningkatan_ketersediaan_air`
  MODIFY `id_upaya_ketersediaan_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id_wilayah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sumber_air`
--
ALTER TABLE `sumber_air`
  ADD CONSTRAINT `sumber_air_ibfk_1` FOREIGN KEY (`id_jenis_sumber_air`) REFERENCES `jenis_sumber_air` (`id_jenis_sumber_air`),
  ADD CONSTRAINT `wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`);

--
-- Constraints for table `sumber_air_upaya_peningkatan`
--
ALTER TABLE `sumber_air_upaya_peningkatan`
  ADD CONSTRAINT `id_sumber_air` FOREIGN KEY (`id_sumber_air`) REFERENCES `sumber_air` (`id_sumber_air`),
  ADD CONSTRAINT `id_upaya_peningkatan` FOREIGN KEY (`id_upaya_peningkatan_ketersediaan_air`) REFERENCES `upaya_peningkatan_ketersediaan_air` (`id_upaya_ketersediaan_air`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
