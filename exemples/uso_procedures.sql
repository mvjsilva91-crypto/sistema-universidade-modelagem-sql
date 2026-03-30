/* =====================================================
   EXEMPLOS DE USO DE PROCEDURES
   ===================================================== */

USE universidade_u;

-- ============================================
-- 1. MÉDIA PONDERADA
-- ============================================

CALL proc_media_ponderada('Marcos', 8, 7, 9, 10);

CALL proc_media_ponderada('Ana', 6, 5, 7, 8);

-- ============================================
-- 2. RESUMO DO SISTEMA
-- ============================================

CALL proc_resumo(@total_prof, @total_alunos);

SELECT 
    @total_prof AS total_professores,
    @total_alunos AS total_alunos;

-- ============================================
-- 3. PROCEDURE COM PARÂMETROS IN / OUT / INOUT
-- ============================================

SET @p1 = 100;
SET @p2 = 'Valor inicial';
SET @p3 = 50.5;

CALL proc_exemplo_parametros(@p1, @p2, @p3);

SELECT @p1, @p2, @p3;

-- ============================================
-- 4. EXEMPLO DE IF/ELSE
-- ============================================

CALL proc_ifelse();

-- ============================================
-- 5. EXEMPLO DE CLASSIFICAÇÃO POR IDADE
-- ============================================

CALL proc_elseif_idade();

-- ============================================
-- 6. GERAR CALENDÁRIO ACADÊMICO
-- ============================================

CALL proc_calendario('2025-01-01', '2025-12-31');

SELECT * FROM calendario WHERE feriado = 'S';

-- ============================================
-- 7. PROCESSAMENTO DE BOLETOS
-- ============================================

CALL proc_boleto();

SELECT * FROM boleto;

-- ============================================
-- 8. EXEMPLO DE LOOP (TABUADA)
-- ============================================

CALL proc_loop();

SELECT * FROM log;

-- ============================================
-- 9. EXEMPLO DE WHILE
-- ============================================

CALL proc_while();

SELECT * FROM log;

-- ============================================
-- 10. EXEMPLO DE REPEAT
-- ============================================

CALL proc_repeat();

SELECT * FROM log;
