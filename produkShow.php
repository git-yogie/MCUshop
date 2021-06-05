<?php
include "template/header.php";
// include "admin/system/config.php";

if ($_GET['id']) {
    $data = getDataById('product', $_GET['id']);
    $kategori = getDataById("kategori", $data['Kategori']);
    $subkategori = getDataById('sub_kategori', $data['sub_kategori']);
}
if (isset($_GET['diskon'])) {
    $diskon = getDataById('diskon', $_GET['diskon']);
}
?>
<!-- bagian tengah -->
<div class="container">
    <link rel="stylesheet" href="<?= $baseUrl ?>/css/produk.css">
    <div class="product-detail">
        <img id="myImg" src="admin/vendor/gambar/<?= $data['gambar'] ?>" alt="<?= $data['nama'] ?>" style="width:100%;max-width:400px">
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
                            <?php if (isset($_GET['diskon']) == false) { ?>
                                <td class="label">jumlah</td>
                                <td style="display: flex; align-items:baseline;">
                                    <div class="counter">
                                        <div class="btn primary" id='minusCounter' style="margin-right: 0px;" onclick="minusCounter()"><i class="fas fa-minus"></i></div>
                                        <div class="count" id="counter">1</div>
                                        <div class="btn primary" onclick="plusCounter()"><i class="fas fa-plus" style="margin-right: 0px;"></i></div>
                                    </div>
                                    <div class="total">total : <b id='harga'></b></div>
                                </td>
                            <?php } else { 
                                $totalDiskon = $data['harga'] - (($diskon['discount']/100)*$data['harga']);
                                ?>
                                <td class="label">Diskon</td>
                                <td >
                                    <div><?= $diskon['discount'] . '%' ?></div>
                                    <div class="total">total : <b>Rp. <?=number_format($totalDiskon, 0, "", ".")?></b></div>
                                </td>
                            <?php } ?>
                        </tr>
                    </table>
                </div>
                <div class="button" style="margin-top:10px ;">
                    <button class="btn primary" onclick="Beli(<?= isset($_GET['diskon']) ? $data['id'] . ',' . $diskon['id'] : $data['id'] ?>)">Beli</button>
                    <?php if (isset($_GET['diskon']) == false) : ?>
                        <button class="btn primary" onclick="addCart(<?= $data['id'] ?>)">Add to Cart</button>
                    <?php endif; ?>
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
<script src="js/addon.js"></script>
<script>
    var harga = <?= $data['harga'] ?>
</script>
<script src="js/produk.js"></script>
<?php
include "template/footer.php";
?>