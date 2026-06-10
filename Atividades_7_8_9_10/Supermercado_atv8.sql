-- Active: 1781116803083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@SupermercadoDB

-- SELECTS

-- 1. Mostrar todos os clientes
SELECT * FROM Clientes;

-- 2. Mostrar apenas nome e telefone dos clientes
SELECT nome, telefone 
FROM Clientes;

-- 3. Mostrar todos os produtos
SELECT * FROM Produtos;

-- 4. Mostrar apenas nome e preco dos produtos
SELECT nome, preco 
FROM Produtos;

-- 5. Mostrar todos os funcionarios
SELECT * FROM Funcionarios;

-- 6. Mostrar nome e cargo dos funcionarios
SELECT nome, cargo
FROM Funcionarios;

-- 7. Mostrar todas as vendas
SELECT * FROM Vendas;

-- 8. Mostrar apenas data e total das compras
SELECT data, total 
FROM Compras;

-- 9. Mostrar descricao e preco dos produtos
SELECT descricao, preco 
FROM Produtos;

-- 10. Mostrar todas as filiais
SELECT * FROM Filiais;

-- 11. Mostrar apenas nome do produto e quantidade em estoque da tabela Produtos
SELECT nome, quantidade_estoque 
FROM Produtos;


-- WHERE

-- 1. Mostrar clientes com mais de 100 pontos
SELECT * FROM Clientes 
WHERE pontos_fidelidade > 100;

-- 2. Mostrar produtos com preco maior que 50
SELECT * FROM Produtos 
WHERE preco > 50;

-- 3. Mostrar funcionarios com salario acima de 3000
SELECT * FROM Funcionarios 
WHERE salario > 3000;

-- 4. Mostrar produtos com estoque menor que 10
SELECT * FROM Produtos 
WHERE quantidade_estoque < 10;

-- 5. Mostrar compras realizadas em uma data especifica
SELECT * FROM Compras 
WHERE data = '2025-01-10';

-- 6. Mostrar clientes que possuem telefone cadastrado
SELECT * FROM Clientes 
WHERE telefone IS NOT NULL;

-- 7. Mostrar funcionarios do cargo Caixa
SELECT * FROM Funcionarios 
WHERE cargo = 'Caixa';

-- 8. Mostrar produtos da filial 1
SELECT * FROM Produtos 
WHERE id_filial = 1;

-- 9. Mostrar vendas com total acima de 500
SELECT * FROM Vendas 
WHERE total > 500;

-- 10. Mostrar fornecedores com nome especifico
SELECT * FROM Fornecedores 
WHERE nome = 'Distribuidora Alfa';


-- ORDER BY

-- 1. Mostrar produtos ordenados pelo nome
SELECT * FROM Produtos 
ORDER BY nome ASC;

-- 2. Mostrar produtos do mais caro para o mais barato
SELECT * FROM Produtos 
ORDER BY preco DESC;

-- 3. Mostrar clientes ordenados pelos pontos de fidelidade
SELECT * FROM Clientes 
ORDER BY pontos_fidelidade ASC;

-- 4. Mostrar funcionarios ordenados pelo salario
SELECT * FROM Funcionarios 
ORDER BY salario DESC;

-- 5. Mostrar vendas ordenadas pela data
SELECT * FROM Vendas 
ORDER BY data DESC;

-- 6. Mostrar compras ordenadas pelo total
SELECT * FROM Compras 
ORDER BY total DESC;

-- 7. Mostrar produtos ordenados por estoque
SELECT * FROM Produtos 
ORDER BY quantidade_estoque ASC;

-- 8. Mostrar fornecedores em ordem alfabetica
SELECT * FROM Fornecedores 
ORDER BY nome ASC;

-- 9. Mostrar filiais ordenadas pelo endereco
SELECT * FROM Filiais 
ORDER BY endereco ASC;

