<?php
session_start();
include "database.php";


if ($_POST) {

    if ($_POST['username'] and $_POST['password']) {
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        $login = mysqli_query($koneksi, "SELECT * FROM user where username='$username' and password ='$password'");
        $cek = mysqli_num_rows($login);
        $result = mysqli_fetch_array($login);
        if ($cek == 1) {
            $_SESSION['data-login'] = [
                'nama' => $result['nama'],
                'email' => $result['email'],
                'status' => 'login',
                'username' => $result['username'],
                'id'=>$result['id']
            ];
            header('location:../index.php');
        } else {
            $_SESSION['alert'] = [
                'alert' => 'danger',
                'value' => 'Username atau Password salah!',
            ];
            header('location:../login.php');
        }
    } else {
        $_SESSION['alert'] = [
            'alert' => 'danger',
            'value' => 'Username atau Password Tidak boleh kosong!',
        ];
        header('location:../login.php');
    }
}

if ($_GET['logout'] == 'true') {
    unset($_SESSION['data-login']);
    header('location:../login.php');
}
