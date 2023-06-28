<%-- 
    Document   : perfil
    Created on : Jun 1, 2023, 11:55:05 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="jakarta.servlet.http.HttpSession;" %>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utopia | Perfil</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/navbar.css"/>
        <link rel="stylesheet" href="./css.footer.css"/>
        <link rel="stylesheet" href="./css/styles.css"/>
        <style>
            #nombreUsuario{
                /*text-transform: uppercase;*/
            }
            #idUsuario{
                color: #777777;
                font-size: 1.2rem;
                margin-left: .3rem;
            }
            #rolUsuario{
                
            }
            h3{
                height: 50px;
                border-radius: 25px 25px 0 0;
                background-color: #f7d060;
                color: #373331;
                margin-bottom: 0;
                padding: 10px 0;
                text-align: center;
                font-weight: 600;
                /*padding-top: 10px;*/
            }
            .table{
                padding-bottom: 0;
              
            }
            td{
                /*background-color: #f3e99f!important;*/
            }
            .last-left{
                border-radius: 0 0 0 25px;
                border: none;
            }
            .last-right{
                border-radius: 0 0 25px 0;
                border: none;
            }
        </style>
    </head>
    <body>
        <%@include file="./components/navbar.jsp"%>
        <% 
            HttpSession sesionActual = request.getSession(false);
            int id;
            int rolUsuario = 0;
            String name;
            String nombreRol = "";
            String tamano = "12";
            // Verificacion de sesion iniciada
            if(sesionActual.getAttribute("id") == null){
                response.sendRedirect("./index.jsp");
                return;
            }
            else{
                id = (int) sesionActual.getAttribute("id");
                name = (String) sesionActual.getAttribute("name");
                rolUsuario = (int) sesionActual.getAttribute("rol");
                if( rolUsuario == 1){
                    nombreRol = "Estudiante";
                }
                if(rolUsuario == 2){
                    nombreRol = "Maestro";
                    tamano = "6";
                }
            }
            ArrayList<Curso> cursosUsuario = (ArrayList) request.getSession().getAttribute("cursosUsuario");

        %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-6">
                    <h2 id="nombreUsuario" class=""><%=name%>
                    <span id="idUsuario" class="">#<%=id%></span></h2>
                </div>
                <% if((int)rolUsuario == 2){%>
                    <div class="col-6 d-flex flex-row justify-content-end">
                        <form action="SvEditarUsuario">
                            <button type="submit" class="btn btn-primary mx-2">EDITAR PERFIL</button> 
                        </form>
                        <form action="SvCrearCurso" method="POST">
                            <a href="./crearCurso.jsp" class="btn btn-success">CREAR CURSO</a> 
                        </form>
                    </div>
                <%}%>
            </div>
            <div id="rolUsuario"><%=nombreRol%></div>
        </div>
            
        <div class="container mt-5">
            <div class="row">
                <div class="col-<%=tamano%>">
                    <h3>MIS CURSOS</h3>
                    <table class="table">
                        <tr>
                            <th>CURSO</th>
                            <th>AVANCE</th>
                        </tr>
                        <% 
                        for(Curso curso : cursosUsuario){
                        %>
                            <tr>
                                <td><%= curso.getNombre() %></td>
                                <td> 0 / <%= curso.getCantModulos() %></td>
                            </tr>
                        <%}%>
                        <tr>
                            <td class="last-left"></td>
                            <td class="last-right"></td>
                        </tr>
                    </table>
                </div>
                <% if((int)rolUsuario == 2){
                    ArrayList<Curso> cursosCreados = (ArrayList) request.getSession().getAttribute("cursosCreados");
                %>
                    <div class="col-<%=tamano%>">
                        <table class="table">
                            <h3>CREADOS</h3>
                            <tr>
                                <th>CURSO</th>
                                <th>ESTUDIANTES</th>
                                <th>OPCION</th>
                            </tr>
                            <form action="SvPerfil" method="POST">
                            <%
                                if(cursosCreados != null){
                                    for(Curso curso : cursosCreados){

         
                                %>
                                        <tr>
                                            <td><%= curso.getNombre() %></td>
                                            <td><%= curso.getCantUsuario() %></td>
                                            <td><button class="btn btn-danger" name="deleteCurso" value=<%= curso.getId()%>>X</button></td>
                                        </tr>
                                    <%}
                                }%>
                            </form>
                            <tr>
                                <td class="last-left"></td>
                                <td class=""></td>
                                <td class="last-right"></td>
                            </tr>
                        </table>
                    </div>
                <%}%>
            </div>
        </div>
        <%--<%@ include file="./components/footer.jsp"%>--%>
    </body>
</html>
