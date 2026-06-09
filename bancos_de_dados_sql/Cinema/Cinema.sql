CREATE DATABASE  IF NOT EXISTS "cinema" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: mysql-2334abba-mysql-1234.e.aivencloud.com    Database: cinema
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '4d3c5b6e-43f4-11f1-a6ae-4e93d3745053:1-32,
557bfa48-3e7c-11f1-9a76-9e98ac499e63:1-70';

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descricao_cat` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ação'),(2,'Comédia'),(3,'Ficção Científica'),(4,'Drama'),(5,'Terror');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` varchar(15) NOT NULL,
  `email_cliente` varchar(30) NOT NULL,
  `status_cliente` enum('ATIVO','INATIVO') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João Silva','111.111.111-11','joao.silva@email.com','ATIVO'),(2,'Maria Oliveira','222.222.222-22','maria.oliveira@email.com','ATIVO'),(3,'Carlos Santos','333.333.333-33','carlos.santos@email.com','INATIVO'),(4,'Ana Costa','444.444.444-44','ana.costa@email.com','ATIVO');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `nome_filme` varchar(100) NOT NULL,
  `faixa_etaria` int DEFAULT NULL,
  `duracao_filme` int NOT NULL,
  `status_filme` enum('EM CARTAZ','FORA CARTAZ') DEFAULT NULL,
  `id_categoria_filme` int NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `id_categoria_filme` (`id_categoria_filme`),
  CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_categoria_filme`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `filme_chk_1` CHECK ((`faixa_etaria` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Vingadores: Nova Era',12,145,'EM CARTAZ',1),(2,'De Volta para o Futuro 4',10,120,'EM CARTAZ',3),(3,'It: A coisa',18,110,'FORA CARTAZ',5),(4,'Gente Grande',14,95,'EM CARTAZ',2);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_sessao` int NOT NULL,
  `id_tipo_ingresso` int NOT NULL,
  `valor_pago` decimal(5,2) NOT NULL,
  `status_ingresso` enum('RESERVADO','PAGO','CANCELADO') DEFAULT 'RESERVADO',
  PRIMARY KEY (`id_ingresso`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_sessao` (`id_sessao`),
  KEY `id_tipo_ingresso` (`id_tipo_ingresso`),
  CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `ingresso_ibfk_2` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id_sessao`),
  CONSTRAINT `ingresso_ibfk_3` FOREIGN KEY (`id_tipo_ingresso`) REFERENCES `tipo_ingresso` (`id_tipo_ingresso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,1,1,2,20.00,'PAGO'),(2,1,1,2,20.00,'PAGO'),(3,2,3,3,50.00,'PAGO'),(4,3,5,5,80.00,'RESERVADO'),(5,3,5,5,80.00,'RESERVADO');
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `status_pedido` enum('ABERTO','PAGO','CANCELADO') DEFAULT 'ABERTO',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2026-04-29 10:15:00',1,'PAGO'),(2,'2026-04-29 11:30:00',2,'PAGO'),(3,'2026-04-29 14:20:00',4,'ABERTO');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `descricao_sala` text NOT NULL,
  `tipo_sala` enum('2D','3D','IMAX') DEFAULT '2D',
  `capacidade_sala` int NOT NULL,
  `vip_sala` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_sala`),
  CONSTRAINT `sala_chk_1` CHECK ((`capacidade_sala` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'Sala 1 - Padrão','2D',150,0),(2,'Sala 2 - Especial 3D','3D',120,0),(3,'Sala 3 - Experiência IMAX','IMAX',200,0),(4,'Sala 4 - VIP','2D',50,1);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao` (
  `id_sessao` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_sala_sessao` int NOT NULL,
  `id_filme_sessao` int NOT NULL,
  `status_sessao` enum('ABERTA','ENCERRADA','CANCELADA') DEFAULT 'ABERTA',
  PRIMARY KEY (`id_sessao`),
  UNIQUE KEY `data_hora` (`data_hora`,`id_sala_sessao`),
  KEY `id_sala_sessao` (`id_sala_sessao`),
  KEY `id_filme_sessao` (`id_filme_sessao`),
  CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`id_sala_sessao`) REFERENCES `sala` (`id_sala`),
  CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`id_filme_sessao`) REFERENCES `filme` (`id_filme`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessao`
--

LOCK TABLES `sessao` WRITE;
/*!40000 ALTER TABLE `sessao` DISABLE KEYS */;
INSERT INTO `sessao` VALUES (1,'2026-05-01 14:00:00',1,1,'ABERTA'),(2,'2026-05-01 17:30:00',1,1,'ABERTA'),(3,'2026-05-01 15:00:00',2,2,'ABERTA'),(4,'2026-05-01 20:00:00',3,1,'ABERTA'),(5,'2026-05-01 21:00:00',4,4,'ABERTA');
/*!40000 ALTER TABLE `sessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ingresso`
--

DROP TABLE IF EXISTS `tipo_ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ingresso` (
  `id_tipo_ingresso` int NOT NULL AUTO_INCREMENT,
  `descricao_ingresso` varchar(50) NOT NULL,
  `valor_ingresso` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_tipo_ingresso`),
  CONSTRAINT `tipo_ingresso_chk_1` CHECK ((`valor_ingresso` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ingresso`
--

LOCK TABLES `tipo_ingresso` WRITE;
/*!40000 ALTER TABLE `tipo_ingresso` DISABLE KEYS */;
INSERT INTO `tipo_ingresso` VALUES (1,'Inteira',40.00),(2,'Meia',20.00),(3,'Inteira 3D',50.00),(4,'Meia 3D',25.00),(5,'VIP',80.00);
/*!40000 ALTER TABLE `tipo_ingresso` ENABLE KEYS */;
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

-- Dump completed on 2026-04-29 17:02:08
