-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 29 2022 г., 14:26
-- Версия сервера: 8.0.11
-- Версия PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kino`
--

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`ID`, `NAME`) VALUES
(7, 'Майор Пэйн'),
(8, 'Бэтмен'),
(9, 'Третий лишний'),
(10, 'Платформа'),
(11, 'Пункт назначения'),
(12, 'Джентльмены'),
(13, 'Во все тяжкое'),
(14, 'Маска'),
(15, 'Эйс Вентура'),
(16, 'Голос улиц'),
(17, 'Парфюмер'),
(24, 'Аватар'),
(28, 'Пункт'),
(29, 'Джем');

-- --------------------------------------------------------

--
-- Структура таблицы `kinoteatr`
--

CREATE TABLE `kinoteatr` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ADRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kinoteatr`
--

INSERT INTO `kinoteatr` (`ID`, `NAME`, `ADRESS`) VALUES
(6, 'Каро', 'ул. Новый Арбат, 24'),
(7, 'Синема Парк', 'пл. Киевского Вокзала'),
(8, 'Пионер', 'Кутузовский просп., 21'),
(10, 'Mori Cinema', 'ул. Ярцевская, 19'),
(17, 'Пантера', 'ул. Амурова, 3');

-- --------------------------------------------------------

--
-- Структура таблицы `relation`
--

CREATE TABLE `relation` (
  `ID` int(11) NOT NULL,
  `ID_kinoteatr` int(11) NOT NULL,
  `ID_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `relation`
--

INSERT INTO `relation` (`ID`, `ID_kinoteatr`, `ID_film`) VALUES
(1, 8, 7),
(2, 8, 14),
(3, 8, 10),
(4, 7, 11),
(5, 6, 8),
(6, 6, 13),
(7, 10, 9),
(8, 10, 7),
(9, 6, 10),
(10, 7, 15),
(12, 7, 28),
(13, 7, 29);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `kinoteatr`
--
ALTER TABLE `kinoteatr`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_kinoteatr` (`ID_kinoteatr`),
  ADD KEY `ID_film` (`ID_film`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `kinoteatr`
--
ALTER TABLE `kinoteatr`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `relation`
--
ALTER TABLE `relation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`ID_film`) REFERENCES `film` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`ID_kinoteatr`) REFERENCES `kinoteatr` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
