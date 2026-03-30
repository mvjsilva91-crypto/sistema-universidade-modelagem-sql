/* ===================== ALUNO ===================== */
INSERT INTO aluno (sexo, email, nome, cpf, data_nascimento) VALUES 
('M','jose@teste.com.br','José','222.222.222-22','1985-06-01'),
('F','maria@teste.com.br','Maria','111.111.111-11','1979-12-10'),
('F','ana@teste.com.br','Ana','333.333.333-33','1992-03-15');

/* ===================== CURSO ===================== */
INSERT INTO curso (descricao) VALUES
('NodeJS e MongoDB'),
('Web Completo'),
('Banco de Dados');

/* ===================== PROFESSOR ===================== */
INSERT INTO professor (nome,email) VALUES
('Laura','laura@teste.com.br'),
('Miguel','miguel@teste.com.br'),
('Carlos','carlos@teste.com.br');

/* ===================== DISCIPLINA ===================== */
INSERT INTO disciplina (descricao,carga_horaria,fk_idprofessor,fk_idcurso) VALUES
('HTML',4,1,2),
('CSS',3,NULL,2),
('MySQL',6,3,3);

/* ===================== ALUNO_CURSO ===================== */
INSERT INTO aluno_curso (fk_idaluno,fk_idcurso,data_inscricao_curso,valor_pago_curso) VALUES
(1,2,'2024-01-10 10:00:00',1500),
(2,1,'2024-02-15 14:00:00',1200),
(3,3,'2024-03-01 09:30:00',900);

/* ===================== ENDERECO ===================== */
INSERT INTO endereco (logradouro,numero,complemento,bairro,cidade,estado,fk_idaluno) VALUES
('Rua A','10','Casa','Centro','São Paulo','SP',1),
('Rua B','20',NULL,'Bairro B','Campinas','SP',2),
('Rua C','30','Apto 2','Centro','Rio de Janeiro','RJ',3);

/* ===================== TELEFONE ===================== */
INSERT INTO telefone (numero,fk_idaluno,tipo) VALUES
('11 99999-1111',1,'cel'),
('11 3333-2222',1,'res'),
('19 98888-7777',2,'cel');

/* ===================== FUNCIONARIO ===================== */
INSERT INTO funcionario (nome,funcao,telefone,fk_idfuncionario_supervisor,salario) VALUES
('João','Administrador','11 4444-4444',NULL,5000),
('Pedro','Analista','11 5555-5555',1,4000),
('Lucas','Suporte','11 6666-6666',2,3000);

/* ===================== PROJETO ===================== */
INSERT INTO projeto (nome) VALUES
('Sistema Acadêmico'),
('App Mobile');

/* ===================== PROJETO_FUNCIONARIO ===================== */
INSERT INTO projeto_funcionario (fk_idcodigo,fk_idfuncionario,horas_estimadas,horas_realizadas) VALUES
(1,1,100,80),
(1,2,120,100),
(2,3,90,70);

/* ===================== CONTRATO ===================== */
INSERT INTO contrato (fk_idaluno,fk_idcurso,fk_data_inscricao_curso,valor_total_curso,numero_parcelas) VALUES
(1,2,'2024-01-10 10:00:00',1500,12),
(2,1,'2024-02-15 14:00:00',1200,10);

/* ===================== BOLETO ===================== */
INSERT INTO boleto (fk_idcontrato,data_vencimento,valor,numero_parcela) VALUES
(1,'2024-02-10',125,1),
(1,'2024-03-10',125,2),
(2,'2024-03-15',120,1);

/* ===================== GASTO ===================== */
INSERT INTO gasto (ano,tipo,jan,fev,mar) VALUES
(2024,'previsto',1000,1200,1100),
(2024,'realizado',900,1300,1000);

/* ===================== LOG ===================== */
INSERT INTO log (log) VALUES
('Sistema iniciado'),
('Carga de dados realizada');

/* ===================== CALENDARIO ===================== */
INSERT INTO calendario (data,dia,mes,ano,feriado,nome_feriado) VALUES
('2024-01-01',1,1,2024,'S','Ano Novo'),
('2024-12-25',25,12,2024,'S','Natal'),
('2024-03-10',10,3,2024,'N',NULL);

/* ===================== FUNCIONARIO_LOG ===================== */
INSERT INTO funcionario_log (
fk_idfuncionario,tipo_log,funcao_antiga,funcao_nova,
telefone_antigo,telefone_novo,salario_antigo,salario_novo
) VALUES
(1,'AU','Administrador','Gerente','11 4444-4444','11 7777-7777',5000,7000),
(2,'BU','Analista','Senior','11 5555-5555','11 8888-8888',4000,5500);
