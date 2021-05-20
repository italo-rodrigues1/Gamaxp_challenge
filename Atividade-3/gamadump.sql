CREATE DATABASE  IF NOT EXISTS `gamaxp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gamaxp`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gamaxp
-- ------------------------------------------------------
-- Server version	8.0.22

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTES` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `WHATSAPP` varchar(14) DEFAULT NULL,
  `SENHA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CLIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ITALO','ITALOSPORT110@HOTMAIL.COM','81988346853','ITALO142313'),(2,'MARCELO','MARCELO44@HOTMAIL.COM','81986376953','MARCELINHO22'),(3,'PEDRO','PEDRORYZEM5@GMAIL.COM','81985646883','RYZEN5'),(4,'HUANDERSOM','HUANDERSOM999@HOTMAIL.COM','81989306953','QWERT'),(5,'DIEGO','DIEGOXTRAP@HOTMAIL.COM','81984346533','TRGGG');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `ID_DEPARTAMENTO` int NOT NULL AUTO_INCREMENT,
  `NOME_DEPARTAEMNTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DEPARTAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Informatica'),(2,'Games'),(3,'Tablets e Celulares'),(4,'Moveis'),(5,'Acessorios'),(6,'Casa'),(7,'Eletronicos'),(8,'Ferramentas'),(9,'Adaptadores');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOGRADURA` varchar(100) DEFAULT NULL,
  `CEP` int DEFAULT NULL,
  `NUMERO` int DEFAULT NULL,
  `COMPLEMENTO` varchar(100) DEFAULT NULL,
  `CIDADE` varchar(50) DEFAULT NULL,
  `ESTADO` varchar(50) DEFAULT NULL,
  `TIPOENDERECO` varchar(100) NOT NULL,
  `ENDERECOCLIENTE` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENDERECOCLIENTE` (`ENDERECOCLIENTE`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`ENDERECOCLIENTE`) REFERENCES `clientes` (`ID_CLIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (3,'RUA BONGI',53510560,401,'POR TRÁS DA PADARIA','RECIFE','PE','RESIDENCIAL',1),(4,'Rua Benedito Fernandes Menozes 195',15405970,509,'EM FRETE AO TUDO JUNTO','RECIFE','PE','COMERCIAL',2),(5,'Praça Venâncio Alves, s/n',46820971,420,'AO LADO MERCADO PRA','Bonito','BA','RESIDENCIAL',3),(6,'Quadra QNR 5 Conjunto O',72275680,200,'EM FRENTE AO TREVO','Brasília','DF','COMERCIAL',4),(7,'Rua Doutor Custódio de Paula Rodrigues 19',35365970,154,'AO LADO DO SHOPPING','Abre Campo','MG','RESIDENCIAL',5);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedidos`
--

DROP TABLE IF EXISTS `itens_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedidos` (
  `ID_ITENS` int NOT NULL AUTO_INCREMENT,
  `PRECO` decimal(10,2) DEFAULT '0.00',
  `QUANTIDADE` int DEFAULT NULL,
  `VALORTOTAL` decimal(20,2) DEFAULT NULL,
  `PEDIDOS_ITENS` int DEFAULT NULL,
  `ITENS_PRODUTOS` int DEFAULT NULL,
  PRIMARY KEY (`ID_ITENS`),
  KEY `PEDIDOS_ITENS` (`PEDIDOS_ITENS`),
  KEY `ITENS_PRODUTOS` (`ITENS_PRODUTOS`),
  CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`PEDIDOS_ITENS`) REFERENCES `pedidos` (`ID_PEDIDOS`),
  CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`ITENS_PRODUTOS`) REFERENCES `produtos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedidos`
--

LOCK TABLES `itens_pedidos` WRITE;
/*!40000 ALTER TABLE `itens_pedidos` DISABLE KEYS */;
INSERT INTO `itens_pedidos` VALUES (1,400.00,1,400.00,1,1),(2,200.00,3,600.00,2,2),(4,350.00,1,350.00,4,4),(6,50.00,3,150.00,5,5);
/*!40000 ALTER TABLE `itens_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_PEDIDOS` int NOT NULL AUTO_INCREMENT,
  `VALORPEDIDO` decimal(10,2) DEFAULT '0.00',
  `DATAPEDIDO` date DEFAULT NULL,
  `STATUSPEDIDO` varchar(50) DEFAULT NULL,
  `PEDIDOSCLIENTES` int NOT NULL,
  PRIMARY KEY (`ID_PEDIDOS`),
  KEY `PEDIDOSCLIENTES` (`PEDIDOSCLIENTES`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`PEDIDOSCLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,500.00,'2021-06-15','NOVO PEDIDO',1),(2,2000.00,'2021-01-20','CANCELADO',2),(3,1500.00,'2021-03-14','EM TRANSPORTE',3),(4,5000.00,'2021-04-10','ENTREGUE',4),(5,1050.00,'2021-02-22','PAGAMENTO AUTORIZADO',5);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `QUANT_ESTOQUE` int DEFAULT NULL,
  `PRECO` decimal(10,2) DEFAULT '0.00',
  `DESCRICAO` varchar(500) NOT NULL,
  `DISPONIVEL` varchar(3) NOT NULL,
  `DESTAQUE` varchar(3) NOT NULL,
  `IDDEPARTAMENTO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDDEPARTAMENTO` (`IDDEPARTAMENTO`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`IDDEPARTAMENTO`) REFERENCES `departamentos` (`ID_DEPARTAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'ADAPTADOR',20,50.00,'CONECTOR HDMI FEMEA L / FEMEA','SIM','SIM',9),(2,'CALCULADORA',10,150.00,'HP GRAFICA PRIME G2 PRETO/CINZA','SIM','SIM',7),(4,'ALICATE',6,200.00,'PARA CRIMPAR TL-315 3 EM 1','SIM','SIM',8),(5,'CAMERA DE SEGURANCA',5,400.00,'XIAOMI MI HOME MJSXJ09CM 2K WIFI PANORAMICO 360 BRANCO','SIM','NAO',7),(6,'ASPIRADOR',2,200.00,'NAPPO NLAR-063 ROBOT WIFI 350ML PRETO','SIM','SIM',6),(7,'CAPTURA DE VIDEO',10,2050.00,'ELGATO THUNDERBOLT3 DOCK 4K 10DAA4101 TYPE-C/DP/LAN/USB3.1/SOM','NAO','NAO',5),(8,'BABA ELETRONICA ',1,350.00,' MOTOROLA MBP87CNCT BRANCO/DOURADO','SIM','SIM',6),(9,'BATERIA',25,50.00,'GOLINE ALKALINE 9V 500MAH','SIM','SIM',5),(10,'CADEIRA GAMER',10,500.00,'HAVIT 922 GAMENOTE VERMELHO','SIM','SIM',4),(11,'MESA GAMER',16,1580.00,'MTEK GM01 LED RGB PRETO','SIM','NAO',4),(12,'TABLET',30,700.00,'AMAZON FIRE  HD8 KIDS EDITION 2GB/32GB AZUL WIFI/QUAD CORE 8','NAO','NAO',3),(13,'CONSOLE',40,5000.00,'SONY PS4 SLIM 1TB CUH-2215B PRETO BIVOLT','SIM','SIM',2),(14,'PENDRIVE',80,50.00,'8GB ADATA AC906-8GB USB 2.0  PRETO','SIM','NAO',1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20  0:29:53