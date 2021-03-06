<!--#################################################### CRUD de Usuarios ##############################################################-->

<!--Modal Sucess-->
<div class="modal fade right" id="mod_success" tabindex="-1" role="dialog" aria-labelledby="mod_success"
    aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">

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
                action="../../Register?Peticion=Registro_Usuario_System">
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
                            <input type="hidden" id="form_reg_estado_system" name="form_reg_estado_system" value="1">

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_perfil_system">Tipo de Usuario</label>
                                    <select id="form_reg_perfil_system" name="form_reg_perfil_system"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un perfil</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Cliente</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_sexo_system">Sexo</label>
                                    <select id="form_reg_sexo_system" name="form_reg_sexo_system"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione su sexo</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_nombres_system"><i class="fa fa-user-circle prefix"></i>
                                        Nombres</label>
                                    <input type="text" id="form_reg_nombres_system" name="form_reg_nombres_system"
                                        class="form-control" aria-describedby="form_reg_nombres_system">

                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_apellidos_system"><i class="fa fa-user-circle prefix"></i>
                                        Apellidos</label>
                                    <input type="text" id="form_reg_apellidos_system" name="form_reg_apellidos_system"
                                        class="form-control" aria-describedby="form_reg_apellidos_system">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class=" form-group">
                                    <label for="form_reg_identificacion_system"><i
                                            class="fas fa-address-card prefix"></i>
                                        Numero de Identificaci&#243n</label>
                                    <input type="text" id="form_reg_identificacion_system"
                                        name="form_reg_identificacion_system" class="form-control"
                                        aria-describedby="form_reg_identificacion_system">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_correo_system"><i class="fas fa-envelope prefix"></i> Correo
                                        electron&#237co</label>
                                    <input type="email" id="form_reg_correo_system" name="form_reg_correo_system"
                                        class="form-control" aria-describedby="form_reg_correo_system">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_telefono_system"><i class="fas fa-mobile-alt prefix"></i>
                                        Telefono</label>
                                    <input type="number" id="form_reg_telefono_system" name="form_reg_telefono_system"
                                        class="form-control" aria-describedby="form_reg_telefono_system">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_username_system"><i class="fa fa-user prefix"></i>
                                        Usuario</label>
                                    <input type="text" id="form_reg_username_system" name="form_reg_username_system"
                                        class="form-control" aria-describedby="form_reg_username_system">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_pwd_system"><i class="fa fa-lock prefix"></i>
                                        Contrase&#241a</label>
                                    <input type="password" id="form_reg_pwd_system" name="form_reg_pwd_system"
                                        class="form-control">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_pwd_2_system"><i class="fa fa-lock prefix"></i> Confirmar
                                        contrase&#241a</label>
                                    <input type="password" id="form_reg_pwd_2_system" name="form_reg_pwd_2_system"
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

