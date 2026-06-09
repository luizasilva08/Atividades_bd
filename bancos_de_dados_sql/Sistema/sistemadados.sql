insert into cliente (nome_cliente, email_cliente)
values
('JOÃO MATOSSO', 'joao@matosso'),
('JORGE MATOSSO', 'jorge@matosso');

-- PRODUTOS
insert into produto (nome_produto, preco_produto)
values
('CAFÉ', 255.00),
('PÃO', 16.76);

-- VENDAS
insert into venda (data_venda, id_cliente)
values
('2025-01-01', 1),
('2024-05-05', 2);

-- ITEM_VENDA
insert into item_venda (id_venda, id_produto, quantidade_item, preco_unitario)
values
(1, 1, 3, 255.00),
(2, 2, 12, 16.76);

