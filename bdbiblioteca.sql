CREATE DATABASE  IF NOT EXISTS `bdbiblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdbiblioteca`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdbiblioteca
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `exemplares`
--

DROP TABLE IF EXISTS `exemplares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplares` (
  `id_exemplar` int NOT NULL,
  `id_livro` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_exemplar`),
  KEY `id_livro` (`id_livro`),
  CONSTRAINT `exemplares_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `geral` (`id`),
  CONSTRAINT `exemplares_chk_1` CHECK ((`status` in (_utf8mb4'disponivel',_utf8mb4'reservado',_utf8mb4'emprestado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplares`
--

LOCK TABLES `exemplares` WRITE;
/*!40000 ALTER TABLE `exemplares` DISABLE KEYS */;
/*!40000 ALTER TABLE `exemplares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geral`
--

DROP TABLE IF EXISTS `geral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `categoriaid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriaid` (`categoriaid`),
  CONSTRAINT `geral_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `sessoes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geral`
--

LOCK TABLES `geral` WRITE;
/*!40000 ALTER TABLE `geral` DISABLE KEYS */;
INSERT INTO `geral` VALUES (1,'Dom Casmurro','Machado de Assis',5),(2,'A revolução dos Bichos','George Orwell',5),(3,'O Pequeno Príncipe','Antoine de Saint-Exupéry',19),(4,'O Silêncio dos Inocentes','Thomas Harris',10),(5,'Sapiens: Uma Breve História da Humanidade','Yuval Noah Harari',13),(6,'Orgulho e Preconceito','Jane Austen',22),(7,'O Senhor dos Anéis','J.R.R. Tolkien',7),(8,'Duna','Frank Herbert',9),(9,'A Garota no Trem','Paula Hawkins',10),(10,'O Sol é para Todos','Harper Lee',11),(11,'Steve Jobs','Walter Isaacson',12),(12,'A História do Tempo','Stephen Hawking',16),(13,'O Poder do Hábito','Charles Duhigg',14),(14,'Sobre a Brevidade da Vida','Sêneca',15),(15,' A Poesia de Vinícius de Moraes','Vinícius de Moraes',17),(16,'O Guardião da Memória','Laerte Coutinho',18),(17,'O Menino Maluquinho','Ziraldo',19),(18,'A Culpa é das Estrelas','John Green ',20),(19,'A Fada que Tinha Ideias','Fernanda Lopes',21),(20,'A Casa das Sete Mulheres','Letícia Wierzchowski',22),(21,'O Diário de Bridget Jones','Helen Fielding',23),(22,'Drácula','Bram Stoker',24),(23,'A Psicanálise e o Horror','Sigmund Freud',25);
/*!40000 ALTER TABLE `geral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cpf` int DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (6,'b','n',111111),(9,'fgfdfggfgfgfd','dfffsdgf',54333454),(10,'Maryane','mq@gmail.com',123123123),(11,'Ana Silva','ana.silva@email.com',1234567),(12,'João Santos','joao.santos@email.com',54333453),(13,'Maria Oliveira','maria.oliveira@email.com',3456789),(14,'Pedro Souza','pedro.souza@email.com',3456153),(15,'Lucas Pereira','lucas.pereira@email.com',56789076),(16,'Juliana Costa','juliana.costa@email.com',67890123),(17,'Felipe Almeida','felipe.almeida@email.com',7890123),(18,'Bruno Ribeiro','bruno.ribeiro@email.com',9010234),(19,'Fernanda Rocha','fernanda.rocha@email.com',12345678),(20,'Carolina Mendes','carolina.mendes@email.com',124678901),(21,'André Martins','andre.martins@email.com',1213213),(22,'Beatriz Lima','beatriz.lima@email.com',8526356),(23,'Rodrigo Fernandes','rodrigo.fernandes@email.com',37947337),(24,'Larissa Almeida','larissa.almeida@email.com',3804083),(25,'Thiago Dias','thiago.dias@email.com',73477437),(26,'Vanessa Oliveira','vanessa.oliveira@email.com',483948940),(27,'Samuel Costa','samuel.costa@email.com',83742938),(28,'Luiza Teixeira','luiza.teixeira@email.com',61325323),(29,'Andréia Gomes','andrea.gomes@email.com',6261362),(30,'Ricardo Lima	','ricardo.lima@email.com',72673617),(31,'Ana Clara','ana.clara@email.com',45678901),(32,'Thiago Pires','thiago.pires@email.com',567890126),(33,'Renata Vieira','renata.vieira@email.com',98988321),(34,'Gustavo Martins','gustavo.martins@email.com',374837832),(35,'Carolina Soares','carolina.soares@email.com',37834383),(36,'Rafael Costa','rafael.costa@email.com',733747342),(37,'Silvana Oliveira','silvana.oliveira@email.com',3843864),(38,'Danilo Ribeiro','danilo.ribeiro@email.com',736712331),(39,'Priscila Almeida','priscila.almeida@email.com',733733123),(40,'Jorge Ferreira','jorge.ferreira@email.com',87378328),(41,'Sofia Almeida','sofia.almeida@email.com',173273817),(42,'Fernanda Lima','fernanda.lima@email.com',67890133),(43,'Marcos Silva','marcos.silva@email.com',37126632),(44,'Aline Costa','aline.costa@email.com',73237631),(45,'Bruno Mendes','bruno.mendes@email.com',727321363),(46,'Larissa Souza','larissa.souza@email.com',3717271),(47,'Roberta Teixeira','roberta.teixeira@email.com',37828967),(48,'Tiago Almeida','tiago.almeida@email.com',873842472),(49,'Daniel Santos','daniel.santos@email.com',632561326),(50,'Carolina Lima','carolina.lima@email.com',27621361),(51,'Patricia Ferreira','patricia.ferreira@email.com',433445345),(52,'Gustavo Soares','gustavo.soares@email.com',737737324),(53,'Simone Costa','simone.costa@email.com',37783436),(54,'Vitor Ribeiro','vitor.ribeiro@email.com',376714314),(55,'Fabiana Almeida','fabiana.almeida@email.com',343647438),(56,'Eduardo Lima','eduardo.lima@email.com',467373373),(57,'Mariana Silva','mariana.silva@email.com',37162632),(58,'Lucas Teixeira','lucas.teixeira@email.com',761373278),(59,'Ana Carolina','ana.carolina@email.com',783218723),(60,'Felipe Martins','felipe.martins@email.com',87327313),(61,'Raquel Soares','raquel.soares@email.com',23623672),(62,'Robson Ferreira','robson.ferreira@email.com',8826323),(63,'Denise Almeida','denise.almeida@email.com',92367271),(64,'Marcos Costa','marcos.costa@email.com',83273231),(65,'Tatiane Teixeira','tatiane.teixeira@email.com',367237231),(66,'Juliano Mendes','juliano.mendes@email.com',86362121),(67,'Luana Santos','luana.santos@email.com',973263271),(68,'Allan Silva','allan.silva@email.com',72632138),(69,'Viviane Oliveira','viviane.oliveira@email.com',83273731),(70,'Douglas Ferreira	','douglas.ferreira@email.com',373273123),(71,'Sofia Mendes','sofia.mendes@email.com',38462743),(72,'Marcio Almeida','marcio.almeida@email.com',378621231),(73,'Patrícia Lima','patricia.lima@email.com',72731621),(74,'Renan Costa','renan.costa@email.com',36312631),(75,'Jaqueline Santos','jaqueline.santos@email.com',31226365),(76,'Vanessa Martins','vanessa.martins@email.com',622325163),(77,'João Paulo','joao.paulo@email.com',86625361),(78,'Kelly Teixeira','kelly.teixeira@email.com',121262321),(79,'Igor Ribeiro','igor.ribeiro@email.com',511132621),(80,'Emanuelle Almeida','emanuele.almeida@email.com',132434324),(81,'Leandro Silva','leandro.silva@email.com',277147432),(82,'Roberta Costa','roberta.costa@email.com',761273312),(83,'Anderson Santos','anderson.santos@email.com',78136223),(84,'Adriana Martins','adriana.martins@email.com',721274621),(85,'Mariana Teixeira','mariana.teixeira@email.com',63276731),(86,'Felipe Soares','felipe.soares@email.com',71271674),(87,'Cristina Lima','cristina.lima@email.com',83428432),(88,'Danilo Mendes','danilo.mendes@email.com',36152326),(89,'Larissa Teixeira','larissa.teixeira@email.com',663746723),(90,'Sérgio Almeida','sergio.almeida@email.com',76362737),(92,'Luana Ribeiro','luana.ribeiro@email.com',71317372),(93,'Tamires Costa','tamires.costa@email.com',63122531),(94,'Ana Paula','ana.paula@email.com',47364763),(95,'André Teixeira','andré.teixeira@email.com',27635163);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL,
  `id_exemplar` int DEFAULT NULL,
  `id_pessoa` int DEFAULT NULL,
  `data_reserva` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_exemplar` (`id_exemplar`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_exemplar`) REFERENCES `exemplares` (`id_exemplar`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessoes`
--

DROP TABLE IF EXISTS `sessoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessoes`
--

LOCK TABLES `sessoes` WRITE;
/*!40000 ALTER TABLE `sessoes` DISABLE KEYS */;
INSERT INTO `sessoes` VALUES (5,'Ficção','Romance'),(7,'Ficção','Fantasia'),(9,'Ficção','Ficção Científica'),(10,'Ficção','Mistério'),(11,'Ficção','Literatura Contemporânea'),(12,'Não Ficção','Biografia'),(13,'Não Ficção','História'),(14,'Não Ficção','Autoajuda'),(15,'Não Ficção','Ensaios'),(16,'Não Ficção','Ciência'),(17,'Poesia','Poesia Clássica'),(18,'Poesia','Poesia Contemporânea'),(19,'Infantil','Literatura Infantil'),(20,'Jovem Adulto','Young Adult (YA)'),(21,'Jovem Adulto','Fantasia Juvenil'),(22,'Romance','Romance Histórico'),(23,'Romance','Romance Comédia'),(24,'Terror','Horror Clássico'),(25,'Terror','Terror Psicológico'),(26,'Clássicos','Obras Clássicas Universais '),(27,'Clássicos','Clássicos Brasileiros'),(28,'Literatura Estrangeira','Traduzidos '),(29,'Literatura Estrangeira','Obras Originais '),(30,'Ficção','Mistério/Thrllir'),(31,'Graphic Novels','Gibis');
/*!40000 ALTER TABLE `sessoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdbiblioteca'
--

--
-- Dumping routines for database 'bdbiblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 19:59:57
