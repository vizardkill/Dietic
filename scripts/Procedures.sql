
--PROCEDIMIENTOS
--Procedimiento almacenado, para la validacion de usuario y contraseña, que permite retornar los datos del usuario--
CREATE OR REPLACE PROCEDURE LOGIN_USUARIO 
(
    L_nick usuarios.username%TYPE,
    L_pwd  usuarios.pwd%TYPE,

    L_perfil OUT usuarios.perfil%TYPE,
    L_doc OUT usuarios.identificacion%TYPE,

    L_aux OUT INTEGER
) AS

BEGIN 
    
    SELECT CASE 
           WHEN EXISTS( 
               SELECT * FROM usuarios WHERE username = L_nick AND pwd = L_pwd
           )
           THEN 1
           ELSE 0
           END INTO L_aux
    FROM DUAL;

    IF(L_aux = 1) THEN
       SELECT  
                    perfil,
                    identificacion
                    
                    INTO L_perfil, L_doc

                    FROM usuarios
                    WHERE username = L_nick AND pwd = L_pwd;

    END IF;

    EXCEPTION WHEN NO_DATA_FOUND THEN
    L_aux := 0;
    
END;
/
 
--/Funcion para verificar si se encuentra en uso (Nick, Email, Documento) en la tabla usuario
CREATE OR REPLACE FUNCTION Validaciones_Usuario(V_tipo VARCHAR2,V_variable VARCHAR2) RETURN NUMBER
IS V_aux NUMBER(1,0);
BEGIN

  IF (v_tipo = 'ValidarNickUsuario') THEN 
      SELECT COUNT(username) INTO V_aux FROM USUARIOS WHERE username = V_variable;
      RETURN V_aux;
  END  IF;

  IF (v_tipo = 'ValidarEmailUsuario') THEN 
      SELECT COUNT(correo) INTO V_aux FROM USUARIOS WHERE correo = V_variable;
      RETURN V_aux;
  END  IF;

  IF (v_tipo = 'ValidarDocUsuario') THEN 
      SELECT COUNT(identificacion) INTO V_aux FROM USUARIOS WHERE identificacion = V_variable;
      RETURN V_aux;
  END  IF;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
  V_aux := 0;
  RETURN V_aux;  
END;
/

CREATE OR REPLACE FUNCTION Validaciones_UsuarioEdit(V_tipo VARCHAR2,V_variable VARCHAR2, V_doc VARCHAR2) RETURN NUMBER
IS V_aux NUMBER(1,0);
BEGIN

  IF (v_tipo = 'ValidarNickUsuario') THEN 
      SELECT COUNT(username) INTO V_aux FROM USUARIOS WHERE username = V_variable and identificacion <> V_doc;
      RETURN V_aux;
  END  IF;

  IF (v_tipo = 'ValidarEmailUsuario') THEN 
      SELECT COUNT(correo) INTO V_aux FROM USUARIOS WHERE correo = V_variable and identificacion <> V_doc;
      RETURN V_aux;
  END  IF;

  IF (v_tipo = 'ValidarDocUsuario') THEN 
      SELECT COUNT(identificacion) INTO V_aux FROM USUARIOS WHERE identificacion = V_variable and identificacion <> V_doc;
      RETURN V_aux;
  END  IF;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN
  V_aux := 0;
  RETURN V_aux;  
END;
/


CREATE OR REPLACE FUNCTION Validaciones_Citas (V_fecha VARCHAR2,  V_Usuario VARCHAR2) RETURN NUMBER
IS V_aux NUMBER(1,0);
BEGIN
    SELECT COUNT(Id) into V_aux FROM CITAS WHERE fecha = V_fecha;
    RETURN V_aux;  

   EXCEPTION WHEN NO_DATA_FOUND THEN
   V_aux := 0;
   RETURN V_aux;  
END;
/

