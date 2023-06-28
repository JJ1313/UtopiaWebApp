<%-- 
    Document   : signUp
    Created on : Jun 9, 2023, 12:17:56 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <!-- FORM PARA REGISTRAR USUARIO -->
        <h1>CREAR CUENTA</h1>
        <form id="form__signUp" action="SvHome" method="POST" class="container">
            <div class="mb-3">
                <label for="name" class="form-label">NOMBRE USUARIO</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">CORREO</label>
                <input type="text" name="email" id="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">CONTRASENA</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <button type="submit" name="signUp" class="btn btn-light">REGISTRAR</button>
            <a href="./index.jsp" class="btn btn-secondary">VOLVER</a>
        </form>
    </body>
</html>
