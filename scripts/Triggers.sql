CREATE OR REPLACE TRIGGER TG_RECETAS
BEFORE INSERT ON RECETAS
FOR EACH ROW
BEGIN	
	DECLARE 
		AUX INTEGER:= 0;
		BEGIN
			SELECT SQ_ID_RECETAS.NEXTVAL INTO AUX FROM DUAL;
			:new.id := AUX;
		END;
END;
/

CREATE OR REPLACE TRIGGER TG_CITAS
BEFORE INSERT ON CITAS
FOR EACH ROW
BEGIN	
	DECLARE 
		AUX INTEGER:= 0;
		BEGIN
			SELECT SQ_ID_CITAS.NEXTVAL INTO AUX FROM DUAL;
			:new.id := AUX;
		END;
END;
/