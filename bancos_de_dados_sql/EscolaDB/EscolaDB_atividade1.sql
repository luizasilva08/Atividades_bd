-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

--1. Liste todos os alunos cadastrados.
SELECT * FROM Alunos;

--2. Liste apenas os nomes dos alunos.
SELECT nome FROM Alunos;

--3. Exiba todos os cursos cadastrados.
SELECT * FROM Cursos;

--4. Mostre os alunos que moram em São Paulo.
SELECT * FROM Alunos WHERE cidade='São Paulo';

--5. Liste os alunos com idade maior que 20 anos.
SELECT * FROM Alunos WHERE idade>20;

--6. Exiba os cursos com carga horária maior que 50 horas.

SELECT * FROM Cursos WHERE carga_horaria>50;
SELECT nome_curso FROM Cursos WHERE carga_horaria>50;

--7. Mostre os alunos com idade entre 18 e 22 anos.
SELECT * FROM Alunos WHERE idade BETWEEN 18 AND 22;
SELECT nome FROM Alunos WHERE idade BETWEEN 18 AND 22;
SELECT * FROM Alunos WHERE idade>=18 AND idade<=22;

--8. Liste os alunos da cidade de Curitiba.

SELECT nome FROM Alunos WHERE cidade= 'Curitiba';

--9. Exiba os alunos cuja idade seja menor que 21 anos.
SELECT nome FROM Alunos WHERE idade<21;

--10. Liste todas as matrículas cadastradas.
SELECT * FROM Matriculas;

