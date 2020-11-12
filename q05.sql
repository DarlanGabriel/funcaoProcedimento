DROP FUNCTION IF EXISTS atrasoDiasProjeto cascade;

CREATE OR REPLACE FUNCTION atrasoDiasProjeto(ativcod INTEGER) 
RETURNS double precision
AS $$
DECLARE
	dias double precision;
BEGIN
	SELECT INTO dias DATE_PART('day', p.dataFim::date) - DATE_PART('day', p.dataInicio::date) 
	FROM projeto p 
	WHERE p.codigo = ativcod;
	RETURN dias;
END;
$$ LANGUAGE plpgsql;
SELECT atrasoDias(1);
