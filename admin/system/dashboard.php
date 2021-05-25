<?php
include "database.php";
include "../dataSource/queryTable.php";
session_start();

if ($_GET['system'] == 'slider') {
    switch ($_GET['query']) {
        case 'get':
            echo json_encode(getAllData('slider'));
            break;
        case 'getById':
            $data = getDataById('slider', $_GET['id']);
            echo json_encode($data);
            break;
        case 'add':
            if ($_POST['nama']) {
                $nama = $_POST['nama'];
            }
            $ekstensi_diperbolehkan  = array('png', 'jpg', 'jpeg');
            $nama_gambar = $_FILES['slider']['name'];
            $x = explode('.', $nama_gambar);
            $ekstensi = strtolower(end($x));
            $ukuran    = $_FILES['slider']['size'];
            $file_tmp = $_FILES['slider']['tmp_name'];
            if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
                if ($ukuran < 10044070) {
                    move_uploaded_file($file_tmp, '../vendor/slider/' . $nama_gambar);
                } else {
                    $_SESSION['alert'] = [
                        'alert' => 'danger',
                        'value' => 'ukuran gambar terlalu besar!',
                    ];
                    echo "gagal file besar";
                    header('location:../slider.php');
                }
            } else {
                $_SESSION['alert'] = [
                    'alert' => 'danger',
                    'value' => 'ekstensi gambar' . $ekstensi . ' tidak didukung! ekstensi yang didukung hanya png dan jpg',
                ];
                header('location:../slider.php');
            }

            $result = mysqli_query($koneksi, "INSERT INTO slider ( nama, slider) VALUES ('$nama','$nama_gambar')");

            if ($result == true) {
                $_SESSION['alert'] = [
                    'alert' => 'success',
                    'value' => 'slider baru berhasil ditambahkan!',
                ];
                header('location:../slider.php');
            } else {
                die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                echo 'gagal';
            }
            break;
        case 'update':
            if ($_POST['nama']) {
                $nama = $_POST['nama'];
                $id = $_POST['id'];
            }
            if ($_FILES['slider']['name'] !== '') {
                $get = getDataById('slider', $id);
                unlink('../vendor/slider/' . $get['slider']);
                $ekstensi_diperbolehkan  = array('png', 'jpg', 'jpeg');
                $nama_gambar = $_FILES['slider']['name'];
                $x = explode('.', $nama_gambar);
                $ekstensi = strtolower(end($x));
                $ukuran    = $_FILES['slider']['size'];
                $file_tmp = $_FILES['slider']['tmp_name'];
                if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
                    if ($ukuran < 10044070) {
                        move_uploaded_file($file_tmp, '../vendor/slider/' . $nama_gambar);
                    } else {
                        $_SESSION['alert'] = [
                            'alert' => 'danger',
                            'value' => 'ukuran gambar terlalu besar!',
                        ];
                        echo "gagal file besar";
                        header('location:../slider.php');
                    }
                } else {
                    $_SESSION['alert'] = [
                        'alert' => 'danger',
                        'value' => 'ekstensi gambar' . $ekstensi . ' tidak didukung! ekstensi yang didukung hanya png dan jpg',
                    ];
                    header('location:../slider.php');
                }
                $result = mysqli_query($koneksi, "UPDATE slider SET nama = '$nama', slider = '$nama_gambar'  WHERE id = '$id' ");
            } else {
                $result = mysqli_query($koneksi, "UPDATE slider SET nama = '$nama' WHERE id = '$id' ");
            }
            if ($result == true) {
                $_SESSION['alert'] = [
                    'alert' => 'success',
                    'value' => 'slider ' . $nama . ' berhasil di edit!',
                ];
                header('location:../slider.php');
            } else {
                die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                echo 'gagal';
            }
            break;
        case 'delete':
            if ($_GET['id']) {
                $get = getDataById('slider', $_GET['id']);
                $hapus = hapusData($_GET['id'], 'slider');
                unlink('../vendor/slider/' . $get['slider']);
                if ($hapus == true) {
                    $_SESSION['alert'] = [
                        'alert' => 'success',
                        'value' => 'slider ' . $get['nama'] . ' berhasil dihapus!',
                    ];
                    header('location:../slider.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;
        case 'aktivasi':
            if ($_GET['id']) {
                $id = $_GET['id'];
                $get = getDataById('slider', $id);
                if($get['status'] == 0){
                    $status = 1;
                }else{
                    $status = 0;
                }
                $result = mysqli_query($koneksi, "UPDATE slider SET status = '$status'  WHERE id = '$id' ");
                if ($result == true) {
                    $_SESSION['alert'] = [
                        'alert' => 'success',
                        'value' => 'slider ' . $get['nama'] . 'status diubah.',
                    ];
                    header('location:../slider.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;
    }
}
