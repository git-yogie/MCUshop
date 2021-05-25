<?php

// database login
    // username
    $username = "root";
    // password
    $password = "";

// database set
    $server = "localhost";  
    $database = "mcu-computer";

    $koneksi = new mysqli($server,$username,$password,$database);

    if($koneksi->connect_error){//cek koneksi
        die("koneksi gagal".$koneksi->connect_error); //stop jika koneksi gagal dan tampilkan erorr

    };

?>