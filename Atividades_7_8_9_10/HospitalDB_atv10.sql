-- Active: 1780941733662@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@HospitalDB

-- 1
SELECT nome, cidade 
FROM Hospitais;

-- 2
SELECT nome, crm, salario 
FROM Medicos;

-- 4
SELECT nome, tipo_sanguineo 
FROM Pacientes;

-- 5
SELECT nome, alergias 
FROM Pacientes 
WHERE alergias <> 'Nenhuma' 
  AND alergias IS NOT NULL;

-- 6
SELECT * FROM Consultas 
WHERE data_consulta > '2025-08-02'; 

-- 7 
SELECT * FROM Exames 
WHERE data_exame BETWEEN '2025-08-01' AND '2025-08-05'; -- Substitua pelas datas desejadas

-- 8
SELECT nome, cargo, salario 
FROM Funcionarios 
WHERE salario BETWEEN 2500.00 AND 6000.00;

-- 9
SELECT numero, tipo, capacidade 
FROM Quartos 
WHERE status_quarto = 'Livre';

-- 10
SELECT * FROM Pagamentos 
WHERE forma_pagamento = 'PIX'; -- Substitua pela forma informada (ex: 'Cartão', 'Dinheiro')

-- 11 
SELECT COUNT(*) AS total_pacientes 
FROM Pacientes;

-- 12
SELECT AVG(valor) AS valor_medio_consultas 
FROM Consultas;

-- 13
SELECT MIN(valor) AS menor_valor_consulta 
FROM Consultas;

-- 14
SELECT e.nome AS especialidade, COUNT(m.id_medico) AS quantidade_medicos
FROM Medicos m
JOIN Especialidades e ON m.id_especialidade = e.id_especialidade 
GROUP BY e.nome;

-- 15
SELECT s.nome AS setor, COUNT(f.id_funcionario) AS quantidade_funcionarios
FROM Funcionarios f
JOIN Setores s ON f.id_setor = s.id_setor 
GROUP BY s.nome;

-- 16
SELECT m.nome AS medico, e.nome AS especialidade
FROM Medicos m
JOIN Especialidades e ON m.id_especialidade = e.id_especialidade;

-- 17
SELECT f.nome AS funcionario, h.nome AS hospital
FROM Funcionarios f
JOIN Hospitais h ON f.id_hospital = h.id_hospital;

-- 18
SELECT p.nome AS paciente, c.data_consulta
FROM Pacientes p
JOIN Consultas c ON p.id_paciente = c.id_paciente;

-- 19
SELECT nome, preco 
FROM Medicamentos 
WHERE preco = (SELECT MAX(preco) FROM Medicamentos);

-- 20
SELECT nome, salario 
FROM Medicos 
WHERE salario > (SELECT AVG(salario) FROM Medicos);