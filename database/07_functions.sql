delimiter $$

create function func_data_br(p_data datetime)
returns varchar(20)
deterministic
begin
	return date_format(p_data, '%d/%m/%y');
end
$$

create function func_idade_aluno(p_data datetime)
returns int
deterministic
begin
	return timestampdiff(year,p_data,curdate());
end
$$

create function func_qtde_disciplinas(p_idcurso int)
returns int
begin
	declare qtde int;
    set qtde = (select count(*) from disciplina where fk_idcurso = p_idcurso);
    return qtde;
end
$$

delimiter ;
