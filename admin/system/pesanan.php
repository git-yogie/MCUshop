<?php
include "database.php";
include "../dataSource/queryTable.php";
session_start();

if(isset($_GET['status'])){
    $status = $_GET['status'];
    $id = $_GET['id'];
    $result = mysqli_query($koneksi, "UPDATE pesanan SET status='$status' WHERE id=$id");
    header('location:../pesanan.php');
}

if ($_GET['query']) {
    switch ($_GET['query']) {
        case 'getAllData':
            $dataPesanan = getDataById('pesanan', $_GET['id']);
            $pemesan = getDataById('customer', $dataPesanan['pemesan_id']);
            $produkPesanan = json_decode($dataPesanan['produk_id_qty']);
            $total = $dataPesanan['totalBayar'];
            $allData = [
                "pemesan" => $pemesan,
                "produk" => [],
                "bayar"=>$total,
            ];
            foreach ($produkPesanan as $produk) {
                $dataProduk = getDataById('product', $produk[0]);
                if (isset($produk[2])) {
                    array_push($allData['produk'], [
                        'nama' => $dataProduk['nama'],
                        'harga' => $dataProduk['harga'],
                        'jumlah' => $produk[1],
                        'diskon' => $produk[2],
                    ]);
                } else {
                    array_push($allData['produk'], [
                        'nama' => $dataProduk['nama'],
                        'harga' => $dataProduk['harga'],
                        'jumlah' => $produk[1],
                    ]);
                }
            }
            echo json_encode($allData);


            break;

        default:
            # code...
            break;
    }
}
