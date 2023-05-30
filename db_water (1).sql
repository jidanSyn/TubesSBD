/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_water

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-05-30 13:04:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `jenis_sumber_air`
-- ----------------------------
DROP TABLE IF EXISTS `jenis_sumber_air`;
CREATE TABLE `jenis_sumber_air` (
  `id_jenis_sumber_air` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_sumber_air` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jenis_sumber_air`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of jenis_sumber_air
-- ----------------------------
INSERT INTO `jenis_sumber_air` VALUES ('1', 'Mata air');
INSERT INTO `jenis_sumber_air` VALUES ('2', 'Sumur');
INSERT INTO `jenis_sumber_air` VALUES ('3', 'Waduk');
INSERT INTO `jenis_sumber_air` VALUES ('4', 'Danau');
INSERT INTO `jenis_sumber_air` VALUES ('5', 'Sungai');

-- ----------------------------
-- Table structure for `sumber_air`
-- ----------------------------
DROP TABLE IF EXISTS `sumber_air`;
CREATE TABLE `sumber_air` (
  `id_sumber_air` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sumber_air` varchar(100) NOT NULL,
  `kondisi_sumber_air` varchar(100) DEFAULT NULL,
  `suhu(c)` decimal(10,0) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `pH` decimal(10,1) NOT NULL,
  `layak_minum` varchar(10) NOT NULL,
  `id_jenis_sumber_air` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  PRIMARY KEY (`id_sumber_air`),
  KEY `id_jenis_sumber_air` (`id_jenis_sumber_air`),
  KEY `wilayah` (`id_wilayah`),
  CONSTRAINT `sumber_air_ibfk_1` FOREIGN KEY (`id_jenis_sumber_air`) REFERENCES `jenis_sumber_air` (`id_jenis_sumber_air`),
  CONSTRAINT `wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sumber_air
-- ----------------------------
INSERT INTO `sumber_air` VALUES ('1', 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', '3', '3');
INSERT INTO `sumber_air` VALUES ('2', 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', '5', '2');
INSERT INTO `sumber_air` VALUES ('3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '1');
INSERT INTO `sumber_air` VALUES ('4', 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', '5', '4');
INSERT INTO `sumber_air` VALUES ('5', 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '7');
INSERT INTO `sumber_air` VALUES ('6', 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', '3', '5');
INSERT INTO `sumber_air` VALUES ('7', 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', '2', '6');
INSERT INTO `sumber_air` VALUES ('8', 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', '4', '8');
INSERT INTO `sumber_air` VALUES ('9', 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', '4', '9');
INSERT INTO `sumber_air` VALUES ('10', 'Sungai Bengawan Solo', 'Rusak Parak', '29', 'Keruh', '7.8', 'Tidak', '5', '10');

-- ----------------------------
-- Table structure for `sumber_air_upaya_peningkatan`
-- ----------------------------
DROP TABLE IF EXISTS `sumber_air_upaya_peningkatan`;
CREATE TABLE `sumber_air_upaya_peningkatan` (
  `id_sumber_air_upaya_peningkatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_sumber_air` int(11) NOT NULL,
  `id_upaya_peningkatan_ketersediaan_air` int(11) NOT NULL,
  PRIMARY KEY (`id_sumber_air_upaya_peningkatan`),
  KEY `id_sumber_air` (`id_sumber_air`),
  KEY `id_upaya_peningkatan` (`id_upaya_peningkatan_ketersediaan_air`),
  CONSTRAINT `id_sumber_air` FOREIGN KEY (`id_sumber_air`) REFERENCES `sumber_air` (`id_sumber_air`),
  CONSTRAINT `id_upaya_peningkatan` FOREIGN KEY (`id_upaya_peningkatan_ketersediaan_air`) REFERENCES `upaya_peningkatan_ketersediaan_air` (`id_upaya_ketersediaan_air`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sumber_air_upaya_peningkatan
-- ----------------------------

-- ----------------------------
-- Table structure for `upaya_peningkatan_ketersediaan_air`
-- ----------------------------
DROP TABLE IF EXISTS `upaya_peningkatan_ketersediaan_air`;
CREATE TABLE `upaya_peningkatan_ketersediaan_air` (
  `id_upaya_ketersediaan_air` int(11) NOT NULL AUTO_INCREMENT,
  `nama_upaya` text NOT NULL,
  PRIMARY KEY (`id_upaya_ketersediaan_air`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of upaya_peningkatan_ketersediaan_air
-- ----------------------------
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('1', ' Memberikan kesadaran terhadap masyarakat tentang arti lingkungan hidup sehingga manusia lebih mencintai lingkungan hidupnya.');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('2', 'Pengawasan terhadap penggunaan jenis-jenis zat kimia dan pestisida karena dapat menimbulkan pencemaran air.');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('3', 'Memperluas gerakan penghijauan.');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('4', 'Menempatkan daerah industri atau tempat-tempat pabrik jaug dari sekitar daerah perumahan-pemukiman.');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('5', 'Keamanan terhadap air minum harus mendapat perhatian yang khusus, baik dari pemrintah maupun kita sebagai warga masyarakat.');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('6', 'Menggunakan air bersih dengan bijaksana atau seperlunya saja');
INSERT INTO `upaya_peningkatan_ketersediaan_air` VALUES ('7', 'Tidak membuang sampah sembarangan');

-- ----------------------------
-- Table structure for `wilayah`
-- ----------------------------
DROP TABLE IF EXISTS `wilayah`;
CREATE TABLE `wilayah` (
  `id_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(50) NOT NULL,
  PRIMARY KEY (`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of wilayah
-- ----------------------------
INSERT INTO `wilayah` VALUES ('1', 'Subang');
INSERT INTO `wilayah` VALUES ('2', 'Bandung');
INSERT INTO `wilayah` VALUES ('3', 'Purwakarta');
INSERT INTO `wilayah` VALUES ('4', 'Jakarta');
INSERT INTO `wilayah` VALUES ('5', 'Yogyakarta');
INSERT INTO `wilayah` VALUES ('6', 'Semarang');
INSERT INTO `wilayah` VALUES ('7', 'Padang');
INSERT INTO `wilayah` VALUES ('8', 'Balikpapan');
INSERT INTO `wilayah` VALUES ('9', 'Bali');
INSERT INTO `wilayah` VALUES ('10', 'Solo');
