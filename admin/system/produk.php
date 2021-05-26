<?php

include "database.php";
include "../dataSource/queryTable.php";
session_start();

if ($_GET['query'] == 'add') {
    if ($_FILES['gambar']) {
        $ekstensi_diperbolehkan  = array('png', 'jpg','jpeg');
        $nama_gambar = $_FILES['gambar']['name'];
        $x = explode('.', $nama_gambar);
        $ekstensi = strtolower(end($x));
        $ukuran    = $_FILES['gambar']['size'];
        $file_tmp = $_FILES['gambar']['tmp_name'];
        if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
            if ($ukuran < 1044070) {
                move_uploaded_file($file_tmp, '../vendor/gambar/' . $nama_gambar);
            } else {
                $_SESSION['alert'] = [
                    'alert' => 'danger',
                    'value' => 'ukuran gambar terlalu besar!',
                ];
                echo "gagal file besar";
                header('location:../tambahProduk.php');
            }
        } else {
            echo "gagal file bukan eks";
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'ekstensi gambar' . $ekstensi . ' tidak didukung! ekstensi yang didukung hanya png dan jpg',
            ];
            header('location:../tambahProduk.php');
        }
    }


    $namaProduk =$_POST['namaProduk'];
    $brand = $_POST['Brand'];
    $harga = $_POST['harga'];
    $kategori = $_POST['kategori'];
    $spesifikasi = mysqli_real_escape_string($koneksi,$_POST['spesifikasi']);
    $deskripsi = $_POST['deskripsi'];

    $result = mysqli_query($koneksi, "INSERT INTO product ( nama, Kategori, brand, harga, gambar,spesifikasi, deskripsi) VALUES ('$namaProduk','$kategori','$brand','$harga','$nama_gambar','$spesifikasi','$deskripsi')");

    if ($result == true) {
        $_SESSION['alert'] = [
            'alert' => 'success',
            'value' => 'Produk baru berhasil ditambahkan!',
        ];
        header('location:../produk.php');
        
    } else {
        die('Query Error : '.$koneksi->errno.' - '.$koneksi->error);
        echo 'gagal';
    }


}elseif ($_GET['query'] == 'update') {
    if($_POST){
        $namaProduk =$_POST['namaProduk'];
        $brand = $_POST['Brand'];
        $harga = $_POST['harga'];
        $kategori = $_POST['kategori'];
        $spesifikasi = mysqli_real_escape_string($koneksi,$_POST['spesifikasi']);
        $deskripsi = $_POST['deskripsi'];
        $id = $_POST['id'];
    }

    if ($_FILES['gambar']['name'] !== '') {
        $get = getDataById('product',$id);
        unlink('../vendor/gambar/'.$get['gambar']);
        $ekstensi_diperbolehkan  = array('png', 'jpg','jpeg');
        $nama_gambar = $_FILES['gambar']['name'];
        $x = explode('.', $nama_gambar);
        $ekstensi = strtolower(end($x));
        $ukuran    = $_FILES['gambar']['size'];
        $file_tmp = $_FILES['gambar']['tmp_name'];
        if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
            if ($ukuran < 1044070) {
                move_uploaded_file($file_tmp, '../vendor/gambar/' . $nama_gambar);
            } else {
                $_SESSION['alert'] = [
                    'alert' => 'danger',
                    'value' => 'ukuran gambar terlalu besar!',
                ];
                echo "gagal file besar";
                header('location:../tambahProduk.php');
            }
        } else {
            echo "gagal file bukan eks";
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'ekstensi gambar' . $ekstensi . ' tidak didukung! ekstensi yang didukung hanya png dan jpg',
            ];
            header('location:../tambahProduk.php');
        }
       $result = mysqli_query($koneksi,"UPDATE product SET nama = '$namaProduk', Kategori = '$kategori', brand = '$brand', harga = '$harga', gambar = '$nama_gambar', spesifikasi = '$spesifikasi', deskripsi = '$deskripsi' WHERE id = '$id' ");
    }else{
        $result = mysqli_query($koneksi,"UPDATE product SET nama = '$namaProduk', Kategori = '$kategori', brand = '$brand', harga = '$harga', spesifikasi = '$spesifikasi', deskripsi = '$deskripsi' WHERE id = '$id' ");
    }

    if ($result == true) {
        $_SESSION['alert'] = [
            'alert' => 'success',
            'value' => 'Produk '.$namaProduk.' berhasil diupdate!',
        ];
        header('location:../produk.php');
        
    } else {
        die('Query Error : '.$koneksi->errno.' - '.$koneksi->error);
        echo 'gagal';
    }
}elseif ($_GET['query'] == 'delete') {
    if($_GET['id']){
        $get = getDataById('product',$_GET['id']);
        $hapus = hapusData($_GET['id'],'product');
        unlink('../vendor/gambar/'.$get['gambar']);
        if ($hapus == true) {
            $_SESSION['alert'] = [
                'alert' => 'success',
                'value' => 'Produk '.$get['nama'].' berhasil dihapus!',
            ];
            header('location:../produk.php');
            
        } else {
            die('Query Error : '.$koneksi->errno.' - '.$koneksi->error);
            echo 'gagal';
        }
    }

}
