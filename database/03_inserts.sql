USE universidade_u;

/* ===================== ALUNO ===================== */
INSERT INTO aluno (sexo, email, nome, cpf, data_nascimento) VALUES 
('M','jose@teste.com.br','José','222.222.222-22','1985-06-01'),
('F','maria@teste.com.br','Maria','111.111.111-11','1979-12-10'),
('F','ana@teste.com.br','Ana','333.333.333-33','1992-03-15'),
('M','carlos@teste.com.br','Carlos','444.444.444-44','1988-09-20'),
('F','juliana@teste.com.br','Juliana','555.555.555-55','1995-07-11'),
('M','roberto@teste.com.br','Roberto','666.666.666-66','1982-01-30'),
('F','fernanda@teste.com.br','Fernanda','777.777.777-77','1998-05-22'),
('M','marcos@teste.com.br','Marcos','888.888.888-88','1990-12-01');

/* ===================== CURSO ===================== */
INSERT INTO curso (descricao) VALUES
('NodeJS e MongoDB'),
('Web Completo'),
('Banco de Dados'),
('Java Completo'),
('Python para Dados'),
('DevOps'),
('React Avançado'),
('Cloud Computing');

/* ===================== PROFESSOR ===================== */
INSERT INTO professor (nome,email) VALUES
('Laura','laura@teste.com.br'),
('Miguel','miguel@teste.com.br'),
('Carlos','carlos@teste.com.br'),
('Patricia','patricia@teste.com.br'),
('Rafael','rafael@teste.com.br'),
('Bruno','bruno@teste.com.br'),
('Aline','aline@teste.com.br'),
('Eduardo','eduardo@teste.com.br');

/* ===================== DISCIPLINA ===================== */
INSERT INTO disciplina (descricao,carga_horaria,fk_idprofessor,fk_idcurso) VALUES
('HTML',4,1,2),
('CSS',3,NULL,2),
('MySQL',6,3,3),
('Java OO',10,4,4),
('Python Básico',8,5,5),
('Docker',6,6,6),
('React Hooks',7,7,7),
('AWS',10,8,8);

/* ===================== ALUNO_CURSO ===================== */
INSERT INTO aluno_curso (fk_idaluno,fk_idcurso,data_inscricao_curso,valor_pago_curso) VALUES
(1,2,'2024-01-10 10:00:00',1500),
(2,1,'2024-02-15 14:00:00',1200),
(3,3,'2024-03-01 09:30:00',900),
(4,4,'2024-03-10 11:00:00',2000),
(5,5,'2024-04-05 15:00:00',1800),
(6,6,'2024-04-20 08:00:00',1600),
(7,7,'2024-05-01 13:00:00',1700),
(8,8,'2024-05-15 16:00:00',2200);

/* ===================== ENDERECO ===================== */
INSERT INTO endereco (logradouro,numero,complemento,bairro,cidade,estado,fk_idaluno) VALUES
('Rua A','10','Casa','Centro','São Paulo','SP',1),
('Rua B','20',NULL,'Bairro B','Campinas','SP',2),
('Rua C','30','Apto 2','Centro','Rio de Janeiro','RJ',3),
('Rua D','40','Casa','Zona Sul','São Paulo','SP',4),
('Rua E','50',NULL,'Centro','Belo Horizonte','MG',5),
('Rua F','60','Apto 5','Zona Norte','Curitiba','PR',6),
('Rua G','70','Casa','Centro','Salvador','BA',7),
('Rua H','80',NULL,'Centro','Florianópolis','SC',8);

/* ===================== TELEFONE ===================== */
INSERT INTO telefone (numero,fk_idaluno,tipo) VALUES
('11 99999-1111',1,'cel'),
('11 3333-2222',1,'res'),
('19 98888-7777',2,'cel'),
('21 97777-6666',3,'cel'),
('31 96666-5555',4,'cel'),
('41 95555-4444',5,'cel'),
('51 94444-3333',6,'cel'),
('61 93333-2222',7,'cel');

/* ===================== FUNCIONARIO ===================== */
INSERT INTO funcionario (nome,funcao,telefone,fk_idfuncionario_supervisor,salario) VALUES
('João','Administrador','11 4444-4444',NULL,5000),
('Pedro','Analista','11 5555-5555',1,4000),
('Lucas','Suporte','11 6666-6666',2,3000),
('Marina','RH','11 7777-7777',1,4500),
('Ricardo','Financeiro','11 8888-8888',1,4800),
('Sofia','Marketing','11 9999-9999',1,4200),
('André','Dev','11 2222-2222',2,5500),
('Carla','QA','11 1111-1111',2,3800);

