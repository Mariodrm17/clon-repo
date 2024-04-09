-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-04-2024 a las 16:24:34
-- Versión del servidor: 8.0.35
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portaventura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` text,
  `fecha_apertura` date DEFAULT NULL,
  `ubicacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre`, `descripcion`, `fecha_apertura`, `ubicacion`) VALUES
(1, 'Mediterráneo', 'Área temática inspirada en el Mediterráneo y sus culturas.', '1995-04-02', 'PortAventura World'),
(2, 'China', 'Área temática inspirada en la China antigua y su cultura.', '1995-04-02', 'PortAventura World'),
(3, 'México', 'Área temática inspirada en la cultura y arquitectura mexicana.', '1995-04-02', 'PortAventura World'),
(4, 'Polinesia', 'Área temática inspirada en las islas del Pacífico y su cultura.', '1995-04-02', 'PortAventura World');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atracciones`
--

DROP TABLE IF EXISTS `atracciones`;
CREATE TABLE IF NOT EXISTS `atracciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `altura_minima` decimal(5,2) DEFAULT NULL,
  `descripcion` text,
  `fecha_apertura` date DEFAULT NULL,
  `tiempo_espera_promedio` int DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `estado` enum('Operativa','En Mantenimiento') DEFAULT 'Operativa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `atracciones`
--

INSERT INTO `atracciones` (`id`, `nombre`, `tipo`, `altura_minima`, `descripcion`, `fecha_apertura`, `tiempo_espera_promedio`, `ubicacion`, `capacidad`, `estado`) VALUES
(1, 'Shambhala', 'Montaña Rusa', '1.40', 'Montaña rusa de tipo hypercoaster con una altura máxima de 76 metros y una velocidad máxima de 134 km/h.', '2012-05-12', 45, 'Mediterranea', 32, 'Operativa'),
(2, 'Furius Baco', 'Montaña Rusa', '1.40', 'Montaña rusa lanzada que alcanza una velocidad máxima de 135 km/h en 3 segundos.', '2007-06-05', 30, 'Mediterranea', 20, 'Operativa'),
(3, 'Dragon Khan', 'Montaña Rusa', '1.40', 'Montaña rusa con ocho inversiones y una altura máxima de 45 metros.', '1995-04-02', 40, 'China', 28, 'Operativa'),
(4, 'Red Force', 'Acelerador Vertical', '1.40', 'Acelerador vertical con una altura máxima de 112 metros y una velocidad máxima de 180 km/h.', '2017-04-07', 60, 'México', 16, 'Operativa'),
(5, 'Tutuki Splash', 'Rápidos', '1.00', 'Atracción de rápidos con una caída de 15 metros.', '1995-04-02', 25, 'Polinesia', 24, 'Operativa'),
(6,'Hurakan Condor', 'Torre de Caída', '1.40', 'Torre de caída libre de 100 metros de altura.', '2005-06-17', 40, 'México', 20, 'Operativa'),
(7,'Stampida', 'Montaña Rusa de Madera', '1.20', 'Montaña rusa de madera con dos circuitos paralelos.', '1997-04-12', 35, 'Mediterranea', 36, 'Operativa'),
(8,'Silver River Flume', 'Rápidos', '1.10', 'Atracción de rápidos con un recorrido acuático a través de un cañón.', '1992-06-20', 30, 'Polinesia', 30, 'Operativa'),
(9,'Templo del Fuego', 'Simulador 4D', '1.20', 'Atracción con efectos especiales que simula un viaje en busca de un tesoro perdido.', '2002-03-29', 50, 'China', 24, 'Operativa'),
(10,'Sea Odyssey', 'Atracción Submarina', '1.00', 'Simulador de submarino que ofrece una experiencia inmersiva bajo el mar.', '2019-07-15', 45, 'Mediterranea', 16, 'Operativa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `area_trabajo` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `puesto`, `area_trabajo`, `fecha_contratacion`, `salario`, `estado`, `fecha_registro`) VALUES
(1, 'Juan', 'Martinez', 'Operador de atracciones', 'Mediterranea', '2010-03-15', '1800.00', 'Activo', '2024-04-03 14:57:33'),
(2, 'María', 'González', 'Técnico de mantenimiento', 'México', '2015-08-20', '2200.00', 'Activo', '2024-04-03 14:57:33'),
(3, 'Carlos', 'López', 'Guía de espectáculos', 'China', '2018-05-10', '2000.00', 'Activo', '2024-04-03 14:57:33'),
(4, 'Ana', 'Rodríguez', 'Cajero de tienda', 'Polynesia', '2020-01-30', '1600.00', 'Activo', '2024-04-03 14:57:33'),
(5,'Pedro', 'Sánchez', 'Coordinador de Seguridad', 'Mediterranea', '2012-06-10', '2500.00', 'Activo', '2024-04-03 14:57:33'),
(6,'Lucía', 'Martínez', 'Animador Infantil', 'Polynesia', '2013-04-05', '1900.00', 'Activo', '2024-04-03 14:57:33'),
(7,'Manuel', 'Díaz', 'Camarero', 'Ristorante Italiano', '2016-09-15', '1800.00', 'Activo', '2024-04-03 14:57:33'),
(8,'Elena', 'García', 'Recepcionista', 'Hotel Mediterráneo', '2019-11-20', '2100.00', 'Activo', '2024-04-03 14:57:33'),
(9,'David', 'Fernández', 'Monitor de Atracciones', 'México', '2017-07-25', '2000.00', 'Activo', '2024-04-03 14:57:33'),
(10,'Sara', 'López', 'Cajero de Restaurante', 'Bistró Francés', '2020-03-10', '1700.00', 'Activo', '2024-04-03 14:57:33');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE IF NOT EXISTS `visitantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `numero_documento` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `visitantes`
--

