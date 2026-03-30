delimiter $$

create procedure fks()
begin
SELECT
    table_name,
    constraint_name,
    column_name,
    referenced_table_name,
    referenced_column_name
FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL
AND table_schema = DATABASE();
end
$$

create procedure proc_media_ponderada(
	in nome varchar (100),
    in p1 float,
    in p2 float,
    in p3 float,
    in p4 float
)
begin
	select
        nome,
        round((((p1*2)+(p2*2)+(p3*3)+(p4*3))/10),1) as media;
end
$$

create procedure proc_resumo(out total_professores int, out total_alunos int)
begin
    select count(*) into total_professores from professor;
    select count(*) into total_alunos from aluno;
end
$$

delimiter ;
