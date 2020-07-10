<header>
    <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar" class="sidebar-wrapper">

        <div class="sidebar-content">
            <!--Logo-->
            <div class="sidebar-brand">
                <a href=""> <img class=" img-fluid" src="../../img/web/Index/Logo.png" alt=""></a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <!--/Logo-->

            <!--Header-->
            <div class="sidebar-header">
                <div class="user-pic rounded-circle">
                    <a href="Inicio.jsp"><img class="img-fluid img-thumbnail rounded-circle"
                            src="../../img/web/Sidebar/user.jpg" alt="User picture"></a>
                </div>
                <div class="user-info">
                    <span class="user-name">
                        <strong>${sessionScope['username_usuario']}</strong>
                    </span>
                    <span class="user-role">Usuario</span>
                    <span class="user-status">
                        <i class="fa fa-circle"></i>
                        <span>En l&#237nea</span>
                    </span>
                </div>
            </div>
            <!--/Header-->


            <!--Buscador-->
            <div class="sidebar-search">
                <div>
                    <div class="input-group">
                        <input type="text" class="form-control search-menu sidebar-search-box" placeholder="Buscar...">
                        <div class="input-group-append">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Buscador-->


            <!--Menu-->
            <div class="sidebar-menu">
                <ul class="sidebar-search-list">

                    <li class="header-menu" data-search-term="General">
                        <span>General</span>
                    </li>

                    <li data-search-term="Inicio">
                        <a href="Inicio.jsp">
                            <i class="fa fa-home"></i>
                            <span>Inicio</span>
                        </a>
                    </li>

                    <li data-search-term="Recetas">
                        <a href="Recetas.jsp">
                            <i class="fas fa-seedling"></i>
                            <span>Recetas</span>
                        </a>
                    </li>

                    <li data-search-term="Citas">
                        <a href="Citas.jsp">
                            <i class="fas fa-not-equal"></i>
                            <span>Citas</span>
                        </a>
                    </li>

                    <li class="header-menu" data-search-term="Extra">
                        <span>Extra</span>
                    </li>


                    <li data-search-term="Acerca De">
                        <a href="AcercaDe.jsp">
                            <i class="fa fa-book"></i><span>Acerca De</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!--Menu-->

        </div>

        <!--Footer-->
        <div class="sidebar-footer">

            <div class="dropdown">
                <a href="#" class="" id="dropdownMenuMessage" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <i class="fa fa-cog" data-toggle="tooltip" title="Opciones"></i>
                    <span class="badge-sonar"></span>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuMessage">
                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Mi perfil</a>
                    <a class="dropdown-item" href="#"><i class="fa fa-question"></i> Acerca de</a>
                </div>
            </div>
            <div>
                <a href="#">
                    <form id="form_logout" name="form_logout" method="GET" action="../../Logout">
                        <i class="fa fa-power-off" data-toggle="tooltip" title="Salir" onclick="logout()"></i>
                    </form>
                </a>
            </div>
        </div>
        <!--Footer-->


    </nav>
</header>