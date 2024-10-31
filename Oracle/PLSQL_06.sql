SET SERVEROUTPUT ON

DECLARE
	mensaje VARCHAR2(100);
  
/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo de CURSOR 
PROCEDURE EjCursor IS
	CURSOR c_dep IS SELECT * FROM departamentos;
	r departamentos%ROWTYPE;
BEGIN
	OPEN c_dep;
	FETCH c_dep INTO r;
	CLOSE c_dep;
	dbms_output.put_line('Número departamento: ' || r.numerodpto);
	dbms_output.put_line('Nombre departamento: ' || r.nombredpto);
	dbms_output.put_line('Coste: ' || r.coste);
END;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo de CURSOR LOOP
PROCEDURE Listaremp IS 
       CURSOR c_emp IS SELECT * FROM empleados;
       r empleados%ROWTYPE;
BEGIN
       OPEN c_emp;
       LOOP
             FETCH c_emp INTO r;
             EXIT WHEN c_emp%notfound;
             dbms_output.put_line(r.dni || ' - ' || r.nombre || ' - ' || r.numdep);
       END LOOP;
       CLOSE c_emp;
END;


/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 

BEGIN
	DBMS_OUTPUT.ENABLE;

	EjCursor();
	Listaremp();

	mensaje := 'Fin de programa';
	dbms_output.put_line(mensaje);
END;