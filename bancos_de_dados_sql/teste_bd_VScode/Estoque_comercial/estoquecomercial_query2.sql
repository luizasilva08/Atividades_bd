-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@estoquecomercial
SELECT setorItem, SUM(precoVendaItem) as total_preco
FROM Itens_Estoque
GROUP BY setorItem;

SELECT setorItem, precoVendaItem as preco, estoqueItem as estoque, sum(precoVendaItem * estoqueItem) as valor_total
FROM Itens_Estoque
GROUP BY setorItem, estoqueItem, precoVendaItem
ORDER BY setorItem;

-- SUBCONSULTA
SELECT*FROM Itens_Estoque
WHERE precoVendaItem = (
SELECT MAX(precoVendaItem)     
FROM Itens_Estoque
);

