DROP FUNCTION IF EXISTS mediaIdade cascade;

CREATE OR REPLACE FUNCTION mediaIdade(codDep INTEGER) 
RETURNS INTEGER 
	AS $$
DECLARE
	mediaIdad INTEGER;
BEGIN
	SELECT into mediaIdad AVG(EXTRACT(years FROM AGE(f.datanasc))) 
	FROM funcionario f 
	WHERE f.depto = codDep;
	return mediaIdad;
END;
$$ LANGUAGE 'plpgsql';

SELECT mediaIdade(1);
