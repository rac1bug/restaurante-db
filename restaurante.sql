-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2025 a las 21:23:19
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
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anulaciones`
--

CREATE TABLE `anulaciones` (
  `id` char(36) NOT NULL,
  `tipo` enum('VENTA','PEDIDO') NOT NULL,
  `referencia_id` char(36) DEFAULT NULL,
  `motivo` text NOT NULL,
  `usuario_id` char(36) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` char(36) NOT NULL,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `usuario_id` char(36) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `fecha` date NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `dia_semana` varchar(10) DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_usuarios`
--

CREATE TABLE `login_usuarios` (
  `id` char(36) NOT NULL,
  `usuario_id` char(36) NOT NULL,
  `fecha_login` datetime NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `navegador` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` char(36) NOT NULL,
  `numero` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` enum('LIBRE','OCUPADA','RESERVADA') DEFAULT 'LIBRE',
  `sucursal_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` char(36) NOT NULL,
  `usuario_id` char(36) DEFAULT NULL,
  `mesa_id` char(36) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('EN PREPARACION','ENTREGADO','CANCELADO') DEFAULT 'EN PREPARACION'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` char(36) NOT NULL,
  `pedido_id` char(36) DEFAULT NULL,
  `platillo_id` char(36) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillos`
--

CREATE TABLE `platillos` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `categoria_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo_impuesto`
--

CREATE TABLE `platillo_impuesto` (
  `id` char(36) NOT NULL,
  `platillo_id` char(36) DEFAULT NULL,
  `impuesto_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo_version`
--

CREATE TABLE `platillo_version` (
  `id` char(36) NOT NULL,
  `platillo_id` char(36) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_platillo`
--

CREATE TABLE `receta_platillo` (
  `id` char(36) NOT NULL,
  `platillo_id` char(36) DEFAULT NULL,
  `ingrediente_id` char(36) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` char(36) NOT NULL,
  `ingrediente_id` char(36) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `sucursal_id` char(36) DEFAULT NULL,
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('ADMIN','MESERO','COCINA','CAJA') NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `sucursal_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` char(36) NOT NULL,
  `pedido_id` char(36) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `metodo_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','OTRO') NOT NULL,
  `referencia_pago` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `sucursal_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anulaciones`
--
ALTER TABLE `anulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`fecha`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_usuarios`
--
ALTER TABLE `login_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `mesa_id` (`mesa_id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `platillo_id` (`platillo_id`);

--
-- Indices de la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `platillo_impuesto`
--
ALTER TABLE `platillo_impuesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `platillo_id` (`platillo_id`),
  ADD KEY `impuesto_id` (`impuesto_id`);

--
-- Indices de la tabla `platillo_version`
--
ALTER TABLE `platillo_version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `platillo_id` (`platillo_id`);

--
-- Indices de la tabla `receta_platillo`
--
ALTER TABLE `receta_platillo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `platillo_id` (`platillo_id`),
  ADD KEY `ingrediente_id` (`ingrediente_id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingrediente_id` (`ingrediente_id`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anulaciones`
--
ALTER TABLE `anulaciones`
  ADD CONSTRAINT `anulaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `login_usuarios`
--
ALTER TABLE `login_usuarios`
  ADD CONSTRAINT `login_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`);

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`);

--
-- Filtros para la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD CONSTRAINT `platillos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `platillo_impuesto`
--
ALTER TABLE `platillo_impuesto`
  ADD CONSTRAINT `platillo_impuesto_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`),
  ADD CONSTRAINT `platillo_impuesto_ibfk_2` FOREIGN KEY (`impuesto_id`) REFERENCES `impuestos` (`id`);

--
-- Filtros para la tabla `platillo_version`
--
ALTER TABLE `platillo_version`
  ADD CONSTRAINT `platillo_version_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`);

--
-- Filtros para la tabla `receta_platillo`
--
ALTER TABLE `receta_platillo`
  ADD CONSTRAINT `receta_platillo_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `platillos` (`id`),
  ADD CONSTRAINT `receta_platillo_ibfk_2` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredientes` (`id`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredientes` (`id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
