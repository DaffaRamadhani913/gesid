-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2025 at 10:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `tb_acara`
--

CREATE TABLE `tb_acara` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_label` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_acara`
--

INSERT INTO `tb_acara` (`id`, `judul`, `deskripsi`, `gambar`, `created_by`, `created_label`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Tes BPN', 'Tes BPN', '1756110339_9af810169d9643814d62.jpg', 1, 'BPN', 'approved', '2025-08-25 08:25:39', '2025-08-25 08:26:12'),
(9, 'Tes BPW', 'Tes BPW', '1756110355_f7c0a7f9148a5e5a29a1.jpg', 1, 'Aceh', 'approved', '2025-08-25 08:25:55', '2025-08-25 08:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_aduan`
--

CREATE TABLE `tb_aduan` (
  `id_aduan` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `status` enum('Menunggu','Diproses','Selesai','Ditolak') DEFAULT 'Menunggu',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_aduan`
--

INSERT INTO `tb_aduan` (`id_aduan`, `user_id`, `judul`, `isi`, `lampiran`, `status`, `created_at`, `updated_at`) VALUES
(1, 18, 'Cek Judul', 'Saya mencoba untuk mengisi aduan ini', '1754825428_b691a00852f631c70bc9.png', 'Selesai', '2025-08-10 11:30:28', '2025-08-11 02:22:00'),
(2, 18, 'Aduan Fernandes', 'Neng suka tidur', '1754899936_86c7d413e7731ea5c090.jpg', 'Selesai', '2025-08-11 08:12:16', '2025-08-11 08:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `tb_artikel`
--

CREATE TABLE `tb_artikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `kategori` enum('Lingkungan & Keberlanjutan','Pertanian & Ekonomi') NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal_publikasi` datetime DEFAULT current_timestamp(),
  `status` enum('draft','pending','approved','rejected') DEFAULT 'pending',
  `created_by` int(11) NOT NULL,
  `created_label` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_artikel`
--

INSERT INTO `tb_artikel` (`id`, `judul`, `konten`, `kategori`, `gambar`, `tanggal_publikasi`, `status`, `created_by`, `created_label`, `created_at`, `updated_at`) VALUES
(11, 'Tes BPN', '<p>Tes BPN</p>', 'Lingkungan & Keberlanjutan', 'uploads/artikel/1756109881_196b4b39559c56d558e0.jpg', '2025-08-25 08:18:01', 'approved', 1, 'BPN', '2025-08-25 01:18:01', '2025-08-25 01:18:13'),
(12, 'Tes BPW', '<p>Tes BPW</p>', 'Lingkungan & Keberlanjutan', 'uploads/artikel/1756110282_7d6380e0d8bbc11f0047.jpeg', '2025-08-25 08:24:42', 'approved', 1, 'Aceh', '2025-08-25 01:24:43', '2025-08-25 01:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bpd`
--

CREATE TABLE `tb_bpd` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'BPD',
  `id_kota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bpd`
--

INSERT INTO `tb_bpd` (`id`, `nama`, `username`, `password`, `role`, `id_kota`) VALUES
(1, 'DaffaBPD', 'bpd', '$2y$10$4k8RDmT9diPrXtYDABKA6en1U3gWOEAGQyrug.jbBz25A49c0v/Ke', 'BPD', 101),
(3, 'acehtimur', 'acehtimur', '$2y$10$m2UX86xCe9tdFDa8Z2H3Kuc2AcbjrPznC6VXmFEyHUUOFcrwe8b8K', 'BPD', 110);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bpdes`
--

CREATE TABLE `tb_bpdes` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'BPDes',
  `id_desa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bpdes`
--

INSERT INTO `tb_bpdes` (`id`, `nama`, `username`, `password`, `role`, `id_desa`) VALUES
(1, 'DaffaBPDes', 'bpdes', '$2y$10$ifeoOHy5VjTvYQa50W4TPueAlYIFa/qxVGlQEX/2vyOqzmSPWb/AW', 'BPDes', 1010101);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bpn`
--

CREATE TABLE `tb_bpn` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'BPN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bpn`
--

INSERT INTO `tb_bpn` (`id`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Daffa', 'bpn', '$2y$10$UBZaSth1jhdnJPju9UVIf.h4VWwNMNbI/nydXme5zPr.Cdw9hytr6', 'BPN');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bpw`
--

CREATE TABLE `tb_bpw` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'BPW',
  `id_provinsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bpw`
--

INSERT INTO `tb_bpw` (`id`, `nama`, `username`, `password`, `role`, `id_provinsi`) VALUES
(1, 'DaffaBPW', 'bpw', '$2y$10$3tdoZHrLKC2LVHLfcENf3O9eBSc1hNw6.Gkr7136TC9BcNsS1dvNu', 'BPW', 1),
(4, 'newbpw', 'newbpw', '$2y$10$XV9BGP4AFRfM1JgZqgUfOOtsUuxPtjYiQas3NQJQRiRCKu.irw89m', 'BPW', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_desa_kelurahan`
--

CREATE TABLE `tb_desa_kelurahan` (
  `id_desa` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama_desa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_desa_kelurahan`
--

INSERT INTO `tb_desa_kelurahan` (`id_desa`, `id_kecamatan`, `nama_desa`) VALUES
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
-- Table structure for table `tb_events`
--

CREATE TABLE `tb_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kecamatan`
--

INSERT INTO `tb_kecamatan` (`id_kecamatan`, `id_kota`, `nama_kecamatan`) VALUES
(10101, 101, 'Arongan Lambalek'),
(10102, 101, 'Bubon'),
(10103, 101, 'Johan Pahlawan'),
(10104, 101, 'Kaway XVI'),
(10105, 101, 'Meureubo'),
(10106, 101, 'Pantai Ceureumen'),
(10107, 101, 'Panton Reu'),
(10108, 101, 'Samatiga'),
(10109, 101, 'Sungai Mas'),
(10110, 101, 'Woyla'),
(10111, 101, 'Woyla Barat'),
(10112, 101, 'Woyla Timur'),
(10113, 102, 'Babah Rot'),
(10114, 102, 'Blangpidie'),
(10115, 102, 'Jeumpa'),
(10116, 102, 'Kuala Batee'),
(10117, 102, 'Lembah Sabil'),
(10118, 102, 'Manggeng'),
(10119, 102, 'Setia'),
(10120, 102, 'Susoh'),
(10121, 102, 'Tangan-Tangan'),
(10122, 103, 'Baitussalam'),
(10123, 103, 'Blang Bintang'),
(10124, 103, 'Darul Imarah'),
(10125, 103, 'Darul Kamal'),
(10126, 103, 'Darussalam'),
(10127, 103, 'Indrapuri'),
(10128, 103, 'Ingin Jaya'),
(10129, 103, 'Kuta Cot Glie'),
(10130, 103, 'Kota Jantho'),
(10131, 103, 'Kuta Malaka'),
(10132, 103, 'Krueng Barona Jaya'),
(10133, 103, 'Kuta Baro'),
(10134, 103, 'Lembah Seulawah'),
(10135, 103, 'Leupung'),
(10136, 103, 'Lhoknga'),
(10137, 103, 'Lhoong'),
(10138, 103, 'Montasik'),
(10139, 103, 'Mesjid Raya'),
(10140, 103, 'Peukan Bada'),
(10141, 103, 'Pulo Aceh'),
(10142, 103, 'Seulimeum'),
(10143, 103, 'Simpang Tiga'),
(10144, 103, 'Suka Makmur'),
(10145, 104, 'Darul Hikmah'),
(10146, 104, 'Indra Jaya'),
(10147, 104, 'Jaya'),
(10148, 104, 'Panga'),
(10149, 104, 'Krueng Sabee'),
(10150, 104, 'Pasie Raya'),
(10151, 104, 'Sampoiniet'),
(10152, 104, 'Setia Bakti'),
(10153, 104, 'Keude Teunom'),
(10154, 105, 'Bakongan'),
(10155, 105, 'Bakongan Timur'),
(10156, 105, 'Kluet Selatan'),
(10157, 105, 'Kluet Tengah'),
(10158, 105, 'Kluet Timur'),
(10159, 105, 'Kluet Utara'),
(10160, 105, 'Kota Bahagia'),
(10161, 105, 'Labuhan Haji'),
(10162, 105, 'Labuhan Haji Barat'),
(10163, 105, 'Labuhan Haji Timur'),
(10164, 105, 'Meukek'),
(10165, 105, 'Pasie Raja'),
(10166, 105, 'Sama Dua'),
(10167, 105, 'Sawang'),
(10168, 105, 'Tapak Tuan'),
(10169, 105, 'Trumon'),
(10170, 105, 'Trumon Tengah'),
(10171, 105, 'Trumon Timur'),
(10172, 106, 'Danau Paris'),
(10173, 106, 'Gunung Meriah'),
(10174, 106, 'Kota Baharu'),
(10175, 106, 'Kuala Baru'),
(10176, 106, 'Pulau Banyak'),
(10177, 106, 'Pulau Banyak Barat'),
(10178, 106, 'Simpang Kanan'),
(10179, 106, 'Singkil'),
(10180, 106, 'Singkil Utara'),
(10181, 106, 'Singkohor'),
(10182, 106, 'Suro Makmur'),
(10183, 107, 'Banda Mulia'),
(10184, 107, 'Bandar Pusaka'),
(10185, 107, 'Bendahara'),
(10186, 107, 'Karang Baru'),
(10187, 107, 'Kejuruan Muda'),
(10188, 107, 'Kota Kualasimpang'),
(10189, 107, 'Manyak Payed'),
(10190, 107, 'Rantau'),
(10191, 107, 'Sekerak'),
(10192, 107, 'Seruway'),
(10193, 107, 'Tamiang Hulu'),
(10194, 107, 'Tenggulun'),
(10195, 108, 'Atu Lintang'),
(10196, 108, 'Bebesen'),
(10197, 108, 'Bies'),
(10198, 108, 'Bintang'),
(10199, 108, 'Celala'),
(10200, 108, 'Jagong Jeget'),
(10201, 108, 'Kebayakan'),
(10202, 108, 'Ketol'),
(10203, 108, 'Kute Panang'),
(10204, 108, 'Lut Tawar'),
(10205, 108, 'Linge'),
(10206, 108, 'Pegasing'),
(10207, 108, 'Rusip Antara'),
(10208, 108, 'Silih Nara'),
(10209, 109, 'Babul Makmur'),
(10210, 109, 'Babul Rahmah'),
(10211, 109, 'Babussalam'),
(10212, 109, 'Badar'),
(10213, 109, 'Bambel'),
(10214, 109, 'Bukit Tusam'),
(10215, 109, 'Darul Hasanah'),
(10216, 109, 'Deleng Pokhkisen'),
(10217, 109, 'Ketambe'),
(10218, 109, 'Lawe Alas'),
(10219, 109, 'Lawe Bulan'),
(10220, 109, 'Lawe Sigala-Gala'),
(10221, 109, 'Lawe Sumur'),
(10222, 109, 'Leuser'),
(10223, 109, 'Semadam'),
(10224, 109, 'Tanoh Alas'),
(10225, 110, 'Banda Alam'),
(10226, 110, 'Birem Bayeun'),
(10227, 110, 'Darul Aman'),
(10228, 110, 'Darul Falah'),
(10229, 110, 'Darul Ihsan'),
(10230, 110, 'Idi Rayeuk'),
(10231, 110, 'Idi Timur'),
(10232, 110, 'Idi Tunong'),
(10233, 110, 'Indra Makmu'),
(10234, 110, 'Julok'),
(10235, 110, 'Madat'),
(10236, 110, 'Nurussalam'),
(10237, 110, 'Pante Bidari'),
(10238, 110, 'Peudawa'),
(10239, 110, 'Peunaron'),
(10240, 110, 'Peureulak'),
(10241, 110, 'Peureulak Timur'),
(10242, 110, 'Peureulak Barat'),
(10243, 110, 'Rantau Selamat'),
(10244, 110, 'Ranto Peureulak'),
(10245, 110, 'Serbajadi'),
(10246, 110, 'Simpang Jernih'),
(10247, 110, 'Simpang Ulim'),
(10248, 110, 'Sungai Raya'),
(10249, 111, 'Baktiya'),
(10250, 111, 'Baktiya Barat'),
(10251, 111, 'Banda Baro'),
(10252, 111, 'Cot Girek'),
(10253, 111, 'Dewantara'),
(10254, 111, 'Geureudong Pase'),
(10255, 111, 'Kuta Makmur'),
(10256, 111, 'Langkahan'),
(10257, 111, 'Lapang'),
(10258, 111, 'Lhoksukon'),
(10259, 111, 'Matangkuli'),
(10260, 111, 'Muara Batu'),
(10261, 111, 'Meurah Mulia'),
(10262, 111, 'Nibong'),
(10263, 111, 'Nisam'),
(10264, 111, 'Nisam Antara'),
(10265, 111, 'Paya Bakong'),
(10266, 111, 'Pirak Timur'),
(10267, 111, 'Samudera'),
(10268, 111, 'Sawang'),
(10269, 111, 'Seunuddon'),
(10270, 111, 'Simpang Kramat'),
(10271, 111, 'Syamtalira Aron'),
(10272, 111, 'Syamtalira Bayu'),
(10273, 111, 'Tanah Jambo Aye'),
(10274, 111, 'Tanah Luas'),
(10275, 111, 'Tanah Pasir'),
(10276, 112, 'Bandar'),
(10277, 112, 'Bener Kelipah'),
(10278, 112, 'Bukit'),
(10279, 112, 'Gajah Putih'),
(10280, 112, 'Mesidah'),
(10281, 112, 'Permata'),
(10282, 112, 'Pintu Rime Gayo'),
(10283, 112, 'Syiah Utama'),
(10284, 112, 'Timang Gajah'),
(10285, 112, 'Wih Pesam'),
(10286, 113, 'Gandapura'),
(10287, 113, 'Jangka'),
(10288, 113, 'Jeumpa'),
(10289, 113, 'Jeunieb'),
(10290, 113, 'Juli'),
(10291, 113, 'Kota Juang'),
(10292, 113, 'Kuala'),
(10293, 113, 'Kuta Blang'),
(10294, 113, 'Makmur'),
(10295, 113, 'Pandrah'),
(10296, 113, 'Peudada'),
(10297, 113, 'Peulimbang'),
(10298, 113, 'Peusangan'),
(10299, 113, 'Peusangan Selatan'),
(10300, 113, 'Peusangan Siblah Krueng'),
(10301, 113, 'Samalanga'),
(10302, 113, 'Simpang Mamplam'),
(10303, 114, 'Blang Jerango'),
(10304, 114, 'Blangkejeren'),
(10305, 114, 'Blang Pegayon'),
(10306, 114, 'Dabun Gelang'),
(10307, 114, 'Kuta Panjang'),
(10308, 114, 'Pantan Cuaca'),
(10309, 114, 'Pining'),
(10310, 114, 'Puteri Betung'),
(10311, 114, 'Rikit Gaib'),
(10312, 114, 'Terangun'),
(10313, 114, 'Teripe Jaya'),
(10314, 115, 'Kuala'),
(10315, 115, 'Seunagan'),
(10316, 115, 'Seunagan Timur'),
(10317, 115, 'Beutong'),
(10318, 115, 'Darul Makmur'),
(10319, 115, 'Suka Makmue'),
(10320, 115, 'Kuala Pesisir'),
(10321, 115, 'Tadu Raya'),
(10322, 115, 'Tripa Makmur'),
(10323, 115, 'Beutong Ateuh Banggalang'),
(10324, 116, 'Simpang Kiri'),
(10325, 116, 'Penanggalan'),
(10326, 116, 'Rundeng'),
(10327, 116, 'Sultan Daulat'),
(10328, 116, 'Longkib'),
(10329, 117, 'Sukakarya'),
(10330, 117, 'Sukajaya'),
(10331, 118, 'Muara Dua'),
(10332, 118, 'Banda Sakti'),
(10333, 118, 'Blang Mangat'),
(10334, 118, 'Muara Satu'),
(10335, 119, 'Langsa Timur'),
(10336, 119, 'Langsa Barat'),
(10337, 119, 'Langsa Kota'),
(10338, 119, 'Langsa Lama'),
(10339, 119, 'Langsa Baro'),
(10340, 120, 'Baiturrahman'),
(10341, 120, 'Kuta Alam'),
(10342, 120, 'Meuraxa'),
(10343, 120, 'Syiah Kuala'),
(10344, 120, 'Lueng Bata'),
(10345, 120, 'Kuta Raja'),
(10346, 120, 'Banda Raya'),
(10347, 120, 'Jaya Baru'),
(10348, 120, 'Ulee Kareng'),
(10349, 107, 'Simeulue Tengah'),
(10350, 107, 'Salang'),
(10351, 107, 'Teupah Barat'),
(10352, 107, 'Simeulue Timur'),
(10353, 107, 'Teluk Dalam'),
(10354, 107, 'Simeulue Barat'),
(10355, 107, 'Teupah Selatan'),
(10356, 107, 'Alapan'),
(10357, 107, 'Teupah Tengah'),
(10358, 107, 'Simeulue Cut'),
(10359, 121, 'Simeulue Tengah'),
(10360, 121, 'Salang'),
(10361, 121, 'Teupah Barat'),
(10362, 121, 'Simeulue Timur'),
(10363, 121, 'Teluk Dalam'),
(10364, 121, 'Simeulue Barat'),
(10365, 121, 'Teupah Selatan'),
(10366, 121, 'Alapan'),
(10367, 121, 'Teupah Tengah'),
(10368, 121, 'Simeulue Cut'),
(10369, 122, 'Meureudu'),
(10370, 122, 'Ulim'),
(10371, 122, 'Jangka Buaya'),
(10372, 122, 'Bandar Dua'),
(10373, 122, 'Meurah Dua'),
(10374, 122, 'Bandar Baru'),
(10375, 122, 'Panteraja'),
(10376, 122, 'Trienggadeng'),
(10377, 123, 'Batee'),
(10378, 123, 'Delima'),
(10379, 123, 'Geumpang'),
(10380, 123, 'Geulumpang Tiga'),
(10381, 123, 'Indra Jaya'),
(10382, 123, 'Kembang Tanjong'),
(10383, 123, 'Kota Sigli'),
(10384, 123, 'Mila'),
(10385, 123, 'Muara Tiga'),
(10386, 123, 'Mutiara'),
(10387, 123, 'Padang Tiji'),
(10388, 123, 'Peukan Baro'),
(10389, 123, 'Pidie'),
(10390, 123, 'Sakti'),
(10391, 123, 'Simpang Tiga'),
(10392, 123, 'Tangse'),
(10393, 123, 'Tiro/Truseb'),
(10394, 123, 'Keumala'),
(10395, 123, 'Mutiara Timur'),
(10396, 123, 'Grong-grong'),
(10397, 123, 'Mane'),
(10398, 123, 'Glumpang Baro'),
(10399, 123, 'Titeue');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kota_kabupaten`
--

CREATE TABLE `tb_kota_kabupaten` (
  `id_kota` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kota_kabupaten`
--

INSERT INTO `tb_kota_kabupaten` (`id_kota`, `id_provinsi`, `nama_kota`) VALUES
(101, 1, 'Kabupaten Aceh Barat'),
(102, 1, 'Kabupaten Aceh Barat Daya'),
(103, 1, 'Kabupaten Aceh Besar'),
(104, 1, 'Kabupaten Aceh Jaya'),
(105, 1, 'Kabupaten Aceh Selatan'),
(106, 1, 'Kabupaten Aceh Singkil'),
(107, 1, 'Kabupaten Aceh Tamiang'),
(108, 1, 'Kabupaten Aceh Tengah'),
(109, 1, 'Kabupaten Aceh Tenggara'),
(110, 1, 'Kabupaten Aceh Timur'),
(111, 1, 'Kabupaten Aceh Utara'),
(112, 1, 'Kabupaten Bener Meriah'),
(113, 1, 'Kabupaten Bireuen'),
(114, 1, 'Kabupaten Gayo Lues'),
(115, 1, 'Kabupaten Nagan Raya'),
(116, 1, 'Kota Subulussalam'),
(117, 1, 'Kota Sabang'),
(118, 1, 'Kota Lhokseumawe'),
(119, 1, 'Kota Langsa'),
(120, 1, 'Kota Banda Aceh'),
(121, 1, 'Kabupaten Simeulue'),
(122, 1, 'Kabupaten Pidie Jaya'),
(123, 1, 'Kabupaten Pidie'),
(124, 38, 'Kota Tebing Tinggi'),
(125, 36, 'Kabupaten Agam'),
(126, 36, ''),
(127, 36, 'Kabupaten Dharmasraya'),
(128, 36, 'Kabupaten Kepulauan Mentawai'),
(129, 36, 'Kabupaten Lima Puluh Kota'),
(130, 36, 'Kabupaten Padang Pariaman'),
(131, 36, 'Kabupaten Pasaman'),
(132, 36, 'Kabupaten Pasaman Barat'),
(133, 36, 'Kabupaten Pesisir Selatan'),
(134, 36, 'Kabupaten Sijunjung'),
(135, 36, 'Kabupaten Solok'),
(136, 36, 'Kabupaten Solok Selatan'),
(137, 36, 'Kabupaten Tanah Datar'),
(138, 36, 'Kota Bukittinggi'),
(139, 36, 'Kota Padang'),
(140, 36, 'Kota Padang Panjang'),
(141, 36, 'Kota Pariaman'),
(142, 36, 'Kota Payakumbuh'),
(143, 36, 'Kota Sawahlunto'),
(144, 36, 'Kota Solok'),
(145, 30, 'Kabupaten Bengkalis'),
(146, 30, 'Kabupaten Indragiri Hilir'),
(147, 30, 'Kabupaten Indragiri Hulu'),
(148, 30, 'Kabupaten Kampar'),
(149, 30, 'Kabupaten Kepulauan Meranti'),
(150, 30, 'Kabupaten Kuantan Singingi'),
(151, 30, 'Kabupaten Pelalawan'),
(152, 30, 'Kabupaten Rokan Hilir'),
(153, 30, 'Kabupaten Rokan Hulu'),
(154, 30, 'Kabupaten Siak'),
(155, 30, 'Kota Dumai'),
(156, 30, 'Kota Pekanbaru'),
(157, 8, 'Kabupaten Batanghari'),
(158, 8, 'Kabupaten Bungo'),
(159, 8, 'Kabupaten Kerinci'),
(160, 8, 'Kabupaten Merangin'),
(161, 8, 'Kabupaten Muaro Jambi'),
(162, 8, 'Kabupaten Sarolangun'),
(163, 8, 'Kabupaten Tanjung Jabung Barat'),
(164, 8, 'Kabupaten Tanjung Jabung Timur'),
(165, 8, 'Kabupaten Tebo'),
(166, 8, 'Kota Jambi'),
(167, 8, 'Kota Sungai Penuh'),
(168, 37, 'Kabupaten Banyuasin'),
(169, 37, 'Kabupaten Empat Lawang'),
(170, 37, 'Kabupaten Lahat'),
(171, 37, 'Kabupaten Muara Enim'),
(172, 37, 'Kabupaten Musi Banyuasin'),
(173, 37, 'Kabupaten Musi Rawas'),
(174, 37, 'Kabupaten Musi Rawas Utara'),
(175, 37, 'Kabupaten Ogan Ilir'),
(176, 37, 'Kabupaten Ogan Komering Ilir'),
(177, 37, 'Kabupaten Ogan Komering Ulu'),
(178, 37, 'Kabupaten Ogan Komering Ulu Selatan'),
(179, 37, 'Kabupaten Ogan Komering Ulu Timur'),
(180, 37, 'Kabupaten Penukal Abab Lematang Ilir'),
(181, 37, 'Kota Lubuk Linggau'),
(182, 37, 'Kota Pagaralam'),
(183, 37, 'Kota Palembang'),
(184, 37, 'Kota Prabumulih'),
(185, 4, 'Kabupaten Bengkulu Selatan\r\n'),
(186, 4, 'Kabupaten Bengkulu Tengah\r\n'),
(187, 4, 'Kabupaten Bengkulu Utara\r\n'),
(188, 4, 'Kabupaten Kaur\r\n'),
(189, 4, 'Kabupaten Kepahiang\r\n'),
(190, 4, 'Kabupaten Lebong\r\n'),
(191, 4, 'Kabupaten Mukomuko\r\n'),
(192, 4, 'Kabupaten Rejang Lebong\r\n'),
(193, 4, 'Kabupaten Seluma\r\n'),
(194, 4, 'Kota Bengkulu\r\n'),
(195, 4, 'Kabupaten Bengkulu Selatan'),
(196, 4, 'Kabupaten Bengkulu Tengah'),
(197, 4, 'Kabupaten Bengkulu Utara'),
(198, 4, 'Kabupaten Kaur'),
(199, 4, 'Kabupaten Kepahiang'),
(200, 4, 'Kabupaten Lebong'),
(201, 4, 'Kabupaten Mukomuko'),
(202, 4, 'Kabupaten Rejang Lebong'),
(203, 4, 'Kabupaten Seluma'),
(204, 4, 'Kota Bengkulu'),
(205, 19, 'Kabupaten Lampung Barat'),
(206, 19, 'Kabupaten Lampung Selatan'),
(207, 19, 'Kabupaten Lampung Tengah'),
(208, 19, 'Kabupaten Lampung Timur'),
(209, 19, 'Kabupaten Lampung Utara'),
(210, 19, 'Kabupaten Mesuji'),
(211, 19, 'Kabupaten Pesawaran'),
(212, 19, 'Kabupaten Pesisir Barat'),
(213, 19, 'Kabupaten Pringsewu'),
(214, 19, 'Kabupaten Tanggamus'),
(215, 19, 'Kabupaten Tulang Bawang'),
(216, 19, 'Kabupaten Tulang Bawang Barat'),
(217, 19, 'Kabupaten Way Kanan'),
(218, 19, 'Kota Bandar Lampung'),
(219, 19, 'Kota Metro'),
(220, 18, 'Kabupaten Bintan'),
(221, 18, 'Kabupaten Karimun'),
(222, 18, 'Kabupaten Kepulauan Anambas'),
(223, 18, 'Kabupaten Lingga'),
(224, 18, 'Kabupaten Natuna'),
(225, 18, 'Kota Batam'),
(226, 18, 'Kota Tanjungpinang'),
(227, 17, 'Kabupaten Bangka'),
(228, 17, 'Kabupaten Bangka Barat'),
(229, 17, 'Kabupaten Bangka Selatan'),
(230, 17, 'Kabupaten Bangka Tengah'),
(231, 17, 'Kabupaten Belitung'),
(232, 17, 'Kabupaten Belitung Timur'),
(233, 17, 'Kota Pangkalpinang'),
(234, 6, 'Kabupaten Administrasi Kepulauan Seribu'),
(235, 6, 'Kota Administrasi Jakarta Barat'),
(236, 6, 'Kota Administrasi Jakarta Pusat'),
(237, 6, 'Kota Administrasi Jakarta Selatan'),
(238, 6, 'Kota Administrasi Jakarta Timur'),
(239, 6, 'Kota Administrasi Jakarta Utara'),
(240, 9, 'Kabupaten Bandung'),
(241, 9, 'Kabupaten Bandung Barat'),
(242, 9, 'Kabupaten Bekasi'),
(243, 9, 'Kabupaten Bogor'),
(244, 9, 'Kabupaten Ciamis'),
(245, 9, 'Kabupaten Cianjur'),
(246, 9, 'Kabupaten Cirebon'),
(247, 9, 'Kabupaten Garut'),
(248, 9, 'Kabupaten Indramayu'),
(249, 9, 'Kabupaten Karawang'),
(250, 9, 'Kabupaten Kuningan'),
(251, 9, 'Kabupaten Majalengka'),
(252, 9, 'Kabupaten Pangandaran'),
(253, 9, 'Kabupaten Purwakarta'),
(254, 9, 'Kabupaten Subang'),
(255, 9, 'Kabupaten Sukabumi'),
(256, 9, 'Kabupaten Sumedang'),
(257, 9, 'Kabupaten Tasikmalaya'),
(258, 9, 'Kota Bandung'),
(259, 9, 'Kota Banjar'),
(260, 9, 'Kota Bekasi'),
(261, 9, 'Kota Bogor'),
(262, 9, 'Kota Cimahi'),
(263, 9, 'Kota Cirebon'),
(264, 9, 'Kota Depok'),
(265, 9, 'Kota Sukabumi'),
(266, 9, 'Kota Tasikmalaya'),
(267, 10, 'Kabupaten Banjarnegara'),
(268, 10, 'Kabupaten Banyumas'),
(269, 10, 'Kabupaten Batang'),
(270, 10, 'Kabupaten Blora'),
(271, 10, 'Kabupaten Boyolali'),
(272, 10, 'Kabupaten Brebes'),
(273, 10, 'Kabupaten Cilacap'),
(274, 10, 'Kabupaten Demak'),
(275, 10, 'Kabupaten Grobogan'),
(276, 10, 'Kabupaten Jepara'),
(277, 10, 'Kabupaten Karanganyar'),
(278, 10, 'Kabupaten Kebumen'),
(279, 10, 'Kabupaten Kendal'),
(280, 10, 'Kabupaten Klaten'),
(281, 10, 'Kabupaten Kudus'),
(282, 10, 'Kabupaten Magelang'),
(283, 10, 'Kabupaten Pati'),
(284, 10, 'Kabupaten Pekalongan'),
(285, 10, 'Kabupaten Pemalang'),
(286, 10, 'Kabupaten Purbalingga'),
(287, 10, 'Kabupaten Purworejo'),
(288, 10, 'Kabupaten Rembang'),
(289, 10, 'Kabupaten Semarang'),
(290, 10, 'Kabupaten Sragen'),
(291, 10, 'Kabupaten Sukoharjo'),
(292, 10, 'Kabupaten Tegal'),
(293, 10, 'Kabupaten Temanggung'),
(294, 10, 'Kabupaten Wonogiri'),
(295, 10, 'Kabupaten Wonosobo'),
(296, 10, 'Kota Magelang'),
(297, 10, 'Kota Pekalongan'),
(298, 10, 'Kota Salatiga'),
(299, 10, 'Kota Semarang'),
(300, 10, 'Kota Surakarta'),
(301, 10, 'Kota Tegal'),
(302, 5, 'Kabupaten Bantul'),
(303, 5, 'Kabupaten Gunungkidul'),
(304, 5, 'Kabupaten Kulon Progo'),
(305, 5, 'Kabupaten Sleman'),
(306, 5, 'Kota Yogyakarta'),
(307, 11, 'Kabupaten Bangkalan'),
(308, 11, 'Kabupaten Banyuwangi'),
(309, 11, 'Kabupaten Blitar'),
(310, 11, 'Kabupaten Bojonegoro'),
(311, 11, 'Kabupaten Bondowoso'),
(312, 11, 'Kabupaten Gresik'),
(313, 11, 'Kabupaten Jember'),
(314, 11, 'Kabupaten Jombang'),
(315, 11, 'Kabupaten Kediri'),
(316, 11, ''),
(317, 11, ''),
(318, 11, ''),
(319, 11, ''),
(320, 11, ''),
(321, 11, 'Kabupaten Bangkalan'),
(322, 11, 'Kabupaten Banyuwangi'),
(323, 11, 'Kabupaten Blitar'),
(324, 11, 'Kabupaten Bojonegoro'),
(325, 11, 'Kabupaten Bondowoso'),
(326, 11, 'Kabupaten Gresik'),
(327, 11, 'Kabupaten Jember'),
(328, 11, 'Kabupaten Jombang'),
(329, 11, 'Kabupaten Kediri'),
(330, 11, 'Kabupaten Lamongan'),
(331, 11, 'Kabupaten Lumajang'),
(332, 11, 'Kabupaten Madiun'),
(333, 11, 'Kabupaten Magetan'),
(334, 11, 'Kabupaten Malang'),
(335, 11, 'Kabupaten Mojokerto'),
(336, 11, 'Kabupaten Nganjuk'),
(337, 11, 'Kabupaten Ngawi'),
(338, 11, 'Kabupaten Pacitan'),
(339, 11, 'Kabupaten Pamekasan'),
(340, 11, 'Kabupaten Pasuruan'),
(341, 11, 'Kabupaten Ponorogo'),
(342, 11, 'Kabupaten Probolinggo'),
(343, 11, 'Kabupaten Sampang'),
(344, 11, 'Kabupaten Sidoarjo'),
(345, 11, 'Kabupaten Situbondo'),
(346, 11, 'Kabupaten Sumenep'),
(347, 11, 'Kabupaten Trenggalek'),
(348, 11, 'Kabupaten Tuban'),
(349, 11, 'Kabupaten Tulungagung'),
(350, 11, 'Kota Batu'),
(351, 11, 'Kota Blitar'),
(352, 11, 'Kota Kediri'),
(353, 11, 'Kota Madiun'),
(354, 11, 'Kota Malang'),
(355, 11, 'Kota Mojokerto'),
(356, 11, 'Kota Pasuruan'),
(357, 11, 'Kota Probolinggo'),
(358, 11, 'Kota Surabaya'),
(359, 3, 'Kabupaten Lebak'),
(360, 3, 'Kabupaten Pandeglang'),
(361, 3, 'Kabupaten Serang'),
(362, 3, 'Kabupaten Tangerang'),
(363, 3, 'Kota Cilegon'),
(364, 3, 'Kota Serang'),
(365, 3, 'Kota Tangerang'),
(366, 3, 'Kota Tangerang Selatan'),
(367, 2, 'Kabupaten Badung'),
(368, 2, 'Kabupaten Bangli'),
(369, 2, 'Kabupaten Buleleng'),
(370, 2, 'Kabupaten Gianyar'),
(371, 2, 'Kabupaten Jembrana'),
(372, 2, 'Kabupaten Karangasem'),
(373, 2, 'Kabupaten Klungkung'),
(374, 2, 'Kabupaten Tabanan'),
(375, 2, 'Kota Denpasar'),
(376, 22, 'Kabupaten Bima'),
(377, 22, 'Kabupaten Dompu'),
(378, 22, 'Kabupaten Lombok Barat'),
(379, 22, 'Kabupaten Lombok Tengah'),
(380, 22, 'Kabupaten Lombok Timur'),
(381, 22, 'Kabupaten Lombok Utara'),
(382, 22, 'Kabupaten Sumbawa'),
(383, 22, 'Kabupaten Sumbawa Barat'),
(384, 22, 'Kota Bima'),
(385, 22, 'Kota Mataram'),
(386, 23, 'Kabupaten Alor'),
(387, 23, 'Kabupaten Belu'),
(388, 23, 'Kabupaten Ende'),
(389, 23, 'Kabupaten Flores Timur'),
(390, 23, 'Kabupaten Kupang'),
(391, 23, 'Kabupaten Lembata'),
(392, 23, 'Kabupaten Malaka'),
(393, 23, 'Kabupaten Manggarai'),
(394, 23, 'Kabupaten Manggarai Barat'),
(395, 23, 'Kabupaten Manggarai Timur'),
(396, 23, 'Kabupaten Nagekeo'),
(397, 23, 'Kabupaten Ngada'),
(398, 23, 'Kabupaten Rote Ndao'),
(399, 23, 'Kabupaten Sabu Raijua'),
(400, 23, 'Kabupaten Sikka'),
(401, 23, 'Kabupaten Sumba Barat'),
(402, 23, 'Kabupaten Sumba Barat Daya'),
(403, 23, 'Kabupaten Sumba Tengah'),
(404, 23, 'Kabupaten Sumba Timur'),
(405, 23, 'Kabupaten Timor Tengah Selatan'),
(406, 23, 'Kabupaten Timor Tengah Utara'),
(407, 23, 'Kota Kupang'),
(408, 12, 'Kabupaten Bengkayang'),
(409, 12, 'Kabupaten Kapuas Hulu'),
(410, 12, 'Kabupaten Kayong Utara'),
(411, 12, 'Kabupaten Ketapang'),
(412, 12, 'Kabupaten Kubu Raya'),
(413, 12, 'Kabupaten Landak'),
(414, 12, 'Kabupaten Melawi'),
(415, 12, 'Kabupaten Mempawah'),
(416, 12, 'Kabupaten Sambas'),
(417, 12, 'Kabupaten Sanggau'),
(418, 12, 'Kabupaten Sekadau'),
(419, 12, 'Kabupaten Sintang'),
(420, 12, 'Kota Pontianak'),
(421, 12, 'Kota Singkawang'),
(422, 14, 'Kabupaten Barito Selatan'),
(423, 14, 'Kabupaten Barito Timur'),
(424, 14, 'Kabupaten Barito Utara'),
(425, 14, 'Kabupaten Gunung Mas'),
(426, 14, 'Kabupaten Kapuas'),
(427, 14, 'Kabupaten Katingan'),
(428, 14, 'Kabupaten Kotawaringin Barat'),
(429, 14, 'Kabupaten Kotawaringin Timur'),
(430, 14, 'Kabupaten Lamandau'),
(431, 14, 'Kabupaten Murung Raya'),
(432, 14, 'Kabupaten Pulang Pisau'),
(433, 14, 'Kabupaten Seruyan'),
(434, 14, 'Kabupaten Sukamara'),
(435, 14, 'Kota Palangka Raya'),
(436, 13, 'Kabupaten Balangan'),
(437, 13, 'Kabupaten Banjar'),
(438, 13, 'Kabupaten Barito Kuala'),
(439, 13, 'Kabupaten Hulu Sungai Selatan'),
(440, 13, 'Kabupaten Hulu Sungai Tengah'),
(441, 13, 'Kabupaten Hulu Sungai Utara'),
(442, 13, 'Kabupaten Kotabaru'),
(443, 13, 'Kabupaten Tabalong'),
(444, 13, 'Kabupaten Tanah Bumbu'),
(445, 13, 'Kabupaten Tanah Laut'),
(446, 13, 'Kabupaten Tapin'),
(447, 13, 'Kota Banjarbaru'),
(448, 13, 'Kota Banjarmasin'),
(449, 15, 'Kabupaten Berau'),
(450, 15, 'Kabupaten Kutai Barat'),
(451, 15, 'Kabupaten Kutai Kartanegara'),
(452, 15, 'Kabupaten Kutai Timur'),
(453, 15, 'Kabupaten Mahakam Ulu'),
(454, 15, 'Kabupaten Paser'),
(455, 15, 'Kabupaten Penajam Paser Utara'),
(456, 15, 'Kota Balikpapan'),
(457, 15, 'Kota Bontang'),
(458, 15, 'Kota Samarinda'),
(459, 16, 'Kabupaten Bulungan'),
(460, 16, 'Kabupaten Malinau'),
(461, 16, 'Kabupaten Nunukan'),
(462, 16, 'Kabupaten Tana Tidung'),
(463, 16, 'Kota Tarakan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_members`
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
  `id_desa` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_members`
--

INSERT INTO `tb_members` (`id`, `nama`, `alamat`, `telepon`, `email`, `pekerjaan`, `foto_ktp`, `foto_wajah`, `status`, `id_provinsi`, `id_kota`, `id_kecamatan`, `id_desa`, `user_id`) VALUES
(13, 'adi nugroho', 'aceh barat daya jalan aceh no 2', '041412424244', 'hehe@gmail.com', 'gamer', '1753476111_e0c05d49b785de8991f2.jpg', '1753476111_90495fda0094c301b8c6.jpg', 'Aktif', 1, 101, 10101, 1010119, NULL),
(14, 'Andi Pratama', 'Jl. Soekarno Hatta No. 25', '081234567890', 'andi.pratama@email.com', 'Mahasiswa', '1754103538_7dbdb0baa16d342bd0cd.jpeg', '1754103538_babe841cca2f0d078bc5.jpeg', 'Aktif', 1, 101, 10101, 1010101, NULL),
(15, 'Daffa', 'Gak tau', '09128390218', 'daffa@g.com', 'nganggur', '1754360622_a21f2d5a348ff4132968.png', '1754360622_22f1278f26ac9359d1f8.png', 'Aktif', 1, 101, 10101, 1010115, NULL),
(16, 'baru', 'new', '09128318', 'ngajar@d.com', 'ngajar', '1754365194_a4ef49c245a5c0fd92af.png', '1754365194_3f148a9568f623ab99a3.png', 'Aktif', 1, 101, 10101, 1010117, 18),
(17, 'go', 'go', '092381', 'go@go.com', 'go', '1754896509_f6ca690911153a73ccf8.png', '1754896509_a476d5053c337733c4d8.jpg', 'Pending', 1, 101, 10101, 1010102, 19),
(18, 'lagi', 'lagi', '092318', 'lagi@lagi.com', 'lagi', '1754896897_9eba5c3820a7933b83f7.png', '1754896897_c9cf734b299c3cee3b9f.png', 'Pending', 1, 101, 10101, 1010115, 20),
(19, 'aman', 'aman', '09218321', 'aman@aman.com', 'aman', '1754897321_a306dd2384d9b094b315.png', '1754897321_eb96d48b5737eb11384e.png', 'Aktif', 1, 101, 10101, 1010103, 21);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengurus`
--

CREATE TABLE `tb_pengurus` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengurus`
--

INSERT INTO `tb_pengurus` (`id`, `nama`, `jabatan`, `deskripsi`, `created_at`, `updated_at`) VALUES
(4, 'Budi Santoso', 'Sekretaris', 'Mengelola administrasi dan dokumentasi organisasi.', '2025-08-05 09:23:01', NULL),
(5, 'Clara Wijaya', 'Bendahara', 'Mengatur keuangan dan laporan keuangan organisasi.', '2025-08-05 09:23:01', NULL),
(6, 'Daniel Sihombing', 'Koordinator Event', 'Mengatur dan melaksanakan kegiatan serta event yang dirancang organisasi.', '2025-08-05 09:23:01', NULL),
(7, 'Erika Melani', 'Koordinator Media dan Publikasi', 'Bertanggung jawab atas informasi dan publikasi kegiatan GESID.', '2025-08-05 09:23:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_provinsi`
--

CREATE TABLE `tb_provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_provinsi`
--

INSERT INTO `tb_provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
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
-- Table structure for table `tb_respons`
--

CREATE TABLE `tb_respons` (
  `id_respons` int(11) UNSIGNED NOT NULL,
  `id_aduan` int(11) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_respons`
--

INSERT INTO `tb_respons` (`id_respons`, `id_aduan`, `judul`, `isi`, `lampiran`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cek', 'Cek Judul', '1754878920_6c5418cd6cc977d3098e.png', '2025-08-11 02:22:00', '2025-08-11 02:22:00'),
(2, 2, 'Aduan', 'Iya bener suka tidur', NULL, '2025-08-11 08:13:36', '2025-08-11 08:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `tb_selayang_pandang`
--

CREATE TABLE `tb_selayang_pandang` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pengantar` text DEFAULT NULL,
  `latar_belakang` text DEFAULT NULL,
  `tujuan` text DEFAULT NULL,
  `ruang_lingkup` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_selayang_pandang`
--

INSERT INTO `tb_selayang_pandang` (`id`, `judul`, `pengantar`, `latar_belakang`, `tujuan`, `ruang_lingkup`, `created_at`, `updated_at`) VALUES
(1, 'Selayang Pandang GESID', 'dfssdf', 'fsdfdf', 'dffdsfs', 'fsdfdsf', '2025-08-05 06:55:46', '2025-08-05 06:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id` int(11) NOT NULL,
  `image_filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_1_label` varchar(100) DEFAULT NULL,
  `button_1_link` varchar(255) DEFAULT NULL,
  `button_2_label` varchar(100) DEFAULT NULL,
  `button_2_link` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_slider`
--

INSERT INTO `tb_slider` (`id`, `image_filename`, `title`, `subtitle`, `description`, `button_1_label`, `button_1_link`, `button_2_label`, `button_2_link`, `sort_order`, `is_active`, `created_at`) VALUES
(1, '1754343492_0a63d6c45f530bb59c33.jpg', 'aku senang', 'Menemukan Hal Baru', 'Hari ini aku belajar banyak hal menarik dan menantang, membuat hariku terasa lebih bermakna.', 'Pelajari Lebih Lanjut', 'https://contoh.com/pelajari', 'Hubungi Kami', 'https://wa.me/6281234567890\"', 0, 1, '2025-08-04 21:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_superadmin`
--

CREATE TABLE `tb_superadmin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'superadmin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_superadmin`
--

INSERT INTO `tb_superadmin` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$5KFFZjDbUOax6Q3I/20ROeNHmsJWyNr43w1Mk7Yfg41mQ22Qd.l0i', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `role`) VALUES
(6, 'member', '$2y$10$50rVb9jDQk1JPnQoeZKu/eOSRg85FjRbUWWHrEy77qoel74K8p0Ci', 'member'),
(13, 'nizar', '$2y$10$DjPk1GlNX80nUHH4bU30jO.KLtk6KdnEu1AdLPqy0HwDGR.6R0Dwm', 'member'),
(14, 'idk', '$2y$10$Wgaf6QKCDQ2RXeDcCtXxo.kcjBsf3zg5qU1ruFitixk7IQrF6CwEu', 'member'),
(15, 'bocil', '$2y$10$lF9xZRnltEQhZ.s/FXDi2e2nPTYTTUwiXemBT3Ozl1CbZzvsMwNF2', 'member'),
(17, 'daffa', '$2y$10$G0Pw7EzZ9qaQHUi3aZqueOHYONuKrFODOvsN2JnFEBdoKqCjeXIXy', 'member'),
(18, 'baru', '$2y$10$FkVUug32HPGVF0DvX9n.C.Fx5m92/INL8DifZ2GC1vJrwNLiM8Dru', 'member'),
(19, 'go', '$2y$10$xBVHiovROZjzQM.2YjnDPONCouNe8p6KehdH/c2O4Bwuqbx6IROsO', 'member'),
(20, 'lagi', '$2y$10$G2J8jV1rjVUDbqIHcrVRmOWESmLZ.2RokeDL6B693hRR1GraVlIKC', 'member'),
(21, 'aman', '$2y$10$LTSQKhIxXUB8OZlfmeSIGehPcDX.SPADFg3qZnUOmvRhNhPqXw9VC', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users_backup`
--

CREATE TABLE `tb_users_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('superadmin','BPN','BPW','BPD','BPDes','member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users_backup`
--

INSERT INTO `tb_users_backup` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$5KFFZjDbUOax6Q3I/20ROeNHmsJWyNr43w1Mk7Yfg41mQ22Qd.l0i', 'superadmin'),
(2, 'bpn', '$2y$10$TjKuiiEowQEGOQm9zAzM8.j0oloaL8b5sljW3sfHh5jQfz31Z/6Ai', 'BPN'),
(3, 'bpw', '$2y$10$3tdoZHrLKC2LVHLfcENf3O9eBSc1hNw6.Gkr7136TC9BcNsS1dvNu', 'BPW'),
(4, 'bpd', '$2y$10$4k8RDmT9diPrXtYDABKA6en1U3gWOEAGQyrug.jbBz25A49c0v/Ke', 'BPD'),
(5, 'bpdes', '$2y$10$ifeoOHy5VjTvYQa50W4TPueAlYIFa/qxVGlQEX/2vyOqzmSPWb/AW', 'BPDes'),
(6, 'member', '$2y$10$50rVb9jDQk1JPnQoeZKu/eOSRg85FjRbUWWHrEy77qoel74K8p0Ci', 'member'),
(13, 'nizar', '$2y$10$DjPk1GlNX80nUHH4bU30jO.KLtk6KdnEu1AdLPqy0HwDGR.6R0Dwm', 'member'),
(14, 'idk', '$2y$10$Wgaf6QKCDQ2RXeDcCtXxo.kcjBsf3zg5qU1ruFitixk7IQrF6CwEu', 'member'),
(15, 'bocil', '$2y$10$lF9xZRnltEQhZ.s/FXDi2e2nPTYTTUwiXemBT3Ozl1CbZzvsMwNF2', 'member'),
(17, 'daffa', '$2y$10$G0Pw7EzZ9qaQHUi3aZqueOHYONuKrFODOvsN2JnFEBdoKqCjeXIXy', 'member'),
(18, 'baru', '$2y$10$FkVUug32HPGVF0DvX9n.C.Fx5m92/INL8DifZ2GC1vJrwNLiM8Dru', 'member'),
(19, 'go', '$2y$10$xBVHiovROZjzQM.2YjnDPONCouNe8p6KehdH/c2O4Bwuqbx6IROsO', 'member'),
(20, 'lagi', '$2y$10$G2J8jV1rjVUDbqIHcrVRmOWESmLZ.2RokeDL6B693hRR1GraVlIKC', 'member'),
(21, 'aman', '$2y$10$LTSQKhIxXUB8OZlfmeSIGehPcDX.SPADFg3qZnUOmvRhNhPqXw9VC', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tb_visi_misi`
--

CREATE TABLE `tb_visi_misi` (
  `id` int(11) NOT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_visi_misi`
--

INSERT INTO `tb_visi_misi` (`id`, `visi`, `misi`, `created_at`, `updated_at`) VALUES
(1, 'Menjadi wadah pembinaan karakter dan spiritual generasi muda yang tangguh dan peduli bangsa.', 'Membangun karakter Kristiani sejati.\nMenumbuhkan semangat pelayanan sejak dini.\nMenciptakan lingkungan positif dan inspiratif.\nMelatih kepemimpinan dan tanggung jawab sosial.', '2025-08-05 07:35:32', '2025-08-05 07:35:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_acara`
--
ALTER TABLE `tb_acara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_aduan`
--
ALTER TABLE `tb_aduan`
  ADD PRIMARY KEY (`id_aduan`);

--
-- Indexes for table `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bpd`
--
ALTER TABLE `tb_bpd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_bpd_kota` (`id_kota`);

--
-- Indexes for table `tb_bpdes`
--
ALTER TABLE `tb_bpdes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_bpdes_desa` (`id_desa`);

--
-- Indexes for table `tb_bpn`
--
ALTER TABLE `tb_bpn`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tb_bpw`
--
ALTER TABLE `tb_bpw`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_bpw_provinsi` (`id_provinsi`);

--
-- Indexes for table `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  ADD PRIMARY KEY (`id_desa`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `tb_events`
--
ALTER TABLE `tb_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indexes for table `tb_members`
--
ALTER TABLE `tb_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_provinsi_member` (`id_provinsi`),
  ADD KEY `fk_kota_member` (`id_kota`),
  ADD KEY `fk_kecamatan_member` (`id_kecamatan`),
  ADD KEY `fk_desa_member` (`id_desa`);

--
-- Indexes for table `tb_pengurus`
--
ALTER TABLE `tb_pengurus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `tb_respons`
--
ALTER TABLE `tb_respons`
  ADD PRIMARY KEY (`id_respons`),
  ADD KEY `fk_tb_respons_tb_aduan` (`id_aduan`);

--
-- Indexes for table `tb_selayang_pandang`
--
ALTER TABLE `tb_selayang_pandang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_slider`
--
ALTER TABLE `tb_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_superadmin`
--
ALTER TABLE `tb_superadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_visi_misi`
--
ALTER TABLE `tb_visi_misi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_acara`
--
ALTER TABLE `tb_acara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_aduan`
--
ALTER TABLE `tb_aduan`
  MODIFY `id_aduan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_artikel`
--
ALTER TABLE `tb_artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_bpd`
--
ALTER TABLE `tb_bpd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_bpdes`
--
ALTER TABLE `tb_bpdes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_bpn`
--
ALTER TABLE `tb_bpn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_bpw`
--
ALTER TABLE `tb_bpw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  MODIFY `id_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010128;

--
-- AUTO_INCREMENT for table `tb_events`
--
ALTER TABLE `tb_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10400;

--
-- AUTO_INCREMENT for table `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=464;

--
-- AUTO_INCREMENT for table `tb_members`
--
ALTER TABLE `tb_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_pengurus`
--
ALTER TABLE `tb_pengurus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_respons`
--
ALTER TABLE `tb_respons`
  MODIFY `id_respons` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_selayang_pandang`
--
ALTER TABLE `tb_selayang_pandang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_slider`
--
ALTER TABLE `tb_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_superadmin`
--
ALTER TABLE `tb_superadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_visi_misi`
--
ALTER TABLE `tb_visi_misi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_bpd`
--
ALTER TABLE `tb_bpd`
  ADD CONSTRAINT `fk_bpd_kota` FOREIGN KEY (`id_kota`) REFERENCES `tb_kota_kabupaten` (`id_kota`) ON DELETE CASCADE;

--
-- Constraints for table `tb_bpdes`
--
ALTER TABLE `tb_bpdes`
  ADD CONSTRAINT `fk_bpdes_desa` FOREIGN KEY (`id_desa`) REFERENCES `tb_desa_kelurahan` (`id_desa`) ON DELETE CASCADE;

--
-- Constraints for table `tb_bpw`
--
ALTER TABLE `tb_bpw`
  ADD CONSTRAINT `fk_bpw_provinsi` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`) ON DELETE CASCADE;

--
-- Constraints for table `tb_desa_kelurahan`
--
ALTER TABLE `tb_desa_kelurahan`
  ADD CONSTRAINT `tb_desa_kelurahan_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id_kecamatan`) ON DELETE CASCADE;

--
-- Constraints for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD CONSTRAINT `tb_kecamatan_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `tb_kota_kabupaten` (`id_kota`) ON DELETE CASCADE;

--
-- Constraints for table `tb_kota_kabupaten`
--
ALTER TABLE `tb_kota_kabupaten`
  ADD CONSTRAINT `tb_kota_kabupaten_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`) ON DELETE CASCADE;

--
-- Constraints for table `tb_members`
--
ALTER TABLE `tb_members`
  ADD CONSTRAINT `fk_desa_member` FOREIGN KEY (`id_desa`) REFERENCES `tb_desa_kelurahan` (`id_desa`),
  ADD CONSTRAINT `fk_kecamatan_member` FOREIGN KEY (`id_kecamatan`) REFERENCES `tb_kecamatan` (`id_kecamatan`),
  ADD CONSTRAINT `fk_kota_member` FOREIGN KEY (`id_kota`) REFERENCES `tb_kota_kabupaten` (`id_kota`),
  ADD CONSTRAINT `fk_provinsi_member` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`);

--
-- Constraints for table `tb_respons`
--
ALTER TABLE `tb_respons`
  ADD CONSTRAINT `fk_tb_respons_tb_aduan` FOREIGN KEY (`id_aduan`) REFERENCES `tb_aduan` (`id_aduan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
