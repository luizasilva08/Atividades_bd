-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

--1. Liste as cidades que possuem mais de 2 alunos.

SELECT COUNT(id_aluno) as Alunos, cidade
FROM Alunos
GROUP BY cidade
HAVING COUNT(id_aluno)>2;

--2. Exiba os cursos cuja média de notas seja maior que 8.
SELECT C.nome_curso, AVG(M.nota) as Media_notas
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso
HAVING AVG(M.nota)>8;

--3. Mostre os cursos que possuem mais de 2 matrículas.
SELECT Cursos.nome_curso, COUNT(Matriculas.id_matricula) as Total_matriculas
FROM Cursos
JOIN Matriculas ON Cursos.id_curso=Matriculas.id_curso 
GROUP BY Cursos.nome_curso
HAVING Total_matriculas>2;

--4. Liste os alunos cuja soma de faltas seja maior que 5.
SELECT A.nome, SUM(M.faltas) as total_faltas
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno=M.id_aluno
GROUP BY A.nome
HAVING total_faltas>5;

--5. Exiba os cursos cuja menor nota seja maior que 6.
SELECT C.nome_curso, MIN(M.nota) as menor_nota
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso
HAVING menor_nota>6;

--6. Mostre os cursos ordenados pela carga horária em ordem decrescente.
SELECT nome_curso, carga_horaria
FROM Cursos
ORDER BY carga_horaria DESC;

--7. Liste os alunos ordenados por idade do maior para o menor.
SELECT nome, idade
FROM Alunos
ORDER BY idade DESC;

--8. Exiba a média de notas por curso ordenada da maior para a menor.
SELECT C.nome_curso, AVG(M.nota) as Media_notas
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
GROUP BY C.nome_curso
ORDER BY Media_notas DESC;

--9. Mostre as cidades ordenadas pela quantidade de alunos.
SELECT cidade, COUNT(id_aluno) as Alunos
FROM Alunos
GROUP BY cidade
ORDER BY Alunos;

--10. Liste os alunos com média de notas maior que 7 ordenados pela média decrescente.
SELECT A.nome, AVG(M.nota) as media_nota
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno=M.id_aluno
GROUP BY A.nome
HAVING media_nota>7
ORDER BY media_nota DESC;