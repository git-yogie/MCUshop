<?php
include "template/header.php";
include 'dataSource\queryTable.php';
?>
<div class="container">
    <div class="header">
        <h2>Dashboard</h2>
    </div>
    <div class="alert warning">
        <div class="header">
            <div class="icon"><i class="fas fa-info-circle"></i></div>
        </div>
        <div class="body">
            <h2>Info</h2>
            <p>Gunakan dashboard sebaik mungkin jika kurang paham hubungi yogi 081522630817</p>
        </div>
    </div>
    <div class="dashboard-status">
        <div class="card-stat">
            <div class="icon primary"><i class="fas fa-users"></i></div>
            <div class="body">
                <p>Jumlah customer</p>
                <span><?= num_rows('customer') ?></span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon danger"><i class="fas fa-box"></i></div>
            <div class="body">
                <p>Jumlah Produk</p>
                <span><?= num_rows('product') ?></span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon warning"><i class="fas fa-clipboard-list"></i></div>
            <div class="body">
                <p>Pesanan</p>
                <span><?= num_rows('pesanan') ?></span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon success"><i class="far fa-handshake"></i></div>
            <div class="body">
                <p>Produk terjual</p>
                <span><?= num_rows_column('pesanan', 'status', '3') ?></span>
            </div>
        </div>
    </div>
    <br>
    <div class="dashboard-menu">
        <div class="header">
            <h4>dashboard Menu</h4>
        </div>
        <div class="menu">
            <button class="btn primary" onclick="window.location = 'slider.php'"><i class="far fa-image"></i> Slider</button>
            <button class="btn primary" onclick="window.location = 'diskon.php'"><i class="fas fa-tags"></i>Diskon</button>
            <button class="btn primary" onclick="window.location = 'pesan.php'"><i class="fas fa-envelope-open-text"></i> Pesan</button>
        </div>
    </div>
</div>
<?php include "template/footer.php" ?>