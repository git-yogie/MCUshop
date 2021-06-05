<?php
session_start();
include "../admin/system/database.php";
include "../admin/dataSource/queryTable.php";

if ($_GET['query']) {
    switch ($_GET['query']) {
        case 'getCart':
          $cart = getDataBycolumn('cart','id_pelanggan',$_SESSION['data-login-customer']['id']);
            echo json_encode($cart);
            break;
        case 'getProduk':
            if($_GET['id']){
                $produk = getDataById('product',$_GET['id']);
                echo json_encode($produk);
                
            }
            break;
        
        default:
            # code...
            break;
    }

}
