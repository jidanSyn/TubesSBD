<?php

include "config_wilayah.php";

$sql = "SELECT * FROM provinces";
$query = $mysqli->query($sql);
$data = [];

// pengulangan setiap rownya
while ($row = $query->fetch_array(MYSQLI_ASSOC)) {
    // masukkan id dan nama ke array data
    $data[] = ["id_prov" => $row["id"], "nama" => $row["provinces_name"]];
}
// generate json code 
echo json_encode($data);

?>
