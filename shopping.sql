-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 01:38 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2023-07-05 05:11:50', '15-08-2023 04:44:06 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(4, 'Electronics', 'Electronic Products', '2023-07-14 19:38:45', '2023-07-05 10:56:50'),
(6, 'Fashion', 'Fashion', '2023-07-17 19:18:52', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(56, 21, '8', 1, '2023-12-15 08:44:16', 'COD', 'Delivered'),
(58, 21, '7', 1, '2023-12-15 08:46:47', 'COD', 'Delivered'),
(59, 22, '5', 1, '2023-12-15 08:48:30', 'COD', 'Delivered'),
(61, 16, '7', 1, '2023-12-15 08:51:45', 'COD', NULL),
(62, 16, '8', 3, '2023-12-15 08:51:45', 'COD', 'Delivered'),
(63, 23, '12', 1, '2023-12-15 08:52:50', 'COD', 'Delivered'),
(64, 24, '12', 1, '2023-12-15 08:55:48', 'COD', 'Delivered'),
(65, 24, '8', 1, '2023-12-15 08:57:35', 'COD', 'Delivered'),
(66, 24, '20', 1, '2023-12-15 08:59:45', 'COD', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(42, 56, 'Delivered', 'sad', '2023-12-15 08:44:47'),
(43, 58, 'Delivered', 'sad', '2023-12-15 08:47:13'),
(44, 59, 'Delivered', 'sad', '2023-12-15 08:48:47'),
(45, 62, 'Delivered', 'sad', '2023-12-15 08:51:58'),
(46, 63, 'Delivered', 'sd', '2023-12-15 08:53:15'),
(47, 65, 'in Process', 'sad', '2023-12-15 08:58:27'),
(48, 65, 'Delivered', 'no', '2023-12-15 08:59:06'),
(49, 66, 'Delivered', 'dsad', '2023-12-15 09:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(1, 1, 3, 5, 2, 'arpan', 'nothing', 'worst', '2023-08-28 07:02:04'),
(2, 2, 1, 1, 1, 'sony', 'nothing', 'dasdas', '2023-08-28 07:03:55'),
(88, 1, 5, 5, 5, 'Arpan Khadka', 'nothing', 'wow', '2023-10-09 05:49:47'),
(89, 1, 5, 5, 5, 'Arpan Khadka', 'nothing', 'wow', '2023-10-09 05:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', 'micromax1.jpeg', 'micromax main image.jpg', 'micromax main image.jpg', 1200, 'In Stock', '2023-07-25 06:11:50', ''),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'lenovo-k5-note-pa330010in-1.jpeg', 'lenovo-k5-note-pa330116in-2.jpeg', 'lenovo-k5-note-pa330116in-3.jpeg', 0, 'In Stock', '2023-07-25 06:49:17', ''),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490, 0, '<ul><li>1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch HD Display<br></li><li>8MP Primary Camera | 5MP Front<br></li><li>2600 mAh Li-Ion Battery<br></li><li>Exynos 3475 Processor<br></li></ul>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', 20, 'In Stock', '2023-07-25 07:10:17', ''),
(8, 4, 4, 'OPPO A57', 'OPPO', 14990, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 256 GB<br></li><li>5.2 inch HD Display<br></li><li>13MP Primary Camera | 16MP Front<br></li><li>2900 mAh Battery<br></li><li>Qualcomm MSM8940 64-bit Processor<br></li></ul>', 'oppo-a57-na-original-1.jpeg', 'oppo-a57-na-original-2.jpeg', 'oppo-a57-na-original-3.jpeg', 0, 'In Stock', '2023-07-24 19:23:54', ''),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259, 0, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', 'amzer-amz98947-original-1.jpeg', 'amzer-amz98947-original-2.jpeg', 'amzer-amz98947-original-3.jpeg', 10, 'In Stock', '2023-07-24 19:38:03', ''),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990, 0, '<ul><li>Intel Pentium Quad Core Processor ( )<br></li><li>4 GB DDR3 RAM<br></li><li>Linux/Ubuntu Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul>', 'acer-aspire-notebook-original-1.jpeg', 'acer-aspire-notebook-original-2.jpeg', 'acer-aspire-notebook-original-3.jpeg', 0, 'In Stock', '2023-07-24 19:50:17', ''),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', 10999, 0, '<ul><li>Intel Atom Processor ( 4th Gen )<br></li><li>2 GB DDR3 RAM<br></li><li>32 bit Windows 10 Operating System<br></li><li>11.6 inch Touchscreen Display<br></li></ul>', 'micromax-lt777w-2-in-1-laptop-original-1.jpeg', 'micromax-lt777w-2-in-1-laptop-original-2.jpeg', 'micromax-lt777w-2-in-1-laptop-original-3.jpeg', 0, 'In Stock', '2023-07-24 20:11:21', ''),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41900, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">HP Core i5 5th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) N8M28PA 15-ac123tx Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Turbo SIlver, 2.19 kg)</span><br><div><ul><li>Intel Core i5 Processor ( 5th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'hp-notebook-original-1.jpeg', 'hp-notebook-original-2.jpeg', 'hp-notebook-original-3.jpeg', 0, 'In Stock', '2023-07-25 16:17:29', ''),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Lenovo Ideapad 110 APU Quad Core A6 6th Gen - (4 GB/500 GB HDD/Windows 10 Home) 80TJ00D2IH IP110 15ACL Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Black, 2.2 kg)</span><br><div><ul><li>AMD APU Quad Core A6 Processor ( 6th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>500 GB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'lenovo-ideapad-notebook-original-1.jpeg', 'lenovo-ideapad-notebook-original-2.jpeg', 'lenovo-ideapad-notebook-3.jpeg', 0, 'In Stock', '2023-07-25 16:18:02', ''),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205, 250, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">The Wimpy Kid Do -It- Yourself Book</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 50, 'In Stock', '2023-07-26 16:19:52', ''),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240, 0, '<ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Scholastic<br></li><li>ISBN: 9789351032083, 9351032086<br></li><li>Edition: 2015<br></li><li>Pages: 176<br></li></ul>', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', 30, 'In Stock', '2023-07-27 16:19:59', ''),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Induscraft Solid Wood King Bed With Storage</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - Honey Brown)</span><br><div><ul><li>Material Subtype: Rosewood (Sheesham)<br></li><li>W x H x D: 1850 mm x 875 mm x 2057.5 mm<br></li><li>Floor Clearance: 8 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-1.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-2.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-3.jpeg', 0, 'In Stock', '2023-07-27 16:20:07', ''),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">@home by Nilkamal Ursa Metal Queen Bed</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - NA)</span><br><div><ul><li>Material Subtype: Carbon Steel<br></li><li>W x H x D: 1590 mm x 910 mm x 2070 mm<br></li><li>Floor Clearance: 341 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-1.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-2.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-3.jpeg', 0, 'In Stock', '2023-07-28 16:20:23', ''),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379, 0, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: White, White</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Outer Material: Denim</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><br></div></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 45, 'In Stock', '2023-07-29 16:21:03', ''),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes  (Blue)', 'Adidas', 4129, 5000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: Blue</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Closure: Laced</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Weight</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>200 g (per single Shoe) - Weight of the product may vary depending on size.</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Style</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Panel and Stitch Detail, Textured Detail</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Tip Shape</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Round</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Season</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>AW16</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Closure</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Laced</b></li></ul></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 0, 'In Stock', '2023-07-30 16:21:11', ''),
(21, 6, 12, 'Zed 11 Yellow Goldstar Shoes For Men', 'Goldstarshoes', 1135, 1250, '<p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Upper Skin:</b>&nbsp;Synthetic Leather</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Insole Material:</b>&nbsp;Eva / Fabric</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Outsole Material:</b>&nbsp;PVC</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Closure:&nbsp;</b>Lace-Up</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Type:&nbsp;</b>Casual</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Tip Shape:&nbsp;</b>Round (Slightly Uplifted)</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Color:&nbsp;</b>White/Grey/Yellow</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Ultralight, Always Classic, Never out of style</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Presence of the Goldstar logo at the back of the heel</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Presence of the Goldstar Shoes brand level attached to the tongue</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Dress in the timeless Zed 11 Goldstar Sneakers to impress! Made of synthetic leather, the Goldstar Sneaker is simple to style and will go for ages. The contrasting color in the shoe gives it a unique style. To place an order, go to Goldstar Shoes official website!</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 16px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Contact us at 9818551827 for bulk orders and inquiries.</font></p>', 'insert1.jpg', 'insert.jpg', 'insert2.jpg', 0, 'In Stock', '2023-10-09 04:36:11', NULL),
(22, 4, 3, '32\" Smart LED TV', ' Sensei', 20000, 24000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgb(51, 51, 51); font-family: &quot;LG Smart&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Sans Serif&quot;, sans-serif; font-size: 14px; letter-spacing: 0.28px;\"><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Size 32 Inch</span></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Smart HD TV</span></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Bright Panel</span></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Slim Bezel</span></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Picture Perfect</span></li><li style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><span style=\"box-sizing: border-box; font-weight: 700;\">3 Years [ 18 months Comprehensive, additional 18 months Service Support, with Parts Chargeable ]<br style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">[ Excluding Remote Control, Accessories, Batteries ]</span></span></li></ul>', 'new1.jpg', 'ssss.jpg', 'aaaa.webp', 0, 'In Stock', '2023-12-14 05:21:27', NULL),
(23, 6, 12, 'G10 G2006 Black Goldstar Trekking Shoes For Men', 'Goldstarshoes', 3250, 3650, '<p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Upper Skin:&nbsp;</b>PU Sporloue Rexine / Mesh</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Insole Material:</b>&nbsp;Eva / Fabric</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Outsole Material:</b>&nbsp;Eva / Rubber</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Closure:</b>&nbsp;Lace-Up</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Type:</b>&nbsp;Trekking Shoes</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Tip Shape:&nbsp;</b>Round (Slightly Uplifted)</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\"><b style=\"box-sizing: border-box;\">Color:&nbsp;</b>Black</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Presence of Pull Tab</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-size: 15.2px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;;\"><font color=\"#6c757d\" style=\"box-sizing: border-box;\">Comfortable, Durable, and Fashionable</font></p>', 'new1new.jpg', 'newwwww.jpg', 'newwwwwwwww.jpg', 0, 'In Stock', '2023-12-14 13:38:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Led Television', '2023-07-25 06:11:50', '2023-07-30 02:12:20'),
(3, 4, 'Television', '2023-07-25 06:35:12', '2023-07-30 03:13:20'),
(4, 4, 'Mobiles', '2023-07-25 16:24:51', '2023-07-30 03:20:20'),
(5, 4, 'Mobile Accessories', '2023-07-26 16:25:01', ''),
(6, 4, 'Laptops', '2023-07-27 16:25:29', ''),
(8, 3, 'Comics', '2023-07-28 16:25:34', ''),
(12, 6, 'Men Footwears', '2023-07-30 16:25:49', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(25, 'khukurihouse@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-15 11:08:35', NULL, 0),
(26, 'khadkaarpan113112@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-15 11:09:15', NULL, 1),
(27, 'customer@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-17 15:33:41', NULL, 1),
(28, 'customer@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 04:56:42', NULL, 0),
(29, 'customer@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 04:56:54', NULL, 0),
(30, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 04:57:42', NULL, 1),
(31, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 05:00:55', NULL, 1),
(32, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 05:02:56', NULL, 1),
(33, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 07:59:41', NULL, 0),
(34, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 07:59:52', NULL, 0),
(35, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 08:01:01', NULL, 1),
(36, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-18 14:01:10', '18-08-2023 07:36:36 PM', 1),
(37, 'sony@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-28 07:03:09', NULL, 1),
(38, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-25 15:21:14', NULL, 0),
(39, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-25 15:21:24', NULL, 1),
(40, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-09-25 15:28:19', NULL, 1),
(41, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-10-09 04:38:58', '09-10-2023 10:15:02 AM', 1),
(42, 'customer1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-10-09 04:45:26', '09-10-2023 11:18:06 AM', 1),
(43, 'khadkaarpan113113@gmail.com', 0x3a3a3100000000000000000000000000, '2023-10-09 05:48:54', NULL, 1),
(44, 'gen@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 05:07:49', '14-12-2023 10:43:57 AM', 1),
(45, 'arp@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 05:15:27', NULL, 1),
(46, 'arp@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 07:49:20', '14-12-2023 01:19:26 PM', 1),
(47, 'bishal@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 07:50:21', '14-12-2023 01:30:38 PM', 1),
(48, 'sony@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 08:01:17', NULL, 0),
(49, 'sony@gmailcom', 0x3a3a3100000000000000000000000000, '2023-12-14 08:01:30', '14-12-2023 01:32:50 PM', 1),
(50, 'sony@gmailcom', 0x3a3a3100000000000000000000000000, '2023-12-14 08:05:35', NULL, 1),
(51, 'new@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:32:20', NULL, 1),
(52, 'new@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:43:32', '14-12-2023 07:15:44 PM', 1),
(53, 'old@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:46:22', '14-12-2023 07:18:32 PM', 1),
(54, 'current@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:49:06', '14-12-2023 07:20:42 PM', 1),
(55, 'sony@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:51:09', NULL, 1),
(56, 'current@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:57:31', '14-12-2023 07:29:12 PM', 1),
(57, 'new@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 13:59:21', '14-12-2023 07:32:02 PM', 1),
(58, 'old@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 14:02:09', '14-12-2023 07:36:31 PM', 1),
(59, 'aryan@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 14:07:01', '14-12-2023 07:38:20 PM', 1),
(60, 'meet@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 14:08:56', '14-12-2023 07:48:51 PM', 1),
(61, 'create@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 14:20:33', NULL, 1),
(62, 'create@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 15:38:10', '14-12-2023 09:09:10 PM', 1),
(63, 'old@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-14 15:39:56', NULL, 1),
(64, 'sweety@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:43:33', NULL, 1),
(65, 'sweety@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:46:21', '15-12-2023 02:17:28 PM', 1),
(66, 'account@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:48:13', NULL, 1),
(67, 'current@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:51:13', '15-12-2023 02:22:05 PM', 1),
(68, 'full@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:52:32', '15-12-2023 02:23:43 PM', 1),
(69, 'home@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 08:55:16', '15-12-2023 02:31:27 PM', 1),
(70, 'home@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 09:01:35', NULL, 1),
(71, 'current@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-15 09:03:26', '15-12-2023 02:34:19 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(7, 'user', 'user@gmail.com', 9818551827, 'fbd5e7d0d10e8d412cf561c33fbaac94', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 16:02:11', NULL),
(11, 'arp', 'arp@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 05:15:13', NULL),
(12, 'bishal', 'bishal@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 07:50:07', NULL),
(13, 'sony', 'sony@gmailcom', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 08:01:09', NULL),
(14, 'new', 'new@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 13:32:10', NULL),
(15, 'old', 'old@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 13:46:10', NULL),
(16, 'current', 'current@gmail.com', 9818551827, '202cb962ac59075b964b07152d234b70', 'od', '4', 'Lalitpur', 12, NULL, NULL, NULL, NULL, '2023-12-14 13:48:53', NULL),
(17, 'sony', 'sony@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 13:51:01', NULL),
(18, 'aryan', 'aryan@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 14:06:52', NULL),
(20, 'create', 'create@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 14:20:23', NULL),
(21, 'sweety', 'sweety@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-15 08:43:24', NULL),
(22, 'account', 'account@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-15 08:47:59', NULL),
(23, 'full', 'full@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-15 08:52:22', NULL),
(24, 'home', 'home@gmail.com', 9818551827, 'cf842994bc45fa2735573cd0a98233c7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-15 08:55:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 3, '2023-08-28 07:08:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
