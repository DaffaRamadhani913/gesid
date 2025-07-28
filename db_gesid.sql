-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jul 2025 pada 01.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gesid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_desa_kelurahan`
--

CREATE TABLE `tb_desa_kelurahan` (
  `id_desa` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_desa_kelurahan`
--

INSERT INTO `tb_desa_kelurahan` (`id_desa`, `id_kecamatan`, `nama`) VALUES
(1010101, 10101, 'Alue Bagok'),
(1010102, 10101, 'Alue Batee'),
(1010103, 10101, 'Alue Sundak'),
(1010104, 10101, 'Arongan'),
(1010105, 10101, 'Cot Buloh'),
(1010106, 10101, 'Cot Juru Mudi'),
(1010107, 10101, 'Cot Kumbang'),
(1010108, 10101, 'Drien Rampak'),
(1010109, 10101, 'Gunong Pulo'),
(1010110, 10101, 'Karang Hampa'),
(1010111, 10101, 'Keub'),
(1010112, 10101, 'Kubu'),
(1010113, 10101, 'Pante Mutia'),
(1010114, 10101, 'Panton Bahagia'),
(1010115, 10101, 'Panton Makmu'),
(1010116, 10101, 'Peribu'),
(1010117, 10101, 'Peulanteu LB.'),
(1010118, 10101, 'Rimba Langgeh'),
(1010119, 10101, 'Seuneubok Lhong'),
(1010120, 10101, 'Seuneubok Teungoh'),
(1010121, 10101, 'Simpang Peut'),
(1010122, 10101, 'Suak Bidok'),
(1010123, 10101, 'Suak le Beuso'),
(1010124, 10101, 'Suak Keumudee'),
(1010125, 10101, 'Teupin Peraho'),
(1010126, 10101, 'Ujong Beusa'),
(1010127, 10101, 'Ujong Simpang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kecamatan`
--

INSERT INTO `tb_kecamatan` (`id_kecamatan`, `id_kota`, `nama`) VALUES
(10101, 101, 'Arongan Lambalek');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kota_kabupaten`
--

CREATE TABLE `tb_kota_kabupaten` (
  `id_kota` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kota_kabupaten`
--

INSERT INTO `tb_kota_kabupaten` (`id_kota`, `id_provinsi`, `nama`) VALUES
(101, 1, 'Kabupaten Aceh Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_members`
--

CREATE TABLE `tb_members` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `foto_ktp` varchar(255) DEFAULT NULL,
  `foto_wajah` varchar(255) DEFAULT NULL,
  `status` enum('Aktif','Pending','Nonaktif') NOT NULL DEFAULT 'Pending',
  `id_provinsi` int(11) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_members`
--

INSERT INTO `tb_members` (`id`, `nama`, `alamat`, `telepon`, `email`, `pekerjaan`, `foto_ktp`, `foto_wajah`, `status`, `id_provinsi`, `id_kota`, `id_kecamatan`, `id_desa`) VALUES
(13, 'adi nugroho', 'aceh barat daya jalan aceh no 2', '041412424244', 'hehe@gmail.com', 'gamer', '1753476111_e0c05d49b785de8991f2.jpg', '1753476111_90495fda0094c301b8c6.jpg', 'Aktif', 1, 101, 10101, 1010119);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_provinsi`
--

CREATE TABLE `tb_provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_provinsi`
--

INSERT INTO `tb_provinsi` (`id_provinsi`, `nama`) VALUES
(1, 'Aceh'),
(2, 'Bali'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'Daerah Istimewa Yogyakarta'),
(6, 'Daerah Khusus Ibukota Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Bangka Belitung'),
(18, 'Kepulauan Riau'),
(19, 'Lampung'),
(20, 'Maluku'),
(21, 'Maluku Utara'),
(22, 'Nusa Tenggara Barat'),
(23, 'Nusa Tenggara Timur'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Papua Barat Daya'),
(27, 'Papua Pegunungan'),
(28, 'Papua Selatan'),
(29, 'Papua Tengah'),
(30, 'Riau'),
(31, 'Sulawesi Barat'),
(32, 'Sulawesi Selatan'),
(33, 'Sulawesi Tengah'),
(34, 'Sulawesi Tenggara'),
(35, 'Sulawesi Utara'),
(36, 'Sumatera Barat'),
(37, 'Sumatera Selatan'),
(38, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('superadmin','BPN','BPW','BPD','BPDes','member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$5KFFZjDbUOax6Q3I/20ROeNHmsJWyNr43w1Mk7Yfg41mQ22Qd.l0i', 'superadmin'),
(2, 'bpn', '$2y$10$TjKuiiEowQEGOQm9zAzM8.j0oloaL8b5sljW3sfHh5jQfz31Z/6Ai', 'BPN'),
(3, 'bpw', '$2y$10$3tdoZHrLKC2LVHLfcENf3O9eBSc1hNw6.Gkr7136TC9BcNsS1dvNu', 'BPW'),
(4, 'bpd', '$2y$10$4k8RDmT9diPrXtYDABKA6en1U3gWOEAGQyrug.jbBz25A49c0v/Ke', 'BPD'),
(5, 'bpdes', '$2y$10$ifeoOHy5VjTvYQa50W4TPueAlYIFa/qxVGlQEX/2vyOqzmSPWb/AW', 'BPDes'),
(6, 'member', '$2y$10$50rVb9jDQk1JPnQoeZKu/eOSRg85FjRbUWWHrEy77qoel74K8p0Ci', 'member'),
(13, 'nizar', '$2y$10$DjPk1GlNX80nUHH4bU30jO.KLtk6KdnEu1AdLPqy0HwDGR.6R0Dwm', 'member'),
(14, 'idk', '$2y$10$Wgaf6QKCDQ2RXeDcCtXxo.kcjBsf3zg5qU1ruFitixk7IQrF6CwEu', 'member'),
(15, 'bocil', '$2y$10$lF9xZRnltEQhZ.s/FXDi2e2nPTYTTUwiXemBT3Ozl1CbZzvsMwNF2', 'member');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  ADD PRIMARY KEY (`id_desa`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indeks untuk tabel `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indeks untuk tabel `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indeks untuk tabel `tb_members`
--
ALTER TABLE `tb_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_provinsi_member` (`id_provinsi`),
  ADD KEY `fk_kota_member` (`id_kota`),
  ADD KEY `fk_kecamatan_member` (`id_kecamatan`),
  ADD KEY `fk_desa_member` (`id_desa`);

--
-- Indeks untuk tabel `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  MODIFY `id_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010128;

--
-- AUTO_INCREMENT untuk tabel `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10102;

--
-- AUTO_INCREMENT untuk tabel `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT untuk tabel `tb_members`
--
ALTER TABLE `tb_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  ADD CONSTRAINT `tb_desa_kelurahan_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id_kecamatan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD CONSTRAINT `tb_kecamatan_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `tb_kota_kabupaten` (`id_kota`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  ADD CONSTRAINT `tb_kota_kabupaten_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_members`
--
ALTER TABLE `tb_members`
  ADD CONSTRAINT `fk_desa_member` FOREIGN KEY (`id_desa`) REFERENCES `tb_desa_kelurahan` (`id_desa`),
  ADD CONSTRAINT `fk_kecamatan_member` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id_kecamatan`),
  ADD CONSTRAINT `fk_kota_member` FOREIGN KEY (`id_kota`) REFERENCES `tb_kota_kabupaten` (`id_kota`),
  ADD CONSTRAINT `fk_provinsi_member` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
