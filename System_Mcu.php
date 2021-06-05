<?php
// include "admin/system/database.php";
// include "admin/dataSource/queryTable.php";


if ($_GET) {
    switch ($_GET['req']) {
        case 'checkout':

            include "template/header.php";
            if (isset($_SESSION['data-login-customer'])) {
                $dataUser = getDataById('customer', $_SESSION['data-login-customer']['id']);
            } else {
                $_SESSION['toast'] = [
                    'alert' => 'success',
                    'value' => 'anda harus login ',
                ];
                if(isset($_GET['diskon'])){
                    header('location:produkShow.php?id='.$_GET['idProduk'].'&diskon='.$_GET['diskon']);
                }else{
                    header('location:produkShow.php?id='.$_GET['idProduk']);
                }
            }
            if (isset($_GET['idProduk']) && isset($_GET['jumlah'])) {
                $produk = getDataById('product', $_GET['idProduk']);
                $totalharga = $produk['harga'] * intval($_GET['jumlah']);
            } elseif (isset($_GET['idProduk']) && $_GET['diskon']) {
                $diskon = getDataById('diskon', $_GET['diskon']);
                $produk = getDataById('product', $_GET['idProduk']);
                $totalharga = $produk['harga'] - (($diskon['discount'] / 100) * $produk['harga']);
            } else {
                $cart = getDataBycolumn('cart', 'id_pelanggan', $_SESSION['data-login-customer']['id']);
                $totalharga = 0;
                foreach ($cart as $c) {
                    $data =  getDataById('product', $c['id_produk']);
                    $totalharga = ($data['harga'] * $c['jumlah']) + $totalharga;
                }
            }

            include "template/views/checkOut.php";
            include "template/footer.php";


            break;
        case 'pesan':
            include "admin/system/database.php";
            include "admin/dataSource/queryTable.php";
            session_start();
            date_default_timezone_set('Asia/jakarta');
            if (isset($_GET['idProduk']) && isset($_GET['jumlah'])) {
                $produk = json_encode([[$_GET['idProduk'], $_GET['jumlah']]]);
                $produkharga = getDataById('product', $_GET['idProduk'])['harga'];
                $totalBayar =  $produkharga * intval($_GET['jumlah']);
            } elseif (isset($_GET['idProduk']) && isset($_GET['diskon'])) {
                $produk = json_encode([[$_GET['idProduk'], 1, $_GET['diskon']]]);
                $produkharga = getDataById('product', $_GET['idProduk'])['harga'];
                $totalBayar =  $produkharga-($produkharga * ($_GET['diskon'] / 100));
            } else {
                $produk = [];
                $totalBayar = 0;
                $cart = getDataBycolumn('cart', 'id_pelanggan', $_SESSION['data-login-customer']['id']);
                foreach ($cart as $c) {
                    $produkharga = getDataById('product', $c['id_produk'])['harga'];
                    $totalBayar =  $totalBayar + ($produkharga * $c['jumlah']);
                    array_push($produk, [$c['id_produk'], $c['jumlah']]);
                }
                $produk = json_encode($produk);
            }
            $tanggal = mysqli_escape_string($koneksi, date('d-m-Y H:i'));
            $pemesan = $_SESSION['data-login-customer']['id'];
            $result = mysqli_query($koneksi, "INSERT INTO pesanan (produk_id_qty, pemesan_id, totalBayar, status,tanggal_pesan) VALUES ('$produk', '$pemesan','$totalBayar','0','$tanggal')");
            if ($result == true) {
                hapusDataColumn('cart', 'id_pelanggan', $_SESSION['data-login-customer']['id']);
                $_SESSION['toast'] = [
                    'alert' => 'success',
                    'value' => 'Pesanan anda sudah berhasil dibuat anda akan dihubungi untuk melakukan pembayaran!',
                ];
                header('location:index.php');
            }
            break;
        case 'addCart':
            include "admin/system/database.php";
            session_start();
            if (isset($_SESSION['data-login-customer'])) {


                if (isset($_GET['idProduk'])) {
                    $id = $_SESSION['data-login-customer']['id'];
                    $idProduk = $_GET['idProduk'];
                    $jumlah = $_GET['jumlah'];
                    $result = mysqli_query($koneksi, "INSERT INTO cart (id_pelanggan, id_produk, jumlah) VALUES ('$id', '$idProduk','$jumlah')");
                    $_SESSION['toast'] = [
                        'alert' => 'success',
                        'value' => 'Produk ditambahkan ke Cart!',
                    ];
                    header('location:produkShow.php?id=' . $idProduk);
                }
            } else {
                $_SESSION['toast'] = [
                    'alert' => 'success',
                    'value' => 'anda harus login ',
                ];
                header('location:produkShow.php?id='.$_GET['idProduk']);
            }

            break;
        case 'delCart':
            include "admin/system/database.php";
            include "admin/dataSource/queryTable.php";
            session_start();
            if ($_GET['id']) {
                $result = hapusData($_GET['id'], 'cart');
                $_SESSION['modal'] = 'cart';
                $url = explode('/', $_GET['url']);
                if ($url[2] == "") {
                    $url = 'index.php';
                } else {
                    $url = $url[2];
                }
                header('location:' . $url);
            }
            break;
        case 'delPesan':
            include "admin/system/database.php";
            include "admin/dataSource/queryTable.php";
            session_start();
            if ($_GET['id']) {
                $result = hapusData($_GET['id'], 'pesanan');
                $_SESSION['modal'] = 'pesanan';
                $url = explode('/', $_GET['url']);
                if ($url[2] == "") {
                    $url = 'index.php';
                } else {
                    $url = $url[2];
                }
                header('location:' . $url);
            }
            break;
        case 'diterima':
            include "admin/system/database.php";
            include "admin/dataSource/queryTable.php";
            session_start();
            $status = 3;
            if ($_GET['id']) {
                $id = $_GET['id'];
                $result = mysqli_query($koneksi, "UPDATE pesanan SET status='$status' WHERE id=$id");
                if ($result == true) {
                    $_SESSION['toast'] = [
                        'alert' => 'success',
                        'value' => 'Terima Kasih, sudah belanja di MCU Shop, jika ada pertanyaan atau masalah terkait produk Kontak kami!',
                    ];
                    header('location:index.php');
                }
            }
            break;
        default:
            # code...
            break;
    }
}
