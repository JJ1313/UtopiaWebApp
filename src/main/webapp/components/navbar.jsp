<%-- 
    Document   : navbar
    Created on : Jun 3, 2023, 1:54:51 PM
    Author     : JJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="./home.jsp">UTOPIA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>  
        <div class="collapse navbar-collapse" id="navbar">
            <div class="navbar-nav">
                <div class="navbar__btns--secciones d-flex flex-row gap-3 justify-content-end">
                    <a href="./home.jsp">HOME</a>
                    <a href="./perfil.jsp">PERFIL</a>
                    <form action="SvUsuario" method="POST" class="">
                        <button type="submit" class="btn btn-danger" name="closeSession">SALIR</button>                
                    </form>
                </div>
            </div>
        </div>
    </div>
</nav> 
