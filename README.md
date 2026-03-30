# 🎓 University Database System

Projeto de banco de dados completo para gerenciamento de uma universidade, desenvolvido utilizando MySQL.

---

## 📌 Sobre o Projeto

Este projeto simula um sistema acadêmico com controle de:

* Alunos
* Cursos
* Disciplinas
* Professores
* Matrículas
* Contratos financeiros
* Geração de boletos

Além disso, o projeto inclui recursos avançados como:

* Procedures
* Functions
* Triggers
* Views
* Queries complexas com JOIN

---

## 🧱 Estrutura do Banco de Dados

O banco foi modelado utilizando um modelo relacional com as principais entidades:

* Aluno
* Curso
* Disciplina
* Professor
* Contrato
* Boleto

---

## 🔗 Relacionamentos

* Um aluno pode se inscrever em vários cursos
* Um curso pode possuir várias disciplinas
* Cada disciplina pode ter um professor
* Um contrato gera múltiplos boletos
* Relacionamento N:N entre aluno e curso (tabela `aluno_curso`)

---

## 📊 Diagrama do Banco

![Diagrama](docs/diagrama.png)

---

## ⚙️ Funcionalidades Implementadas

* Cadastro de alunos, cursos e professores
* Matrícula de alunos em cursos
* Associação de disciplinas a cursos
* Geração automática de contratos
* Geração de boletos via procedure
* Auditoria de dados com triggers

---

## 🛠️ Tecnologias Utilizadas

* MySQL
* Modelagem com brModelo

---

## 📁 Estrutura do Projeto

```
database/   -> Scripts SQL (estrutura, inserts, procedures, etc)
queries/    -> Consultas SQL de exemplo
docs/       -> Documentação e diagrama
```

---

## 🚀 Como Executar

1. Execute o arquivo `schema.sql`
2. Execute o arquivo `inserts.sql`
3. Execute procedures, functions, triggers e views
4. Utilize os arquivos em `queries/` para testes

---

## 📈 Possíveis Melhorias

* Criar API (Node.js ou PHP)
* Integrar com Power BI
* Criar interface web
* Adicionar autenticação de usuários

---

## 👨‍💻 Autor

Projeto desenvolvido para fins de estudo e portfólio.
