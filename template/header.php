<?php
include "admin/system/database.php";
include "admin/system/config.php";
include 'admin/dataSource\queryTable.php';
include 'admin/system/function.php';
$kategori = getAllData("kategori");
session_start();
if (isset($_SESSION['data-login-customer'])) {
    $cart = getAllDataAssoc('cart');
    $cartNumber = num_rows_column('cart', 'id_pelanggan', $_SESSION['data-login-customer']['id']);
    $pesanan = getDataBycolumn('pesanan', 'pemesan_id', $_SESSION['data-login-customer']['id']);
}

?>

<!DOCTYPE html>
<html lang="en">
<link rel="shortcut icon" href="<?= $baseUrl ?>/vendor/iconMcu.png" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="<?= $baseUrl ?>css/main.css">
    <title>Toko MCU</title>
</head>

<body>

    <nav class="primary">
        <div class="responsive">
            <button class="btn bars midnight" id="btn-bars"><i class="fas fa-bars"></i></button>
        </div>
        <div class="links" id='links'>
            <button class="btn x midnight" id='closeNav'><i class="fas fa-times"></i></button>
            <div class="logo">MCU</div>
            <a href="<?= $baseUrl ?>">Beranda</a>
            <div class="dropdown">
                <a href="produk.php" id='kategori'>Produk</a>
                <div class="dropdown-content">
                    <?php foreach ($kategori as $k) : ?>
                        <a href="<?= $baseUrl ?>/produk.php?kategori=<?= $k[0] ?>"><?= $k[1] ?></a>
                    <?php endforeach; ?>
                </div>
            </div>
            <a href="about.php">About Us</a>
        </div>
        <div class="buttons">
            <form action="produk.php">
                <div class="search-container" id='search'>
                    <input type="search" name="keyword" class="show" placeholder="search">
                    <button class="btn search"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <?php if (isset($_SESSION['data-login-customer'])) : ?>
                <div class="cart-container">
                    <button class="btn cart midnight" onclick="showModal('cart')"><i class="fas fa-shopping-cart"></i></button>
                    <div><?= $cartNumber < 9 ? $cartNumber : '9+' ?></div>
                </div>
            <?php endif; ?>
            <button class="btn search-toggle midnight" id='searchTogle'><i class="fas fa-search"></i></button>
            <?php if (isset($_SESSION['data-login-customer'])) { ?>
                <div class="dropdown-click">
                    <button class="btn midnight" onclick="showDropdown('user')"><?= $_SESSION['data-login-customer']['nama'] ?></button>
                    <div id="user" class="dropdown-click-content">
                        <a class="primary" href="#pesanan" onclick="showModal('pesanan')"><i class="fas fa-th-list"></i> Pesanan</a>
                        <a class="primary" href="signUp.php?form=edit"><i class="fas fa-user-edit"></i> Edit Akun</a>
                        <a class="danger" href="#" onclick="window.location = 'system/userFronted.php?logout=true'"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </div>
            <?php } else { ?>
                <button class="btn midnight" onclick="showModal('login')">Login</button>
                <a href="<?= $baseUrl ?>/signUp.php" class="link-sign">Sign Up</a>
            <?php } ?>
        </div>
    </nav>
    <div class="toasts">
        <?php if (isset($_SESSION['toast'])) : ?>
            <div class="toast" id='loginToast'>
                <div class="toast-header">
                    <h4>Pesan</h4>
                    <span class="close" onclick="closeToast('loginToast')">&times;</span>
                </div>
                <div class="toast-body">
                    <p><?= $_SESSION['toast']['value'] ?></p>
                </div>
            </div>
        <?php
            unset($_SESSION['toast']);
        endif ?>
    </div>