<!--Modal de Registro de Usuario Cliente -->
<div class="modal fade" id="mod_form_reg_usuario_client" tabindex="-1" role="dialog"
    aria-labelledby="mod_form_reg_usuario_client" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded ">

            <form id="form_reg_usuario_client" name="form_reg_usuario_client" method="POST"
                action="../../Register?Peticion=Registro_Usuario_Client">
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
                            <input type="hidden" id="form_reg_estado_client" name="form_reg_estado_client" value="1">
                            <input type="hidden" id="form_reg_perfil_client" name="form_reg_perfil_client" value="2">


                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_sexo_client">Sexo</label>
                                    <select id="form_reg_sexo_client" name="form_reg_sexo_client"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione su sexo</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_nombres_client"><i class="fa fa-user-circle prefix"></i>
                                        Nombres</label>
                                    <input type="text" id="form_reg_nombres_client" name="form_reg_nombres_client"
                                        class="form-control" aria-describedby="form_reg_nombres_client">

                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_apellidos_client"><i class="fa fa-user-circle prefix"></i>
                                        Apellidos</label>
                                    <input type="text" id="form_reg_apellidos_client" name="form_reg_apellidos_client"
                                        class="form-control" aria-describedby="form_reg_apellidos_client">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class=" form-group">
                                    <label for="form_reg_identificacion_client"><i
                                            class="fas fa-address-card prefix"></i>
                                        Numero de Identificaci&#243n</label>
                                    <input type="text" id="form_reg_identificacion_client"
                                        name="form_reg_identificacion_client" class="form-control"
                                        aria-describedby="form_reg_identificacion_client">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_correo_client"><i class="fas fa-envelope prefix"></i> Correo
                                        electron&#237co</label>
                                    <input type="email" id="form_reg_correo_client" name="form_reg_correo_client"
                                        class="form-control" aria-describedby="form_reg_correo_client">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_telefono_client"><i class="fas fa-mobile-alt prefix"></i>
                                        Telefono</label>
                                    <input type="number" id="form_reg_telefono_client" name="form_reg_telefono_client"
                                        class="form-control" aria-describedby="form_reg_telefono_client">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_talla_client"><i class="fas fa-tape"></i> Talla</label>
                                    <input type="number" id="form_reg_talla_client" name="form_reg_talla_client"
                                        class="form-control" aria-describedby="form_reg_talla_client">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_peso_client"><i class="fas fa-weight"></i> Peso</label>
                                    <input type="number" id="form_reg_peso_client" name="form_reg_peso_client"
                                        class="form-control" aria-describedby="form_reg_peso_client">
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
                                <button id="btn_submit_form_reg_usuario_client" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_form_reg_usuario_client"
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
<div class="modal fade" id="mod_form_edit_usuario_system" tabindex="-1" role="dialog"
    aria-labelledby="mod_form_edit_usuario_system" aria-hidden="true">
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
                                    <label for="form_edit_identificacion_system"><i
                                            class="fas fa-address-card prefix"></i>
                                        Numero de Identificaci&#243n</label>
                                    <input type="text" id="form_edit_identificacion_system"
                                        name="form_edit_identificacion_system" class="form-control"
                                        aria-describedby="form_edit_identificacion_system" readonly="readonly">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_correo_system"><i class="fas fa-envelope prefix"></i> Correo
                                        electron&#237co</label>
                                    <input type="email" id="form_edit_correo_system" name="form_edit_correo_system"
                                        class="form-control" aria-describedby="form_edit_correo_system"
                                        readonly="readonly">
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
                                    <label for="form_edit_username_system"><i class="fa fa-user prefix"></i>
                                        Usuario</label>
                                    <input type="text" id="form_edit_username_system" name="form_edit_username_system"
                                        class="form-control" aria-describedby="form_edit_username_system">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_pwd_system"><i class="fa fa-lock prefix"></i>
                                        Contrase&#241a</label>
                                    <input type="password" id="form_edit_pwd_system" name="form_edit_pwd_system"
                                        class="form-control">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_pwd_2_system"><i class="fa fa-lock prefix"></i> Confirmar
                                        contrase&#241a</label>
                                    <input type="password" id="form_edit_pwd_2_system" name="form_edit_pwd_2_system"
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
                                <button id="btn_submit_form_edit_usuario_system" class="btn btn-dark-green"
                                    type="submit">Modificar</button>
                                <i id="icon_load_form_edit_usuario_system"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!--Modal Eliminar Usuario-->
<div class="modal fade" id="mod_form_elim_usuario" tabindex="-1" role="dialog" aria-labelledby="mod_form_elim_usuario"
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
            <form id="form_elim_usuario" name="form_elim_usuario" method="POST"
                action="../../Delete?Peticion=Eliminar_Usuario">
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
                    <p id="msg_form_elim_usuario"></p>
                    <input id="form_elim_idenfiticacion" name="form_elim_idenfiticacion" type="hidden">
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_submit_form_elim_usuario" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancel_form_elim_usuario" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Cancelar</button>
                                <i id="icon_load_form_elim_usuario"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
</div>

<!--#################################################### CRUD de Recetas ##############################################################-->

<!--Modal de Registro de recetas-->
<div class="modal fade" id="mod_form_reg_receta" tabindex="-1" role="dialog" aria-labelledby="mod_form_reg_receta"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded ">

            <form id="form_reg_receta" name="form_reg_receta" method="POST"
                action="../../Register?Peticion=Registro_Receta">
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

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_usuario_receta">Usuario</label>
                                    <select id="form_reg_usuario_receta" name="form_reg_usuario_receta"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un usuario</option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_desc_receta">Descrici&#243n</label>
                                    <textarea class="form-control" id="form_reg_desc_receta" name="form_reg_desc_receta"
                                        rows="7"></textarea>
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
                                <button id="btn_submit_form_reg_receta" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_form_reg_receta"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!--Modal de Modificacion de recetas-->
<div class="modal fade" id="mod_form_edit_receta" tabindex="-1" role="dialog" aria-labelledby="mod_form_edit_receta"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded ">

            <form id="form_edit_receta" name="form_edit_receta" method="POST"
                action="../../Edit?Peticion=Editar_Receta">
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
                            <input type="hidden" id="form_edit_id_receta" name="form_edit_id_receta">

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_usuario_receta">Usuario</label>
                                    <select id="form_edit_usuario_receta" name="form_edit_usuario_receta"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un usuario</option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_desc_receta">Descrici&#243n</label>
                                    <textarea class="form-control" id="form_edit_desc_receta"
                                        name="form_edit_desc_receta" rows="7"></textarea>
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
                                <button id="btn_submit_form_edit_receta" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_form_reg_receta"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!--Modal Eliminar Receta-->
