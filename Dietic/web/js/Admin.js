//################################## Configuraciones de JQuery Validator
jQuery.validator.setDefaults({
    errorElement: 'p',
    errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.md-form').append(error);
        element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass, error) {
        $(element).addClass('invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('invalid');
    }
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

    //Validacion del Formulario para el registro de un usuario
    $('#Form_Registro_Usuario').validate({
        rules: {
            NOMBRE_USER: { required: true, minlength: 3, maxlength: 20, letras: true },
            APELLIDOS_USER: { required: true, minlength: 5, maxlength: 20, letras: true },
            DOC_USER: {
                required: true, minlength: 5, maxlength: 15,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarDocUsuario",
                    type: "GET",
                    data: {
                        DOC_USER: function () {
                            return $("#DOC_USER").val()
                        }
                    }
                }
            },
            CORREO_USER: {
                required: true, email: true,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarEmailUsuario",
                    type: "GET",
                    data: {
                        CORREO_USER: function () {
                            return $("#CORREO_USER").val();
                        }
                    }
                }
            },
            R_NICK_USER: {
                required: true, minlength: 4, maxlength: 10,
                remote: {
                    url: "../../Ingreso?Peticion=ValidarNickUsuario",
                    type: "GET",
                    data: {
                        R_NICK_USER: function () {
                            return $("#R_NICK_USER").val();
                        }
                    }
                }
            },
            R_PASSWORD_USER: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true, digito: true },
            pwd: { required: true, equalTo: '#R_PASSWORD_USER' }
        },
        messages: {
            NOMBRE_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            APELLIDOS_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            DOC_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 15 caracteres',
                remote: 'Este documento ya se encuentra en uso'
            },
            CORREO_USER: {
                required: 'El campo es requerido',
                email: 'El correo electronico introducido es incorrecto',
                remote: 'Este correo ya se encuentra en uso'
            },
            R_NICK_USER: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 4 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 10 caracteres',
                remote: 'Este nick ya se encuentra en uso por favor usa uno diferente'
            },
            R_PASSWORD_USER: {
                required: 'La contraseña es obligatoria',
                minlength: 'La contraseña debe ser de almenos 8 digitos',
                maxlength: 'La contraseña no puede sobrepasar los 20 digitos',
                especial: 'La contraseña debe contener almenos un caracter especial',
                minuscula: 'La contraseña debe contener una letra minuscula',
                mayuscula: 'La contraseña debe contener una letra mayuscula'
            },
            pwd: {
                required: 'Es obligatorio que confirmes tu contraseña',
                equalTo: 'Las contraseñas no coinciden'
            }
        },

        submitHandler: function () {
            $.ajax({
                url: $("#Form_Registro_Usuario").attr('action'),
                type: $("#Form_Registro_Usuario").attr('method'),
                data: $("#Form_Registro_Usuario").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_usuario').removeClass('d-none').addClass('d-block');
                    $('#btn_registro_usuario').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {
                        $('#Table_Usuarios').DataTable().ajax.reload();
                        $('#msg_SucessRegistro_usuario').slideDown('slow').removeClass('d-none');
                        function ShowSucess() {
                            $('#msg_SucessRegistro_usuario').slideUp('slow');
                        } setTimeout(ShowSucess, 4000);
                        $("#Form_Registro_Usuario")[0].reset();

                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_usuario').removeClass('d-block').addClass('d-none');
                    $('#btn_registro_usuario').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });

    //Confirmacion del Formulario para la eliminacion de una Usuario
    $("#Form_Eliminar_Usuario").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $('#Form_Eliminar_Usuario').attr('method'),
            url: $('#Form_Eliminar_Usuario').attr('action'),
            data: $('#Form_Eliminar_Usuario').serialize(),
            dataType: "text",

            beforeSend: function () {
                $('#icon_loadEliminar_Usuario').removeClass('d-none').addClass('d-block');
                $('#btn_eliminar_Usuario').removeClass('d-block').addClass('d-none');
                $('#btn_cancelarEliminar_Usuario').removeClass('d-block').addClass('d-none');
            },
            success: function (response) {
                if (response == 'true') {
                    $('#Mod_Elim_Usuario').modal('hide');
                    $('#Table_Usuarios').DataTable().ajax.reload();
                    $('#Mod_Sucess').modal('show');
                    $('#Text_Sucess').text('Usuario eliminado con éxito');
                    function ShowSucess() {
                        $('#Mod_Sucess').modal('hide');
                    } setTimeout(ShowSucess, 2000);
                }
            },
            error: function (response) {
                console.log(response);
                alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
            },
            complete: function () {
                $('#icon_loadEliminar_Usuario').removeClass('d-block').addClass('d-none');
                $('#btn_eliminar_Usuario').removeClass('d-none').addClass('d-block');
                $('#btn_cancelarEliminar_Usuario').removeClass('d-none').addClass('d-block');
            }
        });
    });


    //################################## Seccion extendida para adicionar configuracion a la Tabla de Usuarios

    //Tabla de Usuarios
    var Table_Usuarios = $('#Table_Usuarios').DataTable({
        language: {
            sProcessing: "Procesando...",
            sLengthMenu: "Mostrar _MENU_  Registros",
            sZeroRecords: "No se encontraron resultados",
            sEmptyTable: "Ningún dato disponible en esta tabla",
            sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
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
                sPrevious: "Anterior"
            },
            oAria: {
                sSortAscending: ": Activar para ordenar la columna de manera ascendente",
                sSortDescending: ": Activar para ordenar la columna de manera descendente"
            }
        },
        ajax: {
            method: "GET",
            url: "../../Datos?Peticion=data_Usuarios",
            dataSrc: "Usuarios"
        },
        select: "single",
        columns: [
            { data: "DOC_USER" },
            { data: "NICK_USER" },
            { data: "NOMBRE_USER" },
            { data: "APELLIDOS_USER" },
            { data: "CORREO_USER" },
            {
                orderable: false,
                data: null,
                defaultContent: '',
                render: function () {
                    return '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button id="btn_elim_usuario" type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button id="btn_mod_usuario"  type="button" class="btn btn-sm success-color" title="Modificar" disabled><i class="fas fa-marker"></i></button>' +
                        '</div>';
                }
            }
        ],
        order: [[1, 'asc']],
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fa fa-file-excel"></i><span> Generar Informe</span>',
                titleAttr: 'Excel',
                className: 'btn-sm',
                action: function (e, dt, node, config) {
                    $('#Table_Usuarios').DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(this, e, dt, node, config);
                }
            }
        ]
    });
    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Materia
    $(document).on('click', '#btn_elim_usuario', function () {
        var data = Table_Usuarios.row($(this).parents('tr')).data();
        $('#Mod_Elim_Usuario').modal('show');
        $('#Usuario_Eliminar').text('¿Estas seguro de eliminar al usuario ' + data.NOMBRE_USER + ' ' + data.APELLIDOS_USER + '?');
        $('#DEL_DOC_USER').val(data.DOC_USER);
    });
    //Fin del Script

});