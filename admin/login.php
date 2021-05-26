<?php

include "system/config.php";
    session_start();

    if(!empty($_SESSION['data-login'])){
        header('location:index.php');
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=$baseUrl?>admin/vendor/css/login.css">
    <title>Login Dashboard McuShop</title>
</head>

<body>
    <div class="card" style="width: 30%;">
        <div class="card-header">
            <h2>Login Admins</h2>
        </div>
       <?php if(!empty($_SESSION['alert']['value'])) :?>
        <div class="alert-card">
           <?=$_SESSION['alert']['value']?>
        </div>
        <?php endif;
            unset($_SESSION['alert']);
        
        ?>
        <form action="system/login_check.php" class="controll" style="margin-top: 10px;" method="POST">
            <div class="input-control">
                <label for="">Username</label>
                <input type="text" name="username" id="" placeholder="username ">
            </div>
            <div class="input-control">
                <label for="">Password</label>
                <input type="password" name="password" placeholder="Password">
                <div class="alert">
                </div>
                <button class="btn" style="width: 100%; margin-top: 20px ;">Masuk</button>
            </div>
        </form>
    </div>
</body>

</html>