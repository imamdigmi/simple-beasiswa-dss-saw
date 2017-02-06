-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2017 at 06:38 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `beasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

DROP TABLE IF EXISTS `beasiswa`;
CREATE TABLE IF NOT EXISTS `beasiswa` (
  `kd_beasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`kd_beasiswa`, `nama`) VALUES
(1, 'Beasiswa PPA'),
(2, 'Beasiswa BBP PPA'),
(3, 'Beasiswa BIDIKMISI'),
(4, 'Beasiswa DIKPORA'),
(5, 'Beasiswa BNI');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

DROP TABLE IF EXISTS `hasil`;
CREATE TABLE IF NOT EXISTS `hasil` (
  `kd_hasil` int(11) NOT NULL AUTO_INCREMENT,
  `kd_beasiswa` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL,
  PRIMARY KEY (`kd_hasil`),
  KEY `fk_mahasiswa` (`nim`),
  KEY `fk_beasiswa` (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_beasiswa`, `nim`, `nilai`, `tahun`) VALUES
(1, 1, '125610036', 0.95, '2017'),
(2, 1, '125610080', 0.6, '2017'),
(3, 1, '125610076', 0.566667, '2017'),
(4, 2, '125610036', 0.95, '2017'),
(5, 2, '125610080', 0.666667, '2017'),
(6, 2, '125610076', 0.5, '2017'),
(7, 3, '125610036', 0.866667, '2017'),
(8, 3, '125610076', 0.733333, '2017'),
(9, 3, '125610080', 0.533333, '2017'),
(10, 4, '125610036', 0.975, '2017'),
(11, 4, '125610080', 0.583333, '2017'),
(12, 4, '125610076', 0.516667, '2017'),
(13, 5, '125610036', 0.925, '2017'),
(14, 5, '125610080', 0.65, '2017'),
(15, 5, '125610076', 0.55, '2017'),
(16, 1, '125610098', 0.866667, '2017'),
(17, 2, '125610098', 0.733333, '2017'),
(18, 3, '125610098', 0.6, '2017'),
(19, 4, '125610098', 0.633333, '2017'),
(20, 5, '125610098', 0.9, '2017');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE IF NOT EXISTS `kriteria` (
  `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL,
  PRIMARY KEY (`kd_kriteria`),
  KEY `kd_beasiswa` (`kd_beasiswa`),
  KEY `kd_beasiswa_2` (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_beasiswa`, `nama`, `sifat`) VALUES
(1, 1, 'IPK', 'max'),
(2, 1, 'Semester', 'max'),
(3, 1, 'Penghasilan Orangtua', 'min'),
(4, 2, 'IPK', 'max'),
(5, 2, 'Semester', 'max'),
(6, 2, 'Penghasilan Orangtua', 'min'),
(7, 3, 'Semester', 'min'),
(8, 3, 'Penghasilan Orang Tua', 'min'),
(9, 3, 'Tanggungan Orang Tua', 'max'),
(10, 4, 'IPK', 'max'),
(11, 4, 'Semester', 'max'),
(12, 4, 'Penghasilan Orang Tua', 'min'),
(13, 4, 'KTP jogja', 'max'),
(14, 5, 'IPK', 'max'),
(15, 5, 'Semester', 'max'),
(16, 5, 'Penghasilan Orang Tua', 'min');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_mengajukan` char(4) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `jenis_kelamin`, `tahun_mengajukan`) VALUES
('125610036', 'Anisa Reviana Sakti', 'Jogja', 'Perempuan', '2017'),
('125610076', 'Heni Nurhidayati', 'palembang', 'Perempuan', '2017'),
('125610080', 'Nur Afifah Safitri', 'Medan', 'Perempuan', '2017'),
('125610098', 'Tri Septa Kurnia', 'Kalimantan', 'Perempuan', '2017');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `kd_model` int(11) NOT NULL AUTO_INCREMENT,
  `kd_beasiswa` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kd_model`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_beasiswa` (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`kd_model`, `kd_beasiswa`, `kd_kriteria`, `bobot`) VALUES
(1, 1, 1, '0.50'),
(2, 1, 2, '0.20'),
(3, 1, 3, '0.30'),
(4, 2, 4, '0.40'),
(5, 2, 5, '0.20'),
(6, 2, 6, '0.40'),
(7, 3, 7, '0.40'),
(8, 3, 8, '0.40'),
(9, 3, 9, '0.20'),
(10, 4, 10, '0.20'),
(11, 4, 11, '0.10'),
(12, 4, 12, '0.30'),
(13, 4, 13, '0.40'),
(14, 5, 14, '0.40'),
(15, 5, 15, '0.30'),
(16, 5, 16, '0.30');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE IF NOT EXISTS `nilai` (
  `kd_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  PRIMARY KEY (`kd_nilai`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_mahasiswa` (`nim`),
  KEY `fk_beasiswa` (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_beasiswa`, `kd_kriteria`, `nim`, `nilai`) VALUES
(1, 1, 1, '125610036', 2),
(2, 1, 2, '125610036', 3),
(3, 1, 3, '125610036', 2),
(4, 1, 1, '125610080', 1),
(5, 1, 2, '125610080', 4),
(6, 1, 3, '125610080', 4),
(7, 1, 1, '125610076', 1),
(8, 1, 2, '125610076', 2),
(9, 2, 4, '125610036', 3),
(10, 1, 3, '125610076', 3),
(11, 2, 5, '125610036', 3),
(12, 2, 6, '125610036', 2),
(13, 2, 4, '125610080', 2),
(14, 2, 5, '125610080', 4),
(15, 2, 6, '125610080', 4),
(16, 2, 4, '125610076', 1),
(17, 2, 5, '125610076', 2),
(18, 2, 6, '125610076', 3),
(19, 3, 7, '125610036', 3),
(20, 3, 8, '125610036', 2),
(21, 3, 9, '125610036', 3),
(22, 3, 7, '125610080', 4),
(23, 3, 8, '125610080', 4),
(24, 3, 9, '125610080', 2),
(25, 3, 7, '125610076', 2),
(26, 3, 8, '125610076', 3),
(27, 3, 9, '125610076', 1),
(28, 4, 10, '125610036', 3),
(29, 4, 11, '125610036', 3),
(30, 4, 12, '125610036', 2),
(31, 4, 13, '125610036', 2),
(32, 4, 10, '125610080', 2),
(33, 4, 11, '125610080', 4),
(34, 4, 12, '125610080', 4),
(35, 4, 13, '125610080', 1),
(36, 4, 10, '125610076', 1),
(37, 4, 11, '125610076', 2),
(38, 4, 12, '125610076', 3),
(39, 4, 13, '125610076', 1),
(40, 5, 14, '125610036', 2),
(41, 5, 15, '125610036', 3),
(42, 5, 16, '125610036', 2),
(43, 5, 14, '125610080', 1),
(44, 5, 15, '125610080', 4),
(45, 5, 16, '125610080', 4),
(46, 5, 14, '125610076', 1),
(47, 5, 15, '125610076', 2),
(48, 5, 16, '125610076', 3),
(49, 1, 1, '125610098', 2),
(50, 1, 2, '125610098', 4),
(51, 1, 3, '125610098', 3),
(52, 2, 4, '125610098', 2),
(53, 2, 5, '125610098', 4),
(54, 2, 6, '125610098', 3),
(55, 3, 7, '125610098', 4),
(56, 3, 8, '125610098', 3),
(57, 3, 9, '125610098', 2),
(58, 4, 10, '125610098', 2),
(59, 4, 11, '125610098', 4),
(60, 4, 12, '125610098', 3),
(61, 4, 13, '125610098', 1),
(62, 5, 14, '125610098', 2),
(63, 5, 15, '125610098', 4),
(64, 5, 16, '125610098', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE IF NOT EXISTS `pengguna` (
  `kd_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `status` enum('petugas','puket','mahasiswa') DEFAULT NULL,
  PRIMARY KEY (`kd_pengguna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`kd_pengguna`, `username`, `password`, `status`) VALUES
(1, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(2, 'puket', 'b679a71646e932b7c4647a081ee2a148', 'puket');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE IF NOT EXISTS `penilaian` (
  `kd_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kd_penilaian`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_beasiswa` (`kd_beasiswa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`kd_penilaian`, `kd_beasiswa`, `kd_kriteria`, `keterangan`, `bobot`) VALUES
(1, 1, 1, '3.00 - 3.20', 1),
(2, 1, 1, '3.21 - 3.40', 2),
(3, 1, 1, '3.41 - 3.40', 3),
(4, 1, 1, '>= 3.61', 4),
(5, 1, 2, '2 - 3', 1),
(6, 1, 2, '4 - 5', 2),
(7, 1, 2, '6 - 7', 3),
(8, 1, 2, '8', 4),
(9, 1, 3, '<= 500000', 1),
(10, 1, 3, '600000 - 1500000', 2),
(11, 1, 3, '1600000 - 2500000', 3),
(12, 1, 3, '>= 2600000', 4),
(13, 2, 4, '2.75 - 3.00', 1),
(14, 2, 4, '3.10 - 3.35', 2),
(15, 2, 4, '3.36 - 3.60', 3),
(16, 2, 4, '>= 3.61', 4),
(17, 2, 5, '2 - 3', 1),
(18, 2, 5, '4 - 5', 2),
(19, 2, 5, '6 - 7', 3),
(20, 2, 5, '8', 4),
(21, 2, 6, '<= 500000', 1),
(22, 2, 6, '600000 - 1500000', 2),
(23, 2, 6, '1600000 - 2500000', 3),
(24, 2, 6, '>= 2600000', 4),
(25, 3, 7, '2 - 3', 1),
(26, 3, 7, '4 - 5', 2),
(27, 3, 7, '6 - 7', 3),
(28, 3, 7, '8', 4),
(29, 3, 8, '<= 500000', 1),
(30, 3, 8, '600000 - 1500000', 2),
(31, 3, 8, '1600000 - 2500000', 3),
(32, 3, 8, '>= 2600000', 4),
(33, 3, 9, '1 - 2', 1),
(34, 3, 9, '3 - 4', 2),
(35, 3, 9, '5 - 6', 3),
(36, 3, 9, '>= 7', 4),
(37, 4, 10, '2.75 - 3.00', 1),
(38, 4, 10, '3.10 - 3.35', 2),
(39, 4, 10, '3.36 - 3.60', 3),
(40, 4, 10, '>= 3.61', 4),
(41, 4, 11, '2 - 3', 1),
(42, 4, 11, '4 - 5', 2),
(43, 4, 11, '6 - 7', 3),
(44, 4, 11, '8', 4),
(45, 4, 12, '<= 500000', 1),
(46, 4, 12, '600000 - 1500000', 2),
(47, 4, 12, '1600000 - 2500000', 3),
(48, 4, 12, '>= 2600000', 4),
(49, 4, 13, 'Ya', 2),
(50, 4, 13, 'Tidak', 1),
(51, 5, 14, '3.00 - 3.20', 1),
(52, 5, 14, '3.21 - 3.40', 2),
(53, 5, 14, '3.41 - 3.40', 3),
(54, 5, 14, '>= 3.61', 4),
(55, 5, 15, '2 - 3', 1),
(56, 5, 15, '4 - 5', 2),
(57, 5, 15, '6 - 7', 3),
(58, 5, 15, '8', 4),
(59, 5, 16, '<= 500000', 1),
(60, 5, 16, '600000 - 1500000', 2),
(61, 5, 16, '1600000 - 2500000', 3),
(62, 5, 16, '>= 2600000', 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_beasiswa` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
