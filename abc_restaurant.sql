-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2024 at 05:22 AM
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
-- Database: `abc_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`) VALUES
(1, 'Margherita Pizza', 'Traditional pizza with tomato, mozzarella, and fresh basil.', 7.99, 'images/margherita_pizza.png'),
(2, 'Pepperoni Pizza', 'Classic pizza topped with pepperoni slices and mozzarella cheese.', 8.99, 'images/pepperoni_pizza.png'),
(3, 'Beef Lasagna', 'Layers of pasta, ground beef, tomato sauce, and cheese.', 9.49, 'images/beef_lasagna.png'),
(4, 'Vegetarian Lasagna', 'Lasagna with layers of vegetables, pasta, and cheese.', 8.99, 'images/vegetarian_lasagna.png'),
(5, 'Chicken Kottu', 'Sri Lankan dish made with chopped roti, vegetables, chicken, and spices.', 6.99, 'images/chicken_kottu.png'),
(6, 'Seafood Fried Rice', 'Fried rice with mixed seafood, vegetables, and soy sauce.', 7.49, 'images/seafood_fried_rice.png'),
(7, 'Cheeseburger', 'Juicy beef patty with cheese, lettuce, tomato, and pickles in a bun.', 5.99, 'images/cheeseburger.png'),
(8, 'Chicken Rice and Curry', 'Sri Lankan dish with rice, chicken curry, and side dishes.', 6.49, 'images/rice_and_curry.png'),
(9, 'Spaghetti Bolognese', 'Classic Italian pasta with a rich meat sauce.', 8.49, 'images/spaghetti.png'),
(10, 'Chicken Ramen', 'Japanese noodle soup with chicken, egg, and vegetables.', 9.99, 'images/ramen.png'),
(11, 'Tiramisu', 'Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cheese.', 4.99, 'images/tiramisu.png');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_type` varchar(50) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `participants` int(11) DEFAULT 1,
  `customer_name` varchar(100) NOT NULL,
  `contact_details` varchar(100) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `service_type`, `reservation_date`, `reservation_time`, `participants`, `customer_name`, `contact_details`, `special_requests`, `created_at`, `payment_status`, `status`) VALUES
(1, 1, 'Event Hosting', '2024-08-29', '11:30:00', 1, 'sadun', '0765942820', '-', '2024-08-29 13:04:51', 'Done', 'Confirmed'),
(7, 1, 'Event Hosting', '2024-08-29', '11:00:00', 1, 'sadun', '0765942820', '-', '2024-08-29 13:27:52', 'Done', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'test2', 1234, 'a@gmail.com', ''),
(2, 'test3', 1234, 'a@gmail.com', 'staff'),
(3, 'test4', 1234, 'a@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `query` text DEFAULT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `answer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`id`, `user_id`, `name`, `email`, `query`, `submission_date`, `answer`) VALUES
(1, 0, 'test', 'a@gmail.com', 'test', '2024-08-28 17:23:29', 'test3'),
(2, 0, 'test', 'a@gmail.com', 'ww', '2024-08-28 17:28:15', ''),
(3, 0, 'test', 'a@gmail.com', 'wsws', '2024-08-28 17:34:23', ''),
(4, 0, 'test', 'a@gmail.com', 'aaa', '2024-08-28 17:38:41', ''),
(5, 0, 'test', 'a@gmail.com', 'qqqqqqq', '2024-08-28 17:42:43', ''),
(6, 1, 'test', 'a@gmail.com', 'xcvb', '2024-08-28 17:43:09', 'answet'),
(7, 1, 'test', 'a@gmail.com', 'xcvb', '2024-08-28 17:47:49', ''),
(8, 0, NULL, NULL, NULL, '2024-08-29 13:38:16', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
