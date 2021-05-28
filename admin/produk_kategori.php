<?php
include "template/header.php";

?>
<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'produk.php'"><i class="fas fa-arrow-left"></i> kembali</button>
        <ul class="breadcrumb">
            <li><a href="produk.php">Data Produk</a></li>
            <li>Kategori</li>
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
            <h3>Kategori Produk</h3>
            <div class="btn primary" id="cat"><i class="fas fa-edit"></i>Tambah Kategori</div>
        </div>
        <table id='kategori' class="kategori-table">
            
        </table>
    </div>
</div>
<!-- modal boxes -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <h3>Tambah Kategori</h3>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <form action="system/kategori.php?query=add" method="POST">
                <div class="input-control">
                    <label for=""><b>kategori</b></label>
                    <input type="text" name="kategori" placeholder="kategori">
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
            <form action="system/kategori.php?query=update" method="POST">
                <div class="input-control">
                    <label for=""><b>Edit kategori</b></label>
                    <input type="hidden" id='kid' name="id" value="">
                    <input type="text" name="kategori" id="kategoriInput" value="" placeholder="kategori">
                    <button class="btn primary submit block" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script src="<?= $baseUrl ?>/admin/vendor/js/produk.js"></script>



<?php include "template/footer.php" ?>