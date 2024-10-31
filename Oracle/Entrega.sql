SET SERVEROUTPUT ON;
DECLARE
vnombre VARCHAR2(20);
 vcoste NUMBER(9,2);
vporcent NUMBER(3,2);
 mensaje VARCHAR2(300);
/* --------------------------------------------------------------------- */
-- Procedimientos... (A.1, A.2, A.3, A.4)
/* --------------------------------------------------------------------- */
BEGIN
DBMS_OUTPUT.ENABLE;
-- A.1)
InsertarDepartamentos (0,'CONTABILIDAD',0,0);
VerDepartamentos();

-- A.2)
ModificarDepartamentos (0,'FINANZAS',0,0);
VerDepartamentos();

-- A.3)
ConsultarDepartamentos (0, vnombre, vcoste, vporcent);
dbms_output.put_line('Nombre departamento: ' || vnombre);
dbms_output.put_line('Coste: ' || vcoste);
dbms_output.put_line('Porcent: ' || vporcent);
-- A.4)
BorrarDepartamentos (0);
VerDepartamentos();

mensaje := 'Fin de programa';
DBMS_OUTPUT.PUT_LINE(mensaje);
END;