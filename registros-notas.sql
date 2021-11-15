-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: registrodenotas
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'Cine'),(6,'Clima'),(8,'Comedia'),(4,'Comida'),(5,'Deporte'),(3,'Historia'),(7,'Internacionales'),(1,'musica'),(9,'Nacionales'),(10,'Politica');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nota`),
  KEY `fk_notas_1_idx` (`id_usuario`),
  CONSTRAINT `fk_notas_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,1,'Texto de prueba 1','Esta es la descripscion del texto de prueba 1','2021-11-15 09:18:11','2021-11-15 09:18:11'),(2,2,'Texto de prueba 2','Esta es la descripscion del texto de prueba 2','2021-11-15 09:18:11','2021-11-15 09:18:11'),(3,1,'Texto de prueba 3','Esta es la descripscion del texto de prueba 3','2021-11-15 09:18:11','2021-11-15 09:18:11'),(4,5,'Texto de prueba 3','Esta es la descripscion del texto de prueba 3','2021-11-15 09:48:32','2021-11-15 09:48:32'),(5,5,'Texto de prueba 4','Esta es la descripscion del texto de prueba 4','2021-11-15 09:48:32','2021-11-15 09:48:32'),(6,8,'Texto de prueba 5','Esta es la descripscion del texto de prueba 5','2021-11-15 09:48:32','2021-11-15 09:48:32'),(7,8,'Texto de prueba 6','Esta es la descripscion del texto de prueba 6','2021-11-15 09:48:32','2021-11-15 09:48:32'),(8,4,'Texto de prueba 7','Esta es la descripscion del texto de prueba 7','2021-11-15 09:48:32','2021-11-15 09:48:32'),(9,4,'Texto de prueba 8','Esta es la descripscion del texto de prueba 8','2021-11-15 09:48:32','2021-11-15 09:48:32'),(10,1,'Texto de prueba 9','Esta es la descripscion del texto de prueba 9','2021-11-15 09:48:32','2021-11-15 09:48:32'),(11,1,'Texto de prueba 10','Esta es la descripscion del texto de prueba 10','2021-11-15 09:48:32','2021-11-15 09:48:32');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_categorias` (
  `id_notas_categorias` int NOT NULL AUTO_INCREMENT,
  `id_nota` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_notas_categorias`),
  KEY `fk_notas_categorias_1_idx` (`id_nota`),
  KEY `fk_notas_categorias_2_idx` (`id_categoria`),
  KEY `fk_notas_idx` (`id_nota`),
  KEY `fk_categorias_idx` (`id_categoria`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_notas` FOREIGN KEY (`id_nota`) REFERENCES `notas` (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categorias`
--

LOCK TABLES `notas_categorias` WRITE;
/*!40000 ALTER TABLE `notas_categorias` DISABLE KEYS */;
INSERT INTO `notas_categorias` VALUES (1,2,3),(2,2,1),(3,5,10),(4,5,4),(5,5,1),(7,4,1),(8,4,10),(9,4,4),(10,10,1);
/*!40000 ALTER TABLE `notas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Josibel Hernandez','josiherz28@gmail.com'),(2,'Jose Sanchez','jose@gmail.com'),(4,'Juan Jose','juan@gmail.com'),(5,'Pedro Jose','pedro@gmail.com'),(6,'David Jose','david@gmail.com'),(7,'Jose miguel','jj@gmail.com'),(8,'Miguel J','miguelj@gmail.com'),(9,'Pedro Lara','pedrol@gmail.com'),(10,'Juana Perez','juana@gmail.com'),(11,'Mercedes Garcia','meche@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15  9:54:26
