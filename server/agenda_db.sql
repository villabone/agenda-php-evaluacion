-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-08-2019 a las 03:13:56
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_fin` varchar(20) DEFAULT NULL,
  `hora_inicio` varchar(20) DEFAULT NULL,
  `hora_fin` varchar(20) DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `fk_usuarios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `allday`, `fk_usuarios`) VALUES
(6, 'visita', '2019-08-13', '2019-08-13', '07:00:00', '08:30:00', 0, 'jjvillabona1@gmail.com'),
(8, 'ventas', '2019-08-15', '', ':00', ':00', 1, 'jjvillabona1@gmail.com'),
(9, 'cita medica', '2019-08-21', '2019-08-21', '07:00:00', '10:00:00', 0, 'jjvillabona1@gmail.com'),
(10, 'paseo', '2019-08-25', '', ':00', ':00', 1, 'jjvillabona1@gmail.com'),
(11, 'Salvar el mundo', '2019-08-16', '2019-08-16', '09:00:00', '09:30:00', 0, 'jjvillabona1@gmail.com'),
(12, 'cumpleaÃ±os', '2019-08-23', '', ':00', ':00', 1, 'marielo@gmail.com'),
(13, 'tiketes', '2019-08-22', '2019-08-23', '07:00:00', '08:30:00', 0, 'marielo@gmail.com'),
(14, 'paseo', '2019-08-24', '2019-08-24', '08:30:00', '15:30:00', 0, 'marielo@gmail.com'),
(15, 'compras', '2019-08-27', '2019-08-27', '07:00:00', '09:30:00', 0, 'usuario@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(40) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `password`, `fecha_nacimiento`) VALUES
('jjvillabona1@gmail.com', 'Jose villabona', '$2y$10$N2KHgYGesMifhntabesbXucXhmgY0Pa/b8q3tQOF1EWKmmbPXSLSq', '1967-12-08'),
('marielo@gmail.com', 'Marielo Fernada', '$2y$10$KSVwaD23oGlB/jFE9fewjeX2Buo1R4bxD9PAFMotDrj2u6HA8u2Fa', '1927-08-11'),
('usuario@gmail.com', 'usuario', '$2y$10$U0HUimw1oIbvAtt1GKi1VuGhERllbT0pealdiBjQwhdIunHXmL6kK', '1986-08-04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios` (`fk_usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuarioemail_evento` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
