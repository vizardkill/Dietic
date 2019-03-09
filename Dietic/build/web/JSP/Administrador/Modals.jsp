<!--#################################################### CRUD de Materias ##############################################################-->

<!--Modal Sucess-->
<div class="modal fade right" id="Mod_Sucess" tabindex="-1" role="dialog" aria-labelledby="Mod_Sucess"
    aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">

        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header d-flex align-items-center">
                <i class="fas fa-check animated rotateIn text-white"></i>
                <p class="heading lead text-left " id="Text_Sucess"></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>

<!--Modal de Registro de Usuario-->
<div class="modal fade" id="Mod_Reg_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Reg_Usuario"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded ">
            <form id="Form_Registro_Usuario" name="Form_Registro_Usuario" method="POST"
                action="../../Registro?Peticion=Registro_Usuario">
                <!--Header-->
                <div class="modal-header bg-dark d-block">
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="text-center text-white"><strong>Formulario de Registro</strong></h4>
                </div>
                <!--/Header-->
                <!--Body-->
                <div class="modal-body mx-3">
                    <div class="container">
                        <div class="row">
                            <div class="col justify-content-center align-items-center">
                                <div id="msg_SucessRegistro_usuario" class="alert alert-success d-none" role="alert">
                                    <h6 class="h6 text-center">Usuario registrado con ex&#237to</h6>
                                </div>
                            </div>
                        </div>
                        <div class="row">
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
                                </div>
                            </div>
                        </div>
                        <div class="row">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_registro_usuario" class="btn btn-dark-green"
                                    type="submit">Registrarse</button>
                                <i id="icon_load_usuario" class="fa fa-spinner fa-spin d-none text-center mx-auto"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Footer-->

            </form>

        </div>
    </div>
</div>
<!--/Modal de Registro de Usuario-->

<!--Modal Eliminar Usuario-->
<div class="modal fade" id="Mod_Elim_Usuario" tabindex="-1" role="dialog" aria-labelledby="Mod_Elim_Usuario"
    aria-hidden="true">
    <div class="modal-dialog" role="document">

        <div class="modal-content rounded ">
            <form id="Form_Eliminar_Usuario" name="Form_Eliminar_Usuario" method="POST"
                action="../../Registro?Peticion=Eliminar_Usuario">
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
                    <p id="Usuario_Eliminar"></p>
                    <input id="DEL_DOC_USER" name="DEL_DOC_USER" type="hidden">
                </div>
                <!--/Body-->

                <!--Footer-->
                <div class="modal-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-center mx-auto">
                                <button id="btn_eliminar_Usuario" class="btn btn-secondary"
                                    type="submit">Aceptar</button>
                                <button id="btn_cancelarEliminar_Usuario" class="btn btn-secondary"
                                    data-dismiss="modal" aria-label="Close">Cancelar</button>
                                <i id="icon_loadEliminar_Usuario"
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
<!--/Modal Eliminar Usuario-->