<div class="modal fade" id="mod_form_elim_receta" tabindex="-1" role="dialog" aria-labelledby="mod_form_elim_receta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
            <form id="form_elim_receta" name="form_elim_receta" method="POST"
                action="../../Delete?Peticion=Eliminar_Receta">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Eliminar Receta</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3 text-center">
                    <p id="msg_form_elim_receta"></p>
                    <input id="form_elim_id_receta" name="form_elim_id_receta" type="hidden">
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_submit_form_elim_receta" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancel_form_elim_receta" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Cancelar</button>
                                <i id="icon_load_form_elim_receta"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
</div>



<!--#################################################### CRUD de Citas ##############################################################-->

<!-- Modal Registro de Citas -->
<div class="modal fade" id="mod_form_reg_cita" tabindex="-1" role="dialog" aria-labelledby="mod_form_add_cita"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded">
            <form action="../../Register?Peticion=Registro_Cita" name="form_reg_cita" id="form_reg_cita" method="POST">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-white text-center">Agendar Cita</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_cita_usuario"><i class="far fa-user"></i> Usuario</label>
                                    <select id="form_reg_cita_usuario" name="form_reg_cita_usuario"
                                        class="browser-default custom-select form-control">
                                        <option value="">Seleccione un usuario</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_reg_cita_fecha"><i class="far fa-calendar-alt"></i> Fecha</label>
                                    <input type="datetime-local" class="form-control" name="form_reg_cita_fecha"
                                        id="form_reg_cita_fecha" aria-describedby="Fecha de la cita" placeholder="">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                  <label for="form_reg_cita_desc"><i class="far fa-clipboard"></i> Descripcion de la cita</label>
                                  <textarea class="form-control" name="form_reg_cita_desc" id="form_reg_cita_desc" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                
                        <button id="btn_submit_form_reg_cita" class="btn btn-dark-green"
                            type="submit">Registrarse</button>
                        <i id="icon_load_form_reg_cita"
                            class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                   
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal Editar Cita -->
<div class="modal fade" id="mod_form_edit_cita" tabindex="-1" role="dialog" aria-labelledby="mod_form_edit_cita"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded">
            <form action="../../Edit?Peticion=Editar_Cita" name="form_edit_cita" id="form_edit_cita" method="POST">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-white text-center">Agendar Cita</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_cita_estado"><i class="far fa-user"></i> Estado</label>
                                    <select id="form_edit_cita_estado" name="form_edit_cita_estado"
                                        class="browser-default custom-select form-control">
                                        <option value="1">ACTIVO</option>
                                        <option value="2">CANCELADO</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label for="form_edit_cita_fecha"><i class="far fa-calendar-alt"></i> Fecha</label>
                                    <input type="datetime-local" class="form-control" name="form_edit_cita_fecha"
                                        id="form_edit_cita_fecha" aria-describedby="Fecha de la cita" placeholder="">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                  <label for="form_edit_cita_desc"><i class="far fa-clipboard"></i> Descripcion de la cita</label>
                                  <textarea class="form-control" name="form_edit_cita_desc" id="form_edit_cita_desc" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <input type="hidden" name="form_edit_cita_id" id="form_edit_cita_id">
                
                        <button id="btn_submit_form_edit_cita" class="btn btn-dark-green"
                            type="submit">Registrarse</button>
                        <i id="icon_load_form_edit_cita"
                            class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                   
                </div>
            </form>
        </div>
    </div>
</div>



<!--Modal Eliminar Cita-->
<div class="modal fade" id="mod_form_elim_cita" tabindex="-1" role="dialog" aria-labelledby="mod_form_elim_cita"
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
            <form id="form_elim_cita" name="form_elim_cita" method="POST"
                action="../../Delete?Peticion=Eliminar_Cita">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Eliminar Cita</strong></h4>
                </div>
                <!--/Header-->

                <!--Body-->
                <div class="modal-body mx-3 text-center">
                    <p id="msg_form_elim_cita"></p>
                    <input id="form_elim_id_cita" name="form_elim_id_cita" type="hidden">
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_submit_form_elim_cita" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancel_form_elim_cita" class="btn btn-secondary" data-dismiss="modal"
                                    aria-label="Close">Cancelar</button>
                                <i id="icon_load_form_elim_cita"
                                    class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->
            </form>
        </div>
    </div>
</div>