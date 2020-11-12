DROP FUNCTION IF EXISTS atrasoDias cascade;

CREATE OR REPLACE FUNCTION atrasoDias(ativcod INTEGER) 
RETURNS double precision
AS $$
DECLARE
	dias double precision;
BEGIN
	SELECT INTO dias DATE_PART('day', a.dataFim::date) - DATE_PART('day', a.dataInicio::date) 
	FROM atividade a 
	WHERE a.codigo = ativcod;
	RETURN dias;
END;
$$ LANGUAGE plpgsql;
SELECT atrasoDias(1);
