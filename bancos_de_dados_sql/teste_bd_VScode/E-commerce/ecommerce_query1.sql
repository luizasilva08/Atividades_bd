-- Active: 1778695955083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@ecommerce
select * from categoria limit 5;

-- SINTAXE ATUAL
UPDATE nome_tabela
SET
coluna1 = valor1,
-- coluna2=valor2
WHERE condição;

UPDATE produto
SET categoria_id = 1
WHERE id = 1;
SELECT*FROM produto

UPDATE produto
SET categoria_id=2
WHERE nome LIKE'%';

UPDATE produto
SET categoria_id=3
WHERE preco>=500;

UPDATE produto
SET estoque = estoque + 30
WHERE id = 1;

UPDATE produto
SET
    nome = 'PC usado - notebook',
    descricao='Notebook com SSD e 16GB de RAM',
    estoque=15,
    categoria_id = 1
WHERE id=4;

SELECT*FROM produto;

DELETE FROM nome_da_tabela WHERE condição;

DELETE FROM produto WHERE id=1;

INSERT INTO produto()
VALUES (1, 'telefoneX', 'telefone legal',50.00,200,1)

DELETE FROM produto 
WHERE nome = 'telefoneX' AND id = 1;
DELETE FROM produto 
WHERE nome = 'telefoneX' OR id = 1;
