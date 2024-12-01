-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: acharyapa
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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DNAME` varchar(15) NOT NULL,
  `DNUMBER` int NOT NULL,
  `MGR_SSN` char(9) NOT NULL,
  `MGR_START_DATE` date DEFAULT NULL,
  PRIMARY KEY (`DNUMBER`),
  UNIQUE KEY `DNAME` (`DNAME`),
  KEY `MGR_SSN` (`MGR_SSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGR_SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `ESSN` char(9) NOT NULL,
  `DEPENDENT_NAME` varchar(15) NOT NULL,
  `SEX` char(1) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `RELATIONSHIP` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`DEPENDENT_NAME`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-06-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `DNUMBER` int NOT NULL,
  `DLOCATION` varchar(15) NOT NULL,
  PRIMARY KEY (`DNUMBER`,`DLOCATION`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`DNUMBER`) REFERENCES `department` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'?Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emp_dept`
--

DROP TABLE IF EXISTS `emp_dept`;
/*!50001 DROP VIEW IF EXISTS `emp_dept`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emp_dept` AS SELECT 
 1 AS `SSN`,
 1 AS `FNAME`,
 1 AS `SALARY`,
 1 AS `DNO`,
 1 AS `DNAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `FNAME` varchar(15) NOT NULL,
  `MINT` char(1) DEFAULT NULL,
  `LNAME` varchar(15) NOT NULL,
  `SSN` char(9) NOT NULL,
  `BDATE` date DEFAULT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  `SUPER_SSN` char(9) DEFAULT NULL,
  `DNO` int NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith','123456789','1965-01-09','731 Fondren, Houston, TX','M',30000.00,'333445555',5),('Franklin','T','Wong','333445555','1955-12-08','638 Voss, Houston, TX','M',40000.00,'888665555',5),('Joyce','A','English','453453453','1972-07-31','5631 Rice, Houston, TX','F',25000.00,'333445555',5),('Ramesh','K','Narayan','666884444','1962-09-15','975 Fire Oak, Humble, TX','M',38000.00,'333445555',5),('James','E','Borg','888665555','1937-11-10','450 Stone, Houston, TX','M',55000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291 Berry, Bellaire, TX','F',43000.00,'888665555',4),('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas, Houston, TX','M',25000.00,'987654321',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321 Castle, Spring, TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `PNAME` varchar(15) NOT NULL,
  `PNUMBER` int NOT NULL,
  `PLOCATION` varchar(15) DEFAULT NULL,
  `DNUM` int NOT NULL,
  PRIMARY KEY (`PNUMBER`),
  UNIQUE KEY `PNAME` (`PNAME`),
  KEY `DNUM` (`DNUM`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNUM`) REFERENCES `department` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student2`
--

DROP TABLE IF EXISTS `student2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student2` (
  `USN` varchar(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `BRANCH` varchar(10) NOT NULL,
  `MARK1` int NOT NULL,
  `MARK2` int NOT NULL,
  `MARK3` int NOT NULL,
  `TOTAL` int DEFAULT NULL,
  `GPA` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`USN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student2`
--

LOCK TABLES `student2` WRITE;
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` VALUES ('SCA202201','JOJI','2004-08-14','BCA',85,96,97,278,NULL),('SCA202202','JOE','2004-01-17','BCA',77,87,91,255,NULL),('SCA202203','JOSEPH','2003-05-19','BCA',81,88,91,260,NULL),('SCA202204','JOEL','2003-06-01','BCA',82,92,95,269,NULL);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `ESSN` char(9) NOT NULL,
  `PNO` int NOT NULL,
  `HOURS` decimal(3,1) NOT NULL,
  PRIMARY KEY (`ESSN`,`PNO`),
  KEY `PNO` (`PNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,20.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `emp_dept`
--

/*!50001 DROP VIEW IF EXISTS `emp_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_dept` AS select `e`.`SSN` AS `SSN`,`e`.`FNAME` AS `FNAME`,`e`.`SALARY` AS `SALARY`,`e`.`DNO` AS `DNO`,`d`.`DNAME` AS `DNAME` from (`employee` `e` join `department` `d`) where (`e`.`DNO` = `d`.`DNUMBER`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 11:26:44
