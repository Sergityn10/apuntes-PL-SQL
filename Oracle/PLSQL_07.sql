SET SERVEROUTPUT ON

DECLARE
	mensaje VARCHAR2(100);
  
/* ------------------------------------------------------------------------------------------ */ 

-- Procedimiento para consultar el sueldo de una tupla de Empleados
PROCEDURE FindEmp(pdni Empleados.dni%TYPE) IS

	v_sueldo Empleados.sueldo%TYPE;

BEGIN
	SELECT sueldo INTO v_sueldo FROM Empleados WHERE dni = pdni;
	DBMS_OUTPUT.PUT_LINE( 'FindEmp - sueldo: ' || v_sueldo );
	EXCEPTION
		WHEN No_Data_Found THEN DBMS_OUTPUT.PUT_LINE( 'FindEmp - EXCEPCION: dni no existe.' );
END;

/* ------------------------------------------------------------------------------------------ */ 

-- Permite generar una excepcion (lanzar una excepción)
PROCEDURE UpdatesueldoEmp (pdni Empleados.dni%TYPE, p_sueldo Empleados.sueldo%TYPE) IS
	Cont Number;
BEGIN
	SELECT Count(*) INTO Cont FROM Empleados WHERE dni = pdni;
	IF (Cont=0) THEN
		RAISE No_Data_Found; -- lanza la excepcion
	END IF;
	UPDATE Empleados SET sueldo = p_sueldo WHERE dni = pdni;
	Commit;
	DBMS_OUTPUT.PUT_LINE( 'UpdatesueldoEmp - Proceso OK' );
	EXCEPTION -- captura la excepción
		WHEN No_Data_Found THEN DBMS_OUTPUT.PUT_LINE( 'UpdatesueldoEmp - EXCEPCION: dni no existe.' );
END;

/* ------------------------------------------------------------------------------------------ */ 

-- Mismo procedimiento, pero con excepcion de usuario 
PROCEDURE UpdatesueldoEmp2 (pdni Empleados.dni%TYPE, p_sueldo Empleados.sueldo%TYPE) IS
	Cont Number;
	Excep1 EXCEPTION;
BEGIN
	SELECT Count(*) INTO Cont FROM Empleados WHERE dni = pdni;
	IF (Cont=0) THEN
		RAISE Excep1; -- lanza la excepcion
	END IF;
	UPDATE Empleados SET sueldo = p_sueldo WHERE dni = pdni;
	Commit;
	DBMS_OUTPUT.PUT_LINE( 'UpdatesueldoEmp2 - Proceso OK' );
	EXCEPTION -- captura la excepción
		WHEN Excep1 THEN DBMS_OUTPUT.PUT_LINE( 'UpdatesueldoEmp2 - EXCEPCION: dni no existe.' );
END;

/* ------------------------------------------------------------------------------------------ */ 

-- Mismo procedimiento, pero con mensaje de error
PROCEDURE UpdatesueldoEmp3 (pdni Empleados.dni%TYPE, p_sueldo Empleados.sueldo%TYPE) IS
	Cont Number;
BEGIN
	SELECT Count(*) INTO Cont FROM Empleados WHERE dni = pdni;
	IF (Cont=0) THEN
		RAISE_APPLICATION_ERROR( -20000, 'UpdatesueldoEmp3 - EXCEPCION: dni no existe.' );
	END IF;
	UPDATE Empleados SET sueldo = p_sueldo WHERE dni = pdni;
	Commit;
	DBMS_OUTPUT.PUT_LINE( 'UpdatesueldoEmp3 - Proceso OK' );
	-- ahora no se atiende la excepcion
END;

/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 

BEGIN
	DBMS_OUTPUT.ENABLE;

	FindEmp('123456789'); -- Ok
	FindEmp('MAL---MAL'); -- Excepcion

	UpdatesueldoEmp('123456789',4500); -- Ok
	UpdatesueldoEmp('MAL---MAL',4500); -- Excepcion

	UpdatesueldoEmp2('123456789',5000); -- Ok
	UpdatesueldoEmp2('MAL---MAL',5000); -- Excepcion

	UpdatesueldoEmp3('123456789',5500); -- Ok - se vuelve a actualizar con el valor original
	UpdatesueldoEmp3('MAL---MAL',5500); -- Excepcion

	mensaje := 'Fin de programa';
	DBMS_OUTPUT.PUT_LINE(mensaje);
	
	COMMIT;
END;