-- 10. Mostrar funcionarios ordenados por cargo e nome
SELECT * FROM Funcionarios 
ORDER BY cargo ASC, nome ASC;

-- 11. Mostrar produtos ordenados por categoria e preco
SELECT * FROM Produtos 
ORDER BY id_categoria ASC, preco DESC;


-- GROUP BY 

-- 1. Contar quantos produtos existem em cada categoria
SELECT id_categoria, COUNT(*) AS quantidade_produtos 
FROM Produtos 
GROUP BY id_categoria;

-- 2. Somar o total de vendas por filial
SELECT id_filial, SUM(total) AS soma_total_vendas 
FROM Vendas 
GROUP BY id_filial;

-- 3. Contar quantos funcionarios existem em cada filial
SELECT id_filial, COUNT(*) AS quantidade_funcionarios 
FROM Funcionarios 
GROUP BY id_filial;

-- 4. Mostrar o total de compras por fornecedor
SELECT id_fornecedor, SUM(total) AS soma_total_compras 
FROM Compras 
GROUP BY id_fornecedor;

-- 5. Mostrar a media salarial por cargo
SELECT cargo, AVG(salario) AS media_salarial 
FROM Funcionarios 
GROUP BY cargo;

-- 6. Mostrar quantidade de vendas realizadas por funcionario
SELECT id_funcionario, COUNT(*) AS quantidade_vendas 
FROM Vendas 
GROUP BY id_funcionario;

-- 7. Mostrar quantidade de produtos por fornecedor
SELECT id_fornecedor, COUNT(*) AS quantidade_produtos 
FROM Produtos 
GROUP BY id_fornecedor;

-- 8. Mostrar soma dos pontos de fidelidade dos clientes (por endereco)
SELECT endereco, SUM(pontos_fidelidade) AS soma_pontos
 FROM Clientes 
 GROUP BY endereco;

-- 9. Mostrar quantidade de compras realizadas por filial
SELECT id_filial, COUNT(*) AS quantidade_compras 
FROM Compras 
GROUP BY id_filial;

-- 10. Mostrar o estoque total de produtos por categoria
SELECT id_categoria, SUM(quantidade_estoque) AS estoque_total 
FROM Produtos 
GROUP BY id_categoria;

-- 11. Mostrar o maior salario de cada cargo
SELECT cargo, MAX(salario) AS maior_salario 
FROM Funcionarios 
GROUP BY cargo;


-- HAVING

-- 1. Mostrar categorias com mais de 5 produtos
SELECT id_categoria, COUNT(*) AS quantidade_produtos 
FROM Produtos 
GROUP BY id_categoria 
HAVING COUNT(*) > 5;

-- 2. Mostrar filiais com total de vendas acima de 10000
SELECT id_filial, SUM(total) AS soma_total_vendas 
FROM Vendas 
GROUP BY id_filial 
HAVING SUM(total) > 10000;

-- 3. Mostrar cargos com media salarial acima de 3000
SELECT cargo, AVG(salario) AS media_salarial 
FROM Funcionarios 
GROUP BY cargo 
HAVING AVG(salario) > 3000;

-- 4. Mostrar fornecedores com mais de 10 produtos
SELECT id_fornecedor, COUNT(*) AS quantidade_produtos 
FROM Produtos 
GROUP BY id_fornecedor 
HAVING COUNT(*) > 10;

-- 5. Mostrar funcionarios que realizaram mais de 20 vendas
SELECT id_funcionario, COUNT(*) AS quantidade_vendas 
FROM Vendas 
GROUP BY id_funcionario 
HAVING COUNT(*) > 20;

-- 6. Mostrar filiais com mais de 3 funcionarios
SELECT id_filial, COUNT(*) AS quantidade_funcionarios 
FROM Funcionarios 
GROUP BY id_filial 
HAVING COUNT(*) > 3;

