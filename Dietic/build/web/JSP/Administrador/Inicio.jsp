<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("index.jsp");
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@include file="Head.jsp" %>

    <body>
        <!--Bloque necesario para El efecto Sidebar-->
        <div class="page-wrapper ice-theme sidebar-bg bg2 toggled">

            <!--Sidebar Menu-->
            <%@include file="Menu.jsp" %>
            <!--/Sidebar Menu-->

            <!-- Contenido  -->
            <main class="page-content">
                <div class="container-fluid">

                    <section>
                        <div class="row">
                            <div class="col">
                                <h1 class="h1"><i class="fas fa-desktop"></i><strong> Panel de Administración</strong> </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">Inicio</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </section>

                    <hr class="hr blue-grey">

                    <section>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-deck">
                                    <div class="card stylish-color  text-white">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <i class="fa fa-user-check fa-5x" style="color: green"></i>
                                                </div>
                                                <div class="float-right">
                                                    <p><strong>Usuarios en Linea</strong></p>
                                                    <h1 class="h1 text-center">1</h1>
                                                </div>
                                            </div>
                                            <p class="card-text mt-3"><span style="color:white"><i
                                                        class="fa fa-question-circle"></i>
                                                    Todos
                                                    los usuarios conectados en la plataforma</span></p>
                                        </div>
                                    </div>

                                    <div class="card unique-color text-white">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <i class="fa fa-user-friends fa-5x"></i>
                                                </div>
                                                <div class="float-right">
                                                    <p><strong>Usuarios Registrados</strong></p>
                                                    <h1 class="h1 text-center">Sin calcular</h1>
                                                </div>
                                            </div>
                                            <p class="card-text mt-3"><span class="text-white"><i
                                                        class="fa fa-question-circle"></i>
                                                    Todos los usuarios registrados en la plataforma</span> </p>
                                        </div>
                                    </div>

                                    <div class="card rgba-red-strong">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <i class="fas fa-allergies fa-5x"></i>
                                                </div>
                                                <div class="float-right">
                                                    <p><strong>Nuevas Citas</strong></p>
                                                    <h1 class="h1 text-center">Sin calcular</h1>
                                                </div>
                                            </div>
                                            <p class="card-text mt-3"><span style="color:black"><i
                                                        class="fa fa-question-circle"></i>
                                                    Todas las citas disponibles</span> </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>

                    <hr class="hr blue-grey">

                    <section>
                        <div class="row">
                            <div class="col-8">
                                <h4 class="flex-column align-items-start"><i class="fas fa-user-clock"></i> Citas
                                    Solicitadas</h4>
                                <table id="Table_Logs" class="table table-striped table-hover table-responsive-md">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Nombre y Apellidos</th>
                                            <th>Motivo</th>
                                            <th><i class="far fa-calendar-alt"></i> Fecha</th>
                                        </tr>
                                    </thead>
                                    <tfoot class="thead-dark">
                                        <tr>
                                            <th>Nombre y Apellidos</th>
                                            <th>Motivo</th>
                                            <th><i class="far fa-calendar-alt"></i> Fecha</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-4 d-none d-md-block">
                                <div class="list-group">
                                    <h4 class="flex-column align-items-start"><i class="fas fa-clipboard-check"></i>
                                        Novedades</h4>
                                    <a href="" class="list-group-item list-group-item-action flex-column align-items-start">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1"><strong>Dietic v1.0</strong></h5>
                                            <small><span class="badge badge-success">Nuevo</span></small>
                                        </div>
                                        <p class="mb-1">Plataforma en desarrollo</p>
                                        <small>Administrador</small>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>
            <!--/Contenido  -->
        </div>
        <!--/Bloque necesario para El efecto Sidebar-->
    </body>

    <%@include file="Footer.jsp" %>

</html>