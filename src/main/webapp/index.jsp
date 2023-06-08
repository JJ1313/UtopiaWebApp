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
        <link rel="stylesheet" href="./css/navbar.css"/>
        <link rel="stylesheet" href="./css.footer.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
    </head>
    <body>
        <%@include file="./components/navbar.jsp"%>
       
        <% 
            HttpSession sesionActual = request.getSession(false);
            System.out.println(sesionActual);
            
            String name;
            int id;
            // Arreglar revision de session iniciada o no
            if(sesionActual.getAttribute("id") == null){
                System.out.println("No Session...");
                name = "Anonimo";
                id = 0;
            }
            else{
                id = (int) sesionActual.getAttribute("id");
                name = (String) sesionActual.getAttribute("name");            
            }
        %>
        <h1><%= name%></h1>
        <p><%= id%></p>
        
        <!-- FORM PARA BUSCAR CURSO -->
        <form id="form__search" action="SvSearch">
            <input type="text">
            <button type="submit" >BUSCAR</button> 
        </form>
        
        <!-- FORM PARA REGISTRAR USUARIO -->
        <form id="form__signUp" action="SvUsuarios" method="POST">
            <h2>CREAR CUENTA</h2>
            <div class="container--input">
                <label>NOMBRE USUARIO</label>
                <input type="text" name="name" placeholder="Nombre de usuario" required>
            </div>
            <div class="container--input">
                <label>CORREO</label>
                <input type="text" name="email" placeholder="Correo electronico" required>
            </div>
            <div class="container--input">
                <label>CONTRASENA</label>
                <input type="password" name="password" placeholder="Contrasena" required>
            </div>
            <button type="submit" name="signUp">REGISTRAR</button>
        </form>
        
        <!-- FORM PARA INICIAR SESION -->
        <form id="form__logIn" action="SvUsuarios" method="POST">
            <h2>INICIAR SESION</h2>
            <div class="container--input">
                <label>NOMBRE USUARIO</label>
                <input type="text" name="name" placeholder="Nombre de usuario" required>
            </div>
            <div class="container--input">
                <label>CONTRASENA</label>
                <input type="password" name="password" placeholder="Contrasena" required>
            </div>
            <button type="submit" name="logIn">INICIA</button>
 
        </form>
        
        
        
        <%@ include file="./components/footer.jsp"%>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</html>
