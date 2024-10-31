SET SERVEROUTPUT ON

DECLARE
	mensaje VARCHAR2(100);
  
/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Procedimiento para consultar el nombre y sueldo de una tupla de empleados
procedure ConsultaEMP (pdni empleados.dni%type) is

	type regproy is record (
          rnombre empleados.nombre%type,
          rsueldo empleados.sueldo%type	
	);
	r regproy;

begin
	dbms_output.put_line('Procedimiento ConsultaEMP');
	select nombre, sueldo into r from empleados where dni = pdni;
	dbms_output.put_line('Nombre: ' || r.rnombre );
	dbms_output.put_line('sueldo: ' || r.rsueldo );
End;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Procedimiento para consultar los datos de un dpto
procedure ConsultaDEP(pnumerodpto departamentos.numerodpto%type ) is
	r departamentos%rowtype;
begin
	dbms_output.put_line('Procedimiento ConsultaDEP');
	select * into r from departamentos where numerodpto = pnumerodpto;
	dbms_output.put_line('Número dpto: ' || r.numerodpto);
	dbms_output.put_line('Nombre dpto: ' || r.nombredpto);
	dbms_output.put_line('Coste dpto: ' || r.coste);
end; 

/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 

BEGIN
	DBMS_OUTPUT.ENABLE;

	ConsultaEMP('123456789');
	ConsultaDEP('3');

	mensaje := 'Fin de programa';
	dbms_output.put_line(mensaje);
END;