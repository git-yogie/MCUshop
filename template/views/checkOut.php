<link rel="stylesheet" href="<?= $baseUrl ?>/css/checkout.css">
<div class="container-flex-row">
    <div class="card-checkout M">
        <div class="card-header">
            <h2>Buat Pesanan</h2>
        </div>
        <div class="card-body">
            <div class="alert primary">Pastikan semua data anda telah benar untuk melakukan pesanan expedisi akan kami pilih sesuai dengan ketersediaan</div>
            <br>
            <div class="label">
                <div class="label-header">Nama</div>
                <div class="label-body">: <?= $dataUser['nama'] ?></div>
            </div>
            <div class="label">
                <div class="label-header">Email</div>
                <div class="label-body">: <?= $dataUser['email'] ?></div>
            </div>
            <div class="label">
                <div class="label-header">No Hp</div>
                <div class="label-body">: <?= $dataUser['nohp'] ?></div>
            </div>
            <div class="label">
                <div class="label-header">Alamat</div>
                <div class="label-body">: <?= $dataUser['alamatLengkap'] ?></div>
            </div>
            <div class="label">
                <div class="label-header">Total Harga</div>
                <div class="label-body"><?= 'Rp ' . number_format($totalharga, 0, "", ".") ?></div>
            </div>
            <br>
            <?php if (isset($_GET['idProduk']) && isset($_GET['jumlah'])) { ?>
                <button class="btn primary" onclick="window.location = ' System_Mcu.php?req=pesan&idProduk=<?= $produk['id'] ?>&jumlah=<?= $_GET['jumlah'] ?>'">Buat Pesanan</button>
            <?php } elseif (isset($_GET['idProduk']) && isset($_GET['diskon'])) { ?>
                <button class="btn primary" onclick="window.location = 'System_Mcu.php?req=pesan&idProduk=<?= $produk['id'] ?>&diskon=<?= $diskon['discount'] ?>'">Buat Pesanan</button>
            <?php } else { ?>
                <button class="btn primary" onclick="window.location = ' System_Mcu.php?req=pesan&idCartUser=<?= $_SESSION['data-login-customer']['id'] ?>'">Buat Pesanan</button>
            <?php } ?>
        </div>
    </div>
    <div class="card-checkout L">
        <div class="card-header">
            <h2>Pesanan</h2>
        </div>
        <div class="card-bodys">
            <?php if (isset($_GET['idProduk'])) { ?>
                <div class="card-pill">
                    <img src="<?= $baseUrl ?>/admin/vendor/gambar/<?= $produk['gambar'] ?>" alt="">
                    <div class="header"><b><?= word_limit($produk['nama'], 3) ?></b></div>
                    <div class=""><?= 'Rp ' . number_format($produk['harga'], 0, "", ".") ?><?= isset($_GET['diskon'])?' x '.$diskon['discount'].'%' :' x '.$_GET['jumlah'] ?></div>
                </div>
                <?php } else {
                foreach ($cart as $c) {
                    $produk = getDataById('product', $c['id_produk']);
                ?>
                    <div class="card-pill">
                        <img src="<?= $baseUrl ?>/admin/vendor/gambar/<?= $produk['gambar'] ?>" alt="">
                        <div class="header"><b><?= word_limit($produk['nama'], 3) ?></b></div>
                        <div class=""><?= 'Rp ' . number_format($produk['harga'], 0, "", ".") ?> x <?= $c['jumlah'] ?></div>
                    </div>
            <?php }
            } ?>
        </div>
    </div>

</div>