//Funciones
function logout() {
    $.ajax({
        url: $("#form_logout").attr("action"),
        type: $("#form_logout").attr("method"),
        dataType: "text",
        success: function (res) {
            window.location.reload();
        }
    })
}



//################################## Configuraciones de JQuery Validator
jQuery.validator.setDefaults({
    errorElement: "p",
    errorPlacement: function (error, element) {
        error.addClass("invalid-feedback");
        element.closest(".form-group").append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass("is-invalid").removeClass("is-valid");
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass("is-invalid").addClass("is-valid");
    },
    /*success: function(label) {
        label
          .text('OK!').addClass('valid-feedback').removeClass('invalid-feedback')
          .closest('.form-group')
    }*/
});

//################################## Metodos Adicionales para JQuery Validator
$.validator.addMethod("especial", function (value) {
    return /[\@\#\$\%\^\&\*\(\)\_\+\!]/.test(value);
});
$.validator.addMethod("minuscula", function (value) {
    return /[a-z]/.test(value);
});
$.validator.addMethod("mayuscula", function (value) {
    return /[A-Z]/.test(value);
});
$.validator.addMethod("digito", function (value) {
    return /[0-9]/.test(value);
});
$.validator.addMethod("letras", function (value) {
    return /^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$/.test(value);
});

$.validator.addMethod("fechaActual", function (value) {
    var test = returFecha();
    return test;
});

function returFecha() {
    var inputFecha = document.getElementById("form_reg_cita_fecha").value;

    var dateInput = new Date(inputFecha);

    var mesInput = dateInput.getMonth() + 1;
    var anioInput = dateInput.getFullYear();
    var diaInput = dateInput.getDate();

    var fecha = [
        (diaInput > 9 ? "" : "0") + diaInput,
        (mesInput > 9 ? "" : "0") + mesInput,
        anioInput,
    ].join("/");

    var date = new Date();

    var mes = date.getMonth() + 1;
    var anio = date.getFullYear();
    var dia = date.getDate();

    if (anioInput < anio) {
        return false;
    } else {
        if (mesInput < mes) {
            return false;
        } else {
            if (diaInput <= dia) {
                return false;
            } else {
                return true;
            }
        }
    }
}

$(document).ready(function () {
    //Funcion que permite consultar la informacion de los usuario y renderiza las opciones en el formulario de recetas
    $.ajax({
        type: "GET",
        url: "../../Data?Peticion=data_usuarios",
        dataType: "json",

        success: function (Data) {
            $.each(Data.v_Usuarios, function (i, item) {
                $("#form_reg_usuario_receta").append(
                    "<option value=" +
                        item.identificacion +
                        ">" +
                        item.nombres +
                        " " +
                        item.apellidos +
                        "</option>"
                );
            });

            $.each(Data.v_Usuarios, function (i, item) {
                $("#form_edit_usuario_receta").append(
                    "<option value=" +
                        item.identificacion +
                        ">" +
                        item.nombres +
                        " " +
                        item.apellidos +
                        "</option>"
                );
            });

            $.each(Data.v_Usuarios, function (i, item) {
                $("#form_reg_cita_usuario").append(
                    "<option value=" +
                        item.identificacion +
                        ">" +
                        item.nombres +
                        " " +
                        item.apellidos +
                        "</option>"
                );
            });
        },
        error: function (response) {
            alert("Error interno con el servidor, intentalo de nuevo más tarde");
            console.log(response);
        },
    });

    //################################## Esta Seccion establece la validacion de los diferentes Formularios del Sistema a travez de JQuery Validator

    //Validacion del Formulario para el registro de un usuario
    $("#form_reg_usuario_system").validate({
        rules: {
            form_reg_perfil_system: { required: true },
            form_reg_sexo_system: { required: true },
            form_reg_nombres_system: {
                required: true,
                minlength: 3,
                maxlength: 20,
                letras: true,
            },
            form_reg_apellidos_system: {
                required: true,
                minlength: 5,
                maxlength: 20,
                letras: true,
            },
            form_reg_identificacion_system: {
                required: true,
                minlength: 5,
                maxlength: 15,
                remote: {
                    url: "../../Register?Peticion=ValidarDocUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_identificacion_system: function () {
                            return $("#form_reg_identificacion_system").val();
                        },
                    },
                },
            },
            form_reg_correo_system: {
                required: true,
                email: true,
                remote: {
                    url: "../../Register?Peticion=ValidarEmailUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_correo_system: function () {
                            return $("#form_reg_correo_system").val();
                        },
                    },
                },
            },
            form_reg_username_system: {
                required: true,
                minlength: 4,
                maxlength: 10,
                remote: {
                    url: "../../Register?Peticion=ValidarNickUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_username_system: function () {
                            return $("#form_reg_username_system").val();
                        },
                    },
                },
            },
            form_reg_pwd_system: {
                required: true,
                minlength: 8,
                maxlength: 20,
                especial: true,
                minuscula: true,
                mayuscula: true,
                digito: true,
            },
            form_reg_pwd_2_system: { required: true, equalTo: "#form_reg_pwd_system" },
        },
        messages: {
            form_reg_perfil_system: {
                required: "El campo es requerido",
            },
            form_reg_sexo_system: {
                required: "El campo es requerido",
            },
            form_reg_nombres_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_reg_apellidos_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_reg_identificacion_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 5 caracteres",
                maxlength: "El campo solo puede contener un maximo de 15 caracteres",
                remote: "Este documento ya se encuentra en uso",
            },
            form_reg_correo_system: {
                required: "El campo es requerido",
                email: "El correo electronico introducido es incorrecto",
                remote: "Este correo ya se encuentra en uso",
            },
            form_reg_username_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 4 caracteres",
                maxlength: "El campo solo puede contener un maximo de 10 caracteres",
                remote: "Este usuario ya se encuentra en uso por favor usa uno diferente",
            },
            form_reg_pwd_system: {
                required: "La contraseña es obligatoria",
                minlength: "La contraseña debe ser de almenos 8 digitos",
                maxlength: "La contraseña no puede sobrepasar los 20 digitos",
                especial: "La contraseña debe contener almenos un caracter especial",
                minuscula: "La contraseña debe contener una letra minuscula",
                mayuscula: "La contraseña debe contener una letra mayuscula",
            },
            form_reg_pwd_2_system: {
                required: "Es obligatorio que confirmes tu contraseña",
                equalTo: "Las contraseñas no coinciden",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_usuario_system").attr("action"),
                type: $("#form_reg_usuario_system").attr("method"),
                data: $("#form_reg_usuario_system").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_reg_usuario_system")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_reg_usuario_system")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#form_reg_usuario_system")[0].reset();
                        $("#form_reg_usuario_system .form-control").removeClass(
                            "is-valid"
                        );
                        $("#table_usuarios").DataTable().ajax.reload();

                        $("#mod_form_reg_usuario_system").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Usuario registrado con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    } else {
                        alert("Ha ocurrido un error al almacenar los datos");
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_reg_usuario_system")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_reg_usuario_system")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Validacion del Formulario para el registro de un usuario
    $("#form_reg_usuario_client").validate({
        rules: {
            form_reg_sexo_client: { required: true },
            form_reg_nombres_client: {
                required: true,
                minlength: 3,
                maxlength: 20,
                letras: true,
            },
            form_reg_apellidos_client: {
                required: true,
                minlength: 5,
                maxlength: 20,
                letras: true,
            },
            form_reg_identificacion_client: {
                required: true,
                minlength: 5,
                maxlength: 15,
                remote: {
                    url: "../../Register?Peticion=ValidarDocUsuario&Tipo=client",
                    type: "GET",
                    data: {
                        form_reg_identificacion_system: function () {
                            return $("#form_reg_identificacion_system").val();
                        },
                    },
                },
            },
            form_reg_correo_client: {
                required: true,
                email: true,
                remote: {
                    url: "../../Register?Peticion=ValidarEmailUsuario&Tipo=client",
                    type: "GET",
                    data: {
                        form_reg_correo_system: function () {
                            return $("#form_reg_correo_system").val();
                        },
                    },
                },
            },
            form_reg_talla_client: { required: true },
            form_reg_peso_client: { required: true },
        },
        messages: {
            form_reg_sexo_client: {
                required: "El campo es requerido",
            },
            form_reg_nombres_client: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_reg_apellidos_client: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_reg_identificacion_client: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 5 caracteres",
                maxlength: "El campo solo puede contener un maximo de 15 caracteres",
                remote: "Este documento ya se encuentra en uso",
            },
            form_reg_correo_client: {
                required: "El campo es requerido",
                email: "El correo electronico introducido es incorrecto",
                remote: "Este correo ya se encuentra en uso",
            },
            form_reg_talla_client: {
                required: "El campo es requerido",
            },
            form_reg_peso_client: {
                required: "El campo es requerido",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_usuario_client").attr("action"),
                type: $("#form_reg_usuario_client").attr("method"),
                data: $("#form_reg_usuario_client").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_reg_usuario_client")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_reg_usuario_client")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_usuarios").DataTable().ajax.reload();

                        $("#form_reg_usuario_client")[0].reset();
                        $("#form_reg_usuario_client .form-control").removeClass(
                            "is-valid"
                        );

                        $("#mod_form_reg_usuario_client").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Usuario registrado con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_reg_usuario_client")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_reg_usuario_client")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Validacion del Formulario para la modificacion de un usuario
    $("#form_edit_usuario_system").validate({
        rules: {
            form_edit_perfil_system: { required: true },
            form_edit_sexo_system: { required: true },
            form_edit_nombres_system: {
                required: true,
                minlength: 3,
                maxlength: 20,
                letras: true,
            },
            form_edit_apellidos_system: {
                required: true,
                minlength: 5,
                maxlength: 20,
                letras: true,
            },
            form_edit_username_system: {
                required: true,
                minlength: 4,
                maxlength: 10,
                remote: {
                    url: "../../Register?Peticion=ValidarNickUsuario&Tipo=edit_system",
                    type: "GET",
                    data: {
                        form_edit_username_system: function () {
                            return $("#form_edit_username_system").val();
                        },
                    },
                },
            },
            form_edit_pwd_system: {
                required: true,
                minlength: 8,
                maxlength: 20,
                especial: true,
                minuscula: true,
                mayuscula: true,
                digito: true,
            },
            form_edit_pwd_2_system: { required: true, equalTo: "#form_edit_pwd_system" },
        },
        messages: {
            form_edit_perfil_system: {
                required: "El campo es requerido",
            },
            form_edit_sexo_system: {
                required: "El campo es requerido",
            },
            form_edit_nombres_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_edit_apellidos_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 3 caracteres",
                maxlength: "El campo solo puede contener un maximo de 20 caracteres",
                letras: "El campo no puede contener caracteres especiales ni números",
            },
            form_edit_username_system: {
                required: "El campo es requerido",
                minlength: "El campo debe contener un minimo de 4 caracteres",
                maxlength: "El campo solo puede contener un maximo de 10 caracteres",
                remote: "Este usuario ya se encuentra en uso por favor usa uno diferente",
            },
            form_edit_pwd_system: {
                required: "La contraseña es obligatoria",
                minlength: "La contraseña debe ser de almenos 8 digitos",
                maxlength: "La contraseña no puede sobrepasar los 20 digitos",
                especial: "La contraseña debe contener almenos un caracter especial",
                minuscula: "La contraseña debe contener una letra minuscula",
                mayuscula: "La contraseña debe contener una letra mayuscula",
            },
            form_edit_pwd_2_system: {
                required: "Es obligatorio que confirmes tu contraseña",
                equalTo: "Las contraseñas no coinciden",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_edit_usuario_system").attr("action"),
                type: $("#form_edit_usuario_system").attr("method"),
                data: $("#form_edit_usuario_system").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_edit_usuario_system")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_edit_usuario_system")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_usuarios").DataTable().ajax.reload();

                        $("#form_edit_usuario_system")[0].reset();
                        $("#form_edit_usuario_system .form-control").removeClass(
                            "is-valid"
                        );

                        $("#mod_form_edit_usuario_system").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Usuario modificado con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_edit_usuario_system")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_edit_usuario_system")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Confirmacion del Formulario para la eliminacion de un Usuario
    $("#form_elim_usuario").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $("#form_elim_usuario").attr("method"),
            url: $("#form_elim_usuario").attr("action"),
            data: $("#form_elim_usuario").serialize(),
            dataType: "text",

            beforeSend: function () {
                $("#icon_load_form_elim_usuario")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_submit_form_elim_usuario")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_cancel_form_elim_usuario")
                    .removeClass("d-block")
                    .addClass("d-none");
            },
            success: function (response) {
                if (response == "true") {
                    $("#table_usuarios").DataTable().ajax.reload();

                    $("#mod_form_elim_usuario").modal("hide");
                    $("#mod_success").modal("show");
                    $("#msg_mod_success").text("Usuario eliminado con éxito");
                    function ShowSucess() {
                        $("#mod_success").modal("hide");
                    }
                    setTimeout(ShowSucess, 2000);
                }
            },
            error: function (response) {
                console.log(response);
                alert("Error con el servidor, por favor intentalo de nuevo mas tarde");
            },
            complete: function () {
                $("#icon_load_form_elim_usuario")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_submit_form_elim_usuario")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_cancel_form_elim_usuario")
                    .removeClass("d-none")
                    .addClass("d-block");
            },
        });
    });

    //Validacion del Formulario para el registro de una Receta
    $("#form_reg_receta").validate({
        rules: {
            form_reg_usuario_receta: { required: true },
            form_reg_desc_receta: { required: true },
        },
        messages: {
            form_reg_usuario_receta: {
                required: "El campo es requerido",
            },
            form_reg_desc_receta: {
                required: "El campo es requerido",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_receta").attr("action"),
                type: $("#form_reg_receta").attr("method"),
                data: $("#form_reg_receta").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_reg_receta")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_reg_receta")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_recetas").DataTable().ajax.reload();

                        $("#form_reg_receta")[0].reset();
                        $("#form_reg_receta .form-control").removeClass("is-valid");

                        $("#mod_form_reg_receta").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Receta registrado con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_reg_receta")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_reg_receta")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Confirmacion del Formulario para la eliminacion de una Receta
    $("#form_elim_receta").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $("#form_elim_receta").attr("method"),
            url: $("#form_elim_receta").attr("action"),
            data: $("#form_elim_receta").serialize(),
            dataType: "text",

            beforeSend: function () {
                $("#icon_load_form_elim_receta")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_submit_form_elim_receta")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_cancel_form_elim_receta")
                    .removeClass("d-block")
                    .addClass("d-none");
            },
            success: function (response) {
                if (response == "true") {
                    $("#table_recetas").DataTable().ajax.reload();

                    $("#mod_form_elim_receta").modal("hide");
                    $("#mod_success").modal("show");
                    $("#msg_mod_success").text("Receta eliminada con éxito");
                    function ShowSucess() {
                        $("#mod_success").modal("hide");
                    }
                    setTimeout(ShowSucess, 2000);
                }
            },
            error: function (response) {
                console.log(response);
                alert("Error con el servidor, por favor intentalo de nuevo mas tarde");
            },
            complete: function () {
                $("#icon_load_form_elim_receta")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_submit_form_elim_receta")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_cancel_form_elim_receta")
                    .removeClass("d-none")
                    .addClass("d-block");
            },
        });
    });

    //Validacion del Formulario la modificacion de una Receta
    $("#form_edit_receta").validate({
        rules: {
            form_edit_usuario_receta: { required: true },
            form_edit_desc_receta: { required: true },
        },
        messages: {
            form_edit_usuario_receta: {
                required: "El campo es requerido",
            },
            form_edit_desc_receta: {
                required: "El campo es requerido",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_edit_receta").attr("action"),
                type: $("#form_edit_receta").attr("method"),
                data: $("#form_edit_receta").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_edit_receta")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_edit_receta")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_recetas").DataTable().ajax.reload();

                        $("#form_edit_receta")[0].reset();
                        $("#form_edit_receta .form-control").removeClass("is-valid");

                        $("#mod_form_edit_receta").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Receta modificada con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_edit_receta")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_edit_receta")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Validacion del formulario de registro de citas
    $("#form_reg_cita").validate({
        rules: {
            form_reg_cita_usuario: {
                required: true,
            },
            form_reg_cita_fecha: {
                required: true,
                fechaActual: true,
            },
            form_reg_cita_desc: {
                required: true,
            },
        },
        messages: {
            form_reg_cita_usuario: {
                required: "El usuario es requerido",
            },
            form_reg_cita_fecha: {
                required: "La fecha es obligatoria",
                fechaActual: "La fecha no puede ser menor o igual a la fecha actual.",
            },
            form_reg_cita_desc: {
                required: "Describe brevemente el motivo de la cita",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_cita").attr("action"),
                type: $("#form_reg_cita").attr("method"),
                data: $("#form_reg_cita").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_reg_cita")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_reg_cita")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_citas").DataTable().ajax.reload();

                        $("#form_reg_cita")[0].reset();
                        $("#form_reg_cita .form-control").removeClass("is-valid");

                        $("#mod_form_reg_cita").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Cita registrada con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_reg_cita")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_reg_cita")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Validacion del formulario para la edicion de citas
    $("#form_edit_cita").validate({
        rules: {
            form_edit_cita_estado: {
                required: true,
            },
            form_edit_cita_fecha: {
                required: true,
                fechaActual: true,
            },
            form_edit_cita_desc: {
                required: true,
            },
        },
        messages: {
            form_edit_cita_estado: {
                required: "El estado es requerido",
            },
            form_edit_cita_fecha: {
                required: "La fecha es obligatoria",
                fechaActual: "La fecha no puede ser menor o igual a la fecha actual.",
            },
            form_edit_cita_desc: {
                required: "Describe brevemente el motivo de la cita",
            },
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_edit_cita").attr("action"),
                type: $("#form_edit_cita").attr("method"),
                data: $("#form_edit_cita").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $("#icon_load_form_edit_cita")
                        .removeClass("d-none")
                        .addClass("d-block");
                    $("#btn_submit_form_edit_cita")
                        .removeClass("d-block")
                        .addClass("d-none");
                },
                success: function (response) {
                    if (response == "true") {
                        $("#table_citas").DataTable().ajax.reload();

                        $("#form_edit_cita")[0].reset();
                        $("#form_edit_cita .form-control").removeClass("is-valid");

                        $("#mod_form_edit_cita").modal("hide");
                        $("#mod_success").modal("show");
                        $("#msg_mod_success").text("Cita actualizada con éxito");

                        function ShowSucess() {
                            $("#mod_success").modal("hide");
                        }
                        setTimeout(ShowSucess, 4000);
                    } else {
                        alert("Existe algun tipo de error en el servidor");
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert(
                        "Error con el servidor, por favor intentalo de nuevo mas tarde"
                    );
                },
                complete: function () {
                    $("#icon_load_form_edit_cita")
                        .removeClass("d-block")
                        .addClass("d-none");
                    $("#btn_submit_form_edit_cita")
                        .removeClass("d-none")
                        .addClass("d-block");
                },
            });
        },
    });

    //Confirmacion del Formulario para la eliminacion de una cita
    $("#form_elim_cita").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $("#form_elim_cita").attr("method"),
            url: $("#form_elim_cita").attr("action"),
            data: $("#form_elim_cita").serialize(),
            dataType: "text",

            beforeSend: function () {
                $("#icon_load_form_elim_cita")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_submit_form_elim_cita")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_cancel_form_elim_cita")
                    .removeClass("d-block")
                    .addClass("d-none");
            },
            success: function (response) {
                if (response == "true") {
                    $("#table_citas").DataTable().ajax.reload();

                    $("#mod_form_elim_cita").modal("hide");
                    $("#mod_success").modal("show");
                    $("#msg_mod_success").text("Cita eliminada con éxito");
                    function ShowSucess() {
                        $("#mod_success").modal("hide");
                    }
                    setTimeout(ShowSucess, 2000);
                } else {
                    alert("Existen problemas con el servidor");
                }
            },
            error: function (response) {
                console.log(response);
                alert("Error con el servidor, por favor intentalo de nuevo mas tarde");
            },
            complete: function () {
                $("#icon_load_form_elim_cita")
                    .removeClass("d-block")
                    .addClass("d-none");
                $("#btn_submit_form_elim_cita")
                    .removeClass("d-none")
                    .addClass("d-block");
                $("#btn_cancel_form_elim_cita")
                    .removeClass("d-none")
                    .addClass("d-block");
            },
        });
    });

    //################################## Seccion extendida para adicionar configuracion a la Tabla de Usuarios

    //Tabla de Usuarios
    var table_usuarios = $("#table_usuarios").DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo:
                "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
            sInfoPostFix: "",
            sSearch: "Buscar:",
            sUrl: "",
            sInfoThousands: ",",
            sLoadingRecords: "Cargando...",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior",
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending:
                    ": Activar para ordenar la columna de manera descendente",
            },
        },
        ajax: {
            method: "GET",
            url: "../../Data?Peticion=data_usuarios",
            dataSrc: "v_Usuarios",
        },
        select: "single",
        columns: [
            {
                className: "details-control",
                orderable: false,
                data: null,
                defaultContent: "",
                render: function () {
                    return '<i class="fa fa-plus-square" aria-hidden="true"></i>';
                },
                width: "15px",
            },
            { data: "identificacion" },
            { data: "username" },
            { data: "nombres" },
            { data: "apellidos" },
            { data: "correo" },
            {
                orderable: false,
                data: null,
                defaultContent: "",
                render: function () {
                    return (
                        '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button id="btn_elim_usuario" type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button id="btn_mod_usuario" type="button" class="btn btn-sm success-color" title="Modificar"><i class="fas fa-marker"></i></button>' +
                        "</div>"
                    );
                },
            },
        ],
        order: [[1, "asc"]],
        dom: "Bfrtip",
        buttons: [
            {
                extend: "excelHtml5",
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: "Excel",
                className: "btn-sm",
                action: function (e, dt, node, config) {
                    $("#table_usuarios").DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(
                        this,
                        e,
                        dt,
                        node,
                        config
                    );
                },
            },
        ],
    });
    //Script para ampliar la informacion de la Tabla de Usuarios
    $("#table_usuarios tbody").on("click", "td.details-control", function () {
        var tr = $(this).closest("tr");
        var tdi = tr.find("i.fa");
        var row = table_usuarios.row(tr);

        if (row.child.isShown()) {
            row.child.hide();
            tr.removeClass("shown");
            tdi.first().removeClass("fa-minus-square");
            tdi.first().addClass("fa-plus-square");
        } else {
            row.child(table_usuarios_format(row.data())).show();
            tr.addClass("shown");
            tdi.first().removeClass("fa-plus-square");
            tdi.first().addClass("fa-minus-square");
        }
    });
    table_usuarios.on("user-select", function (e, dt, type, cell, originalEvent) {
        if ($(cell.node()).hasClass("details-control")) {
            e.preventDefault();
        }
    });
    function table_usuarios_format(d) {
        return (
            '<table class="w-100">' +
            "<tr>" +
            "<td><b>Telefono:</b></td>" +
            "<td>" +
            d.telefono +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<tr>" +
            "<tr>" +
            "<td><b>Dirección:</b></td>" +
            "<td>" +
            d.direccion +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<tr>" +
            "<td><b>Estado:</b></td>" +
            "<td>" +
            d.estado +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<td><b>Perfil:</b></td>" +
            "<td>" +
            d.perfil +
            "</td>" +
            "</tr>" +
            "</table>"
        );
    }
    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Usuarios
    $(document).on("click", "#btn_elim_usuario", function () {
        var data = table_usuarios.row($(this).parents("tr")).data();

        $("#msg_form_elim_usuario").text(
            "¿Estas seguro de eliminar al usuario, con identificacion " +
                data.identificacion +
                "?"
        );
        $("#form_elim_idenfiticacion").val(data.identificacion);

        $("#mod_form_elim_usuario").modal("show");
    });
    $(document).on("click", "#btn_mod_usuario", function () {
        var data = table_usuarios.row($(this).parents("tr")).data();

        $("#form_edit_nombres_system").val(data.nombres);
        $("#form_edit_apellidos_system").val(data.apellidos);
        $("#form_edit_apellidos_system").val(data.apellidos);
        $("#form_edit_identificacion_system").val(data.identificacion);
        $("#form_edit_correo_system").val(data.correo);
        $("#form_edit_telefono_system").val(data.telefono);
        $("#form_edit_username_system").val(data.username);

        $("#mod_form_edit_usuario_system").modal("show");
    });

    //################################## Seccion extendida para adicionar configuracion a la Tabla de Recetas
    var table_recetas = $("#table_recetas").DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo:
                "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
            sInfoPostFix: "",
            sSearch: "Buscar:",
            sUrl: "",
            sInfoThousands: ",",
            sLoadingRecords: "Cargando...",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior",
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending:
                    ": Activar para ordenar la columna de manera descendente",
            },
        },
        ajax: {
            method: "GET",
            url: "../../Data?Peticion=data_recetas",
            dataSrc: "RECETAS",
        },
        select: "single",
        columns: [
            { data: "usuario" },
            { data: "descripcion" },
            {
                orderable: false,
                data: null,
                defaultContent: "",
                render: function () {
                    return (
                        '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button id="btn_elim_receta" type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button id="btn_mod_receta" type="button" class="btn btn-sm success-color" title="Modificar"><i class="fas fa-marker"></i></button>' +
                        "</div>"
                    );
                },
            },
        ],
        order: [[1, "asc"]],
        dom: "Bfrtip",
        buttons: [
            {
                extend: "excelHtml5",
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: "Excel",
                className: "btn-sm",
                action: function (e, dt, node, config) {
                    $("#table_recetas").DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(
                        this,
                        e,
                        dt,
                        node,
                        config
                    );
                },
            },
        ],
    });
    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Usuarios
    $(document).on("click", "#btn_elim_receta", function () {
        var data = table_recetas.row($(this).parents("tr")).data();

        $("#msg_form_elim_receta").text("¿Estas seguro de eliminar esta receta ?");
        $("#form_elim_id_receta").val(data.id);

        $("#mod_form_elim_receta").modal("show");
    });
    $(document).on("click", "#btn_mod_receta", function () {
        var data = table_recetas.row($(this).parents("tr")).data();

        $("#form_edit_id_receta").val(data.id);
        $("#form_edit_usuario_receta").val(data.usuario);
        $("#form_edit_desc_receta").val(data.descripcion);

        $("#mod_form_edit_receta").modal("show");
    });

    var table_citas = $("#table_citas").DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo:
                "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
            sInfoPostFix: "",
            sSearch: "Buscar:",
            sUrl: "",
            sInfoThousands: ",",
            sLoadingRecords: "Cargando...",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior",
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending:
                    ": Activar para ordenar la columna de manera descendente",
            },
        },
        ajax: {
            method: "GET",
            url: "../../Data?Peticion=data_citas",
            dataSrc: "CITAS",
        },
        select: "single",
        columns: [
            { data: "usuario" },
            {
                data: null,
                render: function (data, type, row) {
                    return row.nombres + " " + row.apellidos;
                },
            },
            { data: "fecha" },
            { data: "descripcion" },
            { data: "estado" },
            {
                orderable: false,
                data: null,
                defaultContent: "",
                render: function () {
                    return (
                        '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button id="btn_elim_cita" type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button id="btn_mod_cita" type="button" class="btn btn-sm success-color" title="Modificar"><i class="fas fa-marker"></i></button>' +
                        "</div>"
                    );
                },
            },
        ],
        order: [[1, "asc"]],
        dom: "Bfrtip",
        buttons: [
            {
                extend: "excelHtml5",
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: "Excel",
                className: "btn-sm",
                action: function (e, dt, node, config) {
                    $("#table_citas").DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(
                        this,
                        e,
                        dt,
                        node,
                        config
                    );
                },
            },
        ],
    });
    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Citas
    $(document).on("click", "#btn_elim_cita", function () {
        var data = table_citas.row($(this).parents("tr")).data();

        $("#msg_form_elim_cita").text("¿Estas seguro de eliminar esta cita ?");
        $("#form_elim_id_cita").val(data.id);

        $("#mod_form_elim_cita").modal("show");
    });
    $(document).on("click", "#btn_mod_cita", function () {
        var data = table_citas.row($(this).parents("tr")).data();
        var now = new Date(data.fecha);

        $("#form_edit_cita_estado").val(data.intEstado);
        $("#form_edit_cita_fecha").val(
            new Date(now.getTime() - now.getTimezoneOffset() * 60000)
                .toISOString()
                .substring(0, 19)
        );
        $("#form_edit_cita_desc").val(data.descripcion);
        $("#form_edit_cita_id").val(data.id);

        $("#mod_form_edit_cita").modal("show");
    });
});
