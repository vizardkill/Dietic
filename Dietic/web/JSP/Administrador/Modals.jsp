<<<<<<< HEAD
<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("index.jsp");
        }  
    }
%>
<!--#################################################### CRUD de Materias ##############################################################-->

<!--Modal Sucess-->
<div class="modal fade right" id="mod_success" tabindex="-1" role="dialog" aria-labelledby="mod_success"
=======
<!--#################################################### CRUD de Materias ##############################################################-->

<!--Modal Sucess-->
<div class="modal fade right" id="Mod_Sucess" tabindex="-1" role="dialog" aria-labelledby="Mod_Sucess"
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
    aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">

        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header d-flex align-items-center">
                <i class="fas fa-check animated rotateIn text-white"></i>
<<<<<<< HEAD
                <p class="heading lead text-left " id="msg_mod_success"></p>
=======
                <p class="heading lead text-left " id="Text_Sucess"></p>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>

<!--Modal de Registro de Usuario-->
<<<<<<< HEAD
<div class="modal fade" id="mod_form_reg_usuario" tabindex="-1" role="dialog" aria-labelledby="mod_form_reg_usuario"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded ">

            <form id="form_reg_usuario" name="form_reg_usuario" method="POST"
                action="../../Register?Peticion=Registro_Usuario">
=======
<div class="modal fade" id="Mod_Reg_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Usuario"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded ">
            <form id="Form_Registro_Usuario" name="Form_Registro_Usuario" method="POST"
                action="../../Registro?Peticion=Registro_Usuario">
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Formulario de Registro</strong></h4>
                </div>
<<<<<<< HEAD

=======
                <!--/Header-->
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                <!--Body-->
                <div class="modal-body mx-3">
                    <div class="container">
                        <div class="row">
<<<<<<< HEAD
                            <input type="hidden" id="form_reg_estado" name="form_reg_estado" value="1">

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_perfil">Tipo de Usuario</label>
                                    <select id="form_reg_perfil" name="form_reg_perfil"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un perfil</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Cliente</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_sexo">Sexo</label>
                                    <select id="form_reg_sexo" name="form_reg_sexo"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione su sexo</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_nombres"><i class="fa fa-user-circle prefix"></i>
                                        Nombres</label>
                                    <input type="text" id="form_reg_nombres" name="form_reg_nombres"
                                        class="form-control" aria-describedby="form_reg_nombres">

                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_apellidos"><i class="fa fa-user-circle prefix"></i>
                                        Apellidos</label>
                                    <input type="text" id="form_reg_apellidos" name="form_reg_apellidos"
                                        class="form-control" aria-describedby="form_reg_apellidos">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class=" form-group">
                                    <label for="form_reg_identificacion"><i class="fas fa-address-card prefix"></i>
                                        Numero de Identificaci&#243n</label>
                                    <input type="text" id="form_reg_identificacion" name="form_reg_identificacion"
                                        class="form-control" aria-describedby="form_reg_identificacion">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_correo"><i class="fas fa-envelope prefix"></i> Correo
                                        electron&#237co</label>
                                    <input type="email" id="form_reg_correo" name="form_reg_correo" class="form-control"
                                        aria-describedby="form_reg_correo">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_telefono"><i class="fas fa-mobile-alt prefix"></i>
                                        Telefono</label>
                                    <input type="number" id="form_reg_telefono" name="form_reg_telefono"
                                        class="form-control" aria-describedby="form_reg_telefono">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_username"><i class="fa fa-user prefix"></i> Usuario</label>
                                    <input type="text" id="form_reg_username" name="form_reg_username"
                                        class="form-control" aria-describedby="form_reg_username">
=======
                            <div class="col justify-content-center align-items-center">
                                <div id="msg_SucessRegistro_usuario" class="alert alert-success d-none" role="alert">
                                    <h6 class="h6 text-center">Usuario registrado con ex&#237to</h6>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                </div>
                            </div>
                        </div>
                        <div class="row">
