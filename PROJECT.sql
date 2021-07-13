
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Hospital
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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

DROP DATABASE IF EXISTS `HOSPITAL`;
CREATE SCHEMA `HOSPITAL`;
USE `HOSPITAL`;
DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT` (
  `p_id` int(10) NOT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `gender` char(7) NOT NULL,
  `date_of_birth` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `first_name` varchar(9) NOT NULL,
  `last_name` varchar(9) NOT NULL,
  `middle_name` varchar(2),
  `door_no` varchar(10) NOT NULL,
  `street` char(7) NOT NULL,
  `town` char(7) NOT NULL,
  `state` char(10) NOT NULL,
  `subclass` char(1) NOT NULL,
  PRIMARY KEY (`p_id`),
  CONSTRAINT `CHK_PATIENT` CHECK((gender='M' OR gender='F') AND p_id > 0 AND (arrival_date >= date_of_birth) AND (blood_group='O+' or blood_group='O-' or blood_group='A+' or blood_group='A-' or blood_group='B+' or blood_group='B-' or blood_group='AB-' or blood_group='AB+' )),
  CONSTRAINT UQ_PATIENT UNIQUE (`p_id`, `subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
INSERT INTO `PATIENT` VALUES (888665555, null, 'F','1981-06-19','2000-06-19','','Cos','R','19-10-10A','Aks','la','AP','I'),(888665554, 'O+', 'M','1981-06-19','2000-06-19','Hash','Cos','R','19-10-10A','Aks','la','AP','I'),(888665553, 'O+', 'M','1981-06-19','2000-06-19','Hash','Cos','R','19-10-10A','Aks','la','AP','I'),(888665552, 'O+', 'M','1981-06-19','2000-06-19','Hash','Cos','R','19-10-10A','Aks','la','AP','O');
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `DEPENDENT`
--
DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `e_id` int(10) NOT NULL,
  `first_name` varchar(7) NOT NULL,
  `last_name` varchar(7) NOT NULL,
  `middle_name` varchar(2) NOT NULL,
  `door_no` varchar(10) NOT NULL,
  `street` char(7) NOT NULL,
  `town` char(7) NOT NULL,
  `state` char(10) NOT NULL,
  `e_date_of_birth` date NOT NULL,
  `joining_date` date DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `subclass` char(2) not null,
  primary key(`e_id`),
  constraint `uq_emp` unique (`e_id`, `subclass`),
  CONSTRAINT `CHK_EMPLOYEE` CHECK(e_id > 0 AND (joining_date >= e_date_of_birth) AND salary > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('123456789', 'Hash' , 'Cos' , 'R' , '19-10-10A' , 'Aks' , 'la' ,'AP' , '1981-06-19' , '2000-06-19' , '20000','Do'),('123456788','Hash','Cos','R','19-10-10A','Aks','la','AP','1981-06-19','2000-06-19','20000','Do'),('123456787','Hash','Cos','R','19-10-10A','Aks','la','AP','1981-06-19','2000-06-19','20000','Dr'),('123456786','Hash','Cos','R','19-10-10A','Aks','la','AP','1981-06-19','2000-06-19','20000','N');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;


SET foreign_key_checks = 1;
--
-- Table structure for table `DEPT_LOCATIONS`
--

DROP TABLE IF EXISTS `EMPLOYEE_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE_FUNC` (
  `e_id` int(10) NOT NULL,
  `phone_number` int(10) NOT NULL,
  PRIMARY KEY(`e_id`, `phone_number`),
  CONSTRAINT `CHK_EMPLOYEE_FUNC` CHECK(phone_number > 0),
  CONSTRAINT `EMPLOYEE_FUNC_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `EMPLOYEE` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--

LOCK TABLES `EMPLOYEE_FUNC` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_FUNC` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_FUNC` VALUES ('123456789','9999999999'),('123456788','9999999998'),('123456787','9999999997'),('123456786','9999999996');
/*!40000 ALTER TABLE `EMPLOYEE_FUNC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `BILL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BILL` (
  `bill_date` datetime NOT NULL,
  `p_id` int(10) NOT NULL,
  PRIMARY KEY (`bill_date`, `p_id`),
  FOREIGN KEY (`p_id`) REFERENCES `PATIENT` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `BILL` WRITE;
/*!40000 ALTER TABLE `BILL` DISABLE KEYS */;
INSERT INTO `BILL` VALUES ('2000-07-18 12:00:00',888665555),('2000-06-21 12:00:00','888665554'),('2000-06-22 12:00:00','888665553'),('2000-06-23 12:00:00','888665552');
/*!40000 ALTER TABLE `BILL` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `PROJECT`
--




DROP TABLE IF EXISTS `ROOM_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOM_FUNC` (
  `room_type` varchar(10) NOT NULL,
  `room_cost` int(10) NOT NULL,
  CONSTRAINT `CHK_ROOM_FUNC` CHECK(room_cost > 0),
  PRIMARY KEY(`room_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `ROOM_FUNC` WRITE;
/*!40000 ALTER TABLE `ROOM_FUNC` DISABLE KEYS */;
INSERT INTO `ROOM_FUNC` VALUES ('Stafford','2500'),('Safford','5000');
/*!40000 ALTER TABLE `ROOM_FUNC` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOM` (
  `room_number` int(4) NOT NULL,
  `room_type` varchar(10) NOT NULL,
  PRIMARY KEY(`room_number`),
  CONSTRAINT `ROOM_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `ROOM_FUNC` (`room_type`),
  CONSTRAINT `CHK_ROOM` CHECK(room_number > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

DELIMITER $$

CREATE TRIGGER trigger1
BEFORE INSERT
ON ROOM
FOR EACH ROW
BEGIN
  SELECT COUNT(*) INTO @cnt FROM ROOM;
  IF @cnt >= 26 THEN
    CALL sth(); -- raise an error
  END IF;
END
$$

DELIMITER ;

LOCK TABLES `ROOM` WRITE;
/*!40000 ALTER TABLE `ROOM` DISABLE KEYS */;
INSERT INTO `ROOM` VALUES (1, 'Stafford'),(2, 'Safford');
/*!40000 ALTER TABLE `ROOM` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `IN_PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IN_PATIENT` (
  `p_id` int(10) NOT NULL, 
  `room_number` int NOT NULL,
  `subclass` char(1) not null,
  PRIMARY KEY (`p_id`),
  constraint `chk_inp` check (subclass='I'),
  CONSTRAINT `IN_PATIENT_ibfk_1` FOREIGN KEY (`p_id`, `subclass`) REFERENCES `PATIENT` (`p_id`, `subclass`),
  CONSTRAINT `IN_PATIENT_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `ROOM` (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

DELIMITER $$

CREATE TRIGGER trigger2
BEFORE INSERT
ON IN_PATIENT
FOR EACH ROW
BEGIN
  SELECT COUNT(p_id) INTO @cnt FROM IN_PATIENT group by room_number;
  IF @cnt >= 16 THEN
    CALL sth(); -- raise an error
  END IF;
END
$$

DELIMITER ;

LOCK TABLES `IN_PATIENT` WRITE;
/*!40000 ALTER TABLE `IN_PATIENT` DISABLE KEYS */;
INSERT INTO `IN_PATIENT` VALUES ('888665555','1', 'I'),('888665554','1', 'I'),('888665553','2', 'I');
/*!40000 ALTER TABLE `IN_PATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `IN_PATIENT_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IN_PATIENT_FUNC` (
  `p_id` int(10) NOT NULL,
  `discharge_date` date DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  CONSTRAINT `IN_PATIENT_FUNC_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `IN_PATIENT` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `IN_PATIENT_FUNC` WRITE;
/*!40000 ALTER TABLE `IN_PATIENT_FUNC` DISABLE KEYS */;
INSERT INTO `IN_PATIENT_FUNC` VALUES ('888665555','2000-06-22'),('888665554','2000-06-28'),('888665553','2000-06-22');
/*!40000 ALTER TABLE `IN_PATIENT_FUNC` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `IN_PATIENT_FUNC_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IN_PATIENT_FUNC_1` (
  `p_id` int(10) NOT NULL,
  `mild_disease` varchar(10) NOT NULL,
  PRIMARY KEY (`p_id`, `mild_disease`),
  CONSTRAINT `IN_PATIENT_FUNC_1_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `IN_PATIENT_FUNC` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `IN_PATIENT_FUNC_1` WRITE;
/*!40000 ALTER TABLE `IN_PATIENT_FUNC_1` DISABLE KEYS */;
INSERT INTO `IN_PATIENT_FUNC_1` VALUES ('888665555','Cold'),('888665554','Cold'),('888665553','Cold');
/*!40000 ALTER TABLE `IN_PATIENT_FUNC_1` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `OUT_PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OUT_PATIENT` (
  `p_id` int(10) NOT NULL, 
  `disease` varchar(20) NOT NULL,
  `subclass` char(1) not null,
  PRIMARY KEY(`p_id`, `disease`),
  constraint `chk_outp` check(subclass='O'),
  CONSTRAINT `OUT_PATIENT_ibfk_1` FOREIGN KEY (`p_id`, `subclass`) REFERENCES `PATIENT` (`p_id`, `subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `OUT_PATIENT` WRITE;
/*!40000 ALTER TABLE `OUT_PATIENT` DISABLE KEYS */;
INSERT INTO `OUT_PATIENT` VALUES ('888665552','Cold','O');
/*!40000 ALTER TABLE `OUT_PATIENT` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `RELATIVE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RELATIVE` (
  `p_id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL, 
  `phone_number` int(10) NOT NULL,
  `relation` char(15) NOT NULL,
  PRIMARY KEY(`p_id`, `name`),
  CONSTRAINT `RELATIVE_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `IN_PATIENT` (`p_id`),
  CONSTRAINT `CHK_RELATIVE` CHECK(phone_number > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `RELATIVE` WRITE;
/*!40000 ALTER TABLE `RELATIVE` DISABLE KEYS */;
INSERT INTO `RELATIVE` VALUES ('888665555','Housti','9494949494','Bro');
/*!40000 ALTER TABLE `RELATIVE` ENABLE KEYS */;
UNLOCK TABLES;
--
--


DROP TABLE IF EXISTS `NURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NURSE` (
  `e_id` int(10) NOT NULL,
  `communication_skills` varchar(7) NOT NULL,
  `subclass` char(2) not null,
  PRIMARY KEY(`e_id`),
  constraint `chk_n` check(`subclass`='N'),
  CONSTRAINT `NURSE_ibfk_1` FOREIGN KEY (`e_id`, `subclass`) REFERENCES `EMPLOYEE` (`e_id`, `subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `NURSE` WRITE;
/*!40000 ALTER TABLE `NURSE` DISABLE KEYS */;
INSERT INTO `NURSE` VALUES ('123456786','Avg','N');
/*!40000 ALTER TABLE `NURSE` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `ROOM_FUNC_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOM_FUNC_1` (
  `room_number` int(4) NOT NULL,
  `e_id` int(10) NOT NULL,
  PRIMARY KEY(`room_number`),
  CONSTRAINT `ROOM_FUNC_1_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `NURSE` (`e_id`),
  CONSTRAINT `ROOM_FUNC_1_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `ROOM` (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `ROOM_FUNC_1` WRITE;
/*!40000 ALTER TABLE `ROOM_FUNC_1` DISABLE KEYS */;
INSERT INTO `ROOM_FUNC_1` VALUES (1,'123456786');
/*!40000 ALTER TABLE `ROOM_FUNC_1` ENABLE KEYS */;
UNLOCK TABLES;
--
--

--
--
DROP TABLE IF EXISTS `DOCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR` (
  `e_id` int(10) NOT NULL,
  `Sup_id` int(10) NOT NULL,
  `subclass` char(2) not null,
  PRIMARY KEY(`e_id`),
  constraint `chk_do` check(subclass='Do'),
  CONSTRAINT `DOCTOR_ibfk_1` FOREIGN KEY (`Sup_id`, `subclass`) REFERENCES `EMPLOYEE` (`e_id`, `subclass`),
  CONSTRAINT `DOCTOR_ibfk_2` FOREIGN KEY (`e_id`, `subclass`) REFERENCES `EMPLOYEE` (`e_id`, `subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
INSERT INTO `DOCTOR` VALUES ('123456789','123456788', 'Do');
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `DOCTOR_FUNC_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR_FUNC_1` (
  `e_id` int(10) NOT NULL,
  `specialization` char(15) NOT NULL,
  PRIMARY KEY(`e_id`, `specialization`),
  CONSTRAINT `DOCTOR_FUNC_1_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `DOCTOR` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `DOCTOR_FUNC_1` WRITE;
/*!40000 ALTER TABLE `DOCTOR_FUNC_1` DISABLE KEYS */;
INSERT INTO `DOCTOR_FUNC_1` VALUES ('123456789','ENT');
/*!40000 ALTER TABLE `DOCTOR_FUNC_1` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `DOCTOR_FUNC_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR_FUNC_2` (
  `e_id` int(10) NOT NULL,
  `qualification` char(15) NOT NULL,
  PRIMARY KEY(`e_id`, `qualification`),
  CONSTRAINT `DOCTOR_FUNC_1_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `DOCTOR` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `DOCTOR_FUNC_2` WRITE;
/*!40000 ALTER TABLE `DOCTOR_FUNC_2` DISABLE KEYS */;
INSERT INTO `DOCTOR_FUNC_2` VALUES ('123456789','MS');
/*!40000 ALTER TABLE `DOCTOR_FUNC_2` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DRIVER` (
  `e_id` int(10) NOT NULL,
  `p_id` int(15) NOT NULL,
  `subclass` char(2) not null,
  PRIMARY KEY(`p_id`),
  constraint `chk_dr` check(subclass='Dr'),
  CONSTRAINT `DRIVER_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `PATIENT` (`p_id`),
  CONSTRAINT `DRIVER_ibfk_2` FOREIGN KEY (`e_id`, `subclass`) REFERENCES `EMPLOYEE` (`e_id`, `subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `DRIVER` WRITE;
/*!40000 ALTER TABLE `DRIVER` DISABLE KEYS */;
INSERT INTO `DRIVER` VALUES ('123456787','888665555', 'Dr');
/*!40000 ALTER TABLE `DRIVER` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VEHICLE` (
  `vehicle_number` varchar(10) NOT NULL,
  `model` varchar(5) NOT NULL,
  `color` char(7) NOT NULL,
  PRIMARY KEY(`vehicle_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `VEHICLE` WRITE;
/*!40000 ALTER TABLE `VEHICLE` DISABLE KEYS */;
INSERT INTO `VEHICLE` VALUES ('1008','HDI','White');
/*!40000 ALTER TABLE `VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `DRIVER_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DRIVER_FUNC` (
  `e_id` int(10) NOT NULL,
  `vehicle_number` varchar(15) NOT NULL,
  `license_number` varchar(15) NOT NULL,
  PRIMARY KEY(`e_id`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `DRIVER_FUNC_ibfk_1` FOREIGN KEY (`vehicle_number`) REFERENCES `VEHICLE` (`vehicle_number`),
  CONSTRAINT `DRIVER_FUNC_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `DRIVER` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `DRIVER_FUNC` WRITE;
/*!40000 ALTER TABLE `DRIVER_FUNC` DISABLE KEYS */;
INSERT INTO `DRIVER_FUNC` VALUES ('123456787','1008','1008-9');
/*!40000 ALTER TABLE `DRIVER_FUNC` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST` (
  `test_id` int(10) NOT NULL,
  `test_cost` int(10) NOT NULL,
  `test_name` varchar(10) NOT NULL,
  PRIMARY KEY(`test_id`),
  CONSTRAINT `CHK_TEST` CHECK(test_id > 0 AND test_cost > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
INSERT INTO `TEST` VALUES ('12','1500','Q'),('13','1500','S');
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `MEDICINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICINE` (
  `id` int(10) NOT NULL,
  `quantity` int(5) NOT NULL, 
  `expiry_date` date NOT NULL,
  `cost` int(5) NOT NULL,
  `medicine_name` varchar(10) NOT NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `CHK_MEDICINE` CHECK(id > 0 AND cost > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `MEDICINE` WRITE;
/*!40000 ALTER TABLE `MEDICINE` DISABLE KEYS */;
INSERT INTO `MEDICINE` VALUES ('20', '5','2002-06-19','200','AL'),('21', '5','2002-06-19','200','Hydra');
/*!40000 ALTER TABLE `MEDICINE` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `NURSE_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NURSE_FUNC` (
  `e_id` int(10) NOT NULL,
  `qualification` varchar(7) NOT NULL,
  PRIMARY KEY(`e_id`, `qualification`),
  CONSTRAINT `NURSE_FUNC_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `NURSE` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `NURSE_FUNC` WRITE;
/*!40000 ALTER TABLE `NURSE_FUNC` DISABLE KEYS */;
INSERT INTO `NURSE_FUNC` VALUES ('123456786','Degree');
/*!40000 ALTER TABLE `NURSE_FUNC` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `PRESCRIBE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIBE` (
  `e_id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  PRIMARY KEY( `e_id`, `p_id`),
  CONSTRAINT `PRESCRIBE_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `DOCTOR` (`e_id`),
  CONSTRAINT `PRESCRIBE_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `PATIENT` (`p_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `PRESCRIBE` WRITE;
/*!40000 ALTER TABLE `PRESCRIBE` DISABLE KEYS */;
INSERT INTO `PRESCRIBE` VALUES ('123456789','888665555'),('123456789','888665554');
/*!40000 ALTER TABLE `PRESCRIBE` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `PRESCRIBE_FUNC_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIBE_FUNC_1` (
  `p_id` int(10) NOT NULL,
  `test_id` int(10) NOT NULL,
  `test_name` varchar(10) NOT NULL,
  `bill_date` datetime NOT NULL,
  PRIMARY KEY(`test_id`,`bill_date`,`p_id`),
  CONSTRAINT `PRESCRIBE_FUNC_1_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `TEST` (`test_id`),
  CONSTRAINT `PRESCRIBE_FUNC_1_ibfk_2` FOREIGN KEY (`bill_date`, `p_id`) REFERENCES `BILL` (`bill_date`, `p_id`),
  CONSTRAINT `PRESCRIBE_FUNC_1_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `PRESCRIBE` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `PRESCRIBE_FUNC_1` WRITE;
/*!40000 ALTER TABLE `PRESCRIBE_FUNC_1` DISABLE KEYS */;
INSERT INTO `PRESCRIBE_FUNC_1` VALUES (888665555,'12','Q','2000-07-18 12:00:00');
/*!40000 ALTER TABLE `PRESCRIBE_FUNC_1` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `PRESCRIBE_FUNC_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIBE_FUNC_2` (
  `p_id` int(10) NOT NULL,
  `id` int(10) NOT NULL,
  `medicine_cost` int(5) NOT NULL,
  `medicine_name` varchar(10) NOT NULL,
  `medicine_count` int(2) NOT NULL,
  `bill_date` datetime NOT NULL,
  PRIMARY KEY(`p_id`,`bill_date`,`id`),
  CONSTRAINT `CHK_PRESCRIBE_FUNC_2` CHECK(medicine_cost > 0),
  CONSTRAINT `PRESCRIBE_FUNC_2_ibfk_1` FOREIGN KEY (`id`) REFERENCES `MEDICINE` (`id`),
  CONSTRAINT `PRESCRIBE_FUNC_2_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `PRESCRIBE` (`p_id`),
  CONSTRAINT `PRESCRIBE_FUNC_2_ibfk_3` FOREIGN KEY (`bill_date`, `p_id`) REFERENCES `BILL` (`bill_date`, `p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--	

LOCK TABLES `PRESCRIBE_FUNC_2` WRITE;
/*!40000 ALTER TABLE `PRESCRIBE_FUNC_2` DISABLE KEYS */;
INSERT INTO `PRESCRIBE_FUNC_2` VALUES (888665555,'20','200','AL','1','2000-07-18 12:00:00'),(888665554,'20','200','AL','1','2000-06-21 12:00:00');
/*!40000 ALTER TABLE `PRESCRIBE_FUNC_2` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