-- 7. Mostrar categorias com estoque total acima de 500
SELECT id_categoria, SUM(quantidade_estoque) AS soma_estoque 
FROM Produtos 
GROUP BY id_categoria 
HAVING SUM(quantidade_estoque) > 500;

-- 8. Mostrar fornecedores cujo total de compras seja maior que 5000
SELECT id_fornecedor, SUM(total) AS soma_total_compras 
FROM Compras 
GROUP BY id_fornecedor 
HAVING SUM(total) > 5000;

-- 9. Mostrar datas com mais de 10 vendas
SELECT data, COUNT(*) AS quantidade_vendas 
FROM Vendas 
GROUP BY data 
HAVING COUNT(*) > 10;

-- 10. Mostrar clientes com mais de 200 pontos de fidelidade
SELECT endereco, SUM(pontos_fidelidade) AS soma_pontos 
FROM Clientes 
GROUP BY endereco 
HAVING SUM(pontos_fidelidade) > 200;

-- 11. Mostrar cargos cujo maior salario seja superior a 7000
SELECT cargo, MAX(salario) AS maior_salario 
FROM Funcionarios
 GROUP BY cargo 
 HAVING MAX(salario) > 7000;


-- JOINS

-- 1. Mostrar produtos e suas categorias
SELECT P.nome, C.nome AS nome_categoria 
FROM Produtos as P 
JOIN Categorias AS C ON P.id_categoria = C.id_categoria;

-- 2. Mostrar produtos e seus fornecedores
SELECT P.nome AS nome_produto, F.nome AS nome_fornecedor 
FROM Produtos AS P 
JOIN Fornecedores AS F ON P.id_fornecedor = F.id_fornecedor;

-- 3. Mostrar funcionarios e suas filiais
SELECT Fu.nome AS nome_funcionario, Fi.nome AS nome_filial 
FROM Funcionarios AS Fu
JOIN Filiais AS Fi ON Fu.id_filial = Fi.id_filial;

-- 4. Mostrar vendas e nomes dos clientes
SELECT V.id_venda, V.data, c.nome 
FROM Vendas AS V
JOIN Clientes AS C ON v.id_cliente = c.id_cliente;

-- 5. Mostrar compras e fornecedores
SELECT C.id_compra, C.data, F.nome 
FROM Compras AS C
JOIN Fornecedores AS F ON C.id_fornecedor = F.id_fornecedor;

-- 6. Mostrar itens das vendas com nomes dos produtos
SELECT IV.id_venda, P.nome AS nome_produto, IV.quantidade, IV.subtotal 
FROM ItensVenda AS IV
JOIN Produtos AS P ON IV.id_produto = P.id_produto;

-- 7. Mostrar produtos e suas filiais
SELECT P.nome AS nome_produto, F.nome AS nome_filial 
FROM Produtos AS P 
JOIN Filiais AS F ON P.id_filial = F.id_filial;

-- 8. Mostrar vendas e funcionarios responsaveis
SELECT V.id_venda, F.nome AS nome_funcionario 
FROM Vendas AS V
JOIN Funcionarios AS F ON V.id_funcionario = F.id_funcionario;

-- 9. Mostrar compras e filiais
SELECT C.id_compra, F.nome, c.total 
FROM Compras AS C
JOIN Filiais AS F ON C.id_filial = F.id_filial;

-- 10. Mostrar clientes e suas vendas
SELECT C.nome, V.id_venda, V.total 
FROM Clientes AS C 
JOIN Vendas AS V ON C.id_cliente = V.id_cliente;

-- 11. Mostrar detalhes completos das vendas
SELECT V.id_venda, C.nome AS nome_cliente, F.nome AS nome_funcionario, Fi.nome AS nome_filial, V.total 
FROM Vendas AS V
JOIN Clientes AS C ON V.id_cliente = C.id_cliente
JOIN Funcionarios AS F ON V.id_funcionario = F.id_funcionario
JOIN Filiais AS Fi ON V.id_filial = Fi.id_filial;