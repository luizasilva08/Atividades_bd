-- Active: 1778695955083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@estoquecomercial
SELECT setorItem 
FROM Itens_Estoque
WHERE descricaoItem = 'Iogurte Natural';

SELECT descricaoItem, precoVendaItem 
FROM Itens_Estoque
WHERE descricaoItem = 'Iogurte Natural';

SELECT descricaoItem, precoVendaItem, setorItem
FROM Itens_Estoque
WHERE descricaoItem <> 'Iogurte Natural';

SELECT precoVendaItem, estoqueItem
FROM Itens_Estoque
WHERE descricaoItem is not null;

SELECT descricaoItem, setorItem
FROM Itens_Estoque
WHERE idItem = 1 or precoVendaItem > 30;

SELECT descricaoItem
FROM Itens_Estoque
WHERE NOT precoVendaItem = 7.50

SELECT * FROM tabela WHERE coluna BETWEEN valor1 AND valor2;

SELECT descricaoItem
FROM Itens_Estoque
WHERE precoVendaItem BETWEEN 1.00 AND 7.50;

SELECT*FROM Itens_Estoque
WHERE setorItem IN ('Limpeza','Bebidas','Laticínios');

SELECT precoVendaItem, setorItem
FROM Itens_Estoque
WHERE setorItem IN ('CAMABANHO', 'LIMPEZA', 'PRAIA', 'BEBIDAS', 'LATICÍNIOS', 'ALIMENTOS')
ORDER BY precoVendaItem, setorItem DESC;


SELECT*FROM Itens_Estoque
WHERE setorItem NOT IN ('Limpeza','Bebidas','Laticínios');

SELECT * FROM Itens_Estoque
WHERE descricaoItem LIKE'%Tom%';

SELECT * FROM Itens_Estoque
WHERE descricaoItem LIKE'%ão%';

SELECT (precoVendaItem * estoqueItem) AS Total
FROM Itens_Estoque;
SELECT (precoVendaItem / estoqueItem) AS Total
FROM Itens_Estoque;
SELECT (precoVendaItem - estoqueItem) AS Total
FROM Itens_Estoque;
SELECT (precoVendaItem + estoqueItem) AS Total
FROM Itens_Estoque;

SELECT (precoVendaItem*1.15)AS Preco_Reajustado
FROM Itens_Estoque;

set @minha_idade = 25;
set @nome_produto = 'pc';
SELECT (precoVendaItem * @minha_idade)AS Preco_Reajustado
FROM Itens_Estoque;

SELECT * FROM Itens_Estoque
ORDER BY descricaoItem, setorItem;

SELECT COUNT(descricaoItem)
FROM Itens_Estoque
WHERE descricaoItem LIKE'%o%';

SELECT AVG(precoVendaItem)
FROM Itens_Estoque;

SELECT SUM(estoqueItem)
FROM Itens_Estoque;

SELECT MIN(precoVendaItem)
FROM Itens_Estoque;

SELECT MAX(precoVendaItem)
FROM Itens_Estoque;

SELECT SUM(precoVendaItem * estoqueItem)AS Valor_Total_Estoque
FROM Itens_Estoque;

-- 1) Verificar quantidade de itens por setor;
-- 2) Verificar média valor produto por setor;
-- 3) Verificar valor min e max por setor;

SELECT SUM(estoqueItem)
FROM Itens_Estoque
WHERE setorItem = 'Alimentos';

SELECT setorItem, SUM(estoqueItem)
FROM Itens_Estoque
GROUP BY setorItem;

SELECT setorItem, AVG(precoVendaItem)
FROM Itens_Estoque
GROUP BY setorItem;

SELECT setorItem, MIN(precoVendaItem), MAX(precoVendaItem)
FROM Itens_Estoque
GROUP BY setorItem;

-----------------------------
SELECT setorItem, count(*) as QTD
FROM Itens_Estoque
GROUP BY setorItem;

SELECT setorItem, SUM(precoVendaItem)
FROM Itens_Estoque
GROUP BY setorItem;

-- Resolução

-- 1)
SELECT setorItem, count(setorItem) as qtd
FROM Itens_Estoque 
GROUP BY setorItem;

-- 2)
SELECT setorItem, AVG(precoVendaItem) as media
FROM Itens_Estoque
GROUP BY setorItem;

-- 3)
SELECT setorItem, MIN(estoqueItem) as MIN, MAX(precoVendaItem) as max
FROM Itens_Estoque
GROUP BY setorItem;