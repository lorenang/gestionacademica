CREATE DATABASE  IF NOT EXISTS `dbtesting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbtesting`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtesting
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `AlumnoID` int NOT NULL AUTO_INCREMENT,
  `UsuarioPerfilID` int NOT NULL,
  `Alumno_foto_fichaMedica` text,
  `Alumno_foto_dniFrente` text,
  `AlumnoFoto_dniDorso` text,
  `AlumnoFoto_actaNacimiento` text,
  PRIMARY KEY (`AlumnoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnocarpo`
--

DROP TABLE IF EXISTS `alumnocarpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnocarpo` (
  `AlumnoCarpoID` int NOT NULL AUTO_INCREMENT,
  `CarpoID` int NOT NULL,
  `AlumnoID` int NOT NULL,
  `AlumnoCarpoActivo` tinyint DEFAULT '0',
  PRIMARY KEY (`AlumnoCarpoID`),
  KEY `fk_carpo_has_Alumno_Alumno1_idx` (`AlumnoID`),
  KEY `fk_carpo_has_Alumno_carpo1_idx` (`CarpoID`),
  CONSTRAINT `fk_carpo_has_Alumno_Alumno1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`),
  CONSTRAINT `fk_carpo_has_Alumno_carpo1` FOREIGN KEY (`CarpoID`) REFERENCES `carpo` (`CARPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnocarpo`
--

LOCK TABLES `alumnocarpo` WRITE;
/*!40000 ALTER TABLE `alumnocarpo` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnocarpo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnocarpomateria`
--

DROP TABLE IF EXISTS `alumnocarpomateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnocarpomateria` (
  `AlumnoCarpoMateriaID` int NOT NULL AUTO_INCREMENT,
  `AlumnoCarpoID` int NOT NULL,
  `MateriaID` int NOT NULL,
  PRIMARY KEY (`AlumnoCarpoMateriaID`),
  KEY `AlumnoCarpoID_idx` (`AlumnoCarpoID`),
  KEY `AlumnoCarpoMateriaID_idx` (`MateriaID`),
  CONSTRAINT `AlumnoCarpoID` FOREIGN KEY (`AlumnoCarpoID`) REFERENCES `alumnocarpo` (`AlumnoCarpoID`),
  CONSTRAINT `AlumnoCarpoMateriaID` FOREIGN KEY (`MateriaID`) REFERENCES `materia` (`MateriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnocarpomateria`
--

LOCK TABLES `alumnocarpomateria` WRITE;
/*!40000 ALTER TABLE `alumnocarpomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnocarpomateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnodatosdomproc`
--

DROP TABLE IF EXISTS `alumnodatosdomproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnodatosdomproc` (
  `AlumnodatosDomProcID` int NOT NULL AUTO_INCREMENT,
  `AlumnoProv_domProc` varchar(45) DEFAULT NULL,
  `AlumnoDpto_domProc` varchar(45) DEFAULT NULL,
  `AlumnoLocalidad_domProc` varchar(45) DEFAULT NULL,
  `AlumnoBarrio_domProc` varchar(45) DEFAULT NULL,
  `Alumnocalle_domProc` varchar(45) DEFAULT NULL,
  `Alumnoaltura_domProc` int DEFAULT NULL,
  `AlumnoPiso_domProc` varchar(10) DEFAULT NULL,
  `AlumnoNumDpto_domProc` varchar(10) DEFAULT NULL,
  `AlumnoManzana_domProc` int DEFAULT NULL,
  `AlumnoLote_domProc` int DEFAULT NULL,
  `AlumnoCP_domProc` varchar(10) DEFAULT NULL,
  `AlumnoID` int NOT NULL,
  PRIMARY KEY (`AlumnodatosDomProcID`),
  KEY `AlumnoID` (`AlumnoID`),
  CONSTRAINT `alumnodatosdomproc_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnodatosdomproc`
--

LOCK TABLES `alumnodatosdomproc` WRITE;
/*!40000 ALTER TABLE `alumnodatosdomproc` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnodatosdomproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnodatossecundaria`
--

DROP TABLE IF EXISTS `alumnodatossecundaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnodatossecundaria` (
  `AlumnoDatosSecundariaID` int NOT NULL AUTO_INCREMENT,
  `AlumnoNombre_escuelaSecundaria` varchar(45) DEFAULT NULL,
  `AlumnoAnioEgreso_escuelaSecundaria` year DEFAULT NULL,
  `AlumnoModalidad_escuelaSecundaria` varchar(45) DEFAULT NULL,
  `Alumno_titulo_escuelaSecundaria` varchar(45) DEFAULT NULL,
  `Alumno_foto_tituloSecundario` text,
  `AlumnoID` int NOT NULL,
  PRIMARY KEY (`AlumnoDatosSecundariaID`),
  KEY `AlumnoID` (`AlumnoID`),
  CONSTRAINT `alumnodatossecundaria_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnodatossecundaria`
--

LOCK TABLES `alumnodatossecundaria` WRITE;
/*!40000 ALTER TABLE `alumnodatossecundaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnodatossecundaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpo`
--

DROP TABLE IF EXISTS `carpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpo` (
  `CARPOID` int NOT NULL AUTO_INCREMENT,
  `CarreraID` int NOT NULL,
  `PlanDeEstudioID` int NOT NULL,
  `OrientacionID` int DEFAULT NULL,
  `CarpoPrograma` varchar(255) DEFAULT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`CARPOID`),
  KEY `CARPOCarreraID_idx` (`CarreraID`),
  KEY `CARPOOrientacionID_idx` (`OrientacionID`),
  KEY `CARPOPlanID_idx` (`PlanDeEstudioID`),
  CONSTRAINT `CARPOCarreraID` FOREIGN KEY (`CarreraID`) REFERENCES `carrera` (`CarreraID`),
  CONSTRAINT `CARPOOrientacionID` FOREIGN KEY (`OrientacionID`) REFERENCES `orientacion` (`OrientacionID`),
  CONSTRAINT `CARPOPlanID` FOREIGN KEY (`PlanDeEstudioID`) REFERENCES `plandeestudio` (`PlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpo`
--

LOCK TABLES `carpo` WRITE;
/*!40000 ALTER TABLE `carpo` DISABLE KEYS */;
INSERT INTO `carpo` VALUES (1,1,1,NULL,NULL,1),(2,1,2,NULL,NULL,1),(3,2,1,NULL,NULL,1),(4,2,2,NULL,NULL,1),(5,3,1,NULL,NULL,1),(6,4,4,NULL,NULL,1),(7,5,5,NULL,NULL,1),(8,6,1,NULL,NULL,1),(9,7,5,1,NULL,1),(10,8,4,NULL,NULL,1),(11,1,4,NULL,NULL,1),(12,7,5,2,NULL,1),(13,6,6,NULL,NULL,1);
/*!40000 ALTER TABLE `carpo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `CarreraID` int NOT NULL AUTO_INCREMENT,
  `CarreraNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`CarreraID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Educaci??n Fisica'),(2,'Biologia'),(3,'Qu??mica'),(4,'Filosofia'),(5,'Historia'),(6,'Ciencias de la Educaci??n'),(7,'Educaci??n Especial'),(8,'T??cnico Superior en Act. F??sica, Org. y Gesti??n Deportiva');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `MateriaID` int NOT NULL AUTO_INCREMENT,
  `MateriaNombre` varchar(100) NOT NULL,
  `CarpoIDMat` int NOT NULL,
  `MateriaA??o` int DEFAULT NULL,
  `MateriaTipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MateriaID`),
  KEY `idcarpomat_idx` (`CarpoIDMat`),
  CONSTRAINT `idcarpomat` FOREIGN KEY (`CarpoIDMat`) REFERENCES `carpo` (`CARPOID`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Pedagogia I',3,1,'1?? Cuatrimestre'),(2,'Historia Argentina y LatinoAmericana',3,1,'1?? Cuatrimestre'),(3,'Alfabetizaci??n Academica',3,1,'Anual'),(4,'Matematica I',3,1,'1?? Cuatrimestre'),(5,'Ciencias de la Tierra',3,1,'1?? Cuatrimestre'),(6,'Biologia I',3,1,'Anual'),(7,'Quimica General',3,1,'Anual'),(8,'Practica 1',3,1,'Anual'),(9,'Sociologia de la Educaci??n',3,2,'1?? Cuatrimestre'),(10,'Fisica Biologica II',3,2,'1?? Cuatrimestre'),(12,'Psicolog??a Educacional',3,1,'2?? Cuatrimestre'),(13,'Historia de la Educacion y Politica Educacion',3,1,'2?? Cuatrimestre'),(14,'Fisica Biologica I',3,1,'2?? Cuatrimestre'),(15,'Epistemologia e Historia de las Ciencias',3,1,'2?? Cuatrimestre'),(16,'Biologia Humana I',3,2,'1?? Cuatrimestre'),(17,'Tecnologia de la Informaciony la Comunicaci??n',3,2,'2?? Cuatrimestre'),(18,'Biologia de os Microorganismos',3,2,'2?? Cuatrimestre'),(19,'EDI',3,2,'2?? Cuatrimestre'),(20,'Didactica General',3,2,'Anual'),(21,'Sujetos de la Educacion',3,2,'Anual'),(22,'Biologia Celular y Molecular',3,2,'Anual'),(23,'Quimica Organica y Biologica',3,2,'Anual'),(24,'Practica II',3,2,'Anual'),(25,'Filosofia de la Educacion',3,3,'1?? Cuatrimestre'),(26,'Integracion e Inclusion Educativa',3,3,'2?? Cuatrimestre'),(27,'Didactica de la Biologia',3,3,'Anual'),(28,'Morfofisiologia Animal',3,3,'Anual'),(29,'Biologia Humana II',3,3,'Anual'),(30,'Genetica',3,3,'Anual'),(31,'EDI',3,3,'Anual'),(32,'Practica III',3,3,'Anual'),(33,'Educacion Sexual Integral',3,4,'1?? Cuatrimestre'),(34,'Formacion Etica y Ciudadana',3,4,'1?? Cuatrimestre'),(35,'Ecologia',3,4,'1?? Cuatrimestre'),(36,'Biodiversidad Vegetal',3,4,'1?? Cuatrimestre'),(37,'Salud y Ambiente',3,4,'2?? Cuatrimestre'),(38,'Biotecnologia',3,4,'2?? Cuatrimestre'),(39,'Evolucion',3,4,'2?? Cuatrimestre'),(40,'Biodiversidad Animal',3,4,'2?? Cuatrimestre'),(41,'EDI',3,4,'Anual'),(42,'Residencia y sistematizacion de Experiencias',3,4,'Anual'),(47,'Historia Social Argentina y Latinoamericana',9,1,'Anual'),(48,'Psicolog??a General',9,1,'Anual'),(49,'Alfabetizaci??n Acad??mica',9,1,'Anual'),(50,'Sociolog??a',9,1,'1?? Cuatrimestre'),(51,'Pr??ctica docente I: La Instituci??n Educativa.',9,1,'Anual'),(52,'Pedagog??a General',9,1,'Anual'),(53,'Did??ctica General ',9,1,'Anual'),(54,'Problem??tica del Nivel Superior',9,1,'1?? Cuatrimestre'),(55,'Historia General de la Educaci??n',9,1,'2?? Cuatrimestre'),(56,'Sociolog??a de la Educaci??n',9,1,'2?? Cuatrimestre'),(57,'Antropolog??a ',9,2,'1?? Cuatrimestre'),(58,'Tecnolog??as de la informaci??n y la comunicaci',9,2,'Anual'),(59,'Filosof??a',9,2,'Anual'),(60,'Pr??ctica docente II: Curr??culum,  sujetos y c',9,2,'Anual'),(61,'Sujeto de la Educaci??n I',9,2,'Anual'),(62,'Psicolog??a de la Educaci??n',9,2,'Anual'),(63,' Teor??a y Pol??tica Curricular',9,2,'Anual'),(64,'Did??ctica I: Nivel Inicial',9,2,'1?? Cuatrimestre'),(65,'Did??ctica II: Nivel Primario',9,2,'2?? Cuatrimestre'),(66,'Lengua extranjera: Ingl??s',9,3,'Anual'),(67,'Educaci??n sexual integral',9,3,'2?? Cuatrimestre'),(68,'Epistemolog??a de las Ciencias Sociales',9,3,'1?? Cuatrimestre'),(69,'Pr??ctica docente III: Programaci??n  Did??ctica',9,3,'Anual'),(70,'Historia de la Educaci??n Argentina',9,3,'2?? Cuatrimestre'),(71,'Sujeto de la Educaci??n II: pubertad y adolesc',9,3,'Anual'),(72,'Filosof??a de la Educaci??n ',9,3,'1?? Cuatrimestre'),(73,'Did??ctica III: Nivel Secundario',9,3,'Anual'),(74,'Educaci??n y TIC I ',9,3,'Anual'),(75,'Pedagogia',12,1,'1?? Cuatrimestre'),(76,'Psicolog??a Educacional',12,1,'2?? Cuatrimestre'),(77,'Did??ctica General',12,1,'Anual'),(78,'Alfabetizaci??n Academica',12,1,'Anual'),(79,'Practica I',12,1,'Anual'),(80,'Problem??tica Contemporanea',12,1,'2?? Cuatrimestre'),(81,'Sujeto de la educaci??n especial',12,1,'Anual'),(82,'Bases Neuropsicologicas',12,1,'Anual'),(83,'Lengua y su Didactica',12,1,'Anual'),(84,'Matem??tica y su Did??ctica',12,1,'Anual'),(85,'El arte en la educaci??n especial',12,1,'2?? Cuatrimestre'),(86,'Historia Argentina y Latinoamericana',12,2,'1?? Cuatrimestre'),(87,'Historia de la educ. y politic. educ. Argenti',12,2,'2?? Cuatrimestre'),(88,'Sociolog??a de le educaci??n',12,2,'1?? Cuatrimestre'),(89,'Filosof??a ',12,2,'2?? Cuatrimestre'),(90,'Practica II',12,2,'Anual'),(91,'Cs. Naturales y su Didactica',12,2,'Anual'),(92,'Cs. Sociales y su Didactica',12,2,'Anual'),(93,'Trastornos del desarrollo en suj. con disc. n',12,2,'Anual'),(94,'Comunicaci??n, lenguaje y sus alter. en suj. c',12,2,'Anual'),(95,'Pedagog??a',13,1,'1?? Cuatrimestre'),(96,'Historia Argentina y Latinoamericana',13,1,'1?? Cuatrimestre'),(97,'Matem??tica',13,1,'1?? Cuatrimestre'),(98,'Ciencias de la Tierra',13,1,'1?? Cuatrimestre'),(99,'Psicolog??a Educacional',13,1,'2?? Cuatrimestre'),(100,'Historia de la Educaci??n y Pol??tica Educacion',13,1,'2?? Cuatrimestre'),(101,'F??sica Biol??gica I',13,1,'2?? Cuatrimestre'),(102,'Tecnolog??a de la Informaci??n y la Comunicaci??',13,1,'2?? Cuatrimestre'),(103,'Alfabetizaci??n Acad??mica',13,1,'Anual'),(104,'Practica I : La Instituci??n Educativa',13,1,'Anual'),(105,'Biolog??a',13,1,'Anual'),(106,'Qu??mica General',13,1,'Anual'),(107,'Did??ctica General',13,2,'Anual'),(108,'Practica II',13,2,'Anual'),(109,'Sujeto de la Educaci??n',13,2,'Anual'),(110,'Qu??mica Org??nica y Biol??gica',13,2,'Anual'),(111,'Biolog??a Humana I',13,2,'Anual'),(112,'Trabajo Experimental en Biolog??a',13,2,'Anual'),(113,'Sociolog??a de la Educaci??n',13,2,'1?? Cuatrimestre'),(114,'F??sica Biol??gica II',13,2,'1?? Cuatrimestre'),(115,'Filosof??a de la Educaci??n',13,2,'2?? Cuatrimestre'),(116,'Biolog??a de los Microorganismos',13,2,'2?? Cuatrimestre'),(117,'Epistemolog??a e Historia de las Ciencias',13,3,'1?? Cuatrimestre'),(118,'Integraci??n e Inclusi??n Educativa',13,3,'2?? Cuatrimestre'),(119,'Biolog??a Humana',13,3,'Anual'),(120,'Biolog??a Celular y Molecular',13,3,'Anual'),(121,'Did??ctica de la Biolog??a',13,3,'Anual'),(122,'Morfofisiologia Vegetal',13,3,'Anual'),(123,'Morfofisiologia Animal',13,3,'Anual'),(124,'Practica III : Programaci??n Did??ctica y Gesti',13,3,'Anual'),(136,'Pedagog??a',11,1,'1?? Cuatrimestre'),(137,'Psicolog??a Educacional',11,1,'2?? Cuatrimestre'),(138,'Alfabetizaci??n Acad??mica',11,1,'Anual'),(139,'Educaci??n Sexual Integral',11,1,'1?? Cuatrimestre'),(140,'Practica Docente I: La Instituci??n Educativa',11,1,'Anual'),(141,'Sujeto de la Educaci??n I',11,1,'Anual'),(142,'Biolog??a del Movimiento I',11,1,'Anual'),(143,'Practicas Motrices Integradas ',11,1,'Anual'),(144,'Practicas Acuaticas',11,1,'Anual'),(145,'Deportes individuales y su ense??anza I: Atletismo',11,1,'Anual'),(146,'Deportes Colectivos y su ense??anza I: Basquet',11,1,'Anual'),(220,'Juego y Educaci??n F??sica ',11,2,'Anual'),(221,'Did??ctica de la Educaci??n: F??sica I',11,2,'2?? Cuatrimestre'),(222,'Did??ctica General',11,2,'1?? Cuatrimestre'),(223,'Practica docente II: Curriculum, Sujetos y Contextos',11,2,'Anual'),(224,'Sujeto de la Educaci??n II',11,2,'Anual'),(225,'Biolog??a del Movimiento ',11,2,'Anual'),(226,'Gimnasia y su Ense??anza',11,2,'Anual'),(227,'Deportes individuales y su ense??anza II: Nataci??n',11,2,'Anual'),(228,'Deportes colectivos y su ense??anza II: Voleibol ',11,2,'Anual'),(229,'Sociolog??a de la Educaci??n',11,2,'1?? Cuatrimestre'),(230,'Filosof??a de la Educaci??n',11,3,'1?? Cuatrimestre'),(231,'Educaci??n y Nuevas Tecnolog??as I ',11,3,'Anual'),(232,'Historia de la Educaci??n y Pol??tica Educacional Argentina',11,3,'Anual'),(233,'Animaci??n Sociocultural y Din??mica de Grupos ',11,3,'1?? Cuatrimestre'),(234,'Practica docente III: Programaci??n Did??ctica, Gesti??n de micro experiencias de Ense??anza',11,3,'Anual'),(235,'Teor??a y epistemolog??a de la Educaci??n F??sica',11,3,'2?? Cuatrimestre'),(236,'Practicas gimnasticas actuales y su ense??anza',11,3,'Anual'),(237,'Deportes colectivos y su ense??anza III: Cestobol',11,3,'Anual'),(238,'Deportes colectivos y su ense??anza III: Handbol ',11,3,'Anual'),(239,'Practicas en la Naturaleza y Educaci??n Ambiental',11,3,'Anual'),(240,'Did??ctica de la Educaci??n F??sica II ',11,3,'Anual'),(241,'Formaci??n ??tica y Ciudadana ',11,4,'1?? Cuatrimestre'),(242,'Educaci??n y Nuevas tecnolog??as II',11,4,'Anual'),(243,'Inclusi??n e integraci??n educativa ',11,4,'2?? Cuatrimestre'),(244,'Residencia y Sistematizaci??n de experiencias I',11,4,'Anual'),(245,'Practicas Corporales y Necesidades Educativas Especiales',11,4,'1?? Cuatrimestre'),(246,'Deportes colectivos y su ense??anza IV: Hockey  ',11,4,'Anual'),(247,'Deportes colectivos y su ense??anza IV: Softbol',11,4,'Anual'),(248,'Entrenamiento Deportivo',11,4,'2?? Cuatrimestre'),(249,'Did??ctica de la Educaci??n F??sica III ',11,4,'Anual'),(250,'Taller de Evaluaci??n Educativa ??ulica ',11,5,'1?? Cuatrimestre'),(251,'Taller de Investigaci??n Educativa ',11,5,'Anual'),(252,'Residencia y sistematizaci??n de experiencias II ',11,5,'Anual'),(253,'Pol??tica, Legislaci??n y Gestiones Deportivas',11,5,'1?? Cuatrimestre'),(254,'Problem??tica de la Educaci??n Superior',11,5,'2?? Cuatrimestre'),(255,'Pedagog??a',2,1,'1?? Cuatrimestre'),(256,'Psicolog??a Educacional ',2,1,'2?? Cuatrimestre'),(257,'Alfabetizaci??n Acad??mica',2,1,'Anual'),(258,'Educaci??n Sexual Integral',2,1,'1?? Cuatrimestre'),(259,'Practica Docente I: La Instituci??n Educativa ',2,1,'Anual'),(260,'Sujeto de la Educaci??n I',2,1,'2?? Cuatrimestre'),(261,'Biolog??a del Movimiento I',2,1,'Anual'),(262,'Practicas Motrices Integradas',2,1,'Anual'),(263,'Practicas Acu??ticas',2,1,'Anual'),(264,'Deportes Individuales y su Ense??anza I: Atletismo',2,1,'Anual'),(265,'Deportes colectivos y su ense??anza I:Basquetbol',2,1,'Anual'),(266,'Tecnolog??a de la Informaci??n y la Comunicaci??n ',2,2,'2?? Cuatrimestre'),(267,'Sociolog??a de la Educaci??n',2,2,'1?? Cuatrimestre'),(268,'Did??ctica General  ',2,2,'1?? Cuatrimestre'),(269,'Practica docente II: Curriculum, Sujetos y Contextos',2,2,'Anual'),(270,'Sujeto de la Educaci??n II ',2,2,'Anual'),(271,'Biolog??a del Movimiento II',2,2,'1?? Cuatrimestre'),(272,'Gimnasia y su Ense??anza ',2,2,'Anual'),(273,'Deportes Individuales y su Ense??anza II: Nataci??n',2,2,'Anual'),(274,'Deportes Colectivos y su Ense??anza II: Voleibol',2,2,'Anual'),(275,'Juego y Educaci??n F??sica ',2,2,'Anual'),(276,'Did??ctica de la Educaci??n: F??sica I',2,2,'2?? Cuatrimestre'),(277,'Filosof??a de la Educaci??n ',2,3,'1?? Cuatrimestre'),(278,'Historia de la Educaci??n y Pol??tica Educacional Argentina',2,3,'Anual'),(279,'Animaci??n Sociocultural y Din??mica de Grupos',2,3,'1?? Cuatrimestre'),(280,'Practica docente III: Programaci??n Did??ctica, Gesti??n de micro experiencias de Ense??anza',2,3,'Anual'),(281,'Teor??a y Epistemolog??a de la Educaci??n F??sica',2,3,'2?? Cuatrimestre'),(282,'Practicas Gimnasticas Actuales y su Ense??anza',2,3,'Anual'),(283,'Deportes Colectivos y su Ense??anza III: Cestobol',2,3,'Anual'),(284,'Deportes Colectivos y su Ense??anza III: Handbol',2,3,'Anual'),(285,'Practicas en la Naturaleza y Educaci??n Ambiental',2,3,'Anual'),(286,'Did??ctica de la Educaci??n F??sica II',2,3,'Anual'),(287,'EDI: Primeros Auxilios ',2,3,'2?? Cuatrimestre'),(288,'Formaci??n ??tica y Ciudadana   ',2,4,'1?? Cuatrimestre'),(289,'Inclusi??n e Integraci??n Educativa ',2,4,'2?? Cuatrimestre'),(290,'Residencia y Sistematizaci??n de Experiencias I ',2,4,'Anual'),(291,'Pol??tica, Legislaci??n y Gesti??n Deportiva',2,4,'2?? Cuatrimestre'),(292,'Practicas Corporales y Necesidades Educativas Especiales',2,4,'1?? Cuatrimestre'),(293,'Deportes Colectivos y su Ense??anza IV: Hockey ',2,4,'Anual'),(294,'Deportes colectivos y su ense??anza IV: Softbol ',2,4,'Anual'),(295,'Entrenamiento Deportivo',2,4,'2?? Cuatrimestre'),(296,'Did??ctica de la Educaci??n F??sica III',2,4,'Anual'),(297,'EDI: T??cnico Deportivo  ',2,4,'1?? Cuatrimestre'),(298,'EDI: Actividad F??sica y Salud',2,4,'1?? Cuatrimestre'),(299,'Pedagog??a ',5,1,'1?? Cuatrimestre'),(300,'Pedagog??a Educacional ',5,1,'2?? Cuatrimestre'),(301,'Alfabetizaci??n Acad??mica',5,1,'Anual'),(302,'Historia de la Educaci??n y Pol??tica Educacional Argentina',5,1,'Anual'),(303,'Tecnolog??a de la Informaci??n y de la Comunicaci??n',5,1,'1?? Cuatrimestre'),(304,'Practica Docente I: La Instituci??n Educativa',5,1,'Anual'),(305,'Matem??tica',5,1,'Anual'),(306,'Qu??mica General',5,1,'Anual'),(307,'Laboratorio I',5,1,'Anual'),(308,'F??sica I',5,1,'2?? Cuatrimestre'),(309,'Pedagog??a ',5,1,'1?? Cuatrimestre'),(310,'Pedagog??a Educacional ',5,1,'2?? Cuatrimestre'),(311,'Alfabetizaci??n Acad??mica',5,1,'Anual'),(312,'Historia de la Educaci??n y Pol??tica Educacional Argentina',5,1,'Anual'),(313,'Tecnolog??a de la Informaci??n y de la Comunicaci??n',5,1,'1?? Cuatrimestre'),(314,'Practica Docente I: La Instituci??n Educativa',5,1,'Anual'),(315,'Matem??tica',5,1,'Anual'),(316,'Qu??mica General',5,1,'Anual'),(317,'Laboratorio I',5,1,'Anual'),(318,'F??sica I',5,1,'2?? Cuatrimestre'),(319,'Did??ctica General',5,2,'Anual'),(320,'Sociolog??a de la Educaci??n ',5,2,'Anual'),(321,'Practica Docente II: Curriculum, Sujetos y Contextos',5,2,'Anual'),(322,'F??sica II',5,2,'1?? Cuatrimestre'),(323,'Epistemolog??a e Historia de la Qu??mica',5,2,'2?? Cuatrimestre'),(324,'Sujeto de la Educaci??n',5,2,'Anual'),(325,'Qu??mica Inorg??nica',5,2,'Anual'),(326,'Qu??mica Org??nica ',5,2,'Anual'),(327,'Laboratorio II',5,2,'Anual'),(328,'Did??ctica General',5,2,'Anual'),(329,'Sociolog??a de la Educaci??n ',5,2,'Anual'),(330,'Practica Docente II: Curriculum, Sujetos y Contextos',5,2,'Anual'),(331,'F??sica II',5,2,'1?? Cuatrimestre'),(332,'Epistemolog??a e Historia de la Qu??mica',5,2,'2?? Cuatrimestre'),(333,'Sujeto de la Educaci??n',5,2,'Anual'),(334,'Qu??mica Inorg??nica',5,2,'Anual'),(335,'Qu??mica Org??nica ',5,2,'Anual'),(336,'Laboratorio II',5,2,'Anual'),(337,'Filosof??a de la Educaci??n',5,3,'1?? Cuatrimestre'),(338,'??tica y Construcci??n de la Ciudadan??a',5,3,'2?? Cuatrimestre'),(339,'Practica III: Programaci??n Did??ctica y Gesti??n de Micro-experiencias de ense??anza',5,3,'Anual'),(340,'Biolog??a',5,3,'Anual'),(341,'Did??ctica de la Qu??mica',5,3,'Anual'),(342,'Qu??mica Anal??tica ',5,3,'Anual'),(343,'Fisicoqu??mica ',5,3,'Anual'),(344,'Laboratorio III',5,3,'Anual'),(345,'Filosof??a de la Educaci??n',5,3,'1?? Cuatrimestre'),(346,'??tica y Construcci??n de la Ciudadan??a',5,3,'2?? Cuatrimestre'),(347,'Practica III: Programaci??n Did??ctica y Gesti??n de Micro-experiencias de ense??anza',5,3,'Anual'),(348,'Biolog??a',5,3,'Anual'),(349,'Did??ctica de la Qu??mica',5,3,'Anual'),(350,'Qu??mica Anal??tica ',5,3,'Anual'),(351,'Fisicoqu??mica ',5,3,'Anual'),(352,'Laboratorio III',5,3,'Anual'),(353,'Educaci??n Sexual Integral',5,4,'1?? Cuatrimestre'),(354,'Integraci??n e Inclusi??n Educativa',5,4,'2?? Cuatrimestre'),(355,'Residencia y sistematizaci??n de experiencias: Dise??o, ense??anza y evaluaci??n ',5,4,'Anual'),(356,'Ciencias de la Tierra ',5,4,'Anual'),(357,'Qu??mica Biol??gica ',5,4,'Anual'),(358,'Qu??mica Ambiental y Salud',5,4,'1?? Cuatrimestre'),(359,'Qu??mica Aplicada e Industrial',5,4,'2?? Cuatrimestre'),(360,'Laboratorio IV',5,4,'Anual'),(361,'Educaci??n Sexual Integral',5,4,'1?? Cuatrimestre'),(362,'Integraci??n e Inclusi??n Educativa',5,4,'2?? Cuatrimestre'),(363,'Residencia y sistematizaci??n de experiencias: Dise??o, ense??anza y evaluaci??n ',5,4,'Anual'),(364,'Ciencias de la Tierra ',5,4,'Anual'),(365,'Qu??mica Biol??gica ',5,4,'Anual'),(366,'Qu??mica Ambiental y Salud',5,4,'1?? Cuatrimestre'),(367,'Qu??mica Aplicada e Industrial',5,4,'2?? Cuatrimestre'),(368,'Laboratorio IV',5,4,'Anual'),(369,'Pedagog??a',1,1,'1?? Cuatrimestre'),(370,'Psicolog??a Educacional ',1,1,'2?? Cuatrimestre'),(371,'Educaci??n Sexual Integral ',1,1,'2?? Cuatrimestre'),(372,'Alfabetizaci??n Acad??mica',1,1,'Anual'),(373,'Historia de la Educaci??n y Pol??tica Educacional Argentina',1,1,'1?? Cuatrimestre'),(374,'Practica I',1,1,'Anual'),(375,'Biolog??a del Movimiento ',1,1,'Anual'),(376,'Formaci??n F??sico-motriz',1,1,'Anual'),(377,'Deportes individuales y su ense??anza I: Atletismo',1,1,'1?? Cuatrimestre'),(378,'Deportes colectivos y su ense??anza I: Basquet',1,1,'2?? Cuatrimestre'),(379,'Juegos motores y deportivos',1,1,'Anual'),(380,'Historia de la Educaci??n F??sica Argentina y Latinoamericana',1,1,'2?? Cuatrimestre'),(381,'Formaci??n ??tica y Ciudadana ',1,2,'2?? Cuatrimestre'),(382,'Formaci??n ??tica y Ciudadana ',1,1,'1?? Cuatrimestre'),(383,'Sociolog??a de la Educaci??n',1,2,'2?? Cuatrimestre'),(384,'Practica II',1,2,'Anual'),(385,'Sujeto de la Educaci??n I',1,2,'1?? Cuatrimestre'),(386,'Biolog??a del movimiento II',1,2,'1?? Cuatrimestre'),(387,'Gimnasia y su ense??anza',1,2,'Anual'),(388,'Deportes Individuales y su Ense??anza II: Judo',1,2,'1?? Cuatrimestre'),(389,'Deportes individuales y su ense??anza III: Atletismo',1,2,'2?? Cuatrimestre'),(390,'Deportes colectivos y su ense??anza II: Futbol',1,2,'1?? Cuatrimestre'),(391,'Deportes colectivos y su ense??anza III: Cestobol',1,2,'2?? Cuatrimestre'),(392,'Deportes colectivos y su ense??anza III: Handbol',1,2,'2?? Cuatrimestre'),(393,'Practicas Acu??ticas I',1,2,'2?? Cuatrimestre'),(394,'Juego y Educaci??n F??sica',1,2,'Anual'),(395,'Desarrollo Motor y Practicas Corporales',1,2,'1?? Cuatrimestre'),(396,'Did??ctica de la educaci??n f??sica I ',1,2,'2??C'),(397,'Filosof??a ',1,3,'1?? Cuatrimestre'),(398,'Tecnolog??a de la Informaci??n y de la Comunicaci??n',1,3,'1?? Cuatrimestre'),(399,'Practica III',1,3,'Anual'),(400,'Sujeto de la Educaci??n II ',1,3,'1?? Cuatrimestre'),(401,'Sujeto de la Educaci??n Especial',1,3,'2?? Cuatrimestre'),(402,'Teor??a y Epistemolog??a de la Educaci??n F??sica ',1,3,'2?? Cuatrimestre'),(403,'T??cnicas Gimnasticas Actuales y su Ense??anza',1,3,'Anual'),(404,'Deportes Colectivos y su Ense??anza IV',1,3,'1?? Cuatrimestre'),(405,'Deportes Colectivos y su Ense??anza V',1,3,'2?? Cuatrimestre'),(406,'Practicas Acu??ticas II',1,3,'2?? Cuatrimestre'),(407,'Practicas en la Naturaleza y Educaci??n Ambiental I',1,3,'2?? Cuatrimestre'),(408,'Practicas corporales y aprendizaje ',1,3,'1?? Cuatrimestre'),(409,'Did??ctica de la Educaci??n F??sica II ',1,3,'Anual'),(410,'Animaci??n Sociocultural y Din??mica de Grupos',1,4,'2?? Cuatrimestre'),(411,'Inclusi??n e Integraci??n Escolar',1,4,'1?? Cuatrimestre'),(412,'Practica IV  ',1,4,'Anual'),(413,'Deportes colectivos y su ense??anza VI: V??ley',1,4,'1?? Cuatrimestre'),(414,'Entrenamiento  ',1,4,'2?? Cuatrimestre'),(415,'Practicas Corporales para Necesidades Educativas Especiales',1,4,'1?? Cuatrimestre'),(416,'Practicas Corporales del Adulto Mayor',1,4,'2?? Cuatrimestre'),(417,'Pol??tica, Legislaci??n y Gesti??n Deportiva',1,4,'2?? Cuatrimestre'),(418,'Tiempo Libre y Problem??ticas Recreativas',1,4,'1?? Cuatrimestre'),(419,'Practicas en la Naturaleza II',1,4,'2?? Cuatrimestre'),(420,'EDI: Actividad F??sica',1,4,'Anual'),(421,'Sociolog??a',8,1,'1?? Cuatrimestre'),(422,'Problem??tica del Nivel Superior',8,1,'1?? Cuatrimestre'),(423,'Historia General de la Educaci??n',8,1,'2?? Cuatrimestre'),(424,'Sociolog??a de la Educaci??n',8,1,'2?? Cuatrimestre'),(425,'Historia Social Argentina y Latinoamericana',8,1,'Anual'),(426,'Psicolog??a General',8,1,'Anual'),(427,'Alfabetizaci??n Acad??mica',8,1,'Anual'),(428,'Practica docente I: La Instituci??n Educativa',8,1,'Anual'),(429,'Pedagogia General',8,1,'Anual'),(430,'Didactica General',8,1,'Anual'),(431,'Antropolog??a',8,2,'1?? Cuatrimestre'),(432,'Did??ctica I: Nivel Inicial',8,2,'1?? Cuatrimestre'),(433,'Did??ctica II: Nivel Primario',8,2,'2?? Cuatrimestre'),(434,'Tecnolog??as de la informaci??n y la comunicaci??n',8,2,'Anual'),(435,'Filosof??a',8,2,'Anual'),(436,'Practica Docente II: Curriculum, sujetos y contextos',8,2,'Anual'),(437,'Sujetos de la Educaci??n I',8,2,'Anual'),(438,'Psicolog??a de la Educaci??n',8,2,'Anual'),(439,'Teor??a y Pol??tica Curricular',8,2,'Anual'),(440,'Epistemolog??a de las Ciencias Sociales',8,3,'1?? Cuatrimestre'),(441,'Filosof??a de la Educaci??n',8,3,'1?? Cuatrimestre'),(442,'Educaci??n Sexual Integral',8,3,'2?? Cuatrimestre'),(443,'Historia de la Educaci??n Argentina',8,3,'2?? Cuatrimestre'),(444,'Lengua Extranjera: Ingles',8,3,'Anual'),(445,'Practica Docente III: Programaci??n, Did??ctica, Gesti??n de Micro-experiencias de ense??anzas',8,3,'Anual'),(446,'Sujeto de la Educaci??n II: pubertad y adolescencia',8,3,'Anual'),(447,'Did??ctica III: Nivel Secundario',8,3,'Anual'),(448,'Educaci??n y TIC I',8,3,'Anual'),(449,'Formaci??n ??tica y Ciudadana',8,4,'1?? Cuatrimestre'),(450,'Educaci??n Comparada',8,4,'1?? Cuatrimestre'),(451,'Pol??tica Educacional Argentina',8,4,'2?? Cuatrimestre'),(452,'Pensamiento Pedag??gico Latinoamericano',8,4,'2?? Cuatrimestre'),(453,'Residencia y Sistematizaci??n de experiencias: Dise??o, ense??anzas y evaluaci??n en los Niveles Inicial',8,4,'Anual'),(454,'Did??ctica IV: Nivel  Superior',8,4,'Anual'),(455,'Metodolog??a de Investigaci??n Educativa',8,4,'Anual'),(456,'Educaci??n y TIC II',8,4,'Anual'),(457,'Integraci??n y Inclusi??n Educativa',8,5,'1?? Cuatrimestre'),(458,'Evaluaci??n educativa I: ??ulica',8,5,'1?? Cuatrimestre'),(459,'Educaci??n en Contextos Diversos',8,5,'1?? Cuatrimestre'),(460,'Evaluaci??n Educativa II: Institucional',8,5,'2?? Cuatrimestre'),(461,'Administraci??n y Gesti??n Educativa',8,5,'2?? Cuatrimestre'),(462,'Residencia y Sistematizaci??n de Experiencias en el Nivel Superior ',8,5,'Anual'),(463,'Planeamiento Educativo',8,5,'Anual'),(464,'Comprensi??n y Producci??n de Textos',10,1,'1?? Cuatrimestre'),(465,'Historia y Sociolog??a del Deporte',10,1,'1?? Cuatrimestre'),(466,'TIC Aplicada a la Gesti??n Deportiva',10,1,'1?? Cuatrimestre'),(467,'Marketing Deportivo',10,1,'1?? Cuatrimestre'),(468,'Gesti??n del Talento Humano en el Deporte',10,1,'1?? Cuatrimestre'),(469,'Psicolog??a del Desarrollo Humano',10,1,'2?? Cuatrimestre'),(470,'Estad??stica Aplicada al Deporte',10,1,'2?? Cuatrimestre'),(471,'Planificaci??n y Gesti??n de Proyectos Deportivos',10,1,'2?? Cuatrimestre'),(472,'Publicidad, Promoci??n y Patrocinio de Eventos Deportivos',10,1,'2?? Cuatrimestre'),(473,'Protocolo Ceremonial en Eventos Deportivos',10,1,'2?? Cuatrimestre'),(474,'Ingles',10,1,'Anual'),(475,'Anatom??a Humana',10,1,'Anual'),(476,'Deporte I',10,1,'Anual'),(477,'Practica Profesional',10,1,'Anual'),(478,'Problem??tica Socio-Contempor??nea',10,2,'1?? Cuatrimestre'),(479,'??tica del Deporte',10,2,'1?? Cuatrimestre'),(480,'Psicolog??a de la Act. F??sica y el Deporte',10,2,'2?? Cuatrimestre'),(481,'Econom??a y Finanzas Deportivas',10,2,'2?? Cuatrimestre'),(482,'Organizaci??n, Administraci??n y Legislaci??n Deportiva',10,2,'Anual'),(483,'An??lisis del Movimiento Humano',10,2,'Anual'),(484,'Deporte II',10,2,'Anual'),(485,'Act. F??sicas, Recreativas y Sociales para Adultos Mayores',10,2,'Anual'),(486,'Fisiolog??a del Ejercicio',10,2,'Anual'),(487,'Pol??tica, Organizaci??n y Gesti??n de Torneos y Competencias',10,2,'Anual'),(488,'Practicas Profesionalizantes',10,2,'Anual'),(489,'Pedagog??a',6,1,'1?? Cuatrimestre'),(490,'Historia Argentina y Latinoamericana',6,1,'1?? Cuatrimestre'),(491,'Sociolog??a de la Educaci??n',6,1,'1?? Cuatrimestre'),(492,'Psicolog??a Educacional',6,1,'2?? Cuatrimestre'),(493,'Historia de la Educaci??n y Pol??tica Educacional Argentina',6,1,'2?? Cuatrimestre'),(494,'Alfabetizaci??n Acad??mica',6,1,'Anual'),(495,'Practica I: La Instituci??n Educaci??n, aproximaciones desde un enfoque investigativo',6,1,'Anual'),(496,'Historia de la Filosof??a Antigua',6,1,'Anual'),(497,'Introducci??n a la Filosof??a',6,1,'Anual'),(498,'L??gica y Argumentaci??n',6,1,'Anual'),(499,'Epistemolog??a e Historia de la Ciencia',6,2,'1?? Cuatrimestre'),(500,'Tecnolog??a de la Informaci??n y la Comunicaci??n',6,2,'2?? Cuatrimestre'),(501,'Did??ctica General',6,2,'Anual'),(502,'Practica II: Curriculum, Sujetos y Contextos, Aproximaciones desde un enfoque investigativo',6,2,'Anual'),(503,'Sujeto de la Educacion Secundaria',6,2,'Anual'),(504,'Antropolog??a Filosof??a',6,2,'Anual'),(505,'Historia de la Filosof??a Medieval',6,2,'Anual'),(506,'Etica',6,2,'Anual'),(507,'Teor??a del Conocimiento',6,2,'Anual'),(508,'Filosof??a de la Educaci??n',6,3,'1?? Cuatrimestre'),(509,'Filosof??a del Lenguaje',6,3,'1?? Cuatrimestre'),(510,'Filosof??a Social y DDHH',6,3,'1?? Cuatrimestre'),(511,'Formaci??n ??tica y Ciudadana',6,3,'2?? Cuatrimestre'),(512,'Filosof??a Practica',6,3,'2?? Cuatrimestre'),(513,'Filosof??a y Arte',6,3,'2?? Cuatrimestre'),(514,'Practica III: Programaci??n Did??ctica y Gesti??n de Micro-experiencias de ense??anzas para Nivel Primar',6,3,'Anual'),(515,'Did??ctica de la Filosof??a',6,3,'Anual'),(516,'Historia de la Filosof??a Moderna',6,3,'Anual'),(517,'Educaci??n Sexual Integral',6,4,'1?? Cuatrimestre'),(518,'Filosof??a de la Comunicaci??n y TICS',6,4,'1?? Cuatrimestre'),(519,'Pol??tica y Ciudadan??a',6,4,'2?? Cuatrimestre'),(520,'Filosof??a Latinoamericana e Intercultural',6,4,'2?? Cuatrimestre'),(521,'Residencia y Sistematizaci??n de Exp. Dise??o, Ense??anza y Evaluaci??n',6,4,'Anual'),(522,'Filosof??a Contempor??nea',6,4,'Anual'),(523,'Metafisica',6,4,'Anual'),(524,'Pedagog??a',7,1,'1?? Cuatrimestre'),(525,'Psicolog??a Educacional',7,1,'2?? Cuatrimestre'),(526,'Alfabetizaci??n Acad??mica',7,1,'Anual'),(527,'Filosof??a',7,1,'1?? Cuatrimestre'),(528,'Hist.de la Educ. Polit. Educ. Arg.',7,1,'2?? Cuatrimestre'),(529,'Practica I',7,1,'Anual'),(530,'Introducci??n a la Historia',7,1,'1?? Cuatrimestre'),(531,'Historia de Am??rica I',7,1,'2?? Cuatrimestre'),(532,'Culturas Orig. Americ. y Arg.',7,1,'Anual'),(533,'Historia Antigua',7,1,'Anual'),(534,'Epistemolog??a de la Ciencia',7,2,'1?? Cuatrimestre'),(535,'Problem??tica Socio-antropol??gica Educativa',7,2,'2?? Cuatrimestre'),(536,'Did??ctica General',7,2,'Anual'),(537,'Practica II',7,2,'Anual'),(538,'Sujeto de la Educaci??n',7,2,'Anual'),(539,'Historia Medieval',7,2,'1?? Cuatrimestre'),(540,'Historia Moderna',7,2,'2?? Cuatrimestre'),(541,'Historia de Am??rica II',7,2,'Anual'),(542,'Historia de Argentina I',7,2,'Anual'),(543,'EDI: Espacio y Soledad',7,2,'1?? Cuatrimestre'),(544,'EDI: Producciones Historiograficas',7,2,'2?? Cuatrimestre'),(545,'Sociolog??a de la Educaci??n',7,3,'1?? Cuatrimestre'),(546,'Tecnolog??a de la Informaci??n y la Comunicaci??n',7,3,'2?? Cuatrimestre'),(547,'Practica III',7,3,'Anual'),(548,'Did??ctica de la Historia',7,3,'Anual'),(549,'Historia de Am??rica III',7,3,'Anual'),(550,'Historia de Sgo y del NOA I',7,3,'Anual'),(551,'Historia de Argentina II',7,3,'Anual'),(552,'Corrientes Historiogr??ficas Contempor??neas',7,3,'1?? Cuatrimestre'),(553,'EDI: Ideas Pol??ticas',7,3,'2?? Cuatrimestre'),(554,'Educaci??n Sexual Integral',7,4,'1?? Cuatrimestre'),(555,'Formaci??n ??tica y Ciudadana',7,4,'1?? Cuatrimestre'),(556,'Residencia y Sistematizaci??n de Experiencias',7,4,'Anual'),(557,'Historia Arg. Reciente',7,4,'Anual'),(558,'Historia de Sgo y del NOA II',7,4,'Anual'),(559,'Historia Contemporanea',7,4,'Anual'),(560,'EDI: Metodolog??a de la Investigaci??n',7,4,'Anual');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientacion`
--

DROP TABLE IF EXISTS `orientacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orientacion` (
  `OrientacionID` int NOT NULL AUTO_INCREMENT,
  `OrientacionNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`OrientacionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientacion`
--

LOCK TABLES `orientacion` WRITE;
/*!40000 ALTER TABLE `orientacion` DISABLE KEYS */;
INSERT INTO `orientacion` VALUES (1,'Sordos e Hipoacusticos'),(2,'Neuromotor');
/*!40000 ALTER TABLE `orientacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `PerfilID` int NOT NULL AUTO_INCREMENT,
  `Perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`PerfilID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Administrativo'),(3,'Rector '),(4,'Secretario'),(5,'Bedel'),(6,'Docente '),(7,'Alumno'),(8,'Otro');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `PersonalID` int NOT NULL AUTO_INCREMENT,
  `UsuarioPerfilID` int NOT NULL,
  PRIMARY KEY (`PersonalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalcarpo`
--

DROP TABLE IF EXISTS `personalcarpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalcarpo` (
  `PersonalCarpoID` int NOT NULL AUTO_INCREMENT,
  `PersonalID` int NOT NULL,
  `CarpoID` int NOT NULL,
  `PersonalCarpoActivo` tinyint DEFAULT NULL,
  PRIMARY KEY (`PersonalCarpoID`),
  KEY `fk_Personal_has_carpo_carpo1_idx` (`CarpoID`),
  KEY `fk_Personal_has_carpo_Personal1_idx` (`PersonalID`),
  CONSTRAINT `fk_Personal_has_carpo_carpo1` FOREIGN KEY (`CarpoID`) REFERENCES `carpo` (`CARPOID`),
  CONSTRAINT `fk_Personal_has_carpo_Personal1` FOREIGN KEY (`PersonalID`) REFERENCES `personal` (`PersonalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalcarpo`
--

LOCK TABLES `personalcarpo` WRITE;
/*!40000 ALTER TABLE `personalcarpo` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalcarpo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalcarpomateria`
--

DROP TABLE IF EXISTS `personalcarpomateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalcarpomateria` (
  `PersonalCarpoMateriaID` int NOT NULL AUTO_INCREMENT,
  `PersonalCarpoID` int NOT NULL,
  `MateriaID` int NOT NULL,
  PRIMARY KEY (`PersonalCarpoMateriaID`),
  KEY `fk_PersonalCarpo_has_materia_materia1_idx` (`MateriaID`),
  KEY `PersonalCarpoID_idx` (`PersonalCarpoID`),
  CONSTRAINT `MateriaID` FOREIGN KEY (`MateriaID`) REFERENCES `materia` (`MateriaID`),
  CONSTRAINT `PersonalCarpoID` FOREIGN KEY (`PersonalCarpoID`) REFERENCES `personalcarpo` (`PersonalCarpoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalcarpomateria`
--

LOCK TABLES `personalcarpomateria` WRITE;
/*!40000 ALTER TABLE `personalcarpomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalcarpomateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plandeestudio`
--

DROP TABLE IF EXISTS `plandeestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plandeestudio` (
  `PlanID` int NOT NULL AUTO_INCREMENT,
  `PlanNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plandeestudio`
--

LOCK TABLES `plandeestudio` WRITE;
/*!40000 ALTER TABLE `plandeestudio` DISABLE KEYS */;
INSERT INTO `plandeestudio` VALUES (1,'2012'),(2,'2016'),(3,'2018'),(4,'2021'),(5,'2015'),(6,'2017'),(7,'2014'),(8,'2022');
/*!40000 ALTER TABLE `plandeestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `UsuarioCorreo` varchar(45) DEFAULT NULL,
  `UsuarioContrase??a` varchar(120) DEFAULT NULL,
  `UsuarioContrase??aTemp` varchar(120) DEFAULT NULL,
  `UsuarioActivo` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`UsuarioID`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  UNIQUE KEY `UsuarioCorreo_UNIQUE` (`UsuarioCorreo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertTempPassword` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
	IF (NEW.UsuarioContrase??aTemp IS NULL) THEN
		SET NEW.UsuarioContrase??aTemp := NEW.Usuario;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuariodatos`
--

DROP TABLE IF EXISTS `usuariodatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariodatos` (
  `UsuarioID` int NOT NULL,
  `UsuarioNombre` varchar(45) DEFAULT NULL,
  `UsuarioApellido` varchar(45) DEFAULT NULL,
  `UsuarioCUIL` int DEFAULT NULL,
  `UsuarioNacionalidad` varchar(45) DEFAULT NULL,
  `UsuarioFechaNac` varchar(45) DEFAULT NULL,
  `UsuarioSexoDNI` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UsuarioID`),
  CONSTRAINT `UsuarioIDDatos` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariodatos`
--

LOCK TABLES `usuariodatos` WRITE;
/*!40000 ALTER TABLE `usuariodatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariodatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariodomicilio`
--

DROP TABLE IF EXISTS `usuariodomicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariodomicilio` (
  `UsuarioID` int NOT NULL,
  `UsuarioProvincia` varchar(45) DEFAULT NULL,
  `UsuarioDepartamento` varchar(45) DEFAULT NULL,
  `UsuarioLocalidad` varchar(45) DEFAULT NULL,
  `UsuarioBarrio` varchar(45) DEFAULT NULL,
  `UsuarioCalle` varchar(45) DEFAULT NULL,
  `UsuarioAltura` int DEFAULT NULL,
  `UsuarioPiso` int DEFAULT NULL,
  `UsuarioNumDep` varchar(3) DEFAULT NULL,
  `UsuarioManzana` varchar(5) DEFAULT NULL,
  `UsuarioLote` varchar(5) DEFAULT NULL,
  `UsuarioCP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`UsuarioID`),
  CONSTRAINT `UsuarioIDDomicilio` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariodomicilio`
--

LOCK TABLES `usuariodomicilio` WRITE;
/*!40000 ALTER TABLE `usuariodomicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariodomicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioperfil`
--

DROP TABLE IF EXISTS `usuarioperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioperfil` (
  `UsuarioPerfilID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PerfilID` int NOT NULL,
  `UsuarioPerfilActivo` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`UsuarioPerfilID`),
  KEY `UsuarioPerfilUsuarioID_idx` (`UsuarioID`),
  KEY `UsuarioPerfilPerfilID_idx` (`PerfilID`),
  CONSTRAINT `UsuarioPerfilPerfilID` FOREIGN KEY (`PerfilID`) REFERENCES `perfil` (`PerfilID`),
  CONSTRAINT `UsuarioPerfilUsuarioID` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioperfil`
--

LOCK TABLES `usuarioperfil` WRITE;
/*!40000 ALTER TABLE `usuarioperfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioperfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PerfilInsertUsuario` AFTER INSERT ON `usuarioperfil` FOR EACH ROW BEGIN
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 7) THEN 
	  INSERT INTO alumno(UsuarioPerfilID) VALUES(new.usuarioperfilid);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 2) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 3) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 4) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 5) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 6) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
	IF ((SELECT perfilID FROM usuarioperfil WHERE usuarioperfilid = new.usuarioperfilid) = 8) THEN 
	  INSERT INTO personal(UsuarioPerfilID) VALUES(new.UsuarioPerfilID);
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'dbtesting'
--

--
-- Dumping routines for database 'dbtesting'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-10 11:28:06
