/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_water

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-06-02 19:31:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'jidan', '$argon2i$v=19$m=65536,t=4,p=1$NUdvL2ZkY3pOWERqazZKRQ$FVSZsWGPJwVm4yqQ3JZqWMS5HGAazS2GXpR/Q0laLwA');
INSERT INTO `admins` VALUES ('2', 'wildan', '$argon2i$v=19$m=65536,t=4,p=1$RWQ1MkJBaXNkL0psSWRVNw$h3Or1UEbeDIfLrtnj2jUiBFb0ng49Zhddk85dxhyEeU');
INSERT INTO `admins` VALUES ('3', 'danwil', '$argon2i$v=19$m=65536,t=4,p=1$V0ZzOUptL25JbWxUTDZxQg$uX+jjkxMydu8dff43fDa5WicTsWEaEjqyi+xlVOc+y4');
INSERT INTO `admins` VALUES ('4', 'halo', '$argon2i$v=19$m=65536,t=4,p=1$NmQyVDlqOWsvcUwxcXhnMQ$anW3OiyMCb3f23herUh1owtKGK+4SAMMZZXRb6Q3XeI');

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
-- Table structure for `log_delete_sumber_air`
-- ----------------------------
DROP TABLE IF EXISTS `log_delete_sumber_air`;
CREATE TABLE `log_delete_sumber_air` (
  `id_log_delete_sumber_air` int(11) NOT NULL AUTO_INCREMENT,
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
  `tgl_delete` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_log_delete_sumber_air`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_delete_sumber_air
-- ----------------------------
INSERT INTO `log_delete_sumber_air` VALUES ('4', '15', 'test123', 'Baik', '25', 'Keruh', '8.0', 'Layak', '1', '2', 'default.png', '2023-06-01');
INSERT INTO `log_delete_sumber_air` VALUES ('5', '16', 'Haloa', 'Rusak Parah', '25', 'Bening', '7.0', 'Layak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_delete_sumber_air` VALUES ('6', '17', 'Halo', 'Rusak Sedang', '14', 'Keruh', '6.4', 'Tidak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_delete_sumber_air` VALUES ('7', '18', 'testb', 'Rusak Sedang', '25', 'Keruh', '7.0', 'Tidak', '4', '0', 'default.png', '2023-06-02');

-- ----------------------------
-- Table structure for `log_update_sumber_air`
-- ----------------------------
DROP TABLE IF EXISTS `log_update_sumber_air`;
CREATE TABLE `log_update_sumber_air` (
  `id_log_update_sumber_air` int(11) NOT NULL AUTO_INCREMENT,
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
  `tgl_update` date DEFAULT NULL,
  PRIMARY KEY (`id_log_update_sumber_air`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_update_sumber_air
-- ----------------------------
INSERT INTO `log_update_sumber_air` VALUES ('5', '1', 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', '3', '0', 'foto_waduk_jatiluhur.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('6', '2', 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', '5', '0', 'foto_sungai_citarum.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('7', '3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_aqua_cipondok.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('8', '4', 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', '5', '0', 'foto_sungai_ciliwung.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('9', '5', 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_lubuk_bonta.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('10', '6', 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', '3', '0', 'foto_waduk_sermo.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('11', '7', 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', '2', '0', 'foto_sumur_abadi_semarang.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('12', '8', 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', '4', '0', 'foto_danau_cermin_lamaru.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('13', '9', 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', '4', '0', 'foto_danau_batur_bali.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('14', '16', 'Haloa', 'Rusak Parah', '25', 'Bening', '7.0', 'Layak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('15', '10', 'Sungai Bengawan Solo', 'Baik', '29', 'Keruh', '7.3', 'Tidak', '5', '0', 'foto_sungai_bengawan_solo.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('16', '17', 'Halo', 'Rusak Sedang', '14', 'Keruh', '6.4', 'Tidak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('17', '1', 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', '3', '0', 'foto_waduk_jatiluhur.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('18', '2', 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', '5', '0', 'foto_sungai_citarum.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('19', '3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_aqua_cipondok.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('20', '4', 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', '5', '0', 'foto_sungai_ciliwung.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('21', '5', 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_lubuk_bonta.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('22', '6', 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', '3', '0', 'foto_waduk_sermo.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('23', '7', 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', '2', '0', 'foto_sumur_abadi_semarang.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('24', '17', 'Halo', 'Rusak Sedang', '14', 'Keruh', '6.4', 'Tidak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('25', '16', 'Haloa', 'Rusak Parah', '25', 'Bening', '7.0', 'Layak', '3', '0', 'default.png', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('26', '10', 'Sungai Bengawan Solo', 'Baik', '29', 'Keruh', '7.3', 'Tidak', '5', '0', 'foto_sungai_bengawan_solo.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('27', '9', 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', '4', '0', 'foto_danau_batur_bali.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('28', '8', 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', '4', '0', 'foto_danau_cermin_lamaru.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('34', '3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_aqua_cipondok.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('35', '3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '0', 'foto_mata_air_aqua_cipondok.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('36', '18', 'testb', 'Rusak Sedang', '25', 'Keruh', '7.0', 'Tidak', '4', '0', 'default.png', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('37', '11', 'Sungai Musi', 'Rusak Sedang', '29', 'Keruh', '8.2', 'Tidak', '5', '0', 'foto_sungai_musi.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('38', '11', 'Sungai Musi', 'Rusak Sedang', '29', 'Keruh', '8.2', 'Tidak', '5', '0', 'foto_sungai_musi.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('39', '11', 'Sungai Musi', 'Rusak Sedang', '29', 'Keruh', '8.0', 'Tidak', '5', '0', 'foto_sungai_musi.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('40', '11', 'Sungai Musi', 'Rusak Sedang', '29', 'Keruh', '8.2', 'Tidak', '5', '0', 'foto_sungai_musi.jpg', '2023-06-02');
INSERT INTO `log_update_sumber_air` VALUES ('41', '11', 'Sungai Musi', 'Rusak Sedang', '30', 'Keruh', '8.2', 'Tidak', '5', '0', 'foto_sungai_musi.jpg', '2023-06-02');

-- ----------------------------
-- Table structure for `sumber_air`
-- ----------------------------
DROP TABLE IF EXISTS `sumber_air`;
CREATE TABLE `sumber_air` (
  `id_sumber_air` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sumber_air` varchar(100) NOT NULL,
  `kondisi_sumber_air` varchar(100) DEFAULT NULL,
  `suhu` decimal(10,0) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `pH` decimal(10,1) NOT NULL,
  `layak_minum` varchar(10) NOT NULL,
  `id_jenis_sumber_air` int(11) NOT NULL,
  `id_kabupaten` int(4) NOT NULL,
  `foto_sumber_air` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sumber_air`),
  KEY `id_jenis_sumber_air` (`id_jenis_sumber_air`),
  KEY `kabupaten` (`id_kabupaten`),
  CONSTRAINT `jenis_sumber_air` FOREIGN KEY (`id_jenis_sumber_air`) REFERENCES `jenis_sumber_air` (`id_jenis_sumber_air`),
  CONSTRAINT `kabupaten` FOREIGN KEY (`id_kabupaten`) REFERENCES `wilayah_indonesia`.`regencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sumber_air
-- ----------------------------
INSERT INTO `sumber_air` VALUES ('1', 'Waduk Jati Luhur', 'Baik', '26', 'Keruh', '7.6', 'Tidak', '3', '3273', 'foto_waduk_jatiluhur.jpg');
INSERT INTO `sumber_air` VALUES ('2', 'Sungai Citarum', 'Baik', '28', 'Bening', '7.3', 'Layak', '5', '3273', 'foto_sungai_citarum.jpg');
INSERT INTO `sumber_air` VALUES ('3', 'Mata Air Aqua Cipondok', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '3213', 'foto_mata_air_aqua_cipondok.jpg');
INSERT INTO `sumber_air` VALUES ('4', 'Sungai Ciliwung', 'Rusak Sedang', '29', 'Keruh', '7.9', 'Tidak', '5', '3273', 'foto_sungai_ciliwung.jpg');
INSERT INTO `sumber_air` VALUES ('5', 'Mata Air Lubuk Bonta', 'Baik', '26', 'Bening', '7.4', 'Layak', '1', '3273', 'foto_mata_air_lubuk_bonta.jpg');
INSERT INTO `sumber_air` VALUES ('6', 'Waduk Sermo', 'Rusak Sedang', '29', 'Keruh', '7.7', 'Tidak', '3', '3273', 'foto_waduk_sermo.jpg');
INSERT INTO `sumber_air` VALUES ('7', 'Sumur Abadi', 'Baik', '26', 'Bening', '7.3', 'Layak', '2', '3273', 'foto_sumur_abadi_semarang.jpg');
INSERT INTO `sumber_air` VALUES ('8', 'Danau Cermin Lamaru', 'Baik', '25', 'Bening', '7.3', 'Layak', '4', '3273', 'foto_danau_cermin_lamaru.jpg');
INSERT INTO `sumber_air` VALUES ('9', 'Danau Batur', 'Rusak Parah', '30', 'Keruh', '6.9', 'Tidak', '4', '3273', 'foto_danau_batur_bali.jpg');
INSERT INTO `sumber_air` VALUES ('10', 'Sungai Bengawan Solo', 'Baik', '29', 'Keruh', '7.3', 'Tidak', '5', '3273', 'foto_sungai_bengawan_solo.jpg');
INSERT INTO `sumber_air` VALUES ('11', 'Sungai Musi', 'Rusak Sedang', '30', 'Keruh', '8.2', 'Tidak', '5', '1671', 'foto_sungai_musi.jpg');
INSERT INTO `sumber_air` VALUES ('12', 'Danau Toba', 'Baik', '24', 'Bening', '7.2', 'Layak', '4', '1217', 'foto_danau_toba.jpg');
INSERT INTO `sumber_air` VALUES ('13', 'Waduk Riam Kanan', 'Rusak Parah', '29', 'Keruh', '8.6', 'Tidak', '3', '6303', 'foto_waduk_riam_kanan.jpg');
INSERT INTO `sumber_air` VALUES ('14', 'Sungai Barito', 'Rusak Parah', '31', 'Keruh', '6.0', 'Tidak', '5', '6371', 'foto_sungai_barito.jpg');
INSERT INTO `sumber_air` VALUES ('15', 'Mata Air Nyandeng', 'Baik', '23', 'Bening', '7.2', 'Layak', '1', '6405', 'foto_mata_air_nyandeng.jpg');
INSERT INTO `sumber_air` VALUES ('16', 'Danau Laguna', 'Rusak Sedang', '29', 'Keruh', '8.5', 'Tidak', '4', '8271', 'foto_danau_laguna.jpg');
INSERT INTO `sumber_air` VALUES ('17', 'Danau Sentani', 'Baik', '22', 'Bening', '7.1', 'Layak', '4', '9471', 'foto_danau_sentani.jpg');
INSERT INTO `sumber_air` VALUES ('18', 'Sumur Raksasa', 'Rusak Sedang', '31', 'Keruh', '6.6', 'Tidak', '2', '3310', 'foto_sumur_raksasa_klaten.jpg');
INSERT INTO `sumber_air` VALUES ('19', 'Sungai Mamberamo', 'Rusak Sedang', '28', 'Keruh', '6.4', 'Tidak', '5', '9419', 'default.png');
INSERT INTO `sumber_air` VALUES ('20', 'Mata Air Belanda', 'Baik', '25', 'Bening', '7.4', 'Layak', '1', '8204', 'foto_mata_air_belanda_maluku.jpg');

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
  CONSTRAINT `id_sumber_air` FOREIGN KEY (`id_sumber_air`) REFERENCES `sumber_air` (`id_sumber_air`) ON DELETE CASCADE,
  CONSTRAINT `id_upaya_peningkatan` FOREIGN KEY (`id_upaya_peningkatan_ketersediaan_air`) REFERENCES `upaya_peningkatan_ketersediaan_air` (`id_upaya_ketersediaan_air`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sumber_air_upaya_peningkatan
-- ----------------------------
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('1', '1', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('2', '1', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('3', '1', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('4', '2', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('5', '2', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('6', '2', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('10', '4', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('11', '4', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('12', '4', '3');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('13', '4', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('14', '5', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('15', '5', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('16', '6', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('17', '6', '3');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('18', '6', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('19', '7', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('20', '7', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('21', '7', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('22', '7', '6');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('23', '8', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('24', '8', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('25', '8', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('26', '9', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('27', '9', '3');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('28', '9', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('45', '10', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('46', '10', '3');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('47', '10', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('66', '3', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('67', '3', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('68', '3', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('79', '11', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('80', '11', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('81', '11', '6');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('82', '12', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('83', '13', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('84', '13', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('85', '13', '6');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('86', '14', '2');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('87', '14', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('88', '14', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('89', '15', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('90', '15', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('91', '16', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('92', '16', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('93', '17', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('94', '17', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('95', '18', '1');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('96', '18', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('97', '18', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('98', '19', '4');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('99', '19', '6');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('100', '19', '7');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('101', '20', '5');
INSERT INTO `sumber_air_upaya_peningkatan` VALUES ('102', '20', '7');

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
DELIMITER ;;
CREATE TRIGGER `tr_log_update_sumber_air` BEFORE UPDATE ON `sumber_air` FOR EACH ROW BEGIN
 		INSERT INTO log_update_sumber_air (id_sumber_air, old_nama_sumber_air, old_kondisi_sumber_air, old_suhu, old_warna, old_pH, old_layak_minum, old_id_jenis_sumber_air, old_id_wilayah, old_foto_sumber_air, tgl_update) VALUES( OLD.id_sumber_air, OLD.nama_sumber_air, OLD.kondisi_sumber_air, OLD.suhu, OLD.warna, OLD.pH, OLD.layak_minum, OLD.id_jenis_sumber_air, 0, OLD.foto_sumber_air, NOW());
 END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `tr_log_delete_sumber_air` BEFORE DELETE ON `sumber_air` FOR EACH ROW BEGIN
 		INSERT INTO log_delete_sumber_air (id_sumber_air, nama_sumber_air, kondisi_sumber_air, suhu, warna, pH, layak_minum, id_jenis_sumber_air, id_wilayah, foto_sumber_air, tgl_delete) VALUES( OLD.id_sumber_air, OLD.nama_sumber_air, OLD.kondisi_sumber_air, OLD.suhu, OLD.warna, OLD.pH, OLD.layak_minum, OLD.id_jenis_sumber_air, 0, OLD.foto_sumber_air, NOW());
 END
;;
DELIMITER ;
