<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in</title>
    <link rel="stylesheet" href="./estilos/estiloslogin.css">
</head>
<body>
    <div class="login">
        <div class="contenido">
            <h1>Sign in</h1>
            <form method="POST"  action="./logica/loguear.php">
                <input type="email" name="correo" placeholder="Email" required/>
                <br><br>
                <input type="password" name="contrasena" placeholder="Contraseña" required/>
                <br><br>
                <button type="submit">Login</button>
            </form> 
        </div>
    </div>
</body>
</html>



   
