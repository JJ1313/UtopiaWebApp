<%-- 
    Document   : index
    Author     : Heinz Beckers Sandoval
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Inicio</title>
    </head>
    <body>
        <h1>CREAR CUENTA</h1>
        <form action="SvUsuarios" method="POST">
            <div class="container--input">
                <label>NOMBRE</label>
                <input type="text" name="name" placeholder="Nombre de usuario" required>
            </div>
            <div class="container--input">
                <label>CORREO</label>
                <input type="text" name="email" placeholder="Correo electronico" required>
            </div>
            <div class="container--input">
                <label>CONTRASENA</label>
                <input type="text" name="password" placeholder="Contrasena" required>
            </div>
            <button type="submit">CREAR</button>
        </form>
        <form action="SvPerfil" method="POST">
            <button type="submit">PERFIL</button>  
        </form>
    </body>
</html>
