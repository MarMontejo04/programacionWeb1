<?php
require 'conexion.php';
session_start();

$email = $_POST['correo'];
$clave = $_POST['clave'];

$q = "SELECT COUNT(*) AS contar FROM usuarios WHERE correo = '$email' AND contraseña = '$clave'";


$consulta = mysqli_query($conexion, $q);

$array = mysqli_fetch_array($consulta);

if ($array['contar'] > 0) {

    $_SESSION['username'] = $email;
    header("location: ../Principal.php");
    
} else {

    header("location: ../indexError.php");
}
?>