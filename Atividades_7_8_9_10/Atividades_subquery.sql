-- Active: 1780941733662@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

-- BÁSICAS

-- 1. Liste os alunos que possuem a maior idade cadastrada.

SELECT nome 
FROM Alunos 
WHERE idade = (SELECT MAX(idade) FROM Alunos);

-- 2. Exiba os alunos que possuem idade menor que a média das idades.

SELECT nome 
FROM Alunos 
WHERE idade < (SELECT AVG(idade) FROM Alunos);

-- 3. Mostre os cursos que possuem a maior carga horária.

SELECT nome_curso 
FROM Cursos 
WHERE carga_horaria = (SELECT MAX(carga_horaria) FROM Cursos);

-- 4. Liste os alunos que possuem nota igual à maior nota registrada nas matrículas.

SELECT A.nome
FROM Alunos as A
JOIN Matriculas as M ON M.id_aluno = A.id_aluno
WHERE M.nota = (SELECT MAX(nota) FROM Matriculas);

-- 5. Exiba os alunos que possuem nota menor que a média geral das notas.

SELECT A.nome
FROM Alunos as A
JOIN Matriculas as M ON M.id_aluno = A.id_aluno
WHERE M.nota < (SELECT AVG(nota) FROM Matriculas);

-- 6. Mostre os cursos cuja carga horária seja maior que a média das cargas horárias.

SELECT nome_curso
FROM Cursos 
WHERE carga_horaria > (SELECT AVG(carga_horaria) FROM Cursos);

-- 7. Liste os alunos que possuem exatamente a menor idade cadastrada.

SELECT nome 
FROM Alunos 
WHERE idade = (SELECT MIN(idade) FROM Alunos);

-- 8. Exiba as matrículas cuja quantidade de faltas seja maior que a média de faltas.

SELECT id_matricula
FROM Matriculas
WHERE faltas > (SELECT AVG(faltas) FROM Matriculas);

-- 9. Mostre os cursos que possuem carga horária diferente da maior carga horária.

SELECT nome_curso
FROM Cursos 
WHERE carga_horaria <> (SELECT MAX(carga_horaria) FROM Cursos);

-- 10. Liste os alunos que possuem nota igual à menor nota registrada.

SELECT A.nome
FROM Alunos as A
JOIN Matriculas as M ON M.id_aluno = A.id_aluno
WHERE M.nota = (SELECT MIN(nota) FROM Matriculas);

-- INTERMEDIÁRIAS

-- 1. Liste os nomes dos alunos que possuem matrícula cadastrada.

SELECT nome 
FROM Alunos 
WHERE id_aluno IN (SELECT id_matricula FROM Matriculas);

-- 2. Exiba os cursos que possuem alunos matriculados.

SELECT nome_curso
FROM Cursos 
WHERE id_curso IN (SELECT id_curso FROM Matriculas);

-- 3. Mostre os alunos que estão matriculados no curso “Python”.

SELECT nome 
FROM Alunos 
WHERE id_aluno IN (SELECT id_matricula FROM Matriculas WHERE id_curso = 1);

-- 4. Liste os alunos matriculados em cursos com carga horária maior que 60 horas.

SELECT nome 
FROM Alunos 
WHERE id_aluno IN (
    SELECT id_aluno 
    FROM Matriculas as M 
    JOIN Cursos as C ON M.id_curso = C.id_curso
    WHERE C.carga_horaria>60 );

-- 5. Exiba os cursos nos quais existem alunos com nota maior que 8.

SELECT nome_curso 
FROM Cursos 
WHERE id_curso IN (SELECT id_curso FROM Matriculas WHERE nota>8);

-- 6. Mostre os alunos que possuem mais de uma matrícula.

SELECT nome
FROM Alunos 
WHERE id_aluno IN (
    SELECT id_aluno
    FROM Matriculas 
    GROUP BY id_aluno
    HAVING COUNT(id_matricula) > 1);

-- 7. Liste os cursos que NÃO possuem matrículas cadastradas.

SELECT nome_curso
FROM Cursos 
WHERE id_curso NOT IN (SELECT id_curso FROM Matriculas);

-- 8. Exiba os alunos que possuem faltas maiores que 5 em alguma matrícula.

SELECT nome 
FROM Alunos 
WHERE id_aluno IN (
    SELECT id_aluno
    FROM Matriculas 
    GROUP BY id_aluno
    HAVING SUM(faltas)>5
);


-- 9. Mostre os cursos frequentados por alunos da cidade de Curitiba.

SELECT nome_curso 
FROM Cursos as C
JOIN Matriculas as M ON C.id_curso=M.id_curso
WHERE M.id_aluno IN
 ( 
    SELECT id_aluno
    FROM Alunos
    WHERE cidade='Curitiba'
);

-- 10. Liste os alunos matriculados no curso com maior carga horária.

SELECT A.nome 
FROM Alunos as A
JOIN Matriculas as M ON A.id_aluno=M.id_aluno
JOIN Cursos as C ON M.id_curso=C.id_curso
WHERE C.carga_horaria IN (
   SELECT MAX(carga_horaria)
   FROM Cursos
);

-- AVANÇADAS

-- 1. Exiba os alunos cuja idade seja maior que a média de idade dos alunos de São Paulo.

SELECT nome
FROM Alunos
WHERE idade > (SELECT AVG(idade) FROM Alunos WHERE cidade='São Paulo');

-- 2. Liste os cursos cuja média de notas seja maior que a média geral das notas.
select nome_curso, avg(M.nota) as media from Cursos as C
join Matriculas as M on M.id_curso = C.id_curso
group by M.id_curso, C.nome_curso
having avg(M.nota) > (select avg(nota) from Matriculas);

-- 3 Mostre os alunos cuja soma de faltas seja maior que a média total de faltas.
select A.nome, sum(M.faltas) as faltas from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
group by A.id_aluno, A.nome
having sum(M.faltas) > (select avg(faltas) from Matriculas);
select avg(faltas) from Matriculas;

-- 4 Exiba os cursos cuja maior nota registrada seja igual à maior nota do sistema.
select C.nome_curso, max(M.nota) as maior_nota from Cursos as C
join Matriculas as M on C.id_curso = M.id_curso 
group by C.nome_curso
having max(M.nota) = (select max(nota) from Matriculas);

-- 5 Liste os alunos cuja média de notas seja menor que a média geral dos alunos.
select A.nome, avg(M.nota) as media from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
group by A.nome
having avg(M.nota) < (select avg(nota) from Matriculas);