<?php
include "../admin/system/database.php";
session_start();
date_default_timezone_set('Asia/Jakarta');

if ($_GET['form']) {
    switch ($_GET['form']) {
        case 'daftar':
            if ($_POST['alamat']) {
                $nama = htmlspecialchars($_POST['nama']);
                $password = md5($_POST['password']);
                $email = htmlspecialchars($_POST['email']);
                $nohp = htmlspecialchars($_POST['noHp']);
                $alamat =  htmlspecialchars($_POST['alamat']);
                $created = date('d-m-Y H:i:s');
                $result = mysqli_query($koneksi, "INSERT INTO customer ( nama, email, password, nohp, alamatLengkap, status, created) VALUES ( '$nama','$email','$password','$nohp','$alamat','1','$created')");

                if ($result == true) {
                    $_SESSION['toast'] = [
                        'alert' => 'success',
                        'value' => 'Anda berhasil mendaftar, silahkan login untuk masuk!',
                    ];
                    header('location:../index.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }

            break;

        case 'edit':
            if ($_POST['alamat']) {
                $nama = htmlspecialchars($_POST['nama']);
                $email = htmlspecialchars($_POST['email']);
                $nohp = htmlspecialchars($_POST['noHp']);
                $alamat =  htmlspecialchars($_POST['alamat']);
                $id = $_SESSION['data-login-customer']['id'];
                if ($_POST['password'] == '') {
                    $result = mysqli_query($koneksi, "UPDATE customer SET nama='$nama', email='$email', nohp='$nohp', alamatLengkap='$alamat' WHERE id=$id");
                } else {
                    $password = md5($_POST['password']);
                    $result = mysqli_query($koneksi, "UPDATE customer SET nama='$nama', email='$email',password='$password', nohp='$nohp', alamatLengkap='$alamat' WHERE id=$id");
                }

                if ($result == true) {
                    $_SESSION['toast'] = [
                        'alert' => 'success',
                        'value' => 'Data anda berhasil diupdate, Selamat belanja!',
                    ];
                    header('location:../index.php');
                } else {
                    die('Query Error : ' . $koneksi->errno . ' - ' . $koneksi->error);
                    echo 'gagal';
                }
            }
            break;

        default:
            # code...
            break;
    }
}

if ($_GET['logout'] == 'true') {
    unset($_SESSION['data-login-customer']);
    header('location:../index.php');
}
if ($_GET['req'] == 'login') {
    if ($_POST['email'] and $_POST['password']) {
        $email = $_POST['email'];
        $password = md5($_POST['password']);
        $login = mysqli_query($koneksi, "SELECT * FROM customer where email='$email' and password ='$password'");
        $cek = mysqli_num_rows($login);
        $result = mysqli_fetch_array($login);
        if ($cek == 1) {
            $_SESSION['data-login-customer'] = [
                'id' => $result['id'],
                'nama' => $result['nama'],
                'email' => $result['email'],
                'status' => 'login',
            ];
            $_SESSION['toast'] = [
                'alert' => 'success',
                'value' => 'selamat datang ' . $result['nama'],
            ];
            header('location:../index.php');
        } else {
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'email atau Password salah!',
            ];
            header('location:../index.php');
        }
    } else {
        $_SESSION['alert'] = [
            'alert' => 'danger',
            'value' => 'email atau Password Tidak boleh kosong!',
        ];
        header('location:../index.php');
    }
}
