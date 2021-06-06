<?php
include "template/header.php";

if(isset($_POST['pesan'])){
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $pesan = mysqli_escape_string($koneksi,$_POST['message']);
    $result = mysqli_query($koneksi,"INSERT INTO pesan(nama,email,pesan) VALUE ('$nama','$email','$pesan')");
    if ($result == true) {
        $_SESSION['toast'] = [
            'alert' => 'success',
            'value' => 'Pesan anda berhasil terkirim, kami akan membalasnya melalui email anda!',
        ];
        header('location:about.php');
    }else{
       echo mysqli_error($koneksi);    }
}
?>
<script src="admin/vendor/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>

<script>
    tinymce.init({
        selector: '#pesan',
        height: 400,
        plugins: [
            'advlist autolink link image lists charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks code fullscreen insertdatetime media nonbreaking',
            'table emoticons template paste help'
        ],
        toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | ' +
            'bullist numlist outdent indent | link image | print preview media fullpage | ' +
            'forecolor backcolor emoticons | help',
        menu: {
            favs: {
                title: 'My Favorites',
                items: 'code visualaid | searchreplace | emoticons'
            }
        },
        menubar: 'favs file edit view insert format tools table help',
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
</script>
<link rel="stylesheet" href="<?=$baseUrl?>/css/about.css">
<div class="container">
    <div class="img-container">
        <img src="vendor/Tampilan 4.png" style="width:100%">
    </div>
    <div class="text-about">
        <h2>About US</h2>
        <p>
            MCU Computer menghadirkan produk-produk komputer berkualitas dari brand-brand ternama, produk yang kami jual seperti, notebook, komputer, komponen komputer, Aksesoris komputer, peralatan jaringan, dan masih banyak lagi jenis produk MCU komputer.
        </p>
        <p>
            kami mengedepankan kualitas produk, kualitas layanan, serta pelayanan after sales MCU komputer berusaha menghadirkan produk-produk tidak hanya melalui toko ofline tapi juga e-comerce untuk dapat memaksimalkan pengalaman belanja anda dalam mendapatkan
            produk komputer sesuai dengan kebutuhan anda.
        </p>
    </div>
    <br>
    <br>
    <h2 style="text-align: center;">Percaya Kami</h2>
    <div class="about-icons">
        <div class="us">
            <img src="vendor/Frame 10 (1).png" alt="">
            <p>Harga Murah</p>
        </div>
        <div class="us">
            <img src="vendor/Frame 8.jpg" alt="">
            <p>Penjual Terpercaya</p>
        </div>
        <div class="us">
            <img src="vendor/Frame 9.png" alt="">
            <p>Barang Dijamin Sampai</p>
        </div>
        <div class="us">
            <img src="vendor/Frame 6 (1).jpg" alt="">
            <p>Kemudahan Belanja</p>
        </div>
        <div class="us">
            <img src="vendor/Frame 7.jpg" alt="">
            <p>Keamanan</p>
        </div>
    </div>
    <br>
    <br>
    <div class="social-media">
        <h2>Ikuti Kami</h2>
        <div class="icons">
            <a href="#" class="fab fa-instagram"></a>
            <a href='#' class="fab fa-facebook-square"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-youtube"></a>
        </div>
    </div>
    <div class="contact-us">
        <div class="contact">
            <h3>Contact Us</h3>
            <form action="" method="post">
                <div class="input-control">
                    <label for="">Nama</label>
                    <input type="text" name="nama" <?=isset($_SESSION['data-login-customer']) ?'value="'.$_SESSION['data-login-customer']['nama'].'"' : ''?> >
                </div>
                <div class="input-control">
                    <label for="">Email</label>
                    <input type="email" name="email" <?=isset($_SESSION['data-login-customer']) ?'value="'.$_SESSION['data-login-customer']['email'].'"' : ''?> >
                </div>
                <div class="input-control">
                    <label for="">Pesan</label>
                    <textarea name="message"  cols="30" rows="10"></textarea>
                </div>
                <button class="btn submit primary" name="pesan" type="submit">Send</button>

            </form>
        </div>
        <div class="location">
            <h3>Toko Ofline</h3>
            <p>Jln.Hm Arsyad km 90 No.101, Sampit, Kalimantan Tengah</p>
            <div class="container-location">
                <img src="vendor/lokasi.png" alt="Avatar" class="image" style="width:100%">
                <div class="middle">
                    <a href="https://www.google.com/maps/@-2.5513778,112.9561412,15z" target="_blank" class="text-location btn">Buka Map</a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
include "template/footer.php";
?>