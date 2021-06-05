<div id="login" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <h3>Login</h3>
            <span class="close" onclick="closeModal('login')">&times;</span>
        </div>
        <div class="modal-body">
            <?php if (!empty($_SESSION['alert']['value'])) : ?>
                <div class="alert   <?= $_SESSION['alert']['alert'] ?>">
                    <div class="alert-body">
                        <?= $_SESSION['alert']['value'] ?>
                    </div>
                </div>
            <?php endif;

            ?>
            <form action="system/userFronted.php?req=login" method='post'>
                <div class="input-control">
                    <label for=""><b>Email</b></label>
                    <input type="email" name="email" placeholder="Email">
                </div>
                <div class="input-control">
                    <label for=""><b>Password</b></label>
                    <input type="password" name="password" placeholder="password">
                </div>
                <button class="btn submit primary" type="submit">Masuk</button>
                <div class="footer-modal">
                    <a href="">lupa Password?</a>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="cart" class="modal">
    <div class="modal-content modal-md">
        <div class="modal-header">
            <h3>Cart</h3>
            <span class="close" onclick="closeModal('cart')">&times;</span>
        </div>
        <div class="modal-body" id="cart">
            <?php
            $total = 0;
            foreach ($cart as $c) :
                if ($c['id_pelanggan'] == $_SESSION['data-login-customer']['id']) :
                    $produk = getDataById('product', $c['id_produk']);
                    $totalXjumlah = $produk['harga'] * $c['jumlah'];
                    $total = $totalXjumlah + $total;
            ?>
                    <div class="card-pill">
                        <img src="<?= $baseUrl ?>/admin/vendor/gambar/<?= $produk['gambar'] ?>" alt="">
                        <div class="header"><b><?= word_limit($produk['nama'], 3) ?></b></div>
                        <div class="qty"><?= 'Rp ' . number_format($produk['harga'], 0, "", ".") ?> x <?= $c['jumlah'] ?></div>
                        <button class="btn danger" onclick="window.location = 'system_Mcu.php?req=delCart&url=<?= $_SERVER['REQUEST_URI'] ?>&id=<?= $c['id'] ?>'"><i class="fas fa-minus"></i> </button>
                    </div>
            <?php
                endif;
            endforeach; ?>
            <br>
            <?php if ($cartNumber > 0) { ?>
                <div style="display:flex; justify-content:space-between; align-items:baseline; margin-top:10px;">
                    <p>Total <b><?= 'Rp ' . number_format($total, 0, "", ".") ?></b></p>
                    <button class="btn primary" onclick="window.location = 'System_Mcu.php?req=checkout'">CheckOut</button>
                </div>
            <?php } else {
            ?>

                <p style="text-align: center; font-weight:bold;">anda belum menambahkan produk apapun!</p>


            <?php } ?>

        </div>
    </div>
</div>
<div id="pesanan" class="modal">
    <div class="modal-content modal-md">
        <div class="modal-header">
            <h3>Pesanan</h3>
            <span class="close" onclick="closeModal('pesanan')">&times;</span>
        </div>
        <div class="modal-body">
            <style>
                .cancel {

                    padding: 5px;
                    outline: none;
                    border: none;
                    color: white;
                    cursor: pointer;
                    border-radius: 5px;
                    font-size: 12px;
                    box-sizing: border-box;
                }
            </style>
            <?php foreach ($pesanan as $pesan) : ?>
                <div class="card" style="width: 100%;">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <div class="card-pill">
                            <div class="header"><b>#<?= $pesan['id'] ?></b></div>
                            <p style="display: block;">Status : <?= statusPesan($pesan['status']) ?></p>
                            <p style="display: block;">tanggal Pesan : <?= $pesan['tanggal_pesan'] ?></p>
                            <?php if ($pesan['status'] == 0) { ?>
                                <button class="cancel danger" style=" width: auto;" onclick="window.location = 'System_Mcu.php?req=delPesan&id=<?= $pesan['id'] ?>'">Batalkan</button>
                            <?php } elseif ($pesan['status'] == 2) { ?>
                                <button class="cancel success" style=" width: auto;" onclick="window.location = 'System_Mcu.php?req=diterima&id=<?= $pesan['id'] ?>'">Terima</button>
                            <?php } ?>
                        </div>
                        <?php $produk = json_decode($pesan['produk_id_qty']);
                        $total = 0;
                        foreach ($produk as $produk) :
                            $getproduk = getDataById('product', $produk[0]);
                            if (isset($produk[2])) {
                                $totalXjumlah = $getproduk['harga'] - ($getproduk['harga'] * ($produk[2] / 100));
                            } else {
                                $totalXjumlah = $getproduk['harga'] * $produk[1];
                            }
                            $total = $totalXjumlah + $total;
                        ?>
                            <div class="card-pill">
                                <img src="<?= $baseUrl ?>/admin/vendor/gambar/<?= $getproduk['gambar'] ?>" alt="">
                                <div class="header"><b><?= word_limit($getproduk['nama'], 3) ?></b></div>
                                <?php if (isset($produk[2])) {
                                ?>
                                    <div class=""><?= 'Rp ' . number_format($getproduk['harga'] - ($getproduk['harga'] * ($produk[2] / 100)), 0, "", ".") ?> Diskon <?= isset($produk[2]) ? $produk[2].'%' : $produk[1] ?></div>
                                <?php
                                } else {
                                ?>
                                    <div class=""><?= 'Rp ' . number_format($getproduk['harga'], 0, "", ".") ?> x <?= isset($produk[2]) ? $produk[2] : $produk[1] ?></div>

                                <?php
                                } ?>
                            </div>

                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<footer class="primary">
    <div class="copy"><small> Copyright 2021 © MCU-Computer | Powered By MCU Team</small></div>
</footer>
<script src="js/addon.js"></script>
<script src="js/halaman1.js"></script>
<script>
    <?php if (!empty($_SESSION['modal'])) : ?>
        showModal('<?= $_SESSION['modal'] ?>')
    <?php endif;
    unset($_SESSION['modal']);
    ?>

    <?php if (!empty($_SESSION['alert']['value'])) : ?>
        showModal('login');
    <?php endif;
    unset($_SESSION['alert'])
    ?>

    function showDropdown(id) {
        var Dropdown = document.getElementById(id)
        Dropdown.classList.toggle('showDropdown')
    }
    var btnBars = document.getElementById('btn-bars')
    const close = document.getElementById('closeNav')
    const search = document.getElementById('searchTogle')

    btnBars.addEventListener('click', () => {
        document.getElementById('links').classList.add('slide')
    })

    close.addEventListener('click', () => {
        document.getElementById('links').classList.remove('slide')
    })

    search.addEventListener('click', () => {
        document.getElementById('search').classList.toggle('show-search')
        document.querySelector('#searchTogle i').classList.toggle('fa-times')
        document.querySelector('#searchTogle').classList.toggle('midnight')
    })

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>

</body>

</html>