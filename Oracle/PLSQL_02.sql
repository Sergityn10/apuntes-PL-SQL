SET SERVEROUTPUT ON
DECLARE
	sueldo_min empleados.sueldo%TYPE;
	sueldo_max empleados.sueldo%TYPE;
	sueldo_med empleados.sueldo%TYPE;
	total_emp NUMBER(10,2);
	mensaje VARCHAR2(300);

BEGIN
	DBMS_OUTPUT.ENABLE;
	SELECT min(sueldo),max(sueldo),avg(sueldo),count(*) INTO sueldo_min, sueldo_max, sueldo_med, total_emp
	FROM empleados;

	mensaje:='sueldo máximo: '||sueldo_max||' - sueldo mínimo: '||sueldo_min||' - sueldo medio: '||sueldo_med||' - total empleados: '||total_emp;

	DBMS_OUTPUT.PUT_LINE(mensaje);
END;
