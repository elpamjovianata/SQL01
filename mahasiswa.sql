-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2025 pada 10.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmahasiswa`
--

CREATE TABLE `tmahasiswa` (
  `nirm` varchar(9) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tmahasiswa`
--

INSERT INTO `tmahasiswa` (`nirm`, `nama_mahasiswa`, `tgl_lahir`) VALUES
('213111234', 'Natasya', '1990-01-01'),
('213111235', 'Erens', '1992-04-09'),
('213111236', 'Kristian', '1994-07-18'),
('213111237', 'Hana', '1996-10-27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmatakuliah`
--

CREATE TABLE `tmatakuliah` (
  `kode_mk` varchar(5) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `pengajar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tmatakuliah`
--

INSERT INTO `tmatakuliah` (`kode_mk`, `nama_matakuliah`, `pengajar`) VALUES
('MK-01', 'Matematika', 'Kent'),
('MK-02', 'Statistika', 'Chloe'),
('MK-05', 'Aljabar', 'Kenny'),
('MK-07', 'Pancasila', 'Linda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tnilai`
--

CREATE TABLE `tnilai` (
  `nirm` varchar(9) NOT NULL,
  `kode_mk` varchar(5) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tnilai`
--

INSERT INTO `tnilai` (`nirm`, `kode_mk`, `grade`) VALUES
('213111234', 'MK-01', 70),
('213111235', 'MK-01', 40),
('213111236', 'MK-02', 80),
('213111234', 'MK-05', 78);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tmahasiswa`
--
ALTER TABLE `tmahasiswa`
  ADD PRIMARY KEY (`nirm`);

--
-- Indeks untuk tabel `tmatakuliah`
--
ALTER TABLE `tmatakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indeks untuk tabel `tnilai`
--
ALTER TABLE `tnilai`
  ADD KEY `nirm` (`nirm`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tnilai`
--
ALTER TABLE `tnilai`
  ADD CONSTRAINT `tnilai_ibfk_1` FOREIGN KEY (`nirm`) REFERENCES `tmahasiswa` (`nirm`),
  ADD CONSTRAINT `tnilai_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `tmatakuliah` (`kode_mk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
