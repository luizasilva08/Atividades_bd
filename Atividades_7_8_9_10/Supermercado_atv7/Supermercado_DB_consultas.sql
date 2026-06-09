-- Active: 1780941733662@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@SupermercadoDB

-- 1. Consultas com SELECT

-- Consulta 1 — Listar todos os produtos
SELECT * FROM Produtos;

-- Consulta 2 — Exibir apenas nome e preço dos produtos
SELECT nome, preco FROM Produtos;

-- Consulta 3 — Mostrar produtos com estoque menor que 50
SELECT nome, quantidade_estoque
FROM Produtos
WHERE quantidade_estoque < 50;

-- Consulta 4 — Listar clientes com mais de 100 pontos
SELECT nome, pontos_fidelidade
FROM Clientes
WHERE pontos_fidelidade > 100;

-- Consulta 5 — Exibir funcionários ordenados por salário
SELECT nome, cargo, salario
FROM Funcionarios
ORDER BY salario DESC;

-- Consulta 6 — Mostrar produtos da categoria Eletrônicos
SELECT *
FROM Produtos
WHERE id_categoria = 5;

-- Consulta 7 — Exibir vendas acima de 100 reais
SELECT *
FROM Vendas
WHERE total > 100;

-- Consulta 8 — Buscar produtos contendo “LG”
SELECT *
FROM Produtos
WHERE nome LIKE '%LG%';

-- Consulta 9 — Mostrar clientes cadastrados em ordem alfabética
SELECT *
FROM Clientes
ORDER BY nome;

-- Consulta 10 — Exibir produtos com preço entre 5 e 100
SELECT nome, preco
FROM Produtos
WHERE preco BETWEEN 5 AND 100;

-- 2. Consultas com JOIN

-- Consulta 1 — Produto e categoria
SELECT Produtos.nome, Categorias.nome
FROM Produtos
JOIN Categorias
ON Produtos.id_categoria = Categorias.id_categoria;

-- Consulta 2 — Produto e fornecedor
SELECT Produtos.nome, Fornecedores.nome
FROM Produtos
JOIN Fornecedores
ON Produtos.id_fornecedor = Fornecedores.id_fornecedor;

-- Consulta 3 — Vendas e clientes
SELECT Vendas.id_venda, Clientes.nome
FROM Vendas
JOIN Clientes
ON Vendas.id_cliente = Clientes.id_cliente;

-- Consulta 4 — Vendas e funcionários
SELECT Vendas.id_venda, Funcionarios.nome
FROM Vendas
JOIN Funcionarios
ON Vendas.id_funcionario = Funcionarios.id_funcionario;

-- Consulta 5 — Produtos e filiais
SELECT Produtos.nome, Filiais.nome
FROM Produtos
JOIN Filiais
ON Produtos.id_filial = Filiais.id_filial;

-- Consulta 6 — Itens vendidos e produtos
SELECT ItensVenda.quantidade, Produtos.nome
FROM ItensVenda
JOIN Produtos
ON ItensVenda.id_produto = Produtos.id_produto;

-- Consulta 7 — Compras e fornecedores
SELECT Compras.id_compra, Fornecedores.nome
FROM Compras
JOIN Fornecedores
ON Compras.id_fornecedor = Fornecedores.id_fornecedor;

-- Consulta 8 — Funcionários e filiais
SELECT Funcionarios.nome, Filiais.nome
FROM Funcionarios
JOIN Filiais
ON Funcionarios.id_filial = Filiais.id_filial;

-- Consulta 9 — Clientes e vendas realizadas
SELECT Clientes.nome, Vendas.total
FROM Clientes
JOIN Vendas
ON Clientes.id_cliente = Vendas.id_cliente;

-- Consulta 10 — Produtos vendidos em cada venda
SELECT Vendas.id_venda, Produtos.nome
FROM ItensVenda
JOIN Produtos
ON ItensVenda.id_produto = Produtos.id_produto
JOIN Vendas
ON ItensVenda.id_venda = Vendas.id_venda;

-- 3. Consultas com GROUP BY

-- Consulta 1 — Quantidade de produtos por categoria
SELECT id_categoria, COUNT(*)
FROM Produtos
GROUP BY id_categoria;

-- Consulta 2 — Total vendido por cliente
SELECT id_cliente, SUM(total)
FROM Vendas
GROUP BY id_cliente;

