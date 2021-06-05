-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2021 pada 12.40
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcu-computer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_pelanggan`, `id_produk`, `jumlah`) VALUES
(50, 0, 5, 1),
(51, 0, 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(512) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `alamatLengkap` text NOT NULL,
  `status` int(1) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `nama`, `email`, `password`, `nohp`, `alamatLengkap`, `status`, `created`) VALUES
(1, 'Yogie prayoga', 'yogie.prayoga35@gmail.com', '0e974c43aa971b07faed3157d4579d0d', '081522630817', 'jln.anugrah masuk jln.raflesia no.86, sampit, kalimantan tengah', 1, '01-06-2021 05:23:38'),
(2, 'M.dwi', 'dwi913555@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a', '0856351523312', 'JL. SAWIT RAYA', 1, '01-06-2021 10:28:23'),
(3, 'Suldiasnyah', 'sildiansya@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a', '081522630817', 'JL. SAWIT RAYA', 1, '01-06-2021 10:30:22'),
(4, 'Dewi Ulfa', 'ulfaTes@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a', '082736612553', 'asdasdsasdassadsadasdasdasdasdasdasdasdasdasdasdasd', 1, '01-06-2021 10:55:43'),
(6, 'sjw', 'sjw@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a', '08762535512', 'wahai kurir cari sendiri', 1, '05-06-2021 12:49:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `start` datetime NOT NULL,
  `end` varchar(100) NOT NULL,
  `discount` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `diskon`
--

INSERT INTO `diskon` (`id`, `nama`, `detail`, `start`, `end`, `discount`) VALUES
(3, 'Cari Laptop Gaming berkualitas?', 'Cek disini Laptop gaming murah dengan kualitas terbaik dari brand ternama \r\ndengan diskon 60% untuk ', '2021-06-01 20:00:00', '2022-12-30 03:00', 11),
(8, 'Aksesori Komputer Murah', 'Dapatkan beraqgam aksesoris kompputer dengan diskon hingga 11%', '2021-06-02 07:00:00', '2021-06-02 08:00', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Laptop'),
(3, 'aksesoris komputer'),
(30, 'Komputer'),
(31, 'Komponen komputer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_produk_diskon`
--

