<?php
include "template/header.php";
include "dataSource/querytable.php";

if ($_GET['id']) {
    $id = $_GET['id'];
    $data = getDataBycolumn('sub_kategori', 'id_kategori', $id);
    $kategori = getDataById('kategori', $id);
}


?>
<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'produk_kategori.php'"><i class="fas fa-arrow-left"></i> kembali</button>
        <ul class="breadcrumb">
            <li><a href="produk.php">Data Produk</a></li>
            <li><a href="produk_kategori.php">kategori</a></li>
            <li>Sub kategori</li>
        </ul>
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
            <h3>Kategori <?= $kategori['kategori'] ?></h3>
            <div class="btn primary" id="cat"><i class="fas fa-edit"></i>Tambah sub Kategori <?=$kategori['kategori']?></div>
        </div>
        <table class="kategori-table">
            <tr>
                <td>No</td>
                <td>Nama</td>
                <td>Aksi</td>
            </tr>
            <?php
            $no = 1;
            foreach ($data as $sub) :
            ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $sub['sub_kategori'] ?></td>
                    <td>
                        <button onclick='editSubKategori(<?=$sub["id"] ?>)' class='btn warning'><i class='fas fa-edit'></i> Edit</button>
                        <button class='btn danger' onclick="hapus(<?=$sub['id']?>,<?=$kategori['id']?>)"><i class='fas fa-trash'></i> Hapus</button>
                    </td>
                </tr>
            <?php $no++;
            endforeach; ?>
        </table>
    </div>
</div>
<!-- modal boxes -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <h3>Tambah sub Kategori <?=$kategori['kategori']?></h3>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <form action="system/kategori.php?query=addsubkategori" method="POST">
                <div class="input-control">
                    <label for=""><b>Sub kategori</b></label>
                    <input type="hidden" name="id" value="<?=$kategori['id']?>">
                    <input type="text" name="sub_kategori" placeholder="Sub kategori">
                    <button class="btn primary submit block" type="submit">tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="edit-modal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-body">
            <form action="system/kategori.php?query=updatesubkategori&page=<?=$kategori['id']?>" method="POST">
                <div class="input-control">
                    <label for=""><b>Edit kategori</b></label>
                    <input type="hidden" id='idSub' name="id" value="">
                    <input type="text" name="Subkategori" id="SubkategoriInput" value="" placeholder="kategori">
                    <button class="btn primary submit block" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

<script src="vendor/js/sub_kategori.js"></script>

<?php
include "template/footer.php"
?>