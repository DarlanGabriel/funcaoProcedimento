CREATE USER empresa_gerente WITH ENCRYPTED PASSWORD 'senha';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO empresa_gerente;
GRANT INSERT, UPDATE ON equipe, membro, atividade, atividade_projeto TO empresa_gerente;
