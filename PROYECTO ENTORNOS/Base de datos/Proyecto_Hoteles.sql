-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-05-2023 a las 12:55:07
-- Versión del servidor: 8.0.32-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Hoteles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `Nombre` varchar(35) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Cod_Reserva` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_Cliente` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`Nombre`, `DNI`, `Telefono`, `Cod_Reserva`, `ID_Cliente`) VALUES
('Javier', '00001245P', '999888111', '55555', '03330'),
('Berta', '99998887P', '000666777', '99909', '99999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleados`
--

CREATE TABLE `Empleados` (
  `COD_HOTEL` varchar(5) NOT NULL,
  `NOMBRE` varchar(35) NOT NULL,
  `APELLIDO` varchar(35) NOT NULL,
  `COD_EMPLE` varchar(5) NOT NULL,
  `TELEFONO` varchar(9) NOT NULL,
  `SALARIO` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Empleados`
--

INSERT INTO `Empleados` (`COD_HOTEL`, `NOMBRE`, `APELLIDO`, `COD_EMPLE`, `TELEFONO`, `SALARIO`) VALUES
('00098', 'Francisco', 'Ibañez', '00101', '999000999', 1000),
('9090', 'Allan', 'Poe', '00222', '000999000', 1200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Hotel`
--

CREATE TABLE `Hotel` (
  `id_hotel` varchar(5) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `caracteristicas` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Hotel`
--

INSERT INTO `Hotel` (`id_hotel`, `nombre`, `pais`, `caracteristicas`) VALUES
('00098', 'Hotel Estrellato', 'España', 'centro de la ciudad, piscina, centro de ocio, teatro'),
('00505', 'La Pisa', 'Italia', 'teatro , centro de ocio '),
('9090', 'Le Baguette', 'Francia', 'centro de la ciudad, centro de ocio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reserva`
--

CREATE TABLE `Reserva` (
  `Nom_Cliente` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cod_Reserva` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fech_Reserva` date NOT NULL,
  `Fech_Alqui` date NOT NULL,
  `Fech_Dev` date NOT NULL,
  `Num_Habitacion` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_emple` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Reserva`
--

INSERT INTO `Reserva` (`Nom_Cliente`, `Cod_Reserva`, `Fech_Reserva`, `Fech_Alqui`, `Fech_Dev`, `Num_Habitacion`, `id_emple`) VALUES
('Javier', '55555', '2023-05-04', '2023-05-03', '2023-05-09', '33', '00101'),
('Berta', '99909', '2023-05-04', '2023-05-03', '2023-05-11', '23', '00222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Cod_Usu` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contraseña` varchar(15) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Id_hotel` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Cod_Usu`, `Contraseña`, `Correo`, `Id_hotel`) VALUES
('00101', 'Ibañez', 'iba@gmail.com', '00098'),
('00222', 'Allan', 'allan@gmail.com', '9090'),
('03330', 'javi', 'javi@gmail.com', '00098'),
('99999', 'bert', 'berta@gmail.com', '00505');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `Cod_Reserva` (`Cod_Reserva`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `Empleados`
--
ALTER TABLE `Empleados`
  ADD PRIMARY KEY (`COD_EMPLE`),
  ADD KEY `COD_HOTEL` (`COD_HOTEL`);

--
-- Indices de la tabla `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `Reserva`
--
ALTER TABLE `Reserva`
  ADD PRIMARY KEY (`Cod_Reserva`),
  ADD KEY `id_emple` (`id_emple`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Cod_Usu`),
  ADD KEY `Id_hotel` (`Id_hotel`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD CONSTRAINT `Clientes_ibfk_3` FOREIGN KEY (`ID_Cliente`) REFERENCES `Usuarios` (`Cod_Usu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Empleados`
--
ALTER TABLE `Empleados`
  ADD CONSTRAINT `Empleados_ibfk_1` FOREIGN KEY (`COD_HOTEL`) REFERENCES `Hotel` (`id_hotel`),
  ADD CONSTRAINT `Empleados_ibfk_2` FOREIGN KEY (`COD_EMPLE`) REFERENCES `Usuarios` (`Cod_Usu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Reserva`
--
ALTER TABLE `Reserva`
  ADD CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`id_emple`) REFERENCES `Empleados` (`COD_EMPLE`),
  ADD CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`id_emple`) REFERENCES `Empleados` (`COD_EMPLE`),
  ADD CONSTRAINT `Reserva_ibfk_3` FOREIGN KEY (`Cod_Reserva`) REFERENCES `Clientes` (`Cod_Reserva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_2` FOREIGN KEY (`Id_hotel`) REFERENCES `Hotel` (`id_hotel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
