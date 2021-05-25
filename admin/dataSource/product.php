<?php

include "../system/database.php";

$sql = "SELECT * FROM product";

$result = $koneksi->query($sql);

echo json_encode($result->fetch_all());