INSERT INTO `visitantes` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `genero`, `nacionalidad`, `tipo_documento`, `numero_documento`, `fecha_registro`) VALUES
(1, 'Raul', 'Pelayo', '2004-05-10', 'Masculino', 'Española', 'DNI', '12345678A', '2024-04-03 14:57:33'),
(2, 'Alvaro', 'Lostal', '2004-08-12', 'Masculino', 'Española', 'DNI', '87654321B', '2024-04-03 14:57:33'),
(3, 'Mario del Rio', 'Merino', '2004-11-17', 'Masculino', 'Española', 'DNI', '98765432C', '2024-04-03 14:57:33'),
(4, 'Pablo', 'Cantero', '2004-08-18', 'Masculino', 'Española', 'DNI', '72206059C', '2024-04-03 14:57:33'),
(5,'Laura', 'Sánchez', '2005-02-28', 'Femenino', 'Española', 'DNI', '65432109D', '2024-04-03 14:57:33'),
(6,'Sofía', 'García', '2004-10-15', 'Femenino', 'Española', 'DNI', '56789012E', '2024-04-03 14:57:33'),
(7,'Manuel', 'Fernández', '2004-07-22', 'Masculino', 'Española', 'DNI', '90123456F', '2024-04-03 14:57:33'),
(8,'Elena', 'López', '2004-03-05', 'Femenino', 'Española', 'DNI', '34567890G', '2024-04-03 14:57:33'),
(9,'Diego', 'Martínez', '2004-12-09', 'Masculino', 'Española', 'DNI', '67890123H', '2024-04-03 14:57:33'),
(10,'Lucía', 'Ruiz', '2004-09-21', 'Femenino', 'Española', 'DNI', '78901234I', '2024-04-03 14:57:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

DROP TABLE IF EXISTS `visitas`;
CREATE TABLE IF NOT EXISTS `visitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visitante` int NOT NULL,
  `fecha_visita` date NOT NULL,
  `cantidad_personas` int NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_visitante` (`id_visitante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `id_visitante`, `fecha_visita`, `cantidad_personas`, `monto_total`) VALUES
