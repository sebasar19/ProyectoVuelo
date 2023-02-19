-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2023 a las 20:28:03
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_vuelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aerloniea`
--

CREATE TABLE `aerloniea` (
  `alin_id` int(11) NOT NULL,
  `alin_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE `aeropuerto` (
  `aer_id` int(11) NOT NULL,
  `aer_nombre` varchar(50) NOT NULL,
  `aer_pais` varchar(50) NOT NULL,
  `aer_ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aeropuerto`
--

INSERT INTO `aeropuerto` (`aer_id`, `aer_nombre`, `aer_pais`, `aer_ciudad`) VALUES
(1, 'Aeropuerto de París-Charles de Gaulle', 'Francia', 'Paris'),
(2, 'Aeropuerto Internacional Bonilla Aragón', 'Palmira', ' Valle del Cauca'),
(3, 'Aeropuerto Clorinda', 'Clorinda', 'Clorinda'),
(4, 'Aeropuerto Internacional El Edén', 'Colombia', 'Quindío'),
(5, 'Aeropuerto Internacional Ernesto Cortissoz', 'Colombia', 'Barranquilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `asi_id` int(11) NOT NULL,
  `asi_claseAsiento` varchar(50) NOT NULL,
  `asi_fila` varchar(50) NOT NULL,
  `asi_letra` varchar(50) NOT NULL,
  `vue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`asi_id`, `asi_claseAsiento`, `asi_fila`, `asi_letra`, `vue_id`) VALUES
(1, 'economica', '1', 'A', 1),
(2, 'economica', '4', 'T', 2),
(3, 'economica', '6', 'Y', 3),
(4, 'economica', 'D', '5', 4),
(5, 'primera clase', '1', 'P', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `avi_id` int(11) NOT NULL,
  `avi_fabricante` varchar(50) NOT NULL,
  `avi_modelo` varchar(50) NOT NULL,
  `avi_capacidadPasajeros` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`avi_id`, `avi_fabricante`, `avi_modelo`, `avi_capacidadPasajeros`) VALUES
(1, 'Lockheed Martin', 'Vega', '600'),
(2, 'Lockheed Martin', '3d2', '610'),
(3, 'Lockheed Martin', '4dfd', '620'),
(4, 'Lockheed Martin', '5fsd', '630'),
(5, 'Lockheed Martin', '6fdfs', '640');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallevuelo`
--

CREATE TABLE `detallevuelo` (
  `avi_id` int(11) DEFAULT NULL,
  `vue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `hor_id` int(11) NOT NULL,
  `hor_fecha` date DEFAULT NULL,
  `hor_hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`hor_id`, `hor_fecha`, `hor_hora`) VALUES
(1, '0000-00-00', '12:00:00'),
(2, '2023-02-16', '12:38:10'),
(3, '2023-02-23', '10:38:49'),
(4, '2023-03-03', '00:39:13'),
(5, '2023-04-26', '13:39:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `pas_id` int(11) NOT NULL,
  `pas_usuario` varchar(50) DEFAULT NULL,
  `pas_contraseña` varchar(50) DEFAULT NULL,
  `pas_nombre` varchar(50) DEFAULT NULL,
  `pas_pais` varchar(50) DEFAULT NULL,
  `pas_ciudad` varchar(50) DEFAULT NULL,
  `pas_direccion` varchar(50) DEFAULT NULL,
  `pas_codigoPostal` varchar(50) DEFAULT NULL,
  `pas_numeroTelefono` int(10) DEFAULT NULL,
  `pas_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`pas_id`, `pas_usuario`, `pas_contraseña`, `pas_nombre`, `pas_pais`, `pas_ciudad`, `pas_direccion`, `pas_codigoPostal`, `pas_numeroTelefono`, `pas_email`) VALUES
(1, '3213', '2e0aca891f2a8aedf265edf533a6d9a8', '312', '3123', '321', '3123', '312', 3123, '321'),
(2, '312', 'caf1a3dfb505ffed0d024130f58c5cfa', '312', '312', '312', '312', '312', 312, '312'),
(3, '312', '950a4152c2b4aa3ad78bdd6b366cc179', '321', '3123', '3213', '312', '312', 312, '312'),
(4, 'juan123', '52aecb5f8ffcab7c8e9f51773ff8992b', 'juan', 'colombia', 'bogota', 'calle 43 a h sur 72 j -10', '321412', 99999999, 'juan@gmail.com'),
(5, '312321', '2e0aca891f2a8aedf265edf533a6d9a8', '12312', '3321321', '3123', '13123', '321312', 312312, '312'),
(6, 'juan123', '52aecb5f8ffcab7c8e9f51773ff8992b', '3123', '312', '312', '312', '321', 312, '5345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `res_id` int(11) NOT NULL,
  `res_codigoReserva` varchar(50) NOT NULL,
  `tar_id` int(11) DEFAULT NULL,
  `vue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`res_id`, `res_codigoReserva`, `tar_id`, `vue_id`) VALUES
(1, 'ASD131', 1, 1),
(2, 'FASD654', 2, 2),
(3, 'TRETE21', 3, 3),
(4, 'FGFDG564', 4, 4),
(5, 'BCCVBX34', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `tarj_id` int(11) NOT NULL,
  `tarj_precio` varchar(50) NOT NULL,
  `tarj_claseAsiento` int(11) DEFAULT NULL,
  `vue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `tar_id` int(11) NOT NULL,
  `tar_nombre` varchar(50) NOT NULL,
  `tar_empresaTarjeta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`tar_id`, `tar_nombre`, `tar_empresaTarjeta`) VALUES
(1, 'visa', 'visa'),
(2, 'mastercard', 'mastercard'),
(3, 'visa', 'visa'),
(4, 'visa platinum', 'visa platinum'),
(5, 'Tarjeta Aqua', 'BBVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `vue_id` int(11) NOT NULL,
  `vue_nombre` varchar(50) NOT NULL,
  `hor_id` int(11) DEFAULT NULL,
  `vue_fechaLlegada` varchar(50) NOT NULL,
  `vue_fechaSalida` varchar(50) NOT NULL,
  `aer_id` int(11) DEFAULT NULL,
  `vue_aeropuertoOrigen` varchar(50) NOT NULL,
  `vue_aeropuertoDestino` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`vue_id`, `vue_nombre`, `hor_id`, `vue_fechaLlegada`, `vue_fechaSalida`, `aer_id`, `vue_aeropuertoOrigen`, `vue_aeropuertoDestino`) VALUES
(1, 'VUELO1', 1, '2023-02-16', '2023-02-23', 1, 'Aeropuerto Internacional Bonilla Aragón', 'Aeropuerto Clorinda'),
(2, 'VUELO2', 2, '2023-04-26', '0000-00-00', 5, 'Aeropuerto Internacional El Edén', 'Aeropuerto de París-Charles de Gaulle'),
(3, 'VUELO3', 3, '2023-04-26', '2023-02-16', 3, 'Aeropuerto Clorinda', 'Aeropuerto Internacional El Edén'),
(4, 'VUELO4', 4, '2023-03-03', '2023-02-23', 4, 'Aeropuerto Internacional El Edén', 'Aeropuerto Internacional Bonilla Aragón'),
(5, 'VUELO5', 5, '2023-04-26', '2023-03-03', 5, 'Aeropuerto Internacional Ernesto CortissoZ', 'Aeropuerto de París-Charles de Gaulle');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aerloniea`
--
ALTER TABLE `aerloniea`
  ADD PRIMARY KEY (`alin_id`);

--
-- Indices de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD PRIMARY KEY (`aer_id`);

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`asi_id`),
  ADD KEY `vue_id` (`vue_id`);

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`avi_id`);

--
-- Indices de la tabla `detallevuelo`
--
ALTER TABLE `detallevuelo`
  ADD KEY `avi_id` (`avi_id`),
  ADD KEY `vue_id` (`vue_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`hor_id`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`pas_id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `tar_id` (`tar_id`),
  ADD KEY `vue_id` (`vue_id`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`tarj_id`),
  ADD KEY `tarj_claseAsiento` (`tarj_claseAsiento`),
  ADD KEY `vue_id` (`vue_id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`tar_id`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`vue_id`),
  ADD KEY `hor_id` (`hor_id`),
  ADD KEY `aer_id` (`aer_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aerloniea`
--
ALTER TABLE `aerloniea`
  MODIFY `alin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asiento`
--
ALTER TABLE `asiento`
  MODIFY `asi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `pas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `tarj_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD CONSTRAINT `asiento_ibfk_1` FOREIGN KEY (`vue_id`) REFERENCES `vuelo` (`vue_id`);

--
-- Filtros para la tabla `detallevuelo`
--
ALTER TABLE `detallevuelo`
  ADD CONSTRAINT `detallevuelo_ibfk_1` FOREIGN KEY (`avi_id`) REFERENCES `avion` (`avi_id`),
  ADD CONSTRAINT `detallevuelo_ibfk_2` FOREIGN KEY (`vue_id`) REFERENCES `vuelo` (`vue_id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`tar_id`) REFERENCES `tarjeta` (`tar_id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`vue_id`) REFERENCES `vuelo` (`vue_id`);

--
-- Filtros para la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD CONSTRAINT `tarifa_ibfk_1` FOREIGN KEY (`tarj_claseAsiento`) REFERENCES `tarjeta` (`tar_id`),
  ADD CONSTRAINT `tarifa_ibfk_2` FOREIGN KEY (`vue_id`) REFERENCES `vuelo` (`vue_id`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`hor_id`) REFERENCES `horario` (`hor_id`),
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`aer_id`) REFERENCES `aeropuerto` (`aer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
