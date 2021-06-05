<?php
include "admin/system/config.php";
include "admin/system/database.php";
include "admin/dataSource/queryTable.php";
session_start();
if(isset($_GET['form'])){
    if(isset($_SESSION['data-login-customer'])){
        $form = $_GET['form'];
        $data = getDataById('customer',$_SESSION['data-login-customer']['id']);
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/signUp.css">
    <title><?=isset($form)? 'Edit Akun' : 'Sign Up MCU'  ?></title>
</head>
<style>
    body {
        background-image: url('<?= $baseUrl ?>/vendor/sign up.png');
        background-size: cover;
    }
</style>

<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <small style="color: #95a5a6;">Welcome to MCU</small>
                <h2><?=isset($form)? 'update your account' : 'Create your account'  ?></h2>
            </div>
            <form <?=isset($form)? 'action="system/userFronted.php?form=edit" ' : 'action="system/userFronted.php?form=daftar"'  ?>  class="controll" style="margin-top: 10px;" method="POST">
                <div class="input-control">
                    <label for="">Nama Lengkap</label>
                    <input type="text" name="nama" id="" <?=isset($form)? 'value="'.$data['nama'].'"' : ' '  ?>  placeholder="Nama Lengkap " autocomplete="disable" required>
                </div>
                <div class="input-control">
                    <label for="">Email</label>
                    <input type="email" name="email" <?=isset($form)? 'value="'.$data['email'].'"' : ' '  ?> placeholder="Email" required>
                    <small>Pastikan Menggunakan alamat email aktif!</small>
                    <div class="alert">
                    </div>
                </div>
                <div class="input-control">
                    <label for="">Password</label>
                    <input type="password" name="password" id="password" autocomplete="disable" placeholder="Password"  <?=isset($form)? '' : 'required'  ?>>
                    <div class="alert">
                    </div>
                </div>
                <div class="input-control">
                    <label for="">No Hp</label>
                    <input type="text" name="noHp" <?=isset($form)? 'value="'.$data['nohp'].'"' : ' '  ?> placeholder="No Hp" autocomplete="disable" required>
                    <small>Pastikan No hp dapat dihubungi!</small>
                    <div class="alert">
                    </div>
                </div>
                <div class="input-control">
                    <label for="">Alamat Lengkap</label>
                    <textarea name="alamat" id="" required><?=isset($form)? $data['alamatLengkap'] : ' '  ?></textarea>
                    <small>Masukan alamat rumah yang lengkap!</small>
                    <div class="alert">
                    </div>
                </div>
                <button class="btn" style="width: 100%; margin-top: 20px ;">Daftar</button>
            </form>
        </div>
    </div>
    <script>

    </script>
</body>

</html>