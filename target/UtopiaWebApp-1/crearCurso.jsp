<%-- 
    Document   : crearCurso
    Created on : Jun 9, 2023, 1:48:09 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Crear curso</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/navbar.css"/>
        <link rel="stylesheet" href="./css/styles.css"/>
    </head>
    <body>
        <%@include file="./components/navbar.jsp"%>
        <% 
            HttpSession sesionActual = request.getSession(false);
            if(sesionActual.getAttribute("id") == null){
                response.sendRedirect("./index.jsp");
                return;
            }
            if((int)sesionActual.getAttribute("rol") == 1){
                response.sendRedirect("./home.jsp");
            }
            String titulo = (String) sesionActual.getAttribute("tituloCurso");
//            ArrayList<Curso> cursos = (ArrayList) request.getSession().getAttribute("cursos");
        %>
        <h1>Crear curso</h1>
        <form action="SvCrearCurso" class="container" method="post">
            <div class="mb-3">
                <label for="titulo" class="form-label">NOMBRE CURSO</label>
                <input type="text" name="titulo" id="titulo" class="form-control" required>
            </div> 
            <%if(titulo == ""){%>
                <button type="submit" class="btn btn-success">ACEPTAR</button>
            <%}
            else{%>
            <button name="createCurso" type="submit" class="btn btn-success" values=<%=titulo%>>ACEPTAR</button>
            <%}%>
        </form>
        
        <a href="./agregarModulo" class="btn btn-success">AGREGAR MODULO</a>
    </body>
</html>
