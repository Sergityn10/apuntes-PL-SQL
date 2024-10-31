/* ------------------------------------------------------------------------------------------ */

-- Procedimiento para consultar el salario de un empleado
CREATE OR REPLACE FUNCTION FindEmp(pdni Empleados.dni%type ) RETURNS varchar AS $$
DECLARE
	v_sueldo Empleados.sueldo%Type;
	salida varchar(50);
	Cont numeric;

Begin
	Select sueldo Into v_sueldo From Empleados Where dni = pdni;
	salida:='FindEmp - sueldo: ' || v_sueldo;
	if (salida != NULL) then
        raise notice '%',salida;
    end if;
    return salida;
	EXCEPTION
		When No_Data_Found Then salida:='FindEmp - dni no existe.';
	raise notice '%',salida;
	return salida;
End;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */

-- Permite generar una excepcion (lanzar una excepci�n)
-- Procedimiento para actualizar el salario de una tupla de Empleados
CREATE OR REPLACE FUNCTION UpdatesueldoEmp(pdni Empleados.dni%Type, p_sueldo Empleados.sueldo%Type) RETURNS varchar AS $$
DECLARE
	Cont numeric;
	salida varchar(50);
Begin
	Select Count(*) Into Cont From Empleados Where dni = pdni;
	If (Cont=0) Then
		Raise No_Data_Found; -- lanza la excepcion
    End If;
	Update Empleados Set sueldo = p_sueldo Where dni = pdni;
	salida:='UpdatesueldoEmp - Proceso OK';
	raise notice '%',salida;
    return salida;
	EXCEPTION -- captura la excepci�n
		When No_Data_Found Then salida:='UpdatesueldoEmp - dni no existe.';
	raise notice '%',salida;
	return salida;
End;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */

-- En PgPlSQL no es posible declarar una variable de tipo "exception"

/* ------------------------------------------------------------------------------------------ */

-- Mismo procedimiento, pero con mensaje de error
CREATE OR REPLACE FUNCTION UpdatesueldoEmp3 (pdni Empleados.dni%Type, p_sueldo Empleados.sueldo%Type)RETURNS varchar AS $$
DECLARE
	Cont numeric;
	salida varchar(150);
Begin
	Select Count(*) Into Cont From Empleados Where dni = pdni;
	If (Cont=0) Then
		salida:= 'UpdatesueldoEmp3 - No existe Empleados con dni '||pdni;
		RAISE EXCEPTION '%',salida;
    else
		Update Empleados Set sueldo = p_sueldo Where dni = pdni;
		salida:= 'UpdatesueldoEmp3 - Proceso OK';
		raise notice '%',salida;
	end if;
	-- ahora no se atiende la excepcion
    return salida;
End;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------ */

select FindEmp('123456789'); -- Ok
select FindEmp('MAL---MAL'); -- Excepcion
select UpdatesueldoEmp('123456789',45000); -- Ok
select UpdatesueldoEmp('MAL---MAL',45000); -- Excepcion
select UpdatesueldoEmp3('123456789',50000); -- Ok
select UpdatesueldoEmp3('MAL---MAL',50000); -- Excepcion

-- Se vuelve a actualizar con sueldo original (36000)
select UpdatesueldoEmp('123456789',36000);

DROP FUNCTION FindEmp(varchar);
DROP FUNCTION UpdatesueldoEmp(varchar,numeric);
DROP FUNCTION UpdatesueldoEmp3(varchar,numeric);