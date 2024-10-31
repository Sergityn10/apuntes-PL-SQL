SET SERVEROUTPUT ON
DECLARE
	v NUMBER := 2;
BEGIN
	DBMS_OUTPUT.ENABLE;
	v:=v*2;
	DECLARE
		z NUMBER := 3;
	BEGIN
		z:=v*3;
		DBMS_OUTPUT.PUT_LINE(v); --escribe 4
		DBMS_OUTPUT.PUT_LINE(z); --escribe 12
	END;
	DBMS_OUTPUT.PUT_LINE(v*2); --escribe 8
	--DBMS_OUTPUT.PUT_LINE(z); --error, ya no es accesible
END;
