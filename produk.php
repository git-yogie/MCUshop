<?php
include "template/header.php";

date_default_timezone_set('Asia/Jakarta');
$slider = getAllData('slider');
$produk = getAllDataAssoc('product', true);
$diskon = getAllDataAssoc('diskon');

if (isset($_GET['kategori']) && isset($_GET['subkategori'])) {
    if ($_GET['subkategori'] != 0) {
        $kategoriProduk = $_GET['kategori'];
        $subKategori = $_GET['subkategori'];
        $produk = mysqli_query($koneksi, "SELECT * FROM product where Kategori='$kategoriProduk' and sub_kategori ='$subKategori'");
    } else {
        $produk = getDataBycolumn('product', 'kategori', $_GET['kategori']);
    }
} elseif (isset($_GET['kategori'])) {
    $produk = getDataBycolumn('product', 'kategori', $_GET['kategori']);
} elseif (isset($_GET['keyword'])) {
    $keyword = $_GET['keyword'];
    $produk = searchAssoc($keyword, 'product', 'nama');
} else {
    $batas = 16;
    $jumlah_data = num_rows('product');
    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;
    $total_halaman = ceil($jumlah_data / $batas);
    $produk = getPageAssoc('product', $halaman_awal, $batas);
    $nomor = $halaman_awal + 1;
}
?>

<div class="container">
    <form class="controll" style="justify-content: space-between;">
        <div class="input-control-twoRow">
            <div class="input-control">
                <select id='kategoriList' name="kategori" onchange="subaru()">
                    <?php foreach ($kategori as $k) :
                        if (isset($_GET['kategori'])) {
                    ?>
                        <option value="<?= $k[0] ?>"<?=$_GET['kategori'] ==  $k[0] ? 'selected' : ' '?>><?= $k[1] ?></option>
                        <?php }else{
                        ?>
                        <option value="<?= $k[0] ?>"><?= $k[1] ?></option>
                    <?php } endforeach; ?>
                </select>
            </div>
            <div class="input-control">
                <select id="subKategori" name="subkategori">

                </select>
            </div>
            <button class="btn primary sos" id='btnTambahProduk'>Cari</button>
        </div>
    </form>
    <div class="cards">
        <?php foreach ($produk as $produk) : ?>
            <div class="card" onclick="window.location='produkShow.php?id=<?= $produk['id'] ?>' ">
                <img src="admin/vendor/gambar/<?= $produk['gambar'] ?>" width="100%" alt="">
                <div class="card-body">
                    <div class="card-header">
                        <h3><?= word_limit($produk['nama'], 3) ?></h3>
                    </div>
                    <p><?= word_limit($produk['deskripsi'], 10); ?></p>
                    <h3 class="text-primary harga">Rp. <?= number_format($produk['harga'], 0, "", ".") ?></h3>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <div style="display:flex; justify-content:center;">
        <?php if (isset($halaman)) : ?>
            <div class="pagination">
                <a href="?halaman=<?= $halaman - 1 ?>" <?= $halaman - 1 == 0 ? "style='pointer-events: none;opacity:0.5;'" : ' ' ?>>&laquo;</a>
                <?php
                if (empty($_GET['cariProduk'])) {

                    for ($x = 1; $x <= $total_halaman; $x++) {
                ?>
                        <a href="?halaman=<?= $x ?>" class="<?= $x == $halaman ? "active" : '' ?>"><?= $x ?></a>

                <?php
                    }
                }
                ?>

                <a href="?halaman=<?= $halaman + 1 ?>" <?= $halaman == $total_halaman ? "style='pointer-events: none;opacity:0.5;'" : ' ' ?>>&raquo;</a>
            </div>
        <?php endif; ?>
    </div>
</div>


<script>
    subaru()


    function subaru() {
        var select = document.getElementById('subKategori')
        var kategori = document.getElementById('kategoriList')
        console.log(select)
        var id = kategori.value
        var url = 'admin/system/kategori.php?query=getsubkategoribykategori&id=' + id
        var xhr = new XMLHttpRequest;
        xhr.onloadend = function() {
            var data = JSON.parse(this.responseText);
            select.innerHTML = `
        <option value='0'>Semua Produk</option>
        `
            data.forEach(data => {
                select.innerHTML += `
            <option value='` + data['id'] + `'>` + data['sub_kategori'] + `</option>
            `
            });
        }
        xhr.open("GET", url, true)
        xhr.send()
    }
</script>
<script src="js/produkList.js"></script>

<?php
include "template/footer.php";
?>