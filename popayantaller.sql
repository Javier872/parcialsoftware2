-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para popayan
CREATE DATABASE IF NOT EXISTS `popayan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `popayan`;

-- Volcando estructura para tabla popayan.accidente
CREATE TABLE IF NOT EXISTS `accidente` (
  `ID_accidente` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ID_ubicacion` int(11) DEFAULT NULL,
  `ID_causa` int(11) DEFAULT NULL,
  `descripción` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_accidente`),
  KEY `ID_ubicacion` (`ID_ubicacion`),
  KEY `ID_causa` (`ID_causa`),
  CONSTRAINT `accidente_ibfk_1` FOREIGN KEY (`ID_ubicacion`) REFERENCES `ubicacion` (`ID_ubicacion`),
  CONSTRAINT `accidente_ibfk_2` FOREIGN KEY (`ID_causa`) REFERENCES `causa` (`ID_causa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.accidente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.causa
CREATE TABLE IF NOT EXISTS `causa` (
  `ID_causa` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_causa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.causa: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.causas_vehiculo
CREATE TABLE IF NOT EXISTS `causas_vehiculo` (
  `ID_causa_vehiculo` int(11) NOT NULL,
  `ID_vehiculo` int(11) DEFAULT NULL,
  `ID_causa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_causa_vehiculo`),
  KEY `ID_vehiculo` (`ID_vehiculo`),
  KEY `ID_causa` (`ID_causa`),
  CONSTRAINT `causas_vehiculo_ibfk_1` FOREIGN KEY (`ID_vehiculo`) REFERENCES `vehiculo` (`ID_vehiculo`),
  CONSTRAINT `causas_vehiculo_ibfk_2` FOREIGN KEY (`ID_causa`) REFERENCES `causa` (`ID_causa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.causas_vehiculo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.cedula
CREATE TABLE IF NOT EXISTS `cedula` (
  `ID_cedula` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.cedula: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.lesion
CREATE TABLE IF NOT EXISTS `lesion` (
  `ID_lesion` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `gravedad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_lesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.lesion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.participantes
CREATE TABLE IF NOT EXISTS `participantes` (
  `ID_participante` int(11) NOT NULL,
  `ID_accidente` int(11) DEFAULT NULL,
  `ID_vehiculo` int(11) DEFAULT NULL,
  `ID_lesion` int(11) DEFAULT NULL,
  `ID_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_participante`),
  KEY `ID_accidente` (`ID_accidente`),
  KEY `ID_vehiculo` (`ID_vehiculo`),
  KEY `ID_lesion` (`ID_lesion`),
  KEY `ID_persona` (`ID_persona`),
  CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`ID_accidente`) REFERENCES `accidente` (`ID_accidente`),
  CONSTRAINT `participantes_ibfk_2` FOREIGN KEY (`ID_vehiculo`) REFERENCES `vehiculo` (`ID_vehiculo`),
  CONSTRAINT `participantes_ibfk_3` FOREIGN KEY (`ID_lesion`) REFERENCES `lesion` (`ID_lesion`),
  CONSTRAINT `participantes_ibfk_4` FOREIGN KEY (`ID_persona`) REFERENCES `persona` (`ID_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.participantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.pasajeros
CREATE TABLE IF NOT EXISTS `pasajeros` (
  `ID_pasajero` int(11) NOT NULL AUTO_INCREMENT,
  `ID_vehiculo` int(11) DEFAULT NULL,
  `cantidad_personas` int(11) DEFAULT NULL,
  `ID_cedula` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_pasajero`),
  KEY `ID_vehiculo` (`ID_vehiculo`),
  KEY `ID_cedula` (`ID_cedula`),
  CONSTRAINT `pasajeros_ibfk_1` FOREIGN KEY (`ID_vehiculo`) REFERENCES `vehiculo` (`ID_vehiculo`),
  CONSTRAINT `pasajeros_ibfk_2` FOREIGN KEY (`ID_cedula`) REFERENCES `cedula` (`ID_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.pasajeros: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `ID_persona` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.persona: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.seguro
CREATE TABLE IF NOT EXISTS `seguro` (
  `ID_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `cobertura` varchar(255) NOT NULL,
  `compañia` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.seguro: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.seguro_vehiculo
CREATE TABLE IF NOT EXISTS `seguro_vehiculo` (
  `ID_seguro_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `ID_vehiculo` int(11) DEFAULT NULL,
  `ID_seguro` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_seguro_vehiculo`),
  KEY `ID_vehiculo` (`ID_vehiculo`),
  KEY `ID_seguro` (`ID_seguro`),
  CONSTRAINT `seguro_vehiculo_ibfk_1` FOREIGN KEY (`ID_vehiculo`) REFERENCES `vehiculo` (`ID_vehiculo`),
  CONSTRAINT `seguro_vehiculo_ibfk_2` FOREIGN KEY (`ID_seguro`) REFERENCES `seguro` (`ID_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.seguro_vehiculo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `ID_ubicacion` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.ubicacion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla popayan.vehiculo
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `ID_vehiculo` int(11) NOT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla popayan.vehiculo: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
