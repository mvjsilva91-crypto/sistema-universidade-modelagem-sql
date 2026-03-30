create view vw_rel_cursos_disciplinas_professores as
select 
	c.idcurso, 
	c.descricao as curso,
	d.iddisciplina, 
    d.descricao as disciplina,
	p.idprofessor,
    p.nome 
from 
	curso c
left join disciplina d on (c.idcurso = d.fk_idcurso)
left join professor p on (d.fk_idprofessor = p.idprofessor);


create view vw_rel_aluno_curso_contrato as
select
	a.idaluno,
    a.nome as Aluno,
    c.idcurso,
    c.descricao as Curso,
    co.idcontrato,
    co.fk_data_inscricao_curso,
    co.valor_total_curso as Contrato
from 
	aluno a 
left join contrato co on (a.idaluno = co.fk_idaluno)
left join curso c on (co.fk_idcurso = c.idcurso);
