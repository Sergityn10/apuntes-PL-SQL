SET SERVEROUTPUT ON

DECLARE
    mensaje VARCHAR2(100);
	x1 NUMBER;
	x2 NUMBER;
	x3 NUMBER;
	
/* ----------------------------------------------------------------------------------------------- */ 
-- Ejemplo: Funcion para sumar dos numeros
FUNCTION suma_A (n1 NUMBER, n2 NUMBER) RETURN NUMBER IS
	resultado NUMBER:=0;
BEGIN
	resultado := n1 + n2;
	DBMS_OUTPUT.PUT_LINE('LOCAL - suma_A: ' || n1 || ' + ' || n2 || ' = ' || resultado);
	RETURN resultado;
END;

/* ----------------------------------------------------------------------------------------------- */ 
-- Ejemplo: Funcion para sumar dos numeros
PROCEDURE suma_B (n1 IN NUMBER, n2 IN NUMBER, resultado OUT NUMBER) IS
BEGIN
	resultado := n1 + n2;
	DBMS_OUTPUT.PUT_LINE('LOCAL - suma_B: ' || n1 || ' + ' || n2 || ' = ' || resultado);	
END;

/* ----------------------------------------------------------------------------------------------- */ 
BEGIN
	x1:=12;
	x2:=6;
	mensaje:='PRINCIPAL - Funcion suma_A: ' || x1 || ' + ' || x2 || ' = ' || suma_A(x1,x2);
	DBMS_OUTPUT.PUT_LINE(mensaje);
	
    x1:=13;
	x2:=43;
    suma_B (x1,x2,x3);
    mensaje:='PRINCIPAL: Funcion suma_B ' || x1 || ' + ' || x2 || ' = ' || x3;
	DBMS_OUTPUT.PUT_LINE(mensaje);	
END;