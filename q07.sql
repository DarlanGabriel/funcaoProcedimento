DROP FUNCTION IF EXISTS calculaAtividades cascade;

CREATE OR REPLACE FUNCTION calculaAtividades(codFun INTEGER, codPro INTEGER) 
RETURNS INTEGER
	AS $$
DECLARE
	quantidade INTEGER;
BEGIN
	SELECT INTO quantidade COUNT(a.codigo) 
	FROM atividade a, projeto p, funcionario f, atividade_membro am, atividade_projeto ap 
	WHERE f.codigo = codFun AND p.codigo = codPro AND am.codAtividade = ap.codAtividade AND am.codAtividade = a.codigo AND ap.codProjeto = p.codigo AND am.codMembro = f.codigo;
	return quantidade;
END;
$$ LANGUAGE plpgsql;

SELECT calculaAtividades(1, 1);
