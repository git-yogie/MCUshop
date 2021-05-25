<?php 
include "template/header.php";
include "system/database.php";
include "dataSource/queryTable.php";
$kategori = getAllData("kategori");
session_start();

if(isset($_GET['id'])){
    $dataProduk = getDataByid('product',$_GET['id']);
}
?>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<script>
  tinymce.init({
    selector: '#spesifikasi'
  });
</script>
<div class="container">
    <div class="header">
        <h2><?=isset($dataProduk) ? 'Update atau edit Produk' : 'Tambah Produk'?></h2>
        <button class="btn primary" onclick="window.location = 'produk.php'"><i class="fas fa-arrow-left"></i> kembali</button>
    </div>
    <?php if (!empty($_SESSION['alert'])) : ?>
        <div class="alert <?= $_SESSION['alert']['alert'] ?>">
            <?= $_SESSION['alert']['value'] ?>
        </div>
    <?php endif;
    unset($_SESSION['alert']);

    ?>
    <div class="tambah-produk">
        <form action="system/produk.php?<?=isset($dataProduk)?'query=update':'query=add' ?>" class="controll" method="POST" enctype="multipart/form-data">

           <?=isset($dataProduk)? '<input type="hidden" name="id" value="'.$_GET['id'].'">' : ''?>
            <div class="input-control">
                <label for="namaProduk">Nama</label>
                <input type="text" name="namaProduk" value="<?= isset($dataProduk) ? $dataProduk['nama'] : ''?>" placeholder="nama produk" required>
            </div>
            <div class="input-control">
                <label for="Brand">Brand</label>
                <input type="text" name="Brand"  value="<?= isset($dataProduk) ? $dataProduk['brand'] : ''?>" placeholder="Brand produk" required>
            </div>
            <div class="input-control">
                <label for="harga">harga</label>
                <input type="number" name="harga"  value="<?= isset($dataProduk) ? $dataProduk['harga'] : ''?>" placeholder="harga produk" required>
            </div>
            <div class="input-control">
                <label for="cars">Kategori</label>
                <select id="cars" name="kategori">

                    <?php for ($i=0; $i < count($kategori) ; $i++):
                    ?>
                    <option value="<?=$kategori[$i][0]?>" <?php if(isset($dataProduk)){ echo $dataProduk['Kategori'] == $kategori[$i][0]? 'selected' : ''; }?> ><?=$kategori[$i][1]?></option>
                    <?php endfor;?>
                </select>
            </div>
            <div class="input-control">
                <label for="gambar">Upload Gambar</label>
                <input type="file" name="gambar" id="gambar" <?= isset($dataProduk) ? '' : 'Required'?>>
            </div>
            <div class="input-control">
                <label for="spesifikasi">spesifikasi</label>
                <textarea name="spesifikasi"  id='spesifikasi' ><?= isset($dataProduk) ? $dataProduk['spesifikasi'] : ''?></textarea>
            </div>
            <div class="input-control">
                <label for="deskripsi">Deskripsi produk</label>
                <textarea name="deskripsi" id="" cols="30" rows="5"  ><?= isset($dataProduk) ? $dataProduk['deskripsi'] : ''?></textarea>
            </div>
            <div class="btn-group">
                <button type="submit" class="btn primary"><?=isset($dataProduk) ? 'Update' : 'Tambah Produk'?></button>
                <button type="reset" class="btn warning">Reset form</button>
            </div>
        </form>
    </div>
</div>


<?php include "template/footer.php" ?>