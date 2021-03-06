<?php

include "system/config.php";
include "system/database.php";
session_start();

if(!isset($_SESSION['data-login'])){
    header('location:login.php');
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dasboard</title>
    <link rel="stylesheet" href="<?= $baseUrl ?>admin/vendor/css/dashbord.css">
    <link rel="stylesheet" href="<?= $baseUrl ?>admin\vendor\fontawsome\css\all.css">
    <link rel="stylesheet" href="<?= $baseUrl ?>admin/vendor/css/addOn.css">
</head>

<body>
    <nav>
        <div class="links" style="overflow: auto;">
            <div class="logo">MCU</div>
            <div class="login-nama"><?= $_SESSION['data-login']['nama'] ?></div>
            <a href="index.php"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
            <a href="pesanan.php"><i class="fas fa-clipboard-list"></i>Pesanan</a>
            <a href="user.php"><i class="fas fa-users"></i>Data User</a>
            <a href="produk.php"><i class="fas fa-th-list"></i>Data Produk</a>
        </div>
        <a href="<?=$baseUrl?>admin/system/login_check.php?logout=true" class="btn danger" style="text-align: center;"><i class="fas fa-sign-out-alt"></i> LogOut</a>
    </nav>