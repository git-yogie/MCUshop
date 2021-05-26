<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';

$slider = getAllData('slider');

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
        <div class="nav-table">
            <h3>Slider Home Page</h3>
            <div class="btn primary" id="cat"><i class="fas fa-edit"></i>Tambah slider</div>
        </div>
        <table>
            <tr>
                <td>No</td>
                <td>Nama</td>
                <td>Slider</td>
                <td>Aksi</td>
            </tr>
            <?php
            $no = 1;
            foreach ($slider as $slide) : ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $slide[1] ?></td>
                    <td><?= $slide[2] ?></td>
                    <td>
                        <a href='system/dashboard.php?system=slider&query=aktivasi&id=<?=$slide[0]?>' class="btn <?=$slide[3] == 1 ? 'success' : 'danger'?>"><i class="fas fa-power-off"></i></i> aktif</a>
                        <button onclick='editSlider(<?=$slide[0]?>)' class='btn warning'><i class='fas fa-edit'></i> Edit</button>
                        <button class="btn danger" onclick="hapus(<?= $slide[0] ?>)"><i class="fas fa-trash"></i> Hapus</button>
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
        <div class="modal-body">
            <form action="system/dashboard.php?system=slider&query=add" method="POST" enctype="multipart/form-data">
                <div class="input-control">
                    <label for=""><b>Upload Slider</b></label>
                    <input type="text" name="nama" placeholder="nama slider">
                    <input type="file" name="slider">
                    <button class="btn primary submit block" type="submit">upload</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="edit-modal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-body">
            <form action="system/dashboard.php?system=slider&query=update" method="POST" enctype="multipart/form-data">
                <div class="input-control">
                    <h3>edit Gambar Slider</h3>
                    <input type="hidden" id='kid' name="id" value="">
                    <input type="text" name="nama" id='nama' placeholder="nama slider">
                    <input type="file" name="slider">
                    <button class="btn primary submit block" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script src="<?= $baseUrl ?>/admin/vendor/js/slider.js"></script>
<?php include "template/footer.php" ?>