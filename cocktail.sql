CREATE DATABASE  IF NOT EXISTS `cocktails` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cocktails`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cocktails
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cocktail`
--

DROP TABLE IF EXISTS `cocktail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocktail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `preis` int(11) DEFAULT NULL,
  `glas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_glas_idx` (`glas_id`),
  CONSTRAINT `fk_glas` FOREIGN KEY (`glas_id`) REFERENCES `glas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocktail`
--

LOCK TABLES `cocktail` WRITE;
/*!40000 ALTER TABLE `cocktail` DISABLE KEYS */;
INSERT INTO `cocktail` VALUES (1,'Acapulco',5,3),(2,'Craniti',7,3),(3,'00x Martini',5,5),(4,'Don Juan',8,4),(5,'43 Milk',5,2),(6,'Aarewasser',5,1),(7,'Absinth Curaçao Frappé',6,3),(8,'Admiral Benbow',7,3),(9,'Adonis',10,3),(10,'Alabama Slammer',8,3),(11,'Alexa',3,7),(12,'Alica',8,3),(13,'Alicette 2x43',3,6),(14,'Angels Delight',7,3),(15,'Aperojito',4,3),(16,'Lighty',2,4);
/*!40000 ALTER TABLE `cocktail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glas`
--

DROP TABLE IF EXISTS `glas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `groesse_cl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glas`
--

LOCK TABLES `glas` WRITE;
/*!40000 ALTER TABLE `glas` DISABLE KEYS */;
INSERT INTO `glas` VALUES (1,'Granity Arcoroc, Caipi',42),(2,'Grand Cru, Cognac',30),(3,'Elite, WideHight',270),(4,'Napoli Grande, Long',42),(5,'Libbey, Martini',26),(6,'Hurricane, LongFruit',44),(7,'HotShot, Shot',12);
/*!40000 ALTER TABLE `glas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herkunft`
--

DROP TABLE IF EXISTS `herkunft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herkunft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herkunft` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herkunft`
--

LOCK TABLES `herkunft` WRITE;
/*!40000 ALTER TABLE `herkunft` DISABLE KEYS */;
INSERT INTO `herkunft` VALUES (1,'biologisch'),(2,'chemisch');
/*!40000 ALTER TABLE `herkunft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezept`
--

DROP TABLE IF EXISTS `rezept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezept` (
  `cocktail_id` int(11) NOT NULL,
  `zutat_id` int(11) NOT NULL,
  `menge` int(11) DEFAULT NULL,
  PRIMARY KEY (`cocktail_id`,`zutat_id`),
  KEY `fk_zutat_idx` (`zutat_id`),
  CONSTRAINT `fk_cocktail` FOREIGN KEY (`cocktail_id`) REFERENCES `cocktail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_zutat` FOREIGN KEY (`zutat_id`) REFERENCES `zutat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezept`
--

LOCK TABLES `rezept` WRITE;
/*!40000 ALTER TABLE `rezept` DISABLE KEYS */;
INSERT INTO `rezept` VALUES (1,1,8),(1,2,4),(1,3,4),(1,4,4),(1,5,3),(2,6,6),(2,7,12),(2,8,2),(2,9,2),(3,9,4),(3,10,2),(3,11,1),(4,12,3),(4,34,9),(5,13,4),(5,14,12),(6,6,8),(6,8,8),(6,15,4),(6,16,2),(7,17,3),(7,18,1),(7,34,1),(8,9,3),(8,10,6),(8,16,2),(9,9,2),(9,11,1),(9,19,2),(9,20,1),(10,10,1),(10,18,1),(10,22,1),(10,23,2),(10,24,2),(11,14,4),(11,25,4),(11,33,1),(11,35,2),(12,1,8),(12,26,2),(12,27,2),(12,34,8),(13,6,4),(13,13,2),(13,34,12),(14,8,2),(14,10,2),(14,26,1),(14,27,3),(15,2,2),(15,28,4),(15,29,1),(15,30,10),(15,31,3),(15,32,1),(15,34,4),(16,16,3),(16,30,10),(16,31,3);
/*!40000 ALTER TABLE `rezept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutat`
--

DROP TABLE IF EXISTS `zutat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zutat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `kalorien` int(11) DEFAULT NULL,
  `einheit` varchar(10) DEFAULT NULL,
  `herkunft_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_herkunft_idx` (`herkunft_id`),
  CONSTRAINT `fk_herkunft` FOREIGN KEY (`herkunft_id`) REFERENCES `herkunft` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutat`
--

LOCK TABLES `zutat` WRITE;
/*!40000 ALTER TABLE `zutat` DISABLE KEYS */;
INSERT INTO `zutat` VALUES (1,'Ananassaft',43,'cl',1),(2,'Rumm (weiss)',85,'cl',1),(3,'Tequila',84,'cl',1),(4,'Grapfefruitsaft',41,'cl',1),(5,'Cream of Coconut',98,'cl',1),(6,'Wodka',85,'cl',1),(7,'Cranberrysaft',43,'cl',1),(8,'Triple Sec',76,'cl',1),(9,'Wermut, trocken',86,'cl',1),(10,'Gin',68,'cl',1),(11,'Bitter',43,'Spritzer',1),(12,'Licor',91,'cl',1),(13,'Licor 43',90,'cl',1),(14,'Milch',32,'cl',1),(15,'Blue Caraçao',75,'cl',1),(16,'Lime Juice',12,'cl',1),(17,'Absinth',73,'cl',1),(18,'Zitronensaft',13,'cl',1),(19,'Sherry',75,'cl',1),(20,'Zitrone',15,'Schnitz',1),(21,'Orange',43,'Schnitz',1),(22,'Zuckersirup',120,'cl',1),(23,'Amaretto',87,'cl',1),(24,'Southern Comfort',43,'cl',1),(25,'Cognac',85,'cl',1),(26,'Grenadine Sirup',124,'cl',1),(27,'Rahm',110,'cl',1),(28,'Aperol',82,'cl',1),(29,'Limette',12,'Schnitz',1),(30,'Soda',0,'cl',1),(31,'Minze',12,'Stück',1),(32,'Zucker (braun)',200,'gramm',1),(33,'Muskatnuss',0,'Prise',1),(34,'Orangensaft',32,'cl',1),(35,'Creme de Cacao (weiss)',88,'cl',1),(36,'Schuhsohlen',5,'Paar',2);
/*!40000 ALTER TABLE `zutat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 18:07:20
