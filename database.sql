-- phpMyAdmin SQL Dump
-- version 4.6.4deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2017 at 10:18 AM
-- Server version: 5.7.16-0ubuntu0.16.10.1
-- PHP Version: 7.0.13-0ubuntu0.16.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

CREATE TABLE `beasiswa` (
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`kd_beasiswa`, `nama`) VALUES
(1, 'Beasiswa PPA'),
(7, 'Beasiswa BBB PPA');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `kd_hasil` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_beasiswa`, `nim`, `nilai`, `tahun`) VALUES
(1, 1, '125610036', 0.95, '2017'),
(2, 1, '125610080', 0.6, '2017'),
(3, 1, '125610076', 0.566667, '2017'),
(4, 7, '125610036', 0.95, '2017'),
(5, 7, '125610080', 0.666667, '2017'),
(6, 7, '125610076', 0.5, '2017');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `kd_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_beasiswa`, `nama`, `sifat`) VALUES
(1, 1, 'IPK', 'max'),
(2, 1, 'Semester', 'max'),
(3, 1, 'Penghasilan Orangtua', 'min'),
(9, 7, 'IPK', 'max'),
(10, 7, 'Semester', 'max'),
(11, 7, 'Penghasilan Orangtua', 'min');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_mengajukan` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `jenis_kelamin`, `tahun_mengajukan`) VALUES
('125610036', 'Anisa Reviana Sakti', 'Jogja', 'Perempuan', '2017'),
('125610066', 'Muhammad Satria Bimantara', 'Klaten', 'Laki-laki', '2017'),
('125610076', 'Heni Nurhidayati', 'palembang', 'Perempuan', '2017'),
('125610080', 'Nur Afifah Safitri', 'Medan', 'Perempuan', '2017'),
('125610090', 'Sapriadi', 'Palembang', 'Laki-laki', '2017'),
('125610098', 'Tri Septa Kurnia', 'Kalimantan', 'Perempuan', '2017'),
('125610099', 'anis', 'lampung', 'Perempuan', '2017');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `kd_model` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`kd_model`, `kd_beasiswa`, `kd_kriteria`, `bobot`) VALUES
(3, 1, 1, '0.40'),
(4, 1, 2, '0.20'),
(5, 1, 3, '0.40'),
(11, 7, 9, '0.40'),
(12, 7, 10, '0.20'),
(13, 7, 11, '0.40');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kd_nilai` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `nim` char(9) NOT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_beasiswa`, `kd_kriteria`, `nim`, `nilai`) VALUES
(15, 1, 1, '125610036', 2),
(16, 1, 2, '125610036', 3),
(17, 1, 3, '125610036', 2),
(18, 1, 1, '125610080', 1),
(19, 1, 2, '125610080', 4),
(20, 1, 3, '125610080', 4),
(21, 1, 1, '125610076', 1),
(22, 1, 2, '125610076', 2),
(24, 1, 3, '125610076', 3),
(29, 7, 9, '125610036', 3),
(30, 7, 10, '125610036', 3),
(31, 7, 11, '125610036', 2),
(32, 7, 9, '125610080', 2),
(33, 7, 10, '125610080', 4),
(34, 7, 11, '125610080', 4),
(35, 7, 9, '125610076', 1),
(36, 7, 10, '125610076', 2),
(37, 7, 11, '125610076', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `kd_pengguna` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `status` enum('petugas','puket','mahasiswa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `penilaian` (
  `kd_penilaian` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`kd_penilaian`, `kd_beasiswa`, `kd_kriteria`, `keterangan`, `bobot`) VALUES
(15, 1, 1, '3.00 - 3.20', 1),
(16, 1, 1, '3.21 - 3.40', 2),
(17, 1, 1, '3.41 - 3.40', 3),
(18, 1, 1, '>= 3.61', 4),
(22, 1, 2, '2 - 3', 1),
(23, 1, 2, '4 - 5', 2),
(24, 1, 2, '6 - 7', 3),
(25, 1, 2, '8', 4),
(26, 1, 3, '<= 500000', 1),
(27, 1, 3, '600000 - 1500000', 2),
(30, 1, 3, '1600000 - 2500000', 3),
(31, 1, 3, '>= 2600000', 4),
(55, 7, 9, '2.75 - 3.00', 1),
(56, 7, 9, '3.10 - 3.35', 2),
(57, 7, 9, '3.36 - 3.60', 3),
(58, 7, 9, '>= 3.61', 4),
(59, 7, 10, '2 - 3', 1),
(60, 7, 10, '4 - 5', 2),
(61, 7, 10, '6 - 7', 3),
(62, 7, 10, '8', 4),
(63, 7, 11, '<= 500000', 1),
(64, 7, 11, '600000 - 1500000', 2),
(65, 7, 11, '1600000 - 2500000', 3),
(66, 7, 11, '>= 2600000', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`kd_beasiswa`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`kd_hasil`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`kd_kriteria`),
  ADD KEY `kd_beasiswa` (`kd_beasiswa`),
  ADD KEY `kd_beasiswa_2` (`kd_beasiswa`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`kd_model`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kd_nilai`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`kd_pengguna`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`kd_penilaian`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `kd_beasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `kd_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `kd_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kd_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `kd_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `kd_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
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
