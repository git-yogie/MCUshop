<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';



if (!empty($_GET['cariProduk'])) {
    $keyword = $_GET['cariProduk'];
    $data = searchAssoc($keyword, 'pesanan', 'nama  ');
} elseif (isset($_GET['status'])) {
    $data = getDataBycolumn('pesanan', 'status', $_GET['status']);
} else {
    $batas = 10;
    $jumlah_data = num_rows('pesan');
    $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
    $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;
    $total_halaman = ceil($jumlah_data / $batas) + 1;
    $data = getPageAssoc('pesanan', $halaman_awal, $batas);
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
        <div class="nav-table">
            <h2>Pesanan</h2>
            <div class="search">
                <form action="">
                    <div class="input-control">
                        <select name="status">
                            <option value="0">Belum dibayar</option>
                            <option value="1">Sedang diproses</option>
                            <option value="2">Telah Dikirim</option>
                            <option value="3">Diterima</option>
                        </select>
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
                <td>Total</td>
                <td>status</td>
                <td>tanggal pesan</td>
                <td>Aksi</td>
            </tr>
            <?php
            if (isset($_GET['status'])) {
                $no = 1;
            } else {
                $no = $halaman_awal + 1;
            }
            if (count($data) == 0) {
                echo "<tr ><td colspan ='6' style='text-align:center; margin:10px;'>Tidak ada hasil</td></tr>";
            }
            foreach ($data as $data) :
                $pemesan = getDataById('customer', $data['pemesan_id']);
            ?>
                <tr>
                    <td><?= $no ?></td>
                    <td style="width='100px"><?= $pemesan['nama'] ?></td>
                    <td><?= $data['totalBayar'] ?></td>
                    <td><?= statusPesan($data['status']) ?></td>
                    <td><?= $data['tanggal_pesan'] ?></td>
                    <td>
                        <button onclick="detail(<?= $data['id'] ?>)" class="btn primary" onclick="hapus(<?= $data['id'] ?>)"><i class="fas fa-info"></i> detail</button>
                    </td>
                </tr>
            <?php
                $no++;
            endforeach; ?>
        </table>
        <?php if (isset($halaman)) : $x = 1 ?>
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

    <div id="detailPesan" class="modal">
        <!-- Modal content -->
        <div class="modal-content modal-lg">
            <div class="modal-header">
                <h3>Detail Pesanan</h3>
                <span class="close" onclick="closeModal('detailPesan')">&times;</span>
            </div>
            <div class="modal-body">
                <div class="card-square" style="color:black; background-color:white;justify-content:start; width:100%; margin:0px auto; " id='cardSquare'>
                    <h3>data Customer</h3>
                    <table id="dataPemesan" style="height:200px">

                    </table>
                </div>
                <h3>Pesanan Produk</h3>
                <div class="table-Admin">
                    <table id='tabelproduk'>



                    </table>

                </div>
                <style>
                    .container-buttonBawah {
                        display: flex;
                        justify-content: space-between;
                        align-items: baseline;
                        width: 100%;
                        padding: 10px;
                    }

                    .container-buttonBawah .textP {
                        display: flex;

                    }

                    .textP p {
                        margin-left: 20px;
                    }

                    .buttonStatus {}
                </style>
                <div class="container-buttonBawah" style="text-align:center; margin:10px;">
                    <div class="textP">Total yang harus diBayar :<b id='totalBayar'></b></div>
                    <form id='setStatus'>
                        <div class="input-control">
                            <input type="hidden" name="id" id="inputId">
                            <select name="status">
                                <option value="0">Belum dibayar</option>
                                <option value="1">Sedang diproses</option>
                                <option value="2">Telah Dikirim</option>
                                <option value="3">Diterima</option>
                            </select>
                        </div>
                        <button type="submit" class="btn info"><i class="fas fa-check"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?= $baseUrl ?>/admin/vendor/js/addon.js"></script>
<script>
    function detail(id) {
        showModal('detailPesan')
        var setStatus = document.getElementById('setStatus')
        var inputId = document.getElementById('inputId').value = id
        setStatus.action = 'system/pesanan.php'
        var dataPemesan = document.getElementById('dataPemesan')
        var dataproduk = document.getElementById('tabelproduk')
        var totalBayar = document.getElementById('totalBayar')
        var url = "system/pesanan.php?query=getAllData&id=" + id
        var xhr = new XMLHttpRequest;
        xhr.onloadend = function() {
            var data = JSON.parse(this.responseText);
            var pemesan = data['pemesan'];
            var pemesanHtml = `
                        <tr>
                            <td>Nama</td>
                            <td>: ` + pemesan['nama'] + `</td>
                        </tr>
                        <tr>
                            <td>nohp</td>
                            <td>:  ` + pemesan['nohp'] + `</td>
                        </tr>
                        <tr>
                            <td>email</td>
                            <td>: ` + pemesan['email'] + `</td>
                        </tr>
                        <tr>
                            <td>alamat</td>
                            <td>: ` + pemesan['alamatLengkap'] + `</td>
                        </tr>
            `
            dataPemesan.innerHTML = pemesanHtml
            var tempProduk = ` <tr>
                            <td>No</td>
                            <td>Produk</td>
                            <td>harga</td>
                            <td>Jumlah</td>
                            <td>diskon</td>
                        </tr>`
            var no = 1
            data['produk'].forEach(produk => {
                if (produk['diskon']) {
                    tempProduk += `
                    <tr>
                    <td>` + no + `</td>
                    <td>` + produk['nama'] + `</td>
                                <td>Rp ` + dotInt(produk['harga']) + `</td>
                                <td>` + produk['jumlah'] + `</td>
                                <td>` + produk['diskon'] + `%</td>
                            </tr>
                    `
                } else {
                    tempProduk += `
                    <tr>
                    <td>` + no + `</td>
                    <td>` + produk['nama'] + `</td>
                                <td>Rp ` + dotInt(produk['harga']) + `</td>
                                <td>` + produk['jumlah'] + `</td>
                                <td>0%</td>
                               
                            </tr>
                    `
                    no++
                }
            });
            dataproduk.innerHTML = tempProduk
            totalBayar.innerHTML = 'Rp '+dotInt(data['bayar'])


        }
        xhr.open("GET", url, true)
        xhr.send()

    }
</script>




<?php include "template/footer.php" ?>