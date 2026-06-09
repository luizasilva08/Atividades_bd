-- Active: 1779906056041@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@EscolaDB

-- BÁSICAS

-- 1. Liste os alunos que possuem a maior idade cadastrada.

SELECT nome FROM Alunos 
WHERE idade = (SELECT MAX(idade) FROM Alunos);

-- 2. Exiba os alunos que possuem idade menor que a média das idades.

SELECT nome FROM Alunos 
WHERE idade < (SELECT AVG(idade) FROM Alunos);