(1, 1, '2023-07-10', 2, '80.00'),
(2, 2, '2023-08-05', 3, '120.00'),
(3, 3, '2023-09-15', 1, '40.00'),
(4, 4, '2023-10-20', 2, '90.00'),
(5, 5,'2023-11-12', 4, '160.00'),
(6, 6,'2023-12-25', 2, '100.00'),
(7, 7,'2024-01-08', 3, '120.00'),
(8, 8,'2024-02-14', 2, '90.00'),
(9, 9,'2024-03-20', 1, '40.00'),
(10, 10,'2024-04-01', 5, '200.00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id`);
COMMIT;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espectaculos`
--

DROP TABLE IF EXISTS `espectaculos`;
CREATE TABLE IF NOT EXISTS `espectaculos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `hora_inicio` time NOT NULL,
  `duracion` int NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Volcado de datos para la tabla `espectaculos`
--
INSERT INTO `espectaculos` (`nombre`, `descripcion`, `hora_inicio`, `duracion`, `ubicacion`) VALUES
('Fantasía Acuática', 'Espectáculo de luces y agua con música en vivo.', '20:00:00', 90, 'Lago principal'),
('El Circo de las Estrellas', 'Espectáculo de circo con acróbatas y malabaristas.', '18:30:00', 60, 'Cúpula del Circo'),
('Aventuras en el Tiempo', 'Espectáculo teatral interactivo con efectos especiales.', '17:00:00', 75, 'Teatro Principal'),
('Fuegos Artificiales Nocturnos', 'Espectáculo de fuegos artificiales sobre el castillo.', '22:00:00', 30, 'Zona Central'),
('Concierto de Rock en Vivo', 'Concierto de bandas de rock locales.', '19:30:00', 120, 'Anfiteatro al Aire Libre'),
('Mundo de Magia', 'Espectáculo de magia con ilusionistas y trucos sorprendentes.', '16:00:00', 60, 'Teatro de Magia'),
('Danza del León', 'Espectáculo de danza tradicional china con leones.', '15:00:00', 45, 'Plaza China'),
('Aventura en la Jungla', 'Espectáculo de acrobacias en la selva con animales amaestrados.', '14:30:00', 90, 'Área de Aventuras'),
('Cuentos Encantados', 'Espectáculo infantil de cuentacuentos con personajes mágicos.', '11:00:00', 45, 'Teatro de Cuentos'),
('Cine al Aire Libre', 'Proyección de películas familiares bajo las estrellas.', '21:00:00', 120, 'Zona de Picnic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--
DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE IF NOT EXISTS `restaurantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_cocina` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `horario_apertura` time DEFAULT NULL,
  `horario_cierre` time DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Volcado de datos para la tabla `restaurantes`
--
INSERT INTO `restaurantes` (`nombre`, `tipo_cocina`, `ubicacion`, `horario_apertura`, `horario_cierre`, `capacidad`) VALUES
('La Taberna del Pirata', 'Mariscos y pescados frescos', 'Puerto de los Piratas', '12:00:00', '22:00:00', 80),
('Ristorante Italiano', 'Cocina italiana auténtica', 'Piazza Italia', '11:30:00', '21:30:00', 60),
('Bistró Francés', 'Gastronomía francesa refinada', 'Rue de Paris', '13:00:00', '23:00:00', 50),
('Barbacoa Mexicana', 'Platos de la cocina mexicana', 'Plaza de los Mariachis', '12:30:00', '22:30:00', 70),
('Sushi Lounge', 'Sushi y comida japonesa moderna', 'Sakura Garden', '18:00:00', '23:30:00', 40),
('Brasería Argentina', 'Carnes a la parrilla y vinos argentinos', 'La Pampa', '17:00:00', '00:00:00', 50),
('Cafetería del Lago', 'Bocadillos y café con vistas al lago', 'Paseo del Lago', '10:00:00', '20:00:00', 30),
('Cantina Mexicana', 'Comida rápida mexicana', 'Calle de los Sombreros', '11:00:00', '21:00:00', 40),
('Pizzería del Bosque Encantado', 'Pizzas al horno de leña', 'Bosque Encantado', '12:00:00', '20:30:00', 60),
('Café Parisino', 'Café y pastelería francesa', 'Rue de Paris', '09:00:00', '19:00:00', 25);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
