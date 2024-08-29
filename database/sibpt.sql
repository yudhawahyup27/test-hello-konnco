-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 07:38 AM
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
-- Database: `sibpt`
--

-- --------------------------------------------------------

--
-- Table structure for table `luas_tb`
--

CREATE TABLE `luas_tb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `luas_area` int(11) DEFAULT NULL,
  `jumlah_batang` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `luas_tb`
--

INSERT INTO `luas_tb` (`id`, `luas_area`, `jumlah_batang`, `status`, `created_at`, `updated_at`) VALUES
(1, 175, 400, 'm2', NULL, NULL),
(2, 180, 420, 'm2', NULL, NULL),
(3, 200, 460, 'm2', NULL, NULL),
(4, 250, 680, 'm2', NULL, NULL),
(5, 300, 700, 'm2', NULL, NULL),
(6, 350, 800, 'm2', NULL, NULL),
(7, 400, 820, 'm2', NULL, NULL),
(8, 450, 1040, 'm2', NULL, NULL),
(9, 500, 1150, 'm2', NULL, NULL),
(10, 550, 1265, 'm2', NULL, NULL),
(11, 600, 1480, 'm2', NULL, NULL),
(12, 650, 1495, 'm2', NULL, NULL),
(13, 700, 1600, 'm2', NULL, NULL),
(14, 750, 1750, 'm2', NULL, NULL),
(15, 800, 1835, 'm2', NULL, NULL),
(16, 850, 1950, 'm2', NULL, NULL),
(17, 900, 2065, 'm2', NULL, NULL),
(18, 950, 2180, 'm2', NULL, NULL),
(19, 1000, 2295, 'm2', NULL, NULL),
(20, 1180, 2410, 'm2', NULL, NULL),
(21, 1200, 2520, 'm2', NULL, NULL),
(22, 1250, 2635, 'm2', NULL, NULL),
(23, 1300, 2750, 'm2', NULL, NULL),
(24, 1350, 2865, 'm2', NULL, NULL),
(25, 1, 3200, 'hektar', NULL, NULL),
(26, 2, 6400, 'hektar', NULL, NULL),
(27, 3, 9600, 'hektar', NULL, NULL),
(28, 4, 12800, 'hektar', NULL, NULL),
(29, 5, 16000, 'hektar', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2024_06_11_125150_create_luas_tb', 1),
(8, '2024_06_12_102724_tb_produkborong', 2),
(9, '2024_06_14_161722_create_tb_transaksi_borong_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alamat`
--

