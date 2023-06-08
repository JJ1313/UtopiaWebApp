<%-- 
    Document   : perfil
    Created on : Jun 1, 2023, 11:55:05 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Curso"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Perfil</title>
    </head>
    <body>
        <% 
//            int id = (int) request.getSession().getAttribute("id");
            ArrayList<Curso> cursosUsuario = (ArrayList) request.getSession().getAttribute("cursosUsuario");
            
        %>
        <h1>NOMBRE</h1>
        <h2>MIS CURSOS</h2>
        <% 
        for(Curso curso : cursosUsuario){
        %>
        <div><%= curso.getNombre() %></div>
        <%}%>
    </body>
</html>
