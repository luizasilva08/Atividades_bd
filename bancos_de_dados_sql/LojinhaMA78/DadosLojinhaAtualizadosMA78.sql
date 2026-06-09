#populando meu banco de dados
#lojinha MA 78

#SINTAXE - comando INSERT INTO
-- populando cliente

/*insert into cliente(em ordem o nome das colunas) values
(valores atribuidos a cada registro, em ordem),
(),
(); */

/*insert into cliente(nome_cliente,
 sobrenome_cliente, cpf_cliente, telefone_cliente,
 email_cliente, cidade_cliente, cep_cliente)
values
('Virginia', 'do Sul', '12345678901', '40028922', 'virginia@hotmail.com','eua','1234');*/

-- 1. Inserindo Clientes
INSERT INTO cliente (nome_cliente, sobrenome_cliente, cpf_cliente, telefone_cliente, email_cliente, cidade_cliente, cep_cliente) VALUES
('Ana', 'Souza', '11122233344', '11988887777', 'ana.souza@email.com', 'São Paulo', '01001-000'),
('Carlos', 'Oliveira', '22233344455', '21977776666', 'carlos.oli@email.com', 'Rio de Janeiro', '20040-002'),
('Mariana', 'Silva', '33344455566', '31966665555', 'mariana.silva@email.com', 'Belo Horizonte', '30110-010'),
('Roberto', 'Almeida', '44455566677', '41955554444', 'roberto.almeida@email.com', 'Curitiba', '80010-010'),
('Fernanda', 'Costa', '55566677788', '51944443333', 'fernanda.costa@email.com', 'Porto Alegre', '90010-190');

-- 2. Inserindo Produtos (Atenção: DECIMAL(5,2) suporta até 999.99)
INSERT INTO produto (nome_produto, descricao_produto, preco_produto, categoria_produto, marca_produto, codigo_barras, data_validade_produto, peso_produto, status_produto) VALUES
('Arroz Branco 5kg', 'Arroz branco tipo 1', 25.50, 'Alimentos', 'Tio João', '7891234567890', '2026-12-31', 5.00, 'disponivel'),
('Feijão Carioca 1kg', 'Feijão carioca tipo 1', 8.90, 'Alimentos', 'Camil', '7891234567891', '2026-10-15', 1.00, 'disponivel'),
('Óleo de Soja 900ml', 'Óleo de soja refinado', 6.50, 'Alimentos', 'Liza', '7891234567892', '2026-08-20', 0.90, 'disponivel'),
('Café Torrado 500g', 'Café tradicional', 15.90, 'Bebidas', 'Pilão', '7891234567893', '2026-11-01', 0.50, 'disponivel'),
('Sabão em Pó 1kg', 'Sabão em pó limpeza profunda', 12.30, 'Limpeza', 'Omo', '7891234567894', '2028-01-01', 1.00, 'disponivel');

-- 3. Inserindo Fornecedores
INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor, telefone_fornecedor, email_fornecedor, status_fornecedor) VALUES
('Distribuidora Alimentos S.A.', '11222333000199', '1133334444', 'vendas@distribuidora.com.br', 'ativo'),
('Atacadão de Limpeza', '44555666000188', '1144445555', 'contato@atacadaolimpeza.com', 'ativo'),
('Armazém Geral Ltda', '77888999000177', '2133332222', 'comercial@armazemgeral.com', 'ativo'),
('Bebidas Premium BR', '10200300000166', '3133331111', 'pedidos@bebidaspremium.com', 'inativo'),
('Comercial Sul', '40500600000155', '4133330000', 'atendimento@comercialsul.com', 'ativo');

-- 4. Inserindo Vendas
INSERT INTO venda (data_hora_venda, valor_total, forma_pagamento, desconto_venda, id_cliente_na_tabela_venda, status_venda, observacoes_venda, caixa_venda) VALUES
('2026-04-20 10:30:00', 34.40, 'Cartão de Crédito', 0.00, 1, 'Concluída', 'Cliente solicitou nota fiscal paulista', 1),
('2026-04-20 11:15:00', 44.80, 'PIX', 5.00, 2, 'Concluída', 'Desconto aplicado por pagamento à vista', 2),
('2026-04-21 09:00:00', 6.50, 'Dinheiro', 0.00, 3, 'Concluída', 'Sem troco', 1),
('2026-04-21 14:20:00', 28.20, 'Cartão de Débito', 0.00, 4, 'Concluída', '', 3),
('2026-04-22 16:45:00', 51.00, 'Cartão de Crédito', 0.00, 5, 'Concluída', 'Entrega a domicílio agendada', 2);

