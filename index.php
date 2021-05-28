<?php
include "admin/system/database.php";
include "admin/system/config.php";
include 'admin/dataSource\queryTable.php';
include 'admin/system/function.php';

$kategori = getAllData("kategori");
$slider = getAllData('slider');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<<<<<<< HEAD
    <link rel="stylesheet" href="http://localhost/MCUshop/css/main.css">
=======
    <link rel="stylesheet" href="<?=$baseUrl?>css/main.css">
    <!-- <link rel="stylesheet" href="/css/page1.css"> -->
>>>>>>> 13793aef849342ab86f051c8fecb5392b2a0187b
    <title>Toko MCU</title>
</head>

<body>
    <nav class="primary">
        <div class="responsive">
            <button class="btn bars" id="btn-bars"><i class="fas fa-bars"></i></button>
        </div>
        <div class="links" id='links'>
            <button class="btn x" id='closeNav'><i class="fas fa-times"></i></button>
            <div class="logo">MCU</div>
            <a href="#">Beranda</a>
            <div class="dropdown">
                <a href="#" id='kategori'>Produk</a>
                <div class="dropdown-content">
                    <?php foreach ($kategori as $k) : ?>
                        <a href="/produk.php?kategori=<?= $k[0] ?>"><?= $k[1] ?></a>
                    <?php endforeach; ?>
                </div>
            </div>
            <a href="/aboutUs.html">About Us</a>
        </div>
        <div class="buttons">
            <div class="search-container" id='search'>
                <input type="search" class="show" placeholder="search">
                <button class="btn search primary"><i class="fas fa-search"></i></button>
            </div>
            <div class="cart-container">
                <button class="btn cart primary"><i class="fas fa-shopping-cart"></i></button>
                <div>9+</div>
            </div>
            <button class="btn search-toggle" id='searchTogle'><i class="fas fa-search"></i></button>
            <button class="btn primary" id='btnModal'>Login</button>
            <a href="" class="link-sign">Sign Up</a>
        </div>
    </nav>
    <div class="container">

        <div class="slideshow-container">
            <?php foreach ($slider as $slide) :
                if ($slide['3'] == 1) :
            ?>
                    <div class="mySlides fade">
                        <img src="<?=$baseUrl?>admin/vendor/slider/<?= $slide[2] ?>" style="width:100%">
                    </div>
            <?php
                endif;
            endforeach; ?>
        </div>
        <br>
        <div style="text-align:center">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <?php
            $no = 1;
            foreach ($slider as $slide) :
                if ($slide['3'] == 1) :
            ?>
                    <span class="dot" onclick="currentSlide(<?=$no?>)"></span>
            <?php
                $no++;
                endif;
            endforeach; ?>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>

        <div class="header-brands">Brands</div>
        <div class="brands-container">
            <a class="brand" href="" target="blank">
                <img src="coba/img/brands1.jpg" alt="">
            </a>
            <a class="brand" href='https://www.adata.com/id/' target="blank">
                <img src="coba/img/brands2.jpg" alt="">
            </a>
            <a class="brand" href="" target="blank">
                <img src="coba/img/brands3.jpg" alt="">
            </a>
            <a class="brand" href="http://www.galax.com/" target="blank">
                <img src="coba/img/brands4.jpg" alt="">
            </a>
        </div>
        <div class="header-brands">Produk Terbaru</div>
        <div class="cards" id='product'>

        </div>
        <br>
        <h3>PC Build In</h3>
        <div class="cards-slider" id="slider">


        </div>
        <h3>card</h3>
        <div class="cards-slider">
            <div class="card-colourist">
                <div class="diskon">
                    100%
                </div>
                <p>
                    diskon 100% untuk semua produk di MCU Website
                </p>
                <b>Ai9872B</b>
            </div>
        </div>

        <div class="diskonan">
            <h3 class="diskonan-header">
                perlu Performa tinggi?
            </h3>
            <div class="diskonan-body">
                <div class="card-square">
                    <h3>Laptop Gaming berkualitas</h3>
                    <p>Laptop dengan desain garang dan modern serta spesifikasi mumpuni siap menerjang game apapun.</p>
                </div>
                <div class="cards-slider">
                    <div class="card-slide">
                        <img src="data/image/5efac19ed72fb.jpg" width="180px" alt="">
                        <div class="card-body">
                            <div class="card-header">
                                <h3>ASUS ROG Strix G</h3>
                            </div>
                            <h3 class="text-primary harga-txt">Rp.16.000.000</h3>
                        </div>
                    </div>
                    <div class="card-slide">
                        <img src="data/image/5efac19ed72fb.jpg" width="170px" alt="">
                        <div class="card-body">
                            <div class="card-header">
                                <h3>ASUS ROG Strix G</h3>
                            </div>
                            <h3 class="text-primary harga-txt">Rp.16.000.000</h3>
                        </div>
                    </div>
                    <div class="card-slide">
                        <img src="data/image/5efac19ed72fb.jpg" width="170px" alt="">
                        <div class="card-body">
                            <div class="card-header">
                                <h3>ASUS ROG Strix G</h3>
                            </div>
                            <h3 class="text-primary harga-txt">Rp.16.000.000</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <h3>Login</h3>
                <span class="close">&times;</span>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="input-control">
                        <label for=""><b>Username</b></label>
                        <input type="text" placeholder="Username">
                    </div>
                    <div class="input-control">
                        <label for=""><b>Password</b></label>
                        <input type="password" placeholder="password">
                    </div>
                    <button class="btn submit block" type="submit">Login</button>
                    <div class="footer-modal">
                        <label>
                            <input type="checkbox" name="remember"> Remember me
                        </label>
                        <a href="">lupa Password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer class="primary">
        <!-- <div class="about">
            <div class="us"><i class="fas fa-money-bill-wave-alt"></i>Harga Murah</div>
            <div class="us"><i class="fas fa-medal"></i>Penjual Terpercaya</div>
            <div class="us"><i class="fab fa-dropbox"></i>Barang Dijamin Sampai</div>
            <div class="us"><i class="fas fa-shield-alt"></i>Keamanan</div>
        </div> -->
        <div class="copy"><small> Copyright 2021 © MCU-Computer | Powered By MCU Team</small></div>
    </footer>
    <!-- <script src="js/main.js"></script> -->
    <script src="js/halaman1.js"></script>
    <script>
        // media query mobile
        var x = window.matchMedia("(max-width: 680px)")



        // tombol kategori
        const kategori = document.getElementById('kategori')
        const dropdown = document.querySelector('.dropdown-content')
        if (x.matches) {
            kategori.addEventListener('click', function() {
                console.log(dropdown)
                dropdown.classList.toggle('dropdown-show')
            })
        }




        //ini untuk modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("btnModal");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        const btnBars = document.getElementById('btn-bars')
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