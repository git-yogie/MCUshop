<?php
include "database.php";
include "../dataSource/queryTable.php";
date_default_timezone_set('Asia/Jakarta');
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
                if ($get['status'] == 0) {
                    $status = 1;
                } else {
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
} elseif ($_GET['system'] == 'user') {
    switch ($_GET['query']) {
        case 'add':
            if ($_POST) {
                $nama = $_POST['nama'];
                $username = $_POST['username'];
                $password = md5($_POST['password']);
                $email = $_POST['email'];
                $result = mysqli_query($koneksi, "INSERT INTO user ( nama, username, email, password) VALUES ('$nama','$username','$email','$password')");

                if ($result == true) {
                    $_SESSION['alert'] = [
                        'alert' => 'success',
                        'value' => 'user baru berhasil ditambahkan.',
                    ];
                    header('location:../user.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;
        case 'update':
            if ($_POST['id']) {
                $nama = $_POST['nama'];
                $username = $_POST['username'];
                $email = $_POST['email'];
                $id = $_POST['id'];
                if ($_POST['password']) {
                    $password = md5($_POST['password']);
                    $result = mysqli_query($koneksi, "UPDATE user SET nama = '$nama', username = '$username', email = '$email', password = '$password'  WHERE id = '$id' ");
                } else {
                    $result = mysqli_query($koneksi, "UPDATE user SET nama = '$nama', username = '$username', email = '$email'  WHERE id = '$id' ");
                }

                if ($result == true) {
                    $_SESSION['alert'] = [
                        'alert' => 'success',
                        'value' => 'user ' . $username . ' berhasil edit.',
                    ];
                    header('location:../user.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;
        case 'getbyid':
            $id = $_GET['id'];
            if ($_GET['id']) {
                $data = getDataById('user', $id);
                echo json_encode($data);
            }

            break;
        case 'username':
            if ($_GET['username']) {
                $username = $_GET['username'];
                $user = mysqli_query($koneksi, "SELECT * FROM user where username='$username'");
                $cek = [
                    'result' => mysqli_num_rows($user)
                ];

                echo json_encode($cek);
            }
            break;
        case 'delete':
            if ($_GET['id']) {
                $hapus = hapusData($_GET['id'], 'user');
                if ($hapus == true) {
                    $_SESSION['alert'] = [
                        'alert' => 'success',
                        'value' => 'user berhasil dihapus',
                    ];
                    header('location:../user.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;
    }
} elseif ($_GET['system'] == 'discount') {
    switch ($_GET['query']) {
        case 'get':
            if (isset($_GET['id'])) {
                $data = getDataById('diskon', $_GET['id']);
            } else {
                $data = getAllDataAssoc('diskon');
            }
            echo json_encode($data);
            break;
        case 'getbyid':
            if (!empty($_GET['id'])) {
                $data = getDataById('kategori', $_GET['id']);
                echo json_encode($data);
            }
            break;
        case 'add':
            // var_dump($_POST);
            if ($_POST) {
                $nama = $_POST['nama'];
                $detail = $_POST['detail'];
                $diskon = $_POST['diskon'];
                $tanggalMulai = mysqli_escape_string($koneksi, $_POST['date-start'] . ' ' . $_POST['time-start']);
                $tanggalBerakhir = mysqli_escape_string($koneksi, $_POST['date-end'] . ' ' . $_POST['time-end']);

                $result = mysqli_query($koneksi, "INSERT INTO diskon ( nama, detail, start, end, discount) VALUES ('$nama','$detail','$tanggalMulai','$tanggalBerakhir','$diskon')");

                if ($result == true) {
                    echo 1;
                } else {
                    echo mysqli_errno($koneksi);
                    echo mysqli_error($koneksi);
                }
            }
            break;
        case 'addProduk':
            if ($_POST) {

                $idDiskon = $_POST['idDiskon'];
                $idProduk = $_POST['produk_diskon'];
                $tanggal  =  mysqli_escape_string($koneksi, date('d-m-Y H:i:s'));
                $result = mysqli_query($koneksi, "INSERT INTO list_produk_diskon ( id_diskon, id_produk, created) VALUES ('$idDiskon','$idProduk','$tanggal')");
                echo json_encode($result);
            }
            break;
        case 'getDataDiskon':
            $data = getDataById('diskon', $_GET['id']);
            echo json_encode($data);
            break;
        case 'update':
            $nama = $_POST['nama'];
            $id = $_POST['id'];
            $detail = $_POST['details'];
            $diskon = $_POST['diskon'];
            $tanggalMulai = mysqli_escape_string($koneksi, $_POST['date-start'] . ' ' . $_POST['time-start']);
            $tanggalBerakhir = mysqli_escape_string($koneksi, $_POST['date-end'] . ' ' . $_POST['time-end']);
            if($detail == ''){
                $result = mysqli_query($koneksi, "UPDATE diskon SET nama = '$nama', start = '$tanggalMulai', end = '$tanggalBerakhir', discount='$diskon'  WHERE id = '$id' ");
            }else{
                $result = mysqli_query($koneksi, "UPDATE diskon SET nama = '$nama', detail = '$detail', start = '$tanggalMulai', end = '$tanggalBerakhir', discount='$diskon'  WHERE id = '$id' ");
            }
            echo json_encode($result);
            break;
        case 'delete':
            $hapus = hapusData($_GET['id'], 'diskon');
            $hapusProduk = hapusDataColumn('list_produk_diskon', 'id_diskon', $_GET['id']);
            if ($hapus == true) {
                echo json_encode(true);
            } else {
                echo mysqli_error($koneksi);
            }
            break;
        case 'deleteProduk':
            $hapusProduk = hapusDataColumn('list_produk_diskon', 'id_produk', $_GET['id']);
            if ($hapusProduk == true) {
                echo json_encode(true);
            } else {
                echo mysqli_error($koneksi);
            }
            break;
        case 'getDiskonProduk':
            $data = getDataBycolumn('list_produk_diskon', 'id_diskon', intval($_GET['id']));
            $result = [];
            foreach ($data as $d) {
                $result[] = getDataById('product', $d['id_produk']);
            }
            echo json_encode($result);
            break;
        case 'getProduk':
            if (isset($_GET['id'])) {
                $data = getDataBycolumn('product', 'kategori', $_GET['id']);
            } else {
                $data = getAllDataAssoc('product');
            }
            echo json_encode($data);
            break;
        default:
            echo "sest";
            break;
    }
}
