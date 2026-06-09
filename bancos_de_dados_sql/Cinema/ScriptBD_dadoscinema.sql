-- 1. Inserindo Categorias (Gêneros dos filmes)
INSERT INTO categoria (descricao_cat) VALUES 
('Ação'),
('Comédia'),
('Ficção Científica'),
('Drama'),
('Terror');

-- 2. Inserindo Salas
INSERT INTO sala (descricao_sala, tipo_sala, capacidade_sala, vip_sala) VALUES 
('Sala 1 - Padrão', '2D', 150, FALSE),
('Sala 2 - Especial 3D', '3D', 120, FALSE),
('Sala 3 - Experiência IMAX', 'IMAX', 200, FALSE),
('Sala 4 - VIP', '2D', 50, TRUE);

-- 3. Inserindo Tipos de Ingresso
INSERT INTO tipo_ingresso (descricao_ingresso, valor_ingresso) VALUES 
('Inteira', 40.00),
('Meia', 20.00),
('Inteira 3D', 50.00),
('Meia 3D', 25.00),
('VIP', 80.00);

-- 4. Inserindo Clientes
INSERT INTO cliente (nome_cliente, cpf_cliente, email_cliente, status_cliente) VALUES 
('João Silva', '111.111.111-11', 'joao.silva@email.com', 'ATIVO'),
('Maria Oliveira', '222.222.222-22', 'maria.oliveira@email.com', 'ATIVO'),
('Carlos Santos', '333.333.333-33', 'carlos.santos@email.com', 'INATIVO'),
('Ana Costa', '444.444.444-44', 'ana.costa@email.com', 'ATIVO');

-- 5. Inserindo Filmes
-- As categorias referenciam os IDs criados no passo 1 (1=Ação, 2=Comédia, 3=Ficção, 4=Drama, 5=Terror)
INSERT INTO filme (nome_filme, faixa_etaria, duracao_filme, status_filme, id_categoria_filme) VALUES 
('Vingadores: Nova Era', 12, 145, 'EM CARTAZ', 1),
('De Volta para o Futuro 4', 10, 120, 'EM CARTAZ', 3),
('It: A coisa', 18, 110, 'FORA CARTAZ', 5),
('Gente Grande', 14, 95, 'EM CARTAZ', 2);

-- 6. Inserindo Sessões
-- Respeitando a regra de UNIQUE(data_hora, id_sala_sessao)
INSERT INTO sessao (data_hora, id_sala_sessao, id_filme_sessao, status_sessao) VALUES 
('2026-05-01 14:00:00', 1, 1, 'ABERTA'), -- Sala 1, Vingadores
('2026-05-01 17:30:00', 1, 1, 'ABERTA'), -- Sala 1, Vingadores (outro horário)
('2026-05-01 15:00:00', 2, 2, 'ABERTA'), -- Sala 2, De Volta para o Futuro
('2026-05-01 20:00:00', 3, 1, 'ABERTA'), -- Sala 3, Vingadores (IMAX)
('2026-05-01 21:00:00', 4, 4, 'ABERTA'); -- Sala 4, Comédia (VIP)

-- 7. Inserindo Pedidos
INSERT INTO pedido (data_hora, id_cliente, status_pedido) VALUES 
('2026-04-29 10:15:00', 1, 'PAGO'),     -- Pedido do João
('2026-04-29 11:30:00', 2, 'PAGO'),     -- Pedido da Maria
('2026-04-29 14:20:00', 4, 'ABERTO');   -- Pedido da Ana

-- 8. Inserindo Ingressos
-- Relacionando Pedidos, Sessões e Tipos de Ingresso
INSERT INTO ingresso (id_pedido, id_sessao, id_tipo_ingresso, valor_pago, status_ingresso) VALUES 
-- João comprou 2 meias para Vingadores na Sala 1 (Sessão 1)
(1, 1, 2, 20.00, 'PAGO'), 
(1, 1, 2, 20.00, 'PAGO'), 

-- Maria comprou 1 inteira 3D para De Volta para o Futuro na Sala 2 (Sessão 3)
(2, 3, 3, 50.00, 'PAGO'), 

-- Ana reservou 2 ingressos VIP para a Comédia na Sala 4 (Sessão 5)
(3, 5, 5, 80.00, 'RESERVADO'),
(3, 5, 5, 80.00, 'RESERVADO');