<<<<<<< HEAD
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_pwd"><i class="fa fa-lock prefix"></i> Contrase&#241a</label>
                                    <input type="password" id="form_reg_pwd" name="form_reg_pwd" class="form-control">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_pwd_2"><i class="fa fa-lock prefix"></i> Confirmar
                                        contrase&#241a</label>
                                    <input type="password" id="form_reg_pwd_2" name="form_reg_pwd_2"
                                        class="form-control">
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
                                <button id="btn_submit_form_reg_usuario" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_form_reg_usuario"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!--Modal de Modificacion de Usuario-->
<div class="modal fade" id="mod_form_edit_usuario_system" tabindex="-1" role="dialog" aria-labelledby="mod_form_edit_usuario_system"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded ">

            <form id="form_edit_usuario_system" name="form_edit_usuario_system" method="POST"
                action="../../Edit?Peticion=Editar_Usuario&Tipo=System">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Formulario de Modificaci&#243n</strong></h4>
                </div>

                <!--Body-->
                <div class="modal-body mx-3">
                    <div class="container">
                        <div class="row">
                            <input type="hidden" id="form_edit_estado_system" name="form_edit_estado_system" value="1">

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_perfil_system">Tipo de Usuario</label>
                                    <select id="form_edit_perfil_system" name="form_edit_perfil_system"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un perfil</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Cliente</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_sexo_system">Sexo</label>
                                    <select id="form_edit_sexo_system" name="form_edit_sexo_system"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione su sexo</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_nombres_system"><i class="fa fa-user-circle prefix"></i>
                                        Nombres</label>
                                    <input type="text" id="form_edit_nombres_system" name="form_edit_nombres_system"
                                        class="form-control" aria-describedby="form_edit_nombres_system">

                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_apellidos_system"><i class="fa fa-user-circle prefix"></i>
                                        Apellidos</label>
                                    <input type="text" id="form_edit_apellidos_system" name="form_edit_apellidos_system"
                                        class="form-control" aria-describedby="form_edit_apellidos_system">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class=" form-group">
                                    <label for="form_edit_identificacion_system"><i class="fas fa-address-card prefix"></i>
                                        Numero de Identificaci&#243n</label>
                                    <input type="text" id="form_edit_identificacion_system" name="form_edit_identificacion_system"
                                        class="form-control" aria-describedby="form_edit_identificacion_system" disabled>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_correo_system"><i class="fas fa-envelope prefix"></i> Correo
                                        electron&#237co</label>
                                    <input type="email" id="form_edit_correo_system" name="form_edit_correo_system" class="form-control"
                                        aria-describedby="form_edit_correo_system">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_telefono_system"><i class="fas fa-mobile-alt prefix"></i>
                                        Telefono</label>
                                    <input type="number" id="form_edit_telefono_system" name="form_edit_telefono_system"
                                        class="form-control" aria-describedby="form_edit_telefono_system">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_username_system"><i class="fa fa-user prefix"></i> Usuario</label>
                                    <input type="text" id="form_edit_username_system" name="form_edit_username_system"
                                        class="form-control" aria-describedby="form_edit_username_system">
