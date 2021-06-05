<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';

if(isset($_GET['query'])){
    if($_GET['query'] =='delete'){
        $result = hapusData($_GET['id'],'pesan');
        header('location:pesan.php');
    }
}

if (!empty($_GET['cariProduk'])) {
    $keyword = $_GET['cariProduk'];
    $data = searchAssoc($keyword, 'pesan', 'nama');
} else {
    $batas = 10;
    $jumlah_data = num_rows('pesan');
    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;
    $total_halaman = ceil($jumlah_data / $batas);
    $data = getPageAssoc('pesan',$halaman_awal,$batas);
    $nomor = $halaman_awal + 1;
}

?>
<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'index.php'"><i class="fas fa-arrow-left"></i> kembali</button>
      
    </div>
    <?php if (!empty($_SESSION['alert'])) : ?>
        <div class="alert <?= $_SESSION['alert']['alert'] ?>">
            <?= $_SESSION['alert']['value'] ?>
        </div>
    <?php endif;
    unset($_SESSION['alert']);
        
    ?>
    <div class="table-Admin">
        <style>
        </style>
        <div class="nav-table" >
        <h2>Pesan Customer</h2>
            <div class="search">
                <form action="">
                    <div class="input-control">
                        <input type="search" name="cariProduk" placeholder="cari customer" value="<?= isset($_GET['cariProduk']) ? $_GET['cariProduk'] : '' ?>" id="">
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
                <td>email</td>
                <td>pesan</td>
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
                    <td style="width='100px"><?= $data['nama']?></td>
                    <td><?= $data['email']?></td>
                    <td><?=$data['pesan']?></td>
                    <td>
                        <button class="btn danger" onclick="hapus(<?= $data['id'] ?>)"><i class="fas fa-trash"></i> Hapus</button>
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
            var alerts = confirm('apakah anda yakin ingin menghapus pesan?')

            if (alerts == true) {
                window.location = 'pesan.php?query=delete&&id=' + id
            }

        }
    </script>

    <script src="<?= $baseUrl ?>/admin/vendor/js/produk.js"></script>



    <?php include "template/footer.php" ?>