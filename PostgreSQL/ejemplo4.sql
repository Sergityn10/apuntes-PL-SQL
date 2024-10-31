/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Funcion para sumar dos numeros
CREATE OR REPLACE function suma_A (n1 integer, n2 integer) RETURNS integer AS $$
DECLARE
	resultado integer:=0;
begin
	raise notice 'Funcion suma_A';
	resultado := n1 + n2;
	raise notice 'suma_A: % + % = %',n1,n2,resultado;
	return resultado;
End;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Funcion para sumar dos numeros
-- En este caso, como hay parametros OUT, no permite que se retorne ningun valor (no hay RETURNS)
CREATE OR REPLACE function suma_B (IN n1 integer, IN n2 integer, OUT resultado integer) AS $$
begin
	raise notice 'Funcion suma_B';
	resultado := n1 + n2;
	raise notice 'suma_B: % + % = %',n1,n2,resultado;
	
End;
$$ LANGUAGE plpgsql;

/* ------------------------------------------------------------------------------------------ */ 

-- Ejemplo: Funcion para llamar a otras funciones
CREATE OR REPLACE function main () RETURNS integer AS $$
DECLARE
	resultado integer:=0;
	x1 integer;
	x2 integer;
	x3 integer:=0;
begin
	raise notice 'Funcion main';

	x1:=12;
	x2:=6;
	x3:=suma_A (x1,x2);
	
    x1:=13;
	x2:=43;
    select suma_B (x1,x2) into x3;
	raise notice 'Funcion main: % + % = %',x1,x2,x3;
	return NULL;
End;
$$ LANGUAGE plpgsql;


/* ------------------------------------------------------------------------------------------ */ 

-- Desde el modulo principal se puede llamar a la funcion suma_A
select suma_A (12,42);
-- Pero no se puede llamar a la funcion suma_B, porque retorna un parametro de salida y no se puede declarar previamente
-- select suma_B (12,42,�n3?);
-- No queda mas remedio que crear una funcion (main) que llame a otras funciones...
select main();

drop function suma_A(integer,integer);
drop function suma_B(integer,integer,out integer);
drop function main();