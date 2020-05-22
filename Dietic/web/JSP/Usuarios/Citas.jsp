<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
    <%@include file="Head.jsp" %>
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
                            <h1 class="h1"><i class="fas fa-apple-alt"></i><strong>Mis Citas</strong>
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Citas</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
                    <div class="view">

                        <div class="jumbotron card card-image"
                            style="background-image: url(../../img/web/Usuarios/citasMsg.jpeg);">
                            <div class="mask pattern-6">
                                <div class="text-white text-center py-3 px-3">
                                    <div>
                                        <h2 class="card-title">
                                            <strong>
                                                Deje que los alimentos sean su medicina y que la medicina sea su alimento
                                            </strong>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <hr class="hr blue-grey" style="margin-top: -1%">

                <section>
                    <div class="row">
                        <div class="col">
                            <table id="table_citas_usuario" class="table table-striped table-hover table-responsive-sm">
                                <thead class="thead-dark">
                                    <tr>
                                        <th># de Cita</th>
                                        <th>Fecha</th>
                                        <th>Descripcion</th>
                                        <th>Estados</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th># de Cita</th>
                                        <th>Fecha</th>
                                        <th>Descripcion</th>
                                        <th>Estados</th>
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