/* ===================== PROJETO ===================== */
INSERT INTO projeto (nome) VALUES
('Sistema Acadêmico'),
('App Mobile'),
('Portal Web'),
('Sistema Financeiro'),
('API REST'),
('Dashboard BI'),
('Sistema RH'),
('App Delivery');

/* ===================== PROJETO_FUNCIONARIO ===================== */
INSERT INTO projeto_funcionario (fk_idcodigo,fk_idfuncionario,horas_estimadas,horas_realizadas) VALUES
(1,1,100,80),
(1,2,120,100),
(2,3,90,70),
(3,4,110,90),
(4,5,130,120),
(5,6,95,85),
(6,7,150,140),
(7,8,80,60);

/* ===================== CONTRATO ===================== */
INSERT INTO contrato (fk_idaluno,fk_idcurso,fk_data_inscricao_curso,valor_total_curso,numero_parcelas) VALUES
(1,2,'2024-01-10 10:00:00',1500,12),
(2,1,'2024-02-15 14:00:00',1200,10),
(3,3,'2024-03-01 09:30:00',900,8),
(4,4,'2024-03-10 11:00:00',2000,12),
(5,5,'2024-04-05 15:00:00',1800,10),
(6,6,'2024-04-20 08:00:00',1600,8),
(7,7,'2024-05-01 13:00:00',1700,10),
(8,8,'2024-05-15 16:00:00',2200,12);

/* ===================== BOLETO ===================== */
INSERT INTO boleto (fk_idcontrato,data_vencimento,valor,numero_parcela) VALUES
(1,'2024-02-10',125,1),
(2,'2024-03-15',120,1),
(3,'2024-04-01',112,1),
(4,'2024-04-10',166,1),
(5,'2024-05-05',180,1),
(6,'2024-05-20',200,1),
(7,'2024-06-01',170,1),
(8,'2024-06-15',183,1);

/* ===================== GASTO ===================== */
INSERT INTO gasto (ano,tipo,jan,fev,mar) VALUES
(2024,'previsto',1000,1200,1100),
(2024,'realizado',900,1300,1000),
(2025,'previsto',1500,1600,1700),
(2025,'realizado',1400,1500,1600),
(2026,'previsto',2000,2100,2200),
(2026,'realizado',1900,2000,2100),
(2027,'previsto',2500,2600,2700),
(2027,'realizado',2400,2500,2600);

/* ===================== LOG ===================== */
INSERT INTO log (log) VALUES
('Sistema iniciado'),
('Carga de dados realizada'),
('Backup executado'),
('Usuário logado'),
('Erro corrigido'),
('Atualização aplicada'),
('Processo finalizado'),
('Relatório gerado');

/* ===================== CALENDARIO ===================== */
INSERT INTO calendario (data,dia,mes,ano,feriado,nome_feriado) VALUES
('2024-01-01',1,1,2024,'S','Ano Novo'),
('2024-12-25',25,12,2024,'S','Natal'),
('2024-03-10',10,3,2024,'N',NULL),
('2024-04-21',21,4,2024,'S','Tiradentes'),
('2024-05-01',1,5,2024,'S','Dia do Trabalho'),
('2024-09-07',7,9,2024,'S','Independência'),
('2024-10-12',12,10,2024,'S','Nossa Senhora'),
('2024-11-15',15,11,2024,'S','Proclamação');

/* ===================== FUNCIONARIO_LOG ===================== */
INSERT INTO funcionario_log (
fk_idfuncionario,tipo_log,funcao_antiga,funcao_nova,
telefone_antigo,telefone_novo,salario_antigo,salario_novo
) VALUES
(1,'AU','Administrador','Gerente','11 4444-4444','11 7777-7777',5000,7000),
(2,'BU','Analista','Senior','11 5555-5555','11 8888-8888',4000,5500),
(3,'AU','Suporte','Analista','11 6666-6666','11 9999-9999',3000,4500),
(4,'BU','RH','RH Senior','11 7777-7777','11 0000-0000',4500,6000),
(5,'AU','Financeiro','Gerente','11 8888-8888','11 1111-1111',4800,6500),
(6,'BU','Marketing','Marketing Lead','11 9999-9999','11 2222-2222',4200,5800),
(7,'AU','Dev','Tech Lead','11 2222-2222','11 3333-3333',5500,8000),
(8,'BU','QA','QA Senior','11 1111-1111','11 4444-4444',3800,5000);
