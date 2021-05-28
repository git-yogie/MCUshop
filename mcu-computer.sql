-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Bulan Mei 2021 pada 08.35
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
  `id_jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'Komputer All in one'),
(3, 'aksesoris komputer'),
(10, 'pheriperal komputer'),
(28, 'Tablet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `pemesan_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_pesan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `Kategori` varchar(255) NOT NULL,
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

INSERT INTO `product` (`id`, `nama`, `Kategori`, `brand`, `harga`, `gambar`, `spesifikasi`, `deskripsi`, `tanggal`) VALUES
(3, 'ASUS ROG Strix G G512LI-I565B6T', '1', 'Asus', 16940000, '5efac19ed72fb.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Platform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Notebook</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i5</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i5-10300H Processor (8M Cache, up to 4.50 GHz)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kapasitas Penyimpanan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">512 GB SSD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">8GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">NVIDIA GeForce GTX 1650 Ti 4GB GDDR6</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ukuran Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">15.6\" Full HD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Resolusi Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1920 x 1080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Network Type</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Bluetooth</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Antarmuka / Interface</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">3x USB3.2 Gen 1 Type-A</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1X USB3.2 Gen2 Type-C (support Display Port)</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x LAN RJ-45 jack</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x HDMI 2.0b</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1x Audio combo jack: Mic-in and Head phone</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Backlit keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ragam Input Device</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Touchpad</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Audio</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Speaker</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">3 Cell</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Daya Tahan Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">48WHrs</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Lain-lain</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">144Hz Screen</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ASUS ROG Strix G adalah laptop gaming yang tak hanya memiliki performa yang sangat mendukung kebutuhan gaming terkini, namun juga tampil dengan desain yang keren dan juga futuristik.', '2021-05-24'),
(4, 'HP 240 G8', '1', 'HP', 7754998, 'b39d0079ef707db593ac5656bb521589.png', '', 'HP 240 G adalah laptop bisnis HP seri Essential yang mendukung aktivitas Anda sehari-hari. Laptop ini punya dimensi lebih tipis dan ringan dibanding model sebelumnya. Bodi yang tangguh melindungi laptop HP ini dari kerasnya lingkungan luar.', '2021-05-24'),
(5, 'HP Notebook 14s-dq2518TU', '1', 'HP', 5599000, '607965a16f5dd.jpg', ' <tr>\r\n                           <td class=\"label\">Platform</td>\r\n                           <td class=\"harga\">Notebook</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Prosesor</td>\r\n                           <td>intel celeron 6305U</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Ram</td>\r\n                           <td>4 GB DDR 3</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Layar</td>\r\n                           <td>14 inc</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">storage</td>\r\n                           <td>512 GB SSD</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Operating System</td>\r\n                           <td>Windows 10 Home + office student</td>\r\n                       </tr>', 'HP NoteBook 14s cocok bagi kamu yang masih sekolah atau kuliah di pembeliannya sudah include windows 10 home dan office home student membuat laptop ini sangat cocok untuk anak sekolah hingga pegawai kantoran biasa dan didukung dengan performa mumpuni dan penyimpanan SSD yang besar.', '2021-05-24'),
(6, 'ASUS ZenBook Flip 14 UM462DA-AI501TS', '1', 'Asus', 11799000, '6007d152074e3.jpg', '<p>PlatformNotebook - convertibleProsesorAMD Ryzen 5 3500URam8GB DDR4Layar14 incstorage512 GB SSDOperating SystemWindows 10 Home</p>', 'ASUS ZenBook Flip 14 UM462DA merupakan laptop bertenaga yang menggabungkan keserbagunaan dengan mobilitas tertinggi. Laptop ini sangat cocok untuk meningkatkan produktivitas Anda di mana saja dan kapan saja laptop ini mendukung 3 mode laptop, stand, dan table dengan layar sentuh yang responsive dan beresolusi tinggi dengan panel ips dengan dukungan hingga 10 jari akan memudahkan anda dalam melakukan kegiatan seperti multimedia,persentasi, dan membuat pekerjaan kantor.', '2021-05-24'),
(7, 'ACER Swift 3 SF313-51', '1', 'Acer', 7499000, '5c8b12424c994.jpg', ' <tr>\r\n                           <td class=\"label\">Platform</td>\r\n                           <td class=\"harga\">Notebook</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Prosesor</td>\r\n                           <td>Intel® Core™ i3-8130U Processor (2.20 GHz. up to 3.40 GHz. 4M Cache)</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Ram</td>\r\n                           <td>4 GB DDR4</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Layar</td>\r\n                           <td>13.5 inc</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">storage</td>\r\n                           <td>256GB SSD</td>\r\n                       </tr>\r\n                       <tr>\r\n                           <td class=\"label\">Operating System</td>\r\n                           <td>Windows 10 Home</td>\r\n                       </tr>', 'Acer Swift 3 dirancang untuk Anda yang dinamis dan aktif. Laptop ini punya kemampuan multitasking mumpuni. Swift 3 didukung spesifikasi canggih seperti RAM DDR4, processor Intel Core generasi ke-8, dan storage jenis SSD', '2021-05-24'),
(8, 'ACER Spin 3 SP314-51', '1', 'Acer', 10191000, '5c8b12424c994.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Platform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Notebook</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Core i5</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel&reg; Core&trade; i5-8250U Processor (1.60 GHz, Up to 3.40 GHz, 6M Cache)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kapasitas Penyimpanan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1TB HDD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">8GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel UHD Graphics</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ukuran Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">14 Inch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Resolusi Layar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1920 x 1080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Network Type</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Network Protocol</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">802.11 ac</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Wireless Bluetooth</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Antarmuka / Interface</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">USB 3.0</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">USB 2.0</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">HDMI</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Standard Keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ragam Input Device</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Touch Pad</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Audio</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Speaker</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Microsoft Windows 10</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Baterai</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">3 Cell</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Dimensi (PTL)</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">335 mm x 235 mm x 22.5 mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Berat Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1.70 kg</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Acer Spin 3 dirancang untuk Anda yang sangat aktif. Laptop ini punya ukuran ringkas dan bisa dipakai dalam 4 mode, yaitu: laptop mode, tablet model, tent mode, dan display mode cocok untuk anda yang membutuhkan laptop dengan mobilitas tinggi.', '2021-05-24'),
(11, 'Mouse Wireless Logitech', '3', 'Logitech', 165000, '94470725614a19b70905f99106be515f.jpeg', '2.4 GHz Wireless Technology Mouse Nano-receiver 10m Wireless range\r\n                            ', 'Mouse Wireless Logitech cocok untuk kantor dan penggunaan personal computer.', '2021-05-24'),
(16, 'RAZER Cynosa V2 Gaming Keyboard with Razer Chroma RGB', '3', 'Razer', 799000, '607d496f4bfee.jpg', '<ul>\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Gaming Keyboard</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Switch : Soft cushioned gaming-grade keys</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Razer Chroma&trade; backlighting with 16.8 million customizable color options</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">10 key roll-over with anti-ghosting</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Fully programmable keys with on-the-fly macro recording</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Spill-resistant durable design</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Gaming mode option</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">1000Hz Ultrapolling</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word; color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff;\">Unit Utama</li>\r\n</ul>', 'Razer adlah brand blalalal', '2021-05-24'),
(17, 'ASUS All-in-One V222GAK-BA141T', '2', 'Asus', 5499000, '601d4beedc441.jpg', '<table class=\"css-14oykdy enfpb2q11\" style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'Helvetica Neue\', Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\'; font-size: 14px; background-color: #ffffff; height: 1014px;\" width=\"753\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Platform</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Desktop All in One</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Chassis Form Factor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">All in one design</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Prosesor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel Celeron</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Processor Onboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel&reg; Celeron&reg; Processor J4005 (4M Cache, 2.00 GHz)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Memori Standar</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">4GB DDR4</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Hard Drive</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">1TB HDD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Tipe Grafis</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Intel HD Graphics</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Networking</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Kecepatan Jaringan</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">10/100/1000 Mbps</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Antarmuka / Interface</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">\r\n<ul style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; word-break: break-word;\">4 x USB 3.1 Gen 1</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1 x USB2.0</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1 x LAN</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1 x HDMI out</li>\r\n<li style=\"box-sizing: border-box; margin: 4px 0px 0px; word-break: break-word;\">1 x Microphone / Headphone Combo Jack</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Keyboard</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Wired Keyboard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Ragam Input Device</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Wired Mouse</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Audio</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Speaker</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Integrated</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Monitor</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">21.5 Inch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Layar Sentuh</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Tidak</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Sistem Operasi</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">Microsoft Windows 10 Home</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Berat Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">4.8 kg</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Dimensi Produk</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">48.9 x 38.7 x 5.1 - 16.4 cm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">Daya / Power</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">65 W AC power adapter</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td class=\"key\" style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word; font-weight: 600; vertical-align: top; width: 320px;\">&nbsp;</td>\r\n<td style=\"box-sizing: border-box; padding-bottom: 16px; word-break: break-word;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'ASUS Vivo AiO V222 merupakan komputer desktop yang tak hanya memberikan performa terbaik untuk kebutuhan komputasi harian, namun juga sudut pandang yang lebih luas. Desktop all-in-one dari ASUS ini sangat tepat untuk kebutuhan perkantoran agar produktivitas dapat meningkat. Kemudian, ASUS Vivo AiO V222 memiliki desain yang ramping dan berat yang ringan yakni sekitar 4.64 Kg. Selain itu, desktop all-in-one dari ASUS ini tampil dengan desain bezel NanoEdge yang memiliki rasio layar ke bodi 87%. Tak hanya itu saja, layar ASUS Vivo AiO V222 ini hadir dengan palet warna 100% sRGB dan teknologi ASUS Splendid untuk memastikan warna yang akurat.', '2021-05-24'),
(18, 'Apple iPad Pro 4th Gen 2020 ', '28', 'Apple', 11500000, 'af787283-ad30-4ffc-8f8b-bc707ac0d631.jpg', '<p><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">Deskripsi iPad Pro 2020 11&rdquo; 1TB 512GB 256GB 128GB 11 inc 4th Gen WIFI ONLY</span><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">Ipad Pro 11&rdquo; 2020 4th Generation</span><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">With FACE ID ; LiDaR Scanner</span><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">Color:</span><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">Space grey / silver</span><br style=\"box-sizing: border-box; color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\" /><span style=\"color: rgba(49, 53, 59, 0.96); font-family: \'open sans\', tahoma, sans-serif; font-size: 14px; background-color: #ffffff;\">Wifi only / wifi cell</span></p>', '-', '2021-05-25'),
(19, 'Acer Nitro 5 AN515-55-77MG', '1', 'Acer', 14249030, 'f546493a-727b-42ea-9b56-a1583f01e7fe.jpg', '<div class=\"product attribute sku\" style=\"box-sizing: border-box; color: #666666; font-family: \'Open Sans\'; font-size: 13px; background-color: #ffffff;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><strong class=\"type\" style=\"box-sizing: border-box; color: #333333; font-size: 14px; display: inline-block;\">SKU</strong>&nbsp;</span>\r\n<div class=\"value\" style=\"box-sizing: border-box; display: inline-block; font-size: 14px;\"><span style=\"font-family: arial, helvetica, sans-serif;\">NH.Q7NSN.002</span></div>\r\n</div>\r\n<div class=\"product attribute overview\" style=\"box-sizing: border-box; color: #666666; font-size: 14px; margin: 0px; padding: 0px; font-family: \'Open Sans\'; background-color: #ffffff;\">\r\n<div class=\"value\" style=\"box-sizing: border-box;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><strong style=\"box-sizing: border-box;\">Highlights:</strong></span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Performa &amp; durabilitas stabil, kinerja 25% lebih baik berteknologi CoolBoost Fan didukung Nitro sense untuk pengaturan temperature lebih optimal</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Kapasitas dapat diupgrade hingga&nbsp;2TB SSD, Dual slot SSD NVMe</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Tampilan&nbsp;keyboard&nbsp;4 zona full RGB&nbsp;tampilan lebih memikat</span><br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\"><strong style=\"box-sizing: border-box;\">Nitro 5 (AN515-55)</strong></span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Intel&reg; Core&trade; i7-10750H</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; Windows 10 Home &amp; Office Home Student 2019</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 1*8GB DDR4</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 512GB SSD NVMe</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; 15.6\" Full HD (1920x1080) IPS 144Hz</span><br style=\"box-sizing: border-box;\" /><span style=\"font-family: arial, helvetica, sans-serif;\">&bull; NVIDIA&reg; GeForce&reg; GTX 1650Ti</span></div>\r\n</div>', '-', '2021-05-25');

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
(2, 'baner 1', 'banner1.png', 1, '2021-05-25 09:31:22'),
(3, 'baner 2', 'banner2.png', 1, '2021-05-25 09:31:54'),
(4, 'baner 3', 'banner3.png', 1, '2021-05-25 09:32:23'),
(12, 'slider 1', 'img4.png', 0, '2021-05-25 17:55:15'),
(13, 'slide 2', 'img5.png', 0, '2021-05-26 10:27:42');

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
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
