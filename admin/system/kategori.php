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
                'alert' => 'success',
                'value' => 'Kategori Berhasil Ditambahkan',
            ];
            header('location:../produk_kategori.php');
        } else {
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'Kategori gagal ditambahkan coba lagi nanti',
            ];
            header('location:../produk_kategori.php');
        }
    } else {
        $_SESSION['alert'] = [
            'alert' => 'danger',
            'value' => 'Form kategori Kosong! <b>input Gagal</b>',
        ];
        header('location:../produk_kategori.php');
    }
}

if ($_GET['query'] == 'delete' and $_GET['id']) {

    if (hapusData($_GET['id'], 'kategori') == true) {
        $_SESSION['alert'] = [
            'alert' => 'success',
            'value' => 'Kategori Berhasil dihapus',
        ];
        header('location:../produk_kategori.php');
    }
} elseif ($_GET['query'] == 'get') {

    echo json_encode(getAllData('kategori'));
} elseif ($_GET['query'] == 'getById' and $_GET['id']) {

    $data = getDataById('kategori', $_GET['id']);
    echo json_encode($data);
} elseif ($_GET['query'] == 'update') {
    if ($_POST['kategori']) {
        $kategori = $_POST['kategori'];
        $id = $_POST['id'];
        $result = mysqli_query($koneksi, "UPDATE kategori SET kategori='$kategori' WHERE id=$id");
        if ($result == true) {
            $_SESSION['alert'] = [
                'alert' => 'success',
                'value' => 'kategori berhasil diubah!',
            ];
            header('location:../produk_kategori.php');
        } else {
            $_SESSION['alert'] = [
                'alert' => 'error',
                'value' => 'edit Gagal!',
            ];
            header('location:../produk_kategori.php');
        }
    }
} elseif ($_GET['query'] == "addsubkategori") {
    if (!empty($_POST['sub_kategori'])) {
        $kategori = $_POST['sub_kategori'];
        $id = $_POST['id'];
        $result = mysqli_query($koneksi, "INSERT INTO sub_kategori (id_kategori,sub_kategori) VALUES ($id,'$kategori')");
        if ($result == true) {
            $_SESSION['alert'] = [
                'alert' => 'success',
                'value' => 'sub Kategori Berhasil Ditambahkan',
            ];
            header('location:../sub_kategori.php?id=' . $id);
        } else {
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'sub Kategori gagal ditambahkan hubungi developer',
            ];
            header('location:../sub_kategori.php');
        }
    } else {
        $_SESSION['alert'] = [
            'alert' => 'danger',
            'value' => 'Form kategori Kosong! <b>input Gagal</b>',
        ];
        header('location:../produk_kategori.php');
    }
} elseif ($_GET['query'] == 'getsubkategoriById' and $_GET['id']) {
    $data = getDataById('sub_kategori', $_GET['id']);
    echo json_encode($data);
} elseif ($_GET['query'] == 'updatesubkategori') {
    if ($_POST['Subkategori']) {
        $Subkategori = $_POST['Subkategori'];
        $id = $_POST['id'];
        $result = mysqli_query($koneksi, "UPDATE sub_kategori SET sub_kategori='$Subkategori' WHERE id=$id");
        if ($result == true) {
            $_SESSION['alert'] = [
                'alert' => 'success',
                'value' => 'Sub kategori berhasil diubah!',
            ];
            header('location:../sub_kategori.php?id=' . $_GET['page']);
        } else {
            $_SESSION['alert'] = [
                'alert' => 'error',
                'value' => 'edit Gagal!',
            ];
            header('location:../sub_kategori.php' . $_GET['page']);
        }
    }
} elseif ($_GET['query'] == 'deletesubkategori' and $_GET['id']) {
    if (hapusData($_GET['id'], 'sub_kategori') == true) {
        $_SESSION['alert'] = [
            'alert' => 'success',
            'value' => 'Sub Kategori Berhasil dihapus',
        ];
        header('location:../sub_kategori.php?id=' . $_GET['page']);
    }
} elseif ($_GET['query'] == 'getsubkategoribykategori' and $_GET['id']) {
    $id = $_GET['id'];
    $data = getDataBycolumn('sub_kategori', 'id_kategori', $id);
    echo json_encode($data);
}
