-- MySQL dump 10.11
--
-- Host: localhost    Database: a290SQLDB
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Table structure for table `Agents`
--

DROP TABLE IF EXISTS `Agents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Agents` (
  `AgentID` int(11) NOT NULL,
  `AgtFirstName` varchar(25) character set utf8 default NULL,
  `AgtLastName` varchar(25) character set utf8 default NULL,
  `AgtStreetAddress` varchar(50) character set utf8 default NULL,
  `AgtCity` varchar(30) character set utf8 default NULL,
  `AgtState` varchar(2) character set utf8 default NULL,
  `AgtZipCode` varchar(10) character set utf8 default NULL,
  `AgtPhoneNumber` varchar(15) character set utf8 default NULL,
  `DateHired` datetime default NULL,
  `Salary` decimal(15,2) default NULL,
  `CommissionRate` float default NULL,
  PRIMARY KEY  (`AgentID`),
  UNIQUE KEY `AgentID` (`AgentID`),
  KEY `AgtZipCode` (`AgtZipCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Agents`
--

LOCK TABLES `Agents` WRITE;
/*!40000 ALTER TABLE `Agents` DISABLE KEYS */;
INSERT INTO `Agents` VALUES (1,'William','Thompson','122 Spring River Drive','Redmond','WA','98053','555-2681','1997-05-15 00:00:00','35000.00',0.04),(2,'Scott','Bishop','66 Spring Valley Drive','Seattle','WA','98125','555-2666','1998-02-05 00:00:00','27000.00',0.04),(3,'Carol','Viescas','667 Red River Road','Bellevue','WA','98006','555-2571','1997-11-19 00:00:00','30000.00',0.05),(4,'Karen','Smith','30301 - 166th Ave. N.E.','Seattle','WA','98125','555-2551','1998-03-05 00:00:00','22000.00',0.055),(5,'Marianne','Wier','908 W. Capital Way','Tacoma','WA','98413','555-2606','1998-02-02 00:00:00','24500.00',0.045),(6,'John','Kennedy','16679 NE 41st Court','Seattle','WA','98125','555-2621','1997-05-15 00:00:00','33000.00',0.06),(7,'Caleb','Viescas','4501 Wetland Road','Redmond','WA','98052','555-0037','1998-02-16 00:00:00','22100.00',0.035),(8,'Maria','Patterson','3445 Cheyenne Road','Bellevue','WA','98006','555-2291','1997-09-03 00:00:00','30000.00',0.04),(9,'Daffy','Dumbwit','1234 Main Street','Kirkland','WA','98033','555-1234','2000-02-05 00:00:00','50.00',0.01);
/*!40000 ALTER TABLE `Agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buildings`
--

DROP TABLE IF EXISTS `Buildings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Buildings` (
  `BuildingCode` varchar(3) character set utf8 NOT NULL,
  `BuildingName` varchar(25) character set utf8 default NULL,
  `NumberOfFloors` smallint(6) default NULL,
  `ElevatorAccess` tinyint(1) NOT NULL,
  `SiteParkingAvailable` tinyint(1) NOT NULL,
  PRIMARY KEY  (`BuildingCode`),
  UNIQUE KEY `BuildingNumber` (`BuildingCode`),
  KEY `NumberOfFloors` (`NumberOfFloors`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Buildings`
--

LOCK TABLES `Buildings` WRITE;
/*!40000 ALTER TABLE `Buildings` DISABLE KEYS */;
INSERT INTO `Buildings` VALUES ('AS','Arts and Sciences',3,1,1),('CC','College Center',3,1,0),('GYM','PE and Wellness',1,0,1),('IB','Instructional Building',3,1,1),('LB','Library',2,1,1),('TB','Technology Building',2,1,1);
/*!40000 ALTER TABLE `Buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Categories` (
  `CategoryID` varchar(10) character set utf8 NOT NULL,
  `CategoryDescription` varchar(75) character set utf8 default NULL,
  `DepartmentID` smallint(6) default NULL,
  PRIMARY KEY  (`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `DepartmentID` (`DepartmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES ('ACC','Accounting',1),('ART','Art',3),('BIO','Biology',2),('BUS','Business',1),('CHE','Chemistry',2),('CIS','Computer Information Systems',5),('CSC','Computer Science',5),('ECO','Economics',4),('ENG','English',3),('FRE','French',3),('GEG','Geography',4),('GER','German',3),('HIS','History',4),('JRN','Journalism',1),('MAT','Math',2),('MUS','Music',3),('PHY','Physics',2),('POL','Political Science',4),('PSY','Psychology',4);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_Rooms`
--

DROP TABLE IF EXISTS `Class_Rooms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Class_Rooms` (
  `ClassRoomID` smallint(6) NOT NULL,
  `BuildingCode` varchar(3) character set utf8 default NULL,
  `PhoneAvailable` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ClassRoomID`),
  UNIQUE KEY `RoomNumber` (`ClassRoomID`),
  KEY `BuildingNumber` (`BuildingCode`),
  KEY `BuildingsClassRooms` (`BuildingCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Class_Rooms`
--

LOCK TABLES `Class_Rooms` WRITE;
/*!40000 ALTER TABLE `Class_Rooms` DISABLE KEYS */;
INSERT INTO `Class_Rooms` VALUES (1131,'LB',1),(1142,'LB',0),(1231,'LB',1),(1514,'AS',1),(1515,'AS',1),(1519,'AS',0),(1525,'AS',1),(1530,'AS',1),(1532,'AS',0),(1619,'AS',0),(1622,'AS',1),(1624,'AS',0),(1627,'AS',0),(1639,'TB',1),(2357,'CC',1),(2408,'IB',0),(2423,'IB',0),(3305,'IB',1),(3307,'IB',0),(3309,'IB',0),(3313,'IB',0),(3315,'IB',0),(3317,'IB',1),(3319,'IB',0),(3322,'IB',0),(3330,'IB',1),(3343,'CC',0),(3345,'CC',0),(3346,'CC',1),(3352,'CC',1),(3353,'CC',0),(3355,'CC',0),(3404,'IB',0),(3406,'IB',1),(3409,'IB',1),(3415,'IB',1),(3420,'IB',0),(3422,'IB',1),(3431,'IB',0),(3443,'CC',0),(3445,'CC',1),(3446,'CC',0),(3452,'CC',0),(3455,'CC',1);
/*!40000 ALTER TABLE `Class_Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classes`
--

DROP TABLE IF EXISTS `Classes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Classes` (
  `ClassID` smallint(6) NOT NULL,
  `SubjectID` smallint(6) default NULL,
  `ClassRoomID` smallint(6) default NULL,
  `Credits` smallint(6) default NULL,
  `StartTime` time default NULL,
  `Duration` double default NULL,
  `MondaySchedule` tinyint(1) NOT NULL,
  `TuesdaySchedule` tinyint(1) NOT NULL,
  `WednesdaySchedule` tinyint(1) NOT NULL,
  `ThursdaySchedule` tinyint(1) NOT NULL,
  `FridaySchedule` tinyint(1) NOT NULL,
  `SaturdaySchedule` tinyint(1) NOT NULL,
  PRIMARY KEY  (`ClassID`),
  UNIQUE KEY `ClassID` (`ClassID`),
  KEY `ClassesCategoryID` (`SubjectID`),
  KEY `ClassRoomID` (`ClassRoomID`),
  KEY `ClassRoomsClasses` (`ClassRoomID`),
  KEY `SubjectsClasses` (`SubjectID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Classes`
--

LOCK TABLES `Classes` WRITE;
/*!40000 ALTER TABLE `Classes` DISABLE KEYS */;
INSERT INTO `Classes` VALUES (1000,11,1231,5,'10:00:00',50,1,0,1,0,1,0),(1002,12,1619,4,'15:30:00',110,1,0,1,0,1,0),(1004,13,1627,4,'08:00:00',50,1,0,1,0,1,0),(1006,13,1627,4,'09:00:00',110,1,0,1,0,1,0),(1012,14,1627,4,'13:00:00',170,0,1,0,1,0,0),(1020,15,3404,4,'13:00:00',110,1,0,1,0,1,0),(1030,16,1231,5,'11:00:00',50,1,1,1,1,1,0),(1031,16,1231,5,'14:00:00',50,1,1,1,1,1,0),(1156,37,3443,5,'08:00:00',50,1,1,1,1,1,0),(1162,37,3443,5,'09:00:00',80,1,0,1,0,1,0),(1168,37,3445,5,'11:00:00',50,1,1,1,1,1,0),(1180,38,3446,5,'11:30:00',80,1,0,1,0,1,0),(1183,38,3415,5,'13:00:00',50,1,1,1,1,1,0),(1184,38,3415,5,'14:00:00',50,1,1,1,1,1,0),(1196,39,3415,5,'15:00:00',50,1,1,1,1,1,0),(1500,33,1142,5,'08:00:00',50,1,1,1,1,1,0),(1502,34,1142,5,'09:00:00',50,1,1,1,1,1,0),(1560,35,2408,3,'10:00:00',50,1,0,1,0,1,0),(1562,36,2408,5,'12:00:00',110,1,0,1,0,0,0),(1642,29,1514,2,'11:00:00',70,0,1,0,1,0,0),(2001,20,1519,5,'07:30:00',110,1,0,1,0,0,0),(2005,20,1515,5,'11:00:00',50,1,0,1,1,0,0),(2015,21,1131,5,'09:00:00',110,1,0,1,0,1,0),(2051,22,1515,4,'13:00:00',50,1,1,1,1,0,0),(2071,50,1624,5,'10:00:00',50,1,1,1,1,1,0),(2075,51,1624,5,'07:00:00',110,1,0,1,0,1,0),(2089,52,1624,5,'12:00:00',50,1,1,0,1,1,0),(2103,53,1624,5,'11:00:00',50,1,1,0,1,1,0),(2213,17,1532,5,'10:00:00',110,1,0,1,1,0,0),(2223,18,1532,5,'12:00:00',50,1,0,1,0,1,0),(2245,19,1530,5,'13:30:00',110,1,0,1,0,0,0),(2431,27,3322,5,'09:00:00',50,1,0,1,0,1,0),(2451,27,1639,5,'13:00:00',50,1,0,1,0,1,0),(2633,48,3420,5,'16:00:00',50,0,1,0,1,0,0),(2639,49,3353,3,'09:00:00',50,1,0,1,0,1,0),(2647,49,3353,3,'18:00:00',50,0,1,0,1,0,0),(2889,45,2423,5,'09:00:00',50,1,1,1,1,1,0),(2891,45,2423,5,'11:00:00',50,1,1,1,1,1,0),(2895,45,2423,5,'13:00:00',50,1,1,1,1,1,0),(2907,46,3445,5,'08:00:00',50,1,1,1,1,1,0),(2911,46,3445,5,'12:00:00',50,1,1,1,1,1,0),(2915,46,3353,5,'10:00:00',50,1,1,1,1,1,0),(2917,47,3422,5,'14:00:00',50,1,1,1,1,1,0),(2925,47,3422,5,'15:00:00',50,1,0,1,0,1,0),(2933,47,3422,5,'09:00:00',240,0,0,0,0,0,1),(3030,30,3352,5,'09:00:00',80,1,0,1,0,1,0),(3031,30,3352,5,'13:30:00',80,1,0,1,0,1,0),(3040,31,3352,5,'11:00:00',50,1,1,1,1,1,0),(3045,31,3352,5,'12:00:00',50,1,1,1,1,1,0),(3050,32,3343,5,'10:00:00',50,1,1,1,1,1,0),(3055,32,3317,5,'15:00:00',50,1,1,1,1,1,0),(3065,40,3345,5,'08:00:00',110,1,0,1,0,1,0),(3070,42,3346,5,'10:30:00',140,1,0,1,0,1,0),(3082,44,3346,5,'08:00:00',50,1,1,1,1,1,0),(3085,43,3346,5,'09:00:00',50,1,1,1,1,1,0),(3090,44,3346,5,'13:30:00',110,1,0,1,0,1,0),(3115,54,3352,5,'08:00:00',50,1,1,1,1,1,0),(3120,54,3352,5,'10:00:00',50,1,1,1,1,1,0),(3123,56,3346,5,'12:00:00',110,1,0,1,0,1,0),(3600,41,3420,5,'13:00:00',140,1,0,1,0,0,0),(4025,4,3315,5,'11:00:00',50,1,0,1,0,1,0),(4055,5,3313,5,'14:00:00',50,1,0,1,0,1,0),(4172,8,3317,3,'09:00:00',50,1,0,1,0,1,0),(4192,9,3309,4,'08:00:00',50,1,1,1,1,1,0),(4196,10,3309,4,'10:30:00',140,0,1,0,1,0,0),(4750,1,3313,5,'09:00:00',50,1,1,0,1,1,0),(4751,1,3313,5,'13:00:00',50,1,1,0,1,1,0),(4755,2,3415,5,'08:00:00',50,1,1,1,1,0,0),(4760,3,3415,5,'10:00:00',50,1,1,0,1,1,0),(4768,6,3307,5,'15:00:00',110,0,1,1,1,0,0),(4800,23,3305,5,'08:00:00',50,1,0,1,0,1,0),(4810,23,3319,5,'08:00:00',50,0,1,0,1,0,0),(4812,24,3330,3,'12:00:00',80,0,1,0,1,0,0),(4813,24,3406,3,'10:00:00',50,1,0,1,0,1,0),(4825,25,3319,5,'11:00:00',50,1,1,1,1,1,0),(4880,26,1231,5,'13:30:00',110,1,0,1,0,1,0);
/*!40000 ALTER TABLE `Classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL,
  `CustFirstName` varchar(25) character set utf8 default NULL,
  `CustLastName` varchar(25) character set utf8 default NULL,
  `CustStreetAddress` varchar(50) character set utf8 default NULL,
  `CustCity` varchar(30) character set utf8 default NULL,
  `CustState` varchar(2) character set utf8 default NULL,
  `CustZipCode` varchar(10) character set utf8 default NULL,
  `CustPhoneNumber` varchar(15) character set utf8 default NULL,
  PRIMARY KEY  (`CustomerID`),
  UNIQUE KEY `CustomerID` (`CustomerID`),
  KEY `CustZipCode` (`CustZipCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (10001,'Doris','Hartwig','4726 - 11th Ave. N.E.','Seattle','WA','98105','555-2671'),(10002,'Deb','Waldal','908 W. Capital Way','Tacoma','WA','98413','555-2496'),(10003,'Peter','Brehm','722 Moss Bay Blvd.','Kirkland','WA','98033','555-2501'),(10004,'Dean','McCrae','4110 Old Redmond Rd.','Redmond','WA','98052','555-2506'),(10005,'Elizabeth','Hallmark','Route 2, Box 203B','Auburn','WA','98002','555-2521'),(10006,'Matt','Berg','908 W. Capital Way','Tacoma','WA','98413','555-2581'),(10007,'Liz','Keyser','13920 S.E. 40th Street','Bellevue','WA','98006','555-2556'),(10008,'Darren','Gehring','2601 Seaview Lane','Kirkland','WA','98033','555-2616'),(10009,'Sarah','Thompson','2222 Springer Road','Bellevue','WA','98006','555-2626'),(10010,'Zachary','Ehrlich','12330 Kingman Drive','Kirkland','WA','98033','555-2721'),(10011,'Joyce','Bonnicksen','2424 Thames Drive','Bellevue','WA','98006','555-2726'),(10012,'Kerry','Patterson','777 Fenexet Blvd','Redmond','WA','98052','555-0399'),(10013,'Estella','Pundt','2500 Rosales Lane','Bellevue','WA','98006','555-9938'),(10014,'Mark','Rosales','323 Advocate Lane','Bellevue','WA','98006','555-2286'),(10015,'Carol','Viescas','754 Fourth Ave','Seattle','WA','98115','555-2296');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Engagements`
--

DROP TABLE IF EXISTS `Engagements`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Engagements` (
  `EngagementNumber` smallint(6) NOT NULL,
  `StartDate` datetime default NULL,
  `EndDate` datetime default NULL,
  `StartTime` time default NULL,
  `StopTime` time default NULL,
  `ContractPrice` decimal(15,2) default NULL,
  `CustomerID` int(11) default NULL,
  `AgentID` int(11) default NULL,
  `EntertainerID` int(11) default NULL,
  PRIMARY KEY  (`EngagementNumber`),
  KEY `AgentsEngagements` (`AgentID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CustomersEngagements` (`CustomerID`),
  KEY `EmployeeID` (`AgentID`),
  KEY `EntertainerID` (`EntertainerID`),
  KEY `EntertainersEngagements` (`EntertainerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Engagements`
--

LOCK TABLES `Engagements` WRITE;
/*!40000 ALTER TABLE `Engagements` DISABLE KEYS */;
INSERT INTO `Engagements` VALUES (2,'2007-09-01 00:00:00','2007-09-05 00:00:00','13:00:00','15:00:00','200.00',10006,4,1004),(3,'2007-09-10 00:00:00','2007-09-15 00:00:00','13:00:00','15:00:00','590.00',10001,3,1005),(4,'2007-09-11 00:00:00','2007-09-17 00:00:00','20:00:00','00:00:00','470.00',10007,3,1004),(5,'2007-09-11 00:00:00','2007-09-14 00:00:00','16:00:00','19:00:00','1130.00',10006,5,1003),(6,'2007-09-10 00:00:00','2007-09-14 00:00:00','15:00:00','21:00:00','2300.00',10014,7,1008),(7,'2007-09-11 00:00:00','2007-09-18 00:00:00','17:00:00','20:00:00','770.00',10004,4,1002),(8,'2007-09-18 00:00:00','2007-09-25 00:00:00','20:00:00','23:00:00','1850.00',10006,3,1007),(9,'2007-09-18 00:00:00','2007-09-28 00:00:00','19:00:00','21:00:00','1370.00',10010,2,1010),(10,'2007-09-17 00:00:00','2007-09-26 00:00:00','13:00:00','17:00:00','3650.00',10005,3,1003),(11,'2007-09-15 00:00:00','2007-09-16 00:00:00','18:00:00','00:00:00','950.00',10005,4,1008),(12,'2007-09-18 00:00:00','2007-09-26 00:00:00','18:00:00','22:00:00','1670.00',10014,8,1001),(13,'2007-09-17 00:00:00','2007-09-20 00:00:00','20:00:00','23:00:00','770.00',10003,1,1006),(14,'2007-09-24 00:00:00','2007-09-29 00:00:00','16:00:00','22:00:00','2750.00',10001,1,1008),(15,'2007-09-24 00:00:00','2007-09-29 00:00:00','17:00:00','19:00:00','770.00',10007,1,1013),(16,'2007-10-02 00:00:00','2007-10-06 00:00:00','20:00:00','01:00:00','1550.00',10010,5,1013),(17,'2007-09-29 00:00:00','2007-10-02 00:00:00','18:00:00','20:00:00','530.00',10002,8,1010),(19,'2007-09-29 00:00:00','2007-10-05 00:00:00','20:00:00','23:00:00','365.00',10009,8,1004),(21,'2007-09-30 00:00:00','2007-10-03 00:00:00','12:00:00','16:00:00','1490.00',10005,1,1003),(22,'2007-09-30 00:00:00','2007-10-05 00:00:00','12:00:00','15:00:00','590.00',10004,5,1002),(23,'2007-09-30 00:00:00','2007-09-30 00:00:00','20:00:00','00:00:00','290.00',10012,4,1013),(24,'2007-10-01 00:00:00','2007-10-07 00:00:00','12:00:00','18:00:00','1940.00',10001,4,1001),(26,'2007-10-09 00:00:00','2007-10-14 00:00:00','17:00:00','22:00:00','950.00',10001,6,1002),(27,'2007-10-07 00:00:00','2007-10-12 00:00:00','12:00:00','16:00:00','2210.00',10015,7,1003),(28,'2007-10-06 00:00:00','2007-10-15 00:00:00','17:00:00','22:00:00','3800.00',10003,4,1007),(30,'2007-10-06 00:00:00','2007-10-08 00:00:00','17:00:00','22:00:00','275.00',10009,5,1011),(31,'2007-10-07 00:00:00','2007-10-16 00:00:00','16:00:00','20:00:00','2450.00',10002,8,1010),(32,'2007-10-07 00:00:00','2007-10-16 00:00:00','13:00:00','15:00:00','1250.00',10010,7,1013),(34,'2007-10-14 00:00:00','2007-10-20 00:00:00','16:00:00','18:00:00','680.00',10004,8,1005),(35,'2007-10-14 00:00:00','2007-10-15 00:00:00','19:00:00','23:00:00','410.00',10005,8,1001),(36,'2007-10-13 00:00:00','2007-10-23 00:00:00','18:00:00','22:00:00','710.00',10014,3,1011),(37,'2007-10-13 00:00:00','2007-10-19 00:00:00','14:00:00','19:00:00','2675.00',10006,3,1008),(38,'2007-10-14 00:00:00','2007-10-18 00:00:00','14:00:00','20:00:00','1850.00',10013,4,1006),(41,'2007-10-20 00:00:00','2007-10-28 00:00:00','18:00:00','21:00:00','860.00',10013,3,1002),(42,'2007-10-20 00:00:00','2007-10-26 00:00:00','17:00:00','22:00:00','2150.00',10002,1,1013),(43,'2007-10-21 00:00:00','2007-10-21 00:00:00','14:00:00','16:00:00','140.00',10001,8,1001),(44,'2007-10-22 00:00:00','2007-10-26 00:00:00','14:00:00','19:00:00','1925.00',10006,3,1008),(45,'2007-10-21 00:00:00','2007-10-28 00:00:00','14:00:00','18:00:00','530.00',10015,1,1012),(46,'2007-10-28 00:00:00','2007-11-05 00:00:00','15:00:00','17:00:00','1400.00',10009,4,1008),(48,'2007-11-05 00:00:00','2007-11-06 00:00:00','16:00:00','22:00:00','950.00',10002,1,1007),(49,'2007-11-13 00:00:00','2007-11-19 00:00:00','12:00:00','14:00:00','680.00',10014,5,1001),(51,'2007-11-13 00:00:00','2007-11-14 00:00:00','20:00:00','01:00:00','650.00',10013,3,1013),(52,'2007-11-13 00:00:00','2007-11-14 00:00:00','16:00:00','21:00:00','650.00',10010,3,1006),(53,'2007-11-11 00:00:00','2007-11-12 00:00:00','17:00:00','19:00:00','350.00',10002,5,1007),(55,'2007-11-19 00:00:00','2007-11-26 00:00:00','20:00:00','02:00:00','770.00',10002,3,1011),(56,'2007-11-25 00:00:00','2007-11-28 00:00:00','14:00:00','19:00:00','1550.00',10010,3,1007),(58,'2007-12-01 00:00:00','2007-12-04 00:00:00','17:00:00','23:00:00','770.00',10001,2,1002),(59,'2007-12-01 00:00:00','2007-12-04 00:00:00','15:00:00','19:00:00','290.00',10004,6,1012),(60,'2007-12-02 00:00:00','2007-12-04 00:00:00','13:00:00','17:00:00','230.00',10010,8,1004),(61,'2007-12-03 00:00:00','2007-12-10 00:00:00','17:00:00','20:00:00','410.00',10015,8,1011),(62,'2007-12-09 00:00:00','2007-12-10 00:00:00','20:00:00','01:00:00','500.00',10003,2,1005),(63,'2007-12-18 00:00:00','2007-12-21 00:00:00','14:00:00','16:00:00','650.00',10009,3,1008),(64,'2007-12-25 00:00:00','2008-01-03 00:00:00','14:00:00','16:00:00','1250.00',10007,3,1013),(66,'2007-12-22 00:00:00','2007-12-29 00:00:00','20:00:00','02:00:00','2930.00',10005,5,1006),(68,'2007-12-24 00:00:00','2007-12-29 00:00:00','16:00:00','22:00:00','1670.00',10009,1,1005),(69,'2007-12-22 00:00:00','2007-12-23 00:00:00','15:00:00','18:00:00','500.00',10004,7,1008),(70,'2007-12-23 00:00:00','2007-12-26 00:00:00','13:00:00','15:00:00','410.00',10010,6,1001),(71,'2007-12-22 00:00:00','2007-12-27 00:00:00','14:00:00','17:00:00','1670.00',10002,1,1003),(72,'2007-12-22 00:00:00','2008-01-01 00:00:00','20:00:00','01:00:00','875.00',10012,4,1011),(73,'2007-12-29 00:00:00','2008-01-07 00:00:00','19:00:00','22:00:00','1400.00',10014,5,1001),(74,'2008-01-01 00:00:00','2008-01-06 00:00:00','13:00:00','15:00:00','590.00',10004,1,1005),(75,'2008-01-01 00:00:00','2008-01-11 00:00:00','17:00:00','20:00:00','2525.00',10001,7,1007),(76,'2007-12-30 00:00:00','2008-01-03 00:00:00','16:00:00','22:00:00','500.00',10005,7,1012),(77,'2007-12-30 00:00:00','2008-01-04 00:00:00','17:00:00','20:00:00','1670.00',10015,5,1003),(78,'2008-01-01 00:00:00','2008-01-03 00:00:00','16:00:00','20:00:00','770.00',10010,4,1010),(79,'2007-12-30 00:00:00','2008-01-03 00:00:00','12:00:00','17:00:00','1550.00',10006,8,1006),(80,'2007-12-31 00:00:00','2008-01-01 00:00:00','17:00:00','21:00:00','650.00',10002,5,1008),(81,'2008-01-01 00:00:00','2008-01-09 00:00:00','13:00:00','17:00:00','1130.00',10013,4,1002),(82,'2008-01-08 00:00:00','2008-01-09 00:00:00','20:00:00','01:00:00','950.00',10014,8,1003),(83,'2008-01-06 00:00:00','2008-01-10 00:00:00','13:00:00','15:00:00','650.00',10010,2,1006),(84,'2008-01-06 00:00:00','2008-01-11 00:00:00','17:00:00','19:00:00','230.00',10007,3,1012),(85,'2008-01-06 00:00:00','2008-01-08 00:00:00','14:00:00','19:00:00','1175.00',10015,4,1008),(87,'2008-01-04 00:00:00','2008-01-06 00:00:00','16:00:00','19:00:00','275.00',10007,6,1008),(88,'2008-01-07 00:00:00','2008-01-17 00:00:00','12:00:00','14:00:00','1370.00',10004,8,1013),(89,'2008-01-06 00:00:00','2008-01-07 00:00:00','14:00:00','16:00:00','290.00',10003,8,1010),(90,'2008-01-08 00:00:00','2008-01-08 00:00:00','20:00:00','02:00:00','320.00',10006,5,1001),(91,'2008-01-05 00:00:00','2008-01-12 00:00:00','13:00:00','19:00:00','770.00',10009,3,1004),(92,'2008-01-12 00:00:00','2008-01-16 00:00:00','19:00:00','00:00:00','1925.00',10012,6,1008),(95,'2008-01-15 00:00:00','2008-01-18 00:00:00','20:00:00','01:00:00','1550.00',10010,6,1007),(96,'2008-01-22 00:00:00','2008-01-31 00:00:00','15:00:00','17:00:00','950.00',10009,6,1005),(97,'2008-01-19 00:00:00','2008-01-19 00:00:00','17:00:00','21:00:00','110.00',10012,8,1004),(98,'2008-01-20 00:00:00','2008-01-27 00:00:00','20:00:00','02:00:00','2930.00',10012,2,1010),(99,'2008-01-22 00:00:00','2008-02-22 00:00:00','14:00:00','20:00:00','14105.00',10005,6,1008),(100,'2008-01-19 00:00:00','2008-01-23 00:00:00','12:00:00','18:00:00','1850.00',10015,3,1006),(101,'2008-01-22 00:00:00','2008-01-30 00:00:00','14:00:00','18:00:00','1670.00',10004,5,1001),(102,'2008-01-22 00:00:00','2008-01-31 00:00:00','12:00:00','15:00:00','2300.00',10013,5,1007),(103,'2008-01-21 00:00:00','2008-01-27 00:00:00','12:00:00','17:00:00','575.00',10010,4,1011),(104,'2008-01-28 00:00:00','2008-02-01 00:00:00','13:00:00','16:00:00','1400.00',10010,6,1003),(105,'2008-01-27 00:00:00','2008-02-01 00:00:00','12:00:00','17:00:00','1850.00',10002,4,1013),(106,'2008-01-29 00:00:00','2008-02-01 00:00:00','15:00:00','18:00:00','770.00',10003,6,1006),(107,'2008-01-29 00:00:00','2008-01-30 00:00:00','16:00:00','21:00:00','200.00',10007,4,1004),(108,'2008-02-02 00:00:00','2008-02-04 00:00:00','18:00:00','00:00:00','320.00',10004,5,1012),(109,'2008-02-11 00:00:00','2008-02-15 00:00:00','13:00:00','19:00:00','1850.00',10014,5,1010),(110,'2008-02-11 00:00:00','2008-02-19 00:00:00','15:00:00','19:00:00','1670.00',10006,8,1001),(111,'2008-02-12 00:00:00','2008-02-14 00:00:00','15:00:00','18:00:00','185.00',10012,1,1004),(112,'2008-02-19 00:00:00','2008-02-24 00:00:00','18:00:00','22:00:00','410.00',10015,7,1011),(114,'2008-02-19 00:00:00','2008-02-28 00:00:00','12:00:00','17:00:00','1550.00',10005,1,1002),(115,'2008-02-19 00:00:00','2008-02-22 00:00:00','12:00:00','18:00:00','1490.00',10007,5,1013),(116,'2008-02-16 00:00:00','2008-02-25 00:00:00','14:00:00','19:00:00','800.00',10003,6,1012),(118,'2008-02-18 00:00:00','2008-02-18 00:00:00','19:00:00','00:00:00','350.00',10014,1,1010),(119,'2008-02-19 00:00:00','2008-02-28 00:00:00','18:00:00','21:00:00','500.00',10012,2,1004),(120,'2008-02-17 00:00:00','2008-02-20 00:00:00','20:00:00','23:00:00','950.00',10002,7,1008),(121,'2008-02-16 00:00:00','2008-02-22 00:00:00','17:00:00','23:00:00','2570.00',10004,3,1006),(122,'2008-02-24 00:00:00','2008-02-27 00:00:00','15:00:00','19:00:00','1010.00',10014,5,1010),(123,'2008-02-25 00:00:00','2008-02-28 00:00:00','16:00:00','20:00:00','770.00',10013,1,1001),(124,'2008-02-23 00:00:00','2008-03-01 00:00:00','14:00:00','17:00:00','1850.00',10006,1,1008),(125,'2008-02-23 00:00:00','2008-02-28 00:00:00','13:00:00','15:00:00','1130.00',10001,3,1003),(126,'2008-02-24 00:00:00','2008-03-02 00:00:00','18:00:00','20:00:00','1010.00',10009,6,1006),(127,'2008-02-24 00:00:00','2008-02-28 00:00:00','20:00:00','22:00:00','500.00',10010,4,1005),(128,'2008-02-26 00:00:00','2008-02-28 00:00:00','19:00:00','01:00:00','320.00',10003,4,1011),(129,'2008-02-24 00:00:00','2008-03-04 00:00:00','17:00:00','21:00:00','2450.00',10004,5,1013),(131,'2008-03-02 00:00:00','2008-03-11 00:00:00','15:00:00','17:00:00','1850.00',10014,1,1003);
/*!40000 ALTER TABLE `Engagements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entertainer_Members`
--

DROP TABLE IF EXISTS `Entertainer_Members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Entertainer_Members` (
  `EntertainerID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `Status` smallint(6) default NULL,
  PRIMARY KEY  (`EntertainerID`,`MemberID`),
  KEY `EntertainersEntertainerMembers` (`EntertainerID`),
  KEY `MembersEntertainerMembers` (`MemberID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Entertainer_Members`
--

LOCK TABLES `Entertainer_Members` WRITE;
/*!40000 ALTER TABLE `Entertainer_Members` DISABLE KEYS */;
INSERT INTO `Entertainer_Members` VALUES (1001,106,1),(1001,107,1),(1001,118,2),(1002,120,2),(1002,121,1),(1003,102,1),(1003,103,1),(1003,104,1),(1003,109,1),(1003,117,1),(1003,119,2),(1004,125,2),(1005,116,1),(1005,120,2),(1005,121,1),(1006,104,1),(1006,113,1),(1006,118,1),(1006,120,2),(1007,101,1),(1007,102,1),(1007,105,1),(1007,107,2),(1007,110,1),(1008,103,1),(1008,105,1),(1008,111,1),(1008,114,2),(1008,115,1),(1009,121,2),(1010,108,1),(1010,112,2),(1010,123,1),(1010,124,1),(1011,122,2),(1012,123,2),(1013,112,1),(1013,114,1),(1013,117,1),(1013,124,2);
/*!40000 ALTER TABLE `Entertainer_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entertainer_Styles`
--

DROP TABLE IF EXISTS `Entertainer_Styles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Entertainer_Styles` (
  `EntertainerID` int(11) NOT NULL,
  `StyleID` smallint(6) NOT NULL,
  PRIMARY KEY  (`EntertainerID`,`StyleID`),
  KEY `EntertainersEntertainerStyles` (`EntertainerID`),
  KEY `MusicalStylesEntStyles` (`StyleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Entertainer_Styles`
--

LOCK TABLES `Entertainer_Styles` WRITE;
/*!40000 ALTER TABLE `Entertainer_Styles` DISABLE KEYS */;
INSERT INTO `Entertainer_Styles` VALUES (1001,10),(1001,20),(1001,21),(1002,17),(1002,19),(1002,23),(1003,3),(1003,8),(1004,13),(1005,15),(1005,19),(1005,24),(1006,22),(1006,23),(1006,24),(1007,6),(1007,11),(1008,3),(1008,6),(1009,7),(1009,14),(1009,21),(1010,4),(1010,21),(1010,22),(1011,7),(1011,14),(1011,20),(1012,7),(1012,13),(1013,10),(1013,15);
/*!40000 ALTER TABLE `Entertainer_Styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entertainers`
--

DROP TABLE IF EXISTS `Entertainers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Entertainers` (
  `EntertainerID` int(11) NOT NULL,
  `EntStageName` varchar(50) character set utf8 default NULL,
  `EntSSN` varchar(12) character set utf8 default NULL,
  `EntStreetAddress` varchar(50) character set utf8 default NULL,
  `EntCity` varchar(30) character set utf8 default NULL,
  `EntState` varchar(2) character set utf8 default NULL,
  `EntZipCode` varchar(10) character set utf8 default NULL,
  `EntPhoneNumber` varchar(15) character set utf8 default NULL,
  `EntWebPage` varchar(50) character set utf8 default NULL,
  `EntEMailAddress` varchar(50) character set utf8 default NULL,
  `DateEntered` datetime default NULL,
  PRIMARY KEY  (`EntertainerID`),
  UNIQUE KEY `EntertainerID` (`EntertainerID`),
  KEY `EntZipCode` (`EntZipCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Entertainers`
--

LOCK TABLES `Entertainers` WRITE;
/*!40000 ALTER TABLE `Entertainers` DISABLE KEYS */;
INSERT INTO `Entertainers` VALUES (1001,'Carol Peacock Trio','888-90-1121','4110 Old Redmond Rd.','Redmond','WA','98052','555-2691','www.cptrio.com','carolp@cptrio.com','1997-05-24 00:00:00'),(1002,'Topazz','888-50-1061','16 Maple Lane','Auburn','WA','98002','555-2591','www.topazz.com',NULL,'1996-02-14 00:00:00'),(1003,'JV & the Deep Six','888-18-1013','15127 NE 24th, #383','Redmond','WA','98052','555-2511','www.jvd6.com','jv@myspring.com','1998-03-18 00:00:00'),(1004,'Jim Glynn','888-26-1025','13920 S.E. 40th Street','Bellevue','WA','98009','555-2531',NULL,NULL,'1996-04-01 00:00:00'),(1005,'Jazz Persuasion','888-30-1031','233 West Valley Hwy','Bellevue','WA','98005','555-2541','www.jazzper.com',NULL,'1997-05-12 00:00:00'),(1006,'Modern Dance','888-66-1085','Route 2, Box 203B','Woodinville','WA','98072','555-2631','www.moderndance.com','mikeh@moderndance.com','1995-05-16 00:00:00'),(1007,'Coldwater Cattle Company','888-38-1043','4726 - 11th Ave. N.E.','Seattle','WA','98105','555-2561','www.coldwatercows.com',NULL,'1995-11-30 00:00:00'),(1008,'Country Feeling','888-98-1133','PO Box 223311','Seattle','WA','98125','555-2711',NULL,NULL,'1996-02-28 00:00:00'),(1009,'Katherine Ehrlich','888-61-1103','777 Fenexet Blvd','Woodinville','WA','98072','555-0399',NULL,'ke@mzo.com','1998-09-13 00:00:00'),(1010,'Saturday Revue','888-64-1109','3887 Easy Street','Seattle','WA','98125','555-0039','www.satrevue.com','edz@coolness.com','1995-01-20 00:00:00'),(1011,'Julia Schnebly','888-65-1111','2343 Harmony Lane','Seattle','WA','99837','555-9936',NULL,NULL,'1996-04-12 00:00:00'),(1012,'Susan McLain','888-70-1121','511 Lenora Ave','Bellevue','WA','98006','555-2301','www.greensleeves.com','susan@gs.com','1998-10-12 00:00:00'),(1013,'Caroline Coie Cuartet','888-71-1123','298 Forest Lane','Auburn','WA','98002','555-2306',NULL,'carolinec@willow.com','1997-07-11 00:00:00');
/*!40000 ALTER TABLE `Entertainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Faculty` (
  `StaffID` int(11) NOT NULL,
  `Title` varchar(50) character set utf8 default NULL,
  `Status` varchar(12) character set utf8 default NULL,
  `Tenured` tinyint(1) NOT NULL,
  PRIMARY KEY  (`StaffID`),
  UNIQUE KEY `StaffFaculty` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (98005,'Instructor','Full Time',1),(98007,'Associate Professor','Full Time',1),(98010,'Associate Professor','On Leave',1),(98011,'Instructor','Full Time',1),(98012,'Instructor','Full Time',1),(98013,'Instructor','Full Time',1),(98014,'Professor','Full Time',1),(98019,'Instructor','Full Time',1),(98020,'Instructor','Full Time',1),(98025,'Associate Professor','Full Time',1),(98028,'Professor','Full Time',1),(98030,'Instructor','Full Time',1),(98036,'Professor','Full Time',1),(98040,'Associate Professor','Full Time',1),(98042,'Associate Professor','Full Time',1),(98045,'Professor','Full Time',1),(98048,'Professor','Full Time',1),(98052,'Instructor','Part Time',0),(98053,'Instructor','Full Time',1),(98055,'Professor','Full Time',1),(98059,'Instructor','Full Time',1),(98062,'Associate Professor','Full Time',0),(98063,'Instructor','Full Time',1),(98064,'Professor','Full Time',1);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty_Categories`
--

DROP TABLE IF EXISTS `Faculty_Categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Faculty_Categories` (
  `StaffID` int(11) NOT NULL,
  `CategoryID` varchar(10) character set utf8 NOT NULL,
  PRIMARY KEY  (`StaffID`,`CategoryID`),
  KEY `CategoriesFaculty_Categories` (`CategoryID`),
  KEY `FacultyFaculty_Categories` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Faculty_Categories`
--

LOCK TABLES `Faculty_Categories` WRITE;
/*!40000 ALTER TABLE `Faculty_Categories` DISABLE KEYS */;
INSERT INTO `Faculty_Categories` VALUES (98005,'ART'),(98005,'ENG'),(98005,'MUS'),(98007,'ACC'),(98007,'ART'),(98007,'CIS'),(98007,'MAT'),(98010,'ACC'),(98010,'CIS'),(98010,'MAT'),(98011,'ENG'),(98011,'HIS'),(98011,'MAT'),(98012,'ACC'),(98012,'ECO'),(98012,'MAT'),(98013,'CIS'),(98013,'CSC'),(98013,'MAT'),(98014,'ART'),(98014,'ENG'),(98014,'HIS'),(98019,'ART'),(98019,'ECO'),(98019,'MAT'),(98020,'CHE'),(98020,'CIS'),(98020,'PHY'),(98025,'ACC'),(98025,'BUS'),(98025,'MAT'),(98028,'ART'),(98028,'ENG'),(98028,'MUS'),(98030,'ART'),(98030,'ECO'),(98030,'HIS'),(98030,'MAT'),(98036,'ART'),(98036,'ENG'),(98036,'MUS'),(98040,'CIS'),(98040,'CSC'),(98040,'MAT'),(98042,'ECO'),(98042,'GEG'),(98042,'POL'),(98045,'ART'),(98045,'CIS'),(98045,'MUS'),(98048,'BUS'),(98048,'ECO'),(98048,'POL'),(98052,'BIO'),(98052,'CHE'),(98052,'MAT'),(98052,'PHY'),(98053,'BIO'),(98053,'CHE'),(98053,'PHY'),(98055,'ACC'),(98055,'BUS'),(98055,'ENG'),(98055,'MAT'),(98059,'ECO'),(98059,'HIS'),(98059,'POL'),(98062,'ACC'),(98062,'BUS'),(98062,'MAT'),(98063,'BIO'),(98063,'CHE'),(98063,'PHY'),(98064,'ENG'),(98064,'GEG'),(98064,'JRN');
/*!40000 ALTER TABLE `Faculty_Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty_Classes`
--

DROP TABLE IF EXISTS `Faculty_Classes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Faculty_Classes` (
  `ClassID` smallint(6) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY  (`ClassID`,`StaffID`),
  KEY `ClassesFacultyClasses` (`ClassID`),
  KEY `StaffFacultyClasses` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Faculty_Classes`
--

LOCK TABLES `Faculty_Classes` WRITE;
/*!40000 ALTER TABLE `Faculty_Classes` DISABLE KEYS */;
INSERT INTO `Faculty_Classes` VALUES (1000,98014),(1002,98036),(1004,98019),(1006,98045),(1012,98030),(1020,98028),(1030,98036),(1031,98005),(1156,98055),(1162,98064),(1168,98055),(1180,98011),(1183,98005),(1184,98011),(1196,98028),(1500,98028),(1502,98036),(1560,98028),(1562,98036),(2001,98020),(2005,98063),(2015,98053),(2051,98020),(2071,98020),(2075,98053),(2089,98052),(2103,98053),(2213,98052),(2223,98053),(2245,98063),(2431,98012),(2451,98040),(2633,98030),(2639,98011),(2647,98011),(2889,98040),(2891,98012),(2895,98013),(2907,98013),(2911,98013),(2915,98013),(2917,98025),(2925,98019),(2933,98025),(3030,98048),(3031,98030),(3040,98059),(3045,98042),(3050,98012),(3055,98012),(3065,98042),(3070,98030),(3082,98030),(3085,98059),(3090,98014),(3115,98048),(3120,98059),(3123,98059),(3600,98042),(4025,98062),(4055,98007),(4172,98055),(4192,98025),(4196,98062),(4750,98062),(4751,98012),(4755,98007),(4760,98055),(4768,98055),(4800,98045),(4810,98045),(4812,98007),(4813,98007),(4825,98020),(4880,98045);
/*!40000 ALTER TABLE `Faculty_Classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty_Subjects`
--

DROP TABLE IF EXISTS `Faculty_Subjects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Faculty_Subjects` (
  `StaffID` int(11) NOT NULL,
  `SubjectID` smallint(6) NOT NULL,
  `ProficiencyRating` double default NULL,
  PRIMARY KEY  (`StaffID`,`SubjectID`),
  KEY `FacultyFacultySubjects` (`StaffID`),
  KEY `SubjectsFacultySubjects` (`SubjectID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Faculty_Subjects`
--

LOCK TABLES `Faculty_Subjects` WRITE;
/*!40000 ALTER TABLE `Faculty_Subjects` DISABLE KEYS */;
INSERT INTO `Faculty_Subjects` VALUES (98005,12,10),(98005,16,10),(98005,34,9),(98005,36,8),(98005,38,8),(98007,2,9),(98007,5,10),(98007,14,8),(98007,24,10),(98007,46,10),(98010,2,8),(98010,5,10),(98010,24,8),(98010,48,10),(98011,38,9),(98011,43,8),(98011,49,10),(98012,1,9),(98012,4,10),(98012,32,9),(98012,45,9),(98013,23,9),(98013,26,8),(98013,27,10),(98013,28,9),(98013,46,10),(98014,11,9),(98014,15,9),(98014,39,9),(98014,42,9),(98014,44,9),(98019,13,9),(98019,32,9),(98019,47,8),(98020,20,8),(98020,22,10),(98020,25,8),(98020,50,8),(98020,52,8),(98025,3,10),(98025,7,10),(98025,9,10),(98025,47,10),(98028,11,8),(98028,15,10),(98028,33,9),(98028,35,8),(98028,39,8),(98030,14,10),(98030,30,8),(98030,42,10),(98030,44,9),(98030,48,9),(98036,12,10),(98036,16,9),(98036,34,9),(98036,36,8),(98040,25,8),(98040,27,8),(98040,28,10),(98040,45,8),(98042,31,9),(98042,40,8),(98042,41,10),(98042,55,8),(98042,56,9),(98045,13,10),(98045,23,8),(98045,26,9),(98045,33,9),(98045,35,9),(98048,7,10),(98048,9,8),(98048,30,8),(98048,54,9),(98048,55,10),(98052,17,8),(98052,18,8),(98052,21,10),(98052,50,10),(98052,52,9),(98053,18,9),(98053,19,9),(98053,21,8),(98053,51,9),(98053,53,9),(98055,3,8),(98055,6,8),(98055,8,9),(98055,10,10),(98055,37,10),(98059,31,8),(98059,43,10),(98059,54,9),(98059,56,9),(98062,1,10),(98062,4,8),(98062,6,8),(98062,8,10),(98062,10,10),(98062,49,9),(98063,17,9),(98063,19,9),(98063,20,9),(98063,22,8),(98063,51,9),(98063,53,8),(98064,37,8),(98064,40,9),(98064,41,8);
/*!40000 ALTER TABLE `Faculty_Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Ingredients` (
  `IngredientID` int(11) NOT NULL,
  `IngredientName` varchar(255) character set utf8 default NULL,
  `IngredientClassID` smallint(6) default NULL,
  `MeasureAmountID` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'Beef',2,1),(2,'Onion',3,17),(3,'Water',9,1),(4,'Guinness Beer',9,1);
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Members` (
  `MemberID` int(11) NOT NULL,
  `MbrFirstName` varchar(25) character set utf8 default NULL,
  `MbrLastName` varchar(25) character set utf8 default NULL,
  `MbrPhoneNumber` varchar(15) character set utf8 default NULL,
  `Gender` varchar(2) character set utf8 default NULL,
  PRIMARY KEY  (`MemberID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
INSERT INTO `Members` VALUES (101,'David','Hamilton','555-2701','M'),(102,'Suzanne','Viescas','555-2686','F'),(103,'Gary','Hallmark','555-2676','M'),(104,'Jeffrey','Smith','555-2596','M'),(105,'Robert','Brown','555-2491','M'),(106,'Mariya','Sergienko','555-2526','F'),(107,'Sara','Sheskey','555-2566','F'),(108,'Rachel','Patterson','555-2546','F'),(109,'David','Viescas','555-2661','M'),(110,'Manuela','Seidel','555-2641','F'),(111,'Kathryn','Patterson','555-2651','F'),(112,'Kendra','Bonnicksen','555-2716','F'),(113,'Steve','Pundt','555-9938','M'),(114,'George','Chavez','555-9930','M'),(115,'Joe','Rosales III','555-2281','M'),(116,'Angel','Kennedy','555-2311','M'),(117,'Luke','Patterson','555-2316','M'),(118,'Janice','Galvin','555-2691','F'),(119,'John','Viescas','555-2511','M'),(120,'Michael','Hernandez','555-2711','M'),(121,'Katherine','Ehrlich','555-0399','F'),(122,'Julia','Schnebly','555-9936','F'),(123,'Susan','McLain','555-2301','F'),(124,'Caroline','Coie','555-2306','F'),(125,'Jim','Glynn','555-2531','M');
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musical_Preferences`
--

DROP TABLE IF EXISTS `Musical_Preferences`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Musical_Preferences` (
  `CustomerID` int(11) NOT NULL,
  `StyleID` smallint(6) NOT NULL,
  PRIMARY KEY  (`CustomerID`,`StyleID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CustomersMusicalPreferences` (`CustomerID`),
  KEY `MusicalStylesMusicalPreferences` (`StyleID`),
  KEY `StyleID` (`StyleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Musical_Preferences`
--

LOCK TABLES `Musical_Preferences` WRITE;
/*!40000 ALTER TABLE `Musical_Preferences` DISABLE KEYS */;
INSERT INTO `Musical_Preferences` VALUES (10001,10),(10001,22),(10002,3),(10002,8),(10003,17),(10003,19),(10004,15),(10004,21),(10005,7),(10005,14),(10006,13),(10006,23),(10007,4),(10007,8),(10007,19),(10008,10),(10008,21),(10009,6),(10009,11),(10009,18),(10010,15),(10010,19),(10010,24),(10011,1),(10011,7),(10011,21),(10012,10),(10012,20),(10013,15),(10013,24),(10014,5),(10014,18),(10014,22),(10015,1),(10015,20),(10015,21);
/*!40000 ALTER TABLE `Musical_Preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musical_Styles`
--

DROP TABLE IF EXISTS `Musical_Styles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Musical_Styles` (
  `StyleID` smallint(6) NOT NULL,
  `StyleName` varchar(75) character set utf8 default NULL,
  PRIMARY KEY  (`StyleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Musical_Styles`
--

LOCK TABLES `Musical_Styles` WRITE;
/*!40000 ALTER TABLE `Musical_Styles` DISABLE KEYS */;
INSERT INTO `Musical_Styles` VALUES (1,'40\'s Ballroom Music'),(2,'50\'s Music'),(3,'60\'s Music'),(4,'70\'s Music'),(5,'80\'s Music'),(6,'Country'),(7,'Classical'),(8,'Classic Rock & Roll'),(9,'Rap'),(10,'Contemporary'),(11,'Country Rock'),(12,'Elvis'),(13,'Folk'),(14,'Chamber Music'),(15,'Jazz'),(16,'Karaoke'),(17,'Motown'),(18,'Modern Rock'),(19,'Rhythm and Blues'),(20,'Show Tunes'),(21,'Standards'),(22,'Top 40 Hits'),(23,'Variety'),(24,'Salsa'),(25,'90\'s Music');
/*!40000 ALTER TABLE `Musical_Styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL,
  `StfFirstName` varchar(25) character set utf8 default NULL,
  `StfLastname` varchar(25) character set utf8 default NULL,
  `StfStreetAddress` varchar(50) character set utf8 default NULL,
  `StfCity` varchar(30) character set utf8 default NULL,
  `StfState` varchar(2) character set utf8 default NULL,
  `StfZipCode` varchar(5) character set utf8 default NULL,
  `StfAreaCode` varchar(5) character set utf8 default NULL,
  `StfPhoneNumber` varchar(8) character set utf8 default NULL,
  `Salary` decimal(15,2) default NULL,
  `DateHired` datetime default NULL,
  `Position` varchar(50) character set utf8 default NULL,
  PRIMARY KEY  (`StaffID`),
  UNIQUE KEY `StaffID` (`StaffID`),
  KEY `StaffZipCode` (`StfZipCode`),
  KEY `StudAreaCode` (`StfAreaCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (98005,'Suzanne','Viescas','15127 NE 24th, #383','Redmond','WA','98052','425','555-2686','44000.00','1986-05-31 00:00:00','Faculty'),(98007,'Gary','Hallmark','Route 2, Box 203B','Auburn','WA','98002','253','555-2676','53000.00','1985-01-21 00:00:00','Faculty'),(98010,'Jeffrey','Smith','30301 - 166th Ave. N.E.','Fremont','CA','94538','510','555-2596','52000.00','1983-10-06 00:00:00','Faculty'),(98011,'Ann','Patterson','16 Maple Lane','Auburn','WA','98002','253','555-2591','45000.00','1983-10-16 00:00:00','Faculty'),(98012,'Robert','Brown','672 Lamont Ave','Houston','TX','77201','713','555-2491','49000.00','1989-02-09 00:00:00','Faculty'),(98013,'Deb','Waldal','908 W. Capital Way','Tacoma','WA','98413','253','555-2496','44000.00','1986-07-05 00:00:00','Faculty'),(98014,'Peter','Brehm','722 Moss Bay Blvd.','Kirkland','WA','98033','425','555-2501','60000.00','1986-07-16 00:00:00','Faculty'),(98019,'Mariya','Sergienko','901 Pine Avenue','Portland','OR','97208','503','555-2526','45000.00','1989-11-02 00:00:00','Faculty'),(98020,'Jim','Glynn','13920 S.E. 40th Street','Bellevue','WA','98009','425','555-2531','45000.00','1985-08-02 00:00:00','Faculty'),(98021,'Tim','Smith','30301 - 166th Ave. N.E.','Seattle','WA','98106','206','555-2536','40000.00','1988-12-17 00:00:00','Registrar'),(98025,'Carol','Viescas','722 Moss Bay Blvd.','Kirkland','WA','98033','425','555-2576','50000.00','1984-04-12 00:00:00','Faculty'),(98028,'Alaina','Hallmark','Route 2, Box 203B','Woodinville','WA','98072','425','555-2631','57000.00','1984-01-17 00:00:00','Faculty'),(98030,'Liz','Keyser','13920 S.E. 40th Street','Bellevue','WA','98006','425','555-2556','48000.00','1988-05-31 00:00:00','Faculty'),(98036,'Sam','Abolrous','611 Alpine Drive','Palm Springs','CA','92263','760','555-2611','60000.00','1982-11-20 00:00:00','Faculty'),(98040,'Jim','Wilson','101 NE 88th','Salem','OR','97301','503','555-2636','50000.00','1987-01-13 00:00:00','Faculty'),(98042,'David','Smith','311 20th Ave. N.E.','Fremont','CA','94538','510','555-2646','52000.00','1991-12-17 00:00:00','Faculty'),(98043,'Kathryn','Patterson','16 Maple Lane','Seattle','WA','98115','206','555-2651','25000.00','1984-11-14 00:00:00','Secretary'),(98045,'Michael','Hernandez','PO Box 223311','Tacoma','WA','98413','253','555-2711','60000.00','1990-08-20 00:00:00','Faculty'),(98048,'Joyce','Bonnicksen','2424 Thames Drive','Bellevue','WA','98006','425','555-2726','60000.00','1986-03-02 00:00:00','Faculty'),(98052,'Katherine','Ehrlich','777 Fenexet Blvd','Redmond','WA','98052','425','555-0399','45000.00','1985-03-08 00:00:00','Faculty'),(98053,'Caleb','Viescas','4501 Wetland Road','Long Beach','CA','90809','562','555-0037','45000.00','1992-02-10 00:00:00','Faculty'),(98055,'Alastair','Black','3887 Easy Street','Seattle','WA','98125','206','555-0039','60000.00','1988-12-11 00:00:00','Faculty'),(98057,'Joe','Rosales III','7288 Barrister Ave N','Tacoma','WA','98413','253','555-2281','35000.00','1988-11-25 00:00:00','Graduate Advisor'),(98059,'Maria','Patterson','3445 Cheyenne Road','El Paso','TX','79993','915','555-2291','48000.00','1986-09-17 00:00:00','Faculty'),(98062,'Caroline','Coie','298 Forest Lane','Seattle','WA','98125','206','555-2306','52000.00','1983-01-28 00:00:00','Faculty'),(98063,'Kirk','DeGrasse','455 West Palm Ave','San Antonio','TX','78284','210','555-2311','45000.00','1988-03-02 00:00:00','Faculty'),(98064,'Luke','Patterson','877 145th Ave SE','Portland','OR','97208','503','555-2316','56000.00','1989-08-20 00:00:00','Faculty');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Class_Status`
--

DROP TABLE IF EXISTS `Student_Class_Status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Student_Class_Status` (
  `ClassStatus` smallint(6) NOT NULL,
  `ClassStatusDescription` varchar(50) character set utf8 default NULL,
  PRIMARY KEY  (`ClassStatus`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Student_Class_Status`
--

LOCK TABLES `Student_Class_Status` WRITE;
/*!40000 ALTER TABLE `Student_Class_Status` DISABLE KEYS */;
INSERT INTO `Student_Class_Status` VALUES (1,'Enrolled'),(2,'Completed'),(3,'Withdrew');
/*!40000 ALTER TABLE `Student_Class_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Schedules`
--

DROP TABLE IF EXISTS `Student_Schedules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Student_Schedules` (
  `StudentID` int(11) NOT NULL,
  `ClassID` smallint(6) NOT NULL,
  `ClassStatus` smallint(6) default NULL,
  `Grade` double default NULL,
  PRIMARY KEY  (`StudentID`,`ClassID`),
  KEY `ClassesStudent_Schedules` (`ClassID`),
  KEY `Student_Class_StatusStudent_Schedules` (`ClassStatus`),
  KEY `StudentsStudent_Schedules` (`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Student_Schedules`
--

LOCK TABLES `Student_Schedules` WRITE;
/*!40000 ALTER TABLE `Student_Schedules` DISABLE KEYS */;
INSERT INTO `Student_Schedules` VALUES (1001,1560,2,93.28),(1001,2071,2,66.41),(1001,4055,1,62.85),(1001,4760,3,0),(1001,4812,2,66.91),(1002,1560,2,84.75),(1002,2071,2,76.02),(1002,4055,1,68.5),(1002,4760,2,79.43),(1002,4812,1,58.27),(1003,1560,2,82.85),(1003,2071,1,77.2),(1003,4055,1,75.38),(1003,4760,2,90.67),(1003,4812,1,81.9),(1004,1031,2,80.78),(1004,1180,1,56.36),(1004,1502,1,69.32),(1004,4768,1,61.1),(1005,1180,2,69.71),(1005,1502,2,76.28),(1005,1562,2,67.59),(1005,4768,2,79.31),(1006,1000,1,89.2),(1006,1012,2,85.05),(1006,1031,2,91.72),(1006,1168,2,85.31),(1006,3115,1,83.23),(1006,4055,2,87.82),(1007,1000,2,93.27),(1007,1012,1,98.36),(1007,1031,2,79.59),(1007,1168,2,92.9),(1007,3115,1,92.25),(1007,4055,2,90.24),(1008,1560,1,79.93),(1008,2071,1,82.31),(1008,4055,2,89.27),(1008,4760,2,90.58),(1008,4812,2,71.73),(1009,1560,2,92.08),(1009,2071,3,0),(1009,4055,1,63.56),(1009,4760,1,95.59),(1009,4812,2,67.44),(1010,1180,2,73.68),(1010,1502,1,69.34),(1010,1562,2,98.26),(1010,4768,1,82.02),(1011,1000,1,81.88),(1011,1012,1,89.52),(1011,1031,1,87.17),(1011,1168,2,93.7),(1011,3115,2,72.68),(1011,4055,2,71.45),(1012,1031,2,91.4),(1012,1180,2,97.39),(1012,1502,1,85.92),(1012,4768,1,89.22),(1012,4800,2,87),(1013,1000,1,66.61),(1013,1012,1,79.74),(1013,1031,2,74.01),(1013,1168,1,77.91),(1013,3115,2,73.96),(1013,4055,2,90.01),(1014,1000,2,88.27),(1014,1012,2,92.05),(1014,1031,2,91.56),(1014,1168,3,0),(1014,3115,2,75.8),(1014,4055,1,80.43),(1015,1180,2,93.86),(1015,1502,2,90.16),(1015,1562,2,96.36),(1015,4768,2,67.67),(1016,1000,1,73.71),(1016,1012,1,70.77),(1016,1031,2,72.79),(1016,1168,1,98.74),(1016,3115,2,77.46),(1016,4055,2,84.37),(1017,1031,2,77.45),(1017,1180,1,78.34),(1017,1502,2,72.15),(1017,4768,2,85.26),(1018,1031,2,87.05),(1018,1180,2,69.88),(1018,1502,2,67.13),(1018,4768,1,81.23);
/*!40000 ALTER TABLE `Student_Schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Students` (
  `StudentID` int(11) NOT NULL,
  `StudFirstName` varchar(25) character set utf8 default NULL,
  `StudLastName` varchar(25) character set utf8 default NULL,
  `StudStreetAddress` varchar(50) character set utf8 default NULL,
  `StudCity` varchar(30) character set utf8 default NULL,
  `StudState` varchar(2) character set utf8 default NULL,
  `StudZipCode` varchar(5) character set utf8 default NULL,
  `StudAreaCode` varchar(5) character set utf8 default NULL,
  `StudPhoneNumber` varchar(8) character set utf8 default NULL,
  PRIMARY KEY  (`StudentID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `StudAreaCode` (`StudAreaCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1001,'Kerry','Patterson','9877 Hacienda Drive','San Antonio','TX','78284','210','555-2706'),(1002,'David','Hamilton','908 W. Capital Way','Tacoma','WA','98413','253','555-2701'),(1003,'Betsy','Stadick','611 Alpine Drive','Palm Springs','CA','92263','760','555-2696'),(1004,'Janice','Galvin','4110 Old Redmond Rd.','Redmond','WA','98052','425','555-2691'),(1005,'Doris','Hartwig','4726 - 11th Ave. N.E.','Seattle','WA','98105','206','555-2671'),(1006,'Scott','Bishop','66 Spring Valley Drive','Medford','OR','97501','541','555-2666'),(1007,'Elizabeth','Hallmark','Route 2, Box 203B','Auburn','WA','98002','253','555-2521'),(1008,'Sara','Sheskey','16679 NE 41st Court','Portland','OR','97208','503','555-2566'),(1009,'Karen','Smith','30301 - 166th Ave. N.E.','Eugene','OR','97401','541','555-2551'),(1010,'Marianne','Wier','908 W. Capital Way','Tacoma','WA','98413','253','555-2606'),(1011,'John','Kennedy','16679 NE 41st Court','Portland','OR','97208','503','555-2621'),(1012,'Sarah','Thompson','2222 Springer Road','Lubbock','TX','79402','806','555-2626'),(1013,'Michael','Viescas','15127 NE 24th, #383','Redmond','WA','98052','425','555-2656'),(1014,'Kendra','Bonnicksen','12330 Larchlemont Lane','Seattle','WA','98105','206','555-2716'),(1015,'Brannon','Jones','777 Fenexet Blvd','Long Beach','CA','90809','562','555-0399'),(1016,'Steve','Pundt','2500 Rosales Lane','Dallas','TX','79915','972','555-9938'),(1017,'George','Chavez','281 Old Navy Road','Bremerton','WA','98310','360','555-9930'),(1018,'Richard','Lum','754 Fourth Ave','Seattle','WA','98115','206','555-2296');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Subjects` (
  `SubjectID` smallint(6) NOT NULL,
  `CategoryID` varchar(10) character set utf8 default NULL,
  `SubjectCode` varchar(8) character set utf8 default NULL,
  `SubjectName` varchar(50) character set utf8 default NULL,
  `SubjectDescription` text,
  PRIMARY KEY  (`SubjectID`),
  UNIQUE KEY `SubjectCode` (`SubjectCode`),
  KEY `CategoriesSubjects` (`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SubjectID` (`SubjectID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES (1,'ACC','ACC 210','Financial Accounting Fundamentals I','Introduces basic accounting concepts, principles and prodcedures for recording business transactions and developing financial accounting reports. Excel spreadsheet component.'),(2,'ACC','ACC 220','Financial Accounting Fundamentals II','Applications of basic accounting concepts, principles and procedures to more complex business situations and to different forms of enterprise ownership. Includes computerized element. Prereq: ACC 210 or instructor permission.'),(3,'ACC','ACC 230','Fundamentals of Managerial Accounting','Analysis of accounting data as part of the managerial process of planning, decision making and control. Concentrates on economic decision making in enterprises. Includes computerized element. Prereq: ACC 220 or instructor permission.'),(4,'ACC','ACC 251','Intermediate Accounting','In-depth review of financial accounting principles. Emphasizes the conceptual framework of accounting, revenue and expense recognition. Accounts Receivable, Depreciation, and Amortization, etc. Prereq: ACC 220 or instructor permission.'),(5,'ACC','ACC 257','Business Tax Accounting','Basic principles, practices and governmental regulations (Federal, Washington, State, and local) involved in business tax accounting including filing returns, record keeping, tax planning, and registrations and business licenses. Prereq: ACC 220 or instructors permissions.'),(6,'BUS','BUS 101','Introduction to Business','Survey of businss practices. Covers business terminology, forms of business ownership, franchising, small and international businesses, leadership and management, marketing principles, financing and investment methods, and business environment.'),(7,'BUS','BUS 155','Developing A Feasibility Plan','With the aid of a counselor, a feasibility plan will be developed which will be the basis or start of your business plan. Must be concurrently enrolled in BUS 151.'),(8,'BUS','BUS 151','Introduction to Entrepreneurship','Overview of the entrepreneurial process, examination of the marketplace, and discussion of successful business strategies. Product selection, selling and marketing strategies. Sources of information and assistance. Must be concurrently enrolled in BUS 155.'),(9,'BUS','BUS 170','Information Technology I','Uses Word for Windows word processing skills, document formatting, keyboarding, and 10-key keypad skills. Emphasis on preparing letters, memos, reports, and tables. Introduces Excel spreadsheet basics.'),(10,'BUS','BUS 171','Information Technology II','Uses intermediate Word features including formatting and production, mail merge, macros, text columns, graphics, and fonts; Excel spreadsheet; and introduction to PowerPoint presentation software, Internet and email. Prereq: BUS 170 or permission from instructor.'),(11,'ART','ART 100','Introduction to Art','Historical backgrounds and design fundamentals which have affected art. Includes slide lectures, reading and practical studio applications.'),(12,'ART','ART 101','Design','Studio sudies in the fundamentals of two-dimensional art with problems based on line, space, texture, shape and color theories. Includes practical applications of these theories to design.'),(13,'ART','ART 111','Drawing','Study of line, value, space, perspective, and compostion through the use o charcoal, pencil, pen, and brush.'),(14,'ART','ART 201','Painting','Beginning painting in oil or synthetic media using still life. Emphasis on basics such as composition, value studies, color mixing, canvas preparation, and various styles and techniques. No prerequisite; some drawing background important.'),(15,'ART','ART 210','Computer Art','Explore the elements of art such as line, value, space, composition, and color through the use of the computer. Sudents will create works of art using the computer.'),(16,'ART','ART 251','Art History','Surveys major forms of visual expression from the Paleolithic, Egyptian, Mesopotamian, Greek, Roman, and Early Christian periods. Includes painting, sculpture, architecture, lectures, slides, and readings.'),(17,'BIO','BIO 100','Biological Principles','An introductory biology course with lab for the non-science major. May include maintenance of the balance between man and his environment, nutrition, genetics and inheritence, ecological principles, plant and animal diversity, and evolution.'),(18,'BIO','BIO 101','General Biology','Basic bilogical concepts with emphasis on general cell processes, plant and animal diversity, morphyology, limited reproduction, phylogeny of the living organisms, exploration of molecular genetics.'),(19,'BIO','BIO 280','Microbiology','Introduction to micro-organisms including microbial cell structure and function; metabolism; microbial genetics; and the role of micro-organisms in disease, immunity, and other selected applied areas.'),(20,'CHE','CHE 101','Chemistry','General chemistry for non-science majors. Completion of CHE 101 fulfills chemistry requirements for many health science majors.'),(21,'CHE','CHE 139','Fundamentals of Chemistry','Prepatory for the science major chemistry courses for students without prior chemistry experience. This lecture format will include chemical mathematics, basic atomic structure, chemical bonding, chemical equation balancing and mole concept, and chemical stoichiometry.'),(22,'CHE','CHE 231','Organic Chemistry','Structure, nomenclature, reactions, and synthesis of the main types of organic compounds.'),(23,'CIS','CIS 101','Microcomputer Applications','This is a \"hands-on\" course. Students will learn how to use word processing, spreadsheet, and database applications. General operation systems activities such as deleting files, renaming files, and creating and navigating directory structures will also be covered.'),(24,'CIS','CIS 102','Information Systems Concepts','Provides a broad introduction to computers and information systems. Includes coverage of hardware, software, data organization, data communications, and systems development. Also covers the evolving role of computers in society.'),(25,'CIS','CIS 114','Problem Solving and Structured Programming','Covers design, documentation, and coding of programs using top-down design and structured programming principles. Includes introduction to multi-user systems, text editors, data access and storage techniques.'),(26,'CIS','CIS 236','Database Management','Includes database concepts, data management techniques, database environment, record relationships, and advantages and limitations of the database approach. Includes data modeling and database design.'),(27,'CSC','CSC 110','Programming in BASIC','Computer programming and program design using the Visual Basic programming language. Emphasis is on Program Design and Algorithm Development while writing programs primarily about mathematical and scientific applications.'),(28,'CSC','CIS 142','Computer Programming','Introduction to computer science using the C programming language. Emphasizes design, algorithmics, abstraction, and analysis.'),(29,'JRN','JRN 104','College Publications','Hands-on course in college publishing. Covers basics of reporting and writing through work on college newspaper and other assignments.'),(30,'ECO','ECO 100','Survey of Economics','Economics applied to various comtemporary social problems and issues. Provides an introduction to economic principles concerning national prosperity, market behavior, income inequality, the role of government, and economic fluctuations.'),(31,'ECO','ECO 200','Principles of Economics: Microeconomics','Covers resource allocation and income distribution with emphasis on price determination, production costs, and market structures. Intermediate algebra or equivalent required.'),(32,'ECO','ECO 201','Principles of Economics: Macroeconomics','Analysis of the aggregate economy: GDP, inflation, business cycles, trade and finance. Intermediate algebra or equivalent required.'),(33,'MUS','MUS 100','Music in the Western World','An introduction to music. Features music from a global perspective with a focus on Western Music. Many musical examples, listening, videos on great musicians of the past.'),(34,'MUS','MUS 101','First Year Theory and Ear Training','Rudiments of music - notation, scales, intervals, and triads, rhythmic and melodic sight-reading and dictation. Studies of historical periods.'),(35,'MUS','MUS 201','Second Year Music Theory','Continuation of MUS 101. Chromatic harmony, modulations and related modern concepts.'),(36,'MUS','MUS 204','History of Jazz','Traces the roots of jazz in America from New Orleans, New York, Chicago, Kansas City, the Big Band Era, Be-Bop to modern jazz through films, lectures, recordings and live performances.'),(37,'ENG','ENG 101','Composition - Fundamentals','Introduces the nature of the writing process in its various stages: gathering, shaping, establishing audience, editing, revising, polishing, and proffreading. Writing assignments concentrate on the major strategies of nonfiction prose - narration, description, and exposition.'),(38,'ENG','ENG 102','Composition - Intermediate','Continues instruction on the writing process, extending it to include source-based writing of the kind typically done in academic settings. Topics for reading and writing will vary instructor to instructor.'),(39,'ENG','ENG 104','Advanced English Grammar','Study of the grammar and rhetoric of the English sentence. Not a remedial course.'),(40,'GEG','GEG 100','Introduction to Geography','An introduction to the major cultures of the world (Hebrew, Christian, Islamic, Hindu, Buddhist), their origins, values, heroes, rituals, scriptures and cross-cultural influences.'),(41,'GEG','GEG 205','Physical Geography','Study of the Earth, the materials that make it up, and plate tectonics. Special attention to the Pacific Northwest. Includes laboratory and field trip work.'),(42,'HIS','HIS 101','World History to 1500','Historic foundations and development of the great civilizations from prehistoric days to the Renaissance with emphasis on social, political, economic and geographic aspects. Attention to the nature of history as an intellectual and academic discipline.'),(43,'HIS','HIS 111','U.S. History to 1877','American history from the colonial period through Reconstruction. Emphasis on the American Revolution, the National Period, slavery, territorial expansion, the Civil War and Reconstruction.'),(44,'HIS','HIS 112','U.S. History Since 1865','Includes Reconstruction, industrialization, urbanization, westward movement, political reform movements, agrarian protest, progressive period, 1920\'s Great Depressioin and the New Deal, WWII, the conservative 50\'s, liberalism of the 60\'s and 70\'s, and into the next century.'),(45,'MAT','MAT 080','Preparatory Mathematics','Individualized instruction in Arithmetic, Algebra I and II, Geometry, nad Intermediate Algebra.'),(46,'MAT','MAT 097','Elementary Algebra','First course in Algebra includes signed numbers, linear equations, linear inequalities, products and factorization of polynomials, and operations with quotients of polynomials.'),(47,'MAT','MAT 098','Intermediate Algebra','Sets and the real number system, polynomial and rational expressions, exponents and radicals, first and second degree equations, linear systems of equations, and graphs.'),(48,'MAT','MAT 103','Geometry and Visualization','Basic plane geometry concepts, emphasizing problem-solving. Right triangle trigonometry. Introduction to 3-D geometry/spatial thinking. Directed towards students with no high school geometry but who plan a career in science/engineering.'),(49,'MAT','MAT 104','Trigonometry','Elementary plane goemetry, right triangle tirgonometry, general angels, identities, equations, word problems, and selected topics.'),(50,'PHY','PHY 100','Survey Of Physics','Basic laws of phyics from the laws of motion through nuclear physics. Also examines the origins and impact on society of the basic physics concepts.'),(51,'PHY','PHY 101','General Physics','Classical mechanics; kinematics and dynamics. Includes development of concepts of force, work/energy, impulse/momentum, and the conservation laws.'),(52,'PHY','PHY 201','Engineering Physics I','Development of the basic principles of classical mechanics. A calculus approach is used to introduce kinematics, Newton\'s laws, the work-energy theorem, and conservation laws.'),(53,'PHY','PHY 203','Engineering Physics II','Waves and oscillations. Mechanical waves and sound are studied as well as geometric and physical optics. The wave aspect of an electron is introduced as it applies to the stationary states of the hydrogen atom.'),(54,'POL','POL 101','Introduction to Political Science','Introduction to theory, organization, politics and administration of government. Includes political theory, comparative systems, political socialization, public administration, political parties and elections, and international relations.'),(55,'POL','POL 102','American Government','Origin and development of the U.S. government. Covers the stucture and function of Congress, the Presidency and courts as well as civil liberties, political behavior and political parties.'),(56,'POL','POL 213','Women and Politics','Introduction to concepts of power and policy issues as they relate to women. Theoretical, historical and empirical studies of women\'s participation in social and political movements nationally and internationally. Study of women\'s diverse roles in relations to family, economics, labor, government, and law.');
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-11-21 14:41:27
