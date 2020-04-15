-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 14, 2020 at 08:05 PM
-- Server version: 10.1.44-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dicasacv_foodoma181`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_deliveries`
--

CREATE TABLE `accept_deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `addon_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_categories`
--

CREATE TABLE `addon_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_category_item`
--

CREATE TABLE `addon_category_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `addon_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `house` longtext COLLATE utf8mb4_unicode_ci,
  `landmark` longtext COLLATE utf8mb4_unicode_ci,
  `tag` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `house`, `landmark`, `tag`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(1, 2, '645 Mindelo São Vicente, Mindelo, Cape Verde', 'Mindelo', NULL, NULL, '2020-04-15 00:56:41', '2020-04-15 00:56:41', '16.8785814', '-24.9913906'),
(2, 2, '645 Mindelo São Vicente, Mindelo, Cape Verde', 'Mindelo', NULL, NULL, '2020-04-15 01:18:30', '2020-04-15 01:18:30', '16.8785814', '-24.9913906'),
(3, 4, 'Alto Saó Pedro, São Filipe, Cape Verde', 'Sao Filipe', NULL, 'Casa', '2020-04-15 01:43:45', '2020-04-15 01:43:45', '14.89511596', '-24.49893236'),
(4, 2, 'Alto Saó Pedro, São Filipe, Cape Verde', 'Sao Felipe', NULL, NULL, '2020-04-15 01:43:47', '2020-04-15 01:43:47', '14.89511596', '-24.49893236'),
(5, 3, 'Rua da Posto, São Filipe, Cape Verde', 'Sao FIlipe', NULL, NULL, '2020-04-15 02:22:00', '2020-04-15 02:22:00', '14.900536910064563', '-24.49954340160336');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `data`, `user_id`, `is_read`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 00:59:57', '2020-04-15 00:59:57'),
(2, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 00:59:57', '2020-04-15 00:59:57'),
(3, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:00:39', '2020-04-15 01:00:39'),
(4, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:04:39', '2020-04-15 01:04:39'),
(5, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:04:39', '2020-04-15 01:04:39'),
(6, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:18:57', '2020-04-15 01:18:57'),
(7, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:18:57', '2020-04-15 01:18:57'),
(8, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:18:57', '2020-04-15 01:18:57'),
(9, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:31:17', '2020-04-15 01:31:17'),
(10, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:31:17', '2020-04-15 01:31:17'),
(11, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:31:17', '2020-04-15 01:31:17'),
(12, '{\"title\":\"Benvindo Ima\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:31:38', '2020-04-15 01:31:38'),
(13, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:45:44', '2020-04-15 01:45:44'),
(14, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:45:44', '2020-04-15 01:45:44'),
(15, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:45:44', '2020-04-15 01:45:44'),
(16, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 01:45:44', '2020-04-15 01:45:44'),
(17, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:46:42', '2020-04-15 01:46:42'),
(18, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:46:42', '2020-04-15 01:46:42'),
(19, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:46:42', '2020-04-15 01:46:42'),
(20, '{\"title\":\"Benvindo Clientes\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 01:46:42', '2020-04-15 01:46:42'),
(21, '{\"title\":\"Testeeeee\",\"message\":\"testttcxczczx\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:46:50', '2020-04-15 01:46:50'),
(22, '{\"title\":\"Testeeeee\",\"message\":\"testttcxczczx\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:46:50', '2020-04-15 01:46:50'),
(23, '{\"title\":\"Testeeeee\",\"message\":\"testttcxczczx\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:46:50', '2020-04-15 01:46:50'),
(24, '{\"title\":\"Testeeeee\",\"message\":\"testttcxczczx\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 01:46:50', '2020-04-15 01:46:50'),
(25, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:56:31', '2020-04-15 01:56:31'),
(26, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:56:31', '2020-04-15 01:56:31'),
(27, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:56:31', '2020-04-15 01:56:31'),
(28, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":null,\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 01:56:31', '2020-04-15 01:56:31'),
(29, '{\"title\":\"Benvindo Ima\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 01:57:14', '2020-04-15 01:57:14'),
(30, '{\"title\":\"Benvindo Ima\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 01:57:14', '2020-04-15 01:57:14'),
(31, '{\"title\":\"Benvindo Ima\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 01:57:14', '2020-04-15 01:57:14'),
(32, '{\"title\":\"Benvindo Ima\",\"message\":\"Sejam benvindos a APP DiCasa\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 01:57:14', '2020-04-15 01:57:14'),
(33, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 02:04:51', '2020-04-15 02:04:51'),
(34, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 02:04:51', '2020-04-15 02:04:51'),
(35, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 02:04:51', '2020-04-15 02:04:51'),
(36, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 02:04:51', '2020-04-15 02:04:51'),
(37, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 1, 0, '2020-04-15 02:07:39', '2020-04-15 02:07:39'),
(38, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 2, 0, '2020-04-15 02:07:39', '2020-04-15 02:07:39'),
(39, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 3, 0, '2020-04-15 02:07:39', '2020-04-15 02:07:39'),
(40, '{\"title\":\"Ola\",\"message\":\"Ola Notifica\\u00e7\\u00e3o AQUI\",\"badge\":\"\\/assets\\/img\\/favicons\\/favicon-96x96.png\",\"icon\":\"\\/assets\\/img\\/favicons\\/favicon-512x512.png\",\"click_action\":\"https:\\/\\/cliente181.dicasa.cv\\/\",\"unique_order_id\":null,\"custom_notification\":true,\"custom_image\":null}', 4, 0, '2020-04-15 02:07:39', '2020-04-15 02:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `max_count` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_collections`
--

CREATE TABLE `delivery_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_collection_logs`
--

CREATE TABLE `delivery_collection_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `delivery_collection_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_guy_details`
--

CREATE TABLE `delivery_guy_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_rate` decimal(8,2) NOT NULL DEFAULT '5.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gps_tables`
--

CREATE TABLE `gps_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_long` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_long` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `old_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recommended` tinyint(1) NOT NULL,
  `is_popular` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `placeholder_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_veg` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_06_222923_create_transactions_table', 1),
(4, '2018_11_07_192923_create_transfers_table', 1),
(5, '2018_11_07_202152_update_transfers_table', 1),
(6, '2018_11_15_124230_create_wallets_table', 1),
(7, '2018_11_19_164609_update_transactions_table', 1),
(8, '2018_11_20_133759_add_fee_transfers_table', 1),
(9, '2018_11_22_131953_add_status_transfers_table', 1),
(10, '2018_11_22_133438_drop_refund_transfers_table', 1),
(11, '2019_01_19_062844_create_settings_table', 1),
(12, '2019_01_19_132750_create_locations_table', 1),
(13, '2019_01_21_055516_create_promo_sliders_table', 1),
(14, '2019_01_21_073753_create_restaurants_table', 1),
(15, '2019_01_22_045205_add_slug_to_restaurants_table', 1),
(16, '2019_01_26_103144_create_items_table', 1),
(17, '2019_01_26_103412_create_item_categories_table', 1),
(18, '2019_02_01_095905_add_extras_to_items_table', 1),
(19, '2019_02_01_103027_add_placeholder_image_to_restaurants_table', 1),
(20, '2019_02_02_032957_add_lat_long_to_restaurants_table', 1),
(21, '2019_02_02_033139_add_certificate_to_restaurants_table', 1),
(22, '2019_02_08_061116_add_restaurant_charges_to_restaurants_table', 1),
(23, '2019_02_08_101537_create_coupons_table', 1),
(24, '2019_02_16_042718_add_auth_token_to_users_table', 1),
(25, '2019_02_17_031843_add_phobe_number_to_users_table', 1),
(26, '2019_02_18_054807_create_pages_table', 1),
(27, '2019_02_19_084731_create_orders_table', 1),
(28, '2019_02_19_084930_create_orderstatuses_table', 1),
(29, '2019_02_19_085232_create_orderitems_table', 1),
(30, '2019_02_20_044738_create_addresses_table', 1),
(31, '2019_02_20_104553_add_default_address_id_to_users_table', 1),
(32, '2019_02_25_051228_add_payment_mode_to_orders_table', 1),
(33, '2019_02_28_053038_add_order_comment_to_orders_table', 1),
(34, '2019_05_13_111553_update_status_transfers_table', 1),
(35, '2019_05_21_074923_create_permission_tables', 1),
(36, '2019_06_25_103755_add_exchange_status_transfers_table', 1),
(37, '2019_07_09_054236_create_payment_gateways_table', 1),
(38, '2019_07_11_054103_create_user_restaurant_table', 1),
(39, '2019_07_11_135603_add_restaurant_id_to_orders_table', 1),
(40, '2019_07_13_054323_add_delivery_pin_to_users_table', 1),
(41, '2019_07_13_135125_create_gps_tables_table', 1),
(42, '2019_07_15_053733_create_accept_deliveries_table', 1),
(43, '2019_07_16_062435_add_address_pincode_landmark_to_restaurants_table', 1),
(44, '2019_07_23_030953_create_slides_table', 1),
(45, '2019_07_24_031824_add_sku_to_restaurants_table', 1),
(46, '2019_07_29_184926_decimal_places_wallets_table', 1),
(47, '2019_07_31_032042_add_is_active_to_restaurants_table', 1),
(48, '2019_08_11_172547_add_transaction_id_to_orders_table', 1),
(49, '2019_08_13_130103_add_is_accepted_to_restaurants_table', 1),
(50, '2019_08_13_140046_add_is_active_to_items_table', 1),
(51, '2019_08_14_093404_add_restaurant_id_to_coupons_table', 1),
(52, '2019_08_14_112249_add_count_to_coupons_table', 1),
(53, '2019_08_16_105252_create_push_tokens_table', 1),
(54, '2019_08_18_102353_add_is_featured_to_restaurants_table', 1),
(55, '2019_08_20_084106_add_user_id_to_itemcategories_table', 1),
(56, '2019_08_24_182445_add_location_id_to_promo_sliders_table', 1),
(57, '2019_09_15_044915_create_addons_table', 1),
(58, '2019_09_18_234250_create_addon_categories_table', 1),
(59, '2019_09_19_000319_create_addon_category_item_table', 1),
(60, '2019_09_20_054300_create_order_item_addons_table', 1),
(61, '2019_09_23_225754_create_restaurant_earnings_table', 1),
(62, '2019_09_25_005540_add_commission_rate_to_restaurants_table', 1),
(63, '2019_09_25_014138_create_restaurant_payouts_table', 1),
(64, '2019_09_25_025705_add_restaurant_payout_id_to_restaurant_earnings_table', 1),
(65, '2019_10_02_193759_add_discount_transfers_table', 1),
(66, '2019_11_06_232008_add_delivery_type_to_restaurants_table', 1),
(67, '2019_11_07_050958_add_delivery_type_to_orders_table', 1),
(68, '2019_11_08_022754_create_delivery_guy_details_table', 1),
(69, '2019_11_08_023100_add_delivery_guy_detail_id_to_users_table', 1),
(70, '2019_11_17_223225_add_nullable_constraint_to_pincode_landmark_in_restaurants_table', 1),
(71, '2019_11_20_042206_add_payable_to_orders_table', 1),
(72, '2019_11_28_052028_add_delivery_radius_to_restaurants_table', 1),
(73, '2019_12_02_015709_add_lat_lng_to_addresses_table', 1),
(74, '2019_12_05_223129_add_gps_delivery_charges_fields_to_restaurants_table', 1),
(75, '2019_12_09_000038_create_popular_geo_places_table', 1),
(76, '2019_12_13_043245_add_postion_id_and_size_to_promo_sliders_table', 1),
(77, '2019_12_15_223236_add_long_text_constrait_for_body_to_pages_table', 1),
(78, '2019_12_18_002035_create_translations_table', 1),
(79, '2019_12_18_011559_add_default_language_and_is_active_to_translations_table', 1),
(80, '2019_12_19_221313_change_desc_contraints_to_items_table', 1),
(81, '2019_12_20_061211_add_commission_rate_to_delivery_guy_details_table', 1),
(82, '2019_12_29_063818_create_modules_table', 1),
(83, '2019_12_29_233803_create_ratings_table', 1),
(84, '2019_12_30_235034_change_price_constraints_on_every_table_increase_limit', 1),
(85, '2020_01_05_223346_create_delivery_collections_table', 1),
(86, '2020_01_05_223712_create_delivery_collection_logs_table', 1),
(87, '2020_01_06_005737_create_restaurant_categories_table', 1),
(88, '2020_01_06_012659_create_restaurant_category_restaurant_table', 1),
(89, '2020_01_06_024126_create_restaurant_category_sliders_table', 1),
(90, '2020_01_12_225036_create_password_reset_otps_table', 1),
(91, '2020_01_26_055400_change_constraints_of_location_in_orders_table', 1),
(92, '2020_01_28_075230_add_short_name_and_code_to_modules_table', 1),
(93, '2020_02_03_223654_add_old_price_to_items_table', 1),
(94, '2020_02_07_003016_add_is_veg_to_items_table', 1),
(95, '2020_02_14_014122_add_heading_column_to_gps_tables', 1),
(96, '2020_03_13_234146_change_address_constraints_on_addresses_table', 1),
(97, '2020_03_31_001623_add_min_order_price_to_restaurants_table', 1),
(98, '2020_04_01_011619_create_alerts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 3),
(4, 'App\\User', 2),
(4, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_installed` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings_path` longtext COLLATE utf8mb4_unicode_ci,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `unique_order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderstatus_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `coupon_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` decimal(20,2) DEFAULT NULL,
  `restaurant_charge` decimal(20,2) DEFAULT NULL,
  `delivery_charge` decimal(20,2) DEFAULT NULL,
  `total` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_comment` longtext COLLATE utf8mb4_unicode_ci,
  `restaurant_id` int(11) DEFAULT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci,
  `delivery_type` int(11) NOT NULL DEFAULT '1',
  `payable` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderstatuses`
