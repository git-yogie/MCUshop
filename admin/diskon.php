<?php
include "template/header.php";
date_default_timezone_set('Asia/Jakarta');
?>
<div class="container">
    <div class="header">
        <button class="btn primary" onclick="window.location = 'index.php'"><i class="fas fa-arrow-left"></i> kembali</button>
    </div>
    <div class="alert " id='alerts'>
    </div>
    <div class="table-Admin">
        <div class="nav-table">
            <h3>Diskon produk</h3>
            <div class="btn primary" id="btnAdd" onclick="showModal('addModal')"><i class="fas fa-edit"></i> Tambah diskon</div>
        </div>
        <table id='tabelDiskon'>

        </table>
        <div id="spin">

        </div>

    </div>
</div>
<!-- modal boxes -->

<div id="addModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content modal-md">
        <div class="modal-header">
            <h3>Tambah Diskon</h3>
            <span class="close" onclick="closeModal('addModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form action="" id='formAdd' class="controll" method="POST">
                <div class="input-control">
                    <label for="">Judul Diskon</label>
                    <input type="text" name="nama" placeholder="nama diskon">
                </div>
                <div class="input-control">
                    <label for="">Detail</label>
                    <textarea name="detail" id="" cols="30" rows="10"></textarea>
                </div>
                <div class="input-control">
                    <label for="">jumlah Diskon (maks 70%)</label>
                    <input type="number" name="diskon" id="diskon">
                </div>
                <div class="input-control-twoRow">
                    <div class="input-control">
                        <label for="">tanggal dimulai</label>
                        <input type="date" name="date-start" placeholder="tanggal">
                    </div>
                    <div class="input-control">
                        <label for="">waktu dimulai</label>
                        <input type="time" name="time-start">
                    </div>

                </div>
                <div class="input-control-twoRow">
                    <div class="input-control">
                        <label for="">tanggal berakhir</label>
                        <input type="date" name="date-end" placeholder="tanggal">
                    </div>
                    <div class="input-control">
                        <label for="">waktu berakhir</label>
                        <input type="time" name="time-end">
                    </div>

                </div>
                <button class="btn primary submit block" type="submit">tambah</button>
            </form>
        </div>
    </div>
</div>
</div>
<div id="editModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content modal-md">
        <div class="modal-header">
            <h3>Edit Diskon</h3>
            <span class="close" onclick="closeModal('editModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form action="" id='formEdit' class="controll" method="POST">
                <input type="hidden" name="id" id='Eid'>
                <div class="input-control">
                    <label for="">Judul Diskon</label>
                    <input type="text" name="nama" id="namaDiskon" placeholder="nama diskon">
                </div>
                <div class="input-control">
                    <label for="">Detail</label>
                    <textarea name="details" id="editDetail" cols="30" rows="10"></textarea>
                </div>
                <div class="input-control">
                    <label for="">jumlah Diskon (maks 70%)</label>
                    <input type="number" name="diskon" id="diskonEdit">
                </div>
                <div class="input-control-twoRow">
                    <div class="input-control">
                        <label for="">tanggal dimulai</label>
                        <input type="date" name="date-start" id="date-start" placeholder="tanggal">
                    </div>
                    <div class="input-control">
                        <label for="">waktu dimulai</label>
                        <input type="time" name="time-start" id="time-start">
                    </div>

                </div>
                <div class="input-control-twoRow">
                    <div class="input-control">
                        <label for="">tanggal berakhir</label>
                        <input type="date" name="date-end" id="date-end" placeholder="tanggal">
                    </div>
                    <div class="input-control">
                        <label for="">waktu berakhir</label>
                        <input type="time" name="time-end" id="time-end">
                    </div>

                </div>
                <button class="btn primary submit block" type="submit">Simpan</button>
            </form>
        </div>
    </div>
</div>
<div id="show-produk" class="modal">
    <!-- Modal content -->
    <div class="modal-content modal-lg">
        <div class="modal-header">
            <h3>Produk yang mendapat diskon</h3>
            <span class="close" onclick="closeModal('show-produk')">&times;</span>
        </div>
        <div class="modal-body">
            <form method="post" id='formTambahProduk' class="controll">
                <input type="hidden" id='id_diskon' name="idDiskon">
                <div class="input-control-twoRow">
                    <div class="input-control">
                        <select name="produk diskon" id="produkDiskon">
                        </select>
                    </div>
                    <div class="input-control">
                        <select id="kategoriProduk" onchange="SelectBykategori()">

                        </select>
                    </div>
                    <button class="btn primary" id='btnTambahProduk'>Tambah</button>
                </div>
            </form>
            <h4 style="text-align: center;">Daftar Produk yang mendapat Diskon</h4>
            <div class="table-Admin">
                <table id='tableDiskon'>

                </table>
            </div>
            <div id="loading-showProduk"></div>
        </div>
    </div>
</div>
</div>

<script src="vendor/js/addon.js"></script>
<script src="vendor/js/diskon.js"></script>