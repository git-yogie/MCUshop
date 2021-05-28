<?php
include "template/header.php";
include "system/config.php";
include "system/database.php";
include "dataSource/queryTable.php";

if ($_GET['id']) {
    $data = getDataById('product', $_GET['id']);
    $kategori = getDataById("kategori", $data['Kategori']);
    $subkategori = getDataById('sub_kategori', $data['sub_kategori']);
};

?>
<link rel="stylesheet" href="<?= $baseUrl ?>/admin/vendor/css/show_produk.css">
<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'produk.php'"><i class="fas fa-arrow-left"></i> kembali</button>
    </div>
    <div class="product-detail">
        <img id="myImg" src="<?= $baseUrl ?>/admin/vendor/gambar/<?= $data['gambar'] ?>" alt="ASUS ROG Strix G G512LI-I565B6T" style="width:100%;max-width:400px">
        <div class="product-image">
        </div>
        <div class="product-sider">
            <p class="judul text-primary"><?= $data['nama'] ?></p>
            <ul class="breadcrumb">
                <li><?= $kategori['kategori'] ?></li>
                <li><?= $subkategori['sub_kategori'] ?></li>
            </ul>
            <div class="list-detail">
                <div class="detail">
                    <table>
                        <tr>
                            <td class="label">Harga</td>
                            <td class="harga"><?= 'Rp ' . number_format($data['harga'], 0, "", ".") ?></td>
                        </tr>
                        <tr>
                            <td class="label">Brand</td>
                            <td><?= $data['brand'] ?></td>
                        </tr>
                        <tr>
                            <td class="label">stok</td>
                            <td>12</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="product-description">
        <div class="description-header">
            <a href="#" class="show">Deskripsi</a>
            <a href="#" class="show">Spesifikasi</a>
        </div>
        <div class="description-detail">
            <h3>Deskripsi</h3>
            <p><?= $data['deskripsi'] ?></p>
        </div>
        <div class="description-spesifikasi">
            <h3>Spesifikasi</h3>
            <div class="detail spesifikasi">
                <?= $data['spesifikasi'] ?>
            </div>
        </div>
    </div>
</div>
<div id="img-modal" class="modal-img">

    <!-- The Close Button -->
    <span class="close-img">&times;</span>

    <!-- Modal Content (The Image) -->
    <div class="modal-content-img">
        <img class="modal-img-content" id="img01">
    </div>

    <!-- Modal Caption (Image Text) -->
    <div id="caption"></div>
</div>
</body>

</html>