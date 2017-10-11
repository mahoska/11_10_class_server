-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 11 2017 г., 16:46
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands_rest`
--

CREATE TABLE `brands_rest` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `descr` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands_rest`
--

INSERT INTO `brands_rest` (`id`, `name`, `img`, `descr`) VALUES
(1, 'Audi', 'image/audi.jpg', 'Audi – немецкий бренд и одноименная автомобилестроительная компания в составе концерна Volkswagen Group. Штаб-квартира компании Audi находится в городе Ингольштадте, в Германии. '),
(2, 'BMW', 'image/bmw.jpg', ' BMW – немецкий бренд, под которым компания Bayerische Motoren Werke, аббревиатура которой и является наименованием марки, и производит автомобили, мотоциклы, двигатели, велосипеды. '),
(3, 'Honda', 'image/honda.jpg', ' Honda — японский бренд, известный, в первую очередь, как производитель высоконадежных, современных легковых автомобилей и мотоциклов. Один из лидеров машиностроительной отрасли Японии. '),
(4, 'Nissan ', 'image/nissan.jpg', ' Nissan – японский автомобильный бренд, один из крупнейших в мире. Занимает восьмое место в мировом рейтинге автопроизводителей и третье – среди японских производителей, после Toyota и Honda. Штаб-квартира находится в Иокогаме. '),
(5, 'Mercedes-Benz ', 'image/mersedes', ' Mercedes-Benz – немецкий бренд легковых автомобилей премиум-класса, грузовых автомобилей, автобусов и других транспортных средств немецкого автостроительного концерна Daimler AG. ');

-- --------------------------------------------------------

--
-- Структура таблицы `cars_rest`
--

CREATE TABLE `cars_rest` (
  `id` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `year_of_issue` int(11) NOT NULL,
  `engine_capacity` float NOT NULL,
  `max_speed` float NOT NULL,
  `price` float NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars_rest`
--

INSERT INTO `cars_rest` (`id`, `id_brand`, `id_model`, `year_of_issue`, `engine_capacity`, `max_speed`, `price`, `img`) VALUES
(1, 1, 1, 1995, 1896, 166, 3200, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/audi-80-quatteo-15.jpg?raw=true'),
(2, 1, 1, 2001, 2771, 220, 4500, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/audi-cabriolet-2.8-e-08.jpg?raw=true'),
(3, 5, 2, 1986, 1997, 168, 3600, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/mercedes-benz-c-200-mer_c_04_kb_komp_ava_1.jpg?raw=true'),
(4, 5, 3, 2001, 2299, 200, 7000, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/2001_mercedes-benz_slk-class_2_dr_slk230_supercharged_convertible-pic-59072.jpg?raw=true'),
(5, 4, 4, 1994, 1809, 215, 6500, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/nissan-200-sx-1997-9157sm.jpg?raw=true'),
(6, 4, 4, 2000, 1998, 235, 9000, 'https://github.com/mahoska/car_shop/blob/master/server/images/cars/post-26143-13151355211237222867.jpg?raw=true');

-- --------------------------------------------------------

--
-- Структура таблицы `colors_rest`
--

CREATE TABLE `colors_rest` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `colors_rest`
--

INSERT INTO `colors_rest` (`id`, `name`) VALUES
(4, 'black'),
(2, 'blue'),
(5, 'bordo'),
(1, 'red'),
(3, 'white');

-- --------------------------------------------------------

--
-- Структура таблицы `color_car_rest`
--

CREATE TABLE `color_car_rest` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color_car_rest`
--

INSERT INTO `color_car_rest` (`id`, `id_car`, `id_color`) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 6, 2),
(4, 3, 3),
(5, 3, 4),
(6, 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `models_rest`
--

CREATE TABLE `models_rest` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `models_rest`
--

INSERT INTO `models_rest` (`id`, `name`) VALUES
(1, 'Audi 80'),
(2, 'Mercedes 200t'),
(3, 'Mercedes 230 se'),
(4, 'Nissan 200 sx');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_rest`
--

CREATE TABLE `orders_rest` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `payment_method` enum('credit card','cash') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders_rest`
--

INSERT INTO `orders_rest` (`id`, `id_car`, `color`, `id_user`, `payment_method`, `status`) VALUES
(55, 2, 'bordo', 1, 'cash', 1),
(60, 3, 'white', 1, 'cash', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users_rest`
--

CREATE TABLE `users_rest` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL,
  `time_life` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_rest`
--

INSERT INTO `users_rest` (`id`, `name`, `sname`, `login`, `password`, `status`, `time_life`) VALUES
(9, 'a', 'a', 'a', 'f5b13b023f1bc64f82bfad7c78c8c9f0', '0053a02932c38942d839fedea39dccc9', 1507730103),
(10, 's', 's', 's', '810f651605cea4f0b86cd0b982c77f51', '', 1507730597),
(11, 'ss', 'ss', 'ss', 'c66de1b2cbae9b9e06ff8981447d1b0c', '1ff11403a48f52a136913b03cca5bc9c', 1507730721),
(12, 'tt', 'tt', 'tt', '2f645275dd6eab5b504f94e1ccf5153b', '7ae157e08abadc591e9c1a2810f48c0f', 1507730890),
(13, 'wer', 'we', 'we', 'bb22519b5f810076a870a89cbb42890a', '4b5501e498bfdce0f7dba17c2a8a4492', 1507732320),
(14, '123', '123', '123', '18cba96d339cf22009a76d348a7c55df', '8061061078cdccc4d5b155739ad2e118', 1507736595);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands_rest`
--
ALTER TABLE `brands_rest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `cars_rest`
--
ALTER TABLE `cars_rest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_fk0` (`id_brand`),
  ADD KEY `cars_fk1` (`id_model`);

--
-- Индексы таблицы `colors_rest`
--
ALTER TABLE `colors_rest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `color_car_rest`
--
ALTER TABLE `color_car_rest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_car_fk0` (`id_car`),
  ADD KEY `color_car_fk1` (`id_color`);

--
-- Индексы таблицы `models_rest`
--
ALTER TABLE `models_rest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders_rest`
--
ALTER TABLE `orders_rest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_fk0` (`id_car`),
  ADD KEY `FK_1` (`id_user`),
  ADD KEY `FK_2` (`color`);

--
-- Индексы таблицы `users_rest`
--
ALTER TABLE `users_rest`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands_rest`
--
ALTER TABLE `brands_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `cars_rest`
--
ALTER TABLE `cars_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `colors_rest`
--
ALTER TABLE `colors_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `color_car_rest`
--
ALTER TABLE `color_car_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `models_rest`
--
ALTER TABLE `models_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `orders_rest`
--
ALTER TABLE `orders_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT для таблицы `users_rest`
--
ALTER TABLE `users_rest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars_rest`
--
ALTER TABLE `cars_rest`
  ADD CONSTRAINT `cars_fk0` FOREIGN KEY (`id_brand`) REFERENCES `brands_rest` (`id`),
  ADD CONSTRAINT `cars_fk1` FOREIGN KEY (`id_model`) REFERENCES `models_rest` (`id`);

--
-- Ограничения внешнего ключа таблицы `color_car_rest`
--
ALTER TABLE `color_car_rest`
  ADD CONSTRAINT `color_car_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars_rest` (`id`),
  ADD CONSTRAINT `color_car_fk1` FOREIGN KEY (`id_color`) REFERENCES `colors_rest` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders_rest`
--
ALTER TABLE `orders_rest`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`id_user`) REFERENCES `users_rest` (`id`),
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars_rest` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