--

CREATE TABLE `orderstatuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderstatuses`
--

INSERT INTO `orderstatuses` (`id`, `name`) VALUES
(1, 'Ready For Pick Up'),
(2, 'Ready For Pick Up'),
(3, 'Ready For Pick Up'),
(4, 'Ready For Pick Up'),
(5, 'Ready For Pick Up');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_addons`
--

CREATE TABLE `order_item_addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `orderitem_id` int(11) NOT NULL,
  `addon_category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_otps`
--

CREATE TABLE `password_reset_otps` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `description`, `logo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'COD', 'Cash On Delivery Payment', NULL, 1, '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(2, 'Stripe', 'Online Payment with Stripe', NULL, 0, '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(3, 'Paypal', 'Paypal Express Checkout', NULL, 0, '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(4, 'PayStack', 'PayStack Payment Gateway', NULL, 0, '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(5, 'Razorpay', 'PayStack Payment Gateway', NULL, 0, '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(6, 'SISP', 'SISP CV VINTI4 VISA', NULL, 0, '2020-04-14 21:13:56', '2020-04-15 02:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popular_geo_places`
--

CREATE TABLE `popular_geo_places` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_geo_places`
--

INSERT INTO `popular_geo_places` (`id`, `name`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'São Filipe', '14.89511596', '-24.49893236', 1, '2020-04-15 01:40:44', '2020-04-15 01:40:44'),
(2, 'Mindelo', '40.7143528', '-74.02417565', 1, '2020-04-15 01:41:29', '2020-04-15 01:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `promo_sliders`
--

CREATE TABLE `promo_sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `position_id` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_sliders`
--

INSERT INTO `promo_sliders` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `location_id`, `position_id`, `size`) VALUES
(1, 'Teste', 0, '2020-04-15 02:31:43', '2020-04-15 02:35:41', 0, 0, 1),
(2, 'Testando', 1, '2020-04-15 02:33:39', '2020-04-15 02:35:44', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `push_tokens`
--

CREATE TABLE `push_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_tokens`
--

INSERT INTO `push_tokens` (`id`, `token`, `status`, `is_sent`, `is_active`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'djcLwsJqo8g:APA91bGXsuiaIh8WQ-AJUseBt7Lwl1ubcz_UNpms9rM3aUaBDEsoL-4S7tgALF1-hN7lRDrevGCMnZ_JNQNTgjY67R4lTXIe5bXPg3k30hGmsBPfuELZ5t_WC2R6czdyc9yN25GdtjBy', 0, 0, 1, 2, '2020-04-15 00:59:32', '2020-04-15 00:59:32'),
(2, 'c6iX3UXGp9U:APA91bH9dkVLdNIdWftf8wSjnMoRqsQfZrnjMR13s4dCZCbS7CRaNtQpX_lNv3M5YTsYd6zphNNtw-Qoy1X8bYiVRfvP-sZ6FnkzT6pR6f2M90i3St9Ze85TdgcWFFqtIAEITVt1TYUZ', 0, 0, 1, 4, '2020-04-15 01:43:54', '2020-04-15 02:41:41');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `rateable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pureveg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci,
  `placeholder_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_charges` decimal(20,2) DEFAULT NULL,
  `delivery_charges` decimal(20,2) DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` longtext COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `commission_rate` decimal(8,2) NOT NULL DEFAULT '0.00',
  `delivery_type` int(11) NOT NULL DEFAULT '1',
  `delivery_radius` decimal(8,2) NOT NULL DEFAULT '10.00',
  `delivery_charge_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FIXED',
  `base_delivery_charge` decimal(20,2) DEFAULT NULL,
  `base_delivery_distance` int(11) DEFAULT NULL,
  `extra_delivery_charge` decimal(20,2) DEFAULT NULL,
  `extra_delivery_distance` int(11) DEFAULT NULL,
  `min_order_price` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `location_id`, `image`, `rating`, `delivery_time`, `price_range`, `is_pureveg`, `created_at`, `updated_at`, `slug`, `placeholder_image`, `latitude`, `longitude`, `certificate`, `restaurant_charges`, `delivery_charges`, `address`, `pincode`, `landmark`, `sku`, `is_active`, `is_accepted`, `is_featured`, `commission_rate`, `delivery_type`, `delivery_radius`, `delivery_charge_type`, `base_delivery_charge`, `base_delivery_distance`, `extra_delivery_charge`, `extra_delivery_distance`, `min_order_price`) VALUES
