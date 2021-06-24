-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 Haz 2021, 21:30:53
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `unitybackend`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` int(100) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `items`
--

INSERT INTO `items` (`ID`, `name`, `description`, `price`, `image`) VALUES
(1, 'Demir Kılıç', 'En basit kılıç.', 100, ''),
(2, 'Can İksiri', 'Canınızı ufak bir miktarda doldurur.', 20, ''),
(3, 'Bronz Kılıç', 'Yeni başlayan fakir maceracılar için ideal kılıç.', 30, '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` int(10) NOT NULL,
  `coins` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `coins`) VALUES
(1, 'testkullanici', '123456', 1, 0),
(2, 'testkullanici2', 'sifre', 1, 0),
(3, 'testkullanici3', '123456', 1, 0),
(4, 'okan', '123456', 1, 0),
(5, 'denemekullanicisi', '12345678', 1, 0),
(6, 'kullanici34', '323232', 1, 0),
(7, 'deneme456', '1234567', 1, 0),
(12, 'samet', '123456', 1, 0),
(13, 'Sansli', '123456', 1, 0),
(14, 'Deneme2467', 'deneme123', 1, 0),
(15, 'DenemeKullanici234', '123456', 1, 0),
(16, 'Deneme4325', '123456', 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `usersitems`
--

DROP TABLE IF EXISTS `usersitems`;
CREATE TABLE `usersitems` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `usersitems`
--

INSERT INTO `usersitems` (`ID`, `userID`, `itemID`) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 4, 2),
(10, 4, 1),
(11, 4, 3),
(13, 4, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `usersitems`
--
ALTER TABLE `usersitems`
  ADD PRIMARY KEY (`ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `usersitems`
--
ALTER TABLE `usersitems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
