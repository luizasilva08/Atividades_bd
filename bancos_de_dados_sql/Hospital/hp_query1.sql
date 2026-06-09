-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@HospitalDB
SELECT id_paciente as paciente,
       data_consulta as data,
       SUM(valor) as total_diario
FROM Consultas
GROUP BY id_paciente,data_consulta;

SELECT id_paciente,
       SUM(valor)
FROM Consultas
WHERE valor>200
GROUP BY id_paciente;

SELECT id_paciente as paciente, sum(valor) as total_valor
FROM Consultas
GROUP BY id_paciente
HAVING sum(valor)>200;

SELECT id_medico,
COUNT(*) AS TotalConsultas
FROM Consultas                   --forma incorreta
WHERE COUNT(*)>5
GROUP BY id_medico;

SELECT id_medico, COUNT(*) AS TotalConsultas
FROM Consultas
GROUP BY id_medico              --forma correta
HAVING COUNT(*)>5;