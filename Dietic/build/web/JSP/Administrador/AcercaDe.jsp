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

                <div class="row">
                    <div class="col">
                        <img src="../../img/web/Index/logo-uni.png" alt="" class="img-fluid">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Inicio.jsp">Inicio</a></li>
                                <li class="breadcrumb-item" aria-current="page">Universidad</li>
                                <li class="breadcrumb-item active" aria-current="page">Acerca de</li>
                            </ol>
                        </nav>

                    </div>
                </div>

                <hr class="hr blue-grey">

                <div class="row">
                    <div class="col">
                        <div id="Banner_AcercaDe" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#Banner_AcercaDe" data-slide-to="0" class="active"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="../../img/web/Administracion/inscripciones.png" alt="First slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#Banner_AcercaDe" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#Banner_AcercaDe" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>

                <hr class="hr blue-grey">

                <div class="row">
                    <div class="col-8">
                        <h4 class="flex-column align-items-start"><i class="fas fa-book-reader"></i> Historia</h4>
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text">El Politécnico Colombiano Jaime Isaza Cadavid es una Institución
                                    Universitaria de Colombia, con sede principal en la ciudad de Medellín. Se
                                    encuentra adscrita al Gobierno Departamental de Antioquia y fue fundada en marzo de
                                    1963. Ofrece educación superior en los niveles técnico, tecnológico y universitario
                                    mediante una oferta de programas académicos de pregrado y posgrado en distintas
                                    áreas de la ingeniería, la administración, las ciencias agrarias, la comunicación
                                    audiovisual, el deporte y la recreación. Su oferta académica incluye cursos de
                                    educación continuada y educación no formal.</p>
                            </div>
                            <div class="card-body">
                                <a href="https://es.wikipedia.org/wiki/Polit%C3%A9cnico_Colombiano_Jaime_Isaza_Cadavid"
                                    class="card-link"><span>Mas informacion</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <h4 class="flex-column align-items-start"><i class="fas fa-history"></i> Uso Frecuente</h4>
                        <div class="list-group-flush">
                            <a href="http://www2.politecnicojic.edu.co/polidinamico/polidinamico.php" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/polidinamico.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                            <a href="http://www.politecnicojic.edu.co/index.php/bibliotecas" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/biblioteca.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                            <a href="http://elpolivirtual.elpoli.edu.co/login/index.php" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <img src="../../img/web/Administracion/polivirtual.png" alt="" class=" img-fluid">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- /Contenido" -->

    </div>
    <!--/Bloque necesario para El efecto Sidebar-->
</body>

<%@include file="Footer.jsp" %>

</html>