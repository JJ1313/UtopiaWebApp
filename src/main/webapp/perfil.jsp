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
            String name = (String) request.getSession().getAttribute("name");
            ArrayList<Curso> cursosUsuario = (ArrayList) request.getSession().getAttribute("cursosUsuario");
        %>
        <h1><%= name %></h1>
        <h2>CURSOS</h2>
        <% 
        for(Curso curso : cursosUsuario){
        %>
        <div><%= curso.getNombre() %></div>
        <%}%>
    </body>
</html>
