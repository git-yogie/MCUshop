<?php
include "database.php";
include "../dataSource/queryTable.php";
session_start();

if ($_GET['query'] == 'add') {
    
    if (!empty($_POST['kategori'])) {
        $kategori = $_POST['kategori'];
        $koneksi;
        $result = mysqli_query($koneksi, "INSERT INTO kategori (id, kategori) VALUES (NULL, '$kategori')");
        if ($result == true) {
            $_SESSION['alert'] = [
                'alert'=>'success',
                'value'=>'Kategori Berhasil Ditambahkan',
            ];
            header('location:../produk_kategori.php');
            
        } else {
            
        }
    }else{
        $_SESSION['alert'] = [
            'alert'=>'danger',
            'value'=>'Form kategori Kosong! <b>input Gagal</b>',
        ];
        header('location:../produk_kategori.php');
    } 

}

if ($_GET['query'] == 'delete' and $_GET['id']) {

    if (hapusData($_GET['id'], 'kategori') == true) {
        $_SESSION['alert'] = [
            'alert'=>'success',
            'value'=>'Kategori Berhasil dihapus',
        ];
        header('location:../produk_kategori.php');

    }
} elseif ($_GET['query'] == 'get') {

    echo json_encode(getAllData('kategori'));

} elseif($_GET['query'] == 'getById' and $_GET['id']){

    $data = getDataById('kategori',$_GET['id']);
    echo json_encode($data);

}elseif ($_GET['query'] == 'update') {
    if($_POST['kategori']){
        $kategori = $_POST['kategori'];
        $id = $_POST['id'];
        $result = mysqli_query($koneksi, "UPDATE kategori SET kategori='$kategori' WHERE id=$id");
        if($result == true){
            $_SESSION['alert'] = [
                'alert'=>'success',
                'value'=>'kategori berhasil diubah!',
            ];
            header('location:../produk_kategori.php');
        }else{
            $_SESSION['alert'] = [
                'alert'=>'error',
                'value'=>'edit Gagal!',
            ];
            header('location:../produk_kategori.php');

        }
        
    }
}
