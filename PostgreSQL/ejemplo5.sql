/* ------------------------------------------------------------------------------------------ */
 
-- Ejemplo: Procedimiento para consultar el nombre y sueldo de una tupla de empleados
CREATE OR REPLACE FUNCTION ConsultaEMP (pdni empleados.dni%type) RETURNS varchar AS $$
DECLARE
	r record;

	salida varchar(100);
BEGIN
	SELECT nombre, sueldo INTO r FROM empleados WHERE dni = pdni;
	salida:=r.nombre || ' -- ' || r.sueldo;
	raise notice 'ConsultaEMP: %',salida;
	RETURN salida;
END;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Procedimiento para consultar los datos de un servidor
CREATE OR REPLACE FUNCTION ConsultaDEP(pnumerodpto departamentos.numerodpto%type) RETURNS varchar AS $$
DECLARE
	r departamentos%rowtype; 
    --r record; // también se podría definir simplemente como record 
	salida varchar(100);
BEGIN
	SELECT * INTO r FROM departamentos WHERE numerodpto = pnumerodpto;
	salida := r.nombredpto || ' -- ' || r.numerodpto || ' -- ' || r.coste || ' -- ' || r.porcent;
	raise notice 'ConsultaDEP: %',salida;	
	RETURN salida;
END; 
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------------ */ 

SELECT ConsultaEMP('123456789');
SELECT ConsultaDEP(3);

DROP FUNCTION ConsultaEMP(varchar);
DROP FUNCTION ConsultaDEP(numeric);