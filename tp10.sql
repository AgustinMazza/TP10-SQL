-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2025 a las 03:48:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp10`
--
CREATE DATABASE IF NOT EXISTS `tp10` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `tp10`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ID_comentario` int(11) NOT NULL,
  `Cont_coment` text NOT NULL,
  `ID_libro` int(10) DEFAULT NULL,
  `ID_miembro` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`ID_comentario`, `Cont_coment`, `ID_libro`, `ID_miembro`) VALUES
(1, '0', 1, 1),
(2, '1', 2, 2),
(3, '2', 3, 3),
(4, '3', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `ID_libro` int(5) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `informacion`
--

INSERT INTO `informacion` (`ID_libro`, `titulo`, `autor`, `genero`) VALUES
(1, 'El señor de los anillos', 'J. R. R. Tolkien', 'fantasía'),
(2, 'Harry Potter: la piedra filosofal', 'J. K. Rowling', 'fantasía'),
(3, 'La caída de la casa Usher', 'Edgar Allan Poe', 'terror literario'),
(4, 'Un amor de otra época', 'Adam West', 'Novela Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `ID_miembro` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `num_tel` int(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`ID_miembro`, `nombre`, `direccion`, `num_tel`, `email`) VALUES
(1, 'ElAgu', 'Av. Siempre Viva 742', 26640101, 'pintamostodalacasa@gmail.com'),
(2, 'ElJereCkt', 'Calle\r\nfalsa 123', 26640202, 'dosdetrescaidas@gmail.com'),
(3, 'Aczino', 'Las catitas 104', 26640303, 'soychicarebelde@gmail.com'),
(4, 'ElJereArcor', 'Fondo de bikini 124', 26640404, 'pupitre15@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_prestamo` int(10) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `ID_miembro` int(10) DEFAULT NULL,
  `ID_libro` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_prestamo`, `fecha_prestamo`, `fecha_devolucion`, `ID_miembro`, `ID_libro`) VALUES
(1, '2024-03-20', '2024-08-20', 1, 1),
(2, '2025-03-20', '0000-00-00', 2, 2),
(3, '2025-04-20', '0000-00-00', 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_comentario`),
  ADD KEY `fk_comentarios_informacion` (`ID_libro`),
  ADD KEY `fk_nose` (`ID_miembro`);

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD PRIMARY KEY (`ID_libro`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`ID_miembro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_prestamo`),
  ADD KEY `fk_prestamos_libro` (`ID_libro`),
  ADD KEY `fk_comentarios_miembro` (`ID_miembro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ID_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `informacion`
--
ALTER TABLE `informacion`
  MODIFY `ID_libro` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `ID_miembro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_prestamo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_informacion` FOREIGN KEY (`ID_libro`) REFERENCES `informacion` (`ID_libro`),
  ADD CONSTRAINT `fk_nose` FOREIGN KEY (`ID_miembro`) REFERENCES `miembros` (`ID_miembro`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_comentarios_miembro` FOREIGN KEY (`ID_miembro`) REFERENCES `miembros` (`ID_miembro`),
  ADD CONSTRAINT `fk_prestamos_libro` FOREIGN KEY (`ID_libro`) REFERENCES `informacion` (`ID_libro`),
  ADD CONSTRAINT `fk_prestamos_miembro` FOREIGN KEY (`ID_miembro`) REFERENCES `miembros` (`ID_miembro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
