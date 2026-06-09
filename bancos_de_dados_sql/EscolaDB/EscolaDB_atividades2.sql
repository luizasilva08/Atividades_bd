-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

--1. Mostre os alunos que possuem nota maior que 8.
SELECT A.nome, M.nota
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno = M.id_aluno
WHERE M.nota>8;

--2. Liste os alunos que tiveram mais de 5 faltas.
SELECT A.nome, M.faltas
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno = M.id_aluno
WHERE faltas>5;

--3. Exiba os cursos com carga horária igual a 80 horas.
SELECT nome_curso FROM Cursos WHERE carga_horaria = 80;

--4. Mostre os alunos que NÃO moram em São Paulo.
SELECT nome FROM Alunos WHERE NOT cidade='São Paulo'

--5. Liste os alunos cujo nome começa com a letra “A”.
SELECT nome FROM Alunos WHERE nome LIKE 'A%'

--6. Exiba os alunos cujo nome termina com a letra “a”.
SELECT nome FROM Alunos WHERE nome LIKE '%a'

--7. Liste os cursos cujo nome contenha a palavra “Dados”.

SELECT nome_curso FROM Cursos WHERE nome_curso LIKE '%Dados'

--8. Mostre as matrículas com nota entre 7 e 9.

SELECT id_matricula FROM Matriculas WHERE nota BETWEEN 7 AND 9;

--9. Liste os alunos que possuem exatamente 20 anos.
SELECT nome FROM Alunos WHERE idade=20;

--10. Exiba os cursos com carga horária menor ou igual a 60 horas.
SELECT nome_curso FROM Cursos WHERE carga_horaria<=60;