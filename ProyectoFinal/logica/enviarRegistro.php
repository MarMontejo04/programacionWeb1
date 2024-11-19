<link type="text/css" rel="stylesheet" href="estilos/materialize.min.css"  media="screen,projection"/>
<link type="text/css" rel="stylesheet" href="estilos/style.css"  media="screen,projection"/>
    
<?php
include "./conexion.php";
mysqli_set_charset($conexion,'utf8');
$nombreUser=$_POST['nombre'];

$buscarusuario="SELECT * FROM usuarios WHERE nombre='$nombreUser'";

$resultado = $conexion -> query($buscarusuario);
$count =mysqli_num_rows($resultado);
if($count==1){
    echo"<br><h1>El usuario ya esta registrado</h1>";
    echo "<a href='../Registro.php'>Nuevo registro</a>";

}else{

    mysqli_query($conexion,"INSERT INTO usuarios(
        nombre, apellido, correo, contraseña, telefono, fecha_nacimiento, direccion)
        VALUES(
            '$_POST[nombre]',
            '$_POST[apellido]',
            '$_POST[correo]',
            '$_POST[contraseña]',
            '$_POST[telefono]',
            '$_POST[fecha_nacimiento]',
            '$_POST[direccion]'
        )");
        echo "<br> <h1>Usuario creado con exito</h1>";
        echo "<a href='../Registro.php'>Puedes generar un nuevo registro</a>";
        echo "<a href='../Principal.php'>Ver registros</a>";
}
 

?>