-- 5. Inserindo Itens de Venda (Respeitando os subtotais e as chaves únicas)
INSERT INTO item_venda (id_venda, id_produto, quantidade_item, preco_item, subtotal_item, imposto_item, observacao_item) VALUES
-- Venda 1: 1 Arroz (25.50) + 1 Feijão (8.90) = 34.40
(1, 1, 1, 25.50, 25.50, 2.50, 'Nenhuma'),
(1, 2, 1, 8.90, 8.90, 0.89, 'Nenhuma'),
-- Venda 2: 2 Arroz (50.80) - desconto (5.00 no total) -> Não afeta o item, mas o total bate (49.80 subtotal)
(2, 1, 2, 25.50, 51.00, 5.00, 'Nenhuma'), 
-- Venda 3: 1 Óleo de Soja = 6.50
(3, 3, 1, 6.50, 6.50, 0.65, 'Nenhuma'),
-- Venda 4: 1 Café (15.90) + 1 Sabão (12.30) = 28.20
(4, 4, 1, 15.90, 15.90, 1.59, 'Nenhuma'),
(4, 5, 1, 12.30, 12.30, 1.23, 'Nenhuma'),
-- Venda 5: 2 Arroz (25.50 x 2) = 51.00
(5, 1, 2, 25.50, 51.00, 5.10, 'Lote específico exigido');

-- 6. Inserindo Estoque
INSERT INTO estoque (id_produto, quantidade_estoque, quantidade_minima_estoque, localizacao_estoque, data_hora_entrada, data_hora_saida, lote, validade, status_estoque) VALUES
(1, 150, 20, 'Corredor 1, Prateleira A', '2026-04-01 08:00:00', '2026-04-20 18:00:00', 'Lote2026A', '2026-12-31', 'Regular'),
(2, 200, 50, 'Corredor 1, Prateleira B', '2026-04-02 09:30:00', '2026-04-20 18:00:00', 'Lote2026B', '2026-10-15', 'Regular'),
(3, 80, 30, 'Corredor 2, Prateleira A', '2026-04-05 14:00:00', '2026-04-21 18:00:00', 'Lote2026C', '2026-08-20', 'Alerta Baixo'),
(4, 120, 25, 'Corredor 3, Prateleira C', '2026-04-10 10:15:00', '2026-04-21 18:00:00', 'Lote2026D', '2026-11-01', 'Regular'),
(5, 300, 40, 'Corredor 5, Prateleira A', '2026-04-12 11:45:00', '2026-04-21 18:00:00', 'Lote2026E', '2028-01-01', 'Regular');

-- 7. Inserindo Pagamentos (Coerentes com as vendas)
INSERT INTO pagamento (id_venda, tipo_pagamento, valor_pagamento, data_pagamento, parcelas_pagamento, imposto_pagamento, bandeira_pagamento, observacao_pagamento) VALUES
(1, 'Cartão de Crédito', 34.40, '2026-04-20 10:32:00', 1, 1.50, 'Mastercard', 'Transação Aprovada'),
(2, 'PIX', 44.80, '2026-04-20 11:16:00', 1, 0.00, 'pagamento sem cartao', 'Comprovante verificado'),
(3, 'Dinheiro', 6.50, '2026-04-21 09:02:00', 1, 0.00, 'pagamento sem cartao', 'Valor exato entregue'),
(4, 'Cartão de Débito', 28.20, '2026-04-21 14:23:00', 1, 0.50, 'Visa', 'Aprovado via Aproximação'),
(5, 'Cartão de Crédito', 51.00, '2026-04-22 16:48:00', 2, 2.00, 'Elo', 'Parcelado em 2x');