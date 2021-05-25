<?php
session_start();
include "database.php";

if ($_POST['username'] and $_POST['password']) {
    $username = $_POST['usernam'];
    $password = md5($_POST['password']);
    $login = mysqli_query($koneksi, "SELECT * FROM users where username='$username' and password ='$password'");
    $cek = mysqli_num_rows($login);
    $result = mysqli_fetch_array($login);
    if ($cek == 1) {
        $_SESSION['status'] = "login";
        $_SESSION['nama'] = $result['nama'];
        header('location:index.php');
    } else {
        $_SESSION['login_error'] = 'Username atau Password salah!';
        header('location:login.php');
    }
} else {
    $_SESSION['alert'] = [
        'alert' => 'danger',
        'value' => 'Username atau Password Tidak boleh kosong!',
    ];
    header('location:../login.php');
}
