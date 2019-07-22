<% if (session.getAttribute("username_usuario") == null) {
    response.sendRedirect("../../redirect.jsp");
} else {
    if (session.getAttribute("perfil_usuario").equals("2")) {
        response.sendRedirect("../../index.jsp");
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
        <%@include file="Modals.jsp" %>
        <!--/Sidebar Menu-->

        <!-- Contenido  -->
        <main class="page-content">
            <div class="container-fluid">

                <section>
                    <div class="row">
                        <div class="col">
                            <h1 class="h1"><i class="fas fa-apple-alt"></i><strong> Lista de Usuarios Recetados</strong>
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Recetas</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <hr class="hr blue-grey">

                <section>
                    <div class="view">

                        <div class="jumbotron card card-image"
                            style="background-image: url(../../img/web/Administracion/bg-jumbo.jpg);">
                            <div class="mask pattern-6">
                                <div class="text-white text-center py-3 px-3">
                                    <div>
                                        <h2 class="card-title">
                                            <strong>
                                                Esforzarte para llevar una nutrición adecuada, es la mejor inversión
                                                para tu cuerpo y mente que puedes hacer.
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
                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                    data-target="#mod_form_reg_usuario_client">Registrar
                                    Usuario</button>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                    data-target="#mod_form_reg_receta">Registrar
                                    Receta</button>
                            </div>
                        </div>
                    </div>
                    <br>
                </section>

                <section>
                    <div class="row">
                        <div class="col">
                            <table id="table_recetas" class="table table-striped table-hover table-responsive-sm">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Documento del Usuario</th>
                                        <th>Receta</th>
                                        <th><i class="fas fa-cogs"></i>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>Documento del Usuario</th>
                                        <th>Receta</th>
                                        <th><i class="fas fa-cogs"></i>Acciones</th>
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