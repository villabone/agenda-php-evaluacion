<?php
require('conector.php');
$con = new conectorBD();

$response['conexion'] = $con->initConexion($con->database);
if ($response['conexion'] == 'OK'){
    $conexion = $con->getConexion();
    $insert = $conexion->prepare('INSERT INTO usuarios (email, nombre, password , fecha_nacimiento) VALUES (?,?,?,?)');
    $insert->bind_param("ssss", $email, $nombre, $password, $fecha_nacimiento);

    $d_password = "12345";
    $email = "jjvillabona1@gmail.com";
    $nombre = "Jose villabona";
    $password = password_hash($d_password, PASSWORD_DEFAULT);
    $fecha_nacimiento = "1967-12-08";
    

    $insert->execute();

    $d_password = "1234";
    $email = 'usuario@gmail.com';
    $nombre = 'usuario';
    $password = password_hash($d_password, PASSWORD_DEFAULT);
    $fecha_nacimiento = '1976-08-04';

    $insert->execute();

    $email = 'marielo@gmail.com';
    $nombre = 'Marielo Fernada';
    $password = password_hash($d_password, PASSWORD_DEFAULT);
    $fecha_nacimiento = '1927-08-11';

    $insert->execute();
    $response['resultado'] = "1";
    $response['msg']= 'Informacio de inicio:';
    $getUsers = $con->consultar(['usuarios'],['*'],$condicion = "");
    while ($fila= $getUsers->fetch_assoc()) {
        $response['msg'].=$fila['email'];
    }
    $response['msg'].= 'contraenia: '.$d_password;
    }else{
        $response['resultado'] == "0";
        $response['msg'] = 'No se pudo conectar a la base de datos';
    }

    echo json_encode($response);





 ?>
