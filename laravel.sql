-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2020 at 12:50 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'test 1'),
(2, 'test 2'),
(3, 'test 3'),
(4, 'test 4'),
(12, 'cat 1'),
(13, 'cat 2 '),
(14, ' cat 3'),
(15, 'cat 6 '),
(16, ' cat 5');

-- --------------------------------------------------------

--
-- Table structure for table `csv_data`
--

CREATE TABLE `csv_data` (
  `id` int(11) NOT NULL,
  `csv_filename` varchar(250) NOT NULL,
  `csv_header` varchar(250) NOT NULL,
  `csv_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csv_data`
--

INSERT INTO `csv_data` (`id`, `csv_filename`, `csv_header`, `csv_data`) VALUES
(25, 'sample data1.csv', '0', '[[\"Product Name\",\"Product Category\",\"Product  SKU\",\"Product  Description\",\"Product Price\",\"Qauntity\"],[\"P1\",\"cat 1\",\"test sku\",\"test description\",\"100\",\"1\"],[\"P2\",\"cat 2 | cat 3\",\"sku 2\",\"test description 1\",\"200\",\"2\"],[\"P3\",\"cat 2 | cat 3\",\"sku 3\",\"testing desc 2\",\"300\",\"3\"],[\"P4\",\"cat 6 | cat 5\",\"sku 5\",\"test desc 3\",\"400\",\"2\"]]'),
(26, 'sample data1.csv', '0', '[[\"Product Name\",\"Product Category\",\"Product  SKU\",\"Product  Description\",\"Product Price\",\"Qauntity\"],[\"P1\",\"cat 1\",\"test sku\",\"test description\",\"100\",\"1\"],[\"P2\",\"cat 2 | cat 3\",\"sku 2\",\"test description 1\",\"200\",\"2\"],[\"P3\",\"cat 2 | cat 3\",\"sku 3\",\"testing desc 2\",\"300\",\"3\"],[\"P4\",\"cat 6 | cat 5\",\"sku 5\",\"test desc 3\",\"400\",\"2\"]]'),
(27, 'sample data1.csv', '0', '[[\"Product Name\",\"Product Category\",\"Product  SKU\",\"Product  Description\",\"Product Price\",\"Qauntity\"],[\"P1\",\"cat 1\",\"test sku\",\"test description\",\"100\",\"1\"],[\"P2\",\"cat 2 | cat 3\",\"sku 2\",\"test description 1\",\"200\",\"2\"],[\"P3\",\"cat 2 | cat 3\",\"sku 3\",\"testing desc 2\",\"300\",\"3\"],[\"P4\",\"cat 6 | cat 5\",\"sku 5\",\"test desc 3\",\"400\",\"2\"]]');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_04_29_003037_create_companies_table', 2),
(4, '2020_04_29_003056_create_employees_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sku` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `category_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `description`, `price`, `quantity`, `category_id`) VALUES
(99, 'P1', 'test sku', 'test description', '100', '1', '12'),
(100, 'P2', 'sku 2', 'test description 1', '200', '2', '13,14'),
(101, 'P3', 'sku 3', 'testing desc 2', '300', '3', '13,14'),
(102, 'P4', 'sku 5', 'test desc 3', '400', '2', '15,16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@admin.com', NULL, '$2y$10$pNu1eVuyG8bzCd.8uunDOuVi5VHqw.6AXq4jLWVKOsK1BGtfm7.5e', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `csv_data`
--
ALTER TABLE `csv_data`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `csv_data`
--
ALTER TABLE `csv_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
