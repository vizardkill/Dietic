<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("DOC_USER") == null) 
   {
     response.sendRedirect("../index.html");
   }
%>
<!DOCTYPE html>
<html>

<%@include file="Head.jsp" %>

<body>
    <!--Bloque necesario para El efecto Sidebar-->
    <div class="page-wrapper chiller-theme sidebar-bg bg3 toggled">
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
                                    <li class="breadcrumb-item ">Universidad</li>
                                    <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
                    <div class="row">
                        <div class="col">
                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                    data-target="#Mod_Reg_Usuario">Registrar
                                    Usuario</button>
                            </div>
                        </div>
                    </div>
                    <br>
                </section>

                <section>
                    <div class="row">
                        <div class="col">
                            <table id="Table_Usuarios" class="table table-striped table-hover table-responsive-sm">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Documento</th>
                                        <th>Nick</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>Documento</th>
                                        <th>Nick</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Correo</th>
                                        <th>Acciones</th>
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