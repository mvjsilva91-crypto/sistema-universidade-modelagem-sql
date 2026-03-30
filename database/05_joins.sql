############### LEFT JOIN ###############

select
    *
from
     aluno
left join
     telefone on ( aluno.idaluno = telefone.fk_idaluno)
where
     sexo = 'F';

select
     *
from
    curso
left join
     disciplina on ( curso.idcurso = disciplina.fk_idcurso)
left join
     professor on (disciplina.fk_idprofessor = professor.idprofessor)
where
     idcurso = 1;

############### LEFT JOIN COM APELIDOS ###############

select
     c.idcurso,
     c.descricao as Curso,
     d.iddisciplina,
     d.descricao as Disciplina,
     p.idprofessor,
     p.nome as Professor,
     now() as Data_Atual
from 
     curso as c
left join
     disciplina as d on (c.idcurso = d.fk_idcurso)
left join 
     professor as p on (d.fk_idprofessor = p.idprofessor)
where 
    idcurso = 1;

############### RIGHT JOIN ###############

select * from curso c
right join disciplina d on (c.idcurso = d.fk_idcurso);

select * from disciplina d
right join curso c on (c.idcurso=d.fk_idcurso);

############### INNER JOIN ###############

select * from disciplina as d
inner join professor as p on (d.fk_idprofessor=p.idprofessor);