=======
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fa fa-user-circle prefix grey-text"></i>
                                    <input type="text" id="NOMBRE_USER" name="NOMBRE_USER" class="form-control validate"
                                        aria-describedby="NOMBRE_USER">
                                    <label data-success="" for="NOMBRE_USER">Nombres</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <input type="text" id="APELLIDOS_USER" name="APELLIDOS_USER"
                                        class="form-control validate" aria-describedby="APELLIDOS_USER">
                                    <label data-success="" for="APELLIDOS_USER">Apellidos</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fas fa-address-card prefix grey-text"></i>
                                    <input type="text" id="DOC_USER" name="DOC_USER" class="form-control validate"
                                        aria-describedby="DOC_USER">
                                    <label data-success="" for="DOC_USER">Documento</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fas fa-envelope prefix grey-text"></i>
                                    <input type="email" id="CORREO_USER" name="CORREO_USER"
                                        class="form-control validate" aria-describedby="CORREO_USER">
                                    <label data-success="" for="CORREO_USER">Correo Electron&#237co</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fa fa-user prefix grey-text"></i>
                                    <input type="text" id="R_NICK_USER" name="R_NICK_USER" class="form-control validate"
                                        aria-describedby="R_NICK_USER">
                                    <label data-success="" for="R_NICK_USER">Usuario</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="md-form">
                                    <i class="fas fa-mobile-alt prefix grey-text"></i>
                                    <input type="text" id="R_CELULAR_USER" name="R_CELULAR_USER"
                                        class="form-control validate" aria-describedby="R_CELULAR_USER">
                                    <label data-success="" for="R_CELULAR_USER">Celular</label>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                </div>
                            </div>
                        </div>
                        <div class="row">
<<<<<<< HEAD
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_pwd_system"><i class="fa fa-lock prefix"></i> Contrase&#241a</label>
                                    <input type="password" id="form_edit_pwd_system" name="form_edit_pwd_system" class="form-control">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_pwd_2_system"><i class="fa fa-lock prefix"></i> Confirmar
                                        contrase&#241a</label>
                                    <input type="password" id="form_edit_pwd_2_system" name="form_edit_pwd_2_system"
                                        class="form-control">
=======
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input type="password" id="R_PASSWORD_USER" name="R_PASSWORD_USER"
                                        class="form-control validate">
                                    <label data-success="" for="R_PASSWORD_USER">Contrase&#241a</label>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="md-form">
                                    <i class="fa fa-lock prefix grey-text"></i>
                                    <input type="password" id="pwd" name="pwd" class="form-control validate">
                                    <label data-success="" for="pwd">Confirmar Contrase&#241a</label>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<<<<<<< HEAD
=======
                <!--/Body-->
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
<<<<<<< HEAD
                                <button id="btn_submit_form_reg_usuario_system" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_form_reg_usuario_system"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
=======
                                <button id="btn_registro_usuario" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_usuario" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                            </div>
                        </div>
                    </div>
                </div>
<<<<<<< HEAD

            </form>
        </div>
    </div>
</div>

<!--Modal Eliminar Usuario-->
<div class="modal fade" id="mod_form_elim_usuario" tabindex="-1" role="dialog" aria-labelledby="mod_form_elim_usuario"
=======
                <!--/Footer-->

            </form>

        </div>
    </div>
</div>
<!--/Modal de Registro de Usuario-->

<!--Modal Eliminar Usuario-->
<div class="modal fade" id="Mod_Elim_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Elim_Usuario"
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
<<<<<<< HEAD
            <form id="form_elim_usuario" name="Form_Eliminar_Usuario" method="POST"
                action="../../Delete?Peticion=Eliminar_Usuario">
=======
            <form id="Form_Eliminar_Usuario" name="Form_Eliminar_Usuario" method="POST"
                action="../../Registro?Peticion=Eliminar_Usuario">
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Eliminar Usuario</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3 text-center">
<<<<<<< HEAD
                    <p id="msg_form_elim_usuario"></p>
                    <input id="form_elim_idenfiticacion" name="form_elim_idenfiticacion" type="hidden">
=======
                    <p id="Usuario_Eliminar"></p>
                    <input id="DEL_DOC_USER" name="DEL_DOC_USER" type="hidden">
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
<<<<<<< HEAD
                                <button id="btn_submit_form_elim_usuario" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancel_form_elim_usuario" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Cancelar</button>
                                <i id="icon_load_form_elim_usuario"
=======
                                <button id="btn_eliminar_Usuario" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancelarEliminar_Usuario" class="btn btn-secondary"
                                    data-dismiss="modal" aria-label="Close">Cancelar</button>
                                <i id="icon_loadEliminar_Usuario"
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
<<<<<<< HEAD
</div>
=======
</div>
<!--/Modal Eliminar Usuario-->
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
