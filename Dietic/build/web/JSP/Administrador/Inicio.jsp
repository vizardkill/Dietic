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
                                                <h1 class="h1 text-center">5</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span style="color:white"><i class="fa fa-question-circle"></i>
                                                Todos
                                                los usuarios conectados en la plataforma</span></p>
                                    </div>
                                </div>

                                <div class="card info-color text-white">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fas fa-graduation-cap fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Facultades Registradas</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todas las facultades registrados en la plataforma</span> </p>
                                    </div>
                                </div>

                                <div class="card unique-color text-white">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fa fa-user-tie fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Profesores Registrados</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todos los profesores registrados en la plataforma</span> </p>
                                    </div>
                                </div>

                                <div class="card rgba-indigo-strong">
                                    <div class="card-body">
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <i class="fa fa-user-graduate fa-5x"></i>
                                            </div>
                                            <div class="float-right">
                                                <p><strong>Estudiantes Registrados</strong></p>
                                                <h1 class="h1 text-center">1</h1>
                                            </div>
                                        </div>
                                        <p class="card-text mt-3"><span class="text-white"><i class="fa fa-question-circle"></i>
                                                Todos los estudiantes registrados en la plataforma</span> </p>
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
                            <h4 class="flex-column align-items-start"><i class="fas fa-bug"></i> Logs</h4>
                            <table id="Table_Logs" class="table table-striped table-hover table-responsive-md">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Nombre y Apellidos</th>
                                        <th>Tipo de Usuario</th>
                                        <th><i class="fas fa-cogs"></i> Accion</th>
                                        <th>Descripcion</th>
                                        <th><i class="far fa-calendar-alt"></i> Fecha</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>Nombre y Apellidos</th>
                                        <th>Tipo de Usuario</th>
                                        <th><i class="fas fa-cogs"></i> Accion</th>
                                        <th>Descripcion</th>
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
                                        <h5 class="mb-1"><strong>PoliNotes v1.2</strong></h5>
                                        <small><span class="badge badge-success">Nuevo</span></small>
                                    </div>
                                    <p class="mb-1">Descubre las novedades de las ultimas actualizaciones</p>
                                    <small>Administrador</small>
                                </a>
                                <a href="" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"><strong>Nuevos miembros del grupo</strong></h5>
                                    </div>
                                    <p class="mb-1">Integrantes del grupo:
                                        <ul>
                                            <li>Santiago Cardona</li>
                                            <li>Juan Pablo Maso</li>
                                            <li>Alejandro</li>
                                        </ul>
                                    </p>
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