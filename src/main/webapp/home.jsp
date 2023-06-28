<%-- 
    Document   : home
    Created on : Jun 9, 2023, 12:36:14 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/styles.css">
        <style>
            h2{
                background-color: #f7dd60;
                text-align: center;
                color: #373331;
                height: 50px;
                border-radius: 25px;
                padding-top: 5px;
            }
            .curso{
                height: 50px;
                border-radius: 25px;
                background-color: #98d8aa;
                margin: 10px 20px;
                /*padding-top: 10px;*/
                text-align: center;
                /*background-image: url("./img/texture.jpg");*/
                background-size: cover;
                color: #373331;
                text-transform: uppercase;
                padding:0;
                /*margin-inine: auto;*/
            }
            .curso div {
                margin-left: auto;
                
            }
            .btn-curso{
                margin: 0;
                padding:0 ;
            }
            .btn-curso button{
                background-color: #00000033;
                border-radius: 0 25px 25px 0;
                /*background-color: #f7dd60;*/
                height: 50px;
                width: 50px;
                color: #373331;
                /*text-height: 50px;*/
                font-size: 2rem;
                font-weight:600 ;
                
            }
            
        </style>
    </head>
    <body>
        <% 
            HttpSession sesionActual = request.getSession(false);
            if(sesionActual.getAttribute("id") == null){
                response.sendRedirect("./index.jsp");
                return;
            }
            ArrayList<Curso> cursos = (ArrayList) request.getSession().getAttribute("cursos");
        %>

        <%@include file="./components/navbar.jsp"%>
<!--        <form action="svHome">
            <input type="text">
            <button type="submit" class="btn btn-secondary">BUSCAR</button>
        </form>-->
        <div class="container my-5 justify-content-center mx-auto">
            <div class="row mx-auto">
                <h2>CURSOS</h2>
            </div>
            <form action="SvPerfil" method="POST">
                <div class="row">
                    <% 
                    for(Curso curso : cursos){
                    %>
                    <div class="col-3 curso d-flex">
                        <div class="nombre-curso"><%=curso.getNombre()%></div>
                        <div class="btn-curso"><button name="agregarCurso" type="submit" value=<%=curso.getId()%>>+</button></div>
                    </div>
                    <%}%>
                </div>
            </form>
        </div>
        <%--<%@include file="./components/footer.jsp"%>--%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
