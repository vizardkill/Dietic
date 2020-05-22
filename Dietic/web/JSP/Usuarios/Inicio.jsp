<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <%@include file="Head.jsp" %>

<body>

             <!--Bloque necesario para El efecto Sidebar-->
             <div class="page-wrapper ice-theme sidebar-bg bg2 toggled">

                <!--Sidebar Menu-->
                <%@include file="Menu.jsp" %>
                <!--/Sidebar Menu-->
                <main class="page-content">
                    
                   <div class="container-fluid">
                    <section>
                        <div class="row">
                            <div class="col">
                                <h1 class="h1"><i class="fas fa-desktop"></i><strong> Mi Espacio</strong> </h1>
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
                            <div class="card-deck">
                                <div class="card">
                                    <img class="card-img-top" src="../../img/web/Usuarios/recetas.jpg" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">Mis recetas</h4>
                                        <p class="card-text">Explora las recetas recomendadas por tu nutricionista</p>
                                    </div>
                                    <div class="card-footer">
                                       <a href="Recetas.jsp" class="btn btn-primary btn-block">ver mis recetas</a>
                                    </div>
                                </div>
                                <div class="card">
                                    <img class="card-img-top" src="../../img/web/Usuarios/citas.jpg" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">Mis Citas</h4>
                                        <p class="card-text">Revisa tus citas agendadas</p>
                                    </div>
                                    <div class="card-footer">
                                        <a href="Citas.jsp" class="btn btn-primary btn-block">ver mis citas</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                   </div>

                </main>
             </div>
</body>
<%@include file="Footer.jsp" %>
</html>