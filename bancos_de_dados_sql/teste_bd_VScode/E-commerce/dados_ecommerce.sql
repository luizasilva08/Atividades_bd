-- Active: 1778695955083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@ecommerce
INSERT INTO categoria (nome, descricao) VALUES 
('Eletrônicos', 'Dispositivos como smartphones, notebooks, e acessórios tech.'),
('Livros', 'Obras literárias físicas de ficção, não ficção e acadêmicos.'),
('Vestuário', 'Roupas, calçados e acessórios de moda masculina e feminina.'),
('Casa e Decoração', 'Móveis, itens decorativos, cama, mesa e banho.'),
('Alimentos e Bebidas', 'Produtos de mercearia, bebidas, doces e lanches rápidos.');

INSERT INTO produto (nome, descricao, preco, estoque, categoria_id) VALUES 
('Smartphone Galaxy S23', 'Celular Samsung com 256GB de armazenamento e 8GB RAM.', 4599.90, 30, 1),
('Notebook Dell Inspiron', 'Notebook com processador Intel Core i7 e 16GB RAM.', 5200.00, 15, 1),
('O Senhor dos Anéis - Volume Único', 'Edição especial de colecionador em capa dura.', 150.50, 50, 2),
('Camisa Polo Azul', 'Camisa polo 100% algodão, tamanho M.', 89.90, 100, 3),
('Tênis Esportivo Running', 'Tênis confortável para corridas e uso diário, tamanho 40.', 299.99, 45, 3),
('Jogo de Lençol King', 'Algodão egípcio 400 fios, cor branca suave.', 350.00, 20, 4),
('Luminária de Mesa Articulada', 'Luminária preta em metal com ajuste de altura e ângulo.', 120.90, 15, 4),
('Café em Grãos Gourmet', 'Café 100% arábica 500g, torra média e notas de chocolate.', 45.00, 100, 5),
('Vinho Tinto Cabernet Sauvignon', 'Garrafa de 750ml, safra 2021, ideal para carnes vermelhas.', 78.50, 40, 5);