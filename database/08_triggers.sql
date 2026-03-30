delimiter $$

create trigger tr_after_delete_funcionario
after delete on funcionario
for each row
begin
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, telefone_antigo)
	values(null,'AD', old.funcao, old.telefone);
end
$$

create trigger tr_before_update_funcionario
before update on funcionario
for each row
begin
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova)
	values(null,'BU', old.funcao, new.funcao);
end
$$

create trigger tr_after_update_funcionario
after update on funcionario
for each row
begin
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova)
	values(null,'AU', old.funcao, new.funcao);
end
$$

delimiter ;
