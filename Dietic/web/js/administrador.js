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

$(document).ready(function () {

    //################################## Esta Seccion establece la validacion de los diferentes Formularios del Sistema a travez de JQuery Validator

    //Validacion del Formulario para el registro de un usuario
    $('#form_reg_usuario').validate({
        rules: {
            form_reg_nombres: { required: true, minlength: 3, maxlength: 20, letras: true },
            form_reg_apellidos: { required: true, minlength: 5, maxlength: 20, letras: true },
            form_reg_identificacion: {
                required: true, minlength: 5, maxlength: 15,
                remote: {
                    url: "../../Register?Peticion=ValidarDocUsuario",
                    type: "GET",
                    data: {
                        form_reg_identificacion: function () {
                            return $("#form_reg_identificacion").val()
                        }
                    }
                }
            },
            form_reg_correo: {
                required: true, email: true,
                remote: {
                    url: "../../Register?Peticion=ValidarEmailUsuario",
                    type: "GET",
                    data: {
                        form_reg_correo: function () {
                            return $("#form_reg_correo").val();
                        }
                    }
                }
            },
            form_reg_username: {
                required: true, minlength: 4, maxlength: 10,
                remote: {
                    url: "../../Register?Peticion=ValidarNickUsuario",
                    type: "GET",
                    data: {
                        form_reg_username: function () {
                            return $("#form_reg_username").val();
                        }
                    }
                }
            },
            form_reg_pwd: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true, digito: true },
            form_reg_pwd_2: { required: true, equalTo: '#form_reg_pwd' }
        },
        messages: {
            form_reg_nombres: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_reg_apellidos: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_reg_identificacion: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 15 caracteres',
                remote: 'Este documento ya se encuentra en uso'
            },
            form_reg_correo: {
                required: 'El campo es requerido',
                email: 'El correo electronico introducido es incorrecto',
                remote: 'Este correo ya se encuentra en uso'
            },
            form_reg_username: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 4 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 10 caracteres',
                remote: 'Este usuario ya se encuentra en uso por favor usa uno diferente'
            },
            form_reg_pwd: {
                required: 'La contraseña es obligatoria',
                minlength: 'La contraseña debe ser de almenos 8 digitos',
                maxlength: 'La contraseña no puede sobrepasar los 20 digitos',
                especial: 'La contraseña debe contener almenos un caracter especial',
                minuscula: 'La contraseña debe contener una letra minuscula',
                mayuscula: 'La contraseña debe contener una letra mayuscula'
            },
            form_reg_pwd_2: {
                required: 'Es obligatorio que confirmes tu contraseña',
                equalTo: 'Las contraseñas no coinciden'
            }
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_reg_usuario").attr('action'),
                type: $("#form_reg_usuario").attr('method'),
                data: $("#form_reg_usuario").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_form_reg_usuario').removeClass('d-none').addClass('d-block');
                    $('#btn_submit_form_reg_usuario').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {

                        $("#form_reg_usuario")[0].reset();
                        $("#form_reg_usuario .form-control").removeClass('is-valid');
                        $('#table_usuarios').DataTable().ajax.reload();


                        $('#mod_form_reg_usuario').modal('hide');
                        $('#mod_success').modal('show');
                        $('#msg_mod_success').text('Usuario registrado con éxito');

                        function ShowSucess() {
                            $('#mod_success').modal('hide');
                        } setTimeout(ShowSucess, 4000);

                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_form_reg_usuario').removeClass('d-block').addClass('d-none');
                    $('#btn_submit_form_reg_usuario').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });

    //Validacion del Formulario para la modificacion de un usuario
    $('#form_edit_usuario_system').validate({
        rules: {
            form_edit_perfil_system: { required: true },
            form_edit_sexo_system: { required: true },
            form_edit_nombres_system: { required: true, minlength: 3, maxlength: 20, letras: true },
            form_edit_apellidos_system: { required: true, minlength: 5, maxlength: 20, letras: true },
            form_edit_identificacion_system: {
                required: true, minlength: 5, maxlength: 15,
                remote: {
                    url: "../../Register?Peticion=ValidarDocUsuario",
                    type: "GET",
                    data: {
                        form_edit_identificacion_system: function () {
                            return $("#form_edit_identificacion_system").val()
                        }
                    }
                }
            },
            form_edit_correo_system: {
                required: true, email: true,
                remote: {
                    url: "../../Register?Peticion=ValidarEmailUsuario",
                    type: "GET",
                    data: {
                        form_edit_correo_system: function () {
                            return $("#form_edit_correo_system").val();
                        }
                    }
                }
            },
            form_edit_username_system: {
                required: true, minlength: 4, maxlength: 10,
                remote: {
                    url: "../../Register?Peticion=ValidarNickUsuario",
                    type: "GET",
                    data: {
                        form_edit_username_system: function () {
                            return $("#form_edit_username_system").val();
                        }
                    }
                }
            },
            form_edit_pwd_system: { required: true, minlength: 8, maxlength: 20, especial: true, minuscula: true, mayuscula: true, digito: true },
            form_edit_pwd_2_system: { required: true, equalTo: '#form_edit_pwd_system' }
        },
        messages: {
            form_edit_perfil_system: {
                required: 'El campo es requerido'
            },
            form_edit_sexo_system: {
                required: 'El campo es requerido'
            },
            form_edit_nombres_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_edit_apellidos_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 3 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 20 caracteres',
                letras: 'El campo no puede contener caracteres especiales ni números'
            },
            form_edit_identificacion_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 5 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 15 caracteres',
                remote: 'Este documento ya se encuentra en uso'
            },
            form_edit_correo_system: {
                required: 'El campo es requerido',
                email: 'El correo electronico introducido es incorrecto',
                remote: 'Este correo ya se encuentra en uso'
            },
            form_edit_username_system: {
                required: 'El campo es requerido',
                minlength: 'El campo debe contener un minimo de 4 caracteres',
                maxlength: 'El campo solo puede contener un maximo de 10 caracteres',
                remote: 'Este usuario ya se encuentra en uso por favor usa uno diferente'
            },
            form_edit_pwd_system: {
                required: 'La contraseña es obligatoria',
                minlength: 'La contraseña debe ser de almenos 8 digitos',
                maxlength: 'La contraseña no puede sobrepasar los 20 digitos',
                especial: 'La contraseña debe contener almenos un caracter especial',
                minuscula: 'La contraseña debe contener una letra minuscula',
                mayuscula: 'La contraseña debe contener una letra mayuscula'
            },
            form_edit_pwd_2_system: {
                required: 'Es obligatorio que confirmes tu contraseña',
                equalTo: 'Las contraseñas no coinciden'
            }
        },

        submitHandler: function () {
            $.ajax({
                url: $("#form_edit_usuario_system").attr('action'),
                type: $("#form_edit_usuario_system").attr('method'),
                data: $("#form_edit_usuario_system").serialize(),
                dataType: "text",

                beforeSend: function () {
                    $('#icon_load_form_edit_usuario_system').removeClass('d-none').addClass('d-block');
                    $('#btn_submit_form_edit_usuario_system').removeClass('d-block').addClass('d-none');
                },
                success: function (response) {
                    if (response == 'true') {

                        $("#form_edit_usuario_system")[0].reset();
                        $("#form_edit_usuario_system .form-control").removeClass('is-valid');
                        $('#table_usuarios').DataTable().ajax.reload();


                        $('#mod_form_edit_usuario_system').modal('hide');
                        $('#mod_success').modal('show');
                        $('#msg_mod_success').text('Usuario modificado con éxito');

                        function ShowSucess() {
                            $('#mod_success').modal('hide');
                        } setTimeout(ShowSucess, 4000);

                    }
                },
                error: function (response) {
                    console.log(response);
                    alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
                },
                complete: function () {
                    $('#icon_load_form_edit_usuario_system').removeClass('d-block').addClass('d-none');
                    $('#btn_submit_form_edit_usuario_system').removeClass('d-none').addClass('d-block');
                }
            });
        }
    });

    //Confirmacion del Formulario para la eliminacion de un Usuario
    $("#mod_form_elim_usuario").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $('#form_elim_usuario').attr('method'),
            url: $('#form_elim_usuario').attr('action'),
            data: $('#form_elim_usuario').serialize(),
            dataType: "text",

            beforeSend: function () {
                $('#icon_load_form_elim_usuario').removeClass('d-none').addClass('d-block');
                $('#btn_submit_form_elim_usuario').removeClass('d-block').addClass('d-none');
                $('#btn_cancel_form_elim_usuario').removeClass('d-block').addClass('d-none');
            },
            success: function (response) {
                if (response == 'true') {
                    $('#table_usuarios').DataTable().ajax.reload();

                    $('#mod_form_elim_usuario').modal('hide');
                    $('#mod_success').modal('show');
                    $('#msg_mod_success').text('Usuario eliminado con éxito');
                    function ShowSucess() {
                        $('#mod_success').modal('hide');
                    } setTimeout(ShowSucess, 2000);
                }
            },
            error: function (response) {
                console.log(response);
                alert('Error con el servidor, por favor intentalo de nuevo mas tarde');
            },
            complete: function () {
                $('#icon_load_form_elim_usuario').removeClass('d-block').addClass('d-none');
                $('#btn_submit_form_elim_usuario').removeClass('d-none').addClass('d-block');
                $('#btn_cancel_form_elim_usuario').removeClass('d-none').addClass('d-block');
            }
        });
    });


    //################################## Seccion extendida para adicionar configuracion a la Tabla de Usuarios

    //Tabla de Usuarios 
    var table_usuarios = $('#table_usuarios').DataTable({
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
            url: "../../Data?Peticion=data_usuarios",
            dataSrc: "v_Usuarios"
        },
        select: "single",
        columns: [
            {
                className: 'details-control',
                orderable: false,
                data: null,
                defaultContent: '',
                render: function () {
                    return '<i class="fa fa-plus-square" aria-hidden="true"></i>';
                },
                width: '15px'
            },
            { data: "identificacion" },
            { data: "username" },
            { data: "nombres" },
            { data: "apellidos" },
            { data: "correo" },
            {
                orderable: false,
                data: null,
                defaultContent: '',
                render: function () {
                    return '<div class="btn-group btn-group-sm" role="group" aria-label="Botones de Accion"> ' +
                        '<button id="btn_elim_usuario" type="button" class="btn btn-sm danger-color" title="Eliminar"><i class="fas fa-trash"></i></button>' +
                        '<button id="btn_mod_usuario" type="button" class="btn btn-sm success-color" title="Modificar"><i class="fas fa-marker"></i></button>' +
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
                    $('#table_usuarios').DataTable().ajax.reload();

                    $.fn.DataTable.ext.buttons.excelHtml5.action.call(this, e, dt, node, config);
                }
            }
        ]
    });
    //Script para ampliar la informacion de la Tabla de Usuarios
    $('#table_usuarios tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var tdi = tr.find('i.fa');
        var row = table_usuarios.row(tr);

        if (row.child.isShown()) {

            row.child.hide();
            tr.removeClass('shown');
            tdi.first().removeClass('fa-minus-square');
            tdi.first().addClass('fa-plus-square');

        } else {

            row.child(table_usuarios_format(row.data())).show();
            tr.addClass('shown');
            tdi.first().removeClass('fa-plus-square');
            tdi.first().addClass('fa-minus-square');
        }
    });
    table_usuarios.on('user-select', function (e, dt, type, cell, originalEvent) {
        if ($(cell.node()).hasClass('details-control')) {
            e.preventDefault();
        }
    });
    function table_usuarios_format(d) {

        return '<table class="w-100">' +
            '<tr>' +
            '<td><b>Telefono:</b></td>' +
            '<td>' + d.telefono + '</td>' +
            '</tr>' +
            '<tr>' +
            '<tr>' +
            '<tr>' +
            '<td><b>Dirección:</b></td>' +
            '<td>' + d.direccion + '</td>' +
            '</tr>' +
            '<tr>' +
            '<tr>' +
            '<td><b>Estado:</b></td>' +
            '<td>' + d.estado + '</td>' +
            '</tr>' +
            '<tr>' +
            '<td><b>Perfil:</b></td>' +
            '<td>' + d.perfil + '</td>' +
            '</tr>' +
            '</table>';
    }

    //Script para ejecutar la eliminacion y modificacion de los registros en la Tabla Usuarios
    $(document).on('click', "#btn_elim_usuario", function () {
        var data = table_usuarios.row($(this).parents('tr')).data();

        $('#msg_form_elim_usuario').text('¿Estas seguro de eliminar al usuario, con identificacion ' + data.identificacion + '?');
        $('#form_elim_idenfiticacion').val(data.identificacion);

        $('#mod_form_elim_usuario').modal('show');
    });

    $(document).on('click', "#btn_mod_usuario", function () {
        var data = table_usuarios.row($(this).parents('tr')).data();

        $('#form_edit_nombres_system').val(data.nombres);
        $('#form_edit_apellidos_system').val(data.apellidos);
        $('#form_edit_apellidos_system').val(data.apellidos);
        $('#form_edit_identificacion_system').val(data.identificacion);
        $('#form_edit_correo_system').val(data.correo);
        $('#form_edit_telefono_system').val(data.telefono);
        $('#form_edit_username_system').val(data.username);


        $('#mod_form_edit_usuario_system').modal('show');
    });






});