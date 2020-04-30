<% if (session.getAttribute("username_usuario") != null) {
        if (session.getAttribute("perfil_usuario").equals("1")) {
            response.sendRedirect("JSP/Administrador/Inicio.jsp");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">
<!Doctype html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!--CSS Predeterminados de Bootstrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome-5.css">
    <link rel="stylesheet" href="css/mdb.min.css">
    <title>Dietic</title>
</head>

<body
    style="background-image: url('img/web/Index/bg.jpg'); background-repeat: no-repeat; background-position: center; background-size: auto">

    <header>
        <!--Modal Sucess-->
        <div class="modal top show" id="mod_success" tabindex="-1" role="dialog" aria-labelledby="mod_success"
            aria-hidden="true" data-backdrop="false">
            <div class="modal-dialog modal-frame modal-top modal-notify modal-success" role="document">
                <!--Content-->
                
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header d-flex align-items-center">
                        <i class="fas fa-check animated rotateIn text-white"></i>
                        <p class="heading lead text-left " id="msg_mod_success"></p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="white-text">&times;</span>
                        </button>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>

        <!--Modal de Registro de Usuario del Sistema-->
        <div class="modal fade" id="mod_form_reg_usuario_system" tabindex="-1" role="dialog"
            aria-labelledby="mod_form_reg_usuario_system" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content rounded ">

                    <form id="form_reg_usuario_system" name="form_reg_usuario_system" method="POST"
                        action="Register?Peticion=Registro_Usuario_System">
                        <!--Header-->
                        <div class="modal-header bg-dark d-block">
                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="text-center text-white"><strong>Formulario de Registro</strong></h4>
                        </div>

                        <!--Body-->
                        <div class="modal-body mx-3">
                            <div class="container">
                                <div class="row">
                                    <input type="hidden" id="form_reg_perfil_system" name="form_reg_perfil_system" value="2">
                                    <input type="hidden" id="form_reg_estado_system" name="form_reg_estado_system" value="1">

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="form_reg_sexo_system">Sexo</label>
                                            <select id="form_reg_sexo_system"
                                                name="form_reg_sexo_system"
                                                class="browser-default custom-select form-control">
                                                <option value="">Seleccione su sexo</option>
                                                <option value="1">Masculino</option>
                                                <option value="2">Femenino</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fa fa-user-circle prefix"></i>
                                            <input type="text" id="form_reg_nombres_system" name="form_reg_nombres_system"
                                                class="form-control" aria-describedby="form_reg_nombres_system">
                                            <label for="form_reg_nombres_system">Nombres</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fa fa-user-circle prefix"></i>
                                            <input type="text" id="form_reg_apellidos_system" name="form_reg_apellidos_system"
                                                class="form-control" aria-describedby="form_reg_apellidos_system">
                                            <label for="form_reg_apellidos_system">Apellidos</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fas fa-address-card prefix"></i>
                                            <input type="text" id="form_reg_identificacion_system"
                                                name="form_reg_identificacion_system" class="form-control"
                                                aria-describedby="form_reg_identificacion_system">
                                            <label for="form_reg_identificacion_system">Numero de Identificación</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fas fa-envelope prefix"></i>
                                            <input type="email" id="form_reg_correo_system" name="form_reg_correo_system"
                                                class="form-control" aria-describedby="form_reg_correo_system">
                                            <label for="form_reg_correo_system">Correo electroníco</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fas fa-mobile-alt prefix"></i>
                                            <input type="number" id="form_reg_telefono_system" name="form_reg_telefono_system"
                                                class="form-control" aria-describedby="form_reg_telefono_system">
                                            <label for="form_reg_telefono_system">Telefono</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fa fa-user prefix"></i>
                                            <input type="text" id="form_reg_username_system" name="form_reg_username_system"
                                                class="form-control" aria-describedby="form_reg_username_system">
                                            <label for="form_reg_username_system">Usuario</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fa fa-lock prefix"></i>
                                            <input type="password" id="form_reg_pwd_system" name="form_reg_pwd_system"
                                                class="form-control">
                                            <label for="form_reg_pwd_system">Contraseña</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="md-form form-group">
                                            <i class="fa fa-lock prefix"></i>
                                            <input type="password" id="form_reg_pwd_2_system" name="form_reg_pwd_2_system"
                                                class="form-control">
                                            <label for="form_reg_pwd_2_system">Confirmar contraseña</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Footer-->
                        <div class="modal-footer">
                            <div class="container">
                                <div class="row">
                                    <div class="col d-flex flex-center mx-auto">
                                        <button id="btn_submit_form_reg_usuario_system" class="btn btn-dark-green"
                                            type="submit">Registrarse</button>
                                        <i id="icon_load_form_reg_usuario_system"
                                            class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="container" style="margin-top: 10%">
            <div class="row justify-content-center">
                <div class="col-6">
                    <form id="form_login_usuario" name="form_login_usuario" method="POST" action="Login">

                        <!--Header-->
                        <div class="modal-header bg-light">
                            <img class="img-fluid mx-auto d-block" src="img/web/Index/Logo.png" alt="" width="100px"
                                height="100px">
                        </div>
                        <!--/Header-->
                        <!--Body-->
                        <div class="modal-body" style="background-color:white">

                            <div id="msg_error_form_login_usuario" class="alert alert-danger d-none" role="alert">
                                <h6 class="h6 text-center">Usuario o contraseña incorrecta</h6>
                            </div>
                            <div class="md-form mb-5 form-group">
                                <i class="fa fa-user prefix"></i>
                                <input type="text" id="form_login_username" name="form_login_username"
                                    class="form-control" aria-describedby="form_login_username">
                                <label data-success="" for="form_login_username">Usuario</label>
                            </div>
                            <div class="md-form mb-4 form-group">
                                <i class="fa fa-lock prefix"></i>
                                <input type="password" id="form_login_pwd" name="form_login_pwd" class="form-control">
                                <label data-success="" for="form_login_pwd">Contraseña</label>
                            </div>
                            <div class="justify-content-center align-items-center">
                                <button id="btn_submit_form_login_usuario" class="btn btn-red d-block mx-auto"
                                    type="submit">Ingresar</button>
                                <i id="icon_load_form_login_usuario"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                        <!--/Body-->
                        <!--Footer-->
                        <div class="modal-footer bg-light">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <p><a href="" data-toggle="modal"
                                                data-target="#mod_form_reg_usuario_system"><strong>¿No
                                                    tienes una cuenta? Registrate</strong></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/Footer-->

                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- Script para Ejecutar Bootstrap y JQuery -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/additional-methods.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mdb.min.js"></script>
    <script src="js/index.js"></script>
</body>

</html>