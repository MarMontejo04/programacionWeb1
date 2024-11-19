<?php
    include "conexion.php";
    
    mysqli_set_charset($conexion,'utf8');
    $consulta_sql="SELECT * FROM alumno";
    $resultado=$conexion->query($consulta_sql);
    $count=mysqli_num_rows($resultado);

    echo "<table>
         <table border='2'>
            <tr>
                <th>Usuario</th>
                <th>No Cuenta Institucional</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Correo Electronico</th>
                <th>Contraseña</th>
                <th>Fecha de Registro</th>
                <th>Permisos</th>
            </tr>";

   
    if($count>0){
        while($row=mysqli_fetch_assoc($resultado)){
            echo "<tr>";
                echo "<td>". $row['nombre_usuario'] ."</td>";
                echo "<td>". $row['no_cuenta'] ."</td>";
                echo "<td>". $row['direccion'] ."</td>";
                echo "<td>". $row['telefono'] ."</td>";
                echo "<td>". $row['email'] ."</td>";
                echo "<td>". $row['password'] ."</td>";
                echo "<td>". $row['fecha_registro'] ."</td>";
                echo "<td>". $row['permisos'] ."</td>";
            echo "</tr>";

        }
        echo "</table>";
    }else {
        echo "<h1 style='color:red'>Sin Ningun registro</h1>";
    }
?>