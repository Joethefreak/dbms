-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: acharya
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `Authorid` varchar(10) NOT NULL,
  `Authername` varchar(15) NOT NULL,
  `country` varchar(15) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`Authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('NEPCOMM01','DILIP','INDIA',39),('NEPCOMM02','SANGEETHA','INDIA',42),('NEPCOMP01','ARUNA','INDIA',36),('NEPCOMP02','SUMA','INDIA',38),('NEPSCI01','SHEKAR','INDIA',44);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Bookid` varchar(10) NOT NULL,
  `Bookname` varchar(15) NOT NULL,
  `Authorid` varchar(10) DEFAULT NULL,
  `publisher` varchar(20) NOT NULL,
  `Branchid` int DEFAULT NULL,
  PRIMARY KEY (`Bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('NEPDBMS','DBMS','NEPCOMP02','SKYWARD',10),('NEPJAVA','JAVA','NEPCOMM01','OXFORD',20),('NEPMATHS','MATHS','NEPSCI01','OXFORD',30),('NEPPHY','PHYSICS','NEPCOMM02','SHREE',40),('NEPSE','SE','NEPCOMP02','SKYWARD',10);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `USN` varchar(15) NOT NULL,
  `Bookid` varchar(10) NOT NULL,
  `Borrowed_Date` date DEFAULT NULL,
  PRIMARY KEY (`USN`,`Bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES ('SCAA202201','NEPPHY','2022-06-12'),('SCAC202204','NEPMATHS','2022-06-06'),('SCAS202201','NEPDBMS','2022-05-20'),('SCAS202201','NEPJAVA','2022-06-05'),('SCAS202201','NEPMATHS','2022-06-05'),('SCAS202201','NEPSE','2022-05-28'),('SCAS202203','NEPPHY','2022-06-12');
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branchid` int NOT NULL,
  `Branchname` varchar(15) NOT NULL,
  `HOD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (10,'MCA','Raj');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `USN` varchar(15) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Address` varchar(15) NOT NULL,
  `Branchid` int DEFAULT NULL,
  `SEM` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('SCAA202201','DEEPTI','GIRINAGAR',50,'IV SEM'),('SCAC202203','RENUKA','HANUMANTHNAGAR',20,'II SEM'),('SCAC202204','ARUN','JPNAGAR',30,'II SEM'),('SCAS202201','ANURADHA','JAYANAGAR',10,'II SEM'),('SCAS202202','MANJULA','BASAVANGUDI',10,'II SEM'),('SCAS202203','LAKSHMI','BASAVANGUDI',10,'IV SEM'),('SCAS202204','ABHI','GIRINAGAR',40,'II SEM');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 11:26:07
