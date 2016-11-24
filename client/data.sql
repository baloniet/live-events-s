-- MySQL dump 10.13  Distrib 5.6.31, for debian-linux-gnu (x86_64)
--
-- Host: 146.148.118.78    Database: live_events
-- ------------------------------------------------------
-- Server version	5.7.14-google

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
-- Dumping data for table `a_person`
--

LOCK TABLES `a_person` WRITE;
/*!40000 ALTER TABLE `a_person` DISABLE KEYS */;
INSERT INTO `a_person` VALUES (5,'2016-11-24 08:22:58',8,15,1,0),(6,'2016-11-24 09:39:32',8,13,1,0),(7,'2016-11-24 09:39:32',8,18,0,1);
/*!40000 ALTER TABLE `a_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (8,'2016-11-24 08:22:59','Moja prva aktivnost','V okviru te aktivnosti bomo spoznali kdo in zakaj se je odločil, da bomo v okviru te aktivnosti spoznali kdo in zakaj se je odločil, da bomo v okviru te aktivnosti spoznali kdo in zakaj se je odločil, da bomo v okviru te aktivnosti spoznali kdo in zakaj',5);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `c_address`
--

LOCK TABLES `c_address` WRITE;
/*!40000 ALTER TABLE `c_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `citizenship`
--

LOCK TABLES `citizenship` WRITE;
/*!40000 ALTER TABLE `citizenship` DISABLE KEYS */;
INSERT INTO `citizenship` VALUES (0,'_ni določeno');
/*!40000 ALTER TABLE `citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `commune`
--

LOCK TABLES `commune` WRITE;
/*!40000 ALTER TABLE `commune` DISABLE KEYS */;
INSERT INTO `commune` VALUES (1,'Občina Kranj');
/*!40000 ALTER TABLE `commune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (2,'OŠ'),(0,'_ni določeno');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `errors`
--

LOCK TABLES `errors` WRITE;
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
INSERT INTO `errors` VALUES (1,'person form','roj. datum se ne shranjuje',1,'2016-11-23 21:05:55',NULL),(2,'person form','naslovi',1,'2016-11-23 21:14:12',NULL),(3,'error genlist','ni povsem narejen pregled, ni forme, je potrebna?',1,'2016-11-24 08:36:51',NULL),(4,'person form','ne deluje datum',1,'2016-11-24 14:56:33',NULL);
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'string','string',0,'2016-11-24 00:00:00','2016-11-24 00:00:00','2016-11-24 00:00:00','2016-11-24 00:00:00',0,8),(2,'','',1,'2016-11-24 18:22:48','2016-11-24 00:00:00','2016-11-24 00:00:00','2016-11-24 00:00:00',NULL,8),(3,'','',1,'2016-11-24 18:23:45','2016-11-01 00:00:00','2016-11-24 00:00:00','2016-11-24 00:00:00',NULL,8),(4,'noro','roroooro',1,'2016-11-24 18:28:35','2016-11-25 00:00:00','2016-11-24 00:00:00','2016-11-24 00:00:00',1,8);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `p_citi`
--

LOCK TABLES `p_citi` WRITE;
/*!40000 ALTER TABLE `p_citi` DISABLE KEYS */;
INSERT INTO `p_citi` VALUES (13,0,'2016-11-23 16:39:40'),(14,0,'2016-11-23 16:40:37'),(15,0,'2016-11-23 16:40:43'),(16,0,'2016-11-23 16:41:13'),(17,0,'2016-11-23 16:41:24'),(18,0,'2016-11-23 16:41:32'),(19,0,'2016-11-23 16:41:44'),(20,0,'2016-11-23 16:41:53');
/*!40000 ALTER TABLE `p_citi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `p_edu`
--

LOCK TABLES `p_edu` WRITE;
/*!40000 ALTER TABLE `p_edu` DISABLE KEYS */;
INSERT INTO `p_edu` VALUES (13,0,'2016-11-23 16:39:40'),(14,0,'2016-11-23 16:40:37'),(15,0,'2016-11-23 16:40:43'),(16,0,'2016-11-23 16:41:13'),(17,0,'2016-11-23 16:41:24'),(18,0,'2016-11-23 16:41:32'),(19,0,'2016-11-23 16:41:44'),(20,0,'2016-11-23 16:41:53');
/*!40000 ALTER TABLE `p_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `p_email`
--

LOCK TABLES `p_email` WRITE;
/*!40000 ALTER TABLE `p_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `p_phone`
--

LOCK TABLES `p_phone` WRITE;
/*!40000 ALTER TABLE `p_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `p_stat`
--

LOCK TABLES `p_stat` WRITE;
/*!40000 ALTER TABLE `p_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (13,'Učitelj','Marko',NULL,'2016-11-24 08:23:02',1,0,0),(14,'Učitelj','Tone',NULL,'2016-11-24 08:23:02',1,0,0),(15,'Univerzalni','Pero',NULL,'2016-11-24 08:23:02',1,1,0),(16,'Univerzalni','France',NULL,'2016-11-24 08:23:02',1,1,0),(17,'Prosti','Svit',NULL,'2016-11-24 08:23:02',0,1,0),(18,'Prosti','Kvit',NULL,'2016-11-24 08:23:02',0,1,0),(19,'Tega','Ni',NULL,'2016-11-24 08:23:02',0,0,0),(20,'Tapa','Je',NULL,'2016-11-24 08:23:02',0,0,1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (4,'Kranj',4000),(5,'Ljubljana',1000);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Učilnica 1'),(2,'Učilnica 2'),(0,'_ni določeno');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (0,'2016-11-24 08:23:03','_ni določeno'),(5,'2016-11-24 08:23:03','Šport'),(6,'2016-11-24 08:23:03','Kultura');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24 19:31:05
