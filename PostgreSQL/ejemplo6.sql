/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo de cursor 
CREATE OR REPLACE FUNCTION EjCursor() RETURNS varchar AS $$
DECLARE
	c_sect CURSOR FOR SELECT * FROM departamentos;
	r departamentos%rowtype;
	mensaje varchar;
BEGIN 
	open c_sect;
	fetch c_sect into r;
	close c_sect;
	mensaje:= r.numerodpto || ' -- ' || r.nombredpto || ' -- ' || r.coste || ' -- ' || r.porcent;
	raise notice 'EjCursor: %',mensaje;
	return null;
END;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo de cursor loop
CREATE OR REPLACE FUNCTION ListarEmp() RETURNS varchar AS $$
DECLARE 
       c_Emp CURSOR FOR SELECT * FROM Empleados;
       r Empleados%rowtype;
	   mensaje varchar(300):='';
BEGIN
       raise notice 'ListarEmp';
       OPEN c_Emp;
       LOOP
              FETCH c_Emp INTO r;
			  IF r IS NULL THEN EXIT;
			  END IF;
              mensaje:= r.dni || ' - ' || r.nombre || ' - ' || r.numdep;
              raise notice '%',mensaje;
       END LOOP;
       CLOSE c_Emp;
       return null;
END;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 

SELECT EjCursor();
SELECT ListarEmp();

DROP FUNCTION EjCursor();
DROP FUNCTION ListarEmp();