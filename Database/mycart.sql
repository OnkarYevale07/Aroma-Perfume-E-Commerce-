-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 06:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mycart`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryDescription` varchar(255) DEFAULT NULL,
  `categoryTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryDescription`, `categoryTitle`) VALUES
(5, '8+ hours', ' Eau de Perfume'),
(7, '12+ Hours', 'Perfume'),
(8, '4-7+ Hours', 'Eau de Toilette'),
(9, '2-3+ Hours', 'Eau de Cologne'),
(11, '8+ Hours', 'Perfume Oil'),
(12, '1-2+ Days', 'Attar'),
(13, '8+ Hours', 'Body Spray');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pId` int(11) NOT NULL,
  `pDesc` varchar(3000) DEFAULT NULL,
  `pDiscount` int(11) NOT NULL,
  `pName` varchar(255) DEFAULT NULL,
  `pPhoto` varchar(255) DEFAULT NULL,
  `pPrice` int(11) NOT NULL,
  `pQuantity` int(11) NOT NULL,
  `category_categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pId`, `pDesc`, `pDiscount`, `pName`, `pPhoto`, `pPrice`, `pQuantity`, `category_categoryId`) VALUES
(21, 'Atarstory Kesar Chandan Attar Perfume Alcohol Free Roll On For Daily Use | Long Lasting Fragrance | Ittar For Men And Women - 12Ml', 60, 'ATARSTORY', 'https://meolaa-cdn.gumlet.io/productImages/Atarstory-Kesar-Chandan-Attar-Perfume-Alcohol-Free-Roll-On-For-Daily-Use---Long-Lasting-Fragrance---Ittar-For-Men-And-Women---12Ml-16984960728389163.jpeg?w=undefined&q=75&h=500', 1999, 150, 12),
(22, 'Atarstory Black Magic Attar Perfume Alcohol Free Roll On For Daily Use | Long Lasting Fragrance | Ittar For Men And Women - 12Ml', 60, 'ATARSTORY', 'https://meolaa-cdn.gumlet.io/productImages/Atarstory-Black-Magic-Attar-Perfume-Alcohol-Free-Roll-On-For-Daily-Use---Long-Lasting-Fragrance---Ittar-For-Men-And-Women---12Ml-16984960906951475.jpeg?w=undefined&q=75&h=500', 1999, 120, 12),
(23, 'AdilQadri Lavish Musk & Shanaya Attar Combo | Musky & Arabic French Scent | Long Lasting Non-Alcohol Roll-On Attar For Men & Women | Pack of 2-12ML Each', 52, 'AdilQadri', 'https://m.media-amazon.com/images/I/71eiuddbALL._SX522_.jpg', 2098, 250, 12),
(24, 'Axe Signature Mysterious No Gas Deodorant Bodyspray For Men 154 ml', 32, 'Axe Signature Mysterious', 'https://m.media-amazon.com/images/I/51bTrLEHgCL._SX300_SY300_QL70_FMwebp_.jpg', 265, 500, 13),
(25, 'Yardley London Morning Dew Refreshing Body Spray| Lily of Valley & Frangipani Fragrance| Deodorant Body Spray For Daily Use| Deodorant For Women| 90% Naturally Derived| 150ml', 44, 'Yardley London Morning', 'https://m.media-amazon.com/images/I/91fxiaMvqiL._SX522_.jpg', 225, 140, 13),
(26, 'FOGG Master Fragrance Body Spray, Intense for Unisex, Pack of 2 (Marco + Napoleon) 240ml', 46, 'FOGG Master', 'https://m.media-amazon.com/images/I/71mQEkY0U-L._SX522_PIbundle-2,TopRight,0,0_AA522SH20_.jpg', 550, 80, 13),
(27, 'SKINN BY TITAN Skinn Raw Fragrance For Men, 20ml', 15, 'SKINN', 'https://m.media-amazon.com/images/I/61pOAQs2AsL._SX522_.jpg', 645, 40, 11),
(28, 'Fernweh Summer Sage, Perfume Oil Infused with Botanicals - 10 ml', 50, 'Fernweh', 'https://m.media-amazon.com/images/I/71o574q4VWL._SY679_.jpg', 899, 60, 11),
(29, 'Isak Fragrances Forest Rain 3 ML Premium Attar For Men & Women, Alcohol Free 8 To 10 Hours Long Lasting Unisex Earthen Scent Of Rain, Roll On Luxurious Perfume Oil, Made In India itter.', 10, 'Isak', 'https://m.media-amazon.com/images/I/41PYFqODPbL._SX522_.jpg', 699, 150, 12),
(30, 'Bella Vita Luxury G.O.A.T Eau De Parfum Perfume for Men with Bergamot, Lavender & Patchouli|Woody & Oriental Long Lasting EDP Fragrance Scent, 100 Ml', 28, ' Roll over image to zoom in Bella Vita', 'https://m.media-amazon.com/images/I/61cCpmDwwEL._SX522_.jpg', 799, 65, 5),
(31, 'Bella Vita Luxury IMPACT MAN Eau De Cologne Perfume with Mandarin Orange, Patchouli, Cedar | Woody, Citrusy Long Lasting EDC Fragrance Scent for Men 100Ml', 43, 'Bella Vita Luxury IMPACT', 'https://m.media-amazon.com/images/I/61SqBkQBsdL._SX522_.jpg', 899, 75, 5),
(32, 'Bella Vita Luxury OCEAN Aquatic Eau De Parfum for Men with Marine, Orchid & Musk|Long Lasting Fresh Citrusy & Woody EDP Fragrance Scent Perfume,100 Ml', 23, 'Bella Vita Luxury OCEAN Aquatic', 'https://m.media-amazon.com/images/I/61kG-JjDWTL._SX522_.jpg', 1099, 85, 5),
(33, 'Shum Iceberg | Concentrated Attar | Non-Alcohol Attar | 8ml Fresh Attar', 23, 'Shum Iceberg', 'https://m.media-amazon.com/images/I/41jImUaivhL._SY300_SX300_QL70_FMwebp_.jpg', 200, 120, 12),
(34, 'UPSILON Wild Blue Aqua Perfume for Men 100 ml | Eau De Perfume | Long Lasting Fresh & Powerful Fragrance | Mens Perfume Spray | Travel Friendly | Luxury Scent | Pack of 1', 8, 'UPSILON Wild', 'https://m.media-amazon.com/images/I/71qWo7ELB5L._SX522_.jpg', 1599, 110, 7),
(35, 'Bella Vita Luxury FRESH Eau De Toilette Unisex Perfume for Men & Women with Bergamot, Ylang Ylang |Refreshing EDT Long Lasting Fragrance Scent, 100 Ml', 43, 'Bella Vita Luxury FRESH', 'https://m.media-amazon.com/images/I/51zxi-sj5aL._SX522_.jpg', 899, 100, 8),
(36, 'Adidas Ice Dive Eau De Toilette Spray For Men, 100.55ml (Fresh)', 34, 'Adidas', 'https://m.media-amazon.com/images/I/610wtkL2CXL._SX522_PIbundle-2,TopRight,0,0_AA522SH20_.jpg', 1438, 150, 8),
(37, 'Ulric De Varens Black Eau de Toilette for him, 100ml', 10, 'Ulric De Varens', 'https://m.media-amazon.com/images/I/51syiiWUmtL._SX522_.jpg', 1175, 140, 8),
(38, 'Prince Eau de Cologne (400ml)', 1, 'Prince', 'https://m.media-amazon.com/images/I/61kdXVk6tDL._SX522_.jpg', 379, 25, 9),
(39, 'Premium Eau de cologne, 100ml', 13, 'Premium', 'https://m.media-amazon.com/images/I/61rGz9krDiL._SX522_.jpg', 150, 60, 9),
(40, 'Bella Vita Luxury Skai Aquatic Eau De Cologne Unisex Perfume for Men & Women with Bergamot, Pink Pepper |Long Lasting Aqua EDC Fragrance Scent, 20 Ml', 43, 'Bella Vita Luxury Skai Aquatic', 'https://m.media-amazon.com/images/I/51VAoWSqjbL._SX522_.jpg', 349, 50, 9),
(41, 'Park Avenue Euphoria â Eau De Parfum Men, 100ml | Perfume for Men | Premium Luxury Fragrance Scent | Long-lasting Aroma Perfume', 63, 'Park Avenue Euphoria', 'https://m.media-amazon.com/images/I/61zBq6pkFFL._SX522_.jpg', 749, 70, 5),
(43, 'Nabeel - Dahn Al Oud Amiri Premium Attar Roll-on Perfume Oil | 100% Non Alcoholic | Crown jewel among Woody Oud Perfumes | 6ml (Set of 2) | Made in U.A.E', 10, 'Nabeel', 'https://m.media-amazon.com/images/I/613paZ+JAUL._SX522_PIbundle-2,TopRight,0,0_AA522SH20_.jpg', 500, 150, 12),
(44, 'Arabiyat White Musk Concentrated Perfume Oil 12ml | Non Alcoholic Attar for Men & Women (Unisex)', 13, 'Arabiyat', 'https://m.media-amazon.com/images/I/71djp8R+ghL._SY879_.jpg', 499, 60, 12),
(45, 'Armaf Derby Club House Blanche Eau De Toilette 100ML', 15, 'Armaf Derby', 'https://armafperfume.com/cdn/shop/products/TCB_1419_1_800x.jpg?v=1641560271', 2145, 150, 8),
(46, 'fhkjqhwkge', 10, 'ATARSTORY', 'https://m.media-amazon.com/images/I/71mQEkY0U-L._SX522_PIbundle-2,TopRight,0,0_AA522SH20_.jpg', 500, 250, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_address` varchar(1500) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_pic` varchar(1500) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_address`, `user_email`, `user_name`, `user_password`, `user_phone`, `user_pic`, `user_type`) VALUES
(7, 'kakhe Tal-panhala Dist-kolhapur', 'onkaryevale1@gmail.com', 'onkar yevale', '1234', '8698424630', 'default.png', 'admin'),
(8, 'male Tal-panhala Dist-kolhapur', 'sahilyevale1@gmail.com', 'sahil yevale', '1234', '9623935189', 'default.png', 'normal'),
(9, 'A/P Kakhe tal-panhala Dist-kolhapur pincode-416114', 'shubhangi123@gmail.com', 'Shubhangi Khude', '1234', '8565856956', 'default.png', 'normal'),
(10, 'A/P Kakhe Tal-Panhala Dist-Kolhapur Pincode-416114', 'komal123@gmail.com', 'Komal Jamdade', '1234', '8598568558', 'default.png', 'normal'),
(11, 'A/P Latur Tal-Nilanga Dist-Latur Pincode-413530', 'sam123@gmail.com', 'Samadhan Gaware', '1234', '8412825363', 'default.png', 'normal'),
(12, 'sanadi mala kabanur', 'tahirsanadi@gmail.com', 'tahir sanadi', '12345678', '8412840934', 'default.png', 'normal'),
(13, 'A/P Karoli T Tal-Kavtemahakal Dist-Sangli', 'pranit123@gmail.com', 'Pranit Borigidde', '1234', '5256523568', 'default.png', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `FK825v7lftk50hyta3jlxerywcb` (`category_categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK825v7lftk50hyta3jlxerywcb` FOREIGN KEY (`category_categoryId`) REFERENCES `category` (`categoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
