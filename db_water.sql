-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 04:10 PM
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
-- Table structure for table `log_delete_sumber_air`
--

CREATE TABLE `log_delete_sumber_air` (
  `id_log_delete_sumber_air` int(11) NOT NULL,
  `id_sumber_air` int(11) NOT NULL,
  `nama_sumber_air` varchar(100) NOT NULL,
  `kondisi_sumber_air` varchar(100) NOT NULL,
  `suhu` decimal(11,0) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `pH` decimal(11,1) NOT NULL,
  `layak_minum` varchar(100) NOT NULL,
  `id_jenis_sumber_air` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `foto_sumber_air` varchar(100) NOT NULL,
  `tgl_delete` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_delete_sumber_air`
--

INSERT INTO `log_delete_sumber_air` (`id_log_delete_sumber_air`, `id_sumber_air`, `nama_sumber_air`, `kondisi_sumber_air`, `suhu`, `warna`, `pH`, `layak_minum`, `id_jenis_sumber_air`, `id_wilayah`, `foto_sumber_air`, `tgl_delete`) VALUES
(1, 11, 'Sungai Selamanya', 'Baik', '40', 'Bening', '6.0', 'Tidak', 5, 2, 'sungai_selamanya.jpg', '2023-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `log_update_sumber_air`
--

CREATE TABLE `log_update_sumber_air` (
  `id_log_update_sumber_air` int(11) NOT NULL,
  `id_sumber_air` int(11) DEFAULT NULL,
  `old_nama_sumber_air` varchar(100) DEFAULT NULL,
  `old_kondisi_sumber_air` varchar(100) DEFAULT NULL,
  `old_suhu` decimal(11,0) DEFAULT NULL,
  `old_warna` varchar(100) DEFAULT NULL,
  `old_pH` decimal(11,1) DEFAULT NULL,
  `old_layak_minum` varchar(100) DEFAULT NULL,
  `old_id_jenis_sumber_air` int(11) DEFAULT NULL,
  `old_id_wilayah` int(11) DEFAULT NULL,
  `old_foto_sumber_air` varchar(100) DEFAULT NULL,
  `tgl_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_update_sumber_air`
--

INSERT INTO `log_update_sumber_air` (`id_log_update_sumber_air`, `id_sumber_air`, `old_nama_sumber_air`, `old_kondisi_sumber_air`, `old_suhu`, `old_warna`, `old_pH`, `old_layak_minum`, `old_id_jenis_sumber_air`, `old_id_wilayah`, `old_foto_sumber_air`, `tgl_update`) VALUES
(1, 1, 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '8.0', 'Tidak', 3, 3, 'foto_waduk_jatiluhur.jpg', '2023-05-31'),
(2, 1, 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.5', 'Tidak', 3, 3, 'foto_waduk_jatiluhur.jpg', '2023-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `sumber_air`
--

CREATE TABLE `sumber_air` (
  `id_sumber_air` int(11) NOT NULL,
  `nama_sumber_air` varchar(100) NOT NULL,
  `kondisi_sumber_air` varchar(100) DEFAULT NULL,
  `suhu` decimal(10,0) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `pH` decimal(10,1) NOT NULL,
  `layak_minum` varchar(10) NOT NULL,
  `id_jenis_sumber_air` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `foto_sumber_air` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sumber_air`
--

INSERT INTO `sumber_air` (`id_sumber_air`, `nama_sumber_air`, `kondisi_sumber_air`, `suhu`, `warna`, `pH`, `layak_minum`, `id_jenis_sumber_air`, `id_wilayah`, `foto_sumber_air`) VALUES
(1, 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', 3, 3, 'foto_waduk_jatiluhur.jpg'),
(2, 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', 5, 2, 'foto_sungai_citarum.jpg'),
(3, 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', 1, 1, 'foto_mata_air_aqua_cipondok.jpg'),
(4, 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', 5, 4, 'foto_sungai_ciliwung.jpg'),
(5, 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', 1, 7, 'foto_mata_air_lubuk_bonta.jpg'),
(6, 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', 3, 5, 'foto_waduk_sermo.jpg'),
(7, 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', 2, 6, 'foto_sumur_abadi_semarang.jpg'),
(8, 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', 4, 8, 'foto_danau_cermin_lamaru.jpg'),
(9, 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', 4, 9, 'foto_danau_batur_bali.jpg'),
(10, 'Sungai Bengawan Solo', 'Rusak Parak', '29', 'Keruh', '7.8', 'Tidak', 5, 10, 'foto_sungai_bengawan_solo.jpg');

--
-- Triggers `sumber_air`
--
DELIMITER $$
CREATE TRIGGER `tr_log_delete_sumber_air` BEFORE DELETE ON `sumber_air` FOR EACH ROW BEGIN
 		INSERT INTO log_delete_sumber_air VALUES('', OLD.id_sumber_air, OLD.nama_sumber_air, OLD.kondisi_sumber_air, OLD.suhu, OLD.warna, OLD.pH, OLD.layak_minum, OLD.id_jenis_sumber_air, OLD.id_wilayah, OLD.foto_sumber_air, NOW());
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_log_update_sumber_air` BEFORE UPDATE ON `sumber_air` FOR EACH ROW BEGIN
INSERT INTO log_update_sumber_air VALUES('', OLD.id_sumber_air, OLD.nama_sumber_air, OLD.kondisi_sumber_air, OLD.suhu, OLD.warna, OLD.pH, OLD.layak_minum, OLD.id_jenis_sumber_air, OLD.id_wilayah, OLD.foto_sumber_air, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sumber_air_upaya_peningkatan`
--

CREATE TABLE `sumber_air_upaya_peningkatan` (
  `id_sumber_air_upaya_peningkatan` int(11) NOT NULL,
  `id_sumber_air` int(11) NOT NULL,
  `id_upaya_peningkatan_ketersediaan_air` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `log_delete_sumber_air`
--
ALTER TABLE `log_delete_sumber_air`
  ADD PRIMARY KEY (`id_log_delete_sumber_air`);

--
-- Indexes for table `log_update_sumber_air`
--
ALTER TABLE `log_update_sumber_air`
  ADD PRIMARY KEY (`id_log_update_sumber_air`);

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
-- AUTO_INCREMENT for table `log_delete_sumber_air`
--
ALTER TABLE `log_delete_sumber_air`
  MODIFY `id_log_delete_sumber_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_update_sumber_air`
--
ALTER TABLE `log_update_sumber_air`
  MODIFY `id_log_update_sumber_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sumber_air`
--
ALTER TABLE `sumber_air`
  MODIFY `id_sumber_air` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sumber_air_upaya_peningkatan`
--
ALTER TABLE `sumber_air_upaya_peningkatan`
  MODIFY `id_sumber_air_upaya_peningkatan` int(11) NOT NULL AUTO_INCREMENT;

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
