-- Active: 1779906056041@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@HospitalDB
SELECT * FROM Pacientes
WHERE tipo_sanguineo = 'B-';

SELECT Medicos.nome, Medicos.crm, Especialidades.nome, Hospitais.nome, COUNT(Consultas.id_consulta) as Total_consultas
FROM Medicos, Especialidades, Hospitais, Consultas
WHERE Medicos.id_especialidade = Especialidades.id_especialidade 
AND Medicos.id_hospital = Hospitais.id_hospital
AND Consultas.id_medico = Medicos.id_medico
AND Medicos.id_hospital = 1
GROUP BY Medicos.id_medico;

-- Luíza

SELECT M.nome, M.email, M.telefone, E.nome as especialidade, H.nome as Hospital, COUNT(Exames.id_exame) as Exames_solicitados
FROM Medicos as M
JOIN Especialidades AS E ON M.id_especialidade = E.id_especialidade
JOIN Hospitais AS H ON M.id_hospital = H.id_hospital
JOIN Exames ON M.id_medico = Exames.id_medico
GROUP BY M.id_medico;

-- Amanda

SELECT M.nome,P.nome,C.data_consulta
FROM Medicos AS M, Pacientes AS P, Consultas AS C
WHERE C.id_medico = M.id_medico
AND C.id_paciente = P.id_paciente;

-- Ana

select M.nome,
    M.salario,
    M.telefone,
    E.nome as especialidade,
    H.nome as hospital
from Medicos as M
join Especialidades as E
on M.id_especialidade = E.id_especialidade
join Hospitais as H
on M.id_hospital = H.id_hospital;

-- Juliana

SELECT M.nome, M.email, E.nome, COUNT(C.id_consulta), M.salario
FROM Medicos AS M 
JOIN Especialidades AS E 
ON M.id_especialidade = E.id_especialidade
JOIN Consultas AS C 
ON M.id_medico = C.id_medico
GROUP BY M.id_medico;

