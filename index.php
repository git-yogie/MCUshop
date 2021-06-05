<?php
include "template/header.php";

date_default_timezone_set('Asia/Jakarta');
$slider = getAllData('slider');
$produkTerbaru = getAllDataAssoc('product', true);
$diskon = getAllDataAssoc('diskon');
?>

<div class="container">

    <div class="slideshow-container">
        <?php foreach ($slider as $slide) :
            if ($slide['3'] == 1) :
        ?>
                <div class="mySlides fade">
                    <img src="<?= $baseUrl ?>admin/vendor/slider/<?= $slide[2] ?>" style="width:100%">
                </div>
        <?php
            endif;
        endforeach; ?>
    </div>
    <br>
    <div style="text-align:center">
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <?php
        $no = 1;
        foreach ($slider as $slide) :
            if ($slide['3'] == 1) :
        ?>
                <span class="dot" onclick="currentSlide(<?= $no ?>)"></span>
        <?php
                $no++;
            endif;
        endforeach; ?>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>
    <h3 style="text-align: center;">Brands</h3>
    <div class="brands-container">
        <a class="brand" href="https://rog.asus.com/id" target="blank">
            <img src="vendor/ROG.png" alt="">
        </a>
        <a class="brand" href='https://store.hp.com/id-id/' target="blank">
            <img src="vendor/hp.png" alt="">
        </a>
        <a class="brand" href="https://www.dell.co.id/" target="blank">
            <img src="vendor/dell.png" alt="">
        </a>
        <a class="brand" href="https://www.lenovo.com/id/in/" target="blank">
            <img src="vendor/lenovo.png" alt="">
        </a>
    </div>
    <h3 style="text-align: center;">Produk Terbaru</h3>
    <div class="cards">
        <?php for ($i = 0; $i < 8; $i++) : ?>
            <div class="card" onclick="window.location='produkShow.php?id=<?= $produkTerbaru[$i]['id'] ?>' ">
                <img src="admin/vendor/gambar/<?= $produkTerbaru[$i]['gambar'] ?>" width="100%" alt="">
                <div class="card-body">
                    <div class="card-header">
                        <h3><?= word_limit($produkTerbaru[$i]['nama'], 3) ?></h3>
                    </div>
                    <p><?= word_limit($produkTerbaru[$i]['deskripsi'], 10); ?></p>
                    <h3 class="text-primary harga">Rp. <?= number_format($produkTerbaru[$i]['harga'], 0, "", ".") ?></h3>
                </div>
            </div>
        <?php endfor ?>
    </div>
    <br>
    <h3>Rekomendasi</h3>
    <div class="cards-slider">

    </div>
    <div class="diskonan">
        <?php foreach ($diskon as $data) :
            if (strtotime($data['start']) < strtotime("now") and strtotime("now") < strtotime($data['end'])) :
                $dataProduk = getDataBycolumn('list_produk_diskon', 'id_diskon', $data['id']);

        ?>

                <div class="diskonan-body" style="margin-bottom: 10px;">
                    <div class="card-square" id='cardSquare'>
                        <h3><?= $data['nama'] ?>?</h3>
                        <p><?= $data['detail'] ?></p>
                    </div>
                    <div class="cards-slider" id='cardSlider'>
                        <?php foreach ($dataProduk as $produk) :
                            $produkDetail = getDataById('product', $produk['id_produk']);
                        ?>

                            <div class="card-slide" onclick="window.location='produkShow.php?id=<?= $produkDetail['id'] ?>&diskon=<?= $data['id'] ?>'">
                                <img src="admin/vendor/gambar/<?= $produkDetail['gambar'] ?>" width="170px" style='margin:5px auto;' alt="">
                                <div class="card-body">
                                    <div class="card-header">
                                        <h3><?= word_limit($produkDetail['nama'], 3) ?></h3>
                                    </div>
                                    <h5 class="text-primary harga-txt" style='text-decoration:line-through;'>Rp <?= number_format($produkDetail['harga'], 0, "", ".") ?></h5>
                                    <!--  -->
                                    <h3 class="text-primary harga-txt">Rp <?= $data['discount'] > 0 ? number_format($produkDetail['harga'] - ($produkDetail['harga'] * ($data['discount'] / 100)), 0, "", ".")   : '' ?></h3>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
        <?php
            endif;
        endforeach; ?>
    </div>
</div>





<?php
include "template/footer.php";
?>