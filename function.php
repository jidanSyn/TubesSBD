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

?>