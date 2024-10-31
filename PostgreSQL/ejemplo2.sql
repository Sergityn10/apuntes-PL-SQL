CREATE OR REPLACE FUNCTION ejemplo02() RETURNS varchar AS $$
DECLARE
	sueldo_min empleados.sueldo%TYPE;
	sueldo_max empleados.sueldo%TYPE;
	sueldo_med empleados.sueldo%TYPE;
	total_pob NUMERIC(2);
	mensaje VARCHAR(300);

BEGIN
	SELECT min(sueldo),max(sueldo),avg(sueldo),count(*) INTO sueldo_min, sueldo_max, sueldo_med, total_pob
	FROM empleados;

	mensaje:='sueldo maximo: '||sueldo_max||' - sueldo minimo: '||sueldo_min||' - sueldo medio: '||sueldo_med||' - total empleados: '||total_pob;
	raise notice '%',mensaje;
	RETURN mensaje;
END;
$$ LANGUAGE plpgsql;

select ejemplo02();

DROP FUNCTION ejemplo02();