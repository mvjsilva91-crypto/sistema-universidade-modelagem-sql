ALTER TABLE aluno_curso
ADD FOREIGN KEY (fk_idaluno) REFERENCES aluno(idaluno),
ADD FOREIGN KEY (fk_idcurso) REFERENCES curso(idcurso);

ALTER TABLE disciplina
ADD FOREIGN KEY (fk_idcurso) REFERENCES curso(idcurso),
ADD FOREIGN KEY (fk_idprofessor) REFERENCES professor(idprofessor);

ALTER TABLE endereco
ADD FOREIGN KEY (fk_idaluno) REFERENCES aluno(idaluno);

ALTER TABLE telefone
ADD FOREIGN KEY (fk_idaluno) REFERENCES aluno(idaluno);

ALTER TABLE funcionario
ADD FOREIGN KEY (fk_idfuncionario_supervisor) REFERENCES funcionario(idfuncionario);

ALTER TABLE projeto_funcionario
ADD FOREIGN KEY (fk_idcodigo) REFERENCES projeto(idcodigo),
ADD FOREIGN KEY (fk_idfuncionario) REFERENCES funcionario(idfuncionario);

ALTER TABLE funcionario_log
ADD FOREIGN KEY (fk_idfuncionario) REFERENCES funcionario(idfuncionario);
