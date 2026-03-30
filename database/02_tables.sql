CREATE TABLE aluno (
  idaluno INT AUTO_INCREMENT PRIMARY KEY,
  sexo CHAR(1),
  email VARCHAR(150) UNIQUE,
  nome VARCHAR(25),
  cpf VARCHAR(14) UNIQUE,
  data_nascimento DATE,
  ativo_sn INT DEFAULT 1
);

CREATE TABLE curso (
  idcurso INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(50)
);

CREATE TABLE professor (
  idprofessor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE disciplina (
  iddisciplina INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(50),
  carga_horaria INT,
  fk_idprofessor INT,
  fk_idcurso INT
);

CREATE TABLE aluno_curso (
  fk_idaluno INT,
  fk_idcurso INT,
  data_inscricao_curso DATETIME DEFAULT CURRENT_TIMESTAMP,
  valor_pago_curso FLOAT,
  PRIMARY KEY (fk_idaluno, fk_idcurso, data_inscricao_curso)
);

CREATE TABLE endereco (
  idendereco INT AUTO_INCREMENT PRIMARY KEY,
  logradouro VARCHAR(100),
  numero VARCHAR(10),
  complemento VARCHAR(20),
  bairro VARCHAR(100),
  cidade VARCHAR(50),
  estado CHAR(2),
  fk_idaluno INT UNIQUE
);

CREATE TABLE telefone (
  idtelefone INT AUTO_INCREMENT PRIMARY KEY,
  numero VARCHAR(20),
  fk_idaluno INT,
  tipo ENUM('res','com','cel')
);

CREATE TABLE funcionario (
  idfuncionario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  funcao VARCHAR(50),
  telefone VARCHAR(20),
  fk_idfuncionario_supervisor INT,
  salario FLOAT
);

CREATE TABLE projeto (
  idcodigo INT AUTO_INCREMENT PRIMARY KEY,
  data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
  nome VARCHAR(100)
);

CREATE TABLE projeto_funcionario (
  fk_idcodigo INT,
  fk_idfuncionario INT,
  horas_estimadas INT,
  horas_realizadas INT,
  PRIMARY KEY (fk_idcodigo, fk_idfuncionario)
);

CREATE TABLE contrato (
  idcontrato INT AUTO_INCREMENT PRIMARY KEY,
  fk_idaluno INT,
  fk_idcurso INT,
  fk_data_inscricao_curso DATETIME,
  valor_total_curso FLOAT,
  desconto FLOAT DEFAULT 0,
  numero_parcelas INT,
  processado ENUM('n','s') DEFAULT 'n'
);

CREATE TABLE boleto (
  idboleto INT AUTO_INCREMENT PRIMARY KEY,
  fk_idcontrato INT,
  data_vencimento DATE,
  valor FLOAT,
  numero_parcela INT
);

CREATE TABLE gasto (
  idgasto INT AUTO_INCREMENT PRIMARY KEY,
  ano INT,
  tipo ENUM('previsto','realizado'),
  jan FLOAT, fev FLOAT, mar FLOAT, abr FLOAT,
  mai FLOAT, jun FLOAT, jul FLOAT, ago FLOAT,
  set FLOAT, out FLOAT, nov FLOAT, dez FLOAT
);

CREATE TABLE log (
  idlog INT AUTO_INCREMENT PRIMARY KEY,
  log VARCHAR(300),
  data_log DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE calendario (
  idcalendario INT AUTO_INCREMENT PRIMARY KEY,
  data DATE,
  dia INT,
  mes INT,
  ano INT,
  feriado ENUM('S','N'),
  nome_feriado VARCHAR(150)
);

CREATE TABLE funcionario_log (
  idfuncionario_log INT AUTO_INCREMENT PRIMARY KEY,
  fk_idfuncionario INT,
  data_log DATETIME DEFAULT CURRENT_TIMESTAMP,
  tipo_log CHAR(2),
  funcao_antiga VARCHAR(50),
  funcao_nova VARCHAR(50),
  telefone_antigo VARCHAR(20),
  telefone_novo VARCHAR(20),
  salario_antigo FLOAT,
  salario_novo FLOAT
);