-- Consulta 3 — Média salarial por cargo
SELECT cargo, AVG(salario)
FROM Funcionarios
GROUP BY cargo;

-- Consulta 4 — Quantidade de funcionários por filial
SELECT id_filial, COUNT(*)
FROM Funcionarios
GROUP BY id_filial;

-- Consulta 5 — Total de vendas por filial
SELECT id_filial, SUM(total)
FROM Vendas
GROUP BY id_filial;

-- Consulta 6 — Quantidade de produtos por fornecedor
SELECT id_fornecedor, COUNT(*)
FROM Produtos
GROUP BY id_fornecedor;

-- Consulta 7 — Total comprado por fornecedor
SELECT id_fornecedor, SUM(total)
FROM Compras
GROUP BY id_fornecedor;

-- Consulta 8 — Média de preços por categoria
SELECT id_categoria, AVG(preco)
FROM Produtos
GROUP BY id_categoria;

-- Consulta 9 — Soma de pontos por clientes
SELECT nome, SUM(pontos_fidelidade)
FROM Clientes
GROUP BY nome;

-- Consulta 10 — Quantidade total vendida por produto
SELECT id_produto, SUM(quantidade)
FROM ItensVenda
GROUP BY id_produto;

-- 4. Funções de Agregação
-- Consulta 1 — Quantidade total de produtos
SELECT COUNT(*) FROM Produtos;

-- Consulta 2 — Soma total do estoque
SELECT SUM(quantidade_estoque)
FROM Produtos;

-- Consulta 3 — Média de preços dos produtos
SELECT AVG(preco)
FROM Produtos;

-- Consulta 4 — Produto mais caro
SELECT MAX(preco)
FROM Produtos;

-- Consulta 5 — Produto mais barato
SELECT MIN(preco)
FROM Produtos;

-- Consulta 6 — Total de vendas realizadas
SELECT COUNT(*)
FROM Vendas;

-- Consulta 7 — Valor total vendido
SELECT SUM(total)
FROM Vendas;

-- Consulta 8 — Média salarial dos funcionários
SELECT AVG(salario)
FROM Funcionarios;

-- Consulta 9 — Maior salário
SELECT MAX(salario)
FROM Funcionarios;

-- Consulta 10 — Menor salário
SELECT MIN(salario)
FROM Funcionarios;

-- 5. Subconsultas (Subqueries)

-- Consulta 1 — Produto mais caro
SELECT *
FROM Produtos
WHERE preco = (
   SELECT MAX(preco)
   FROM Produtos
);

-- Consulta 2 — Produto mais barato
SELECT *
FROM Produtos
WHERE preco = (
   SELECT MIN(preco)
   FROM Produtos
);

-- Consulta 3 — Clientes com pontos acima da média
SELECT *
FROM Clientes
WHERE pontos_fidelidade > (
   SELECT AVG(pontos_fidelidade)
   FROM Clientes
);

-- Consulta 4 — Funcionário com maior salário
SELECT *
FROM Funcionarios
WHERE salario = (
   SELECT MAX(salario)
   FROM Funcionarios
);

-- Consulta 5 — Produtos com estoque abaixo da média
SELECT *
FROM Produtos
WHERE quantidade_estoque < (
   SELECT AVG(quantidade_estoque)
   FROM Produtos
);

-- Consulta 6 — Clientes que realizaram compras
SELECT nome
FROM Clientes
WHERE id_cliente IN (
   SELECT id_cliente
   FROM Vendas
);

-- Consulta 7 — Produtos vendidos
SELECT nome
FROM Produtos
WHERE id_produto IN (
   SELECT id_produto
   FROM ItensVenda
);

-- Consulta 8 — Produtos nunca vendidos
SELECT nome
FROM Produtos
WHERE id_produto NOT IN (
   SELECT id_produto
   FROM ItensVenda
);

-- Consulta 9 — Filial com maior total de vendas
SELECT *
FROM Filiais
WHERE id_filial = (
   SELECT id_filial
   FROM Vendas
   GROUP BY id_filial
   ORDER BY SUM(total) DESC
   LIMIT 1
);

-- Consulta 10 — Produtos acima do preço médio
SELECT nome, preco
FROM Produtos
WHERE preco > (
   SELECT AVG(preco)
   FROM Produtos
);
