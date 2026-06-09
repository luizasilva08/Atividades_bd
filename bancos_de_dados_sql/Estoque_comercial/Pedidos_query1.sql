-- Active: 1779906056041@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@estoquecomercial

USE estoquecomercial;
CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT,
    idItem INT,
    quantidadeComprada INT,
    valorTotal DECIMAL(9 , 2 ),
    dataPedido DATE,
    PRIMARY KEY (idPedido)
);

INSERT INTO Pedidos
(idItem, quantidadeComprada, valorTotal, dataPedido)
VALUES
(2,12,5.20,'2023-11-10'),
(2,20,5.20,'2023-06-15'),
(1,5,7.50,'2023-08-01');

SELECT*FROM Pedidos;

----------------------------------------------

-- SUBQUERYS COMO FILTRO DE UMA CONSULTA

-- SUBQUERY = substitui aquilo que será comparado

SELECT*FROM Itens_Estoque
WHERE precoVendaItem = (
SELECT MAX(precoVendaItem)
FROM Itens_Estoque
);

-- Retorna todas as informações + o valors
SELECT * FROM Itens_Estoque
WHERE precoVendaItem = (
SELECT MAX(precoVendaItem)
FROM Itens_Estoque
WHERE precoVendaItem = 7.50
);

-- Retorna apenas o valor
SELECT precoVendaItem
FROM Itens_Estoque
WHERE precoVendaItem = 7.50;

--------------------------------

SELECT * FROM Itens_Estoque
WHERE precoVendaItem <> (
SELECT MAX(precoVendaItem)
FROM Itens_Estoque
);

-- Subquerys que apenas retorna 1 valor:

SELECT * FROM Itens_Estoque
WHERE setorItem = (
    SELECT setorItem
    FROM Itens_Estoque
    WHERE setorItem IN ('Bebidas')
);

-- Subquerys apenas retornam mais valores se tiver IN na query exterior:
SELECT descricaoItem
FROM Itens_Estoque
WHERE idItem IN (
SELECT idItem
FROM Itens_Estoque
WHERE idItem>=2
);

SELECT * FROM Itens_Estoque
WHERE setorItem IN (
    SELECT setorItem
    FROM Itens_Estoque
    WHERE setorItem IN ('Bebidas', 'Alimentos')
);

-- SUBCONSULTA COMO UMA NOVA COLUNA DA CONSULTA

-- Transforma na tabela Total_Comprado
SELECT I.descricaoItem,
(
SELECT SUM(P.quantidadeComprada * P.valorTotal)
FROM Pedidos AS P
WHERE P.idItem= I.idItem
)
AS Total_Comprado
FROM Itens_Estoque AS I;

SELECT descricaoitem
FROM Itens_Estoque;

SELECT SUM(P.quantidadeComprada * P.valorTotal)
FROM Pedidos AS P;