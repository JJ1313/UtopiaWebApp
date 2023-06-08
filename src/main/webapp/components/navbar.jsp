<%-- 
    Document   : navbar
    Created on : Jun 3, 2023, 1:54:51 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="./index.jsp">UTOPIA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <% 
//        int id = (int) request.getSession().getAttribute("id");
//        System.out.print(id);
//        if(id != null){
//            System.out.print("Iniciado");
//        }
//        else{
//            System.out.print("Anonimo");
//        }
        %>    
        <div class="collapse navbar-collapse" id="navbar">
            <div class="navbar-nav">
                <div class="navbar__btns--secciones">
                    <a class="nav-link" href="#" >mis cursos</a>
                    <form action="SvPerfil" method="POST">
                        <button type="submit" name="goProfile">PERFIL</button> 
                        <button type="submit" name="closeSession">CERRAR SESSION</button>                
                    </form>
                </div>
                <div class="navbar__btns--registro">
                    <button type="submit">INICIAR SESION</button> 
                    <button type="submit">REGISTRAR</button> 
                </div>
            </div>
        </div>
    </div>
</nav> 
