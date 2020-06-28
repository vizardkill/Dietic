//################################## Configuraciones de JQuery Validator
jQuery.validator.setDefaults({
    errorElement: 'p',
    errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass('is-invalid').removeClass('is-valid');
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('is-invalid').addClass('is-valid');
    },
    /*success: function(label) {
        label
          .text('OK!').addClass('valid-feedback').removeClass('invalid-feedback')
          .closest('.form-group')
    }*/
});

//################################## Metodos Adicionales para JQuery Validator
$.validator.addMethod("especial", function (value) {
    return /[\@\#\$\%\^\&\*\(\)\_\+\!]/.test(value)
});
$.validator.addMethod("minuscula", function (value) {
    return /[a-z]/.test(value)
});
$.validator.addMethod("mayuscula", function (value) {
    return /[A-Z]/.test(value)
});
$.validator.addMethod("digito", function (value) {
    return /[0-9]/.test(value)
});
$.validator.addMethod("letras", function (value) {
    return /^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$/.test(value)
});

//################################## Metodos Adicionales para JQuery Validator
$.validator.addMethod("especial", function (value) {
    return /[\@\#\$\%\^\&\*\(\)\_\+\!]/.test(value)
});
$.validator.addMethod("minuscula", function (value) {
    return /[a-z]/.test(value)
});
$.validator.addMethod("mayuscula", function (value) {
    return /[A-Z]/.test(value)
});
$.validator.addMethod("digito", function (value) {
    return /[0-9]/.test(value)
});
$.validator.addMethod("letras", function (value) {
    return /^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$/.test(value)
});

$(document).ready(function () {
    //################################## Iniciar mensajes Tooltip de Bootstrap 
    $('[data-toggle="tooltip"]').tooltip();

    //################################## Esta Seccion establece la validacion de los diferentes Formularios del Sistema a travez de JQuery Validator

    /** Se configura el Ajax para que permita redirigir las solicitudes a travez del servlet */
    $('#form_login_usuario').validate({

        rules: {
            form_login_username: { required: true },
            form_login_pwd: { required: true }
        },
        messages: {
            form_login_username: {
                required: 'Por favor ingresa tu usuario'
            },
            form_login_pwd: {
                required: 'Por favor suministra tu contraseña'
            }
        },

        submitHandler: function () {

            $.ajax({
                type: $("#form_login_usuario").attr('method'),
                url: $("#form_login_usuario").attr('action'),
                data: $("#form_login_usuario").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_form_login_usuario').removeClass('d-none').addClass('d-block');
                    $('#btn_submit_form_login_usuario').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'false') {
                        $('#msg_error_form_login_usuario').slideDown('slow').removeClass('d-none');
                        function error() {
                            $('#msg_error_form_login_usuario').slideUp('slow');
                        } setTimeout(error, 4000);
                    } else {
                        window.location.href = "redirect.jsp";
                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_form_login_usuario').removeClass('d-block').addClass('d-none');
                    $('#btn_submit_form_login_usuario').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });

    //Validacion del Formulario para el registro de un usuario
    $('#form_reg_usuario_system').validate({
        rules: {
            form_reg_sexo_system: { required: true },
            form_reg_nombres_system: { required: true, minlength: 3, maxlength: 20, letras: true },
            form_reg_apellidos_system: { required: true, minlength: 5, maxlength: 20, letras: true },
            form_reg_identificacion_system: {
                required: true, minlength: 5, maxlength: 15,
                remote: {
                    url: "../Register?Peticion=ValidarDocUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_identificacion_system: function () {
                            return $("#form_reg_identificacion_system").val()
                        }
                    }
                }
            },
            form_reg_correo_system: {
                required: true, email: true,
                remote: {
                    url: "../Register?Peticion=ValidarEmailUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_correo_system: function () {
                            return $("#form_reg_correo_system").val();
                        }
                    }
                }
            },
            form_reg_username_system: {
                required: true, minlength: 4, maxlength: 10,
                remote: {
                    url: "../Register?Peticion=ValidarNickUsuario&Tipo=system",
                    type: "GET",
                    data: {
                        form_reg_username_system: function () {
                            return $("#form_reg_username_system").val();
                        }
                    }
                }
            },
            form_reg_pwd_system: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true, digito: true },
            form_reg_pwd_2_system: { required: true, equalTo: '#form_reg_pwd_system' }
        },
        messages: {
            form_reg_sexo_system: {
                required: 'El campo es requerido',
            },
            form_reg_nombres_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_reg_apellidos_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_reg_identificacion_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 15 caracteres',
                remote: 'Este documento ya se encuentra en uso'
            },
            form_reg_correo_system: {
                required: 'El campo es requerido',
                email: 'El correo electronico introducido es incorrecto',
                remote: 'Este correo ya se encuentra en uso'
            },
            form_reg_username_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 4 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 10 caracteres',
                remote: 'Este usuario ya se encuentra en uso por favor usa uno diferente'
            },
            form_reg_pwd_system: {
                required: 'La contraseña es obligatoria',
                minlength: 'La contraseña debe ser de almenos 8 digitos',
                maxlength: 'La contraseña no puede sobrepasar los 20 digitos',
                especial: 'La contraseña debe contener almenos un caracter especial',
                minuscula: 'La contraseña debe contener una letra minuscula',
                mayuscula: 'La contraseña debe contener una letra mayuscula'
            },
            form_reg_pwd_2_system: {
                required: 'Es obligatorio que confirmes tu contraseña',
                equalTo: 'Las contraseñas no coinciden'
            }
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_usuario_system").attr('action'),
                type: $("#form_reg_usuario_system").attr('method'),
                data: $("#form_reg_usuario_system").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_form_reg_usuario_system').removeClass('d-none').addClass('d-block');
                    $('#btn_submit_form_reg_usuario_system').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {

                        $("#form_reg_usuario_system")[0].reset();
                        $("#form_reg_usuario_system .form-control").removeClass('is-valid');


                        $('#mod_form_reg_usuario_system').modal('hide');
                        $('#mod_success').modal('show');
                        $('#msg_mod_success').text('Usuario registrado con éxito');

                        function ShowSucess() {
                            $('#mod_success').modal('hide');
                        } setTimeout(ShowSucess, 4000);

                    } else {
                        alert("Existen problemas con el servidor");
                    }
                },
                error: function (response) {
                    console.error(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_form_reg_usuario_system').removeClass('d-block').addClass('d-none');
                    $('#btn_submit_form_reg_usuario_system').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });
});