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
        FROM sumber_air_upaya_peningkatan 
        JOIN upaya_peningkatan_ketersediaan_air ON sumber_air_upaya_peningkatan.id_upaya_peningkatan_ketersediaan_air = upaya_peningkatan_ketersediaan_air.id_upaya_ketersediaan_air 
        WHERE sumber_air_upaya_peningkatan.id_sumber_air =" . $find;
        $result = mysqli_query($conn, $query);
        return $result;
    }

    function readCheckedUpaya($id) {
        global $conn;

        $query = "SELECT *
            FROM
            sumber_air_upaya_peningkatan
            WHERE
            id_sumber_air =" . $id;

        $eksekusi = mysqli_query($conn, $query);

        return $eksekusi;
    }


    function readTable($table){
        global $conn;
        $query = "SELECT * FROM ".$table;
        $result = mysqli_query($conn, $query);


        return $result;
    };
function addWater($data, $file, $listUpaya)
{

    global $conn;
    $foto = $file['image']['name'];
    $tempNamaFoto = $file['image']['tmp_name'];
    $direktori = 'images/foto_sumber_air/' . $foto;
    $isMoved = move_uploaded_file($tempNamaFoto, $direktori);

    if(!$isMoved) $foto = 'default.png';

       
    $namaSumberAir = $data['nama_sumber_air'];
    $wilayah = $data['wilayah'];
    $jenis = $data['jenis_sumber_air'];
    $kondisi = $data['kondisi'];
    $suhu = $data['suhu'] / 10.0;
    $pH = $data['pH'] / 10.0;
    $warna = $data['warna'];
    $kelayakan = $data['layak_minum'];


    $query = "INSERT INTO sumber_air VALUES(
        '',
        '$namaSumberAir',
        '$kondisi',
        '$suhu',
        '$warna',
        '$pH',
        '$kelayakan',
        '$jenis',
        '$wilayah',
        '$foto'
    )";

    $result = mysqli_query($conn, $query);

    $isSucceed = mysqli_affected_rows($conn);
    if($isSucceed > 0) {
        $query = "SELECT id_sumber_air FROM sumber_air WHERE nama_sumber_air LIKE '$namaSumberAir'";
        $result = mysqli_query($conn, $query);
        while($data = mysqli_fetch_assoc($result)) {
            $id = $data['id_sumber_air'];
        }
        foreach ($listUpaya as $upaya) {
            $query = "INSERT INTO sumber_air_upaya_peningkatan VALUES(
                '',
                '$id',
                '$upaya'
            )";
            $result = mysqli_query($conn, $query);
        }
    }
    
    //mengembalikan nilai sukses
    return $isSucceed;
}

function updateWater($data, $file, $listUpaya)
{

    global $conn;
    $id = $data['id_sumber_air'];   
    $namaSumberAir = $data['nama_sumber_air'];
    $wilayah = $data['wilayah'];
    $jenis = $data['jenis_sumber_air'];
    $kondisi = $data['kondisi'];
    $suhu = $data['suhu'] / 10.0;
    $pH = $data['pH'] / 10.0;
    $warna = $data['warna'];
    $kelayakan = $data['layak_minum'];
    $foto = $file['image']['name'];

    $sumberUpaya = readUpayaSumberAir($id);

    
    



    if ($foto != "") {

        $tempNamaFoto = $file['image']['tmp_name'];
        $direktori = 'images/foto_sumber_air/' . $foto;
        move_uploaded_file($tempNamaFoto, $direktori);
        $query = "UPDATE sumber_air 
        SET 
        nama_sumber_air = '$namaSumberAir', 
        foto_sumber_air = '$foto', 
        id_wilayah = '$wilayah', 
        id_jenis_sumber_air = '$jenis',
        kondisi_sumber_air = '$kondisi', 
        suhu = '$suhu',
        pH = '$pH',
        warna = '$warna',
        layak_minum = '$kelayakan'
        WHERE id_sumber_air = $id";
        //return $query;
        $result = mysqli_query($conn, $query);
    } else {
        $query = "UPDATE sumber_air SET 
        nama_sumber_air = '$namaSumberAir', 
        id_wilayah = '$wilayah', 
        id_jenis_sumber_air = '$jenis',
        kondisi_sumber_air = '$kondisi',  
        suhu = '$suhu',
        pH = '$pH',
        warna = '$warna',
        layak_minum = '$kelayakan'
        WHERE id_sumber_air = $id";
        //return $query;
        $result = mysqli_query($conn, $query);
    }

    $isSucceed = mysqli_affected_rows($conn);

    if ($isSucceed > 0) {
        foreach ($sumberUpaya as $upaya) {
            $query = "DELETE FROM sumber_air_upaya_peningkatan WHERE id_sumber_air_upaya_peningkatan = " . $upaya['id_sumber_air_upaya_peningkatan'];
            $result = mysqli_query($conn, $query);
        }
        foreach ($listUpaya as $upaya) {
            $query = "INSERT INTO sumber_air_upaya_peningkatan VALUES('','$id', '$upaya')";
            $result = mysqli_query($conn, $query);
        }
    }
    
    //mengembalikan nilai sukses
    return $isSucceed;
}

function deleteWater($id){
    global $conn;

    $sumberUpaya = readUpayaSumberAir($id);
    while ($listUpaya = mysqli_fetch_assoc($sumberUpaya)) {
        $query = "DELETE FROM sumber_air_upaya_peningkatan WHERE id_sumber_air_upaya_peningkatan = ".$listUpaya['id_sumber_air_upaya_peningkatan'];
        $result = mysqli_query($conn, $query);
    }
    $query = "DELETE FROM sumber_air WHERE id_sumber_air = $id";
    $result = mysqli_query($conn, $query);


    $isSucceed = mysqli_affected_rows($conn);


    // mengembalikan nilai sukses
    return $isSucceed;
}

function register($data) {
    global $conn;

    $username = strtolower(stripslashes($data["username"]));

    $password = mysqli_real_escape_string($conn, $data["password"]);
    $confirm = mysqli_real_escape_string($conn, $data["confirm"]);

    $result = mysqli_query($conn, "SELECT username FROM admins WHERE username = '$username'");

    if(mysqli_fetch_assoc($result)) {
        echo "<script>
                alert('Username is taken!');
            </script>";
        return false;
    }

    if($password !== $confirm) {
        echo     "<script>
                    alert('Password and Confirmation does not match');
                </script>";
        return false;
    }

    $password = password_hash($password, PASSWORD_ARGON2I);

    // var_dump($password); die; 
    $query = "INSERT INTO admins VALUES('', '$username', '$password')";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}
 
    

?>
