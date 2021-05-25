<?php
include "template/header.php";
include 'dataSource\queryTable.php';
include 'system/function.php';
session_start();
$user = getAllData('user');
?>