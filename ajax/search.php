<?php

    include('../function.php');
    global $conn;
    $keyword = $_GET["keyword"];
    $sort = $_GET["sort"];
    $order = $_GET["order"];    
    $jenis = $_GET["jenis"];
    $kondisi = $_GET["kondisi"];

    // echo "<script>alert('$sort' + ' $order' + ' $jenis')</script>";

    $query = "SELECT 
        id_sumber_air, nama_sumber_air, kondisi_sumber_air, suhu, warna, pH, layak_minum, sumber_air.id_jenis_sumber_air, sumber_air.id_wilayah, foto_sumber_air, nama_wilayah, nama_jenis_sumber_air
        FROM sumber_air 
        JOIN wilayah ON sumber_air.id_wilayah = wilayah.id_wilayah
        JOIN jenis_sumber_air ON sumber_air.id_jenis_sumber_air = jenis_sumber_air.id_jenis_sumber_air
        WHERE 
        ( nama_sumber_air LIKE '%$keyword%'OR
        kondisi_sumber_air LIKE '%$keyword%'OR
        suhu LIKE '%$keyword%'OR
        warna LIKE '%$keyword%'OR
        pH LIKE '%$keyword%'OR
        layak_minum LIKE '%$keyword%'OR
        nama_wilayah LIKE '%$keyword%'OR
        nama_jenis_sumber_air LIKE '%$keyword%' ) 
        ";
    if($jenis != '') {
        $query .= "AND sumber_air.id_jenis_sumber_air = '$jenis' ";
    }
    if($kondisi != '') {
        $query .= "AND sumber_air.kondisi_sumber_air = '$kondisi' ";
    }
    
    $query .= " ORDER BY $sort $order";

    $listSumberAir = mysqli_query($conn, $query);

?>

<div class="row">
    <?php
    $count = 0;
    foreach($listSumberAir as $sumberAir) 
    {
    ?>
    <div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3" >
        <div class="custom-block bg-white shadow-lg">
                <a href="topics-detail.php?id_sumber_air=<?=$sumberAir['id_sumber_air']?>">
                        <div class="d-flex">
                            <div>
                                <h5 class="mb-2"><?=$sumberAir['nama_sumber_air']?></h5>
                                <h6 class="mb-1"><?=$sumberAir['nama_wilayah']?></h6>

                                <p class="mb-0">Kondisi Sumber Air : <?=$sumberAir['kondisi_sumber_air']?></p>
                                <p class="mb-1">Kelayakan Minum : <?=$sumberAir['layak_minum']?></p>
                            </div>

                            <span class="badge bg-design rounded-pill ms-auto"><?=$sumberAir['id_sumber_air']?></span>
                        </div>
                        <div class="image-wrapper">
                            <img class="img-fluid" src="images/foto_sumber_air/<?=$sumberAir['foto_sumber_air']?>" class="custom-block-image img-fluid" alt="" style="border-radius: 20px;">
                        </div>
                </a>
        </div>
    </div>
                                        
    <?php                                        
    }
    ?>
</div>