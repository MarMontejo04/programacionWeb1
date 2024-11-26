<?php
require './conexion.php';
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$email = $_POST['correo'];
$clave = $_POST['contrasena'];

$q = "SELECT COUNT(*) AS contar FROM usuarios WHERE correo = '$email' AND contrasena = '$clave'";

$consulta = mysqli_query($conexion,$q);

$array = mysqli_fetch_array($consulta);

mysqli_set_charset($conexion, 'utf8');

if ($array['contar'] > 0) {

    $_SESSION['username'] = $email;
    header("location: ../Principal.php");
    
} else {
    header("location: ../indexError.php");
}


?>