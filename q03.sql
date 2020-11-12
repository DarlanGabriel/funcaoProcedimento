CREATE OR REPLACE PROCEDURE maiorM()
AS $$
BEGIN
	SELECT nome FROM funcionario WHERE calculaIdade(codigo) > mediaIdade(depto);
END;
$$ LANGUAGE plpgsql;

call maiorM();
