CREATE DATABASE  IF NOT EXISTS "lojinhaMA78" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lojinhaMA78`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: mysql-2334abba-mysql-1234.e.aivencloud.com    Database: lojinhaMA78
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '557bfa48-3e7c-11f1-9a76-9e98ac499e63:1-70';

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `sobrenome_cliente` varchar(100) DEFAULT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `telefone_cliente` varchar(20) NOT NULL,
  `email_cliente` varchar(80) NOT NULL,
  `cidade_cliente` varchar(50) NOT NULL,
  `cep_cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  UNIQUE KEY `telefone_cliente` (`telefone_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Virginia','do Sul','12345678901','40028922','virginia@hotmail.com','eua','1234'),(2,'Ana','Souza','11122233344','11988887777','ana.souza@email.com','São Paulo','01001-000'),(3,'Carlos','Oliveira','22233344455','21977776666','carlos.oli@email.com','Rio de Janeiro','20040-002'),(4,'Mariana','Silva','33344455566','31966665555','mariana.silva@email.com','Belo Horizonte','30110-010'),(5,'Roberto','Almeida','44455566677','41955554444','roberto.almeida@email.com','Curitiba','80010-010'),(6,'Fernanda','Costa','55566677788','51944443333','fernanda.costa@email.com','Porto Alegre','90010-190');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int DEFAULT NULL,
  `quantidade_estoque` int NOT NULL,
  `quantidade_minima_estoque` int NOT NULL,
  `localizacao_estoque` varchar(30) NOT NULL,
  `data_hora_entrada` datetime NOT NULL,
  `data_hora_saida` datetime NOT NULL,
  `lote` varchar(20) NOT NULL,
  `validade` date NOT NULL,
  `status_estoque` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,150,20,'Corredor 1, Prateleira A','2026-04-01 08:00:00','2026-04-20 18:00:00','Lote2026A','2026-12-31','Regular'),(2,2,200,50,'Corredor 1, Prateleira B','2026-04-02 09:30:00','2026-04-20 18:00:00','Lote2026B','2026-10-15','Regular'),(3,3,80,30,'Corredor 2, Prateleira A','2026-04-05 14:00:00','2026-04-21 18:00:00','Lote2026C','2026-08-20','Alerta Baixo'),(4,4,120,25,'Corredor 3, Prateleira C','2026-04-10 10:15:00','2026-04-21 18:00:00','Lote2026D','2026-11-01','Regular'),(5,5,300,40,'Corredor 5, Prateleira A','2026-04-12 11:45:00','2026-04-21 18:00:00','Lote2026E','2028-01-01','Regular');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(100) NOT NULL,
  `cnpj_fornecedor` varchar(20) NOT NULL,
  `telefone_fornecedor` varchar(20) NOT NULL,
  `email_fornecedor` varchar(100) NOT NULL,
  `status_fornecedor` enum('ativo','inativo','bloqueado') DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj_fornecedor` (`cnpj_fornecedor`),
  UNIQUE KEY `email_fornecedor` (`email_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Distribuidora Alimentos S.A.','11222333000199','1133334444','vendas@distribuidora.com.br','ativo'),(2,'Atacadão de Limpeza','44555666000188','1144445555','contato@atacadaolimpeza.com','ativo'),(3,'Armazém Geral Ltda','77888999000177','2133332222','comercial@armazemgeral.com','ativo'),(4,'Bebidas Premium BR','10200300000166','3133331111','pedidos@bebidaspremium.com','inativo'),(5,'Comercial Sul','40500600000155','4133330000','atendimento@comercialsul.com','ativo');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item_venda` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade_item` int NOT NULL,
  `preco_item` decimal(5,2) NOT NULL,
  `subtotal_item` decimal(5,2) NOT NULL,
  `imposto_item` decimal(5,2) DEFAULT NULL,
  `observacao_item` text,
  PRIMARY KEY (`id_item_venda`),
  UNIQUE KEY `id_venda` (`id_venda`,`id_produto`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,1,1,25.50,25.50,2.50,'Nenhuma'),(2,1,2,1,8.90,8.90,0.89,'Nenhuma'),(3,2,1,2,25.50,51.00,5.00,'Nenhuma'),(4,3,3,1,6.50,6.50,0.65,'Nenhuma'),(5,4,4,1,15.90,15.90,1.59,'Nenhuma'),(6,4,5,1,12.30,12.30,1.23,'Nenhuma'),(7,5,1,2,25.50,51.00,5.10,'Lote específico exigido');
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `tipo_pagamento` varchar(20) NOT NULL,
  `valor_pagamento` decimal(5,2) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `parcelas_pagamento` int NOT NULL,
  `imposto_pagamento` decimal(5,2) NOT NULL,
  `bandeira_pagamento` varchar(20) DEFAULT 'pagamento sem cartao',
  `observacao_pagamento` text,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_venda` (`id_venda`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,'Cartão de Crédito',34.40,'2026-04-20 10:32:00',1,1.50,'Mastercard','Transação Aprovada'),(2,2,'PIX',44.80,'2026-04-20 11:16:00',1,0.00,'pagamento sem cartao','Comprovante verificado'),(3,3,'Dinheiro',6.50,'2026-04-21 09:02:00',1,0.00,'pagamento sem cartao','Valor exato entregue'),(4,4,'Cartão de Débito',28.20,'2026-04-21 14:23:00',1,0.50,'Visa','Aprovado via Aproximação'),(5,5,'Cartão de Crédito',51.00,'2026-04-22 16:48:00',2,2.00,'Elo','Parcelado em 2x');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `descricao_produto` text,
  `preco_produto` decimal(5,2) NOT NULL,
  `categoria_produto` varchar(20) NOT NULL,
  `marca_produto` varchar(20) NOT NULL,
  `codigo_barras` varchar(50) NOT NULL,
  `data_validade_produto` date DEFAULT '2026-01-01',
  `peso_produto` decimal(5,2) NOT NULL,
  `status_produto` enum('disponivel','indisponivel','NAN') DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Arroz Branco 5kg','Arroz branco tipo 1',25.50,'Alimentos','Tio João','7891234567890','2026-12-31',5.00,'disponivel'),(2,'Feijão Carioca 1kg','Feijão carioca tipo 1',8.90,'Alimentos','Camil','7891234567891','2026-10-15',1.00,'disponivel'),(3,'Óleo de Soja 900ml','Óleo de soja refinado',6.50,'Alimentos','Liza','7891234567892','2026-08-20',0.90,'disponivel'),(4,'Café Torrado 500g','Café tradicional',15.90,'Bebidas','Pilão','7891234567893','2026-11-01',0.50,'disponivel'),(5,'Sabão em Pó 1kg','Sabão em pó limpeza profunda',12.30,'Limpeza','Omo','7891234567894','2028-01-01',1.00,'disponivel');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_hora_venda` datetime NOT NULL,
  `valor_total` decimal(5,2) NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `desconto_venda` decimal(5,2) DEFAULT NULL,
  `id_cliente_na_tabela_venda` int DEFAULT NULL,
  `status_venda` varchar(20) NOT NULL,
  `observacoes_venda` text,
  `caixa_venda` int NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_cliente_na_tabela_venda` (`id_cliente_na_tabela_venda`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_cliente_na_tabela_venda`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'2026-04-20 10:30:00',34.40,'Cartão de Crédito',0.00,1,'Concluída','Cliente solicitou nota fiscal paulista',1),(2,'2026-04-20 11:15:00',44.80,'PIX',5.00,2,'Concluída','Desconto aplicado por pagamento à vista',2),(3,'2026-04-21 09:00:00',6.50,'Dinheiro',0.00,3,'Concluída','Sem troco',1),(4,'2026-04-21 14:20:00',28.20,'Cartão de Débito',0.00,4,'Concluída','',3),(5,'2026-04-22 16:45:00',51.00,'Cartão de Crédito',0.00,5,'Concluída','Entrega a domicílio agendada',2);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 21:29:37
