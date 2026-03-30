/* =====================================================
   ATUALIZAÇÕES E CORREÇÕES DO BANCO universidade_u
   ===================================================== */

USE universidade_u;

/* =====================================================
   1. CORREÇÃO DA TABELA FUNCIONARIO
   ===================================================== */

-- Renomeia idmatricula para idfuncionario
ALTER TABLE funcionario 
CHANGE idmatricula idfuncionario INT NOT NULL;

-- Define como AUTO_INCREMENT e PK
ALTER TABLE funcionario 
MODIFY idfuncionario INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (idfuncionario);

-- Ajusta FK de supervisor
ALTER TABLE funcionario 
CHANGE fk_idmatricula_supervisor fk_idfuncionario_supervisor INT;

/* =====================================================
   2. CORREÇÃO DAS CHAVES E RELACIONAMENTOS
   ===================================================== */

-- Remove FK antiga (se existir)
ALTER TABLE projeto_funcionario 
DROP FOREIGN KEY projeto_funcionario_ibfk_2;

-- Cria FK correta com funcionario
ALTER TABLE projeto_funcionario 
ADD CONSTRAINT fk_projeto_funcionario_funcionario
FOREIGN KEY (fk_idfuncionario) REFERENCES funcionario(idfuncionario);

-- Corrige funcionario_log
ALTER TABLE funcionario_log 
CHANGE fk_idmatricula fk_idfuncionario INT;

ALTER TABLE funcionario_log 
ADD CONSTRAINT fk_funcionario_log
FOREIGN KEY (fk_idfuncionario) REFERENCES funcionario(idfuncionario);

-- Corrige auto relacionamento funcionario
ALTER TABLE funcionario 
ADD CONSTRAINT fk_funcionario_supervisor
FOREIGN KEY (fk_idfuncionario_supervisor)
REFERENCES funcionario(idfuncionario);

/* =====================================================
   3. CORREÇÃO DAS TRIGGERS
   ===================================================== */

DROP TRIGGER IF EXISTS tr_before_insert_funcionario;
DROP TRIGGER IF EXISTS tr_after_insert_funcionario;
DROP TRIGGER IF EXISTS tr_before_delete_funcionario;
DROP TRIGGER IF EXISTS tr_after_delete_funcionario;
DROP TRIGGER IF EXISTS tr_before_update_funcionario;
DROP TRIGGER IF EXISTS tr_after_update_funcionario;

DELIMITER $$

-- BEFORE INSERT
CREATE TRIGGER tr_before_insert_funcionario
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
    INSERT INTO funcionario_log(
        tipo_log,
        funcao_nova,
        telefone_novo
    )
    VALUES (
        'BI',
        NEW.funcao,
        NEW.telefone
    );
END $$

-- AFTER DELETE
CREATE TRIGGER tr_after_delete_funcionario
AFTER DELETE ON funcionario
FOR EACH ROW
BEGIN
    INSERT INTO funcionario_log(
        tipo_log,
        funcao_antiga,
        telefone_antigo
    )
    VALUES (
        'AD',
        OLD.funcao,
        OLD.telefone
    );
END $$

-- BEFORE UPDATE
CREATE TRIGGER tr_before_update_funcionario
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
    INSERT INTO funcionario_log(
        tipo_log,
        funcao_antiga,
        funcao_nova,
        telefone_antigo,
        telefone_novo
    )
    VALUES (
        'BU',
        OLD.funcao,
        NEW.funcao,
        OLD.telefone,
        NEW.telefone
    );
END $$

-- AFTER UPDATE
CREATE TRIGGER tr_after_update_funcionario
AFTER UPDATE ON funcionario
FOR EACH ROW
BEGIN
    INSERT INTO funcionario_log(
        tipo_log,
        funcao_antiga,
        funcao_nova,
        telefone_antigo,
        telefone_novo,
        salario_antigo,
        salario_novo
    )
    VALUES (
        'AU',
        OLD.funcao,
        NEW.funcao,
        OLD.telefone,
        NEW.telefone,
        OLD.salario,
        NEW.salario
    );
END $$

DELIMITER ;

/* =====================================================
   4. ADIÇÃO DE COLUNA SALARIO
   ===================================================== */

ALTER TABLE funcionario 
ADD COLUMN salario FLOAT AFTER telefone;

ALTER TABLE funcionario_log 
ADD COLUMN salario_antigo FLOAT AFTER telefone_novo;

ALTER TABLE funcionario_log 
ADD COLUMN salario_novo FLOAT AFTER salario_antigo;

/* =====================================================
   5. CRIAÇÃO DE VIEWS
   ===================================================== */

CREATE OR REPLACE VIEW vw_rel_cursos_disciplinas_professores AS
SELECT 
    c.idcurso, 
    c.descricao AS curso,
    d.iddisciplina, 
    d.descricao AS disciplina,
    p.idprofessor,
    p.nome AS professor
FROM curso c
LEFT JOIN disciplina d ON c.idcurso = d.fk_idcurso
LEFT JOIN professor p ON d.fk_idprofessor = p.idprofessor;

CREATE OR REPLACE VIEW vw_rel_aluno_curso_contrato AS
SELECT
    a.idaluno,
    a.nome AS aluno,
    c.idcurso,
    c.descricao AS curso,
    co.idcontrato,
    co.fk_data_inscricao_curso,
    co.valor_total_curso
FROM aluno a
LEFT JOIN contrato co ON a.idaluno = co.fk_idaluno
LEFT JOIN curso c ON co.fk_idcurso = c.idcurso;

/* =====================================================
   6. AJUSTES DE DADOS 
   ===================================================== */

-- Normaliza telefones duplicados de aluno
UPDATE telefone SET fk_idaluno = 1 WHERE fk_idaluno = 9;
UPDATE telefone SET fk_idaluno = 2 WHERE fk_idaluno = 7;

/* =====================================================
   FIM DO SCRIPT
   ===================================================== */