(1, 'Churrasqueira Africana', 'Aberto das 08 as 18 hrs', NULL, '/assets/img/restaurants/15869035616ke9Z25oHL.jpg', '5', '40', '30', 1, '2020-04-15 01:32:41', '2020-04-15 02:45:17', 'churrasqueira-africana-9mL54DWMJXLDDsk', '/assets/img/restaurants/small/15869035616ke9Z25oHL-sm.jpg', '14.92078175', '-24.4415915', '1254858CMSF', 50.00, 150.00, 'Achada Pato', '0000-238', NULL, '1586903561uTomqvEzi1', 1, 1, 0, 2.00, 3, 50.00, 'FIXED', NULL, NULL, NULL, NULL, 500.00),
(2, 'Minimercado Tex', 'Aberto das 08 as 20 hrs', NULL, '/assets/img/restaurants/1586908209YPucRtch4Q.jpg', '5', '30', '30', 1, '2020-04-15 02:50:09', '2020-04-15 02:51:40', 'minimercado-tex-u4wjCJZ5ibIiiGe', '/assets/img/restaurants/small/1586908209YPucRtch4Q-sm.jpg', '14.90037264', '-24.49564397', '99999CMSF', NULL, 150.00, 'Xaguate', '8220', NULL, '1586908209wMkxdOhGAs', 1, 1, 0, 2.00, 3, 1.50, 'FIXED', NULL, NULL, NULL, NULL, 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_categories`
--

CREATE TABLE `restaurant_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_categories`
--

INSERT INTO `restaurant_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Restaurante', 1, '2020-04-15 01:36:33', '2020-04-15 01:36:33'),
(2, 'Mini-Mercado', 1, '2020-04-15 01:37:10', '2020-04-15 01:37:10'),
(3, 'Bebidas', 1, '2020-04-15 01:38:25', '2020-04-15 01:38:25'),
(4, 'Pizzaria', 1, '2020-04-15 01:38:38', '2020-04-15 01:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category_restaurant`
--

CREATE TABLE `restaurant_category_restaurant` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_category_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_category_restaurant`
--

INSERT INTO `restaurant_category_restaurant` (`id`, `restaurant_category_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category_sliders`
--

CREATE TABLE `restaurant_category_sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `image_placeholder` text COLLATE utf8mb4_unicode_ci,
  `categories_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_category_sliders`
--

INSERT INTO `restaurant_category_sliders` (`id`, `name`, `image`, `image_placeholder`, `categories_ids`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Restaurante', '/assets/img/slider/1586903864oaoeSyARLO.png', '/assets/img/slider/small/1586903864oaoeSyARLO-sm.png', '[\"1\"]', 1, '2020-04-15 01:37:44', '2020-04-15 01:37:44'),
(2, 'Mini-Mercado', '/assets/img/slider/1586903885LtyTYCCVWA.png', '/assets/img/slider/small/1586903885LtyTYCCVWA-sm.png', '[\"2\"]', 1, '2020-04-15 01:38:05', '2020-04-15 02:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_earnings`
--

CREATE TABLE `restaurant_earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `is_requested` tinyint(1) NOT NULL DEFAULT '0',
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_payout_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_payouts`
--

CREATE TABLE `restaurant_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `restaurant_earning_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` longtext COLLATE utf8mb4_unicode_ci,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_user`
--

CREATE TABLE `restaurant_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_user`
--

INSERT INTO `restaurant_user` (`id`, `user_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(2, 'Delivery Guy', 'web', '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(3, 'Restaurant Owner', 'web', '2020-04-14 21:13:56', '2020-04-14 21:13:56'),
(4, 'Customer', 'web', '2020-04-14 21:13:56', '2020-04-14 21:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'storeColor', '#fc8019'),
(2, 'splashLogo', 'splash.jpg?v=1586899656IYZhD'),
(3, 'firstScreenHeading', 'Order from top & favourite restaurants'),
(4, 'firstScreenSubHeading', 'Ready to see top restaurant to order?'),
(5, 'firstScreenSetupLocation', 'setup your location'),
(6, 'firstScreenLoginText', 'Have an account?'),
(7, 'footerNearme', 'Near Me'),
(8, 'footerExplore', 'Explore'),
(9, 'footerCart', 'Cart'),
(10, 'footerAccount', 'Account'),
(11, 'restaurantCountText', 'Restaurants Near You'),
(12, 'searchAreaPlaceholder', 'Search your area...'),
(13, 'searchPopularPlaces', 'Popular Places'),
(14, 'recommendedBadgeText', 'Recommended'),
(15, 'recommendedBadgeColor', '#d53d4c'),
(16, 'popularBadgeText', 'Popular'),
(17, 'popularBadgeColor', '#ff5722'),
(18, 'newBadgeText', 'New'),
(19, 'newBadgeColor', '#2196F3'),
(20, 'currencyFormat', '$'),
(21, 'currencyId', 'CVE'),
(22, 'cartColorBg', '#60b246'),
(23, 'cartColorText', '#ffffff'),
(24, 'cartEmptyText', 'Your Cart is Empty'),
(25, 'firstScreenHeroImage', 'assets/img/various/1586899689McbP5roJ6k.png?v=1586899689EIWzg'),
(26, 'restaurantSearchPlaceholder', 'Search for restaurants and items...'),
(27, 'accountManageAddress', 'Manage Address'),
(28, 'accountMyOrders', 'My Orders'),
(29, 'accountHelpFaq', 'Help & FAQs'),
(30, 'accountLogout', 'Logout'),
(31, 'cartMakePayment', 'Make Payment'),
(32, 'cartLoginHeader', 'Almost There'),
(33, 'cartLoginSubHeader', 'Login or Signup to place your order'),
(34, 'cartLoginButtonText', 'Continue'),
(35, 'cartDeliverTo', 'Deliver To'),
(36, 'cartChangeLocation', 'Change'),
(37, 'buttonNewAddress', 'New Address'),
(38, 'buttonSaveAddress', 'Save Address'),
(39, 'editAddressAddress', 'Flat/Apartment Number'),
(40, 'editAddressHouse', 'House / Flat No.'),
(41, 'editAddressLandmark', 'Landmark'),
(42, 'editAddressTag', 'Tag'),
(43, 'addressTagPlaceholder', 'Eg. Home, Work'),
(44, 'cartApplyCoupon', 'Apply Coupon'),
(45, 'cartInvalidCoupon', 'Invalid Coupon'),
(46, 'cartSuggestionPlaceholder', 'Suggestion for the restaurant...'),
(47, 'editAddressText', 'Edit'),
(48, 'deleteAddressText', 'Delete'),
(49, 'noAddressText', 'You don\'t have any saved addresses.'),
(50, 'cartSetAddressText', 'Set Your Address'),
(51, 'cartPageTitle', 'Cart'),
(52, 'checkoutPageTitle', 'Checkout'),
(53, 'checkoutPlaceOrder', 'Place Order'),
(54, 'runningOrderPlacedTitle', 'Order Placed Successfully'),
(55, 'runningOrderPlacedSub', 'Waiting for the restaurant to confirm your order'),
(56, 'runningOrderPreparingTitle', 'Chef at work!!'),
(57, 'runningOrderPreparingSub', 'Restaurant is preparing your order'),
(58, 'runningOrderOnwayTitle', 'Vroom Vroom!!'),
(59, 'runningOrderOnwaySub', 'Order has been picked up and is on its way'),
(60, 'runningOrderRefreshButton', 'Refresh Order Status'),
(61, 'noOrdersText', 'You have not placed any order yet.'),
(62, 'orderTextTotal', 'Total:'),
(63, 'checkoutPaymentListTitle', 'Select your prefered payment method'),
(64, 'checkoutSelectPayment', 'Select Payment Method'),
(65, 'mapApiKey', NULL),
(66, 'storeName', 'DICASA'),
(67, 'storeLogo', 'logo.png?v=1586899606DvIyn'),
(68, 'runningOrderDeliveryAssignedTitle', 'Delivery Guy Assigned'),
(69, 'runningOrderDeliveryAssignedSub', 'On the way to pick up your order.'),
(70, 'runningOrderCanceledTitle', 'Order Canceled'),
(71, 'runningOrderCanceledSub', 'Sorry. Your order has been canceled.'),
(72, 'stripePublicKey', NULL),
(73, 'stripeSecretKey', NULL),
(74, 'firstScreenWelcomeMessage', 'Welcome,'),
(75, 'firstScreenLoginBtn', 'Login'),
(76, 'loginErrorMessage', 'Woopss!! Something went wrong. Please try again.'),
(77, 'pleaseWaitText', 'Please Wait...'),
(78, 'loginLoginTitle', 'LOGIN'),
(79, 'loginLoginSubTitle', 'Enter your email and password'),
(80, 'loginLoginEmailLabel', 'Email'),
(81, 'loginLoginPasswordLabel', 'Password'),
(82, 'homePageMinsText', 'MINS'),
(83, 'homePageForTwoText', 'FOR TWO'),
(84, 'itemsPageRecommendedText', 'RECOMMENDED'),
(85, 'floatCartItemsText', 'Items'),
(86, 'floatCartViewCartText', 'View Cart'),
(87, 'cartItemsInCartText', 'Items in Cart'),
(88, 'cartBillDetailsText', 'Bill Details'),
(89, 'cartItemTotalText', 'Item Total'),
(90, 'cartRestaurantCharges', 'Restaurant Charges'),
(91, 'cartDeliveryCharges', 'Delivery Charges'),
(92, 'cartCouponText', 'Coupon'),
(93, 'cartToPayText', 'To Pay'),
(94, 'cartSetYourAddress', 'Set Your Address'),
(95, 'checkoutPaymentInProcess', 'Payment in process. Do not hit refresh or go back.'),
(96, 'checkoutStripeText', 'Stripe'),
(97, 'checkoutStripeSubText', 'Online Payment'),
(98, 'checkoutCodText', 'COD'),
(99, 'checkoutCodSubText', 'Cash On Delivery'),
(100, 'showPromoSlider', 'true'),
(101, 'loginLoginPhoneLabel', 'Phone'),
(102, 'loginLoginNameLabel', 'Name'),
(103, 'registerErrorMessage', 'Woppss!! Something went wrong. Please try again.'),
(104, 'registerRegisterTitle', 'Register'),
(105, 'registerRegisterSubTitle', 'Regsiter now for free'),
(106, 'firstScreenRegisterBtn', 'Register'),
(107, 'loginDontHaveAccount', 'Don\'t have an account yet? '),
(108, 'regsiterAlreadyHaveAccount', 'Already have an account? '),
(109, 'favicon-16x16', 'favicon-16x16.png?v=1586899630iWK8S'),
(110, 'favicon-32x32', 'favicon-32x32.png?v=1586899630jwUvU'),
(111, 'favicon-96x96', 'favicon-96x96.png?v=1586899630c4VVA'),
(112, 'favicon-128x128', 'favicon-128x128.png?v=1586899630VcgDs'),
(113, 'storeEmail', 'fogosolucoes@gmail.com'),
(114, 'seoMetaTitle', 'DICASA'),
(115, 'seoMetaDescription', NULL),
(116, 'storeUrl', 'https://cliente181.dicasa.cv'),
(117, 'twitterUsername', 'twitter-username'),
(118, 'seoOgTitle', NULL),
(119, 'seoOgDescription', NULL),
(120, 'seoTwitterTitle', NULL),
(121, 'seoTwitterDescription', NULL),
(122, 'seoOgImage', NULL),
(123, 'seoTwitterImage', NULL),
(124, 'accountMyAccount', 'My Account'),
(125, 'desktopHeading', 'Order from restaurants near you'),
(126, 'desktopSubHeading', 'Easy way to get the food you love delivered.\r\nWe bring food from the best restaurants and desserts to your doorstep. We have <b style=\"\">hundreds</b> of restaurants to choose from.'),
(127, 'desktopUseAppButton', 'Use App'),
(128, 'desktopAchievementOneTitle', 'Restaurants'),
(129, 'desktopAchievementOneSub', '2300+'),
(130, 'desktopAchievementTwoTitle', 'Items'),
(131, 'desktopAchievementTwoSub', '65000+'),
(132, 'desktopAchievementThreeTitle', 'Customers'),
(133, 'desktopAchievementThreeSub', '1M+'),
(134, 'desktopAchievementFourTitle', 'Deliveries'),
(135, 'desktopAchievementFourSub', '5M+'),
(136, 'desktopSocialFacebookLink', 'https://www.facebook.com'),
(137, 'desktopSocialGoogleLink', 'https://www.google.com'),
(138, 'desktopSocialYoutubeLink', NULL),
(139, 'desktopSocialInstagramLink', 'https://www.instagram.com'),
(140, 'desktopFooterSocialHeader', 'We Are Social'),
(141, 'desktopFooterAddress', '#1201, Someplace, Near Somewhere'),
(142, 'runningOrderDeliveryPin', 'Delivery Pin: '),
(143, 'deliveryNoOrdersAccepted', 'No Orders Accepted Yet'),
(144, 'deliveryNoNewOrders', 'No New Orders Yet'),
(145, 'firstScreenHeroImageSm', 'assets/img/various/1586899689McbP5roJ6k-sm.png?v=1586899689lQCzJ'),
(146, 'showMap', 'true'),
(147, 'paypalEnv', 'sandbox'),
(148, 'paypalSandboxKey', NULL),
(149, 'paypalProductionKey', NULL),
(150, 'enablePushNotification', 'true'),
(151, 'enablePushNotificationOrders', 'true'),
(152, 'firebaseSenderId', '252526736999'),
(153, 'firebaseSecret', 'AAAAOsvENmc:APA91bGmRePsFZIZKm3rKHCa5J63Zlff6UpauL_H_l3N0rpFquT4KFe6Sk1mqbFaW3LS_YUZDwygf08KOu4VD-u6jMRoNmYPOw15s2kzOl-OoW_f68zrUulkPxzBUoRhyUnaEZsqDsKU'),
(154, 'runningOrderDelivered', 'Order Delivered'),
(155, 'runningOrderDeliveredSub', 'The order has been delivered to you. Enjoy.'),
(156, 'showGdpr', 'false'),
(157, 'gdprMessage', 'We use Cookies to give you the best possible service. By continuing to browse our site you are agreeing to our use of Cookies'),
(158, 'gdprConfirmButton', 'Okay'),
(159, 'restaurantFeaturedText', 'Featured'),
(160, 'deliveryNewOrdersTitle', 'New Orders'),
(161, 'deliveryAcceptedOrdersTitle', 'Accepted Orders'),
(162, 'deliveryWelcomeMessage', 'Welcome'),
(163, 'deliveryOrderItems', 'Order Items'),
(164, 'deliveryRestaurantAddress', 'Restaurant Address'),
(165, 'deliveryGetDirectionButton', 'Get Direction'),
(166, 'deliveryDeliveryAddress', 'Delivery Address'),
(167, 'deliveryOnlinePayment', 'Online Payment'),
(168, 'deliveryDeliveryPinPlaceholder', 'ENTER DELIVERY PIN'),
(169, 'deliveryAcceptOrderButton', 'Accept'),
(170, 'deliveryPickedUpButton', 'Picked Up'),
(171, 'deliveryDeliveredButton', 'Delivered'),
(172, 'deliveryOrderCompletedButton', 'Order Completed'),
(173, 'deliveryInvalidDeliveryPin', 'Incorrect delivery pin. Please try again.'),
(174, 'deliveryAlreadyAccepted', 'This delivery has been accepted by someone else.'),
(175, 'deliveryLogoutDelivery', 'Logout Delivery'),
(176, 'enableGoogleAnalytics', 'false'),
(177, 'googleAnalyticsId', NULL),
(178, 'taxApplicable', 'false'),
(179, 'taxPercentage', NULL),
(180, 'firebasePublic', 'BKsIZKDrrDzgfCqzyDpGM5R1GXBxOCDG7xUBimo3iEks51TtVgLO664FSfGG7OhA3mEMwXn3Hx25lJL4vkqKe2I'),
(181, 'deliveryLogoutConfirmation', 'Are you sure?'),
(182, 'customizationHeading', 'Customizations'),
(183, 'customizableItemText', 'Customizable'),
(184, 'customizationDoneBtnText', 'Continue'),
(185, 'paystackPublicKey', 'pk_test_ecf3496bdf36bced2112a502f5f5bb96e1340124'),
(186, 'paystackPrivateKey', NULL),
(187, 'paystackPayText', 'PAY WITH PAYSLACK'),
(188, 'minPayout', '150'),
(189, 'enableFacebookLogin', 'true'),
(190, 'facebookAppId', '520242912197231'),
(191, 'facebookLoginButtonText', 'Login with Facebook'),
(192, 'enableGoogleLogin', 'true'),
(193, 'googleAppId', '571273657231-in3cpnhojppe3bi365ag4ogtcheab20b.apps.googleusercontent.com'),
(194, 'googleLoginButtonText', 'Login with Google'),
(195, 'customCSS', NULL),
(196, 'enSOV', 'true'),
(197, 'twilioSid', 'AC1b6016e84a71ad6b49ddb85d0366752b'),
(198, 'twilioAccessToken', 'af2bc1f2ff476d0a806d485beb90bf23'),
(199, 'twilioServiceId', 'VAb6cc75cf566e96ca12db6d7578d4c288'),
(200, 'fieldValidationMsg', 'This is a required field.'),
(201, 'nameValidationMsg', 'Please enter your full name.'),
(202, 'emailValidationMsg', 'Please enter a valid email.'),
(203, 'phoneValidationMsg', 'Please enter a phone number in this format: +1123456789'),
(204, 'minimumLengthValidationMessage', 'This field must be at least 8 characters long.'),
(205, 'emailPhoneAlreadyRegistered', 'Email or Phone has already been registered.'),
(206, 'enterPhoneToVerify', 'Please enter your phone number to verify'),
(207, 'invalidOtpMsg', 'Invalid OTP. Please check and try again.'),
(208, 'otpSentMsg', 'An OTP has been sent to '),
(209, 'resendOtpMsg', 'Resend OTP to '),
(210, 'resendOtpCountdownMsg', 'Resend OTP in '),
(211, 'verifyOtpBtnText', 'Verify OTP'),
(212, 'socialWelcomeText', 'Hi '),
(213, 'emailPassDonotMatch', 'Email & Password do not match.'),
(214, 'enSPU', 'true'),
(215, 'runningOrderReadyForPickup', 'Food is Ready'),
(216, 'runningOrderReadyForPickupSub', 'Your order is ready for self pickup.'),
(217, 'deliveryTypeDelivery', 'Delivery'),
(218, 'deliveryTypeSelfPickup', 'Self Pickup'),
(219, 'noRestaurantMessage', 'No restaurants are available.'),
(220, 'selectedSelfPickupMessage', 'You have selected Self Pickup.'),
(221, 'vehicleText', 'Vehicle:'),
(222, 'deliveryGuyAfterName', 'is your delivery valet today.'),
(223, 'callNowButton', 'Call Now'),
(224, 'enableGoogleAPI', 'false'),
(225, 'checkoutRazorpayText', 'Razorpay'),
(226, 'checkoutRazorpaySubText', 'Pay with cards, wallet or UPI'),
(227, 'razorpayKeyId', 'rzp_test_VWcp86nfU6T7rV'),
(228, 'razorpayKeySecret', 'eLzMBr1cycRG0iEjgMptgjMs'),
(229, 'allowLocationAccessMessage', 'Kindly allow location access for live tracking.'),
(230, 'enableDeliveryPin', 'true'),
(231, 'deliveryOrdersRefreshBtn', 'Refresh'),
(232, 'restaurantAcceptTimeThreshold', '10'),
(233, 'deliveryAcceptTimeThreshold', '45'),
(234, 'taxText', 'Tax'),
(235, 'itemsRemovedMsg', 'Items added from the previous restaurant have been removed.'),
(236, 'ongoingOrderMsg', 'You have some on-going orders. VIEW'),
(237, 'trackOrderText', 'Track Order'),
(238, 'orderPlacedStatusText', 'Order Placed'),
(239, 'preparingOrderStatusText', 'Preparing Order'),
(240, 'deliveryGuyAssignedStatusText', 'Delivery Guy Assigned'),
(241, 'orderPickedUpStatusText', 'Order Picked Up'),
(242, 'deliveredStatusText', 'Delivered'),
(243, 'canceledStatusText', 'Canceled'),
(244, 'readyForPickupStatusText', 'Ready For Pickup'),
(245, 'pureVegText', 'Pure Veg'),
(246, 'certificateCodeText', 'Certificate Code: '),
(247, 'showMoreButtonText', 'Show More'),
(248, 'showLessButtonText', 'Show Less'),
(249, 'walletName', 'Wallet'),
(250, 'accountMyWallet', 'My Wallet'),
(251, 'noWalletTransactionsText', 'No Wallet Transactions Yet!!!'),
(252, 'walletDepositText', 'Deposit'),
(253, 'walletWithdrawText', 'Withdraw'),
(254, 'payPartialWithWalletText', 'Pay partial amount with wallet'),
(255, 'willbeDeductedText', 'will be deducted from your balance of'),
(256, 'payFullWithWalletText', 'Pay full amount with Wallet.'),
(257, 'orderPaymentWalletComment', 'Payment for order:'),
(258, 'orderPartialPaymentWalletComment', 'Partial payment for order:'),
(259, 'orderRefundWalletComment', 'Refund for order cancellation.'),
(260, 'orderPartialRefundWalletComment', 'Partial Refund for order cancellation.'),
(261, 'enDevMode', 'true'),
(262, 'walletRedeemBtnText', 'Redeem'),
(263, 'restaurantNewOrderNotificationMsg', 'A New Order has Arrived !!!'),
(264, 'restaurantNewOrderNotificationMsgSub', 'New Order Notification'),
(265, 'deliveryGuyNewOrderNotificationMsg', 'A New Order is Waiting !!!'),
(266, 'deliveryGuyNewOrderNotificationMsgSub', 'New Order Notification'),
(267, 'firebaseSDKSnippet', 'const firebaseConfig = {\r\n  apiKey: \"AIzaSyD4Ej2xKq-xJWbhp-QgzEGOLdo2CpC__yQ\",\r\n  authDomain: \"fogo-solucoes-notificacoes.firebaseapp.com\",\r\n  databaseURL: \"https://fogo-solucoes-notificacoes.firebaseio.com\",\r\n  projectId: \"fogo-solucoes-notificacoes\",\r\n  storageBucket: \"fogo-solucoes-notificacoes.appspot.com\",\r\n  messagingSenderId: \"252526736999\",\r\n  appId: \"1:252526736999:web:48784356d40a19b95646c2\",\r\n  measurementId: \"G-8DZB63RJGK\"\r\n};'),
(268, 'cartCouponOffText', 'OFF'),
(269, 'willBeRefundedText', 'will be refunded back to your wallet.'),
(270, 'willNotBeRefundedText', 'No Refund will be made to your wallet as the restaurant has already prepared the order.'),
(271, 'cartRestaurantNotOperational', 'Restaurant is not operational on your selected location.'),
(272, 'addressDoesnotDeliverToText', 'Does not deliver to'),
(273, 'googleApiKey', 'AIzaSyAUD9FO3-2hHoXNVGPiUsdpp-8_VIaimGo'),
(274, 'useCurrentLocationText', 'Use Current Location'),
(275, 'gpsAccessNotGrantedMsg', 'GPS access is not granted or was denied.'),
(276, 'yourLocationText', 'YOUR LOCATION'),
(277, 'notAcceptingOrdersMsg', 'Currently Not Accepting Any Orders'),
(278, 'exploreRestautantsText', 'RESTAURANTS'),
(279, 'exploreItemsText', 'ITEMS'),
(280, 'hidePriceWhenZero', 'true'),
(281, 'phoneCountryCode', '+238'),
(282, 'orderCancellationConfirmationText', 'Do you want to cancel this order?'),
(283, 'yesCancelOrderBtn', 'Yes, Cancel Order'),
(284, 'cancelGoBackBtn', 'Go back'),
(285, 'cancelOrderMainButton', 'Cancel Order'),
(286, 'deliveryOrderPlacedText', 'Order Placed'),
(287, 'deliveryCashOnDelivery', 'Cash On Delivery'),
(288, 'socialLoginOrText', 'OR'),
(289, 'orderCancelledText', 'Order Cancelled'),
(290, 'searchAtleastThreeCharsMsg', 'Enter at least 3 characters to search.'),
(291, 'multiLanguageSelection', 'true'),
(292, 'changeLanguageText', 'Change Language'),
(293, 'deliveryFooterNewTitle', 'New Orders'),
(294, 'deliveryFooterAcceptedTitle', 'Accepted'),
(295, 'deliveryFooterAccount', 'Account'),
(296, 'enableDeliveryGuyEarning', 'false'),
(297, 'deliveryGuyCommissionFrom', 'FULLORDER'),
(298, 'deliveryEarningsText', 'Earnings'),
(299, 'deliveryOnGoingText', 'On-Going'),
(300, 'deliveryCompletedText', 'Completed'),
(301, 'deliveryCommissionMessage', 'Commission for order: '),
(302, 'itemSearchText', 'Search results for: '),
(303, 'itemSearchNoResultText', 'No results found for: '),
(304, 'itemSearchPlaceholder', 'Search for items...'),
(305, 'googleApiKeyIP', 'AIzaSyDfRWoPOtgdBggoS-IkN4kvLAooqAnYqVE'),
(306, 'itemsMenuButtonText', 'MENU'),
(307, 'enPassResetEmail', 'false'),
(308, 'mail_host', NULL),
(309, 'mail_port', NULL),
(310, 'mail_username', NULL),
(311, 'mail_password', NULL),
(312, 'mail_encryption', 'SSL'),
(313, 'enRestaurantCategorySlider', 'true'),
(314, 'restaurantCategorySliderPosition', '1'),
(315, 'restaurantCategorySliderSize', '2'),
(316, 'showRestaurantCategorySliderLabel', 'true'),
(317, 'restaurantCategorySliderStyle', '0.4'),
(318, 'enRAR', 'true'),
(319, 'rarModEnHomeBanner', 'true'),
(320, 'rarModShowBannerRestaurantName', 'true'),
(321, 'rarModHomeBannerPosition', '2'),
(322, 'rarModHomeBannerBgColor', 'rgb(255, 235, 59)'),
(323, 'rarModHomeBannerTextColor', 'rgb(0, 0, 0)'),
(324, 'rarModHomeBannerStarsColor', 'rgb(255, 162, 0)'),
(325, 'rarModHomeBannerText', 'Rate and Review'),
(326, 'rarModRatingPageTitle', 'Rate Your Order'),
(327, 'rarModDeliveryRatingTitle', 'Rate the Delivery'),
(328, 'rarModRestaurantRatingTitle', 'Rate the Restaurant'),
(329, 'rarReviewBoxTitle', 'Your Feedback'),
(330, 'rarReviewBoxTextPlaceHolderText', 'Write your feedback here (optional)'),
(331, 'rarSubmitButtonText', 'Submit'),
(332, 'showPercentageDiscount', 'true'),
(333, 'itemPercentageDiscountText', '% OFF'),
(334, 'showVegNonVegBadge', 'true'),
(335, 'exploreNoResults', 'No Items or Restaurants Found'),
(336, 'updatingMessage', 'Updating System'),
(337, 'userNotFoundErrorMessage', 'No user found with this email.'),
(338, 'invalidOtpErrorMessage', 'Invalid OTP Entered'),
(339, 'resetPasswordPageTitle', 'Reset Password'),
(340, 'resetPasswordPageSubTitle', 'Enter your email address to continue'),
(341, 'sendOtpOnEmailButtonText', 'Send OTP on Email'),
(342, 'alreadyHaveResetOtpButtonText', 'I already have an OTP'),
(343, 'enterResetOtpMessageText', 'Enter the OTP sent to you email'),
(344, 'verifyResetOtpButtonText', 'Verify OTP'),
(345, 'dontHaveResetOtpButtonText', 'I dont have an OTP'),
(346, 'enterNewPasswordText', 'Please enter a new password below'),
(347, 'newPasswordLabelText', 'New Password'),
(348, 'setNewPasswordButtonText', 'Set New Password'),
(349, 'exlporeByRestaurantText', 'By'),
(350, 'forgotPasswordLinkText', 'Forgot Password?'),
(351, 'categoriesNoRestaurantsFoundText', 'No Restaurants Found'),
(352, 'categoriesFiltersText', 'Filters'),
(353, 'sendEmailFromEmailAddress', 'do-not-reply@foodomaa.com'),
(354, 'sendEmailFromEmailName', 'Foodomaa'),
(355, 'passwordResetEmailSubject', 'Reset Password OTP'),
(356, 'registrationPolicyMessage', NULL),
(357, 'locationSavedAddresses', 'Saved Addresses'),
(358, 'restaurantMinOrderMessage', 'Min cart value should be atleast '),
(359, 'footerAlerts', 'Alerts'),
(360, 'showFromNowDate', 'true'),
(361, 'markAllAlertReadText', 'Mark all read'),
(362, 'noNewAlertsText', 'No new alerts'),
(363, 'currencySymbolAlign', 'right');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_slider_id` int(11) NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `image_placeholder` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `promo_slider_id`, `unique_id`, `name`, `image`, `image_placeholder`, `url`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, 'terere', '/assets/img/slider/15869072390aLPMeN23m.jpg', '/assets/img/slider/small/15869072390aLPMeN23m-sm.jpg', 'restaurants/churrasqueira-africana-9mL54DWMJXLDDsk', 1, '2020-04-15 02:33:59', '2020-04-15 02:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` int(10) UNSIGNED NOT NULL,
  `withdraw_id` int(10) UNSIGNED NOT NULL,
  `discount` bigint(20) NOT NULL DEFAULT '0',
  `fee` bigint(20) NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `language_name`, `data`, `created_at`, `updated_at`, `is_default`, `is_active`) VALUES
(1, 'English', '{\r\n	\"desktopHeading\": \"Order from restaurants near you\",\r\n	\"desktopSubHeading\": \"Foodoma is the easy way to get the food you love delivered.\\r\\nWe bring food from the best restaurants and desserts to your doorstep. We have <b style=\\\"\\\">hundreds</b> of restaurants to choose from.\",\r\n	\"desktopUseAppButton\": \"Use App Now\",\r\n	\"desktopAchievementOneTitle\": \"Restaurants\",\r\n	\"desktopAchievementOneSub\": \"2300+\",\r\n	\"desktopAchievementTwoTitle\": \"Items\",\r\n	\"desktopAchievementTwoSub\": \"65000+\",\r\n	\"desktopAchievementThreeTitle\": \"Customers\",\r\n	\"desktopAchievementThreeSub\": \"1M+\",\r\n	\"desktopAchievementFourTitle\": \"Deliveries\",\r\n	\"desktopAchievementFourSub\": \"5M+\",\r\n	\"desktopFooterAddress\": \"<p>#1201, Someplace, Near Somewhere</p><p><a href=\\\"/pages/hello-world\\\" target=\\\"_blank\\\">Cookie Policy</a><br></p>\",\r\n	\"desktopFooterSocialHeader\": \"We Are Social\",\r\n	\"desktopSocialFacebookLink\": \"https://www.facebook.com\",\r\n	\"desktopSocialGoogleLink\": \"https://www.google.com\",\r\n	\"desktopSocialYoutubeLink\": null,\r\n	\"desktopSocialInstagramLink\": \"https://www.instagram.com\",\r\n	\"gdprMessage\": \"<p>We use Cookies to give you the best possible service. By continuing to browse our site you are agreeing to our use of <b>Cookies.&nbsp;</b></p>\",\r\n	\"gdprConfirmButton\": \"Okay\",\r\n	\"changeLanguageText\": \"Change Language\",\r\n	\"firstScreenHeading\": \"Order from top & favourite restaurants\",\r\n	\"firstScreenSubHeading\": \"Ready to see top restaurant to order?\",\r\n	\"firstScreenSetupLocation\": \"setup your location\",\r\n	\"firstScreenWelcomeMessage\": \"Welcome,\",\r\n	\"firstScreenLoginText\": \"Have an account?\",\r\n	\"firstScreenLoginBtn\": \"Login\",\r\n	\"loginErrorMessage\": \"Woopss!! Something went wrong. Please try again.\",\r\n	\"pleaseWaitText\": \"Please Wait...\",\r\n	\"loginLoginTitle\": \"LOGIN\",\r\n	\"loginLoginSubTitle\": \"Enter your email and password\",\r\n	\"loginLoginEmailLabel\": \"Email\",\r\n	\"loginLoginPasswordLabel\": \"Password\",\r\n	\"loginDontHaveAccount\": \"Don\'t have an account yet?\",\r\n	\"firstScreenRegisterBtn\": \"Register\",\r\n	\"registerRegisterTitle\": \"Register\",\r\n	\"registerRegisterSubTitle\": \"Regsiter now for free\",\r\n	\"loginLoginNameLabel\": \"Name\",\r\n	\"loginLoginPhoneLabel\": \"Phone\",\r\n	\"regsiterAlreadyHaveAccount\": \"Already have an account?\",\r\n	\"fieldValidationMsg\": \"This is a required field.\",\r\n	\"nameValidationMsg\": \"Please enter your full name.\",\r\n	\"emailValidationMsg\": \"Please enter a valid email.\",\r\n	\"phoneValidationMsg\": \"Please enter a phone number in this format: +1123456789\",\r\n	\"minimumLengthValidationMessage\": \"This field must be at least 8 characters long.\",\r\n	\"emailPhoneAlreadyRegistered\": \"Email or Phone has already been registered.\",\r\n	\"emailPassDonotMatch\": \"Email & Password do not match.\",\r\n	\"enterPhoneToVerify\": \"Please enter your phone number to verify\",\r\n	\"invalidOtpMsg\": \"Invalid OTP. Please check and try again.\",\r\n	\"otpSentMsg\": \"An OTP has been sent to\",\r\n	\"resendOtpMsg\": \"Resend OTP to\",\r\n	\"resendOtpCountdownMsg\": \"Resend OTP in\",\r\n	\"verifyOtpBtnText\": \"Verify OTP\",\r\n	\"socialWelcomeText\": \"Hi\",\r\n	\"socialLoginOrText\": \"OR\",\r\n	\"deliveryTypeDelivery\": \"Delivery\",\r\n	\"deliveryTypeSelfPickup\": \"Self Pickup\",\r\n	\"noRestaurantMessage\": \"No restaurants are available.\",\r\n	\"restaurantCountText\": \"Restaurants Near You\",\r\n	\"restaurantFeaturedText\": \"Featured\",\r\n	\"homePageMinsText\": \"MINS\",\r\n	\"homePageForTwoText\": \"FOR TWO\",\r\n	\"footerNearme\": \"Near Me\",\r\n	\"footerExplore\": \"Explore\",\r\n	\"footerCart\": \"Cart\",\r\n	\"footerAccount\": \"Account\",\r\n	\"restaurantSearchPlaceholder\": \"Search for restaurants\",\r\n	\"exploreRestautantsText\": \"RESTAURANTS\",\r\n	\"exploreItemsText\": \"ITEMS\",\r\n	\"searchAtleastThreeCharsMsg\": \"Enter at least 3 characters to search.\",\r\n	\"recommendedBadgeText\": \"Recommended\",\r\n	\"popularBadgeText\": \"Popular\",\r\n	\"newBadgeText\": \"New\",\r\n	\"itemsPageRecommendedText\": \"RECOMMENDED\",\r\n	\"floatCartViewCartText\": \"View Cart\",\r\n	\"floatCartItemsText\": \"Items\",\r\n	\"customizableItemText\": \"Customizable\",\r\n	\"customizationHeading\": \"Customizations\",\r\n	\"customizationDoneBtnText\": \"Continue\",\r\n	\"pureVegText\": \"Pure Veg\",\r\n	\"certificateCodeText\": \"Certificate Code:\",\r\n	\"showMoreButtonText\": \"Show More\",\r\n	\"showLessButtonText\": \"Show Less\",\r\n	\"notAcceptingOrdersMsg\": \"Currently Not Accepting Any Orders\",\r\n	\"cartPageTitle\": \"Cart\",\r\n	\"cartItemsInCartText\": \"Items in Cart\",\r\n	\"cartEmptyText\": \"Your Cart is Empty\",\r\n	\"cartSuggestionPlaceholder\": \"Write your comment/suggestion for the restaurant...\",\r\n	\"cartCouponText\": \"Coupon\",\r\n	\"cartApplyCoupon\": \"Coupon Applied\",\r\n	\"cartInvalidCoupon\": \"Invalid Coupon\",\r\n	\"cartCouponOffText\": \"OFF\",\r\n	\"cartBillDetailsText\": \"Bill Details\",\r\n	\"cartItemTotalText\": \"Item Total\",\r\n	\"cartToPayText\": \"To Pay\",\r\n	\"cartDeliveryCharges\": \"Delivery Charges\",\r\n	\"cartRestaurantCharges\": \"Restaurant Charges\",\r\n	\"cartSetYourAddress\": \"Set Your Address\",\r\n	\"buttonNewAddress\": \"New Address\",\r\n	\"cartChangeLocation\": \"Change\",\r\n	\"cartDeliverTo\": \"Deliver To\",\r\n	\"checkoutSelectPayment\": \"Proceed to Checkout\",\r\n	\"cartLoginHeader\": \"Almost There\",\r\n	\"cartLoginSubHeader\": \"Login or Signup to place your order\",\r\n	\"cartLoginButtonText\": \"Continue\",\r\n	\"selectedSelfPickupMessage\": \"You have selected Self Pickup.\",\r\n	\"taxText\": \"Tax\",\r\n	\"itemsRemovedMsg\": \"Items added from the previous restaurant have been removed.\",\r\n	\"ongoingOrderMsg\": \"You have some on-going orders. VIEW\",\r\n	\"cartRestaurantNotOperational\": \"Restaurant is not operational on your selected location.\",\r\n	\"checkoutPageTitle\": \"Checkout\",\r\n	\"checkoutPaymentListTitle\": \"Select your prefered payment method\",\r\n	\"checkoutPaymentInProcess\": \"Payment in process. Do not hit refresh or go back.\",\r\n	\"checkoutStripeText\": \"Stripe\",\r\n	\"checkoutStripeSubText\": \"Online Payment\",\r\n	\"checkoutCodText\": \"COD\",\r\n	\"checkoutCodSubText\": \"Cash On Delivery\",\r\n	\"paystackPayText\": \"Pay with PayStack\",\r\n	\"checkoutRazorpayText\": \"Razorpay\",\r\n	\"checkoutRazorpaySubText\": \"Pay with cards, wallet or UPI\",\r\n	\"runningOrderPlacedTitle\": \"Order Placed Successfully\",\r\n	\"runningOrderPlacedSub\": \"Waiting for the restaurant to confirm your order\",\r\n	\"runningOrderPreparingTitle\": \"Chef at work!!\",\r\n	\"runningOrderPreparingSub\": \"Restaurant is preparing your order\",\r\n	\"runningOrderOnwayTitle\": \"Vroom Vroom!!\",\r\n	\"runningOrderOnwaySub\": \"Order has been picked up and is on its way\",\r\n	\"runningOrderDeliveryAssignedTitle\": \"Delivery Guy Assigned\",\r\n	\"runningOrderDeliveryAssignedSub\": \"On the way to pick up your order.\",\r\n	\"runningOrderCanceledTitle\": \"Order Canceled\",\r\n	\"runningOrderCanceledSub\": \"Sorry. Your order has been canceled.\",\r\n	\"runningOrderReadyForPickup\": \"Food is Ready\",\r\n	\"runningOrderReadyForPickupSub\": \"Your order is ready for self pickup.\",\r\n	\"runningOrderDelivered\": \"Order Delivered\",\r\n	\"runningOrderDeliveredSub\": \"The order has been delivered to you. Enjoy.\",\r\n	\"runningOrderRefreshButton\": \"Refresh Order Status\",\r\n	\"deliveryGuyAfterName\": \"is your delivery valet today.\",\r\n	\"vehicleText\": \"Vehicle:\",\r\n	\"callNowButton\": \"Call Now\",\r\n	\"allowLocationAccessMessage\": \"Kindly allow location access for live tracking.\",\r\n	\"trackOrderText\": \"Track Order\",\r\n	\"orderPlacedStatusText\": \"Order Placed\",\r\n	\"preparingOrderStatusText\": \"Preparing Order\",\r\n	\"deliveryGuyAssignedStatusText\": \"Delivery Guy Assigned\",\r\n	\"orderPickedUpStatusText\": \"Order Picked Up\",\r\n	\"deliveredStatusText\": \"Delivered\",\r\n	\"canceledStatusText\": \"Canceled\",\r\n	\"readyForPickupStatusText\": \"Ready For Pickup\",\r\n	\"restaurantNewOrderNotificationMsg\": \"A New Order has Arrived !!!\",\r\n	\"restaurantNewOrderNotificationMsgSub\": \"New Order Notification\",\r\n	\"deliveryGuyNewOrderNotificationMsg\": \"A New Order is Waiting !!!\",\r\n	\"deliveryGuyNewOrderNotificationMsgSub\": \"New Order Notification\",\r\n	\"runningOrderDeliveryPin\": \"Delivery Pin:\",\r\n	\"accountMyAccount\": \"My Account\",\r\n	\"accountManageAddress\": \"Manage Address\",\r\n	\"addressDoesnotDeliverToText\": \"Does not deliver to\",\r\n	\"accountMyOrders\": \"My Orders\",\r\n	\"accountHelpFaq\": \"Help & FAQs\",\r\n	\"accountLogout\": \"Logout\",\r\n	\"accountMyWallet\": \"My Wallet\",\r\n	\"noOrdersText\": \"You have not placed any order yet.\",\r\n	\"orderCancelledText\": \"Order Cancelled\",\r\n	\"searchAreaPlaceholder\": \"Search your area...\",\r\n	\"searchPopularPlaces\": \"Popular Places\",\r\n	\"useCurrentLocationText\": \"Use Current Location\",\r\n	\"gpsAccessNotGrantedMsg\": \"GPS access is not granted or was denied.\",\r\n	\"yourLocationText\": \"YOUR LOCATION\",\r\n	\"editAddressAddress\": \"Apartment/Flat Number\",\r\n	\"editAddressTag\": \"Tag\",\r\n	\"addressTagPlaceholder\": \"Eg. Home, Work\",\r\n	\"buttonSaveAddress\": \"Save Address\",\r\n	\"deleteAddressText\": \"Delete\",\r\n	\"noWalletTransactionsText\": \"No Wallet Transactions Yet!!!\",\r\n	\"walletDepositText\": \"Deposit\",\r\n	\"walletWithdrawText\": \"Withdraw\",\r\n	\"payPartialWithWalletText\": \"Pay partial amount with wallet\",\r\n	\"willbeDeductedText\": \"will be deducted from your balance of\",\r\n	\"payFullWithWalletText\": \"Pay full amount with Wallet.\",\r\n	\"orderPaymentWalletComment\": \"Payment for order:\",\r\n	\"orderPartialPaymentWalletComment\": \"Partial payment for order:\",\r\n	\"orderRefundWalletComment\": \"Refund for order cancellation.\",\r\n	\"orderPartialRefundWalletComment\": \"Partial Refund for order cancellation.\",\r\n	\"walletRedeemBtnText\": \"Redeem\",\r\n	\"cancelOrderMainButton\": \"Cancel Order\",\r\n	\"willBeRefundedText\": \"will be refunded back to your wallet.\",\r\n	\"willNotBeRefundedText\": \"No Refund will be made to your wallet as the restaurant has already prepared the order.\",\r\n	\"orderCancellationConfirmationText\": \"Do you want to cancel this order?\",\r\n	\"yesCancelOrderBtn\": \"Yes, Cancel Order\",\r\n	\"cancelGoBackBtn\": \"Go back\",\r\n	\"deliveryWelcomeMessage\": \"Welcome\",\r\n	\"deliveryAcceptedOrdersTitle\": \"Accepted Orders\",\r\n	\"deliveryNoOrdersAccepted\": \"No Orders Accepted Yet\",\r\n	\"deliveryNewOrdersTitle\": \"New Orders\",\r\n	\"deliveryNoNewOrders\": \"No New Orders Yet\",\r\n	\"deliveryOrderItems\": \"Order Items\",\r\n	\"deliveryRestaurantAddress\": \"Restaurant Address\",\r\n	\"deliveryDeliveryAddress\": \"Delivery Address\",\r\n	\"deliveryGetDirectionButton\": \"Get Direction\",\r\n	\"deliveryOnlinePayment\": \"Online Payment\",\r\n	\"deliveryCashOnDelivery\": \"Cash On Delivery\",\r\n	\"deliveryDeliveryPinPlaceholder\": \"ENTER DELIVERY PIN\",\r\n	\"deliveryAcceptOrderButton\": \"Accept\",\r\n	\"deliveryPickedUpButton\": \"Picked Up\",\r\n	\"deliveryDeliveredButton\": \"Delivered\",\r\n	\"deliveryOrderCompletedButton\": \"Order Completed\",\r\n	\"deliveryAlreadyAccepted\": \"This delivery has been accepted by someone else.\",\r\n	\"deliveryInvalidDeliveryPin\": \"Incorrect delivery pin. Please try again.\",\r\n	\"deliveryLogoutDelivery\": \"Logout Delivery\",\r\n	\"deliveryLogoutConfirmation\": \"Are you sure?\",\r\n	\"deliveryOrdersRefreshBtn\": \"Refresh\",\r\n	\"deliveryOrderPlacedText\": \"Order Placed\",\r\n	\"deliveryFooterNewTitle\": \"New Orders\",\r\n	\"deliveryFooterAcceptedTitle\": \"Accepted\",\r\n	\"deliveryFooterAccount\": \"Accounts\",\r\n	\"deliveryEarningsText\": \"Earnings\",\r\n	\"deliveryOnGoingText\": \"On-Going\",\r\n	\"deliveryCompletedText\": \"Completed\",\r\n	\"deliveryCommissionMessage\": \"Commission for order:\",\r\n	\"itemSearchText\": \"Search results for: \",\r\n	\"itemSearchNoResultText\": \"No results found for: \",\r\n	\"itemSearchPlaceholder\": \"Search for items...\",\r\n	\"itemsMenuButtonText\": \"MENU\",\r\n	\"itemPercentageDiscountText\": \"% OFF\",\r\n	\"exploreNoResults\": \"No Items or Restaurants Found\",\r\n	\"updatingMessage\": \"Updating\",\r\n	\"userNotFoundErrorMessage\": \"No user found with this email.\",\r\n	\"invalidOtpErrorMessage\": \"Invalid OTP Entered\",\r\n	\"resetPasswordPageTitle\": \"Reset Password\",\r\n	\"resetPasswordPageSubTitle\": \"Enter your email address to continue\",\r\n	\"sendOtpOnEmailButtonText\": \"Send OTP on Email\",\r\n	\"alreadyHaveResetOtpButtonText\": \"I already have an OTP\",\r\n	\"enterResetOtpMessageText\": \"Enter the OTP sent to you email\",\r\n	\"verifyResetOtpButtonText\": \"Verify OTP\",\r\n	\"dontHaveResetOtpButtonText\": \"I dont have an OTP\",\r\n	\"enterNewPasswordText\": \"Please enter a new password below\",\r\n	\"newPasswordLabelText\": \"New Password\",\r\n	\"setNewPasswordButtonText\": \"Set New Password\",\r\n	\"exlporeByRestaurantText\": \"By\",\r\n	\"forgotPasswordLinkText\": \"Forgot Password?\",\r\n	\"categoriesNoRestaurantsFoundText\": \"No Restaurants Found\",\r\n	\"categoriesFiltersText\": \"Filters\",\r\n	\"registrationPolicyMessage\": null,\r\n	\"locationSavedAddresses\": \"Saved Addresses\",\r\n	\"restaurantMinOrderMessage\": \"Min cart value should be atleast \",\r\n	\"footerAlerts\": \"Alerts\",\r\n	\"markAllAlertReadText\": \"Mark All Read\",\r\n	\"noNewAlertsText\": \"No new alerts\"\r\n}\r\n', '2020-04-14 21:13:57', '2020-04-15 01:13:46', 0, 0),
(3, 'Português', '{\"desktopHeading\":\"Pe\\u00e7a em estabelecimentos perto de voc\\u00ea!\",\"desktopSubHeading\":\"<h3 class=\\\"desktop-subtitle\\\" style=\\\"margin-bottom: 20px; line-height: 1.2; font-size: 1.3rem; letter-spacing: normal; font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(66, 66, 66);\\\">As coisas que voc\\u00ea ama, na palma da sua m\\u00e3o. Pesquise e encontre entre centenas de estabelecimentos os melhores pre\\u00e7o e qualidade no seu pedido!<\\/h3>\",\"desktopUseAppButton\":\"Use o App Agora\",\"desktopAchievementOneTitle\":\"Estabelecimentos\",\"desktopAchievementOneSub\":\"2300+\",\"desktopAchievementTwoTitle\":\"Produtos\",\"desktopAchievementTwoSub\":\"65000+\",\"desktopAchievementThreeTitle\":\"Clientes\",\"desktopAchievementThreeSub\":\"1M+\",\"desktopAchievementFourTitle\":\"Entregadores\",\"desktopAchievementFourSub\":\"5M+\",\"desktopFooterAddress\":\"#1201, Someplace, Near Somewhere\",\"desktopFooterSocialHeader\":\"We Are Social\",\"desktopSocialFacebookLink\":\"https:\\/\\/www.facebook.com\\/dicasa.cv\",\"desktopSocialGoogleLink\":\"https:\\/\\/www.google.com\",\"desktopSocialYoutubeLink\":null,\"desktopSocialInstagramLink\":\"https:\\/\\/www.instagram.com\",\"gdprMessage\":\"We use Cookies to give you the best possible service. By continuing to browse our site you are agreeing to our use of Cookies\",\"gdprConfirmButton\":\"Okay\",\"changeLanguageText\":\"Trocar idioma\",\"firstScreenHeading\":\"Pe\\u00e7a agora mesmo nos melhores estabelecimentos.\",\"firstScreenSubHeading\":\"Pronto para escolher e pedir?\",\"firstScreenSetupLocation\":\"escolha seu local\",\"firstScreenWelcomeMessage\":\"Bem Vindo,\",\"firstScreenLoginText\":\"Ja tem uma conta?\",\"firstScreenLoginBtn\":\"Entre\",\"loginErrorMessage\":\"Woopss !! Algo deu errado. Por favor, tente novamente.\",\"pleaseWaitText\":\"Por favor, espere...\",\"loginLoginTitle\":\"ENTRAR\",\"loginLoginSubTitle\":\"Coloque seu email e senha\",\"loginLoginEmailLabel\":\"Email\",\"loginLoginPasswordLabel\":\"Senha\",\"loginDontHaveAccount\":\"N\\u00e3o tem uma conta ainda?\",\"firstScreenRegisterBtn\":\"Registre-se\",\"registerRegisterTitle\":\"Cadastrar\",\"registerRegisterSubTitle\":\"Registre agora gratuitamente\",\"loginLoginNameLabel\":\"Name\",\"loginLoginPhoneLabel\":\"Telefone\",\"regsiterAlreadyHaveAccount\":\"j\\u00e1 tem uma conta?\",\"fieldValidationMsg\":\"Este \\u00e9 um campo obrigat\\u00f3rio.\",\"nameValidationMsg\":\"Por favor digite seu nome completo.\",\"emailValidationMsg\":\"Por favor digite um email v\\u00e1lido.\",\"phoneValidationMsg\":\"Digite um n\\u00famero de telefone neste formato: +2385984242\",\"minimumLengthValidationMessage\":\"Este campo deve ter pelo menos 8 caracteres.\",\"emailPhoneAlreadyRegistered\":\"O email ou telefone j\\u00e1 foi registrado.\",\"emailPassDonotMatch\":\"E-mail e senha n\\u00e3o coincidem.\",\"enterPhoneToVerify\":\"Digite seu n\\u00famero de telefone para verificar\",\"invalidOtpMsg\":\"COD inv\\u00e1lido. Por favor verifique e tente novamente.\",\"otpSentMsg\":\"Um COD foi enviado para\",\"resendOtpMsg\":\"Reenviar COD para\",\"resendOtpCountdownMsg\":\"Reenviar COD em\",\"verifyOtpBtnText\":\"Verificar COD\",\"socialWelcomeText\":\"Oi\",\"socialLoginOrText\":\"OU\",\"forgotPasswordLinkText\":\"Esqueceu a Senha?\",\"resetPasswordPageTitle\":\"Redefinir senha\",\"resetPasswordPageSubTitle\":\"Digite seu e-mail para continuar\",\"userNotFoundErrorMessage\":\"Usu\\u00e1rio n\\u00e3o encontrado com este email.\",\"invalidOtpErrorMessage\":\"Codigo Invalido\",\"sendOtpOnEmailButtonText\":\"Enviar COD por email\",\"alreadyHaveResetOtpButtonText\":\"Eu j\\u00e1 tenho um COD\",\"dontHaveResetOtpButtonText\":\"Eu n\\u00e3o tenho um COD\",\"enterResetOtpMessageText\":\"Digite o COD enviado em seu email\",\"verifyResetOtpButtonText\":\"Verificar COD\",\"enterNewPasswordText\":\"Digite uma nova senha abaixo\",\"newPasswordLabelText\":\"Nova Senha\",\"setNewPasswordButtonText\":\"Definir Nova Senha\",\"registrationPolicyMessage\":null,\"deliveryTypeDelivery\":\"Entrega\",\"deliveryTypeSelfPickup\":\"Local ou Retirar\",\"noRestaurantMessage\":\"Nenhum Disponivel\",\"restaurantCountText\":\"Perto de voc\\u00ea.\",\"restaurantFeaturedText\":\"Destaque\",\"homePageMinsText\":\"MINS\",\"homePageForTwoText\":\"PARA DOIS\",\"footerNearme\":\"Proximo\",\"footerExplore\":\"Explorar\",\"footerCart\":\"Sacola\",\"footerAccount\":\"Conta\",\"footerAlerts\":\"Alerts\",\"exploreNoResults\":\"No Items or Restaurants Found\",\"markAllAlertReadText\":\"Marcar todas como lidas\",\"noNewAlertsText\":\"N\\u00e3o h\\u00e1 novos alertas\",\"restaurantSearchPlaceholder\":\"Procurar por estabelecimentos\",\"exploreRestautantsText\":\"ESTABELECIMENTOS\",\"exploreItemsText\":\"ITEMS\",\"searchAtleastThreeCharsMsg\":\"Digite pelo menos 3 caracteres para pesquisar.\",\"exlporeByRestaurantText\":\"By\",\"recommendedBadgeText\":\"Sugerido\",\"popularBadgeText\":\"Popular\",\"newBadgeText\":\"Novo\",\"itemsPageRecommendedText\":\"RECOMENDADO\",\"floatCartViewCartText\":\"Ver Sacola\",\"floatCartItemsText\":\"Items\",\"customizableItemText\":\"Adcionais\",\"customizationHeading\":\"Adicione em seu Pedido\",\"customizationDoneBtnText\":\"Continuar\",\"pureVegText\":\"Temos Veg\",\"certificateCodeText\":\"Certificado:\",\"showMoreButtonText\":\"Mostrar\",\"showLessButtonText\":\"Esconder\",\"notAcceptingOrdersMsg\":\"Atualmente n\\u00e3o aceita pedidos\",\"itemSearchPlaceholder\":\"Pesquisar produtos ...\",\"itemSearchText\":\"Resultados da busca por:\",\"itemSearchNoResultText\":\"Nenhum resultado encontrado para:\",\"itemsMenuButtonText\":\"MENU\",\"itemPercentageDiscountText\":\"% OFF\",\"cartPageTitle\":\"Sacola\",\"cartItemsInCartText\":\"Itens na sacola\",\"cartEmptyText\":\"Sua sacola esta vazia\",\"cartSuggestionPlaceholder\":\"Escreva seu coment\\u00e1rio para o estabelecimento ...\",\"cartCouponText\":\"Cupom\",\"cartApplyCoupon\":\"Cupom Aplicado\",\"cartInvalidCoupon\":\"Cupom Invalido\",\"cartCouponOffText\":\"OFF\",\"cartBillDetailsText\":\"Detalhes da Conta\",\"cartItemTotalText\":\"Total de Itens\",\"cartToPayText\":\"Pagar\",\"cartDeliveryCharges\":\"Taxa de Entrega\",\"cartRestaurantCharges\":\"Taxa do Estabelecimento\",\"cartSetYourAddress\":\"Defina Seu Endere\\u00e7o\",\"buttonNewAddress\":\"Novo Endere\\u00e7o\",\"cartChangeLocation\":\"Trocar\",\"cartDeliverTo\":\"Entregar para\",\"checkoutSelectPayment\":\"Fazer o pagamento\",\"cartLoginHeader\":\"Quase L\\u00e1\",\"cartLoginSubHeader\":\"Entre ou cadastre-se para fazer seu pedido\",\"cartLoginButtonText\":\"Continuar\",\"selectedSelfPickupMessage\":\"Voc\\u00ea selecionou Captura autom\\u00e1tica.\",\"taxText\":\"Taxas\",\"itemsRemovedMsg\":\"Os itens adicionados no estabelecimento anterior foram removidos.\",\"ongoingOrderMsg\":\"Voc\\u00ea tem alguns pedidos em andamento. olhar\",\"cartRestaurantNotOperational\":\"O estabelecimento n\\u00e3o est\\u00e1 operacional no local selecionado.\",\"restaurantMinOrderMessage\":\"O valor m\\u00ednimo do carrinho deve ser pelo menos\",\"checkoutPageTitle\":\"Finalizar\",\"checkoutPaymentListTitle\":\"Escolher forma de pagamento\",\"checkoutPaymentInProcess\":\"Pagamento em processo. N\\u00e3o aperte atualizar ou voltar.\",\"checkoutStripeText\":\"Stripe\",\"checkoutStripeSubText\":\"Pagamento online\",\"checkoutCodText\":\"DISPONIVEL\",\"checkoutCodSubText\":\"Pagamento na entrega\",\"paystackPayText\":\"Pague com PayStack\",\"checkoutRazorpayText\":\"Razorpay\",\"checkoutRazorpaySubText\":\"Pague com cart\\u00e3o de credito\",\"runningOrderPlacedTitle\":\"Pedido efetuado com sucesso\",\"runningOrderPlacedSub\":\"Aguardando o estabelecimento para confirmar seu pedido\",\"runningOrderPreparingTitle\":\"Chef no trabalho !!\",\"runningOrderPreparingSub\":\"O estabelecimento est\\u00e1 preparando seu pedido\",\"runningOrderOnwayTitle\":\"Vroom Vroom!!\",\"runningOrderOnwaySub\":\"O pedido foi retirado e est\\u00e1 a caminho\",\"runningOrderDeliveryAssignedTitle\":\"Entregador atribu\\u00eddo\",\"runningOrderDeliveryAssignedSub\":\"No caminho para pegar seu pedido.\",\"runningOrderCanceledTitle\":\"Pedido cancelado\",\"runningOrderCanceledSub\":\"Desculpe. Seu pedido foi cancelado.\",\"runningOrderReadyForPickup\":\"Seu pedido est\\u00e1 pronto\",\"runningOrderReadyForPickupSub\":\"Seu pedido est\\u00e1 pronto para a retirada ou consumo.\",\"runningOrderDelivered\":\"Pedido entregue\",\"runningOrderDeliveredSub\":\"O pedido foi entregue a voc\\u00ea. aproveite.\",\"runningOrderRefreshButton\":\"Atualizar status do pedido\",\"deliveryGuyAfterName\":\"\\u00e9 seu entregador hoje.\",\"vehicleText\":\"Ve\\u00edculo:\",\"callNowButton\":\"Ligue agora\",\"allowLocationAccessMessage\":\"Permita o acesso \\u00e0 localiza\\u00e7\\u00e3o para rastreamento ao vivo.\",\"trackOrderText\":\"Acompanhar Pedido\",\"orderPlacedStatusText\":\"Pedido realizado\",\"preparingOrderStatusText\":\"Preparando Pedido\",\"deliveryGuyAssignedStatusText\":\"Entregador atribu\\u00eddo\",\"orderPickedUpStatusText\":\"Pedido recolhido\",\"deliveredStatusText\":\"Entregue\",\"canceledStatusText\":\"Cancelado\",\"readyForPickupStatusText\":\"Pronto para pegar\",\"restaurantNewOrderNotificationMsg\":\"Chegou uma nova entrega !!!\",\"restaurantNewOrderNotificationMsgSub\":\"Notifica\\u00e7\\u00e3o de nova entrega\",\"deliveryGuyNewOrderNotificationMsg\":\"Uma nova entrega est\\u00e1 esperando !!!\",\"deliveryGuyNewOrderNotificationMsgSub\":\"Notifica\\u00e7\\u00e3o de nova entrega\",\"runningOrderDeliveryPin\":\"COD de entrega:\",\"accountMyAccount\":\"Minha Conta\",\"accountManageAddress\":\"Meus Endere\\u00e7os\",\"addressDoesnotDeliverToText\":\"N\\u00e3o Entrega Para\",\"accountMyOrders\":\"Meus Pedidos\",\"accountHelpFaq\":\"Ajuda e FAQs\",\"accountLogout\":\"Sair\",\"accountMyWallet\":\"Carteira\",\"noOrdersText\":\"Voc\\u00ea ainda n\\u00e3o fez nenhum pedido.\",\"orderCancelledText\":\"Pedido cancelado\",\"searchAreaPlaceholder\":\"Pesquise sua cidade ...\",\"searchPopularPlaces\":\"Escolha uma cidade.\",\"useCurrentLocationText\":\"Usar localiza\\u00e7\\u00e3o atual\",\"gpsAccessNotGrantedMsg\":\"O acesso ao GPS foi negado, ative a permiss\\u00e3o .\",\"yourLocationText\":\"SUA LOCALIZA\\u00c7\\u00c3O\",\"editAddressAddress\":\"Endere\\u00e7o\",\"editAddressTag\":\"Tag\",\"addressTagPlaceholder\":\"Por exemplo. Trabalho, casa\",\"buttonSaveAddress\":\"Save Address\",\"locationSavedAddresses\":\"Salvar endere\\u00e7o\",\"deleteAddressText\":\"Excluir\",\"noWalletTransactionsText\":\"Ainda n\\u00e3o h\\u00e1 transa\\u00e7\\u00f5es na carteira !!!\",\"walletDepositText\":\"Dep\\u00f3sito\",\"walletWithdrawText\":\"Retirar\",\"payPartialWithWalletText\":\"Pagar valor parcial com carteira\",\"willbeDeductedText\":\"ser\\u00e1 deduzido do seu saldo de\",\"payFullWithWalletText\":\"Pague o valor total com a Google Wallet.\",\"orderPaymentWalletComment\":\"Pagamento pelo pedido:\",\"orderPartialPaymentWalletComment\":\"Pagamento parcial pelo pedido:\",\"orderRefundWalletComment\":\"Reembolso pelo cancelamento do pedido.\",\"orderPartialRefundWalletComment\":\"Reembolso parcial para cancelamento de pedidos.\",\"walletRedeemBtnText\":\"Resgatar\",\"cancelOrderMainButton\":\"Cancelar pedido\",\"willBeRefundedText\":\"ser\\u00e1 devolvido de volta \\u00e0 sua carteira.\",\"willNotBeRefundedText\":\"Nenhum reembolso ser\\u00e1 feito em sua carteira, pois o estabelecimento j\\u00e1 preparou o pedido.\",\"orderCancellationConfirmationText\":\"Deseja cancelar este pedido?\",\"yesCancelOrderBtn\":\"Sim, cancelar pedido\",\"cancelGoBackBtn\":\"Voltar\",\"deliveryWelcomeMessage\":\"Bem-Vindo\",\"deliveryAcceptedOrdersTitle\":\"Pedidos aceitos\",\"deliveryNoOrdersAccepted\":\"Nenhum pedido aceito ainda\",\"deliveryNewOrdersTitle\":\"Novos Pedidos\",\"deliveryNoNewOrders\":\"Ainda n\\u00e3o h\\u00e1 novos pedidos\",\"deliveryOrderItems\":\"Itens do pedido\",\"deliveryRestaurantAddress\":\"Endere\\u00e7o do Estabelecimento\",\"deliveryDeliveryAddress\":\"Endere\\u00e7o de entrega\",\"deliveryGetDirectionButton\":\"Obter Dire\\u00e7\\u00e3o\",\"deliveryOnlinePayment\":\"Pagamento online\",\"deliveryCashOnDelivery\":\"Pagamento na entrega\",\"deliveryDeliveryPinPlaceholder\":\"INSERIR COD DE ENTREGA\",\"deliveryAcceptOrderButton\":\"Aceitar\",\"deliveryPickedUpButton\":\"Pegou\",\"deliveryDeliveredButton\":\"Entregue\",\"deliveryOrderCompletedButton\":\"Encomenda completa\",\"deliveryAlreadyAccepted\":\"Esta entrega foi aceita por outra pessoa.\",\"deliveryInvalidDeliveryPin\":\"COD de entrega incorreto. Por favor, tente novamente.\",\"deliveryLogoutDelivery\":\"Sair do Delivery\",\"deliveryLogoutConfirmation\":\"Voc\\u00ea tem certeza?\",\"deliveryOrdersRefreshBtn\":\"Atualizar\",\"deliveryOrderPlacedText\":\"Pedido realizado\",\"deliveryFooterNewTitle\":\"Novos Pedidos\",\"deliveryFooterAcceptedTitle\":\"Aceitos\",\"deliveryFooterAccount\":\"Conta\",\"deliveryEarningsText\":\"Ganhos\",\"deliveryOnGoingText\":\"Em Andamento\",\"deliveryCompletedText\":\"Concluido\",\"deliveryCommissionMessage\":\"Comiss\\u00e3o para encomenda:\",\"updatingMessage\":\"Sistema de atualiza\\u00e7\\u00e3o\",\"categoriesFiltersText\":\"Filtros\",\"categoriesNoRestaurantsFoundText\":\"Nenhum restaurante encontrado\"}', '2020-04-15 01:10:42', '2020-04-15 01:13:44', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address_id` int(11) DEFAULT '0',
  `delivery_pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_guy_detail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `auth_token`, `phone`, `default_address_id`, `delivery_pin`, `delivery_guy_detail_id`) VALUES
(1, 'DiCasa', 'fogosolucoes@gmail.com', NULL, '$2y$10$IkwJq0erQwwSAPjTLclaeeLPXXf73I9ZkBpIPPObBAve6DiHj.Kv6', '63NmxIFITEzy22IFkOAzyOZzRtDsslYAXrI01LDjwwVVy7iHjUUkmNVg6X7S', '2020-04-14 21:13:56', '2020-04-14 21:13:56', NULL, NULL, 0, NULL, NULL),
(2, 'Alexon Lima', 'alexon.lima87@gmail.com', NULL, '$2y$10$jbSXMBnRCJ5JOJUFyatnquivL.4PVxbnVcty/QbYKDjYgFiNHIHsG', NULL, '2020-04-15 00:56:41', '2020-04-15 03:00:36', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NsaWVudGUxODEuZGljYXNhLmN2L3B1YmxpYy9hcGkvbG9naW4iLCJpYXQiOjE1ODY5MDI3MTAsIm5iZiI6MTU4NjkwMjcxMCwianRpIjoiT2V5ZW44d1lmY2RVejhJaCIsInN1YiI6MiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.dIDpRpj4ey2LCHaKm_ORG1kXkVZ46G9VfBC8dHa7pig', '+2389955995', 4, 'QP8KB', NULL),
(3, 'Emanuel Goncalves', 'goncalvesima@gmail.com', NULL, '$2y$10$UpKqsE4yD8pQpJ5WNVgYXOzV2LO8uRF2393PpYy11iKhomALB2eRq', NULL, '2020-04-15 01:09:58', '2020-04-15 02:22:00', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NsaWVudGUxODEuZGljYXNhLmN2L3B1YmxpYy9hcGkvbG9naW4iLCJpYXQiOjE1ODY5MDIxOTgsIm5iZiI6MTU4NjkwMjE5OCwianRpIjoiS1VDbnNTQW1BSmp1TEVFWCIsInN1YiI6MywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.IrGYCvsMWUIRHgus06SDmewugZfLW89Px6t1tEiOHfY', '+2389941443', 5, 'QOYOX', NULL),
(4, 'Ima', 'info@dicasa.cv', NULL, '$2y$10$E7anmtc2Um7ZmxorL8xrX.5mEjNhNXfSVpCOAMyAQycz89M4h.FBu', NULL, '2020-04-15 01:43:11', '2020-04-15 01:45:00', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NsaWVudGUxODEuZGljYXNhLmN2L3B1YmxpYy9hcGkvbG9naW4iLCJpYXQiOjE1ODY5MDQzMDAsIm5iZiI6MTU4NjkwNDMwMCwianRpIjoiQ0pXQzFjbEZ2NFRWN3FucCIsInN1YiI6NCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.hP-Uuh1jyAGGkY7-xJY5uv819TLxe2uFYyDqmN5nDDY', '+2389999999', 3, 'XUCKQ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `holder_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `decimal_places` smallint(6) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `holder_type`, `holder_id`, `name`, `slug`, `description`, `balance`, `decimal_places`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 2, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-15 00:56:41', '2020-04-15 00:56:41'),
(2, 'App\\User', 1, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-15 01:03:29', '2020-04-15 01:03:29'),
(3, 'App\\User', 3, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-15 01:09:58', '2020-04-15 01:09:58'),
(4, 'App\\User', 4, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-15 01:43:12', '2020-04-15 01:43:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept_deliveries`
--
ALTER TABLE `accept_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_categories`
--
ALTER TABLE `addon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_category_item`
--
ALTER TABLE `addon_category_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_collections`
--
ALTER TABLE `delivery_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_collection_logs`
--
ALTER TABLE `delivery_collection_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_guy_details`
--
ALTER TABLE `delivery_guy_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gps_tables`
--
ALTER TABLE `gps_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderstatuses`
--
ALTER TABLE `orderstatuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item_addons`
--
ALTER TABLE `order_item_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popular_geo_places`
--
ALTER TABLE `popular_geo_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_sliders`
--
ALTER TABLE `promo_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_tokens`
--
ALTER TABLE `push_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_sku_unique` (`sku`);

--
-- Indexes for table `restaurant_categories`
--
ALTER TABLE `restaurant_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_category_restaurant`
--
ALTER TABLE `restaurant_category_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_category_sliders`
--
ALTER TABLE `restaurant_category_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_earnings`
--
ALTER TABLE `restaurant_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_payouts`
--
ALTER TABLE `restaurant_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_user`
--
ALTER TABLE `restaurant_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  ADD KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  ADD KEY `wallets_slug_index` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accept_deliveries`
--
ALTER TABLE `accept_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_categories`
--
ALTER TABLE `addon_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_category_item`
--
ALTER TABLE `addon_category_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_collections`
--
ALTER TABLE `delivery_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_collection_logs`
--
ALTER TABLE `delivery_collection_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_guy_details`
--
ALTER TABLE `delivery_guy_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gps_tables`
--
ALTER TABLE `gps_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderstatuses`
--
ALTER TABLE `orderstatuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_item_addons`
--
ALTER TABLE `order_item_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popular_geo_places`
--
ALTER TABLE `popular_geo_places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promo_sliders`
--
ALTER TABLE `promo_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `push_tokens`
--
ALTER TABLE `push_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_categories`
--
ALTER TABLE `restaurant_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_category_restaurant`
--
ALTER TABLE `restaurant_category_restaurant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_category_sliders`
--
ALTER TABLE `restaurant_category_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_earnings`
--
ALTER TABLE `restaurant_earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_payouts`
--
ALTER TABLE `restaurant_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_user`
--
ALTER TABLE `restaurant_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
