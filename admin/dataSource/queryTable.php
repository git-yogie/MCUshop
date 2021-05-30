<?php

// include "../system/database.php";    



function getAllData($tabel){
    global $koneksi;

    $sql = "SELECT * FROM $tabel";
    $result = $koneksi->query($sql);

    return $result->fetch_all();
}

function getAllDataAssoc($table){
    global $koneksi;
    $result = mysqli_query($koneksi,"SELECT * FROM $table");
    return mysqli_fetch_all($result,MYSQLI_ASSOC);
}

function getDataById($table,$id){
    global $koneksi;
    $result = mysqli_query($koneksi, "SELECT * FROM $table WHERE id=$id");
    return mysqli_fetch_assoc($result);
}



function getDataBycolumn($table,$column,$data){
    global $koneksi;
    $result = mysqli_query($koneksi, "SELECT * FROM $table WHERE $column=$data");
    return mysqli_fetch_all($result,MYSQLI_ASSOC);
}


function hapusData($id,$table){
    global $koneksi;
    $result = mysqli_query($koneksi, "DELETE FROM $table WHERE id=$id");
    return $result;
}

function hapusDataColumn($table,$column,$data){
    global $koneksi;
    $result = mysqli_query($koneksi, "DELETE FROM $table WHERE $column=$data");
    return $result;

}

function search($keyword,$table,$column){
    global $koneksi;
    $data = mysqli_query($koneksi,"SELECT * FROM $table WHERE $column LIKE '%".$keyword."%'");
    return $data->fetch_all();	
}

function num_rows($table){
    global $koneksi;
    $result = mysqli_query($koneksi,"SELECT * FROM $table");
    return mysqli_num_rows($result);
}

function getPage($table,$page,$limit){
    global $koneksi;
    $data = mysqli_query($koneksi, "select * from $table limit $page, $limit");
    return mysqli_fetch_all($data);

}
