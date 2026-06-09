-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

--1. Mostre quantos alunos existem em cada cidade.
SELECT COUNT(id_aluno) as Alunos, cidade
FROM Alunos
GROUP BY cidade;

--2. Exiba a média de idade dos alunos agrupada por cidade.
SELECT cidade, AVG(idade) as media_idade
FROM Alunos
GROUP BY cidade;

--3. Mostre a quantidade de matrículas por curso.      ->Luiza
SELECT Cursos.nome_curso, COUNT(Matriculas.id_matricula) as Total_matriculas
FROM Cursos
JOIN Matriculas ON Cursos.id_curso=Matriculas.id_curso 
GROUP BY Cursos.nome_curso;

--4. Exiba a média das notas por curso.                ->Luiza
SELECT C.nome_curso, AVG(M.nota) as Media_notas
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso;

--5. Mostre o total de faltas agrupado por curso.
SELECT C.nome_curso, SUM(M.faltas) as faltas_total
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso;

--6. Liste a maior nota obtida em cada curso.
SELECT C.nome_curso, MAX(M.nota) as maior_nota
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso;

--7. Exiba a menor nota registrada em cada curso.
SELECT C.nome_curso, MIN(M.nota) as menor_nota
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso;

--8. Mostre a soma total das faltas agrupadas por aluno.
SELECT A.nome, SUM(M.faltas) as total_faltas
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno=M.id_aluno
GROUP BY A.nome;

--9. Exiba a média de notas agrupada por aluno.
SELECT A.nome, AVG(M.nota) as media_nota
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno=M.id_aluno
GROUP BY A.nome;

--10. Mostre quantos alunos existem em cada faixa etária.
SELECT COUNT(nome), idade as faixa_etaria
FROM Alunos
GROUP BY idade;