CREATE TABLE `tb_alamat` (
  `id_alamat` int(11) NOT NULL,
  `id_provinsi` int(11) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alamatpengiriman`
--

CREATE TABLE `tb_alamatpengiriman` (
  `alamatpengiriman_id` int(11) NOT NULL,
  `alamatpengiriman_user_id` varchar(255) DEFAULT NULL,
  `alamatpengiriman_kecamatan_id` varchar(255) DEFAULT NULL,
  `alamatpengiriman_alamat` varchar(255) DEFAULT NULL,
  `alamatpengiriman_deskripsi` varchar(255) DEFAULT NULL,
  `alamatpengiriman_created` varchar(255) DEFAULT NULL,
  `alamatpengiriman_updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_alamatpengiriman`
--

INSERT INTO `tb_alamatpengiriman` (`alamatpengiriman_id`, `alamatpengiriman_user_id`, `alamatpengiriman_kecamatan_id`, `alamatpengiriman_alamat`, `alamatpengiriman_deskripsi`, `alamatpengiriman_created`, `alamatpengiriman_updated`) VALUES
(6, '12', '22', 'Dsn.Gondang', 'Jl.welirang Ds.Tanjung', '2024-06-06 08:23:19', NULL),
(7, '15', '1', 'Dsn.Gondang', 'Jl.welirang Ds.Tanjung', '2024-06-07 11:04:08', NULL),
(8, '16', '6', 'Dsn.Gondang', 'Jl.welirang Ds.Tanjung', '2024-06-07 11:52:45', NULL),
(9, '17', '1', 'Dsn.Gondang', 'Jl.welirang Ds.Gondang', '2024-06-07 12:10:38', NULL),
(10, '11', '4', '1wwe', '1wwd', '2024-06-09 20:36:44', NULL),
(11, '18', '2', '1wwe', NULL, '2024-06-09 20:43:22', NULL),
(12, '19', '9', '1wwe', '12121', '2024-06-10 11:50:04', '2024-07-03 00:01:39'),
(16, '20', '1', '2', '12121', '2024-06-10 22:09:12', NULL),
(17, '21', '2', '2', 'esgtrfhtj', '2024-06-19 21:52:52', NULL),
(18, '22', '1', '123', 'swssaas', '2024-06-27 02:39:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `kecamatan_id` int(11) NOT NULL,
  `kecamatan_name` varchar(255) DEFAULT NULL,
  `kecamatan_created` varchar(255) DEFAULT NULL,
  `kecamatan_updated` varchar(255) DEFAULT NULL,
  `ongkir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_kecamatan`
--

INSERT INTO `tb_kecamatan` (`kecamatan_id`, `kecamatan_name`, `kecamatan_created`, `kecamatan_updated`, `ongkir`) VALUES
(1, 'Bagor', NULL, NULL, 150002),
(2, 'Baron', NULL, NULL, 150000),
(3, 'Berbek', NULL, NULL, 150000),
(4, 'Gondang', NULL, NULL, 150000),
(5, 'Jatikalen', NULL, NULL, 150000),
(6, 'Kertosono', NULL, NULL, 100000),
(7, 'Lengkong', NULL, NULL, 150000),
(8, 'Loceret', NULL, NULL, 150000),
(9, 'Nganjuk', NULL, NULL, 150000),
(10, 'Ngetos', NULL, NULL, 150000),
(11, 'Ngluyu', NULL, NULL, 150000),
(12, 'Ngronggot', NULL, NULL, 150000),
(24, 'semampir', '2024-06-15 21:22:41', '2024-06-15 21:22:41', 0),
(26, 'balowerti', '2024-06-18 18:36:40', '2024-06-18 18:36:40', 121);

-- --------------------------------------------------------

--
-- Table structure for table `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `keranjang_id_produk` varchar(255) DEFAULT NULL,
  `keranjang_id_user` varchar(255) DEFAULT NULL,
  `qty_keranjang` varchar(255) DEFAULT NULL,
  `pengiriman_keranjang` varchar(255) DEFAULT NULL,
  `price_keranjang` varchar(255) DEFAULT NULL,
  `created_keranjang` varchar(255) DEFAULT NULL,
  `detail_rumah` varchar(255) DEFAULT NULL,
  `kode_transaksi` varchar(255) DEFAULT NULL,
  `updated_keranjang` varchar(255) DEFAULT NULL,
  `kurir` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `berat` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kuantitas`
--

CREATE TABLE `tb_kuantitas` (
  `kuantitas_id` int(11) NOT NULL,
  `kuantitas_id_produk` varchar(255) DEFAULT NULL,
  `kuantitas_luaslahan` varchar(255) DEFAULT NULL,
  `kuantitas_jumlahbatang` varchar(255) DEFAULT NULL,
  `kuantitas_created` varchar(255) DEFAULT NULL,
  `kuantitas_updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_metodepembayaran`
--

CREATE TABLE `tb_metodepembayaran` (
  `metodepembayaran_id` int(11) NOT NULL,
  `metodepembayaran_name` varchar(255) DEFAULT NULL,
  `metodepembayaran_bank` varchar(255) DEFAULT NULL,
  `metodepembayaran_numberbank` varchar(255) DEFAULT NULL,
  `metodepembayaran_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_metodepembayaran`
--

INSERT INTO `tb_metodepembayaran` (`metodepembayaran_id`, `metodepembayaran_name`, `metodepembayaran_bank`, `metodepembayaran_numberbank`, `metodepembayaran_created`) VALUES
(4, 'Alvia Sikha', 'BRI', '351098827', '2024-06-06 08:07:40'),
(5, 'Sena', 'BCA', '149187489', '2024-06-06 18:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ongkir`
--

CREATE TABLE `tb_ongkir` (
  `ongkir_id` int(11) NOT NULL,
  `ongkir_fromlocation` varchar(255) DEFAULT NULL,
  `ongkir_tolocation` varchar(255) DEFAULT NULL,
  `ongkir_price` varchar(255) DEFAULT NULL,
  `ongkir_created` varchar(255) DEFAULT NULL,
  `ongkir_updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_ongkir`
--

INSERT INTO `tb_ongkir` (`ongkir_id`, `ongkir_fromlocation`, `ongkir_tolocation`, `ongkir_price`, `ongkir_created`, `ongkir_updated`) VALUES
(4, 'Kertosono', 'Gondang', '150000', '2024-06-30 21:10:56', '2024-06-30 21:10:56'),
(5, 'Kertosono', 'Ngronggot', '150.000', '2024-06-06 12:52:27', '2024-06-06 12:52:27'),
(6, 'Kertosono', 'Bagor', '150.000', '2024-06-07 02:14:54', '2024-06-07 02:14:54'),
(10, 'Kertosono', 'Nganjuk', '1101001', '2024-06-12 17:43:06', '2024-06-12 17:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_alamat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_perkembangan`
--

CREATE TABLE `tb_perkembangan` (
  `id_pbk` int(11) NOT NULL,
  `perkembangan_kode_transaksi` varchar(255) DEFAULT NULL,
  `perkembangan_gambar` varchar(255) DEFAULT NULL,
  `perkembangan_umur` varchar(255) DEFAULT NULL,
  `perkembangan_tinggi` varchar(255) DEFAULT NULL,
  `perkembangan_deskripsi` mediumtext DEFAULT NULL,
  `perkembangan_created` varchar(255) DEFAULT NULL,
  `perkembangan_updated` varchar(255) DEFAULT NULL,
  `perkembangan_tanggal` date DEFAULT NULL,
  `perkembangan_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_perkembangan`
--

INSERT INTO `tb_perkembangan` (`id_pbk`, `perkembangan_kode_transaksi`, `perkembangan_gambar`, `perkembangan_umur`, `perkembangan_tinggi`, `perkembangan_deskripsi`, `perkembangan_created`, `perkembangan_updated`, `perkembangan_tanggal`, `perkembangan_link`) VALUES
(13, '669157568bd2e', NULL, NULL, NULL, NULL, '2024-07-17 19:48:49', '2024-07-17 19:48:49', NULL, NULL),
(14, '669157056e419', NULL, NULL, NULL, NULL, '2024-07-17 19:48:51', '2024-07-17 19:48:51', NULL, NULL),
(15, '669157568bd2e', NULL, NULL, NULL, NULL, '2024-07-17 19:51:44', '2024-07-17 19:51:44', NULL, NULL),
(16, '669157568bd2e', NULL, '12', '0.5', 'Kmu harus lihat video', '2024-07-17 19:52:28', '2024-07-17 19:52:28', '2024-07-19', NULL),
(17, '669157568bd2e', NULL, NULL, NULL, NULL, '2024-07-17 19:53:04', '2024-07-17 19:53:04', NULL, NULL),
(18, '669157568bd2e', NULL, NULL, NULL, NULL, '2024-07-17 19:53:12', '2024-07-17 19:53:12', NULL, NULL),
(19, '669157568bd2e', NULL, NULL, NULL, NULL, '2024-07-17 19:53:27', '2024-07-17 19:53:27', NULL, NULL),
(20, '669157568bd2e', NULL, '21', '0.5', 'wsdecfgvbhnjmk', '2024-07-17 20:03:53', '2024-07-17 20:03:53', '2024-07-12', 'https://www.youtube.com/watch?v=EQEfgwOGxYE&list=PLTwSej6cFuWQ2mNdjg9W8KebR18wSWyie'),
(21, '669a93aee9caa', NULL, '123', '0.5', 'dcfvgbhnhjkm,', '2024-07-21 10:28:09', '2024-07-21 10:28:09', '2024-07-25', 'https://www.youtube.com/watch?v=EQEfgwOGxYE&list=PLTwSej6cFuWQ2mNdjg9W8KebR18wSWyie');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesanan` int(11) NOT NULL,
  `nama_pesanan` varchar(255) DEFAULT NULL,
  `tgl_pesanan` varchar(255) DEFAULT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `produk_id_user` varchar(255) DEFAULT NULL,
  `kode_bibit` varchar(255) DEFAULT NULL,
  `nama_bibit` varchar(255) DEFAULT NULL,
  `detail_bibit` mediumtext DEFAULT NULL,
  `harga_bibit` varchar(255) DEFAULT NULL,
  `stok_bibit` varchar(255) DEFAULT NULL,
  `gambar_bibit` varchar(255) DEFAULT NULL,
  `terjual_bibit` varchar(255) DEFAULT NULL,
  `status_bibit` varchar(255) DEFAULT NULL,
  `created_produk` varchar(255) DEFAULT NULL,
  `updated_produk` varchar(255) DEFAULT NULL,
  `harga_borong` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `produk_id_user`, `kode_bibit`, `nama_bibit`, `detail_bibit`, `harga_bibit`, `stok_bibit`, `gambar_bibit`, `terjual_bibit`, `status_bibit`, `created_produk`, `updated_produk`, `harga_borong`, `kategori`) VALUES
(87, '18', 'A002', 'bibit tanaman buah dan sayur terong ungu EE15', 'bibit sudah sehat dan kuat...sudah berbunga...tinggi sekitar 30 - 40 cm', '100', '941', '92771724894496.jpg', '694', '1', '2024-06-18 18:32:57', '2024-08-29 08:53:13', '10', 'Sayur'),
(88, '11', 'A003', 'tanaman stoberi bibit buah stoberry buah stobery EE13', 'Tanaman stoberi bibit buah stoberry buah stobery', '14900', '23', '84401724859061.jpg', '246', '1', '2024-08-28 14:42:39', '2024-08-29 08:24:47', '2121', 'Buah'),
(89, '11', 'A004', 'Bibit Alpukat', 'Bibit Alpukat Wina Unggul: Daging buah tebal, rasa gurih manis, berbuah lebat sepanjang tahun. Cocok untuk konsumsi segar atau olahan.', '500', '0', '71141724853647.png', '2', '1', '2024-07-06 16:16:42', '2024-08-29 08:30:53', '0', 'Buah'),
(91, '11', 'A005', 'Bibit Baby Pakcoy', 'Pakcoy adalah jenis sayuran yang berasal dari famili cruciferous yang masih satu keluarga dengan kubis, brokoli dan kembang kol. Karena masuk ke dalam kategori sayuran hijau, pakcoy mengandung berbagai nutrisi penting yang baik untuk tubuh.\r\nBagi yang sedang menjalankan diet, pakcoy bisa jadi pilihan yang tepat karena rendah kalori. Pakcoy kami berukuran kecil (baby) ditanam secara organik di lahan bebas polutan, tidak menggunakan pestisida ataupun pupuk buatan lainnya.\r\n\r\nManfaat:\r\n\r\nMenurunkan risiko penyakit jantung\r\nMenigkatkan imunitas tubuh\r\nMenurunkan risiko kanker\r\nMenjaga kesehatan mata\r\nCara penyimpanan: Simpan pada suhu 1-4°C', '600', '12', '1724854984_5984.jpg', '22', '1', '2024-08-28 14:23:04', '2024-08-29 08:50:51', '550', 'Sayur'),
(92, '11', 'A006', 'Mangga Harum Manis Matang', 'Mangga Harum Manis Matang Pohon', '67000', '11', '1724856335_2601.jpg', '22', '1', '2024-08-28 14:45:35', '2024-08-29 08:19:58', '60000', 'Buah'),
(99, '11', 'A007', 'Stoberry', 'detail Stoberry', '100', '100', '1724897693_6328.jpg', NULL, '1', '2024-08-29 02:14:53', NULL, '100', 'Buah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produkborong`
--

CREATE TABLE `tb_produkborong` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_produkborong`
--

INSERT INTO `tb_produkborong` (`id`, `name`, `harga`, `created_at`, `updated_at`, `gambar`) VALUES
(1, 'Brokoli', 250, NULL, NULL, 'clown-7286951_960_720.jpg'),
(2, 'Cabai Rawit', 350, NULL, NULL, NULL),
(3, 'Cabai Merah Besar', 350, NULL, NULL, NULL),
(4, 'Cabai Kriting', 350, NULL, NULL, NULL),
(5, 'Gambas', 250, NULL, NULL, NULL),
(6, 'Labu Air', 250, NULL, NULL, NULL),
(7, 'Labu Kuning', 250, NULL, NULL, NULL),
(8, 'Labu Waluh', 250, NULL, NULL, NULL),
(9, 'Labu Madu', 0, NULL, NULL, NULL),
(10, 'Tomat', 350, NULL, NULL, NULL),
(11, 'Terong Kecil', 250, NULL, NULL, NULL),
(12, 'Terong Ungu', 250, NULL, NULL, NULL),
(13, 'Terong Hijau', 250, NULL, NULL, NULL),
(14, 'Timun Suri', 250, NULL, NULL, NULL),
(15, 'Timun Lalap', 250, NULL, NULL, NULL),
(16, 'Melon Golden (Daging Putih)', 600, NULL, NULL, NULL),
(17, 'Melon Daging Putih', 600, NULL, NULL, NULL),
(18, 'Melon Jumbo Daging Oranye', 600, NULL, NULL, NULL),
(19, 'Sawi Putih', 250, NULL, NULL, NULL),
(20, 'Sawi Hijau', 250, NULL, NULL, NULL),
(21, 'Sawi Packcoy', 250, NULL, NULL, NULL),
(22, 'Sawi Manis/Caisim', 250, NULL, NULL, NULL),
(23, 'Semangka Tanpa Biji', 250, NULL, NULL, NULL),
(24, 'Semangka Merah', 250, NULL, NULL, NULL),
(25, 'Semangka Kuning', 250, NULL, NULL, NULL),
(26, 'Kacang Panjang', 250, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`status_id`, `status_name`) VALUES
(1, 'sudah dibayar'),
(2, 'sedang diproses'),
(3, 'sudah dikirim'),
(4, 'sudah diterima');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statuspengiriman`
--

CREATE TABLE `tb_statuspengiriman` (
  `statuspengiriman_id` int(11) NOT NULL,
  `statuspengiriman_id_status` varchar(255) DEFAULT NULL,
  `statuspengiriman_kodetransaksi` varchar(255) DEFAULT NULL,
  `statuspengiriman_created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_statuspengiriman`
--

INSERT INTO `tb_statuspengiriman` (`statuspengiriman_id`, `statuspengiriman_id_status`, `statuspengiriman_kodetransaksi`, `statuspengiriman_created`) VALUES
(24, '1', 'T2024060615', '2024-06-06 19:09:24'),
(25, '1', 'T2024060616', '2024-06-06 19:19:24'),
(26, '1', 'T2024060717', '2024-06-07 02:38:22'),
(27, '1', 'T2024060718', '2024-06-07 11:59:22'),
(28, '1', 'T2024060719', '2024-06-07 12:05:34'),
(29, '1', 'T2024061020', '2024-06-10 23:30:10'),
(30, '1', 'T2024061021', '2024-06-10 23:38:33'),
(31, '1', 'T2024061022', '2024-06-10 23:43:36'),
(32, '1', 'T2024061023', '2024-06-10 23:45:22'),
(33, '1', 'T2024061024', '2024-06-10 23:51:20'),
(34, '1', 'T2024061125', '2024-06-11 00:01:35'),
(35, '1', 'T2024061126', '2024-06-11 00:04:00'),
(36, '1', 'T2024061127', '2024-06-11 00:09:05'),
(37, '1', 'T2024061128', '2024-06-11 00:12:25'),
(38, '1', 'T2024061129', '2024-06-11 00:14:22'),
(39, '1', 'T2024061130', '2024-06-11 00:17:24'),
(40, '1', 'T2024061131', '2024-06-11 00:23:12'),
(41, '1', 'T2024061132', '2024-06-11 00:41:12'),
(42, '1', 'T2024061233', '2024-06-12 20:35:17'),
(43, '1', 'T2024061434', '2024-06-14 14:21:58'),
(44, '1', 'T2024061435', '2024-06-14 14:25:31'),
(45, '1', 'T2024061436', '2024-06-14 22:55:12'),
(46, '2', 'T2024061129', '2024-06-17 21:15:04'),
(47, '2', 'T2024061022', '2024-06-17 21:17:11'),
(48, '2', 'T2024061023', '2024-06-17 21:17:12'),
(49, '2', 'T2024061125', '2024-06-17 21:17:13'),
(50, '3', 'T2024061022', '2024-06-17 21:17:25'),
(51, '4', 'T2024061022', '2024-06-17 21:17:27'),
(52, '2', 'T2024061024', '2024-06-17 21:17:30'),
(53, '3', 'T2024061024', '2024-06-17 21:17:38'),
(54, '4', 'T2024061024', '2024-06-17 21:17:43'),
(55, '3', 'T2024061125', '2024-06-18 19:26:27'),
(56, '4', 'T2024061125', '2024-06-18 19:26:53'),
(57, '1', 'T2024061837', '2024-06-18 20:10:42'),
(58, '1', 'T2024061838', '2024-06-18 20:15:55'),
(59, '1', 'T2024061839', '2024-06-18 23:13:50'),
(60, '1', 'T2024061840', '2024-06-18 23:40:16'),
(61, '1', 'T2024061841', '2024-06-18 23:40:57'),
(62, '1', 'T2024061842', '2024-06-18 23:41:08'),
(63, '1', 'T2024061843', '2024-06-18 23:41:42'),
(64, '1', 'T2024061844', '2024-06-18 23:43:16'),
(65, '1', 'T2024061845', '2024-06-18 23:43:25'),
(66, '1', 'T2024061847', '2024-06-18 23:54:06'),
(67, '1', 'T2024061848', '2024-06-18 23:56:10'),
(68, '1', 'T2024061849', '2024-06-18 23:58:31'),
(69, '1', 'T2024061950', '2024-06-19 00:06:08'),
(70, '3', 'T2024061023', '2024-06-19 00:07:57'),
(71, '4', 'T2024061023', '2024-06-19 00:08:23'),
(72, '2', 'T2024061020', '2024-06-19 00:12:14'),
(73, '2', 'T2024061021', '2024-06-19 00:12:20'),
(74, '1', 'T2024061951', '2024-06-19 23:20:52'),
(75, '1', 'T2024061952', '2024-06-19 23:21:28'),
(76, '1', 'T2024061953', '2024-06-19 23:21:44'),
(77, '1', 'T2024061954', '2024-06-19 23:21:52'),
(78, '1', 'T202406191', '2024-06-19 23:23:24'),
(79, '1', 'T2024061956', '2024-06-19 23:25:13'),
(80, '1', 'T2024061957', '2024-06-19 23:25:33'),
(81, '1', 'T2024061958', '2024-06-19 23:26:32'),
(82, '1', 'T2024061959', '2024-06-19 23:37:23'),
(83, '1', 'T2024061960', '2024-06-19 23:37:28'),
(84, '1', 'T2024061961', '2024-06-19 23:50:37'),
(85, '1', 'T2024061962', '2024-06-19 23:57:17'),
(86, '1', 'T2024062063', '2024-06-20 00:00:07'),
(87, '1', 'T2024062064', '2024-06-20 00:19:17'),
(88, '1', 'T2024062065', '2024-06-20 00:21:24'),
(89, '1', 'T2024062066', '2024-06-20 00:22:23'),
(90, '1', 'T2024062067', '2024-06-20 00:23:15'),
(91, '2', 'T2024062067', '2024-06-20 00:50:17'),
(92, '2', 'T202406191', '2024-06-20 01:08:01'),
(93, '3', 'T2024062067', '2024-06-20 01:08:12'),
(94, '4', 'T2024062067', '2024-06-20 01:08:32'),
(95, '2', 'T2024062066', '2024-06-20 01:22:51'),
(96, '3', 'T2024062066', '2024-06-20 01:23:17'),
(97, '1', 'T2024062368', '2024-06-23 01:41:54'),
(98, '4', 'T202406191', '2024-06-25 21:25:13'),
(99, '4', 'T2024062368', '2024-06-25 21:25:49'),
(100, '4', 'T2024062066', '2024-06-25 22:40:07'),
(101, '2', 'T2024062065', '2024-06-26 11:29:26'),
(102, '3', 'T2024062065', '2024-06-26 11:29:31'),
(103, '4', 'T2024062065', '2024-06-26 11:35:46'),
(104, '2', '667b9ae4b835f', '2024-06-26 11:39:21'),
(105, '3', '667b9ae4b835f', '2024-06-26 11:39:24'),
(106, '4', '667b9ae4b835f', '2024-06-26 11:39:59'),
(107, '3', 'T2024061956', '2024-06-27 00:54:03'),
(108, '4', 'T2024061956', '2024-06-27 08:48:27'),
(109, '2', 'Ttx26685842f1b6a6', '2024-07-04 21:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_bibit` int(11) NOT NULL,
  `stok_kode_barang` varchar(255) DEFAULT NULL,
  `stok_jumlah` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `nama_bibit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_stok`
--

INSERT INTO `tb_stok` (`id_bibit`, `stok_kode_barang`, `stok_jumlah`, `created_at`, `updated_at`, `nama_bibit`) VALUES
(46, 'A002', '349', '2024-06-18 18:21:37', '2024-06-18 18:21:43', 'naila'),
(48, 'A004', '2113', '2024-07-06 16:16:06', '2024-07-06 16:16:42', 'coba coba'),
(49, 'A005', '12', '2024-08-28 14:23:04', '2024-08-28 14:23:04', 'Baby Pakcoy'),
(50, 'A006', '2112', '2024-08-28 14:45:35', '2024-08-28 14:45:35', 'Mangga Harum Manis Matang'),
(57, 'A007', '100', '2024-08-29 02:14:53', '2024-08-29 02:14:53', 'Stoberry');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user_transaksi` varchar(255) DEFAULT NULL,
  `id_produk` int(11) NOT NULL,
  `kode_transaksi` varchar(255) DEFAULT NULL,
  `total_transaksi` varchar(255) DEFAULT NULL,
  `status_transaksi` varchar(255) DEFAULT NULL,
  `created_transaksi` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(100) DEFAULT NULL,
  `Qty_beli` varchar(255) NOT NULL,
  `detail_rumah` varchar(255) NOT NULL,
  `pengiriman` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `beban` varchar(255) NOT NULL,
  `kurir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_user_transaksi`, `id_produk`, `kode_transaksi`, `total_transaksi`, `status_transaksi`, `created_transaksi`, `bukti_transfer`, `Qty_beli`, `detail_rumah`, `pengiriman`, `ongkir`, `provinsi`, `beban`, `kurir`) VALUES
(106, '19', 87, 'Ttx26698b0f10b3fc', '165000', '1', '2024-07-18 13:13:26', '/path/to/bukti_transfer2', '1', 'coba beli satuan', '63', 'jne', '1', '400', '0'),
(107, '19', 85, 'Ttx2669a8702e4058', '10000', '1', '2024-07-19 22:34:39', '/path/to/bukti_transfer2', '1', 'wertyu', '66', '355000', '15', '1000 gram', 'jne'),
(108, '19', 87, 'Ttx2669a8830c1d68', '10000', '1', '2024-07-19 22:37:29', '/path/to/bukti_transfer2', '1', '12', '490', '235000', '18', '1000 gram', 'jne'),
(109, '19', 87, 'Ttx2669a89019f7f1', '435000', '1', '2024-07-19 22:40:59', '/path/to/bukti_transfer2', '1', 'wwq', '221', '425000', '14', '1000 gram', 'jne'),
(110, '19', 87, 'Ttx2669a8c4f27b96', '365000', '1', '2024-07-19 23:17:14', '/path/to/bukti_transfer2', '1', 'w', '66', '355000', '15', '1000 gram', 'jne'),
(111, '19', 87, 'Ttx2669a91a0ec78b', '1385276', '1', '2024-08-28 14:39:00', '/path/to/bukti_transfer2', '122', 'q', '232', '165000', '3', '5000 gram', 'jne'),
(112, '19', 88, 'Ttx266ced3e5a90a0', '1455276', '1', '2024-08-28 14:39:00', '/path/to/bukti_transfer2', '23', 'qw', '490', '235000', '18', '1000 gram', 'jne'),
(113, '11', 87, 'Ttx266cf6e7b0fc35', '470000', '1', '2024-08-29 01:39:47', '/path/to/bukti_transfer2', '12', '1000', '452', '350000', '13', '1000 gram', 'jne'),
(114, '19', 92, 'Ttx266cfb153def34', '873000', '1', '2024-08-29 06:23:23', '/path/to/bukti_transfer2', '12', 'sadsad', '454', '69000', '13', '1000 gram', 'pos'),
(115, '19', 91, 'Ttx266cfd3290edf8', '161600', '1', '2024-08-29 08:49:39', '/path/to/bukti_transfer2', '11', 'ddsfd', '393', '155000', '8', '1000 gram', 'jne'),
(116, '19', 92, 'Ttx266cfd9dd413c1', '734500', '1', '2024-08-29 09:17:05', '/path/to/bukti_transfer2', '10', 'Rumah Nomer 10', '28', '64500', '2', '1000 gram', 'pos');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_borong`
--

CREATE TABLE `tb_transaksi_borong` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user_transaksi` bigint(20) UNSIGNED DEFAULT NULL,
  `kode_transaksi` varchar(255) DEFAULT NULL,
  `nama_bibit` varchar(255) DEFAULT NULL,
  `tanggal_tanam` date DEFAULT NULL,
  `luas_lahan` varchar(255) DEFAULT NULL,
  `kuantitas_bibit` varchar(255) DEFAULT NULL,
  `total_transaksi` decimal(10,2) DEFAULT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `pengiriman` bigint(20) UNSIGNED DEFAULT NULL,
  `metodepembayaran` bigint(20) UNSIGNED DEFAULT NULL,
  `status_transaksi` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detail_rumah` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kurir` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL,
  `beban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_transaksi_borong`
--

INSERT INTO `tb_transaksi_borong` (`id`, `id_user_transaksi`, `kode_transaksi`, `nama_bibit`, `tanggal_tanam`, `luas_lahan`, `kuantitas_bibit`, `total_transaksi`, `bukti_pembayaran`, `pengiriman`, `metodepembayaran`, `status_transaksi`, `created_at`, `updated_at`, `detail_rumah`, `provinsi`, `kurir`, `ongkir`, `beban`) VALUES
(187, 19, '66992c0317e69', '87', '2024-08-02', '175', '350', 1750000.00, '/images/about.jpeg', 17, 2, 1, '2024-07-18 14:51:47', NULL, 'jh', '1', 'pos', '540000', '12000 gram'),
(188, 19, '669a8bd80111c', '85', '2024-08-03', '175', '350', 175000.00, '/images/about.jpeg', 17, 2, 1, '2024-07-19 15:52:56', NULL, '12', '1', 'jne', '252000', '12000 gram'),
(189, 19, '669a935d533da', '87', '2024-08-03', '175', '350', 1750000.00, '/images/about.jpeg', 17, 2, 1, '2024-07-19 16:25:01', NULL, 'sdfghj', '1', 'jne', '252000', '12000 gram'),
(190, 19, '669a93aee9caa', '87', '2024-08-03', '175', '350', 1750000.00, '/images/about.jpeg', 17, 2, 2, '2024-07-19 16:26:22', '2024-08-28 07:36:26', 'sdfghj', '1', 'jne', '252000', '12000 gram');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_keranjang`
--

CREATE TABLE `tb_transaksi_keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_transaksi_keranjang` varchar(255) DEFAULT NULL,
  `keranjang_id_produk` varchar(255) DEFAULT NULL,
  `keranjang_id_user` varchar(255) DEFAULT NULL,
  `qty_keranjang` varchar(255) DEFAULT NULL,
  `pengiriman_keranjang` varchar(255) DEFAULT NULL,
  `price_keranjang` varchar(255) DEFAULT NULL,
  `created_keranjang` varchar(255) DEFAULT NULL,
  `detail_rumah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_transaksi_keranjang`
--

INSERT INTO `tb_transaksi_keranjang` (`id_keranjang`, `kode_transaksi_keranjang`, `keranjang_id_produk`, `keranjang_id_user`, `qty_keranjang`, `pengiriman_keranjang`, `price_keranjang`, `created_keranjang`, `detail_rumah`) VALUES
(39, 'T202406061', '58', '12', '200', '21', '80000', '2024-06-06 15:23:24', ''),
(40, 'T202406061', '58', '12', '150', '21', '60000', '2024-06-06 15:23:24', ''),
(41, 'T202406061', '58', '12', NULL, NULL, '0', '2024-06-06 15:23:24', ''),
(42, 'T202406061', '61', '12', '110', '21', '38500', '2024-06-06 15:23:24', ''),
(43, 'T202406061', '61', '12', '110', '22', '38500', '2024-06-06 15:23:24', ''),
(44, 'T2024060612', '58', '12', '200', '21', '80000', '2024-06-06 15:34:11', ''),
(45, 'T2024060612', '58', '12', '150', '21', '60000', '2024-06-06 15:34:11', ''),
(46, 'T2024060612', '58', '12', NULL, NULL, '0', '2024-06-06 15:34:11', ''),
(47, 'T2024060612', '61', '12', '110', '21', '38500', '2024-06-06 15:34:11', ''),
(48, 'T2024060612', '61', '12', '110', '22', '38500', '2024-06-06 15:34:11', ''),
(49, 'T2024060612', '61', '12', '111', '22', '38850', '2024-06-06 15:34:11', ''),
(50, 'T2024060613', '58', '12', '200', '21', '80000', '2024-06-06 19:03:07', ''),
(51, 'T2024060613', '58', '12', '150', '21', '60000', '2024-06-06 19:03:07', ''),
(52, 'T2024060613', '58', '12', NULL, NULL, '0', '2024-06-06 19:03:07', ''),
(53, 'T2024060613', '61', '12', '110', '21', '38500', '2024-06-06 19:03:07', ''),
(54, 'T2024060613', '61', '12', '110', '22', '38500', '2024-06-06 19:03:07', ''),
(55, 'T2024060614', '58', '12', '200', '21', '80000', '2024-06-06 19:07:37', ''),
(56, 'T2024060614', '58', '12', '150', '21', '60000', '2024-06-06 19:07:37', ''),
(57, 'T2024060614', '58', '12', NULL, NULL, '0', '2024-06-06 19:07:37', ''),
(58, 'T2024060614', '61', '12', '110', '21', '38500', '2024-06-06 19:07:37', ''),
(59, 'T2024060614', '61', '12', '110', '22', '38500', '2024-06-06 19:07:37', ''),
(60, 'T2024060615', '58', '12', '200', '21', '80000', '2024-06-06 19:09:24', ''),
(61, 'T2024060615', '58', '12', '150', '21', '60000', '2024-06-06 19:09:24', ''),
(62, 'T2024060615', '58', '12', NULL, NULL, '0', '2024-06-06 19:09:24', ''),
(63, 'T2024060615', '61', '12', '110', '21', '38500', '2024-06-06 19:09:24', ''),
(64, 'T2024060615', '61', '12', '120', '22', '42000', '2024-06-06 19:09:24', ''),
(65, 'T2024060616', '58', '12', '200', '21', '80000', '2024-06-06 19:19:24', ''),
(66, 'T2024060616', '58', '12', '150', '21', '60000', '2024-06-06 19:19:24', ''),
(67, 'T2024060616', '58', '12', NULL, NULL, '0', '2024-06-06 19:19:24', ''),
(68, 'T2024060616', '61', '12', '110', '21', '38500', '2024-06-06 19:19:24', ''),
(69, 'T2024060616', '61', '12', '120', '22', '42000', '2024-06-06 19:19:24', ''),
(70, 'T2024060717', '58', '12', '200', '21', '80000', '2024-06-07 02:38:22', ''),
(71, 'T2024060717', '58', '12', '150', '21', '60000', '2024-06-07 02:38:22', ''),
(72, 'T2024060717', '61', '12', '110', '21', '38500', '2024-06-07 02:38:22', ''),
(73, 'T2024060717', '61', '12', '120', '22', '42000', '2024-06-07 02:38:22', ''),
(74, 'T2024060717', '62', '12', '100', '21', '35000', '2024-06-07 02:38:22', ''),
(75, 'T2024060717', '62', '12', '100', '21', '35000', '2024-06-07 02:38:22', ''),
(76, 'T2024060717', '60', '12', '100', '21', '60000', '2024-06-07 02:38:22', ''),
(77, 'T2024060718', '66', '16', '123', '21', '43050', '2024-06-07 11:59:22', ''),
(78, 'T2024060718', '66', '16', '123', '6', '43050', '2024-06-07 11:59:22', ''),
(79, 'T2024060719', '66', '16', '123', '21', '43050', '2024-06-07 12:05:34', ''),
(80, 'T2024060719', '65', '16', '123', '6', '49200', '2024-06-07 12:05:34', ''),
(81, 'T2024061020', '65', '20', '350', '21', '140000', '2024-06-10 23:30:10', ''),
(82, 'T2024061020', '65', '20', '350', NULL, '140000', '2024-06-10 23:30:10', ''),
(83, 'T2024061020', '65', '20', '350', NULL, '140000', '2024-06-10 23:30:10', ''),
(84, 'T2024061020', '65', '20', '350', NULL, '140000', '2024-06-10 23:30:10', ''),
(85, 'T2024061020', '65', '20', NULL, NULL, '0', '2024-06-10 23:30:10', ''),
(86, 'T2024061020', '65', '20', '222', NULL, '88800', '2024-06-10 23:30:10', ''),
(87, 'T2024061020', '65', '20', '2', NULL, '800', '2024-06-10 23:30:10', ''),
(88, 'T2024061020', '65', '20', '22', '1', '8800', '2024-06-10 23:30:10', ''),
(89, 'T2024061021', '65', '20', '350', '21', '140000', '2024-06-10 23:38:33', ''),
(90, 'T2024061021', '65', '20', '350', NULL, '140000', '2024-06-10 23:38:33', ''),
(91, 'T2024061021', '65', '20', '350', NULL, '140000', '2024-06-10 23:38:33', ''),
(92, 'T2024061021', '65', '20', '350', NULL, '140000', '2024-06-10 23:38:33', ''),
(93, 'T2024061021', '65', '20', NULL, NULL, '0', '2024-06-10 23:38:33', ''),
(94, 'T2024061021', '65', '20', '222', NULL, '88800', '2024-06-10 23:38:33', ''),
(95, 'T2024061021', '65', '20', '2', NULL, '800', '2024-06-10 23:38:33', ''),
(96, 'T2024061021', '74', '20', '99', '1', '20999979', '2024-06-10 23:38:33', ''),
(97, 'T2024061022', '65', '20', '350', '21', '140000', '2024-06-10 23:43:36', ''),
(98, 'T2024061022', '65', '20', '350', NULL, '140000', '2024-06-10 23:43:36', ''),
(99, 'T2024061022', '65', '20', '350', NULL, '140000', '2024-06-10 23:43:36', ''),
(100, 'T2024061022', '65', '20', '350', NULL, '140000', '2024-06-10 23:43:36', ''),
(101, 'T2024061022', '65', '20', NULL, NULL, '0', '2024-06-10 23:43:36', ''),
(102, 'T2024061022', '65', '20', '222', NULL, '88800', '2024-06-10 23:43:36', ''),
(103, 'T2024061022', '65', '20', '2', NULL, '800', '2024-06-10 23:43:36', ''),
(104, 'T2024061022', '73', '20', '12', '1', '144', '2024-06-10 23:43:36', ''),
(105, 'T2024061023', '65', '20', '350', '21', '140000', '2024-06-10 23:45:22', ''),
(106, 'T2024061023', '65', '20', '350', NULL, '140000', '2024-06-10 23:45:22', ''),
(107, 'T2024061023', '65', '20', '350', NULL, '140000', '2024-06-10 23:45:22', ''),
(108, 'T2024061023', '65', '20', '350', NULL, '140000', '2024-06-10 23:45:22', ''),
(109, 'T2024061023', '65', '20', NULL, NULL, '0', '2024-06-10 23:45:22', ''),
(110, 'T2024061023', '65', '20', '222', NULL, '88800', '2024-06-10 23:45:22', ''),
(111, 'T2024061023', '65', '20', '2', NULL, '800', '2024-06-10 23:45:22', ''),
(112, 'T2024061023', '73', '20', '12', '1', '144', '2024-06-10 23:45:22', ''),
(113, 'T2024061024', '65', '20', '350', '21', '140000', '2024-06-10 23:51:20', ''),
(114, 'T2024061024', '65', '20', '350', NULL, '140000', '2024-06-10 23:51:20', ''),
(115, 'T2024061024', '65', '20', '350', NULL, '140000', '2024-06-10 23:51:20', ''),
(116, 'T2024061024', '65', '20', '350', NULL, '140000', '2024-06-10 23:51:20', ''),
(117, 'T2024061024', '65', '20', NULL, NULL, '0', '2024-06-10 23:51:20', ''),
(118, 'T2024061024', '65', '20', '222', NULL, '88800', '2024-06-10 23:51:20', ''),
(119, 'T2024061024', '65', '20', '2', NULL, '800', '2024-06-10 23:51:20', ''),
(120, 'T2024061024', '73', '20', '12', '1', '144', '2024-06-10 23:51:20', ''),
(121, 'T2024061125', '65', '20', '350', '21', '140000', '2024-06-11 00:01:35', ''),
(122, 'T2024061125', '65', '20', '350', NULL, '140000', '2024-06-11 00:01:35', ''),
(123, 'T2024061125', '65', '20', '350', NULL, '140000', '2024-06-11 00:01:35', ''),
(124, 'T2024061125', '65', '20', '350', NULL, '140000', '2024-06-11 00:01:35', ''),
(125, 'T2024061125', '65', '20', NULL, NULL, '0', '2024-06-11 00:01:35', ''),
(126, 'T2024061125', '65', '20', '222', NULL, '88800', '2024-06-11 00:01:35', ''),
(127, 'T2024061125', '65', '20', '2', NULL, '800', '2024-06-11 00:01:35', ''),
(128, 'T2024061125', '73', '20', '12', '1', '144', '2024-06-11 00:01:35', ''),
(129, 'T2024061126', '65', '20', '350', '21', '140000', '2024-06-11 00:04:00', ''),
(130, 'T2024061126', '65', '20', '350', NULL, '140000', '2024-06-11 00:04:00', ''),
(131, 'T2024061126', '65', '20', '350', NULL, '140000', '2024-06-11 00:04:00', ''),
(132, 'T2024061126', '65', '20', '350', NULL, '140000', '2024-06-11 00:04:00', ''),
(133, 'T2024061126', '65', '20', NULL, NULL, '0', '2024-06-11 00:04:00', ''),
(134, 'T2024061126', '65', '20', '222', NULL, '88800', '2024-06-11 00:04:00', ''),
(135, 'T2024061126', '65', '20', '2', NULL, '800', '2024-06-11 00:04:00', ''),
(136, 'T2024061126', '73', '20', '12', '1', '144', '2024-06-11 00:04:00', ''),
(137, 'T2024061127', '65', '20', '350', '21', '140000', '2024-06-11 00:09:05', ''),
(138, 'T2024061127', '65', '20', '350', NULL, '140000', '2024-06-11 00:09:05', ''),
(139, 'T2024061127', '65', '20', '350', NULL, '140000', '2024-06-11 00:09:05', ''),
(140, 'T2024061127', '65', '20', '350', NULL, '140000', '2024-06-11 00:09:05', ''),
(141, 'T2024061127', '65', '20', NULL, NULL, '0', '2024-06-11 00:09:05', ''),
(142, 'T2024061127', '65', '20', '222', NULL, '88800', '2024-06-11 00:09:05', ''),
(143, 'T2024061127', '65', '20', '2', NULL, '800', '2024-06-11 00:09:05', ''),
(144, 'T2024061127', '73', '20', '12', '1', '144', '2024-06-11 00:09:05', ''),
(145, 'T2024061127', '74', '20', '2', NULL, '424242', '2024-06-11 00:09:05', ''),
(146, 'T2024061127', '74', '20', '2', NULL, '424242', '2024-06-11 00:09:05', ''),
(147, 'T2024061128', '65', '20', '350', '21', '140000', '2024-06-11 00:12:25', ''),
(148, 'T2024061128', '65', '20', '350', NULL, '140000', '2024-06-11 00:12:25', ''),
(149, 'T2024061128', '65', '20', '350', NULL, '140000', '2024-06-11 00:12:25', ''),
(150, 'T2024061128', '65', '20', '350', NULL, '140000', '2024-06-11 00:12:25', ''),
(151, 'T2024061128', '65', '20', NULL, NULL, '0', '2024-06-11 00:12:25', ''),
(152, 'T2024061128', '65', '20', '222', NULL, '88800', '2024-06-11 00:12:25', ''),
(153, 'T2024061128', '65', '20', '2', NULL, '800', '2024-06-11 00:12:25', ''),
(154, 'T2024061128', '74', '20', '2', NULL, '424242', '2024-06-11 00:12:25', ''),
(155, 'T2024061128', '74', '20', '2', NULL, '424242', '2024-06-11 00:12:25', ''),
(156, 'T2024061128', '74', '20', '2', '1', '424242', '2024-06-11 00:12:25', ''),
(157, 'T2024061129', '65', '20', '350', '21', '140000', '2024-06-11 00:14:22', ''),
(158, 'T2024061129', '65', '20', '350', NULL, '140000', '2024-06-11 00:14:22', ''),
(159, 'T2024061129', '65', '20', '350', NULL, '140000', '2024-06-11 00:14:22', ''),
(160, 'T2024061129', '65', '20', '350', NULL, '140000', '2024-06-11 00:14:22', ''),
(161, 'T2024061129', '65', '20', NULL, NULL, '0', '2024-06-11 00:14:22', ''),
(162, 'T2024061129', '65', '20', '222', NULL, '88800', '2024-06-11 00:14:22', ''),
(163, 'T2024061129', '65', '20', '2', NULL, '800', '2024-06-11 00:14:22', ''),
(164, 'T2024061129', '74', '20', '2', NULL, '424242', '2024-06-11 00:14:22', ''),
(165, 'T2024061129', '74', '20', '2', NULL, '424242', '2024-06-11 00:14:22', ''),
(166, 'T2024061129', '74', '20', '1', NULL, '212121', '2024-06-11 00:14:22', ''),
(167, 'T2024061129', '74', '20', '3', '1', '636363', '2024-06-11 00:14:22', ''),
(168, 'T2024061130', '65', '20', '350', '21', '140000', '2024-06-11 00:17:24', ''),
(169, 'T2024061130', '65', '20', '350', NULL, '140000', '2024-06-11 00:17:24', ''),
(170, 'T2024061130', '65', '20', '350', NULL, '140000', '2024-06-11 00:17:24', ''),
(171, 'T2024061130', '65', '20', '350', NULL, '140000', '2024-06-11 00:17:24', ''),
(172, 'T2024061130', '65', '20', NULL, NULL, '0', '2024-06-11 00:17:24', ''),
(173, 'T2024061130', '65', '20', '222', NULL, '88800', '2024-06-11 00:17:24', ''),
(174, 'T2024061130', '65', '20', '2', NULL, '800', '2024-06-11 00:17:24', ''),
(175, 'T2024061130', '74', '20', '2', NULL, '424242', '2024-06-11 00:17:24', ''),
(176, 'T2024061130', '74', '20', '2', NULL, '424242', '2024-06-11 00:17:24', ''),
(177, 'T2024061130', '74', '20', '1', NULL, '212121', '2024-06-11 00:17:24', ''),
(178, 'T2024061130', '74', '20', '2', '1', '424242', '2024-06-11 00:17:24', ''),
(179, 'T2024061131', '65', '20', '350', '21', '140000', '2024-06-11 00:23:12', ''),
(180, 'T2024061131', '65', '20', '350', NULL, '140000', '2024-06-11 00:23:12', ''),
(181, 'T2024061131', '65', '20', '350', NULL, '140000', '2024-06-11 00:23:12', ''),
(182, 'T2024061131', '65', '20', '350', NULL, '140000', '2024-06-11 00:23:12', ''),
(183, 'T2024061131', '65', '20', NULL, NULL, '0', '2024-06-11 00:23:12', ''),
(184, 'T2024061131', '65', '20', '222', NULL, '88800', '2024-06-11 00:23:12', ''),
(185, 'T2024061131', '65', '20', '2', NULL, '800', '2024-06-11 00:23:12', ''),
(186, 'T2024061131', '74', '20', '2', NULL, '424242', '2024-06-11 00:23:12', ''),
(187, 'T2024061131', '74', '20', '2', NULL, '424242', '2024-06-11 00:23:12', ''),
(188, 'T2024061131', '74', '20', '1', NULL, '212121', '2024-06-11 00:23:12', ''),
(189, 'T2024061131', '73', '20', '12', '1', '144', '2024-06-11 00:23:12', ''),
(190, 'T2024061132', '65', '20', '350', '21', '140000', '2024-06-11 00:41:12', ''),
(191, 'T2024061132', '65', '20', '350', NULL, '140000', '2024-06-11 00:41:12', ''),
(192, 'T2024061132', '65', '20', '350', NULL, '140000', '2024-06-11 00:41:12', ''),
(193, 'T2024061132', '65', '20', '350', NULL, '140000', '2024-06-11 00:41:12', ''),
(194, 'T2024061132', '65', '20', NULL, NULL, '0', '2024-06-11 00:41:12', ''),
(195, 'T2024061132', '65', '20', '222', NULL, '88800', '2024-06-11 00:41:12', ''),
(196, 'T2024061132', '65', '20', '2', NULL, '800', '2024-06-11 00:41:12', ''),
(197, 'T2024061132', '74', '20', '2', NULL, '424242', '2024-06-11 00:41:12', ''),
(198, 'T2024061132', '74', '20', '2', NULL, '424242', '2024-06-11 00:41:12', ''),
(199, 'T2024061132', '74', '20', '1', NULL, '212121', '2024-06-11 00:41:12', ''),
(200, 'T2024061132', '73', '20', '12', NULL, '144', '2024-06-11 00:41:12', ''),
(201, 'T2024061132', '73', '20', '1', '1', '12', '2024-06-11 00:41:12', ''),
(202, 'T2024061233', '74', '19', '1', '2', '212121', '2024-06-12 20:35:17', ''),
(203, 'T2024061434', '73', '19', '1', NULL, '12', '2024-06-14 14:21:58', ''),
(204, 'T2024061435', '73', '19', '111', '0', '1332', '2024-06-14 14:25:31', ''),
(205, 'T2024061436', '73', '19', '111', '0', '1332', '2024-06-14 22:55:12', ''),
(206, 'T2024061436', '73', '19', '22', '0', '264', '2024-06-14 22:55:12', ''),
(207, 'T2024061837', '73', '19', '123', '6', '101476', '2024-06-18 20:10:42', ''),
(208, 'T2024061838', '73', '19', '123', '6', '101476', '2024-06-18 20:15:55', ''),
(209, 'T2024061839', '73', '19', '1', NULL, '12', '2024-06-18 23:13:50', ''),
(210, 'T2024061840', '73', '19', '1', '0', '12', '2024-06-18 23:40:16', ''),
(211, 'T2024061841', '73', '19', '15', '0', '180', '2024-06-18 23:40:57', ''),
(212, 'T2024061843', '73', '19', '15', '6', '100180', '2024-06-18 23:41:42', ''),
(213, 'T2024061847', '73', '19', '3', '6', '100036', '2024-06-18 23:54:06', ''),
(214, 'T2024061848', '73', '19', '6', '6', '100072', '2024-06-18 23:56:10', ''),
(215, 'T2024061849', '73', '19', '14', '6', '100168', '2024-06-18 23:58:31', ''),
(216, 'T2024061951', '73', '19', '14', '6', '100168', '2024-06-19 23:20:52', ''),
(217, 'T2024062066', '85', '19', '12', NULL, '1452', '2024-06-20 00:22:23', ''),
(218, 'T2024062067', '77', '19', '21', NULL, '4454541', '2024-06-20 00:23:15', ''),
(219, 'T2024062368', '77', '19', '22', '10', '4816662', '2024-06-23 01:41:54', ''),
(220, NULL, '63', '19', '22', '3', '157700', '2024-06-25 21:40:48', 'ertyu'),
(221, NULL, '63', '19', '45', '24', '15871', '2024-06-25 21:41:37', 'rtyhjukl'),
(222, NULL, '63', '19', '45', '24', '15871', '2024-06-25 21:41:45', 'rtyhjukl'),
(223, NULL, '63', '19', '1', '8', '150350', '2024-06-25 21:42:25', '21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `nomortelepon_user` varchar(255) DEFAULT NULL,
  `alamat_user` varchar(255) DEFAULT NULL,
  `email_user` varchar(255) DEFAULT NULL,
  `username_user` varchar(255) DEFAULT NULL,
  `password_user` varchar(255) DEFAULT NULL,
  `role_user` varchar(255) DEFAULT NULL,
  `status_user` varchar(255) DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `updated_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `nomortelepon_user`, `alamat_user`, `email_user`, `username_user`, `password_user`, `role_user`, `status_user`, `created_user`, `updated_user`) VALUES
(11, 'yudha', '111212121', 'asassa', 'wyudha104@gmail.com', 'yudha', '123', '2', '1', '2024-06-09 20:07:17', NULL),
(18, 'pemilik', '7638290', '1wwe', 'wyudha104@gmail.com', 'pemilik', '123', '3', '1', '2024-06-09 20:42:58', NULL),
(19, 'pelanggan', '7638290', '1wwe', 'wyudha104@gmail.com', 'pelanggan', '123', '4', '1', '2024-06-10 11:49:31', NULL),
(20, 'naila', '7638290', '1wwe', 'wyudha104@gmail.com', 'naila', '123', '1', '1', '2024-06-10 21:46:37', NULL),
(21, 'naila', '7638290', '2', 'wyudha104@gmail.com', 'pegawai', '123', '4', '1', '2024-06-18 18:37:37', NULL),
(22, 'mama', '089612197184', 'uewq', NULL, 'mama', '123', '4', '1', '2024-06-27 02:38:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `luas_tb`
--
ALTER TABLE `luas_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tb_alamat`
--
ALTER TABLE `tb_alamat`
  ADD PRIMARY KEY (`id_alamat`);

--
-- Indexes for table `tb_alamatpengiriman`
--
ALTER TABLE `tb_alamatpengiriman`
  ADD PRIMARY KEY (`alamatpengiriman_id`);

--
-- Indexes for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`kecamatan_id`);

--
-- Indexes for table `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `tb_kuantitas`
--
ALTER TABLE `tb_kuantitas`
  ADD PRIMARY KEY (`kuantitas_id`);

--
-- Indexes for table `tb_metodepembayaran`
--
ALTER TABLE `tb_metodepembayaran`
  ADD PRIMARY KEY (`metodepembayaran_id`);

--
-- Indexes for table `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  ADD PRIMARY KEY (`ongkir_id`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `tb_perkembangan`
--
ALTER TABLE `tb_perkembangan`
  ADD PRIMARY KEY (`id_pbk`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_produkborong`
--
ALTER TABLE `tb_produkborong`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tb_statuspengiriman`
--
ALTER TABLE `tb_statuspengiriman`
  ADD PRIMARY KEY (`statuspengiriman_id`);

--
-- Indexes for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_bibit`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_transaksi_borong`
--
ALTER TABLE `tb_transaksi_borong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_transaksi_borong_id_user_transaksi_foreign` (`id_user_transaksi`);

--
-- Indexes for table `tb_transaksi_keranjang`
--
ALTER TABLE `tb_transaksi_keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `luas_tb`
--
ALTER TABLE `luas_tb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_alamat`
--
ALTER TABLE `tb_alamat`
  MODIFY `id_alamat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_alamatpengiriman`
--
ALTER TABLE `tb_alamatpengiriman`
  MODIFY `alamatpengiriman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  MODIFY `kecamatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `tb_kuantitas`
--
ALTER TABLE `tb_kuantitas`
  MODIFY `kuantitas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_metodepembayaran`
--
ALTER TABLE `tb_metodepembayaran`
  MODIFY `metodepembayaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_ongkir`
--
ALTER TABLE `tb_ongkir`
  MODIFY `ongkir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_perkembangan`
--
ALTER TABLE `tb_perkembangan`
  MODIFY `id_pbk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tb_produkborong`
--
ALTER TABLE `tb_produkborong`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_statuspengiriman`
--
ALTER TABLE `tb_statuspengiriman`
  MODIFY `statuspengiriman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_bibit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tb_transaksi_borong`
--
ALTER TABLE `tb_transaksi_borong`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `tb_transaksi_keranjang`
--
ALTER TABLE `tb_transaksi_keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_transaksi_borong`
--
ALTER TABLE `tb_transaksi_borong`
  ADD CONSTRAINT `tb_transaksi_borong_id_user_transaksi_foreign` FOREIGN KEY (`id_user_transaksi`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
