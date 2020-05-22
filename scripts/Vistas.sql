CREATE OR REPLACE VIEW v_Usuarios AS
SELECT USUARIOS.identificacion,
       USUARIOS.username,
       USUARIOS.nombres,
       USUARIOS.apellidos,
       USUARIOS.correo,
       USUARIOS.telefono,
       USUARIOS.direccion,
       USUARIOS.fecha_nacimiento,
       USUARIOS.talla,
       USUARIOS.peso,
       PERFILES.nombre as perfil,
       ESTADOS_USUARIOS.nombre as estado,
       SEXOS.nombre as sexo
FROM USUARIOS 
INNER JOIN PERFILES ON USUARIOS.perfil = PERFILES.id
INNER JOIN ESTADOS_USUARIOS ON USUARIOS.estado = ESTADOS_USUARIOS.id 
INNER JOIN SEXOS ON USUARIOS.sexo = SEXOS.id
/



CREATE OR REPLACE VIEW v_CitasUsuarios
as
SELECT citas.id, identificacion, nombres, apellidos, citas.fecha, citas.descripcion, estados_citas.nombre 
FROM usuarios 
INNER JOIN citas on citas.usuario = usuarios.identificacion 
inner join estados_citas on estados_citas.id = citas.estado;
/