<<<<<<< HEAD
<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("index.jsp");
        }  
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
=======
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("DOC_USER") == null) 
   {
     response.sendRedirect("../index.html");
   }
%>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
<!DOCTYPE html>
<html>

<%@include file="Head.jsp" %>

<body>
    <!--Bloque necesario para El efecto Sidebar-->
<<<<<<< HEAD
    <div class="page-wrapper ice-theme sidebar-bg bg2 toggled">
=======
    <div class="page-wrapper chiller-theme sidebar-bg bg3 toggled">
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
        <!--Sidebar Menu-->
        <%@include file="Menu.jsp" %>
        <%@include file="Modals.jsp" %>
        <!--/Sidebar Menu-->

        <!-- Contenido  -->
        <main class="page-content">
            <div class="container-fluid">

                <section>
                    <div class="row">
                        <div class="col">
                            <h1 class="h1"><i class="fas fa-users-cog"></i><strong> Lista de Usuarios</strong> </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
<<<<<<< HEAD
                                    <li class="breadcrumb-item ">Administración</li>
=======
                                    <li class="breadcrumb-item ">Universidad</li>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                    <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
<<<<<<< HEAD
                    <div class="alert alert-danger" role="alert">
                        <h4 class="alert-heading"><b>Nota Importante</b></h4>
                        <p>El registro de los usuarios en esta sección aplica para ser registrados como usuarios del sistema.</p>
                        <hr>
                        <p class="mb-0">Si deseas registrar un usuario debido a que se debe recetar, ve al menu Recetas.</p>
                    </div>
                </section>

                <section>
=======
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                    <div class="row">
                        <div class="col">
                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
<<<<<<< HEAD
                                    data-target="#mod_form_reg_usuario">Registrar
=======
                                    data-target="#Mod_Reg_Usuario">Registrar
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                    Usuario</button>
                            </div>
                        </div>
                    </div>
                    <br>
                </section>

                <section>
                    <div class="row">
                        <div class="col">
<<<<<<< HEAD
                            <table id="table_usuarios" class="table table-striped table-hover table-responsive-sm">
                                <thead class="thead-dark">
                                    <tr>
                                        <th></th>
                                        <th>Documento</th>
                                        <th>Usuario</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th><i class="fas fa-cogs"></i>Acciones</th>
=======
                            <table id="Table_Usuarios" class="table table-striped table-hover table-responsive-sm">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Documento</th>
                                        <th>Nick</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th>Acciones</th>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
<<<<<<< HEAD
                                        <th></th>
                                        <th>Documento</th>
                                        <th>Usuario</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th><i class="fas fa-cogs"></i>Acciones</th>
=======
                                        <th>Documento</th>
                                        <th>Nick</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th>Acciones</th>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                    </tr>
                                </tfoot>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>

            </div>
        </main>
        <!-- /Contenido" -->

    </div>
    <!--/Bloque necesario para El efecto Sidebar-->
</body>
<%@include file="Footer.jsp" %>

</html>