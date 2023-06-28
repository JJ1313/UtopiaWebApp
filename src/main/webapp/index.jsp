<%-- 
    Document   : index
    Author     : Heinz Beckers Sandoval
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="jakarta.servlet.http.*"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        
        
        <!-- FORM PARA INICIAR SESION -->
        <h2 class="">INICIAR SESION</h2>
        <form id="form__logIn" action="SvHome" method="POST" class="container">
            <div class="mb-3">
                <label for="name" class="form-label">NOMBRE USUARIO</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">CONTRASENA</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <button class="btn btn-light" type="submit" name="logIn">INICIAR</button>
        </form>
        <div class="container">
            <div class="row">
                <div class="col">
                    <a href="./signUp.jsp">CREAR CUENTA</a>                    
                </div>
            </div>
        </div>

        
        <%--<%@ include file="./components/footer.jsp"%>--%>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</html>
