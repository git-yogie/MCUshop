<?php 
include "template/header.php" ;
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
                <span>100</span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon danger"><i class="fas fa-box"></i></div>
            <div class="body">
                <p>Jumlah Produk</p>
                <span><?=num_rows('product')?></span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon warning"><i class="fas fa-clipboard-list"></i></div>
            <div class="body">
                <p>Pesanan</p>
                <span>100</span>
            </div>
        </div>
        <div class="card-stat">
            <div class="icon success"><i class="far fa-handshake"></i></div>
            <div class="body">
                <p>Produk terjual</p>
                <span>100</span>
            </div>
        </div>
    </div>
    <br>
    <div class="dashboard-menu">
    <div class="header"><h4>HomePage Setup</h4></div>
       <div class="menu">
       <button class="btn primary" onclick="window.location = 'slider.php'"><i class="far fa-image"></i> Slider</button>
        <button class="btn primary"><i class="fas fa-tags"></i>Diskon</button>
       </div>
    </div>
    <div class="table-Admin">
        <h3>Pesanan</h3>
        <table>
            <tr>
                <td>No</td>
                <td>Produk</td>
                <td>Tanggal Pesan</td>
                <td>Pemesan</td>
                <td>Alamat</td>
                <td>status</td>
                <td>aksi</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Asus G1 strix x</td>
                <td>20-07-2021</td>
                <td>Yogie Prayoga</td>
                <td>Alamat</td>
                <td>Menunggu Pembayaran</td>
                <td>
                    <button class="btn success"><i class="fas fa-check"></i></button>
                    <button class="btn danger"><i class="fas fa-times"></i></button>
                </td>
            </tr>


        </table>
    </div>

</div>
<?php include "template/footer.php" ?>