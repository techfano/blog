-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-03-2015 a las 23:49:45
-- Versión del servidor: 5.5.42-cll
-- Versión de PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `prodesig_ng_components`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `trabajadores` int(11) NOT NULL,
  `locales` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `nombre`, `direccion`, `fecha_ingreso`, `trabajadores`, `locales`) VALUES
(1, 'BANCO BCP', '0', '2014-02-07 00:00:00', 50000, 522),
(2, 'BANCO CONTINENTAL', '0', '2014-02-07 00:00:00', 25000, 445),
(3, 'BANCO FALABELLA', '0', '2014-02-07 00:00:00', 56322, 555),
(4, 'BANCO RIPLEY', '0', '2014-02-07 00:00:00', 54656, 444),
(5, 'BANCO AZTECA', '0', '2014-02-07 00:00:00', 89798, 0),
(6, 'BANCO SCOTIA', '0', '2014-02-07 00:00:00', 89798, 0),
(7, 'BANCO WIESSE', '0', '2014-02-07 00:00:00', 56666, 0),
(8, 'BANCO HSBC', '0', '2014-02-07 00:00:00', 11125, 0),
(9, 'INTERBANK', '0', '2014-02-07 00:00:00', 55999, 0),
(10, 'CITYBANK', '0', '2014-02-07 00:00:00', 54444, 0),
(12, 'BANCO ARABE', '0', '2014-02-07 00:00:00', 789998, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demo`
--

CREATE TABLE IF NOT EXISTS `demo` (
  `Columna 1` int(11) DEFAULT NULL,
  `Columna 2` int(11) DEFAULT NULL,
  `Columna 3` int(11) DEFAULT NULL,
  `Columna 4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `demo`
--

INSERT INTO `demo` (`Columna 1`, `Columna 2`, `Columna 3`, `Columna 4`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_bancos` int(11) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__sucursales` (`id_sucursal`),
  KEY `FK_personal_bancos` (`id_bancos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_anotaciones`
--

CREATE TABLE IF NOT EXISTS `pr_anotaciones` (
  `tipo` varchar(50) DEFAULT NULL,
  `fecha_aplicacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_anotaciones`
--

INSERT INTO `pr_anotaciones` (`tipo`, `fecha_aplicacion`, `estado`) VALUES
('Anotacion1', '2014-03-19', 'proceso'),
('Anotacion2', '2014-03-19', 'proceso'),
('Anotacion3', '2014-03-19', 'proceso'),
('Anotacion1', '2014-03-19', 'proceso'),
('Anotacion2', '2014-03-19', 'proceso'),
('Anotacion3', '2014-03-19', 'proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_defuncion`
--

CREATE TABLE IF NOT EXISTS `pr_defuncion` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `tipo_cita` varchar(50) DEFAULT NULL,
  `nombre_fallecido` varchar(50) DEFAULT NULL,
  `nombre_padre` varchar(50) DEFAULT NULL,
  `nombre_madre` varchar(50) DEFAULT NULL,
  `fecha_defuncion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_defuncion`
--

INSERT INTO `pr_defuncion` (`id`, `tipo_cita`, `nombre_fallecido`, `nombre_padre`, `nombre_madre`, `fecha_defuncion`) VALUES
(00000000001, 'Defuncion', 'Juan Peres Solano', 'Diego Perez Diaz', 'Maria Solano Solano', '2014-03-19'),
(00000000002, 'Defuncion Fetal', 'Juan Peres Solano', 'Diego Perez Diaz', 'Maria Solano Solano', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_defuncion_temporal`
--

CREATE TABLE IF NOT EXISTS `pr_defuncion_temporal` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  `tipo_tramite` varchar(50) DEFAULT NULL,
  `nombre_fallecido` varchar(50) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_defuncion_temporal`
--

INSERT INTO `pr_defuncion_temporal` (`id`, `estado`, `seccion`, `tipo_tramite`, `nombre_fallecido`, `fecha_solicitud`) VALUES
(00000000001, 'Recibido', 'Digitacion', 'Defuncion', 'Diego Perez Diaz', '2014-03-18'),
(00000000002, 'En Proceso', 'Inscripcion', 'Defuncion Fetal', 'Diego Perez Diaz', '2014-03-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_matrimonio`
--

CREATE TABLE IF NOT EXISTS `pr_matrimonio` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `tipo_cita` varchar(50) DEFAULT NULL,
  `nombre_titular` varchar(50) DEFAULT NULL,
  `nombre_conyugue` varchar(50) DEFAULT NULL,
  `fecha_matrimonio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_matrimonio`
--

INSERT INTO `pr_matrimonio` (`id`, `tipo_cita`, `nombre_titular`, `nombre_conyugue`, `fecha_matrimonio`) VALUES
(00000000001, 'Matrimonio Civil', 'Juan Perez Solano', 'Maria Solano Solano', '2014-03-19'),
(00000000002, 'Matrimonio Catolico', 'Juan Perez Solano', 'Maria Solano Solano', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_matrimonio_temporal`
--

CREATE TABLE IF NOT EXISTS `pr_matrimonio_temporal` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  `tipo_tramite` varchar(50) DEFAULT NULL,
  `nombre_titular` varchar(50) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_matrimonio_temporal`
--

INSERT INTO `pr_matrimonio_temporal` (`id`, `estado`, `seccion`, `tipo_tramite`, `nombre_titular`, `fecha_solicitud`) VALUES
(00000000001, 'Recibido', 'Digitacion', 'Matrimonio', 'Diego Perez Diaz', '2014-03-19'),
(00000000002, 'Recibido', 'Digitacion', 'Matrimonio', 'Diego Perez Diaz', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_nacimiento`
--

CREATE TABLE IF NOT EXISTS `pr_nacimiento` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nombre titular` varchar(50) DEFAULT NULL,
  `nombre_padre` varchar(50) DEFAULT NULL,
  `nombre_madre` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_nacimiento`
--

INSERT INTO `pr_nacimiento` (`id`, `tipo`, `nombre titular`, `nombre_padre`, `nombre_madre`, `fecha_nacimiento`) VALUES
(00000000001, 'Nacimiento', 'Juan Perez Solano', 'Diego Perez Diaz', 'Maria Solano Solano', '2014-03-19'),
(00000000002, 'Naturalizacion', 'Juan Perez Solano', 'Diego Perez Diaz', 'Maria Solano Solano', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_nacimiento_temporal`
--

CREATE TABLE IF NOT EXISTS `pr_nacimiento_temporal` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  `tipo_tramita` varchar(50) DEFAULT NULL,
  `nombre_titular` varchar(50) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_nacimiento_temporal`
--

INSERT INTO `pr_nacimiento_temporal` (`id`, `estado`, `seccion`, `tipo_tramita`, `nombre_titular`, `fecha_solicitud`) VALUES
(00000000001, 'Recibido', 'Digitacion', 'Nacimiento', 'Diego Perez Perez', '2014-03-19'),
(00000000002, 'En Proceso', 'Digitacion', 'Naturalizacion', 'Diego Perez Perez', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pr_tramites_proceso`
--

CREATE TABLE IF NOT EXISTS `pr_tramites_proceso` (
  `id` int(11) unsigned zerofill DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Seccion` varchar(50) DEFAULT NULL,
  `tipo_tramite` varchar(50) DEFAULT NULL,
  `nombre_titular` varchar(50) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pr_tramites_proceso`
--

INSERT INTO `pr_tramites_proceso` (`id`, `Estado`, `Seccion`, `tipo_tramite`, `nombre_titular`, `fecha_solicitud`) VALUES
(00000000001, 'Recibido', 'Digitacion', 'Nacimiento', 'Diego Perez Perez ', '2014-03-19'),
(00000000002, 'Recibido', 'Digitacion', 'Nacimiento', 'Diego Perez Perez ', '2014-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secure`
--

CREATE TABLE IF NOT EXISTS `secure` (
  `appId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `secure`
--

INSERT INTO `secure` (`appId`, `name`) VALUES
('12345', 'app1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_banco` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__bancos` (`id_banco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `id_banco`, `nombre`, `direccion`, `id_provincia`, `provincia`) VALUES
(1, 1, 'Sucursal 1', 'dasd', 1, 'LIMA'),
(2, 1, 'Sucursal 2', 'sdfsf', 2, 'TACNA'),
(3, 1, 'Sucursal 3', '.tertr', 3, 'CHICLAYO'),
(4, 2, 'Sucursal 1A', 'erterter', 1, 'LIMA'),
(5, 2, 'Sucursal 2A', 'trete', 2, 'TACNA'),
(6, 2, 'Sucursal 3A', 'erter', 3, 'CHICLAYO'),
(7, 3, 'Sucursal 1D', 'erte', 1, 'LIMA'),
(8, 3, 'Sucursal 2D', 'erter', 2, 'TACNA'),
(9, 3, 'Sucursal 3D', 'rtere', 3, 'CHICLAYO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `telefono` char(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellidos`, `telefono`, `correo`, `direccion`) VALUES
(1, 'Pepe', 'Pepe', '45225635', 'pepe@scytl.com', 'Direccion1'),
(2, 'Perro', 'Perro', '95465645', 'perro@scytl.com', 'Direccion2'),
(3, 'Robot', 'Robot', '95465645', 'robotin@scytl.com', 'Direccion3'),
(4, 'Kiko', 'Kiko', '95465645', 'cachete@scytl.com', 'Direccion4'),
(5, 'Pollo', 'Pollo', '95465645', 'gavilan@scytl.com', 'Direccion5'),
(6, 'asdasd', NULL, NULL, NULL, NULL),
(7, 'x', NULL, NULL, NULL, NULL),
(8, 'f', NULL, NULL, NULL, NULL),
(9, 'f.', NULL, NULL, NULL, NULL),
(10, 'sdfsf', NULL, NULL, NULL, NULL),
(11, 'sfsd', NULL, NULL, NULL, NULL),
(12, 'dfsd', NULL, NULL, NULL, NULL),
(13, 'sdfsdwqe', NULL, NULL, NULL, NULL),
(14, 'erwerwe', NULL, NULL, NULL, NULL),
(15, 'ewrwe', NULL, NULL, NULL, NULL),
(16, 'werwe', NULL, NULL, NULL, NULL),
(17, 'erwe', NULL, NULL, NULL, NULL),
(18, 'tyuyt', NULL, NULL, NULL, NULL),
(19, 'tiuyu', NULL, NULL, NULL, NULL),
(20, 'yuiyui', NULL, NULL, NULL, NULL),
(21, 'yuiyu', NULL, NULL, NULL, NULL),
(22, 'yuiy', NULL, NULL, NULL, NULL),
(23, '3243', NULL, NULL, NULL, NULL),
(24, 'erwewer', NULL, NULL, NULL, NULL),
(25, 'ewrwer', NULL, NULL, NULL, NULL),
(26, 'werwer', NULL, NULL, NULL, NULL),
(27, 'werrer', NULL, NULL, NULL, NULL),
(28, 'yutyuty', NULL, NULL, NULL, NULL),
(29, 'tyuty', NULL, NULL, NULL, NULL),
(30, 'tyuty', NULL, NULL, NULL, NULL),
(31, 'yjtyj', NULL, NULL, NULL, NULL),
(32, 'ytjty', NULL, NULL, NULL, NULL),
(33, 'khjk', NULL, NULL, NULL, NULL),
(34, 'gjffgjfg.', NULL, NULL, NULL, NULL),
(35, 'fgjfyu', NULL, NULL, NULL, NULL),
(36, 'ytutyut', NULL, NULL, NULL, NULL),
(37, 'tyutyure', NULL, NULL, NULL, NULL),
(38, 'ertere', NULL, NULL, NULL, NULL),
(39, 'uyytyu', NULL, NULL, NULL, NULL),
(40, 'tyrtyrt', NULL, NULL, NULL, NULL),
(41, 'retert', NULL, NULL, NULL, NULL),
(42, 'tret', NULL, NULL, NULL, NULL),
(43, 'erter', NULL, NULL, NULL, NULL),
(44, 'erter', NULL, NULL, NULL, NULL),
(45, 'werwer', NULL, NULL, NULL, NULL),
(46, 'yujuyj', NULL, NULL, NULL, NULL),
(47, 'yujy', NULL, NULL, NULL, NULL),
(48, 'ujyuuy', NULL, NULL, NULL, NULL),
(49, 'yujuyj', NULL, NULL, NULL, NULL),
(50, 'yujuy', NULL, NULL, NULL, NULL),
(51, 'rtgtrg', NULL, NULL, NULL, NULL),
(52, 'tyutu', NULL, NULL, NULL, NULL),
(53, 'iuyyj', NULL, NULL, NULL, NULL),
(54, 'yujyuuyj', NULL, NULL, NULL, NULL),
(55, 'rgere', NULL, NULL, NULL, NULL),
(56, 'rger', NULL, NULL, NULL, NULL),
(57, 'rgerg', NULL, NULL, NULL, NULL),
(58, 'rgerg', NULL, NULL, NULL, NULL),
(59, 'yuuiiui', NULL, NULL, NULL, NULL),
(60, 'wwwdd.', NULL, NULL, NULL, NULL),
(61, 'ewffer', NULL, NULL, NULL, NULL),
(62, 'trtr', NULL, NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `FK_personal_bancos` FOREIGN KEY (`id_bancos`) REFERENCES `bancos` (`id`),
  ADD CONSTRAINT `FK__sucursales` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `FK__bancos` FOREIGN KEY (`id_banco`) REFERENCES `bancos` (`id`);
--
-- Base de datos: `prodesig_pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `name`, `last_name`, `alias`) VALUES
(1, 'Alexandro Estefano', 'Castañeda Bello', 'Techfano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label_post`
--

CREATE TABLE IF NOT EXISTS `label_post` (
  `label_id` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  KEY `FK_label_post_label` (`label_id`),
  KEY `FK_label_post_post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paragraph`
--

CREATE TABLE IF NOT EXISTS `paragraph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `post_number_order` int(11) DEFAULT NULL,
  `subtitle` text,
  `paragraph` text,
  `image_url` text,
  PRIMARY KEY (`id`),
  KEY `FK_paragraph_post` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `paragraph`
--

INSERT INTO `paragraph` (`id`, `post_id`, `post_number_order`, `subtitle`, `paragraph`, `image_url`) VALUES
(1, 0, 1, 'Altruismo', 'Uno de los principios mas importantes y que se debe tomar en cuenta siempre cuando diseñamos un producto o servicio es <strong>el Altruismo,</strong> la mayoría de personas dedican mucho tiempo al desarrollo pensando en lo que creen o en lo que consideran mejor para una solución y esto siempre sera algo completamente equivocado, si tan solo ves todo desde tu propio punto de vista, en realidad no importa lo que tu creas, pienses, sientas o intuyas por que si desarrollas algo solo debes concentrarte en lo que tu cliente siempre quiere, de eso se trata el Altruismo de <strong>pensar 100% en crear satisfacción, felicidad y emociones para los demás,</strong> como es logico solo pensar en este caso para tus clientes o usuarios.<br /><br /><strong>El Altruismo</strong> definiendo lo de una forma mas concisa: “es la preocupación máxima y desinteresada por el bienestar hacia los demás, dejando de lado todo prejuicio unilateral e individualista.”<br /><br />Sintetizar una necesidad seria un modo practico de definir como crear una solución, quizás tengas el producto o la idea en mente y esta en si parezca genial y única, tal ves en su genero, pero no solo se trata de eso de tener esa idea o producto , si no de muchas cosas mas, las cuales entran a tallar paso a paso en como esta idea va ir tomando forma en un único camino, el de su uso en la practica y de que reacciones genera en tu publico aclamado. <strong>Es por eso que en la base de tu pirámide conceptual de desarrollo y creación debes de se altruista siempre como base para todo lo demás que sigue,</strong> que viene a encajar después y lo cual extenderé en los siguientes 6 principios a tomar en cuenta.', 'http://alistapart.com/d/_made/d/ALA_405_Training-the-CMS_960_450_61.jpg'),
(2, 0, 2, 'Minimalismo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 'http://3.bp.blogspot.com/-k9B6kIBFfis/TiSstX4j7hI/AAAAAAAADl4/4teOnX1eyw8/s1600/fondos%2Bde%2Bpantalla%252Bminimalista.jpg'),
(3, 0, 3, 'Usabilidad', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 'http://www.guiadigital.gob.cl/guiaweb_old/guia-v2/capitulos/05/images/fig.001.jpg'),
(4, 0, 4, 'Funcionalidad', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 'http://alfonsogu.files.wordpress.com/2013/03/funcionalidad-y-software.png'),
(5, 0, 5, 'Intuitividad', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 'http://www.monografias.com/trabajos-pdf5/franja-prebabeliana/image013.jpg'),
(6, 0, 6, 'Empatia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 'https://help.gnome.org/misc/release-notes/2.26/figures/rnusers.empathy.png.en_GB'),
(7, 0, 7, 'Social Media', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL DEFAULT '0',
  `url` text,
  `title` text,
  `title_sub_head` text,
  `image_url` text,
  `resume` text,
  `mainparagraph` text,
  `autor_id` int(11) DEFAULT NULL,
  `post_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_autor` (`autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`id`, `url`, `title`, `title_sub_head`, `image_url`, `resume`, `mainparagraph`, `autor_id`, `post_time`) VALUES
(0, 'principios_basicos_para_una_buena_experiencia_de_usuario', 'Principios básicos para una buena experiencia de usuario', '7 Principios para desarrollar una buena experiencia de usuario', 'http://blog.outsourcemanagement.com/Portals/54437/images/OMI%20Customer%20Experience%20Powered%20by%20366%20Degrees.jpg', 'En este articulo veremos un análisis de los principales principios que debemos de tomar en cuenta al momento de diseñar, crear, desarrollar un producto o servicio.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed mi id dui euismod dictum sit amet eu orci. Praesent eu faucibus justo. Nunc sollicitudin cursus dui, eget consectetur nibh feugiat eget. Nulla cursus mi eu rhoncus facilisis. Suspendisse interdum dolor risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id facilisis elit. Fusce blandit sodales urna quis aliquet. Donec felis diam, blandit at sapien mattis, scelerisque tristique mi. Cras nulla velit, condimentum vel tempus sit amet, congue sit amet nibh. Fusce quis magna facilisis, laoreet felis vel, vestibulum tortor. Aliquam quis elit erat. Etiam a tristique elit. Quisque dolor arcu, pharetra vitae enim eget, pulvinar tristique ipsum.', 1, '2014-05-25 22:30:55'),
(1, 'fudamentos_de_una_buena_experiencia_de_usuario', 'Fundamentos de una buena experiencia de usuario', 'Principales fundamentos para crear buenas experiencias', 'http://media.peugeot.com/images/backgrounds/design/concept-peugeot-design-lab.jpg', 'Conoce los fundamentos necesarios y crea la mejor experiencia posible tomándolos como principio fundamental en todo el proceso de creación de tu producto o servicio, logrando publicar o vender algo que nunca habías pensado', 'Man paragrpah kljljlkjlk', 1, '2014-08-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secure`
--

CREATE TABLE IF NOT EXISTS `secure` (
  `appId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `secure`
--

INSERT INTO `secure` (`appId`) VALUES
('12345');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `label_post`
--
ALTER TABLE `label_post`
  ADD CONSTRAINT `FK_label_post_label` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  ADD CONSTRAINT `FK_label_post_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Filtros para la tabla `paragraph`
--
ALTER TABLE `paragraph`
  ADD CONSTRAINT `FK_paragraph_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Filtros para la tabla `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
