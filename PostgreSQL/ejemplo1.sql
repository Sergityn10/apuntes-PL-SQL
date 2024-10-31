-- Primer ejemplo
CREATE OR REPLACE FUNCTION ejemplo01() RETURNS integer AS $$
DECLARE 
  v integer := 2;
BEGIN
  v:=v*2;
  DECLARE
    z integer := 3;
  BEGIN
    z:=v*3;
    RAISE NOTICE 'v = %',v; -- escribe 4
    RAISE NOTICE 'z = %',z; -- escribe 12
  END;
  RAISE NOTICE 'v*2 = %',v*2; -- escribe 8
  --RAISE NOTICE 'z = %',z; -- error, ya no es accesible

  RETURN v;
END;
$$ LANGUAGE plpgsql;

select ejemplo01();

DROP FUNCTION ejemplo01();