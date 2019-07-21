<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("index.jsp");
        }  
    }
%>
<<<<<<< HEAD
=======
=======
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
<header>
    <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar" class="sidebar-wrapper">

        <div class="sidebar-content">
            <!--Logo-->
            <div class="sidebar-brand">
<<<<<<< HEAD
                <a href=""> <img class=" img-fluid" src="../../img/web/Index/Logo.png" alt=""></a>
=======
<<<<<<< HEAD
                <a href=""> <img class=" img-fluid" src="../../img/web/Index/Logo.png" alt=""></a>
=======
                <a href=""> <img class=" img-fluid" src="../../img/web/Index/logo-white.png" alt=""></a>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <!--/Logo-->

            <!--Header-->
            <div class="sidebar-header">
                <div class="user-pic rounded-circle">
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                    <a href="Inicio.jsp"><img class="img-fluid img-thumbnail rounded-circle"
                            src="../../img/web/Sidebar/user.jpg" alt="User picture"></a>
                </div>
                <div class="user-info">
                    <span class="user-name">
                        <strong>${sessionScope['username_usuario']}</strong>
<<<<<<< HEAD
=======
=======
                    <a href="Inicio.jsp"><img class="img-fluid img-thumbnail rounded-circle" src="../../img/web/Sidebar/user.jpg"
                        alt="User picture"></a>
                </div>
                <div class="user-info">
                    <span class="user-name">
                        <strong>${sessionScope['NICK_USER']}</strong>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                    </span>
                    <span class="user-role">Administrador</span>
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

                    <li class="header-menu">
                        <span>General</span>
                    </li>
                    <li>
                        <a href="Inicio.jsp">
                            <i class="fa fa-home"></i>
                            <span>Inicio</span>
                        </a>
                    </li>

                    <li class="sidebar-dropdown">
                        <a href="#">
<<<<<<< HEAD
                            <i class="fab fa-whmcs"></i>
                            <span>Administraci&#243n</span>
=======
<<<<<<< HEAD
                            <i class="fab fa-whmcs"></i>
                            <span>Administraci&#243n</span>
=======
                                <i class="fab fa-whmcs"></i>
                            <span>Administracion</span>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="Usuarios.jsp">Usuarios</a>
                                </li>
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
                                <li>
                                    <a href="AcercaDe.jsp">Acerca de</a>
                                </li>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                            </ul>
                        </div>
                    </li>

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======


>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
                    <li class="header-menu">
                        <span>Extra</span>
                    </li>

                    </li>
                    <li>
<<<<<<< HEAD
                        <a href="AcercaDe.jsp">
                            <i class="fa fa-book"></i><span>Acerca De</span>
=======
<<<<<<< HEAD
                        <a href="AcercaDe.jsp">
                            <i class="fa fa-book"></i><span>Acerca De</span>
=======
                        <a href="#">
                            <i class="fa fa-book"></i>
                            <span>Documentaci&#243n</span>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
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
                    <i class="fa fa-power-off" data-toggle="tooltip" title="Salir"></i>
                </a>
            </div>
        </div>
        <!--Footer-->


    </nav>
<<<<<<< HEAD
</header>
=======
<<<<<<< HEAD
</header>
=======
</header>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
>>>>>>> c1667982dd6bcd1e543a7fafd15bdc6a91a2b72e
