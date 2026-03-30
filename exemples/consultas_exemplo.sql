/* =====================================================
   EXEMPLOS DE CONSULTAS - SISTEMA UNIVERSIDADE
   ===================================================== */

USE universidade_u;

-- ============================================
-- 1. LISTAR TODOS OS ALUNOS COM SEUS CURSOS
-- ============================================

SELECT 
    a.idaluno,
    a.nome AS aluno,
    c.descricao AS curso
FROM aluno a
LEFT JOIN aluno_curso ac ON a.idaluno = ac.fk_idaluno
LEFT JOIN curso c ON ac.fk_idcurso = c.idcurso
ORDER BY a.nome;

-- ============================================
-- 2. LISTAR ALUNOS COM TELEFONE E ENDEREÇO
-- ============================================

SELECT 
    a.nome,
    t.numero AS telefone,
    t.tipo,
    e.cidade,
    e.estado
FROM aluno a
LEFT JOIN telefone t ON a.idaluno = t.fk_idaluno
LEFT JOIN endereco e ON a.idaluno = e.fk_idaluno;

-- ============================================
-- 3. LISTAR CURSOS COM DISCIPLINAS E PROFESSORES
-- ============================================

SELECT 
    c.descricao AS curso,
    d.descricao AS disciplina,
    p.nome AS professor
FROM curso c
LEFT JOIN disciplina d ON c.idcurso = d.fk_idcurso
LEFT JOIN professor p ON d.fk_idprofessor = p.idprofessor
ORDER BY curso;

-- ============================================
-- 4. TOTAL DE ALUNOS POR CURSO
-- ============================================

SELECT 
    c.descricao AS curso,
    COUNT(ac.fk_idaluno) AS total_alunos
FROM curso c
LEFT JOIN aluno_curso ac ON c.idcurso = ac.fk_idcurso
GROUP BY c.idcurso;

-- ============================================
-- 5. LISTAR CONTRATOS E VALORES
-- ============================================

SELECT 
    a.nome,
    c.descricao AS curso,
    co.valor_total_curso,
    co.numero_parcelas
FROM contrato co
LEFT JOIN aluno a ON co.fk_idaluno = a.idaluno
LEFT JOIN curso c ON co.fk_idcurso = c.idcurso;

-- ============================================
-- 6. LISTAR BOLETOS GERADOS
-- ============================================

SELECT 
    b.idboleto,
    b.data_vencimento,
    b.valor,
    b.numero_parcela,
    a.nome
FROM boleto b
LEFT JOIN contrato co ON b.fk_idcontrato = co.idcontrato
LEFT JOIN aluno a ON co.fk_idaluno = a.idaluno
ORDER BY b.data_vencimento;

-- ============================================
-- 7. FUNCIONÁRIOS E SEUS SUPERVISORES
-- ============================================

SELECT 
    f.nome AS funcionario,
    s.nome AS supervisor
FROM funcionario f
LEFT JOIN funcionario s 
ON f.fk_idfuncionario_supervisor = s.idfuncionario;

-- ============================================
-- 8. LOG DE ALTERAÇÕES DE FUNCIONÁRIOS
-- ============================================

SELECT 
    tipo_log,
    funcao_antiga,
    funcao_nova,
    telefone_antigo,
    telefone_novo,
    data_log
FROM funcionario_log
ORDER BY data_log DESC;

-- ============================================
-- 9. USANDO VIEW (RELATÓRIO COMPLETO)
-- ============================================

SELECT * 
FROM vw_rel_cursos_disciplinas_professores;

-- ============================================
-- 10. USANDO FUNCTION (IDADE DO ALUNO)
-- ============================================

SELECT 
    nome,
    func_idade_aluno(data_nascimento) AS idade
FROM aluno;
