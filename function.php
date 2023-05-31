<?php
    include('config.php');

    function readSumberAir(){
        global $conn;

        $query = "SELECT * FROM sumber_air 
        JOIN wilayah ON sumber_air.id_wilayah = wilayah.id_wilayah
        JOIN jenis_sumber_air ON sumber_air.id_jenis_sumber_air = jenis_sumber_air.id_jenis_sumber_air
        ORDER BY 'nama_sumber_air' ASC";

        $eksekusi = mysqli_query($conn, $query);

        return $eksekusi;
    }


    function readOneSumberAir($id){
        global $conn;

        $query = "SELECT * FROM sumber_air 
        JOIN wilayah ON sumber_air.id_wilayah = wilayah.id_wilayah
        JOIN jenis_sumber_air ON sumber_air.id_jenis_sumber_air = jenis_sumber_air.id_jenis_sumber_air
        WHERE sumber_air.id_sumber_air = " . $id;

        $eksekusi = mysqli_query($conn, $query);

        return $eksekusi;
    }


    function readUpayaSumberAir($find){
        global $conn;

        $query = "SELECT *
            FROM
            sumber_air_upaya_peningkatan
            Inner Join upaya_peningkatan_ketersediaan_air ON sumber_air_upaya_peningkatan.id_upaya_peningkatan_ketersediaan_air = upaya_peningkatan_ketersediaan_air.id_upaya_ketersediaan_air
            WHERE
            id_sumber_air =" . $find;

        $eksekusi = mysqli_query($conn, $query);

        return $eksekusi;
    }

 
    

?>