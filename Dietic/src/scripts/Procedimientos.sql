delimiter //
CREATE PROCEDURE LoginUsuario
(
    IN L_nick VARCHAR(20),
    IN L_pass VARCHAR(200),
	OUT L_aux INTEGER,
    OUT L_doc VARCHAR(15),
    OUT L_nombre  VARCHAR(40),
    OUT L_apellidos VARCHAR(40),
    OUT L_correo  VARCHAR(30),
    OUT L_celular VARCHAR(15),
    OUT L_PerfilUsuario  INTEGER,
    OUT L_Estado INTEGER
) 
BEGIN
        SELECT 
              count(*) as Contador, 
              DOC_USER,
              NOMBRE_USER, 
              APELLIDOS_USER, 
              CORREO_USER,
              CELULAR_USER, 
              ID_PERFIL_USER, 
              ESTADO_USER
        INTO 
        L_aux, 
        L_doc, 
        L_nombre, 
        L_apellidos, 
        L_correo, 
        L_celular, 
        L_PerfilUsuario, 
        L_Estado
        FROM USUARIO
        WHERE NICK_USER = L_nick AND PASSWORD_USER = L_pass
        GROUP BY 
              DOC_USER,
              NOMBRE_USER, 
              APELLIDOS_USER, 
              CELULAR_USER, 
              CORREO_USER, 
              ID_PERFIL_USER, 
              ESTADO_USER
        ORDER BY DOC_USER;
        
        IF L_aux IS NULL THEN
           SET L_aux := 0;
		END IF;
END;//

delimiter //
CREATE PROCEDURE Validaciones_Usuario(
    IN V_tipo VARCHAR(50),
    IN V_variable VARCHAR(50),
    OUT V_aux INTEGER
)
BEGIN

  IF (v_tipo = 'ValidarNickUsuario') THEN 
      SELECT COUNT(*) INTO V_aux FROM USUARIO WHERE NICK_USER = V_variable;
  END  IF;

  IF (v_tipo = 'ValidarEmailUsuario') THEN 
      SELECT COUNT(*) INTO V_aux FROM USUARIO WHERE CORREO_USER = V_variable;
  END  IF;

  IF (v_tipo = 'ValidarDocUsuario') THEN 
      SELECT COUNT(*) INTO V_aux FROM USUARIO WHERE DOC_USER = V_variable;
  END  IF;
  
  IF V_aux IS NULL THEN
     SET V_aux := 0;
  END IF;
END;//