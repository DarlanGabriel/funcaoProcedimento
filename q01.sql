DROP FUNCTION IF EXISTS calculaIdade cascade;

CREATE OR REPLACE FUNCTION calculaIdade(codFun INTEGER) 
RETURNS INTEGER
	AS $$
DECLARE
	idade INTEGER;
BEGIN
	SELECT INTO idade EXTRACT(years FROM AGE(f.datanasc)) 
	FROM funcionario f 
	WHERE f.codigo = codFun;
	return idade;
END;
$$ LANGUAGE plpgsql;
