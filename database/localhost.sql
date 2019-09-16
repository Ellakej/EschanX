-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-09-2019 a las 15:21:41
-- Versión del servidor: 10.0.38-MariaDB-cll-lve
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eschanx1_db`
--
CREATE DATABASE IF NOT EXISTS `eschanx1_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `eschanx1_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ads`
--

CREATE TABLE `ads` (
  `id` smallint(1) UNSIGNED NOT NULL,
  `position` varchar(3) NOT NULL,
  `disp` tinyint(1) NOT NULL,
  `boards` varchar(255) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ads`
--

INSERT INTO `ads` (`id`, `position`, `disp`, `boards`, `code`) VALUES
(1, 'top', 0, '', 'Right Frame Top'),
(2, 'bot', 0, '', 'Right Frame Bottom');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `postedat` int(20) NOT NULL,
  `postedby` varchar(75) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `announcements`
--

INSERT INTO `announcements` (`id`, `parentid`, `subject`, `postedat`, `postedby`, `message`) VALUES
(2, 0, 'Visualizacion de Boards', 1568517469, 'kng0x', 'Reparar la visualizacion de Boards en el menu principal, el archivo es menu.php, mas sin embargo es posible que exista una reparacion superficial desde aqui en vez de editar el codigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banlist`
--

CREATE TABLE `banlist` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `allowread` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(50) NOT NULL,
  `ipmd5` char(32) NOT NULL,
  `globalban` tinyint(1) NOT NULL DEFAULT '0',
  `boards` varchar(255) NOT NULL,
  `by` varchar(75) NOT NULL,
  `at` int(20) NOT NULL,
  `until` int(20) NOT NULL,
  `reason` text NOT NULL,
  `staffnote` text NOT NULL,
  `appeal` text,
  `appealat` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bannedhashes`
--

CREATE TABLE `bannedhashes` (
  `id` int(10) NOT NULL,
  `md5` varchar(255) NOT NULL,
  `bantime` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blotter`
--

CREATE TABLE `blotter` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `important` tinyint(1) NOT NULL,
  `at` int(20) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boards`
--

CREATE TABLE `boards` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `order` tinyint(5) NOT NULL DEFAULT '0',
  `name` varchar(75) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `start` int(10) UNSIGNED NOT NULL,
  `uploadtype` tinyint(1) NOT NULL DEFAULT '0',
  `desc` varchar(75) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` tinyint(2) NOT NULL DEFAULT '0',
  `maximagesize` int(20) NOT NULL DEFAULT '1024000',
  `maxpages` int(20) NOT NULL DEFAULT '11',
  `maxage` int(20) NOT NULL DEFAULT '0',
  `markpage` tinyint(4) NOT NULL DEFAULT '9',
  `maxreplies` int(5) NOT NULL DEFAULT '200',
  `messagelength` int(10) NOT NULL DEFAULT '8192',
  `createdon` int(20) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `includeheader` text COLLATE utf8_unicode_ci NOT NULL,
  `redirecttothread` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Anonymous',
  `forcedanon` tinyint(1) NOT NULL DEFAULT '0',
  `embeds_allowed` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `trial` tinyint(1) NOT NULL DEFAULT '0',
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `defaultstyle` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `locale` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `showid` tinyint(1) NOT NULL DEFAULT '0',
  `compactlist` tinyint(1) NOT NULL DEFAULT '0',
  `enablereporting` tinyint(1) NOT NULL DEFAULT '1',
  `enablecaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `enablenofile` tinyint(1) NOT NULL DEFAULT '0',
  `enablearchiving` tinyint(1) NOT NULL DEFAULT '0',
  `enablecatalog` tinyint(1) NOT NULL DEFAULT '1',
  `loadbalanceurl` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `loadbalancepassword` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `boards`
--

INSERT INTO `boards` (`id`, `order`, `name`, `type`, `start`, `uploadtype`, `desc`, `image`, `section`, `maximagesize`, `maxpages`, `maxage`, `markpage`, `maxreplies`, `messagelength`, `createdon`, `locked`, `includeheader`, `redirecttothread`, `anonymous`, `forcedanon`, `embeds_allowed`, `trial`, `popular`, `defaultstyle`, `locale`, `showid`, `compactlist`, `enablereporting`, `enablecaptcha`, `enablenofile`, `enablearchiving`, `enablecatalog`, `loadbalanceurl`, `loadbalancepassword`) VALUES
(1, 0, 'ecm', 0, 1, 0, '', 'http://www.escom.ipn.mx/images/logoESCOM2x.png', 0, 1024000, 11, 0, 9, 200, 8192, 1568514599, 0, '', 1, 'Anonymous', 0, '', 1, 1, 'burichan', '', 1, 0, 1, 0, 0, 0, 1, '', ''),
(2, 0, 'tcm', 0, 1, 0, '', 'http://www.talleresbyde.com/assets/tecmi_logo-f9034af6835e0363ec6ff8ca8857ebf93f41dabb0a052f6bb6eebcb9380dec2d.PNG', 0, 1024000, 11, 0, 9, 200, 8192, 1568515046, 0, '', 0, 'Anonymous', 0, '', 1, 1, 'burichan', '', 0, 0, 1, 0, 0, 1, 1, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `board_filetypes`
--

CREATE TABLE `board_filetypes` (
  `boardid` tinyint(5) NOT NULL DEFAULT '0',
  `typeid` mediumint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `board_filetypes`
--

INSERT INTO `board_filetypes` (`boardid`, `typeid`) VALUES
(1, 3),
(1, 1),
(1, 2),
(2, 3),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embeds`
--

CREATE TABLE `embeds` (
  `id` tinyint(5) UNSIGNED NOT NULL,
  `filetype` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `videourl` varchar(510) NOT NULL,
  `width` tinyint(3) UNSIGNED NOT NULL,
  `height` tinyint(3) UNSIGNED NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `embeds`
--

INSERT INTO `embeds` (`id`, `filetype`, `name`, `videourl`, `width`, `height`, `code`) VALUES
(1, 'you', 'Youtube', 'http://www.youtube.com/watch?v=', 200, 164, '<object type=\"application/x-shockwave-flash\" width=\"SET_WIDTH\" height=\"SET_HEIGHT\" data=\"http://www.youtube.com/v/EMBED_ID\"> <param name=\"movie\" value=\"http://www.youtube.com/v/EMBED_ID\" /> </object>'),
(2, 'goo', 'Google', 'http://video.google.com/videoplay?docid=', 200, 164, '<embed width=\"SET_WIDTH\" height=\"SET_HEIGHT\" id=\"VideoPlayback\" type=\"application/x-shockwave-flash\" src=\"http://video.google.com/googleplayer.swf?docId=EMBED_ID\"></embed>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `name` varchar(255) NOT NULL,
  `at` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`name`, `at`) VALUES
('pingback', 0),
('sitemap', 1568588888);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filetypes`
--

CREATE TABLE `filetypes` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `filetype` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_w` int(7) NOT NULL DEFAULT '0',
  `image_h` int(7) NOT NULL DEFAULT '0',
  `force_thumb` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `filetypes`
--

INSERT INTO `filetypes` (`id`, `filetype`, `mime`, `image`, `image_w`, `image_h`, `force_thumb`) VALUES
(1, 'jpg', '', '', 0, 0, 0),
(2, 'gif', '', '', 0, 0, 0),
(3, 'png', '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `front`
--

CREATE TABLE `front` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `page` smallint(1) UNSIGNED NOT NULL DEFAULT '0',
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `poster` varchar(75) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `front`
--

INSERT INTO `front` (`id`, `page`, `order`, `subject`, `message`, `timestamp`, `poster`, `email`) VALUES
(2, 2, 0, 'No Porno', '1.- No esta permitida la PORNOGRAFIA, hasta que se decida mas adelante un board para esto si se detecta que alguien sube nopor se le borrara el hilo, y si continua sera motivo de PERMABAN', 0, '', ''),
(3, 2, 0, 'NO SPAM', '2.- Nada de SPAM, si haces spam se te dara PERMABAN, sin importar el argumento que des', 0, '', ''),
(4, 2, 0, 'No Publicidad', '3.- No promociones. Esto hasta que se abra un board dedicado, por lo mientras solo se permite cualquier contenido de los boards excluyendo promociones. ', 0, '', ''),
(5, 0, 0, 'Â¡Nueva Apertura!', 'Se buscan Desarrolladores talentosos que busquen colaborar con Eschan X. No tendran paga y el trabajo era arduo, pero la recompensa sera buena una vez que se logren cumplir las metas del proyecto!\r\n\r\nContacto: alikingno@gmail.com', 1568516758, 'kng0x', 'alikingno@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loginattempts`
--

CREATE TABLE `loginattempts` (
  `username` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modlog`
--

CREATE TABLE `modlog` (
  `entry` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modlog`
--

INSERT INTO `modlog` (`entry`, `user`, `category`, `timestamp`) VALUES
('Logged in', 'admin', 1, 1568514588),
('Added board: /ecm/', 'admin', 3, 1568514600),
('Updated board configuration - /ecm/', 'admin', 4, 1568514869),
('Updated board configuration - /ecm/', 'admin', 4, 1568514946),
('Added board: /tcm/', 'admin', 3, 1568515046),
('Updated board configuration - /tcm/', 'admin', 4, 1568515113),
('Updated board configuration - /tcm/', 'admin', 4, 1568515193),
('Added an announcement', 'admin', 9, 1568515787),
('Added a Rule entry', 'admin', 9, 1568516001),
('Deleted a Rules entry', 'admin', 9, 1568516030),
('Added a Rule entry', 'admin', 9, 1568516064),
('Added a Rule entry', 'admin', 9, 1568516084),
('Edited a Rule entry', 'admin', 9, 1568516094),
('Edited a Rule entry', 'admin', 9, 1568516118),
('Edited a Rule entry', 'admin', 9, 1568516128),
('Added a Rule entry', 'admin', 9, 1568516168),
('Edited a Rule entry', 'admin', 9, 1568516241),
('Viewed disk space used', 'admin', 0, 1568516368),
('Rebuilt all boards and threads', 'admin', 2, 1568516410),
('Added Administrator kng0x', 'admin', 6, 1568516584),
('Deleted staff member: admin', 'admin', 6, 1568516595),
('Logged in', 'kng0x', 1, 1568516613),
('Added a news entry', 'kng0x', 9, 1568516758),
('Added Administrator AndresCT12', 'kng0x', 6, 1568516800),
('Deleted an announcement', 'kng0x', 9, 1568517402),
('Added an announcement', 'kng0x', 9, 1568517469),
('Logged in', 'kng0x', 1, 1568574966);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_settings`
--

CREATE TABLE `module_settings` (
  `module` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `boardid` smallint(5) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tripcode` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `file` varchar(50) NOT NULL,
  `file_md5` char(32) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_original` varchar(255) NOT NULL,
  `file_size` int(20) NOT NULL DEFAULT '0',
  `file_size_formatted` varchar(75) NOT NULL,
  `image_w` smallint(5) NOT NULL DEFAULT '0',
  `image_h` smallint(5) NOT NULL DEFAULT '0',
  `thumb_w` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `thumb_h` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(75) NOT NULL,
  `ipmd5` char(32) NOT NULL,
  `tag` varchar(5) NOT NULL,
  `timestamp` int(20) UNSIGNED NOT NULL,
  `stickied` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `posterauthority` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_timestamp` int(20) NOT NULL DEFAULT '0',
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `bumped` int(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `boardid`, `parentid`, `name`, `tripcode`, `email`, `subject`, `message`, `password`, `file`, `file_md5`, `file_type`, `file_original`, `file_size`, `file_size_formatted`, `image_w`, `image_h`, `thumb_w`, `thumb_h`, `ip`, `ipmd5`, `tag`, `timestamp`, `stickied`, `locked`, `posterauthority`, `reviewed`, `deleted_timestamp`, `IS_DELETED`, `bumped`) VALUES
(1, 2, 0, 'anon1', '', 'rompeanos@gmail.com', 'Trucazos de Maincra', 'Rolen los mejores trucazos hdlv<br />', '827ccb0eea8a706c4c34a16891f84e7b', '156851564849', 'd0895762efe5e943b9fc2c5f7c1a0f11', 'png', '71252192_732070773899017_5643593997675921408_n', 32399, '31.64KB', 789, 210, 200, 53, 'SDNPQZ6aqUA/10JiLjtuHRG0q7gp179IZBXxO/P1i3M=', 'c3a7c0752ec5c712fd3af945f78e8571', '', 1568515648, 0, 0, 0, 0, 0, 0, 1568515648);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `board` varchar(255) NOT NULL,
  `postid` int(20) NOT NULL,
  `when` int(20) NOT NULL,
  `ip` varchar(75) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

CREATE TABLE `sections` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `order` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `abbreviation` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `boards` text,
  `addedon` int(20) NOT NULL,
  `lastactive` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `salt`, `type`, `boards`, `addedon`, `lastactive`) VALUES
(3, 'AndresCT12', '3e2b623a0733352c35a7f8f7ec3766f6', 'GOR', 1, NULL, 1568516800, 0),
(2, 'kng0x', 'ee0d36615ecaeb5cf371d61d348e5f96', 'u4t', 1, NULL, 1568516584, 1568575124);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `watchedthreads`
--

CREATE TABLE `watchedthreads` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `threadid` int(20) NOT NULL,
  `board` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `lastsawreplyid` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wordfilter`
--

CREATE TABLE `wordfilter` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `word` varchar(75) NOT NULL,
  `replacedby` varchar(75) NOT NULL,
  `boards` text NOT NULL,
  `time` int(20) NOT NULL,
  `regex` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bannedhashes`
--
ALTER TABLE `bannedhashes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `blotter`
--
ALTER TABLE `blotter`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `embeds`
--
ALTER TABLE `embeds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `filetypes`
--
ALTER TABLE `filetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `front`
--
ALTER TABLE `front`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`boardid`,`id`),
  ADD KEY `parentid` (`parentid`),
  ADD KEY `bumped` (`bumped`),
  ADD KEY `file_md5` (`file_md5`),
  ADD KEY `stickied` (`stickied`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `watchedthreads`
--
ALTER TABLE `watchedthreads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wordfilter`
--
ALTER TABLE `wordfilter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `banlist`
--
ALTER TABLE `banlist`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bannedhashes`
--
ALTER TABLE `bannedhashes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blotter`
--
ALTER TABLE `blotter`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boards`
--
ALTER TABLE `boards`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `embeds`
--
ALTER TABLE `embeds`
  MODIFY `id` tinyint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `filetypes`
--
ALTER TABLE `filetypes`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `front`
--
ALTER TABLE `front`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sections`
--
ALTER TABLE `sections`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `watchedthreads`
--
ALTER TABLE `watchedthreads`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wordfilter`
--
ALTER TABLE `wordfilter`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
