<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';
if (!empty($_GET['cariProduk'])) {
    $keyword = $_GET['cariProduk'];
    $data = search($keyword, 'product', 'nama');
} else {
    $batas = 10;
    $jumlah_data = num_rows('product');
    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;
    $total_halaman = ceil($jumlah_data / $batas);
    $data = getPage('product',$halaman_awal,$batas);
    $nomor = $halaman_awal + 1;
}
$kategori = getAllData("kategori");

?>
<div class="container">
    <div class="header">
        <h2>Data produk</h2>
    </div>
    <?php if (!empty($_SESSION['alert'])) : ?>
        <div class="alert <?= $_SESSION['alert']['alert'] ?>">
            <?= $_SESSION['alert']['value'] ?>
        </div>
    <?php endif;
    unset($_SESSION['alert']);
        
    ?>
    <div class="table-Admin">
        <div class="nav-table">
            <div class="nav-btn">
                <a href="tambahProduk.php" class="btn primary"><i class="fas fa-edit"></i> Tambah Produk</a>
                <a href="produk_kategori.php" class="btn primary"><i class="fas fa-edit"></i> Kategori</a>

            </div>
            <div class="search">
                <form action="">
                    <div class="input-control">
                        <input type="search" name="cariProduk" placeholder="cari produk" value="<?= isset($_GET['cariProduk']) ? $_GET['cariProduk'] : '' ?>" id="">
                    </div>
                    <button type="submit" class="btn info"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>
        <!-- <h3>Daftar Produk</h3> -->
        <table>
            <tr>
                <td>No</td>
                <td>Nama</td>
                <td>kategori</td>
                <td>harga</td>
                <td>Aksi</td>
            </tr>
            <?php
            if(empty($_GET['cariProduk'])){
                $no = $halaman_awal +1;
            }else{
                $no = 1;
            }
            if (count($data) == 0) {
                echo "<tr ><td colspan ='6' style='text-align:center; margin:10px;'>Tidak ada hasil</td></tr>";
            }
            foreach ($data as $data) :
            ?>
                <tr>
                    <td><?= $no ?></td>
                    <td style="width='100px"><?= word_limit($data[1], 4) ?></td>
                    <?php foreach ($kategori as $k) : ?>
                        <?= $data[2] == $k[0] ? '<td>' . $k[1] . '</td>' : '    ' ?>
                    <?php endforeach; ?>
                    <td><?= 'Rp ' . number_format($data[5], 0, "", ".") ?></td>
                    <td>
                        <a href='show_product.php?id=<?= $data[0] ?>' class="btn info"><i class="fas fa-info-circle"></i> Detail</a>
                        <a href='tambahProduk.php?id=<?= $data[0] ?>' class="btn warning"><i class="fas fa-edit"></i> Edit</a>
                        <button class="btn danger" onclick="hapus(<?= $data[0] ?>)"><i class="fas fa-trash"></i> Hapus</button>
                    </td>
                </tr>
            <?php
                $no++;
            endforeach; ?>
        </table>
        <?php if (isset($halaman)) :?>
        <div class="pagination">
        <a href="?halaman=<?= $halaman-1?>" <?= $halaman-1 == 0 ? "style='pointer-events: none;opacity:0.5;'" : ' ' ?>>&laquo;</a>
        <?php
        if(empty($_GET['cariProduk'])){

            for ($x = 1; $x <= $total_halaman; $x++) {
                ?>
                   <a href="?halaman=<?=$x?>" class="<?= $x == $halaman ? "active" : '' ?>"><?=$x?></a>

            <?php
            }
        }
        ?>
        
            <a href="?halaman=<?=$halaman+1?>" <?= $halaman == $total_halaman ? "style='pointer-events: none;opacity:0.5;'" : ' ' ?>>&raquo;</a>
        </div>
        <?php endif;?>
    </div>

    <script>
        function hapus(id) {
            var alerts = confirm('apakah anda yakin ingin menghapus produk?')

            if (alerts == true) {
                window.location = 'system/produk.php?query=delete&&id=' + id
            }

        }
    </script>

    <script src="<?= $baseUrl ?>/admin/vendor/js/produk.js"></script>



    <?php include "template/footer.php" ?>