CREATE TABLE `list_produk_diskon` (
  `id` int(11) NOT NULL,
  `id_diskon` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `list_produk_diskon`
--

INSERT INTO `list_produk_diskon` (`id`, `id_diskon`, `id_produk`, `created`) VALUES
(32, 3, 3, '30-05-2021 20:27:09'),
(33, 3, 19, '30-05-2021 20:27:16'),
(34, 3, 22, '30-05-2021 20:34:47'),
(36, 3, 23, '30-05-2021 20:35:28'),
(39, 8, 11, '01-06-2021 21:34:06'),
(40, 8, 16, '01-06-2021 21:34:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `produk_id_qty` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`produk_id_qty`)),
  `pemesan_id` int(11) NOT NULL,
  `totalBayar` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_pesan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `produk_id_qty`, `pemesan_id`, `totalBayar`, `status`, `tanggal_pesan`) VALUES
(14, '[[\"43\",\"1\"],[\"44\",\"1\"],[\"41\",\"1\"]]', 1, 38045680, '3', '05-06-2021 16:05'),
(17, '[[\"19\",1,\"11\"]]', 2, 12681637, '1', '05-06-2021 16:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `Kategori` varchar(255) NOT NULL,
  `sub_kategori` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `spesifikasi` mediumtext NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `nama`, `Kategori`, `sub_kategori`, `brand`, `harga`, `gambar`, `spesifikasi`, `deskripsi`, `tanggal`) VALUES
(3, 'ASUS ROG Strix G G512LI-I565B6T', '1', 1, 'Asus', 16940000, '5efac19ed72fb.jpg', '<ol>\r\n<li>&nbsp; asdasdasd</li>\r\n<li>asdasdasd</li>\r\n<li>asdasdasd</li>\r\n</ol>', 'ASUS ROG Strix G adalah laptop gaming yang tak hanya memiliki performa yang sangat mendukung kebutuhan gaming terkini, namun juga tampil dengan desain yang keren dan juga futuristik.', '2021-05-24'),
(4, 'HP 240 G8', '1', 3, 'HP', 7754998, 'b39d0079ef707db593ac5656bb521589.png', '', 'HP 240 G adalah laptop bisnis HP seri Essential yang mendukung aktivitas Anda sehari-hari. Laptop ini punya dimensi lebih tipis dan ringan dibanding model sebelumnya. Bodi yang tangguh melindungi laptop HP ini dari kerasnya lingkungan luar.', '2021-05-24'),
(5, 'HP Notebook 14s-dq2518TU', '1', 3, 'HP', 5599000, '607965a16f5dd.jpg', '<p>PlatformNotebookProsesorintel celeron 6305URam4 GB DDR 3Layar14 incstorage512 GB SSDOperating SystemWindows 10 Home + office student</p>', 'HP NoteBook 14s cocok bagi kamu yang masih sekolah atau kuliah di pembeliannya sudah include windows 10 home dan office home student membuat laptop ini sangat cocok untuk anak sekolah hingga pegawai kantoran biasa dan didukung dengan performa mumpuni dan penyimpanan SSD yang besar.', '2021-05-24'),
(6, 'ASUS ZenBook Flip 14 UM462DA-AI501TS', '1', 2, 'Asus', 11799000, '6007d152074e3.jpg', '<p>PlatformNotebook - convertible</p>\r\n<p>ProsesorAMD Ryzen 5 3500U</p>\r\n<p>Ram8GB DDR4</p>\r\n<p>Layar14 inc</p>\r\n<p>storage512 GB SSD</p>\r\n<p>Operating SystemWindows 10 Home</p>', 'ASUS ZenBook Flip 14 UM462DA merupakan laptop bertenaga yang menggabungkan keserbagunaan dengan mobilitas tertinggi. Laptop ini sangat cocok untuk meningkatkan produktivitas Anda di mana saja dan kapan saja laptop ini mendukung 3 mode laptop, stand, dan table dengan layar sentuh yang responsive dan beresolusi tinggi dengan panel ips dengan dukungan hingga 10 jari akan memudahkan anda dalam melakukan kegiatan seperti multimedia,persentasi, dan membuat pekerjaan kantor.', '2021-05-24'),
(7, 'ACER Swift 3 SF313-51', '1', 2, 'Acer', 7499000, '5c8b12424c994.jpg', '<p>PlatformNotebookProsesorIntel&reg; Core&trade; i3-8130U Processor (2.20 GHz. up to 3.40 GHz. 4M Cache)Ram4 GB DDR4Layar13.5 incstorage256GB SSDOperating SystemWindows 10 Home</p>', 'Acer Swift 3 dirancang untuk Anda yang dinamis dan aktif. Laptop ini punya kemampuan multitasking mumpuni. Swift 3 didukung spesifikasi canggih seperti RAM DDR4, processor Intel Core generasi ke-8, dan storage jenis SSD', '2021-05-24'),
(8, 'ACER Spin 3 SP314-51', '1', 2, 'Acer', 10191000, '5c8b12424c994.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff; height: 975px; width: 98.4906%;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Platform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Notebook</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Intel Core i5</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Intel&reg; Core&trade; i5-8250U Processor (1.60 GHz, Up to 3.40 GHz, 6M Cache)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Kapasitas Penyimpanan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">1TB HDD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">8GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Intel UHD Graphics</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Ukuran Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">14 Inch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Resolusi Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">1920 x 1080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Wireless Network Type</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Wireless Network Protocol</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">802.11 ac</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Wireless Bluetooth</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Antarmuka / Interface</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">USB 3.0</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">USB 2.0</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">HDMI</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Standard Keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Ragam Input Device</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Touch Pad</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Audio</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Speaker</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">Microsoft Windows 10</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">3 Cell</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Dimensi (PTL)</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">335 mm x 235 mm x 22.5 mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 46.5793%;\">Berat Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; width: 53.2751%;\">1.70 kg</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Acer Spin 3 dirancang untuk Anda yang sangat aktif. Laptop ini punya ukuran ringkas dan bisa dipakai dalam 4 mode, yaitu: laptop mode, tablet model, tent mode, dan display mode cocok untuk anda yang membutuhkan laptop dengan mobilitas tinggi.', '2021-05-24'),
(11, 'Mouse Wireless Logitech', '3', 13, 'Logitech', 165000, '94470725614a19b70905f99106be515f.jpeg', '<p>2.4 GHz Wireless Technology Mouse Nano-receiver 10m Wireless range</p>', 'Mouse Wireless Logitech cocok untuk kantor dan penggunaan personal computer.', '2021-05-24'),
(16, 'RAZER Cynosa V2 Gaming Keyboard with Razer Chroma RGB', '3', 12, 'Razer', 799000, '607d496f4bfee.jpg', '<table style=\"border-collapse: collapse; width: 100%; height: 100px;\" border=\"0\">\r\n<tbody>\r\n<tr style=\"height: 46px;\">\r\n<td style=\"width: 98.5039%; height: 46px;\">\r\n<p>Gaming Keyboard</p>\r\n<p>Switch : Soft cushioned gaming-grade keys</p>\r\n<p>Razer Chroma&trade; backlighting with 16.8 million customizable color options</p>\r\n<p>10 key roll-over with anti-ghosting</p>\r\n<p>Fully programmable keys with on-the-fly macro recording</p>\r\n<p>Gaming mode option</p>\r\n<p>1000Hz Ultrapolling</p>\r\n<p>Unit Utama</p>\r\n<p>Spill-resistant durable design</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Razer adlah brand blalalal', '2021-05-24'),
(19, 'Acer Nitro 5 AN515-55-77MG', '1', 1, 'Acer', 14249030, 'f546493a-727b-42ea-9b56-a1583f01e7fe.jpg', '<div class=\"product attribute sku\" style=\"box-sizing: border-box; color: #666666; font-family: \'Open Sans\'; font-size: 13px; background-color: #ffffff;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><strong class=\"type\" style=\"box-sizing: border-box; color: #333333; font-size: 14px; display: inline-block;\">SKU</strong>&nbsp;</span>\r\n<div class=\"value\" style=\"box-sizing: border-box; display: inline-block; font-size: 14px;\"><span style=\"font-family: arial, helvetica, sans-serif;\">NH.Q7NSN.002</span></div>\r\n</div>\r\n<div class=\"product attribute overview\" style=\"box-sizing: border-box; color: #666666; font-size: 14px; margin: 0px; padding: 0px; font-family: \'Open Sans\'; background-color: #ffffff;\">\r\n<div class=\"value\" style=\"box-sizing: border-box;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><strong style=\"box-sizing: border-box;\">Highlights:</strong></span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Performa &amp; durabilitas stabil, kinerja 25% lebih baik berteknologi CoolBoost Fan didukung Nitro sense untuk pengaturan temperature lebih optimal</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Kapasitas dapat diupgrade hingga&nbsp;2TB SSD, Dual slot SSD NVMe</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Tampilan&nbsp;keyboard&nbsp;4 zona full RGB&nbsp;tampilan lebih memikat</span><br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\"><strong style=\"box-sizing: border-box;\">Nitro 5 (AN515-55)</strong></span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Intel&reg; Core&trade; i7-10750H</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Windows 10 Home &amp; Office Home Student 2019</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 1*8GB DDR4</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 512GB SSD NVMe</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 15.6\" Full HD (1920x1080) IPS 144Hz</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; NVIDIA&reg; GeForce&reg; GTX 1650Ti</span></div>\r\n</div>', '-', '2021-05-25'),
(21, 'THERMALTAKE Versa H18 Window Micro Case', '31', 10, 'Versa', 810000, '5bdc02545de3b.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kesesuaian Motherboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Mini ITX and Micro ATX</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">External Bays</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">I/O Port: USB 3.0 x 1, USB 2.0 x 2, HD Audio x 1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Berat Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">4.5 kg / 9.92 lb (H x W x D)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Dimensi Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">390 x 205 x 380mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Pendinginan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">Rear (exhaust) : 120 x 120 x 25 mm fan (1000rpm, 16dBA)</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">Front: 3 x 120mm, 2 x 140mm</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">Top: 1 x 120mm, 1 x 140mm</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">Rear: 1 x 120mm</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Power Supply</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Standard PS2 PSU (optional)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Lain-lain</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">Drive Bays Hidden: 2 x 2.5\"; 2 x 3.5\"</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">Radiator Front: 1 x 240mm, 1 x 280mm, Rear: 1 x 120mm</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Model</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Micro Tower</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'THERMALTAKE Versa H18 Window Micro Case merupakan sasis untuk desktop gaming ringkas Anda. Sasis dari THERMALTAKE ini sangat cocok untuk Anda yang ingin membangun rig yang tak perlu menggunakan ruang lebih banyak. Kemudian, sasis THERMALTAKE ini memiliki ukuran 440 x 250 x 398 mm dan berat sekitar 4.5 Kg. Ditambah lagi, meskipun memiliki ukuran yang ringkas, sasis ini dibekali dengan desain manajemen kabel yang mudah. Tak hanya itu saja, sasis berukuran ringkas dari THERMALTAKE ini sudah memiliki kompatibilitas dengan liquid cooling AIO. Sasis ini sangat tepat untuk Anda yang ingin menggunakan komponen-komponen kelas atas tanpa harus membutuhkan ruang lebih. Tentu ada kelebihan lain yang ditawarkan oleh THERMALTAKE Versa H18 Window Micro Case, apa sajakah itu?', ''),
(22, 'MSI Notebook Gaming GL65 9SFK', '1', 1, 'MSI', 20999000, '5f92804687360.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">latform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Notebook</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i7</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel&reg; Core&trade; i7-9750H Processor (2.60 GHz. up to 4.50 GHz. 12M Cache)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Chipset</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel HM370</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kapasitas Penyimpanan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">512 GB SSD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">16 GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">NVIDIA GeForce RTX 2070 8GB</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ukuran Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">15.6 Inch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Resolusi Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1920 x 1080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Bluetooth</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Per-Key RGB Backlight Keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">6-Cell</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Daya Tahan Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">51 Whr</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Lain-lain</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">Intel Wi-Fi 6 AX201(2x2 ax) + BT5.1</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">Layar: IPS-Level 144Hz 45%NTSC Thin Bezel</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'MSI GL65 adalah laptop gaming bertenaga yang telah berevolusi sehingga sangat tepat untuk kebutuhan gaming terkini. Laptop ini sangat cocok untuk para gamers profesional mau pun kasual. Kemudian, tak hanya performanya yang hebat, MSI GL65 ini memiliki desain yang keren. Dengan membawa laptop ini Anda akan merasa lebih bangga. Di samping itu, laptop gaming ini dibekali dengan sebuah keyboard dari SteelSeries yang sangat nyaman dan juga ergonomis. Laptop ini hadir dengan layar 15.6 inci yang mengusung resolusi Full HD dan refresh rate 144 Hz. Ditambah lagi layarnya memiliki bezel tipis, sehingga sudut pandang yang Anda dapatkan menjadi lebih luas. Tentu ada kelebihan lain yang ditawarkan oleh MSI GL65, apa sajakah itu?', ''),
(23, 'MSI GL63 8RC - Black', '1', 1, 'MSI', 12806000, '5b18bcb7c6fb8.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">atform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Notebook</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i5</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i5-8300H Processor 2.3 GHz (up to 4.0 GHz, 8M Cache)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Chipset</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel HM370</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kapasitas Penyimpanan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1TB HDD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">4GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Max. Memori</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">32 GB</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Nvidia GeForce GTX1050 4GB</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ukuran Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">15.6 Inch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Resolusi Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1920 x 1080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Anti-Glare Display</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Networking</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Network Type</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Network Protocol</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">802.11 ac</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Bluetooth</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Antarmuka / Interface</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">1x Type-C USB3.1 Gen1</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">3x Type-A USB3.1 Gen1</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x RJ45</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x (4K @ 30Hz) HDMI</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x Mini-DisplayPort</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Standard Keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ragam Input Device</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Touchpad</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Audio</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Speaker</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kamera</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">HD type (30fps@720p)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">6-Cell</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Berat Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">2.2 kg</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Garansi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">24 Bulan dari Distributor Resmi di Indonesia</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'MSI merilis sebuah seri laptop gaming yang ditujukan untuk gamer yang tidak mau merogoh kocek lebih dalam namun masih memiliki performa mumpuni. Laptop tersebut diberi seri GL63 8RC yang memiliki layar berukuran 15.6 inci. GL63 8RC menghadirkan layar beresolusi full HD (1920 x 1080). MSI gaming laptop GL63 8RC ditenagai oleh prosesor quad-core Intel® Core™ i5-8300H berarsitektur Coffee Lake. Prosesor tersebut merupakan prosesor dengan teknologi terkini milik Intel™. Di samping itu untuk divisi GPU, laptop besutan MSI ini menggunakan kartu grafis terbaru dari NVIDIA® yakni GeForce® GTX 1050 4GB.', ''),
(24, 'THERMALTAKE Core P1 TG Mini ITX Wall-Mount Chassis', '31', 10, 'THERMALTAKE ', 1755000, '5cbec6fb0cd1e.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"height: 449px; width: 91.9028%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Kesesuaian Motherboard</td>\r\n<td style=\"width: 60.301%;\">Mini ITX</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Internal Bays</td>\r\n<td style=\"width: 60.301%;\">1 x 3.5&rsquo;&rsquo; or 2.5&rsquo;&rsquo;; 1 x 2.5&rsquo;&rsquo;</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Dimensi Produk</td>\r\n<td style=\"width: 60.301%;\">422 x 332 x 380 mm</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">External Bays</td>\r\n<td style=\"width: 60.301%;\">2 x 2.5\"</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Fitur</td>\r\n<td style=\"width: 60.301%;\">Side Panel : Tempered Glass (5mm thickness)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Sistem Pendinginan</td>\r\n<td style=\"width: 60.301%;\">\r\n<ul>\r\n<li>Fan Support : 2 x 120mm</li>\r\n<li>Radiator Support : 1 x 240mm</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Lain-lain</td>\r\n<td style=\"width: 60.301%;\">\r\n<ul>\r\n<li>I/O Port : USB 3.0 x 2 , HD Audio x 1</li>\r\n<li>PSU : Standard PS2 PSU (optional)</li>\r\n<li>Expansion Slots : 5</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 32.6467%;\">Model</td>\r\n<td style=\"width: 60.301%;\">Mini-ITX</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Thermaltake menghadirkan produk PC Case andalannya yakni Thermaltake Core P1 TG Mini ITX Wall-Mount Chassis. Produk ini ditargetkan untuk PC DIY. Core P1 TG Mini ITX menawarkan desain panel bingkai terbuka dengan panel kaca tempered setebal 5mm untuk melindungi komponen. Kaca setebal itu tapi agak transparan juga memungkinkan pengguna untuk memamerkan perangkat kerasnya di dalamnya. Apa saja kelebihan lainnya?', ''),
(25, 'Motherboard Mainboard Gigabyte B460M Aorus Pro LGA1200 DDR4 M.2 Slot', '31', 7, 'Gigabyte ', 1888997, '4c823b369cda62300538076c2ab07139 (1).jpg', '<p>Mendukung 10 Gen Intel &reg; Core &trade; Seri Prosesor</p>\r\n<p>Dual Channel Non-ECC Unbuffered DDR4, 4 DIMM</p>\r\n<p>Desain Termal Canggih dengan Heatsink yang Diperbesar</p>\r\n<p>Smart Fan 5 Menampilkan Beberapa Sensor Suhu, Header Kipas Hibrid dengan FAN STOP</p>\r\n<p>Ultra-Fast NVMe PCIe 3.0 x4 M.2 dengan Thermal Guard</p>\r\n<p>Blazing Fast Intel &reg; GbE LAN dengan cFosSpeed</p>\r\n<p>Dukungan Intel &reg; USB 3.2 Gen1 Type-C &trade;</p>\r\n<p>M.2 Slot E-key untuk Modul WIFI PCIe Dapat Di-upgrade</p>\r\n<p>Audio AMP-UP dengan ALC1200 dengan Kapasitor Audio Nichicon MW</p>\r\n<p>RGB FUSION 2.0 dengan Desain Lampu LED Beralamat Multi-Zone, Mendukung LED Beralamat Alamat &amp; Strip LED RGB</p>\r\n<p>IO Shield yang sudah dipasang sebelumnya untuk Instalasi yang Mudah dan Cepat</p>\r\n<p>Q-Flash Plus Perbarui BIOS tanpa Memasang CPU 、 Kartu Memori dan Grafik</p>\r\n<p>Intel &reg; Optane &trade; Memory Siap.</p>', 'Motherboard Mainboard Gigabyte B460M Aorus Pro LGA1200 DDR4 M.2 Slot, standar gaming', ''),
(26, 'ANYLINX Type-C to HDMI 8in1 Adapter', '3', 19, 'ANYLINX ', 699000, '607f8c0b5d9aa.jpg', '<p>8-in-1 Adapter</p>\r\n<p>Interface : USB Type-C</p>\r\n<p>Output : 2x USB 3.0; HDMI; VGA; TF Card; SD Card; PD Port; RJ45</p>\r\n<p>Tidak bisa digunakan untuk ponsel</p>\r\n<p>Unit Utama</p>\r\n<table class=\"css-14oykdy enfpb2q11\" style=\"width: 96.1431%; height: 111px;\">\r\n<tbody>\r\n<tr style=\"height: 37px;\">\r\n<td class=\"key\" style=\"width: 16.4356%; height: 37px;\">Dimensi Produk</td>\r\n<td style=\"width: 78.7315%; height: 37px;\">6.5 x 15 x 2 cm (Box)</td>\r\n</tr>\r\n<tr style=\"height: 18px;\">\r\n<td class=\"key\" style=\"width: 16.4356%; height: 18px;\">Berat Produk</td>\r\n<td style=\"width: 78.7315%; height: 18px;\">300 gram</td>\r\n</tr>\r\n<tr style=\"height: 56px;\">\r\n<td class=\"key\" style=\"width: 16.4356%; height: 56px;\">Lain-lain</td>\r\n<td style=\"width: 78.7315%; height: 56px;\">\r\n<ul>\r\n<li>Interface : USB Type-C</li>\r\n<li>Output : 2x USB 3.0, HDMI, VGA, TF Card, SD Card, PD Port, RJ45</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '8-in one adapter khusus untuk laptop atau komputer interface lengkap untuk kebutuhan transfer data anda.dengan interface tye c yang cepat dan handal', ''),
(27, 'Palit GeForce® GT 710 (1024MB GDDR5)', '31', 9, 'Palit ', 460000, '5dbfa7b5edf0a.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 100.855%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Memory Bus</td>\r\n<td style=\"width: 54.1356%;\">64 -bit</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Memory Bandwidth</td>\r\n<td style=\"width: 54.1356%;\">40 GB/Sec</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Memory Provided</td>\r\n<td style=\"width: 54.1356%;\">1GB GDDR5</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Dimensi Produk</td>\r\n<td style=\"width: 54.1356%;\">145x 69 x20.7mm</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Display Output</td>\r\n<td style=\"width: 54.1356%;\">Dual-Link DVI-D + HDMI + VGA</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Graphic Interface</td>\r\n<td style=\"width: 54.1356%;\">PCI-E 2.0 x 8</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Graphic Chipset</td>\r\n<td style=\"width: 54.1356%;\">NVIDIA GeForce GT 710</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Max. Video Resolution</td>\r\n<td style=\"width: 54.1356%;\">2048 X 1536</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 38.103%;\">Others</td>\r\n<td style=\"width: 54.1356%;\">\r\n<ul>\r\n<li>Graphics Clock:954MHz</li>\r\n<li>OpenGL : 4/5</li>\r\n<li>Height 1 Slot</li>\r\n<li>CUDA Cores: 192</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '-', ''),
(28, 'LENOVO All-in-One A340-22IWL', '30', 5, 'LENOVO ', 7299001, 'e5b12e87af0f43366549dc5ce16187e1.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>Processor: Intel Pentium Gold 5405U</p>\r\n<p>RAM: 4GB DDR4HDD: 1TB</p>\r\n<p>ODD: Slim DVDRW Rambo</p>\r\n<p>VGA: Integrated</p>\r\n<p>Konektivitas: Bluetooth + Wifi</p>\r\n<p>Ukuran Layar: 21.5 Inch LED Borderless Touch</p>\r\n<p>Sistem Operasi: Windows 10 Home</p>\r\n<p>LENOVO All-in-One A340-22IWL</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'LENOVO All-in-One A340-22IWL Komputer all in one compact cocok untuk digunakan diperkantoran dan untuk penggunaan pribadi spesifikasi mainstream dan sdh terinstall windows 10.', ''),
(29, 'ASUS All-in-One V222GAK-BA141T', '30', 5, 'ASUS ', 5499000, '601d4beedc441.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 100.81%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Platform</td>\r\n<td style=\"width: 60.2121%;\">Desktop All in One</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Chassis Form Factor</td>\r\n<td style=\"width: 60.2121%;\">All in one design</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Tipe Prosesor</td>\r\n<td style=\"width: 60.2121%;\">Intel Celeron</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Processor Onboard</td>\r\n<td style=\"width: 60.2121%;\">Intel&reg; Celeron&reg; Processor J4005 (4M Cache, 2.00 GHz)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Memori Standar</td>\r\n<td style=\"width: 60.2121%;\">4GB DDR4</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Hard Drive</td>\r\n<td style=\"width: 60.2121%;\">1TB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Tipe Grafis</td>\r\n<td style=\"width: 60.2121%;\">Intel HD Graphics</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Networking</td>\r\n<td style=\"width: 60.2121%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Kecepatan Jaringan</td>\r\n<td style=\"width: 60.2121%;\">10/100/1000 Mbps</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Antarmuka / Interface</td>\r\n<td style=\"width: 60.2121%;\">\r\n<ul>\r\n<li>4 x USB 3.1 Gen 1</li>\r\n<li>1 x USB2.0</li>\r\n<li>1 x LAN</li>\r\n<li>1 x HDMI out</li>\r\n<li>1 x Microphone / Headphone Combo Jack</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Keyboard</td>\r\n<td style=\"width: 60.2121%;\">Wired Keyboard</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Ragam Input Device</td>\r\n<td style=\"width: 60.2121%;\">Wired Mouse</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Audio</td>\r\n<td style=\"width: 60.2121%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Speaker</td>\r\n<td style=\"width: 60.2121%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Monitor</td>\r\n<td style=\"width: 60.2121%;\">21.5 Inch</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Layar Sentuh</td>\r\n<td style=\"width: 60.2121%;\">Tidak</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Sistem Operasi</td>\r\n<td style=\"width: 60.2121%;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Berat Produk</td>\r\n<td style=\"width: 60.2121%;\">4.8 kg</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Dimensi Produk</td>\r\n<td style=\"width: 60.2121%;\">48.9 x 38.7 x 5.1 - 16.4 cm</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Daya / Power</td>\r\n<td style=\"width: 60.2121%;\">65 W AC power adapter</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 34.2526%;\">Lain-lain</td>\r\n<td style=\"width: 60.2121%;\">\r\n<ul>\r\n<li>Wifi</li>\r\n<li>Bluetooth</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ASUS Vivo AiO V222 merupakan komputer desktop yang tak hanya memberikan performa terbaik untuk kebutuhan komputasi harian, namun juga sudut pandang yang lebih luas. Desktop all-in-one dari ASUS ini sangat tepat untuk kebutuhan perkantoran agar produktivitas dapat meningkat. Kemudian, ASUS Vivo AiO V222 memiliki desain yang ramping dan berat yang ringan yakni sekitar 4.64 Kg. Selain itu, desktop all-in-one dari ASUS ini tampil dengan desain bezel NanoEdge yang memiliki rasio layar ke bodi 87%. Tak hanya itu saja, layar ASUS Vivo AiO V222 ini hadir dengan palet warna 100% sRGB dan teknologi ASUS Splendid untuk memastikan warna yang akurat. Tentu ada kelebihan lain yang ditawarkan oleh ASUS Vivo AiO V222, apa sajakah itu?', '');
INSERT INTO `product` (`id`, `nama`, `Kategori`, `sub_kategori`, `brand`, `harga`, `gambar`, `spesifikasi`, `deskripsi`, `tanggal`) VALUES
(30, 'ACER All-in-One Aspire Z20-780', '1', 1, 'ACER ', 7600001, '5a4b382139866.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 101.417%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Processor Onboard</td>\r\n<td style=\"width: 69.5195%;\">Intel&reg; Core&trade; i3-6100U Processor (2.30 GHz, 3M Cache)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Optical Drive</td>\r\n<td style=\"width: 69.5195%;\">DVD-RW</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Networking</td>\r\n<td style=\"width: 69.5195%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Garansi</td>\r\n<td style=\"width: 69.5195%;\">12 bulan</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Monitor</td>\r\n<td style=\"width: 69.5195%;\">19.5 Inch</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Memori Standar</td>\r\n<td style=\"width: 69.5195%;\">4gb ddr4</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Kapasitas Harddisk</td>\r\n<td style=\"width: 69.5195%;\">1500 GB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Layar Sentuh</td>\r\n<td style=\"width: 69.5195%;\">Tidak</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Tipe Prosesor</td>\r\n<td style=\"width: 69.5195%;\">Intel Core i3</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Hard Drive</td>\r\n<td style=\"width: 69.5195%;\">500GB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Tipe Grafis</td>\r\n<td style=\"width: 69.5195%;\">Intel HD Graphics</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Memori / RAM</td>\r\n<td style=\"width: 69.5195%;\">4 GB</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Sistem Operasi</td>\r\n<td style=\"width: 69.5195%;\">Windows 10</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 24.8581%;\">Platform</td>\r\n<td style=\"width: 69.5195%;\">Desktop All in One</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'engan Acer Aspire Z20-780 Anda bisa mendapatkan performa Desktop dan menghemat banyak ruang di meja kerja secara bersamaan. Semua komponen, seperti monitor, perangkat keras ala Desktop, dan konektivitas dimasukan ke dalam satu tempat sehingga terasa lebih praktis karena hanya tinggal colokan Mouse dan Keyboard saja. Acer Z20-780 menawarkan layar Full HD seluas 19.5 Inch. Layar LCD berteknologi LED Backlight membuat gambar terlihat tajam, cerah, dan juga jelas. Acer Aspire Z20-780 dilengkapi Kickstand ergonomis berpenampilan mewah. Anda dapat menyesuaikan kemiringan layar mulai dari -5 hingga 30 derajat.', ''),
(31, 'ACER Aspire C24-960 (Core i5-10210U)', '30', 5, 'ACER ', 10848000, '5f0ff632f2d0c.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 101.012%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Platform</td>\r\n<td style=\"width: 71.0869%;\">Desktop All in One</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Chassis Form Factor</td>\r\n<td style=\"width: 71.0869%;\">All-in-One</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Tipe Prosesor</td>\r\n<td style=\"width: 71.0869%;\">Intel Core i5</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Processor Onboard</td>\r\n<td style=\"width: 71.0869%;\">Intel&reg; Core&trade; i5-10210U Processor (6M Cache, up to 4.10 GHz)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Memori Standar</td>\r\n<td style=\"width: 71.0869%;\">4GB DDR4</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Hard Drive</td>\r\n<td style=\"width: 71.0869%;\">1TB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Tipe Grafis</td>\r\n<td style=\"width: 71.0869%;\">Intel UHD Graphics</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Networking</td>\r\n<td style=\"width: 71.0869%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Antarmuka / Interface</td>\r\n<td style=\"width: 71.0869%;\">4x USB 3.1 Gen1</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Keyboard</td>\r\n<td style=\"width: 71.0869%;\">Wired Keyboard</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Ragam Input Device</td>\r\n<td style=\"width: 71.0869%;\">Wired Mouse</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Kamera</td>\r\n<td style=\"width: 71.0869%;\">1 MP HD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Audio</td>\r\n<td style=\"width: 71.0869%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Monitor</td>\r\n<td style=\"width: 71.0869%;\">23.8 Inch</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Layar Sentuh</td>\r\n<td style=\"width: 71.0869%;\">Tidak</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Sistem Operasi</td>\r\n<td style=\"width: 71.0869%;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Daya / Power</td>\r\n<td style=\"width: 71.0869%;\">65 W</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 23.84%;\">Lain-lain</td>\r\n<td style=\"width: 71.0869%;\">\r\n<ul>\r\n<li>Wifi</li>\r\n<li>Bluetooth 4.0 LE</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ACER Aspire C24-960 merupakan desktop AiO bertenaga yang tak hanya mendukung komputasi harian Anda, namun juga memiliki desain yang elegan. Desktop AiO dari ACER ini sangat cocok untuk kebutuhan perkantoran agar produktivitas tetap terjaga. Kemudian, desktop AiO ACER Aspire C24-960 ini memiliki layar 23.8 inci dengan resolusi HD yang memungkinkan Anda mendapatkan visual yang luas. Tak hanya itu saja, bezel tipis dengan rasio bodi ke layar hingga 92% membuat Anda mendapatkan sudut pandang yang lebih memuaskan. Desktop ini tak hanya memiliki bobot yang hanya 3 Kg sehingga Anda dapat dengan lebih mudah memindahkan desktop AiO ini. Tentu ada kelebihan lain yang ditawarkan oleh desktop AiO ACER Aspire C24-960, apa sajakah itu?', ''),
(32, 'SANDISK SSD Plus 120GB', '31', 20, 'SANDISK ', 519000, 'e3c96327487ad1c94f4526e35a0e531e.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>Kapasitas : 120GB</p>\r\n<p>Solid State</p>\r\n<p>Interface : SATA III</p>\r\n<p>Form Factor : 2.5 Inch</p>\r\n<p>Unit Utama</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tingkatkan performa dari perangkat komputer desktop atau laptop Anda dengan menggunakan solid state drive SanDisk SSD Plus yang cepat dan handal serta telah dipercaya oleh banyak penggunanya di seluruh dunia. Perangkat ini dibekali dengan hasil rancangan luar biasa yang memungkinkannya untuk dapat menyajikan kecepatan baca sekuensial tinggi mencapai 530MB/s dan kecepatan tulis sekuensial mencapai 310MB/s sehingga pengalaman komputasi yang Anda dapatkan akan menjadi semakin luar biasa hingga 20 kali lebih cepat dibandingkan hard disk drive pada umumnya. Komputer lama milik Anda juga akan terasa lebih cepat layaknya mesin baru dengan proses boot-up, shutdown, dan respon aplikasi yang lebih cepat.', ''),
(33, 'WD Blue SSD SATA 1TB WDS100T1B0A', '31', 20, 'WD ', 4810000, '59912a7aeb315.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"height: 86px; width: 97.9104%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 25.7018%;\">Kecepatan Tulis</td>\r\n<td style=\"width: 71.3956%;\">525 MB/s</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 25.7018%;\">Kapasitas</td>\r\n<td style=\"width: 71.3956%;\">1TB</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 25.7018%;\">Antarmuka / Interface</td>\r\n<td style=\"width: 71.3956%;\">SATA III 6Gb/s</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 25.7018%;\">Kecepatan Baca</td>\r\n<td style=\"width: 71.3956%;\">545 MB/s</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'SSD WD Blue dirancang untuk konsumen yang membutuhkan peningkatan performa di PC-nya. SSD ini dioptimalkan untuk pengguna yang terbiasa bekerja dengan banyak aplikasi dalam waktu bersamaan atau menggunakan aplikasi kelas berat, seperti aplikasi pemrograman, desain grafis, dan termasuk Game. WD Blue SSD SATA tersedia dalam pilihan kapasitas 250GB, 500GB, dan 1TB. SSD ini hadir dalam dua varian Form Factor yaitu 2.5 Inch/7mm dan M.2 2280. SSD ini cocok untuk Upgrade performa Notebook atau Desktop.', ''),
(34, 'SEAGATE 1TB BarraCuda 120 SSD', '31', 20, 'SEAGATE ', 1537000, '66a1ebc9fc4e924f9686a7aa8999f2d3.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>apacity : 1TB</p>\r\n<p>Form Factor : SSD 2.5 Inch</p>\r\n<p>Interface : SATA III (6 Gb/s)</p>\r\n<p>Memory Flash NAND : 3D TLC</p>\r\n<p>Read up to 560 MB/s</p>\r\n<p>Write up to 540 MB/s</p>\r\n<p>Unit Utama</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '-', ''),
(35, 'CORSAIR Mac Memory 4GB DDR3 CMSA4GX3M1A1333C9', '31', 8, 'CORSAIR ', 450000, '23e86c51af5817f39b8ff98712a97b39.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>4GB, DDR3,</p>\r\n<p>1333MHz,</p>\r\n<p>Mac Memory</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '-', ''),
(36, 'TEAMGROUP ELITE SODIM 4GB 1600 DDR3L 1.35V BLACK', '31', 8, 'TEAMGROUP ', 390000, '6e17b7130626709253cb1a14a1ded760.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">Team Memory Notebook DDR3L 4GB 1600Mhz ( 12800 ) 1.35V<br />* FEATURES<br />Adherence to JEDEC and compliance to RoHS with respect to environmental protection regulation, production and manufacturing<br />Strict test and verification procedures are performed for products<br />Lifetime warranty<br /><br />* Product Specifications<br />Product Dimensions 67.6 x 30 mm<br />CAS Latency : DDR3 1600: CL11-11-11-28<br />DRAM Density : 128x8 / 256x8 / 512x8<br />DataTransfer Bandwidth : DDR3 1600: 12,800MB/s (PC3 12800)<br />Capacity : DDR3L 1600: 4GB<br />Tested Voltage 1.35V<br />Warranty Lifetime warranty&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'CAS Latency : DDR3 1600: CL11-11-11-28\r\nDRAM Density : 128x8 / 256x8 / 512x8 ', ''),
(37, 'LENOVO PC DESKTOP V530-2000', '30', 6, 'LENOVO ', 9630500, '1fb489652091f8b47d559b15e3c1d383.jpg', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>PROCESSOR : INTEL CORE I5-9400</p>\r\n<p>MEMORY : 8GB DDR4</p>\r\n<p>HDD : 1TB</p>\r\n<p>ODD : DVD</p>\r\n<p>VGA : INTEL HD</p>\r\n<p>OS : WIN 10H</p>\r\n<p>DISPLAY : 19.5\" E2054</p>\r\n<p>WARRANTY : 2Yr</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'komputer build in standar lenovo tidak perlu merakit.', ''),
(38, 'REXUS Mouse Gaming RX-G10', '3', 13, 'REXUS ', 101000, '5c94675b2e429.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 100.215%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Lain-lain</td>\r\n<td style=\"width: 67.7128%;\">\r\n<ul>\r\n<li>Kecepatan Rata - rata per Frame : 4000 Fps</li>\r\n<li>Kecepatan Gerak : 30 lps</li>\r\n<li>Tingkat Polling : 125 Hz</li>\r\n<li>LED : 5 mode pencahayaan</li>\r\n<li>Panjang Kabel : 1.75 m</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Dots Per Inch (DPI)</td>\r\n<td style=\"width: 67.7128%;\">800 &ndash; 3200 DPI</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Dimensi Produk</td>\r\n<td style=\"width: 67.7128%;\">130 x 65 x 40 mm</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Konektivitas</td>\r\n<td style=\"width: 67.7128%;\">USB</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Jumlah Tombol</td>\r\n<td style=\"width: 67.7128%;\">6 Buah Tombol</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 26.1711%;\">Kesesuaian Sistem</td>\r\n<td style=\"width: 67.7128%;\">Win7/ Win8/ Win 10/ Window Vista/ Window XP</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Mouse Gaming murah dari rexus cocok untuk gaming low budget dengan fitur melimpah.', ''),
(39, 'GAMEN Keyboard Gaming Rainbow Backlight GK100', '3', 12, 'GAMEN ', 147000, '5fa1037f82dde.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 99.5026%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 20.9279%;\">Fitur</td>\r\n<td style=\"width: 74.1813%;\">\r\n<ul>\r\n<li>1. Desain membrane tipis dan daya pantul yang kuat</li>\r\n<li>2. Keycaps 104 tombol dengan bahan ABS</li>\r\n<li>3. Dapat menekan 19 tombol secara bersamaan tanpa freezing</li>\r\n<li>4. Rainbow backlight yang keren, cahaya dapat disesuaikan</li>\r\n<li>5. Kombinasi tombol multimedia yang banyak</li>\r\n<li>6. Dengan design waterproof</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 20.9279%;\">Kelengkapan Paket</td>\r\n<td style=\"width: 74.1813%;\">1x keyboard Gaming</td>\r\n</tr>\r\n</tbody>\r\n</table>', '-', ''),
(40, 'THERMALTAKE Level 20 RGB Cherry MX Blue Gaming Keyboard', '3', 12, 'THERMALTAKE ', 2215000, '5cda27c6debe7.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 101.518%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">N-Key Rollover (NKRO)</td>\r\n<td style=\"width: 77.5659%;\">100% anti-ghosting</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Switch</td>\r\n<td style=\"width: 77.5659%;\">Cherry&reg; MX Blue Mechanical</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Berat Produk</td>\r\n<td style=\"width: 77.5659%;\">1.5 Kg</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Fitur</td>\r\n<td style=\"width: 77.5659%;\">\r\n<ul>\r\n<li>Aluminum Top Plate Construction</li>\r\n<li>3-Side RGB Customization for Unlimited Possibilities</li>\r\n<li>Multimedia Keys</li>\r\n<li>Audio &amp; USB Pass Through Port</li>\r\n<li>Customize with iTake Gaming Engine</li>\r\n<li>Dedicated iOS &amp; Android Compatible App</li>\r\n<li>6 Game Profiles</li>\r\n<li>TT TGB Plus Compatible</li>\r\n<li>Works with Razer Chroma</li>\r\n<li>Works with Amazon Alexa</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Lain-lain</td>\r\n<td style=\"width: 77.5659%;\">\r\n<ul>\r\n<li>Graphical UI</li>\r\n<li>On-Board Memory Size : 4M Bit</li>\r\n<li>Polling Rate : 1000 HZ</li>\r\n<li>16.8 Million RGB Colors</li>\r\n<li>Braided Cable</li>\r\n<li>1.8m Cable Length</li>\r\n<li>Actuation Point : RGB BLUE : 2.2 &plusmn; 0.6 MM</li>\r\n<li>Key Stroke : RGB BLUE : 4 - 0.5 MM</li>\r\n<li>Actuation Force : 50g(BLUE) with Optimized Tactile Feel</li>\r\n<li>Key LifeSpan : 50 Million Clicks Lifetime</li>\r\n<li>13 dynamic lighting effects (front side) | 14 dynamic lighting effects from (side face)</li>\r\n<li>5 pre-configured lighting zones FPS1, FPS2, MMO, MOBA and RTS</li>\r\n<li>On-the-fly macro recording</li>\r\n<li>Full keyboard &amp; disable windows lock function for unintentional command and easy cleaning</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Konektivitas</td>\r\n<td style=\"width: 77.5659%;\">USB</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 18.8095%;\">Dimensi Produk</td>\r\n<td style=\"width: 77.5659%;\">48.2 x 18.5 x 4.39 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Thermaltake merupakan produsen aksesori dan perangkat keras komputer yang sudah dikenal dikalangan gamers dan juga modders. Hal ini karena Thermaltake selalu memberikan kualitas terbaik pada produk-produknya. Salah satu produk terbaiknya adalah Thermaltake Level 20 Gaming Keyboard. Thermaltake Level 20 Gaming Keyboard merupakan keyboard mekanik yang hadir dengan plat atas premium yang terbuat dari alumunium. Selain itu, keyboard mekanik besutan Thermaltake ini dilengkapi dengan LED RGB dengan 16.8 juta warna yang dapat Anda kostumisasi. Keyboard mekanik ini memiliki kompatibilitas dengan beberapa produk Thermaltake seperti Thermaltake PSU TT RGB PLUS, pendingin liquid, kipas casing, dan juga lampu strip LED.', ''),
(41, 'ASUS Notebook A409FA-BV311T', '1', 3, 'ASUS ', 8050680, 'e751b1e610ddbdb1c5337cd06ff6b4bc.jpg', '<p>&nbsp;</p>\r\n<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>PlatformNotebookTipe ProsesorIntel Core i3Processor OnboardIntel&reg; Core&trade; i3-8145U Processor ( 2.10 GHz . up to 3.90 GHz. 4M Cache)Kapasitas Penyimpanan1 TB HDDMemori Standar4 GB RAMUkuran Layar14 InchResolusi Layar1366 x 768Wireless Network Protocol802.11 acWireless BluetoothIntegratedAntarmuka / Interface</p>\r\n<ul>\r\n<li>1 x COMBO audio jack</li>\r\n<li>1 x Type-C USB 3.0 (USB 3.1 Gen 1)</li>\r\n<li>1 x USB 3.0 port(s) Type A</li>\r\n<li>2 x USB 2.0 port(s)</li>\r\n<li>1 x HDMI</li>\r\n<li>Multi-format card readerKeyboardChiclet KeyboardSpeakerIntegratedKameraVGAWebcamSistem OperasiMicrosoft Windows 10 HomeBaterai2 CellDaya Tahan Baterai32 WhDimensi (PTL)325 x 216 x 22.9 mmBerat Produk1.5 Kg</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Asus VivoBook A409 adalah laptop yang tepat untuk bekerja dan bermain. Laptop ini dibekali Intel Core generasi terbaru sehingga cocok menangani tugas multitasking. Layar NanoEdge punya bezel tipis di sisi kanan dan kiri. Gambar akan terlihat lebih luas dan dimensi laptop lebih ringkas. Laptop Asus ini punya berat 1.5 kg (tergantung tipe) sehingga nyaman dibawa kemana saja. Audio laptop sudah didukung ASUS SonicMaster dan codec tingkat profesional, suara jadi jernih dan bass lebih mantap. Laptop Asus VivoBook A409 memiliki baterai yang 3x lebih tahan lama dibanding baterai lithium-ion standar. Baterainya juga bisa diisi cepat dengan Fast Charge. Isi baterai 60% hanya cukup 49 menit saja. Berikut ini keunggulan laptop Asus VivoBook A409.', ''),
(42, 'Asus Notebook A416JA-EK501TS', '1', 3, 'Asus ', 11999901, '8dc048a7d20316ff422162f01961ef0f.png', '<table style=\"border-collapse: collapse; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 98.5293%;\">\r\n<p>Spesifikasi:</p>\r\n<p>- Layar 14.0\" (16:9) LED-backlit FHD (1920x1080) 60Hz Anti-Glare Panel with 45% NTSC with wide 178&deg; viewing angles</p>\r\n<p>- Prosesor Intel Core i5-1035G1 quad-core (8 thread) 1,0GHz TurboBoost 3,6GHz</p>\r\n<p>- Chipset Intel</p>\r\n<p>- Grafis Intel UHD G1</p>\r\n<p>- Memori RAM 4GB DDR4, upgradeable to 16GB DDR4</p>\r\n<p>- Storage 1TB HDD</p>\r\n<p>- Konektifitas WiFi 802.11ac, Bluetooth 4.2, Port USB 3.1 Gen 1, Port USB 3.1 Gen 1 Type-C, Port USB 2.0, Port HDMI, card reader, combo audio jack</p>\r\n<p>- 2 x 2W dual speaker stereo, ICEpower, SonicMaster Audio</p>\r\n<p>- Kamera webcam dengan resolusi VGA</p>\r\n<p>- Baterai 3 Cell 42WHr lithium-ion Battery, fast charging 60% dalam 49 menit</p>\r\n<p>- Sistem Operasi Microsoft Windows 10 Home x64 Asli + Microsoft Office</p>\r\n<p>- Dimensi 325 x 216 x 22.9 mm berat 1,4 kilogram</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Performa yang ditawarkan oleh laptop cantik Asus A409JA cukup kompeten menangani aneka tugas sekolah, kuliah maupun komputasi menengah harian karena mengandalkan dukungan prosesor Intel Core i3-1005G1 dual-core (4 thread) generasi Ice Lake atau Intel Core generasi ke-10 yang berlari dengan kecepatan standar 1,2GHz dan TurboBoost hingga 3,4GHz. Laptop entry-level Asus A409JA ini diperkuat oleh memori RAM sebesar 4GB DDR4 yang masih dapat di-upgrade hingga maksimal 16GB sesuai kebutuhan pengguna.', ''),
(43, 'DELL Inspiron 3471 (Core i3-9100 Win10 Pro)', '30', 6, 'DELL', 12595000, '1fb489652091f8b47d559b15e3c1d383.jpg', '<table class=\"css-14oykdy enfpb2q11\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\">Platform</td>\r\n<td>Desktop PC</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Chassis Form Factor</td>\r\n<td>Tower</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Tipe Prosesor</td>\r\n<td>Intel Core i3</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Processor Onboard</td>\r\n<td>Intel Core i3-9100 Processor (3.60 GHz up to 4.20 GHz, 6M Cache)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Memori Standar</td>\r\n<td>4GB DDR4</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Hard Drive</td>\r\n<td>1 TB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Tipe Grafis</td>\r\n<td>Intel Graphics</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Networking</td>\r\n<td>Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Keyboard</td>\r\n<td>USB Keyboard</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Ragam Input Device</td>\r\n<td>USB Mouse</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Monitor</td>\r\n<td>19.5 Inch</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Sistem Operasi</td>\r\n<td>Microsoft Windows 10 Pro</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\">Lain-lain</td>\r\n<td>\r\n<ul>\r\n<li>Rear: 4x USB 2.0, Network Port, Line in/out, Microphone Port, VGA(1), HDMI out (1)</li>\r\n<li>Front: 2x USB 3.0, 5:1 MCR, Audio Combo Jack</li>\r\n<li>Expansion Slot: 1 PCIe x1(HH), 1 PCIe x16(HH)</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Apakah Anda sedang mencari sebuah komputer desktop dengan ukuran ringkas yang tidak banyak memakan tempat? DELL Inspiron 3471 adalah jawaban paling tepat. Tak hanya ringkas, desain modern dan minimalis yang ditampilkan oleh DELL Inspiron 3471 bisa menjadi sebuah mesin yang nampak sleek di meja kerja atau meja komputer Anda. Kinerja komputer desktop DELL Inspiron 3471 ini didukung oleh prosesor Intel Core generasi kesembilan (tersedia dalam varian Intel Core i3-9100 dengan 4 core (4 thread) dan kecepatan clock dasar 4.2 GHz, Intel Core i5-9400 dengan 6 core (6 thread) dan kecepatan clock dasar 4.1 GHz, dan juga Intel Core i7-9700 dengan 8 core (8 thread) dan kecepatan clock 4.7 GHz) yang sangat mumpuni untuk menjalankan berbagai skenario. Tentu ada kelebihan yang ditawarkan oleh DELL Inspiron 3471, apa sajakah itu?', ''),
(44, 'ACER Veriton VM4662 ', '30', 6, 'Acer', 17400000, '5c9d88950ef9c.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"width: 101.417%;\">\r\n<tbody>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Platform</td>\r\n<td style=\"width: 74.182%;\">Desktop PC</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Chassis Form Factor</td>\r\n<td style=\"width: 74.182%;\">Tower</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Tipe Prosesor</td>\r\n<td style=\"width: 74.182%;\">Intel Core i7</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Processor Onboard</td>\r\n<td style=\"width: 74.182%;\">Intel&reg; Core&trade; i7-8700 Processor (3.20 GHz, up to 4.60 GHz. 12M Cache)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Memori Standar</td>\r\n<td style=\"width: 74.182%;\">8GB DDR4</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Hard Drive</td>\r\n<td style=\"width: 74.182%;\">1TB HDD</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Optical Drive</td>\r\n<td style=\"width: 74.182%;\">DVD&plusmn;RW</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Tipe Grafis</td>\r\n<td style=\"width: 74.182%;\">Intel Graphics</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Networking</td>\r\n<td style=\"width: 74.182%;\">Dual LAN</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Audio</td>\r\n<td style=\"width: 74.182%;\">Integrated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Monitor</td>\r\n<td style=\"width: 74.182%;\">21.5 Inch</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Layar Sentuh</td>\r\n<td style=\"width: 74.182%;\">Tidak</td>\r\n</tr>\r\n<tr>\r\n<td class=\"key\" style=\"width: 21.1738%;\">Sistem Operasi</td>\r\n<td style=\"width: 74.182%;\">Windows 10 Pro Education (Hanya untuk Pendidikan)</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ACER Veriton M merupakan PC desktop yang tak hanya memiliki performa yang mumpuni untuk segala skenario, namun juga tampilan yang elegan berkat ventilasi. Kinerja PC desktop ini didukung oleh prosesor Intel Core i7-8700 dengan 6 core dan 12 thread serta kecepatan clock dasar 3.2 GHz yang bisa ditingkatkan hingga mencapai 4.6 GHz. Di samping itu, dengan media penyimpanan hard disk berkapasitas 1 TB, Anda diberikan keleluasaan dalam menginstal aplikasi dan juga menyimpan dokumen. Selain itu, PC desktop dari ACER ini dibekali dengan memori RAM 4 GB DDR4 yang menyuguhkan kinerja komputasi terbaik. Penasaran dengan kelebihan yang dimiliki oleh ACER Veriton M? Berikut penjelasannya.', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `slider` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `slider`
--

INSERT INTO `slider` (`id`, `nama`, `slider`, `status`, `created`) VALUES
(2, 'baner', 'banner1.png', 0, '2021-05-25 09:31:22'),
(3, 'baner 2', 'banner2.png', 0, '2021-05-25 09:31:54'),
(4, 'baner 3', 'banner3.png', 0, '2021-05-25 09:32:23'),
(12, 'slider 1', 'img4.png', 0, '2021-05-25 17:55:15'),
(15, 'baner 1 update', 'Tampilan 1.png', 1, ''),
(16, 'baner 2 update', 'Tampilan 2.jpg', 1, ''),
(17, 'banner 3 update', 'Tampilan 3.png', 1, ''),
(18, 'Harbolnas', 'Tampilan 5.png', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `sub_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sub_kategori`
--

INSERT INTO `sub_kategori` (`id`, `id_kategori`, `sub_kategori`) VALUES
(1, 1, 'Laptop Gaming'),
(2, 1, 'Laptop Convertible'),
(3, 1, 'Laptop Standar'),
(5, 30, 'All in one'),
(6, 30, 'Build in'),
(7, 31, 'Motherboard'),
(8, 31, 'Ram'),
(9, 31, 'Vga'),
(10, 31, 'Computer Case'),
(11, 31, 'Fan'),
(12, 3, 'Keyboard'),
(13, 3, 'Mouse'),
(14, 3, 'WebCam'),
(15, 3, 'Headset'),
(19, 3, 'kabel dan konektor'),
(20, 31, 'storage');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `email`, `password`) VALUES
(1, 'admin(primary)', 'admin', 'mcuAdmin@mcu.com', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'yogie prayoga', 'yogie3536', 'yogie.prayoga35@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a'),
(4, 'dwi arjunas', 'dwi99', 'dwi913555@gmail.com', 'c163f74e0af2dc4803076d9018bcd26a');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_produk_diskon`
--
ALTER TABLE `list_produk_diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `list_produk_diskon`
--
ALTER TABLE `list_produk_diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
