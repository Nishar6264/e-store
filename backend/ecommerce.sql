-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2024 at 03:01 PM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `nameProduct` varchar(255) DEFAULT NULL,
  `priceProduct` decimal(10,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `idUser`, `idProduct`, `nameProduct`, `priceProduct`, `count`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 6, 6, 'Tree Oil 30ml', 12.00, 1, 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 5, 2, 'Samsung Galaxy Book', 1499.00, 1, 'https://cdn.dummyjson.com/product-images/7/1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 6, 2, 'Samsung Galaxy Book', 1499.00, 1, 'https://cdn.dummyjson.com/product-images/7/1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 6, 1, 'Samsung Universe 9', 1249.00, 1, ' https://cdn.dummyjson.com/product-images/3/1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 6, 3, 'Microsoft Surface Laptop 4', 1499.00, 2, 'https://cdn.dummyjson.com/product-images/8/1.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 6, 6, 'Tree Oil 30ml', 12.00, 1, 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 6, 6, 'Tree Oil 30ml', 12.00, 2, 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg', '2024-04-23 12:48:19', '2024-04-23 12:48:19'),
(8, 6, 4, 'perfume Oil', 13.00, 1, 'https://cdn.dummyjson.com/product-images/11/1.jpg', '2024-04-23 12:48:20', '2024-04-23 12:48:20'),
(9, 6, 4, 'perfume Oil', 13.00, 1, 'https://cdn.dummyjson.com/product-images/11/1.jpg', '2024-04-23 13:07:16', '2024-04-23 13:07:16'),
(10, 6, 5, 'Brown Perfume', 13.00, 1, 'https://cdn.dummyjson.com/product-images/12/1.jpg', '2024-04-23 13:07:16', '2024-04-23 13:07:16'),
(11, 6, 4, 'perfume Oil', 13.00, 1, 'https://cdn.dummyjson.com/product-images/11/1.jpg', '2024-04-23 13:11:34', '2024-04-23 13:11:34'),
(12, 6, 5, 'Brown Perfume', 13.00, 1, 'https://cdn.dummyjson.com/product-images/12/1.jpg', '2024-04-23 13:11:34', '2024-04-23 13:11:34'),
(13, 6, 4, 'perfume Oil', 13.00, 1, 'https://cdn.dummyjson.com/product-images/11/1.jpg', '2024-04-23 13:12:51', '2024-04-23 13:12:51'),
(14, 6, 5, 'Brown Perfume', 13.00, 1, 'https://cdn.dummyjson.com/product-images/12/1.jpg', '2024-04-23 13:12:51', '2024-04-23 13:12:51'),
(15, 6, 4, 'perfume Oil', 13.00, 1, 'https://cdn.dummyjson.com/product-images/11/1.jpg', '2024-04-23 13:15:09', '2024-04-23 13:15:09'),
(16, 6, 5, 'Brown Perfume', 13.00, 1, 'https://cdn.dummyjson.com/product-images/12/1.jpg', '2024-04-23 13:15:09', '2024-04-23 13:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cart` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `productName` varchar(500) NOT NULL,
  `total` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `delivery` tinyint(4) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `idUser`, `phone`, `address`, `cart`, `fullname`, `productName`, `total`, `status`, `delivery`, `createdAt`, `updatedAt`) VALUES
(1, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '2748', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '2748', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '2998', 0, 0, '2024-04-23 12:02:13', '2024-04-23 12:02:13'),
(4, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '12', 0, 0, '2024-04-23 12:06:10', '2024-04-23 12:06:10'),
(5, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '37', 0, 0, '2024-04-23 12:48:19', '2024-04-23 12:48:19'),
(6, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '37', 0, 0, '2024-04-23 12:48:20', '2024-04-23 12:48:20'),
(7, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:07:16', '2024-04-23 13:07:16'),
(8, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:07:16', '2024-04-23 13:07:16'),
(9, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:11:34', '2024-04-23 13:11:34'),
(10, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:11:34', '2024-04-23 13:11:34'),
(11, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:12:51', '2024-04-23 13:12:51'),
(12, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:12:51', '2024-04-23 13:12:51'),
(13, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:15:09', '2024-04-23 13:15:09'),
(14, 6, '9973775325', 'Ahmedabad Gujarat', NULL, 'Nishar Alam', '', '26', 0, 0, '2024-04-23 13:15:09', '2024-04-23 13:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img1` text DEFAULT NULL,
  `img2` text DEFAULT NULL,
  `img3` text DEFAULT NULL,
  `img4` text DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `stocks` int(11) NOT NULL,
  `promotionPercent` int(11) DEFAULT NULL,
  `createdAt` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `img1`, `img2`, `img3`, `img4`, `category`, `stocks`, `promotionPercent`, `createdAt`, `updatedAt`) VALUES
(1, 'Samsung Universe 9', 'Samsung\'s new variant which goes beyond Galaxy to the Universe', ' https://cdn.dummyjson.com/product-images/3/1.jpg', 'https://cdn.dummyjson.com/product-images/3/1.jpg', 'https://cdn.dummyjson.com/product-images/3/1.jpg', 'https://cdn.dummyjson.com/product-images/3/1.jpg', 'smartphones', 36, 15, 2024, 2024),
(2, 'Samsung Galaxy Book', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 'https://cdn.dummyjson.com/product-images/7/1.jpg', 'https://cdn.dummyjson.com/product-images/7/2.jpg', 'https://cdn.dummyjson.com/product-images/7/3.jpg', 'https://cdn.dummyjson.com/product-images/7/thumbnail.jpg', 'laptops', 50, 15, 2024, 2024),
(3, 'Microsoft Surface Laptop 4', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 'https://cdn.dummyjson.com/product-images/8/1.jpg', 'https://cdn.dummyjson.com/product-images/8/3.jpg', 'https://cdn.dummyjson.com/product-images/8/4.jpg', 'https://cdn.dummyjson.com/product-images/8/2.jpg', 'laptops', 68, 15, 2024, 2024),
(4, 'perfume Oil', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 'https://cdn.dummyjson.com/product-images/11/1.jpg', 'https://cdn.dummyjson.com/product-images/11/2.jpg', 'https://cdn.dummyjson.com/product-images/11/3.jpg', 'https://cdn.dummyjson.com/product-images/11/thumbnail.jpg', 'fragrances', 65, 8, 2024, 2024),
(5, 'Brown Perfume', 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 'https://cdn.dummyjson.com/product-images/12/1.jpg', 'https://cdn.dummyjson.com/product-images/12/2.jpg', 'https://cdn.dummyjson.com/product-images/12/3.png', 'https://cdn.dummyjson.com/product-images/12/4.jpg', 'fragrances', 65, 8, 2024, 2024),
(6, 'Tree Oil 30ml', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg', 'https://cdn.dummyjson.com/product-images/17/1.jpg', 'https://cdn.dummyjson.com/product-images/17/2.jpg', 'https://cdn.dummyjson.com/product-images/17/3.jpg', 'skincare', 67, 8, 2024, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `productvariant`
--

CREATE TABLE `productvariant` (
  `id` int(20) NOT NULL,
  `variantName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `prices` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `admin`, `createdAt`, `updatedAt`) VALUES
(5, 'Nishar Alam', 'mralamnishar@gmail.com', '$2a$10$An/VBt/tzdLkW38y5BPH5OUOnf1yQ8gdysP/BpZjkwsrFySpazw0W', '9973775325', 0, '2024-04-22 03:34:50', '2024-04-22 03:34:50'),
(6, 'Nishar Alam', 'admin@gmail.com', '$2a$10$bdk6hmp0k6MPpclpsZcnbukAK5NsR7WIngQoL5DqAJpBIDId4AlZe', '9973775325', 1, '2024-04-23 04:35:52', '2024-04-23 04:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `variantID` int(11) NOT NULL,
  `VariantAttribute` varchar(250) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `cart` (`cart`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productvariant`
--
ALTER TABLE `productvariant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variantID` (`variantID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productvariant`
--
ALTER TABLE `productvariant`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cart`) REFERENCES `carts` (`id`);

--
-- Constraints for table `productvariant`
--
ALTER TABLE `productvariant`
  ADD CONSTRAINT `productvariant_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`variantID`) REFERENCES `productvariant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
