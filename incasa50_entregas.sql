-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 14/04/2020 às 20:48
-- Versão do servidor: 5.6.41-84.1
-- Versão do PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `incasa50_entregas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accept_deliveries`
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

--
-- Fazendo dump de dados para tabela `accept_deliveries`
--

INSERT INTO `accept_deliveries` (`id`, `order_id`, `user_id`, `customer_id`, `is_complete`, `created_at`, `updated_at`) VALUES
(1, 9, 27, 22, 1, '2020-03-08 20:21:46', '2020-03-08 20:24:11'),
(2, 26, 33, 44, 1, '2020-03-17 21:07:31', '2020-03-17 21:07:49'),
(3, 33, 35, 67, 1, '2020-04-11 20:42:47', '2020-04-11 20:44:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `addons`
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

--
-- Fazendo dump de dados para tabela `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`, `addon_category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sírio', '0.00', 1, 21, '2020-03-06 17:44:17', '2020-03-07 18:10:50'),
(2, 'Maionese Verdinha', '1.00', 1, 21, '2020-03-07 18:07:28', '2020-03-11 17:00:42'),
(3, 'Frango', '0.00', 2, 21, '2020-03-07 18:07:44', '2020-03-11 16:50:20'),
(4, 'Carne', '0.00', 2, 21, '2020-03-07 18:07:58', '2020-03-11 16:50:44'),
(5, 'File de carne', '5.00', 3, 21, '2020-03-07 18:08:23', '2020-03-07 18:08:23'),
(6, 'File de frango', '5.00', 3, 21, '2020-03-07 18:08:39', '2020-03-07 18:08:39'),
(7, 'File de picanha', '10.00', 3, 21, '2020-03-07 18:08:56', '2020-03-07 18:08:56'),
(8, 'Integral', '0.00', 1, 21, '2020-03-07 18:11:05', '2020-03-07 18:11:05'),
(9, 'Normal', '0.00', 1, 21, '2020-03-07 18:11:59', '2020-03-07 18:11:59'),
(10, 'Bacon', '2.00', 4, 25, '2020-03-08 20:09:35', '2020-03-14 21:47:23'),
(11, 'Calabresa', '1.50', 4, 25, '2020-03-08 20:10:06', '2020-03-14 21:47:48'),
(12, 'Mussarela', '1.50', 4, 25, '2020-03-08 20:10:22', '2020-03-14 21:48:13'),
(13, 'Ovo de codorna', '1.00', 4, 25, '2020-03-08 20:10:43', '2020-03-14 21:48:36'),
(14, 'Ovo de galinha', '1.00', 4, 25, '2020-03-08 20:10:58', '2020-03-14 21:48:53'),
(15, 'Grande', '0.00', 5, 21, '2020-03-11 15:45:23', '2020-03-11 15:45:23'),
(16, 'Familia', '5.00', 5, 21, '2020-03-11 15:45:36', '2020-03-11 15:45:36'),
(17, 'Catupiry', '10.00', 6, 21, '2020-03-11 15:46:12', '2020-03-11 15:46:12'),
(18, 'Cheddar', '1.00', 4, 25, '2020-03-14 21:47:04', '2020-03-14 21:47:04'),
(19, 'X-Tudo', '0.00', 7, 24, '2020-03-14 22:29:25', '2020-03-14 22:29:25'),
(20, 'Burger Raiz', '0.00', 7, 24, '2020-03-14 22:29:51', '2020-03-14 22:32:05'),
(21, 'Arroz', '4.00', 8, 43, '2020-03-16 20:01:38', '2020-03-16 20:01:38'),
(22, 'Feijão tropeiro', '4.00', 8, 43, '2020-03-16 20:02:01', '2020-03-16 20:02:01'),
(23, 'Maionese', '4.00', 8, 43, '2020-03-16 20:02:21', '2020-03-16 20:02:21'),
(24, 'Vinagrete', '4.00', 8, 43, '2020-03-16 20:02:40', '2020-03-16 20:02:40'),
(25, 'Coca Cola 1.5 Lts', '0.00', 9, 46, '2020-03-17 14:45:53', '2020-03-17 14:46:08'),
(26, 'Guarana 1.5 Lts', '0.00', 9, 46, '2020-03-17 14:46:44', '2020-03-17 14:46:44'),
(27, 'Broto (4 fatias)', '0.00', 10, 46, '2020-03-17 15:47:12', '2020-03-17 15:48:06'),
(28, 'Pequena (6 fatias)', '8.00', 10, 46, '2020-03-17 15:47:52', '2020-03-17 15:51:07'),
(29, 'Media (8 fatias)', '18.00', 10, 46, '2020-03-17 15:48:36', '2020-03-17 15:53:26'),
(30, 'Grande (12 fatias) + Refri 1.5 Lts Gratis', '31.00', 10, 46, '2020-03-17 15:48:55', '2020-03-17 17:46:13'),
(31, 'Mussarela', '0.00', 11, 46, '2020-03-17 18:36:41', '2020-03-17 18:36:41'),
(32, 'Catupiry', '0.00', 11, 46, '2020-03-17 18:36:53', '2020-03-17 18:36:53'),
(33, 'Strogonoff de File', '0.00', 12, 46, '2020-03-17 18:42:21', '2020-03-17 18:42:21'),
(34, 'Strogonoff de Frango', '0.00', 12, 46, '2020-03-17 18:42:36', '2020-03-17 18:42:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `addon_categories`
--

CREATE TABLE `addon_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `addon_categories`
--

INSERT INTO `addon_categories` (`id`, `name`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Pão', 'SINGLE', 21, '2020-03-06 17:43:50', '2020-03-07 18:10:06'),
(2, 'Molho', 'SINGLE', 21, '2020-03-07 18:06:19', '2020-03-11 17:00:15'),
(3, 'Opcionais', 'MULTI', 21, '2020-03-07 18:06:58', '2020-03-07 18:06:58'),
(4, 'Adicional', 'MULTI', 25, '2020-03-08 20:08:50', '2020-03-14 21:24:36'),
(5, 'Tamanho', 'SINGLE', 21, '2020-03-11 15:44:15', '2020-03-11 15:44:15'),
(6, 'Borda', 'MULTI', 21, '2020-03-11 15:44:27', '2020-03-11 15:47:02'),
(7, 'Combo', 'SINGLE', 24, '2020-03-14 22:28:52', '2020-03-14 22:28:52'),
(8, 'Guarnições', 'MULTI', 43, '2020-03-16 20:00:31', '2020-03-16 20:00:31'),
(9, 'Bebidas', 'SINGLE', 46, '2020-03-17 14:45:10', '2020-03-17 14:45:10'),
(10, 'Tamanho', 'SINGLE', 46, '2020-03-17 15:46:48', '2020-03-17 15:46:48'),
(11, 'Obrigatório', 'SINGLE', 46, '2020-03-17 18:36:25', '2020-03-17 18:36:25'),
(12, 'Molho', 'SINGLE', 46, '2020-03-17 18:42:00', '2020-03-17 18:42:00'),
(13, 'Brigadeiro Cremoso', 'MULTI', 45, '2020-03-18 17:00:42', '2020-03-18 17:00:42'),
(14, 'Brigadeiro Boleado', 'MULTI', 45, '2020-03-18 17:01:06', '2020-03-18 17:01:14'),
(15, 'Brownie', 'SINGLE', 45, '2020-03-18 17:01:35', '2020-03-18 17:01:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `addon_category_item`
--

CREATE TABLE `addon_category_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `addon_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `addon_category_item`
--

INSERT INTO `addon_category_item` (`id`, `addon_category_id`, `item_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, NULL, NULL),
(5, 2, 1, NULL, NULL),
(6, 3, 1, NULL, NULL),
(8, 5, 4, NULL, NULL),
(9, 6, 4, NULL, NULL),
(10, 5, 5, NULL, NULL),
(11, 6, 5, NULL, NULL),
(12, 5, 6, NULL, NULL),
(13, 6, 6, NULL, NULL),
(14, 5, 7, NULL, NULL),
(15, 6, 7, NULL, NULL),
(16, 5, 8, NULL, NULL),
(17, 6, 8, NULL, NULL),
(18, 5, 9, NULL, NULL),
(19, 6, 9, NULL, NULL),
(20, 5, 10, NULL, NULL),
(21, 6, 10, NULL, NULL),
(22, 5, 11, NULL, NULL),
(23, 6, 11, NULL, NULL),
(24, 5, 12, NULL, NULL),
(25, 6, 12, NULL, NULL),
(26, 5, 13, NULL, NULL),
(27, 5, 14, NULL, NULL),
(28, 6, 14, NULL, NULL),
(29, 5, 15, NULL, NULL),
(30, 6, 15, NULL, NULL),
(31, 5, 16, NULL, NULL),
(32, 6, 16, NULL, NULL),
(33, 5, 17, NULL, NULL),
(34, 6, 17, NULL, NULL),
(35, 5, 21, NULL, NULL),
(36, 6, 21, NULL, NULL),
(37, 5, 22, NULL, NULL),
(38, 6, 22, NULL, NULL),
(39, 5, 23, NULL, NULL),
(40, 6, 23, NULL, NULL),
(41, 5, 24, NULL, NULL),
(42, 6, 24, NULL, NULL),
(43, 5, 25, NULL, NULL),
(44, 6, 25, NULL, NULL),
(45, 5, 26, NULL, NULL),
(46, 6, 26, NULL, NULL),
(47, 5, 27, NULL, NULL),
(48, 6, 27, NULL, NULL),
(49, 5, 28, NULL, NULL),
(50, 6, 28, NULL, NULL),
(51, 5, 29, NULL, NULL),
(52, 6, 29, NULL, NULL),
(53, 5, 30, NULL, NULL),
(54, 6, 30, NULL, NULL),
(55, 5, 31, NULL, NULL),
(56, 6, 31, NULL, NULL),
(57, 5, 32, NULL, NULL),
(58, 6, 32, NULL, NULL),
(59, 5, 33, NULL, NULL),
(60, 6, 33, NULL, NULL),
(61, 5, 34, NULL, NULL),
(62, 6, 34, NULL, NULL),
(63, 5, 35, NULL, NULL),
(64, 6, 35, NULL, NULL),
(65, 5, 36, NULL, NULL),
(66, 6, 36, NULL, NULL),
(67, 5, 37, NULL, NULL),
(68, 6, 37, NULL, NULL),
(69, 5, 38, NULL, NULL),
(70, 6, 38, NULL, NULL),
(71, 5, 39, NULL, NULL),
(72, 6, 39, NULL, NULL),
(73, 5, 40, NULL, NULL),
(74, 6, 40, NULL, NULL),
(75, 5, 41, NULL, NULL),
(76, 6, 41, NULL, NULL),
(77, 2, 42, NULL, NULL),
(78, 5, 42, NULL, NULL),
(79, 6, 42, NULL, NULL),
(80, 5, 43, NULL, NULL),
(81, 6, 43, NULL, NULL),
(82, 5, 44, NULL, NULL),
(83, 6, 44, NULL, NULL),
(84, 5, 45, NULL, NULL),
(85, 6, 45, NULL, NULL),
(86, 5, 46, NULL, NULL),
(87, 6, 46, NULL, NULL),
(88, 4, 3, NULL, NULL),
(89, 4, 47, NULL, NULL),
(90, 4, 48, NULL, NULL),
(91, 4, 49, NULL, NULL),
(92, 4, 50, NULL, NULL),
(93, 4, 51, NULL, NULL),
(94, 7, 52, NULL, NULL),
(95, 7, 53, NULL, NULL),
(96, 8, 87, NULL, NULL),
(97, 8, 88, NULL, NULL),
(98, 8, 89, NULL, NULL),
(99, 8, 90, NULL, NULL),
(100, 8, 91, NULL, NULL),
(101, 8, 92, NULL, NULL),
(102, 8, 93, NULL, NULL),
(103, 8, 94, NULL, NULL),
(104, 8, 95, NULL, NULL),
(105, 8, 96, NULL, NULL),
(106, 8, 97, NULL, NULL),
(107, 8, 98, NULL, NULL),
(108, 8, 99, NULL, NULL),
(109, 8, 100, NULL, NULL),
(110, 8, 101, NULL, NULL),
(111, 8, 102, NULL, NULL),
(112, 8, 103, NULL, NULL),
(113, 8, 104, NULL, NULL),
(114, 8, 105, NULL, NULL),
(115, 8, 106, NULL, NULL),
(116, 8, 107, NULL, NULL),
(117, 8, 108, NULL, NULL),
(118, 8, 109, NULL, NULL),
(119, 8, 110, NULL, NULL),
(120, 10, 146, NULL, NULL),
(121, 10, 147, NULL, NULL),
(122, 10, 148, NULL, NULL),
(123, 10, 149, NULL, NULL),
(124, 10, 150, NULL, NULL),
(125, 10, 151, NULL, NULL),
(126, 10, 159, NULL, NULL),
(127, 10, 160, NULL, NULL),
(128, 10, 161, NULL, NULL),
(129, 10, 162, NULL, NULL),
(130, 10, 163, NULL, NULL),
(131, 10, 164, NULL, NULL),
(132, 10, 165, NULL, NULL),
(133, 10, 166, NULL, NULL),
(134, 10, 168, NULL, NULL),
(135, 10, 169, NULL, NULL),
(136, 10, 170, NULL, NULL),
(137, 10, 171, NULL, NULL),
(138, 10, 172, NULL, NULL),
(139, 10, 173, NULL, NULL),
(140, 10, 183, NULL, NULL),
(141, 10, 184, NULL, NULL),
(142, 10, 185, NULL, NULL),
(143, 10, 186, NULL, NULL),
(144, 10, 187, NULL, NULL),
(145, 10, 188, NULL, NULL),
(146, 10, 189, NULL, NULL),
(147, 10, 190, NULL, NULL),
(148, 10, 191, NULL, NULL),
(149, 10, 192, NULL, NULL),
(150, 10, 193, NULL, NULL),
(151, 10, 194, NULL, NULL),
(152, 10, 195, NULL, NULL),
(153, 10, 196, NULL, NULL),
(154, 10, 197, NULL, NULL),
(155, 10, 198, NULL, NULL),
(156, 10, 199, NULL, NULL),
(157, 10, 200, NULL, NULL),
(158, 10, 201, NULL, NULL),
(159, 10, 202, NULL, NULL),
(160, 10, 203, NULL, NULL),
(161, 10, 204, NULL, NULL),
(162, 10, 205, NULL, NULL),
(163, 10, 206, NULL, NULL),
(164, 10, 207, NULL, NULL),
(165, 10, 208, NULL, NULL),
(166, 10, 209, NULL, NULL),
(167, 10, 210, NULL, NULL),
(168, 11, 210, NULL, NULL),
(169, 11, 168, NULL, NULL),
(170, 10, 211, NULL, NULL),
(171, 10, 212, NULL, NULL),
(172, 10, 213, NULL, NULL),
(173, 12, 213, NULL, NULL),
(174, 10, 214, NULL, NULL),
(175, 10, 215, NULL, NULL),
(176, 10, 216, NULL, NULL),
(177, 10, 217, NULL, NULL),
(178, 10, 218, NULL, NULL),
(179, 10, 219, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `house`, `landmark`, `tag`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(2, 22, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, 'Casa', '2020-03-06 18:55:14', '2020-03-06 18:55:14', '-15.9053607', '-52.241874'),
(3, 22, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-07 01:57:48', '2020-03-07 01:57:48', '-15.905365753943155', '-52.241865678011266'),
(4, 22, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-09 18:05:53', '2020-03-09 18:05:53', '-15.8916033', '-52.2615413'),
(5, 22, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-09 18:51:58', '2020-03-09 18:51:58', '-15.8994136', '-52.2431843'),
(6, 22, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-09 20:35:50', '2020-03-09 20:35:50', '-15.8994136', '-52.2431843'),
(7, 25, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-09 23:07:57', '2020-03-09 23:07:57', '-15.8994136', '-52.2431843'),
(8, 22, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-10 15:26:18', '2020-03-10 15:26:18', '-15.8916033', '-52.2615413'),
(9, 25, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-12 11:21:51', '2020-03-12 11:21:51', '-15.8994136', '-52.2431843'),
(10, 34, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-13 17:35:20', '2020-03-13 17:35:20', '-15.8916033', '-52.2615413'),
(11, 34, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', 'Rua Santos Dumont', NULL, NULL, '2020-03-13 20:45:30', '2020-03-13 20:45:30', '-15.8916033', '-52.2615413'),
(12, 22, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-16 16:08:48', '2020-03-16 16:08:48', '-15.9053588', '-52.2418744'),
(13, 22, 'Av. Universitária, 131 - Área de Tal, Pontal do Araguaia - MT, 78698-000, Brazil', NULL, NULL, NULL, '2020-03-16 17:01:03', '2020-03-16 17:01:03', '-15.9045099', '-52.257365'),
(14, 44, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-17 00:50:44', '2020-03-17 00:50:44', '-15.8994136', '-52.2431843'),
(15, 47, 'R. Maria da Glória Carvalho, 1353 - Sena Marques, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-17 16:37:28', '2020-03-17 16:37:28', '-15.895879532746743', '-52.278204209076925'),
(16, 48, 'Av. Min. João Alberto, s/n - Centro, Barra do Garças - MT, 78600-000, Brazil', 'Rua Moreira Cabral N 603', NULL, NULL, '2020-03-17 16:41:04', '2020-03-17 16:41:04', '-15.891727125507654', '-52.26150911349181'),
(17, 44, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-17 21:05:24', '2020-03-17 21:05:24', '-15.9053548', '-52.2418852'),
(18, 49, 'Av. Anchieta, 1844 - Anchieta, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-18 01:18:04', '2020-03-18 01:18:04', '-15.882399000494589', '-52.231362422453316'),
(19, 54, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', 'Rua amaro leite 271 centro', NULL, 'Casa', '2020-03-18 21:28:37', '2020-03-18 21:28:37', '-15.8916033', '-52.2615413'),
(20, 54, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', 'Rua Adelino Farias, 246 - Sena Marques', NULL, 'Casa 2', '2020-03-18 21:30:13', '2020-03-18 21:30:13', '-15.8916033', '-52.2615413'),
(21, 55, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-18 22:57:17', '2020-03-18 22:57:17', '-15.8994136', '-52.2431843'),
(22, 55, 'Av. Universitária, 131 - Área de Tal, Pontal do Araguaia - MT, 78698-000, Brazil', NULL, NULL, NULL, '2020-03-18 23:04:21', '2020-03-18 23:04:21', '-15.9045099', '-52.257365'),
(23, 62, 'R. Campinas, 1068 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-03-19 19:44:57', '2020-03-19 19:44:57', '-15.891059085141915', '-52.26953327283191'),
(25, 63, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', 'Rua Cícero Pereira de Oliveira 170', NULL, NULL, '2020-03-20 01:31:45', '2020-03-20 01:31:45', '-15.8916033', '-52.2615413'),
(26, 22, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-22 20:49:20', '2020-03-22 20:49:20', '-15.9053545', '-52.2418864'),
(27, 64, 'R. Raimundo Carneiro de Brito, 578 - St. Araguaia, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-23 02:36:27', '2020-03-23 02:36:27', '-15.897718716974428', '-52.25033613342221'),
(28, 61, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-23 11:39:24', '2020-03-23 11:39:24', '-15.8994136', '-52.2431843'),
(29, 22, 'Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-27 21:34:03', '2020-03-27 21:34:03', '-15.9053617', '-52.2418843'),
(30, 22, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-27 21:55:05', '2020-03-27 21:55:05', '-15.8994136', '-52.2431843'),
(31, 22, 'rua - Av. Melquídes Víctor de Oliveira, nº 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-03-28 04:20:20', '2020-03-28 04:20:20', '-15.9052911', '-52.2420503'),
(32, 22, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-04-02 12:43:24', '2020-04-02 12:43:24', '-15.8994136', '-52.2431843'),
(34, 65, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-04-04 15:50:10', '2020-04-04 15:50:10', '-15.8994136', '-52.2431843'),
(35, 66, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-04-07 20:10:52', '2020-04-07 20:10:52', '-15.8916033', '-52.2615413'),
(36, 66, 'Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, NULL, '2020-04-07 20:11:19', '2020-04-07 20:11:19', '-15.8916033', '-52.2615413'),
(38, 27, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-04-08 18:23:23', '2020-04-08 18:23:23', '-15.8994136', '-52.2431843'),
(39, 67, 'R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, NULL, '2020-04-10 20:42:11', '2020-04-10 20:42:11', '-15.8994136', '-52.2431843'),
(40, 27, 'R. Leão Paulo dos Santos, 72 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', 'Avenida josephina balestero,1911-St.Nova esperança', NULL, NULL, '2020-04-13 00:32:22', '2020-04-13 00:32:22', '-15.9057534', '-52.2387439');

-- --------------------------------------------------------

--
-- Estrutura para tabela `coupons`
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
-- Estrutura para tabela `delivery_collections`
--

CREATE TABLE `delivery_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `delivery_collections`
--

INSERT INTO `delivery_collections` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 27, '14.00', '2020-03-08 20:24:11', '2020-03-08 20:24:11'),
(2, 33, '55.00', '2020-03-17 21:07:50', '2020-03-17 21:07:50'),
(3, 35, '0.00', '2020-04-11 20:44:48', '2020-04-13 19:10:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_collection_logs`
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

--
-- Fazendo dump de dados para tabela `delivery_collection_logs`
--

INSERT INTO `delivery_collection_logs` (`id`, `delivery_collection_id`, `amount`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, '18.50', 'FULL', NULL, '2020-04-13 19:10:26', '2020-04-13 19:10:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `delivery_guy_details`
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

--
-- Fazendo dump de dados para tabela `delivery_guy_details`
--

INSERT INTO `delivery_guy_details` (`id`, `name`, `age`, `gender`, `photo`, `description`, `vehicle_number`, `created_at`, `updated_at`, `commission_rate`) VALUES
(1, 'ederson', NULL, NULL, NULL, NULL, NULL, '2020-03-08 20:20:22', '2020-03-08 20:26:52', '100.00'),
(2, 'Gelciomar Santos', '23', NULL, '1586638352RRgBtq0eNh.jpg', NULL, 'JZP-7605', '2020-03-10 13:36:50', '2020-04-11 20:52:32', '100.00'),
(3, 'Jhon Wester', NULL, NULL, NULL, NULL, NULL, '2020-03-11 13:44:19', '2020-03-11 13:44:19', '100.00'),
(4, 'Victor Alves', NULL, NULL, NULL, NULL, NULL, '2020-03-12 22:02:21', '2020-03-12 22:02:21', '100.00'),
(5, 'Thayna Tabory', '22', NULL, '1584385442hi1nojfxNL.jpg', NULL, 'ILQ-2525', '2020-03-16 19:04:02', '2020-03-16 19:04:02', '100.00'),
(6, 'Thiago Demellas', '29', NULL, '1584795764ka3bLOqfIu.jpg', NULL, 'QBD-2112', '2020-03-18 13:40:55', '2020-03-21 13:02:44', '100.00'),
(7, 'Vitor Augusto', '19', NULL, '1584573533JC2c8I0qYA.png', NULL, 'QBO-0555', '2020-03-18 23:14:27', '2020-03-18 23:18:54', '100.00'),
(8, 'Romario', '29', NULL, '1586636434gc4skfTCAn.jpg', NULL, 'QBD-2112', '2020-04-11 20:20:34', '2020-04-11 20:20:34', '100.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gps_tables`
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

--
-- Fazendo dump de dados para tabela `gps_tables`
--

INSERT INTO `gps_tables` (`id`, `order_id`, `user_lat`, `user_long`, `delivery_lat`, `delivery_long`, `created_at`, `updated_at`, `heading`) VALUES
(1, 1, NULL, NULL, NULL, NULL, '2020-03-06 18:44:57', '2020-03-06 18:44:57', NULL),
(2, 2, NULL, NULL, NULL, NULL, '2020-03-06 19:08:06', '2020-03-06 19:08:06', NULL),
(3, 3, NULL, NULL, NULL, NULL, '2020-03-06 19:10:30', '2020-03-06 19:10:30', NULL),
(4, 4, NULL, NULL, NULL, NULL, '2020-03-06 19:10:56', '2020-03-06 19:10:56', NULL),
(5, 5, NULL, NULL, NULL, NULL, '2020-03-06 19:32:04', '2020-03-06 19:32:04', NULL),
(6, 6, NULL, NULL, NULL, NULL, '2020-03-06 21:47:54', '2020-03-06 21:47:54', NULL),
(7, 7, NULL, NULL, NULL, NULL, '2020-03-06 21:48:41', '2020-03-06 21:48:41', NULL),
(8, 8, NULL, NULL, NULL, NULL, '2020-03-07 18:23:24', '2020-03-07 18:23:24', NULL),
(9, 9, NULL, NULL, '-15.9053596', '-52.2418747', '2020-03-08 20:16:25', '2020-03-08 20:24:01', NULL),
(10, 10, NULL, NULL, NULL, NULL, '2020-03-10 00:23:19', '2020-03-10 00:23:19', NULL),
(11, 11, NULL, NULL, NULL, NULL, '2020-03-10 15:28:28', '2020-03-10 15:28:28', NULL),
(12, 12, NULL, NULL, NULL, NULL, '2020-03-10 15:29:20', '2020-03-10 15:29:20', NULL),
(13, 13, NULL, NULL, NULL, NULL, '2020-03-10 18:09:17', '2020-03-10 18:09:17', NULL),
(14, 14, NULL, NULL, NULL, NULL, '2020-03-14 00:16:19', '2020-03-14 00:16:19', NULL),
(15, 15, NULL, NULL, NULL, NULL, '2020-03-16 03:27:57', '2020-03-16 03:27:57', NULL),
(16, 16, NULL, NULL, NULL, NULL, '2020-03-16 03:30:13', '2020-03-16 03:30:13', NULL),
(17, 17, NULL, NULL, NULL, NULL, '2020-03-17 00:49:29', '2020-03-17 00:49:29', NULL),
(18, 18, NULL, NULL, NULL, NULL, '2020-03-17 00:51:25', '2020-03-17 00:51:25', NULL),
(19, 19, NULL, NULL, NULL, NULL, '2020-03-17 00:53:08', '2020-03-17 00:53:08', NULL),
(20, 20, NULL, NULL, NULL, NULL, '2020-03-17 00:54:30', '2020-03-17 00:54:30', NULL),
(21, 21, NULL, NULL, NULL, NULL, '2020-03-17 00:56:33', '2020-03-17 00:56:33', NULL),
(22, 22, NULL, NULL, NULL, NULL, '2020-03-17 00:57:06', '2020-03-17 00:57:06', NULL),
(23, 23, NULL, NULL, NULL, NULL, '2020-03-17 01:03:58', '2020-03-17 01:03:58', NULL),
(24, 24, NULL, NULL, NULL, NULL, '2020-03-17 01:04:34', '2020-03-17 01:04:34', NULL),
(25, 25, NULL, NULL, NULL, NULL, '2020-03-17 16:41:53', '2020-03-17 16:41:53', NULL),
(26, 26, NULL, NULL, NULL, NULL, '2020-03-17 21:05:37', '2020-03-17 21:05:37', NULL),
(27, 27, NULL, NULL, NULL, NULL, '2020-03-24 01:09:04', '2020-03-24 01:09:04', NULL),
(28, 28, NULL, NULL, NULL, NULL, '2020-03-27 21:55:15', '2020-03-27 21:55:15', NULL),
(29, 29, NULL, NULL, NULL, NULL, '2020-04-07 20:16:39', '2020-04-07 20:16:39', NULL),
(30, 30, NULL, NULL, NULL, NULL, '2020-04-08 21:08:25', '2020-04-08 21:08:25', NULL),
(31, 31, NULL, NULL, NULL, NULL, '2020-04-09 13:45:32', '2020-04-09 13:45:32', NULL),
(32, 32, NULL, NULL, NULL, NULL, '2020-04-10 20:42:41', '2020-04-10 20:42:41', NULL),
(33, 33, NULL, NULL, NULL, NULL, '2020-04-11 20:34:00', '2020-04-11 20:34:00', NULL),
(34, 34, NULL, NULL, NULL, NULL, '2020-04-13 00:33:10', '2020-04-13 00:33:10', NULL),
(35, 35, NULL, NULL, NULL, NULL, '2020-04-13 23:05:00', '2020-04-13 23:05:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `items`
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

--
-- Fazendo dump de dados para tabela `items`
--

INSERT INTO `items` (`id`, `restaurant_id`, `item_category_id`, `name`, `price`, `old_price`, `image`, `is_recommended`, `is_popular`, `is_new`, `created_at`, `updated_at`, `desc`, `placeholder_image`, `is_active`, `is_veg`) VALUES
(1, 2, 2, 'X-Tudo', '42.00', '45.00', '/assets/img/items/1583604299hKamde18X7.jpg', 1, 1, 1, '2020-03-06 17:47:52', '2020-03-10 15:27:47', 'Molho, mussarela, calabresa, cebola e orégano.', '/assets/img/items/small/1583604299hKamde18X7-sm.jpg', 1, 0),
(2, 1, 3, 'Coca Cola', '7.00', '0.00', '/assets/img/items/1583604978dbtx7vYsYw.jpg', 0, 1, 0, '2020-03-07 18:16:18', '2020-03-11 15:58:17', '<p>Coca cola 1.5 Lts</p>', '/assets/img/items/small/1583604978dbtx7vYsYw-sm.jpg', 1, 0),
(3, 4, 14, 'Tradicional simples', '6.00', '0.00', '/assets/img/items/1584220799oecnl8ZKNX.jpg', 1, 1, 0, '2020-03-08 20:15:03', '2020-03-14 21:27:37', '<p>Pão,1 salsicha, mussarela, catupiri, milho, batata palha, molho.</p>', '/assets/img/items/small/1584220799oecnl8ZKNX-sm.jpg', 1, 0),
(4, 1, 2, '4 Queijos', '38.00', '0.00', '/assets/img/items/1583941957MvNRZFrYmN.png', 1, 1, 0, '2020-03-11 15:52:38', '2020-03-11 16:22:39', '<p>Mussarela, provolone, catupiry, gorgonzola, azeitona e oregano.</p>', '/assets/img/items/small/1583941957MvNRZFrYmN-sm.png', 1, 1),
(5, 1, 2, 'Alho e Óleo', '35.00', '0.00', '/assets/img/items/1583942167YXWNqcuFgf.png', 0, 0, 0, '2020-03-11 15:56:07', '2020-03-11 15:56:07', '<p>Mussarela, alho, parmesão, azeitona e oregano.</p>', '/assets/img/items/small/1583942167YXWNqcuFgf-sm.png', 1, 0),
(6, 1, 2, 'Alcaparras', '35.00', '0.00', '/assets/img/items/1583942245aTo0BG6Acy.png', 0, 0, 0, '2020-03-11 15:57:25', '2020-03-11 15:57:25', '<p>Mussarela, alcaparras, parmesão e tomate.</p>', '/assets/img/items/small/1583942245aTo0BG6Acy-sm.png', 1, 1),
(7, 1, 2, 'Americana', '37.00', '0.00', '/assets/img/items/1583942460TK3JDHxv5U.png', 0, 0, 0, '2020-03-11 16:01:00', '2020-03-11 16:01:00', '<p>Mussarela, frango, milho, catupiry, lombo, azeitona e orégano.</p>', '/assets/img/items/small/1583942460TK3JDHxv5U-sm.png', 1, 0),
(8, 1, 2, 'Atum', '35.00', '0.00', '/assets/img/items/1583942506c4swLEeQf7.png', 0, 0, 0, '2020-03-11 16:01:46', '2020-03-11 16:01:46', '<p>Atum, azeitona e cebola.</p>', '/assets/img/items/small/1583942506c4swLEeQf7-sm.png', 1, 0),
(9, 1, 2, 'Bacon', '35.00', '0.00', '/assets/img/items/15839425905cMXZog5sE.png', 0, 1, 0, '2020-03-11 16:03:10', '2020-03-11 16:03:10', '<p>Mussarela, bacon, tomate, azeitona e orégano.</p>', '/assets/img/items/small/15839425905cMXZog5sE-sm.png', 1, 0),
(10, 1, 2, 'Baiana (Moido)', '36.00', '0.00', '/assets/img/items/1583942668byV2Vr5t4m.png', 0, 0, 0, '2020-03-11 16:04:28', '2020-03-11 16:04:28', '<p>Mussarela, bacon, calabresa, presunto, peito de peru, lombo, azeitona e oregano.</p>', '/assets/img/items/small/1583942668byV2Vr5t4m-sm.png', 1, 0),
(11, 1, 2, 'Brasileirinha', '37.00', '0.00', '/assets/img/items/1583942941E9GoCWXHpI.png', 1, 1, 0, '2020-03-11 16:09:01', '2020-03-11 16:09:01', '<p>Mussarela, lombo, salaminho, cebola, tomate, alh, azeitona e oregano.</p>', '/assets/img/items/small/1583942941E9GoCWXHpI-sm.png', 1, 0),
(12, 1, 2, 'Calabresa', '35.00', '0.00', '/assets/img/items/1583942988XLbnQH9uoX.png', 1, 1, 0, '2020-03-11 16:09:48', '2020-03-11 16:09:48', '<p>Mussarela, calabresa, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583942988XLbnQH9uoX-sm.png', 1, 0),
(13, 1, 2, 'Calzone (Torta)', '38.00', '0.00', '/assets/img/items/1583943135Iyg4diqcAC.png', 0, 0, 0, '2020-03-11 16:12:15', '2020-03-11 16:12:15', '<p>Mussarela, catupiry, provolone, gorgonzola, azeitona e orégano.</p>', '/assets/img/items/small/1583943135Iyg4diqcAC-sm.png', 1, 1),
(14, 1, 2, 'Carioca', '36.00', '0.00', '/assets/img/items/1583943302IQaftu3du0.png', 0, 0, 0, '2020-03-11 16:15:03', '2020-03-11 16:15:03', '<p>Mussarela, atum, bacon, caputiry, tomate, azeitona e orégano</p>', '/assets/img/items/small/1583943302IQaftu3du0-sm.png', 1, 0),
(15, 1, 2, 'Catfrango', '36.00', '0.00', '/assets/img/items/1583943351q7R9btdaml.png', 0, 1, 0, '2020-03-11 16:15:51', '2020-03-11 16:15:51', '<p>Mussarela, frango, catupiry, cebola, azeitona e oregano.</p>', '/assets/img/items/small/1583943351q7R9btdaml-sm.png', 1, 0),
(16, 1, 2, 'Catupireza', '35.00', '0.00', '/assets/img/items/1583943401bAFeCcLMr4.png', 0, 0, 0, '2020-03-11 16:16:41', '2020-03-11 16:16:41', '<p>Mussarela, calabresa, catupiry, azeitona e orégano.</p>', '/assets/img/items/small/1583943401bAFeCcLMr4-sm.png', 1, 0),
(17, 1, 2, 'Champions', '35.00', '0.00', '/assets/img/items/1583943480m73VwnbZsh.png', 0, 0, 0, '2020-03-11 16:18:00', '2020-03-11 16:18:00', '<p>Mussarela,&nbsp;Champions, parmesão. azeitona e oregano.</p>', '/assets/img/items/small/1583943480m73VwnbZsh-sm.png', 1, 1),
(18, 1, 3, 'Soda', '8.00', '0.00', '/assets/img/items/1583943614EAsbLp2GK9.jpg', 0, 0, 0, '2020-03-11 16:20:15', '2020-03-11 16:21:23', '<p>Soda antártica 2 lts.</p>', '/assets/img/items/small/1583943614EAsbLp2GK9-sm.jpg', 1, 0),
(19, 1, 3, 'Sukita', '8.00', '0.00', '/assets/img/items/1583943671cki1XXXx5V.jpg', 0, 0, 0, '2020-03-11 16:21:11', '2020-03-12 13:31:04', '<p>Sukita antártica 2 Lts</p>', '/assets/img/items/small/1583943671cki1XXXx5V-sm.jpg', 1, 0),
(20, 1, 3, 'Guarana', '8.00', '0.00', '/assets/img/items/15839437393WOMhYvi72.jpg', 0, 1, 0, '2020-03-11 16:22:19', '2020-03-11 16:22:19', '<p><span style=\"font-size: 14.4px;\">Guarana antártica&nbsp;2 lts</span><br></p>', '/assets/img/items/small/15839437393WOMhYvi72-sm.jpg', 1, 0),
(21, 1, 2, 'El Pizzaiola', '39.00', '0.00', '/assets/img/items/1583943900nxYHkTuHpG.png', 0, 0, 0, '2020-03-11 16:25:00', '2020-03-11 16:25:00', '<p>Mussarela, bacon, presunto, champions, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583943900nxYHkTuHpG-sm.png', 1, 0),
(22, 1, 2, 'Espanhola', '36.00', '0.00', '/assets/img/items/1583943991i5XUKbHdwS.png', 0, 1, 0, '2020-03-11 16:26:31', '2020-03-11 16:26:31', '<p>Mussarela, presunto, ovos, ervilha, palmito, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583943991i5XUKbHdwS-sm.png', 1, 0),
(23, 1, 2, 'Francesa', '37.00', '0.00', '/assets/img/items/15839440559kalowC8ME.png', 0, 0, 0, '2020-03-11 16:27:36', '2020-03-11 16:27:36', '<p>Mussarela, lombo, calabresa, bacon, tomate, azeitona e orégano.</p>', '/assets/img/items/small/15839440559kalowC8ME-sm.png', 1, 0),
(24, 1, 2, 'Gorgonzola', '38.00', '0.00', '/assets/img/items/1583944100WnZiirPzFT.png', 0, 0, 0, '2020-03-11 16:28:20', '2020-03-11 16:28:20', '<p>Mussarela, gorgonzola, azeitona e oregano.</p>', '/assets/img/items/small/1583944100WnZiirPzFT-sm.png', 1, 0),
(25, 1, 2, 'Grega', '38.00', '0.00', '/assets/img/items/1583944183WSOjWTcVTf.png', 1, 1, 0, '2020-03-11 16:29:43', '2020-03-11 16:29:43', '<p>Mussarela, milho, ervilha, palmito, catupiry, bacon, lombo, calabresa, azeitona e orégano.</p>', '/assets/img/items/small/1583944183WSOjWTcVTf-sm.png', 1, 0),
(26, 1, 2, 'Italiana', '37.00', '0.00', '/assets/img/items/1583944243cJ51a0qZmL.png', 0, 1, 0, '2020-03-11 16:30:43', '2020-03-11 16:30:43', '<p>Mussarela, lombo, bacon, milho, catupiry, azeitona e orégano.</p>', '/assets/img/items/small/1583944243cJ51a0qZmL-sm.png', 1, 0),
(27, 1, 2, 'Jamaicana', '37.00', '0.00', '/assets/img/items/1583944309zdzyX5HXI6.png', 0, 1, 0, '2020-03-11 16:31:49', '2020-03-11 16:31:49', '<p>Mussarela, peito de peru, calabresa, bacon, palmito, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583944309zdzyX5HXI6-sm.png', 1, 0),
(28, 1, 2, 'Lombinho', '35.00', '0.00', '/assets/img/items/1583944369eIrnKMw4fp.png', 0, 0, 0, '2020-03-11 16:32:49', '2020-03-11 16:32:49', '<p>Mussarela, lombo, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583944369eIrnKMw4fp-sm.png', 1, 0),
(29, 1, 2, 'Lombopiry', '38.00', '0.00', '/assets/img/items/1583944410tBieqbWUWo.png', 0, 0, 0, '2020-03-11 16:33:30', '2020-03-11 16:33:30', '<p>Mussarela, catupiry, lombo, cebola e oregano.</p>', '/assets/img/items/small/1583944410tBieqbWUWo-sm.png', 1, 0),
(30, 1, 2, 'Margarita', '35.00', '0.00', '/assets/img/items/158394447264yNxhIt94.png', 0, 1, 0, '2020-03-11 16:34:32', '2020-03-11 16:34:32', '<p>Mussarela, presunto, manjericão, tomate, cebola, azeitona e orégano.</p>', '/assets/img/items/small/158394447264yNxhIt94-sm.png', 1, 0),
(31, 1, 2, 'Milho Verde', '35.00', '0.00', '/assets/img/items/1583944540jLFDdEsoMd.png', 0, 0, 0, '2020-03-11 16:35:40', '2020-03-11 16:35:40', '<p>Mussarela, milho verde, bacon, tomate, azeitona e oregano.</p>', '/assets/img/items/small/1583944540jLFDdEsoMd-sm.png', 1, 0),
(32, 1, 2, 'Moda Marilia', '36.00', '0.00', '/assets/img/items/15839446291Xpljxp4XX.png', 0, 0, 0, '2020-03-11 16:37:09', '2020-03-11 16:37:09', '<p>Mussarela, atum, cebola, tomate, azeitona e orégano.&nbsp;</p>', '/assets/img/items/small/15839446291Xpljxp4XX-sm.png', 1, 0),
(33, 1, 2, 'Mussarela', '34.00', '0.00', '/assets/img/items/15839446704YS5QzW35j.png', 0, 1, 0, '2020-03-11 16:37:50', '2020-03-11 16:38:53', '<p>Mussarela, tomate, azeitona e orégano.&nbsp;</p>', '/assets/img/items/small/15839446704YS5QzW35j-sm.png', 1, 1),
(34, 1, 2, 'Tomate Seco', '36.00', '0.00', '/assets/img/items/1583944722GPyJI4t4Hv.png', 0, 0, 0, '2020-03-11 16:38:42', '2020-03-11 16:39:07', '<p>Mussarela, tomate seco, azeitona e oregano.</p>', '/assets/img/items/small/1583944722GPyJI4t4Hv-sm.png', 1, 1),
(35, 1, 2, 'Napolitana', '33.00', '0.00', '/assets/img/items/1583944793t1GaUnUIJt.png', 0, 0, 0, '2020-03-11 16:39:53', '2020-03-11 16:39:53', '<p>Mussarela, palmito, tomate, azeitona e oregano.</p>', '/assets/img/items/small/1583944793t1GaUnUIJt-sm.png', 1, 1),
(36, 1, 2, 'Palmito', '35.00', '0.00', '/assets/img/items/1583944841anQAkfQkSE.png', 0, 0, 0, '2020-03-11 16:40:41', '2020-03-11 16:40:41', '<p>Mussarela, palmito, cebola, bacon, tomate, azeitona e orégano.&nbsp;</p>', '/assets/img/items/small/1583944841anQAkfQkSE-sm.png', 1, 0),
(37, 1, 2, 'Pigalle', '36.00', '0.00', '/assets/img/items/1583944896sIQHEKHEjJ.png', 0, 1, 0, '2020-03-11 16:41:36', '2020-03-11 16:41:36', '<p>Mussarela, catupity, cebola, peito de peru, presunto, azeitona e oregano.</p>', '/assets/img/items/small/1583944896sIQHEKHEjJ-sm.png', 1, 0),
(38, 1, 2, 'Pigalle Esp', '37.00', '0.00', '/assets/img/items/1583944959e0VySJpnqf.png', 0, 1, 0, '2020-03-11 16:42:39', '2020-03-11 17:23:16', '<p>Mussarela, frango, catupiry, ervilha, palmito, bacon, tomate, azeitona e orégano.</p>', '/assets/img/items/small/1583944959e0VySJpnqf-sm.png', 1, 0),
(39, 1, 2, 'Pizza Tudo', '37.00', '0.00', '/assets/img/items/1583945057amnXhqZKiX.png', 0, 1, 0, '2020-03-11 16:44:17', '2020-03-11 16:44:17', '<p>Mussarela, catupiry, ervilha, provolone, lombo, milho, palmito, calabresa, azeitona e orégano.</p>', '/assets/img/items/small/1583945057amnXhqZKiX-sm.png', 1, 0),
(40, 1, 2, 'Saborosa', '36.00', '0.00', '/assets/img/items/1583945127BoGXwZ4GqX.png', 0, 0, 0, '2020-03-11 16:45:27', '2020-03-11 16:45:27', '<p>Mussarela, presunto, calabresa, bacon, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583945127BoGXwZ4GqX-sm.png', 1, 0),
(41, 1, 2, 'Serrana', '38.00', '0.00', '/assets/img/items/1583945203XNsR4fEKyy.png', 1, 1, 0, '2020-03-11 16:46:43', '2020-03-11 16:46:43', '<p>Mussarela, tomate seco, manjericão, catupiry, bacon, salaminho, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1583945203XNsR4fEKyy-sm.png', 1, 0),
(42, 1, 2, 'Strogonoff', '41.00', '0.00', '/assets/img/items/1583945326Kw952FNPnK.png', 1, 1, 0, '2020-03-11 16:48:46', '2020-03-11 16:48:46', '<p>Mussarela, strogonoff, batata palha, azeitona e orégano.&nbsp;</p>', '/assets/img/items/small/1583945326Kw952FNPnK-sm.png', 1, 0),
(43, 1, 2, 'Vegetariana', '34.00', '0.00', '/assets/img/items/1583945378eV94C60Rmc.png', 0, 0, 0, '2020-03-11 16:49:38', '2020-03-11 16:49:38', '<p>Mussarela, milho, palmito, ervilham tomate, cebola, azeitona e orégano</p>', '/assets/img/items/small/1583945378eV94C60Rmc-sm.png', 1, 1),
(44, 1, 13, 'Banana', '35.00', '0.00', '/assets/img/items/1583945617oFVPln8hIG.png', 0, 1, 0, '2020-03-11 16:53:37', '2020-03-11 16:53:37', 'Mussarela, açúcar, banana, canela.', '/assets/img/items/small/1583945617oFVPln8hIG-sm.png', 1, 0),
(45, 1, 13, 'Chocolate', '36.00', '0.00', '/assets/img/items/1583945689Y3UW0E8Wfo.png', 0, 1, 0, '2020-03-11 16:54:49', '2020-03-11 16:54:49', '<p>Mussarela, chocolate e leite condensado.</p>', '/assets/img/items/small/1583945689Y3UW0E8Wfo-sm.png', 1, 0),
(46, 1, 13, 'Romeu e Julieta', '35.00', '0.00', '/assets/img/items/1583945738hhRAUXTNtm.png', 0, 0, 0, '2020-03-11 16:55:38', '2020-03-11 16:55:38', '<p>Mussarela, goiabada e creme de leite.</p>', '/assets/img/items/small/1583945738hhRAUXTNtm-sm.png', 1, 0),
(47, 4, 14, 'Tradicional especial', '7.00', '0.00', '/assets/img/items/1584220920ocnQgAWlvr.jpg', 0, 1, 0, '2020-03-14 21:22:00', '2020-03-14 21:26:34', '<p>Pão, 2 salsichas, mussarela, catupiri, milho, batata palha, molho.<br></p>', '/assets/img/items/small/1584220920ocnQgAWlvr-sm.jpg', 1, 0),
(48, 4, 14, 'Molho branco simples', '6.00', '0.00', '/assets/img/items/1584220989UCI2T5XZHt.jpg', 1, 1, 0, '2020-03-14 21:23:09', '2020-03-14 21:23:09', '<p>Pão, 1 salsicha, mussarela, catupiri, milho, batata palha, molho branco com franco.<br></p>', '/assets/img/items/small/1584220989UCI2T5XZHt-sm.jpg', 1, 0),
(49, 4, 14, 'Molho branco especial', '7.00', '0.00', '/assets/img/items/1584221164Q3wqFNbOLM.jpg', 1, 1, 0, '2020-03-14 21:26:05', '2020-03-14 21:26:05', '<p>Pão, 2 salsichas, mussarela, catupiri, milho, batata palha, molho branco de frango.<br></p>', '/assets/img/items/small/1584221164Q3wqFNbOLM-sm.jpg', 1, 0),
(50, 4, 14, 'Na chapa', '10.00', '0.00', '/assets/img/items/15842214155GBUdGjsFf.jpg', 0, 1, 0, '2020-03-14 21:30:15', '2020-03-14 21:33:37', '<p>Pão, 1 salsicha, bacon, frango, mussarela, catupiri, milho, batata palha, molho.<br></p>', '/assets/img/items/small/15842214155GBUdGjsFf-sm.jpg', 1, 0),
(51, 4, 14, 'Moda da casa', '12.50', '0.00', '/assets/img/items/1584221559b1F7hl8njQ.jpg', 1, 1, 1, '2020-03-14 21:32:39', '2020-03-15 23:05:55', '<p>Pão, 1 salsichas, bacon, calabresa, frango, ovo, ovo de codorna, cheddar, mussarela, catupiri, milho, batata palha, molho.<br></p>', '/assets/img/items/small/1584221559b1F7hl8njQ-sm.jpg', 1, 0),
(52, 3, 20, 'Combo Raiz', '23.99', '0.00', '/assets/img/items/1584225279mKgL5kBSHx.png', 0, 1, 0, '2020-03-14 22:34:39', '2020-03-14 22:34:39', '<p>Burger Raiz ou X-Tudo + 500ml de suco natural de laranja + Batata especial</p>', '/assets/img/items/small/1584225279mKgL5kBSHx-sm.png', 1, 0),
(53, 3, 20, 'Combo Raiz Casal', '29.99', '0.00', '/assets/img/items/1584225766hM5dpCFcf1.png', 1, 1, 0, '2020-03-14 22:36:16', '2020-03-14 22:42:46', '<p>2 Burger raiz ou 2 X-Tudo + 1 litro de suco natural de laranja + Batata especial</p>', '/assets/img/items/small/1584225766hM5dpCFcf1-sm.png', 1, 0),
(54, 3, 20, 'Batata Especial 400g', '11.99', '0.00', '/assets/img/items/1584225747Kd4QPOGmN6.jpg', 0, 1, 0, '2020-03-14 22:37:24', '2020-03-14 22:42:27', '<p>Batata, Cheddar, Bacon&nbsp;</p>', '/assets/img/items/small/1584225747Kd4QPOGmN6-sm.jpg', 1, 0),
(55, 3, 19, 'Água s/ gás', '2.00', '0.00', '/assets/img/items/15842258738zuN8pQR4Y.jpeg', 0, 0, 0, '2020-03-14 22:38:48', '2020-03-15 00:39:14', '<p>Água mineral sem gás</p>', '/assets/img/items/small/15842258738zuN8pQR4Y-sm.jpeg', 1, 0),
(56, 3, 19, 'Água c/ gás', '2.50', '0.00', '/assets/img/items/1584225935liAZI3eEoC.jpeg', 0, 0, 0, '2020-03-14 22:45:35', '2020-03-15 00:39:33', '<p>Água mineral com gás<br></p>', '/assets/img/items/small/1584225935liAZI3eEoC-sm.jpeg', 1, 0),
(57, 3, 19, 'Skol lata', '3.50', '0.00', '/assets/img/items/1584226008eozoyG9XYF.jpg', 0, 1, 0, '2020-03-14 22:46:48', '2020-03-14 22:46:48', '<p>Cerveja Skol Lata</p>', '/assets/img/items/small/1584226008eozoyG9XYF-sm.jpg', 1, 0),
(58, 3, 19, 'Suco de Laranja', '9.99', '0.00', '/assets/img/items/1584226097zsI2RVTX6a.jpg', 0, 1, 0, '2020-03-14 22:48:17', '2020-03-14 22:49:54', '<p>Suco natural de laranja 1 Litro&nbsp;</p>', '/assets/img/items/small/1584226097zsI2RVTX6a-sm.jpg', 1, 0),
(59, 3, 19, 'Suco de Laranja', '4.99', '0.00', '/assets/img/items/1584226168knuRAmmrPn.jpg', 0, 0, 0, '2020-03-14 22:49:28', '2020-03-15 00:39:52', '<p>Suco natural de laranja 500ml</p>', '/assets/img/items/small/1584226168knuRAmmrPn-sm.jpg', 1, 0),
(60, 3, 19, 'Refrigerante Coca-Cola', '7.99', '0.00', '/assets/img/items/1584227100dWPZqs3kJn.jpg', 1, 1, 0, '2020-03-14 23:05:00', '2020-03-14 23:05:00', '<p>Refrigerante coca cola 2 Litros</p>', '/assets/img/items/small/1584227100dWPZqs3kJn-sm.jpg', 1, 0),
(61, 3, 19, 'Refrigerante Guaraná', '7.99', '0.00', '/assets/img/items/1584233729hG4KA7tde4.jpg', 0, 1, 0, '2020-03-15 00:55:29', '2020-03-15 00:55:29', '<p>Refrigerante Guaraná 2 Litros</p>', '/assets/img/items/small/1584233729hG4KA7tde4-sm.jpg', 1, 0),
(62, 3, 19, 'Refrigerante Coca-Cola', '3.99', '0.00', '/assets/img/items/15842338265bpAfm8yZg.png', 0, 1, 0, '2020-03-15 00:57:06', '2020-03-15 00:57:06', 'Refrigerante coca-cola lata', '/assets/img/items/small/15842338265bpAfm8yZg-sm.png', 1, 0),
(63, 3, 19, 'Refrigerante Guaraná', '3.99', '0.00', '/assets/img/items/1584233936JERKMS0Hpi.jpg', 0, 1, 0, '2020-03-15 00:58:56', '2020-03-15 00:58:56', '<p><span style=\"font-size: 14.4px;\">Refrigerante Guaraná lata</span><br></p>', '/assets/img/items/small/1584233936JERKMS0Hpi-sm.jpg', 1, 0),
(64, 3, 19, 'Refrigerante Coca-Cola', '4.99', '0.00', '/assets/img/items/1584234016ID7ssnGzjh.jpg', 0, 1, 0, '2020-03-15 01:00:17', '2020-03-15 01:00:17', '<p>Refrigerante Coca-Cola 1 Litro&nbsp;</p>', '/assets/img/items/small/1584234016ID7ssnGzjh-sm.jpg', 1, 0),
(65, 3, 18, 'Burguer Raiz', '9.99', '0.00', '/assets/img/items/1584234130yWsQCfG6bJ.png', 0, 1, 0, '2020-03-15 01:02:10', '2020-03-15 01:04:16', 'Pão, Blend, Queijo mussarela, Alface, Cebola, Picles, Tomate e Molho da Casa.&nbsp;', '/assets/img/items/small/1584234130yWsQCfG6bJ-sm.png', 1, 0),
(66, 3, 18, 'Frango Madeira', '9.99', '0.00', '/assets/img/items/1584234242Uug6iDfqNR.png', 0, 1, 0, '2020-03-15 01:04:02', '2020-03-15 01:04:02', '<p>Pão, Filé de peito de frango, Queijo mussarela, Alface, Bacon, Cebola, Picles e Tomate.&nbsp;<br></p>', '/assets/img/items/small/1584234242Uug6iDfqNR-sm.png', 1, 0),
(67, 3, 18, 'Raiz Kids', '7.99', '0.00', '/assets/img/items/1584234316pXfV5OL2Bz.png', 0, 1, 0, '2020-03-15 01:05:16', '2020-03-15 01:05:16', '<p>Pão, Blend, Queijo mussarela e Molho da Casa.&nbsp;<br></p>', '/assets/img/items/small/1584234316pXfV5OL2Bz-sm.png', 1, 0),
(68, 3, 18, 'Hipster', '16.99', '0.00', '/assets/img/items/1584234404t866Y3jkIZ.png', 0, 1, 0, '2020-03-15 01:06:44', '2020-03-15 01:06:44', '<p>Pão, Blend, Queijo mussarela, Abacaxi, Alface, Cebola, Tomate e Molho da Casa.&nbsp;<br></p>', '/assets/img/items/small/1584234404t866Y3jkIZ-sm.png', 1, 0),
(69, 3, 18, 'Duplo Lenha', '18.99', '0.00', '/assets/img/items/1584234473W4CCFGP68c.png', 0, 1, 0, '2020-03-15 01:07:54', '2020-03-15 01:07:54', '<p>Pão, Duplo Blend, Duplo queijo mussarela, Bacon, Alface, Cebola, Picles, Tomate e Molho da Casa.&nbsp;<br></p>', '/assets/img/items/small/1584234473W4CCFGP68c-sm.png', 1, 0),
(70, 3, 18, 'Bacon Rústico', '19.99', '0.00', '/assets/img/items/15842345439CONxQSkD5.png', 0, 1, 0, '2020-03-15 01:09:03', '2020-03-15 01:09:03', '<p>Pão, Duplo Blend, Duplo queijo mussarela, Duplo Bacon, Alface, Cebola, Picles, Tomate e Molho da Casa.&nbsp;<br></p>', '/assets/img/items/small/15842345439CONxQSkD5-sm.png', 1, 0),
(71, 3, 18, 'King Kong', '24.99', '0.00', '/assets/img/items/1584234632shi09urzpg.png', 0, 1, 0, '2020-03-15 01:10:32', '2020-03-15 01:10:32', '<p>Pão, Triplo Blend, Triplo queijo mussarela, Triplo Bacon, Filé de peito de frango, Alface, Cebola, Picles, Tomate e Molho da Casa.&nbsp;<br></p>', '/assets/img/items/small/1584234632shi09urzpg-sm.png', 1, 0),
(72, 3, 21, 'Misto Quente', '4.99', '0.00', '/assets/img/items/1584234741DOf3QeZwiY.jpeg', 0, 1, 0, '2020-03-15 01:12:21', '2020-03-15 01:12:21', '<p>Pão, Presunto e Queijo mussarela.</p>', '/assets/img/items/small/1584234741DOf3QeZwiY-sm.jpeg', 1, 0),
(73, 3, 21, 'X-Salada', '7.99', '0.00', '/assets/img/items/1584234821Zo30zmeMkS.png', 0, 1, 0, '2020-03-15 01:13:42', '2020-03-15 01:13:42', '<p>Pão, Hambúrguer caseiro, Presunto, Queijo mussarela, Ovo, Tomate, Alface e Milho.</p>', '/assets/img/items/small/1584234821Zo30zmeMkS-sm.png', 1, 0),
(74, 3, 21, 'X-Frango', '9.99', '0.00', '/assets/img/items/1584234875wFo6FfXi07.png', 0, 1, 0, '2020-03-15 01:14:35', '2020-03-15 01:14:35', '<p>Pão, Filé de peito de frango, Queijo mussarela, Ovo, Tomate e Alface.<br></p>', '/assets/img/items/small/1584234875wFo6FfXi07-sm.png', 1, 0),
(75, 3, 21, 'X-Bagunça', '9.99', '0.00', '/assets/img/items/1584234936x58pbu83uQ.png', 0, 1, 0, '2020-03-15 01:15:37', '2020-03-15 01:15:37', '<p>Pão, Hambúrguer caseiro, Presunto, Queijo mussarela, Bacon, Calabresa, Ovo, Tomate, Alface, Milho e Batata palha.<br></p>', '/assets/img/items/small/1584234936x58pbu83uQ-sm.png', 1, 0),
(76, 3, 21, 'X-Tudo', '11.99', '0.00', '/assets/img/items/15842356481wHLI9fVs8.png', 1, 1, 0, '2020-03-15 01:27:28', '2020-03-15 01:27:28', '<p>Pão, Hambúrguer, Presunto, Calabresa, Bacon, Queijo mussarela, Salsicha, Ovo, Tomate, Alface, Molho, Batata palha e Milho.<br></p>', '/assets/img/items/small/15842356481wHLI9fVs8-sm.png', 1, 0),
(77, 5, 23, 'Chocolate meio amargo', '4.00', '0.00', '/assets/img/items/15843822722ioypZSDRA.jpg', 0, 1, 0, '2020-03-16 18:11:12', '2020-03-16 18:16:55', '<p><span style=\"font-size: 14.4px;\">Donuts de chocolate meio amargo</span><br></p>', '/assets/img/items/small/15843822722ioypZSDRA-sm.jpg', 1, 0),
(78, 5, 23, 'Mousse de limão', '4.00', '0.00', '/assets/img/items/15843823670VAXr1B7Bf.jpg', 0, 1, 0, '2020-03-16 18:12:48', '2020-03-16 18:16:15', '<p><span style=\"font-size: 14.4px;\">Donuts de&nbsp;mousse de limão com raspas de chocolate branco e limao</span><br></p>', '/assets/img/items/small/15843823670VAXr1B7Bf-sm.jpg', 1, 0),
(79, 5, 23, 'Ovomaltine', '4.00', '0.00', '/assets/img/items/1584382458pfZqcZ4Erd.jpg', 0, 1, 0, '2020-03-16 18:14:19', '2020-03-16 18:15:54', '<p>Donuts de Ovomaltine.</p>', '/assets/img/items/small/1584382458pfZqcZ4Erd-sm.jpg', 1, 0),
(80, 5, 23, 'Nutella', '4.00', '0.00', '/assets/img/items/1584382530aIX2d6j0FZ.jpg', 0, 1, 0, '2020-03-16 18:15:31', '2020-03-16 18:16:35', '<p>Donuts de nutella.</p>', '/assets/img/items/small/1584382530aIX2d6j0FZ-sm.jpg', 1, 0),
(81, 5, 23, 'Beijinho', '3.50', '0.00', '/assets/img/items/1584382687VT4ddvcN1N.jpg', 0, 1, 0, '2020-03-16 18:18:07', '2020-03-16 18:18:07', '<p>Donuts de beijinho<br></p>', '/assets/img/items/small/1584382687VT4ddvcN1N-sm.jpg', 1, 0),
(82, 5, 23, 'Doce de leite', '3.50', '0.00', '/assets/img/items/1584382739Vk0fUva8C0.jpg', 0, 1, 0, '2020-03-16 18:18:59', '2020-03-16 18:18:59', '<p>Donuts de doce de leite<br></p>', '/assets/img/items/small/1584382739Vk0fUva8C0-sm.jpg', 1, 0),
(83, 5, 23, 'Leite ninho', '4.00', '0.00', '/assets/img/items/1584382833ugbynUoeEU.jpg', 0, 1, 0, '2020-03-16 18:20:33', '2020-03-16 18:20:33', '<p>Donuts de leite ninho<br></p>', '/assets/img/items/small/1584382833ugbynUoeEU-sm.jpg', 1, 0),
(84, 5, 22, 'Tradicional', '3.50', '0.00', '/assets/img/items/15843829885ACFwxig6v.jpg', 0, 1, 0, '2020-03-16 18:23:08', '2020-03-16 18:23:08', '<p>Sonho tradicional&nbsp;de doce de leite</p>', '/assets/img/items/small/15843829885ACFwxig6v-sm.jpg', 1, 0),
(85, 5, 22, 'Caramelizado', '4.00', '0.00', '/assets/img/items/1584383037z3Pr84Gko7.jpg', 0, 1, 0, '2020-03-16 18:23:57', '2020-03-16 18:23:57', '<p><span style=\"font-size: 14.4px;\">Sonhos caramelizados com recheio de creme de doce de leite</span><br></p>', '/assets/img/items/small/1584383037z3Pr84Gko7-sm.jpg', 1, 0),
(86, 5, 23, 'Brigadeiro', '3.50', '0.00', '/assets/img/items/1584383782KSvsUdvgLM.jpg', 0, 1, 0, '2020-03-16 18:36:22', '2020-03-16 18:36:22', '<p>Donuts de brigadeiro</p>', '/assets/img/items/small/1584383782KSvsUdvgLM-sm.jpg', 1, 0),
(87, 6, 24, 'Carne', '6.00', '0.00', '/assets/img/items/158438917116RrmxGJFw.jpg', 0, 1, 0, '2020-03-16 20:06:12', '2020-03-16 20:06:12', '<p>Espetinho de carne com mandioca&nbsp;</p>', '/assets/img/items/small/158438917116RrmxGJFw-sm.jpg', 1, 0),
(88, 6, 24, 'Almôndegas c/queijo e bacon', '7.00', '0.00', '/assets/img/items/15843894320inWaaPpbj.jpeg', 0, 1, 0, '2020-03-16 20:10:33', '2020-03-16 20:26:44', '<p>Espetinho de almôndegas com queijo e bacon com mandioca.</p>', '/assets/img/items/small/15843894320inWaaPpbj-sm.jpeg', 1, 0),
(89, 6, 24, 'Filé c/ bacon', '7.00', '0.00', '/assets/img/items/15843895263JRc7SeJ5K.jpg', 0, 1, 0, '2020-03-16 20:12:06', '2020-03-16 20:27:39', '<p>Espetinho de filé com bacon e mandioca.</p>', '/assets/img/items/small/15843895263JRc7SeJ5K-sm.jpg', 1, 0),
(90, 6, 24, 'Frango c/ bacon', '7.00', '0.00', '/assets/img/items/1584389595mhj05Yqozb.jpg', 0, 1, 0, '2020-03-16 20:13:15', '2020-03-16 20:28:12', '<p>Espetinho de frango com bacon e mandioca</p>', '/assets/img/items/small/1584389595mhj05Yqozb-sm.jpg', 1, 0),
(91, 6, 24, 'Carne de sol', '8.00', '0.00', '/assets/img/items/1584390281GkMvVCQdEm.jpg', 0, 1, 0, '2020-03-16 20:24:41', '2020-03-16 20:26:06', '<p>Espetinho de carne de sol com mandioca.</p>', '/assets/img/items/small/1584390281GkMvVCQdEm-sm.jpg', 1, 0),
(92, 6, 24, 'Picanha', '10.00', '0.00', '/assets/img/items/1584390339VLjO2fEvnW.jpg', 0, 1, 0, '2020-03-16 20:25:40', '2020-03-16 20:25:40', '<p>Espetinho de picanha com mandioca.</p>', '/assets/img/items/small/1584390339VLjO2fEvnW-sm.jpg', 1, 0),
(93, 6, 24, 'Cupim', '8.00', '0.00', '/assets/img/items/1584390607mqlrrBtlKK.jpg', 0, 1, 0, '2020-03-16 20:30:08', '2020-03-16 20:30:08', '<p>Espetinho de cupim com mandioca&nbsp;</p>', '/assets/img/items/small/1584390607mqlrrBtlKK-sm.jpg', 1, 0),
(94, 6, 24, 'Coração', '6.00', '0.00', '/assets/img/items/1584390697sngD4ih0kV.jpeg', 0, 1, 0, '2020-03-16 20:31:37', '2020-03-16 20:31:37', '<p>Espetinho de coração com mandioca&nbsp;</p>', '/assets/img/items/small/1584390697sngD4ih0kV-sm.jpeg', 1, 0),
(95, 6, 24, 'Queijo', '6.00', '0.00', '/assets/img/items/1584390797WSu8b6XExL.jpeg', 0, 1, 0, '2020-03-16 20:33:17', '2020-03-16 20:33:17', '<p>Espetinho de queijo com mandioca</p>', '/assets/img/items/small/1584390797WSu8b6XExL-sm.jpeg', 1, 0),
(96, 6, 24, 'Linguiça apimentada', '7.00', '0.00', '/assets/img/items/1584390901MZ9YYXLhOX.jpeg', 0, 1, 0, '2020-03-16 20:35:01', '2020-03-16 20:35:01', '<p>Espetinho de linguiça apimentada com mandioca&nbsp;</p>', '/assets/img/items/small/1584390901MZ9YYXLhOX-sm.jpeg', 1, 0),
(97, 6, 24, 'Meio da asa', '7.00', '0.00', '/assets/img/items/1584390992KdPpRlcIpE.png', 0, 1, 0, '2020-03-16 20:36:32', '2020-03-16 20:36:32', '<p>Espetinho de meio da asa com mandioca&nbsp;</p>', '/assets/img/items/small/1584390992KdPpRlcIpE-sm.png', 1, 0),
(98, 6, 24, 'Língua', '7.00', '0.00', '/assets/img/items/15843910932vKoNpQASn.jpeg', 0, 1, 0, '2020-03-16 20:38:13', '2020-03-16 20:38:13', '<p>Espetinho de lingua com mandioca&nbsp;</p>', '/assets/img/items/small/15843910932vKoNpQASn-sm.jpeg', 1, 0),
(99, 6, 25, 'Carne', '13.00', '0.00', '/assets/img/items/1584391633oOjxcb1HtA.png', 0, 1, 0, '2020-03-16 20:40:53', '2020-03-16 20:50:39', '<p>Jantinha com espetinho de Carne, Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete&nbsp;</p>', '/assets/img/items/small/1584391633oOjxcb1HtA-sm.png', 1, 0),
(100, 6, 25, 'Almôndega c/ queijo e bacon', '14.00', '0.00', '/assets/img/items/1584391794QoK6cSUP7l.jpeg', 0, 1, 0, '2020-03-16 20:49:55', '2020-03-16 20:50:17', '<p>Jantinha com espetinho de almondega com queijo e bacon. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete&nbsp;<br></p>', '/assets/img/items/small/1584391794QoK6cSUP7l-sm.jpeg', 1, 0),
(101, 6, 25, 'Filé c/ bacon', '14.00', '0.00', '/assets/img/items/1584391925VggvJvKSsR.png', 1, 1, 0, '2020-03-16 20:52:05', '2020-03-16 20:52:05', '<p>Jantinha com espetinho de filé com bacon. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete&nbsp;<br></p>', '/assets/img/items/small/1584391925VggvJvKSsR-sm.png', 1, 0),
(102, 6, 25, 'Frango c/ bacon', '14.00', '0.00', '/assets/img/items/1584392012E7HrrDTwF1.png', 1, 1, 0, '2020-03-16 20:53:33', '2020-03-16 20:53:33', '<p>Jantinha com espetinho de frango com bacon. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392012E7HrrDTwF1-sm.png', 1, 0),
(103, 6, 25, 'Carne de sol', '16.00', '0.00', '/assets/img/items/15843921736Ei3RUtZrO.png', 0, 1, 0, '2020-03-16 20:56:14', '2020-03-16 20:56:14', '<p>Jantinha com espetinho de carne de sol. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/15843921736Ei3RUtZrO-sm.png', 1, 0),
(104, 6, 25, 'Picanha', '17.00', '0.00', '/assets/img/items/15843922464Xq3BmKEFe.png', 1, 1, 0, '2020-03-16 20:57:26', '2020-03-16 20:57:26', '<p>Jantinha com espetinho de picanha. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/15843922464Xq3BmKEFe-sm.png', 1, 0),
(105, 6, 25, 'Cupim', '16.00', '0.00', '/assets/img/items/1584392303YgjcueBhPI.png', 0, 1, 0, '2020-03-16 20:58:23', '2020-03-16 20:58:23', '<p>Jantinha com espetinho cupim. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392303YgjcueBhPI-sm.png', 1, 0),
(106, 6, 25, 'Coração', '13.00', '0.00', '/assets/img/items/1584392423d8ZMr8n5C9.jpeg', 0, 1, 0, '2020-03-16 21:00:23', '2020-03-16 21:00:23', '<p>Jantinha com espetinho de coração. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392423d8ZMr8n5C9-sm.jpeg', 1, 0),
(107, 6, 25, 'Queijo', '13.00', '0.00', '/assets/img/items/1584392471Ckff42dZxz.jpeg', 0, 1, 0, '2020-03-16 21:01:11', '2020-03-16 21:01:11', '<p>Jantinha com espetinho de queijo. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392471Ckff42dZxz-sm.jpeg', 1, 0),
(108, 6, 25, 'Linguiça apimentada', '14.00', '0.00', '/assets/img/items/15843925502D1L2E0FPQ.jpeg', 0, 1, 0, '2020-03-16 21:02:30', '2020-03-16 21:02:30', '<p>Jantinha com espetinho de linguiça apimentada. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/15843925502D1L2E0FPQ-sm.jpeg', 1, 0),
(109, 6, 25, 'Meio da asa', '14.00', '0.00', '/assets/img/items/1584392610NKsDW2nt6K.png', 0, 1, 0, '2020-03-16 21:03:30', '2020-03-16 21:03:30', '<p>Jantinha com espetinho de meio da asa. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392610NKsDW2nt6K-sm.png', 1, 0),
(110, 6, 26, 'Língua', '14.00', '0.00', '/assets/img/items/1584392670uLXuSBRr6G.png', 0, 1, 0, '2020-03-16 21:04:30', '2020-03-16 21:04:30', '<p>Jantinha com espetinho de lingua. Acompanhamento: Arroz, Feijão Tropeiro, Mandioca, Maionese e Vinagrete.<br></p>', '/assets/img/items/small/1584392670uLXuSBRr6G-sm.png', 1, 0),
(111, 6, 26, 'Refrigerante Coca-Cola', '4.00', '0.00', '/assets/img/items/1584392871y4GwxcNXUi.jpeg', 0, 1, 0, '2020-03-16 21:07:51', '2020-03-16 21:07:51', '<p><span style=\"font-size: 14.4px;\">Refrigerante Coca-Cola lata.</span><br></p>', '/assets/img/items/small/1584392871y4GwxcNXUi-sm.jpeg', 1, 0),
(112, 6, 26, 'Refrigerante kuat', '4.00', '0.00', '/assets/img/items/1584451594xP19YjmuTd.jpg', 0, 1, 0, '2020-03-17 13:26:34', '2020-03-17 13:26:34', '<p><span style=\"font-size: 14.4px;\">Refrigerante kuat lata</span><br></p>', '/assets/img/items/small/1584451594xP19YjmuTd-sm.jpg', 1, 0),
(113, 6, 26, 'Refrigerante Sprite', '4.00', '0.00', '/assets/img/items/1584451651n12Vapee7i.jpg', 0, 1, 0, '2020-03-17 13:27:31', '2020-03-17 13:27:31', '<p><span style=\"font-size: 14.4px;\">Refrigerante Sprite lata</span><br></p>', '/assets/img/items/small/1584451651n12Vapee7i-sm.jpg', 1, 0),
(114, 6, 24, 'Refrigerante Fanta', '4.00', '0.00', '/assets/img/items/1584451725qKHKr4Hrs9.jpg', 0, 1, 0, '2020-03-17 13:28:46', '2020-03-17 13:28:46', '<p><span style=\"font-size: 14.4px;\">Refrigerante Fanta lata</span><br></p>', '/assets/img/items/small/1584451725qKHKr4Hrs9-sm.jpg', 1, 0),
(115, 6, 27, 'Dobradinha', '15.00', '0.00', '/assets/img/items/1584452059annZw1oeU7.jpg', 0, 1, 0, '2020-03-17 13:34:19', '2020-03-17 13:34:19', '<p><span style=\"font-size: 14.4px;\">Caldo de dobradinha com torrada, mussarela e cheiro verde.</span><br></p>', '/assets/img/items/small/1584452059annZw1oeU7-sm.jpg', 1, 0),
(116, 6, 27, 'Chambari', '15.00', '0.00', '/assets/img/items/158445208953ziRLpUSu.jpg', 0, 1, 0, '2020-03-17 13:34:50', '2020-03-17 13:34:50', '<p>Caldo de chambari com torrada, mussarela e cheiro verde.<br></p>', '/assets/img/items/small/158445208953ziRLpUSu-sm.jpg', 1, 0),
(117, 6, 27, 'Frango', '15.00', '0.00', '/assets/img/items/1584452146evTUqcFUh4.jpg', 0, 1, 0, '2020-03-17 13:35:46', '2020-03-17 13:35:46', '<p>Caldo de frango com torrada, mussarela e cheiro verde.<br></p>', '/assets/img/items/small/1584452146evTUqcFUh4-sm.jpg', 1, 0),
(118, 6, 26, 'Suco DelValle', '4.50', '0.00', '/assets/img/items/1584452340BGfZVmhkPx.jpg', 0, 1, 0, '2020-03-17 13:39:00', '2020-03-17 13:39:00', '<p><span style=\"font-size: 14.4px;\">Suco DelValle sabor laranja&nbsp;</span><br></p>', '/assets/img/items/small/1584452340BGfZVmhkPx-sm.jpg', 1, 0),
(119, 6, 26, 'Suco DelValle', '15.00', '0.00', '/assets/img/items/15844524627AzQhuNWXk.jpg', 0, 1, 0, '2020-03-17 13:41:02', '2020-03-17 13:41:02', '<p><span style=\"font-size: 14.4px;\">Suco DelValle sabor uva</span><br></p>', '/assets/img/items/small/15844524627AzQhuNWXk-sm.jpg', 1, 0),
(120, 6, 26, 'Heineken', '7.00', '0.00', '/assets/img/items/1584452755aJxycQuiBW.jpg', 0, 1, 0, '2020-03-17 13:45:55', '2020-03-17 13:45:55', '<p>Cerveja&nbsp;heineken long neck</p>', '/assets/img/items/small/1584452755aJxycQuiBW-sm.jpg', 1, 0),
(121, 8, 35, 'Frango', '14.00', '0.00', '/assets/img/items/1584456881ErL9WHDXmB.jpg', 0, 1, 0, '2020-03-17 14:54:41', '2020-03-17 14:54:41', '<p>Caldo de frango.</p>', '/assets/img/items/small/1584456881ErL9WHDXmB-sm.jpg', 1, 0),
(122, 8, 35, 'Feijão', '14.00', '0.00', '/assets/img/items/1584456959Bmu7N727bS.jpg', 0, 0, 0, '2020-03-17 14:55:59', '2020-03-17 14:55:59', '<p>Caldo de feijão.</p>', '/assets/img/items/small/1584456959Bmu7N727bS-sm.jpg', 1, 0),
(123, 8, 35, 'Abobora com carne seca', '14.00', '0.00', '/assets/img/items/1584457043N1bQdyXUsk.jpg', 0, 1, 0, '2020-03-17 14:57:23', '2020-03-17 14:57:23', '<p><span style=\"font-size: 14.4px;\">Caldo de abobora com carne seca.</span><br></p>', '/assets/img/items/small/1584457043N1bQdyXUsk-sm.jpg', 1, 0),
(124, 8, 35, 'Vaca Atolada', '14.00', '0.00', '/assets/img/items/15844570970VtxuwNVwq.jpg', 0, 1, 0, '2020-03-17 14:58:17', '2020-03-17 15:32:58', '<p>Caldo de vaca atolada.</p>', '/assets/img/items/small/15844570970VtxuwNVwq-sm.jpg', 1, 0),
(125, 8, 34, 'Moda da Casa', '20.00', '0.00', '/assets/img/items/1584457569Z8joDMcPyH.png', 0, 1, 0, '2020-03-17 15:06:09', '2020-03-17 15:32:35', '<p>Pão, hambúrguer, alface, tomate, milho, frango, salsicha, batata palha, calabresa, presunto, ovo, queijo e bacon.</p>', '/assets/img/items/small/1584457569Z8joDMcPyH-sm.png', 1, 0),
(126, 8, 34, 'X-Americano', '8.00', '0.00', '/assets/img/items/1584457647OOmdFuCqs4.png', 0, 0, 0, '2020-03-17 15:07:27', '2020-03-17 15:07:41', '<p>Pão, hambúrguer, alface, tomate,&nbsp; ovo, queijo.<br></p>', '/assets/img/items/small/1584457647OOmdFuCqs4-sm.png', 1, 0),
(127, 8, 34, 'X-Burguer', '6.00', '0.00', '/assets/img/items/1584457916vchHD9GmNf.png', 0, 0, 0, '2020-03-17 15:11:56', '2020-03-17 15:13:15', '<p>Pão, hambúrguer, presunto e queijo.</p>', '/assets/img/items/small/1584457916vchHD9GmNf-sm.png', 1, 0),
(128, 8, 34, 'X-Salada', '8.50', '0.00', '/assets/img/items/15844579825popPvFRS6.png', 0, 1, 0, '2020-03-17 15:13:03', '2020-03-17 15:13:03', '<p>Pão, hambúrguer, presunto, queijo, milho, tomate e alface.<br></p>', '/assets/img/items/small/15844579825popPvFRS6-sm.png', 1, 0),
(129, 8, 34, 'X-Salada Esp', '9.00', '0.00', '/assets/img/items/1584458123qsbH67eTDa.png', 0, 1, 0, '2020-03-17 15:15:23', '2020-03-17 15:15:23', '<p>Pão, hambúrguer, presunto, queijo, ovo, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458123qsbH67eTDa-sm.png', 1, 0),
(130, 8, 34, 'X-Bacon', '9.50', '0.00', '/assets/img/items/1584458183Vo1m8K8m1d.png', 0, 1, 0, '2020-03-17 15:16:23', '2020-03-17 15:16:23', '<p>Pão, hambúrguer, presunto, queijo, bacon, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458183Vo1m8K8m1d-sm.png', 1, 0),
(131, 8, 34, 'X-Tudo', '10.00', '0.00', '/assets/img/items/1584458239mnSdiBmccP.png', 0, 1, 0, '2020-03-17 15:17:20', '2020-03-17 15:32:14', '<p>Pão, hambúrguer, presunto, queijo, ovo, bacon, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458239mnSdiBmccP-sm.png', 1, 0),
(132, 8, 34, 'X-Tudo Esp', '11.00', '0.00', '/assets/img/items/15844583194eYajxAAhj.png', 0, 1, 0, '2020-03-17 15:18:39', '2020-03-17 15:18:39', '<p>Pão, hambúrguer, presunto, queijo, salsicha, milho, tomate e alface.<br></p>', '/assets/img/items/small/15844583194eYajxAAhj-sm.png', 1, 0),
(133, 8, 34, 'X-Frango', '8.00', '0.00', '/assets/img/items/1584458489jBE3NpdTl0.png', 0, 1, 0, '2020-03-17 15:21:29', '2020-03-17 15:21:29', '<p>Pão, frango, presunto, queijo, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458489jBE3NpdTl0-sm.png', 1, 0),
(134, 8, 34, 'X-Frango Esp', '9.00', '0.00', '/assets/img/items/1584458535l0PJfsHMU4.png', 0, 1, 0, '2020-03-17 15:22:15', '2020-03-17 15:31:58', '<p>Pão, frango, presunto, queijo, ovo, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458535l0PJfsHMU4-sm.png', 1, 0),
(135, 8, 34, 'Bauru', '5.00', '0.00', '/assets/img/items/1584458584hjbKhJLuMM.png', 0, 0, 0, '2020-03-17 15:23:04', '2020-03-17 15:23:04', '<p>Pão, presunto, queijo e tomate.<br></p>', '/assets/img/items/small/1584458584hjbKhJLuMM-sm.png', 1, 0),
(136, 8, 34, 'X-File Bovino', '11.00', '0.00', '/assets/img/items/15844586404P6xoTLBE6.png', 0, 1, 0, '2020-03-17 15:24:00', '2020-03-17 15:24:00', '<p>Pão, file, presunto, queijo, milho, tomate e alface.<br></p>', '/assets/img/items/small/15844586404P6xoTLBE6-sm.png', 1, 0),
(137, 8, 34, 'X-File Frango', '10.00', '0.00', '/assets/img/items/1584458678hEX5sgE8O6.png', 0, 1, 0, '2020-03-17 15:24:38', '2020-03-17 15:24:38', '<p>Pão, file de frango, presunto, queijo, milho, tomate e alface.<br></p>', '/assets/img/items/small/1584458678hEX5sgE8O6-sm.png', 1, 0),
(138, 8, 34, 'X-Peito', '8.00', '0.00', '/assets/img/items/1584458727YxrHHdQzl6.png', 0, 0, 0, '2020-03-17 15:25:27', '2020-03-17 15:25:27', '<p>Pão, peito e queijo.<br></p>', '/assets/img/items/small/1584458727YxrHHdQzl6-sm.png', 1, 0),
(139, 8, 34, 'X-File Mignon', '9.00', '0.00', '/assets/img/items/1584458775JpxAEc4o2X.png', 0, 0, 0, '2020-03-17 15:26:15', '2020-03-17 15:26:15', '<p>Pão, file e queijo.<br></p>', '/assets/img/items/small/1584458775JpxAEc4o2X-sm.png', 1, 0),
(140, 8, 34, 'X-File Egg', '9.50', '0.00', '/assets/img/items/158445882118p99RNawH.png', 0, 0, 0, '2020-03-17 15:27:01', '2020-03-17 15:27:01', '<p>Pão, file, queijo e ovo.<br></p>', '/assets/img/items/small/158445882118p99RNawH-sm.png', 1, 0),
(141, 8, 34, 'X-File Salada Egg', '11.50', '0.00', '/assets/img/items/1584458878wkdnY9y3Vf.png', 0, 1, 0, '2020-03-17 15:27:58', '2020-03-17 15:27:58', '<p>Pão, file, queijo, alface, tomate e ovo.<br></p>', '/assets/img/items/small/1584458878wkdnY9y3Vf-sm.png', 1, 0),
(142, 8, 34, 'X-Calabresa', '7.00', '0.00', '/assets/img/items/1584458987qBudtyJv9O.png', 0, 0, 0, '2020-03-17 15:29:47', '2020-03-17 15:29:47', '<p>Pão, calabresa e queijo.<br></p>', '/assets/img/items/small/1584458987qBudtyJv9O-sm.png', 1, 0),
(143, 8, 34, 'X- Calabresa Bacon', '8.00', '0.00', '/assets/img/items/1584459030eH30yzf143.png', 0, 0, 0, '2020-03-17 15:30:30', '2020-03-17 15:30:30', '<p>Pão, calabresa, bacon e queijo.<br></p>', '/assets/img/items/small/1584459030eH30yzf143-sm.png', 1, 0),
(144, 8, 34, 'X-Calabresa Egg', '8.00', '0.00', '/assets/img/items/1584459068WvoBITrYmb.png', 0, 0, 0, '2020-03-17 15:31:08', '2020-03-17 15:31:08', '<p>Pão, calabresa, queijo e ovo.<br></p>', '/assets/img/items/small/1584459068WvoBITrYmb-sm.png', 1, 0),
(145, 8, 34, 'X-Egg', '7.00', '0.00', '/assets/img/items/1584459106FHH6Kgkizt.png', 0, 0, 0, '2020-03-17 15:31:46', '2020-03-17 15:31:46', '<p>Pão, hambúrguer, queijo e ovo.<br></p>', '/assets/img/items/small/1584459106FHH6Kgkizt-sm.png', 1, 0),
(146, 8, 33, 'Loirona', '24.00', '0.00', '/assets/img/items/15844599924INEJ5CNOU.png', 0, 0, 0, '2020-03-17 15:46:32', '2020-03-17 15:50:31', '<p>(Escolha o Tamanho) Mussarela, bananas em rodela, leite condensado, canela em pó e cerejas.</p>', '/assets/img/items/small/15844599924INEJ5CNOU-sm.png', 1, 0),
(147, 8, 33, 'Banana', '24.00', '0.00', '/assets/img/items/1584460852FpZTcN9qv9.png', 0, 0, 0, '2020-03-17 16:00:52', '2020-03-17 16:07:36', '<p><span style=\"font-size: 0.9rem;\">(Escolha o Tamanho)&nbsp;</span>Mussarela, bana, açúcar e canela.</p>', '/assets/img/items/small/1584460852FpZTcN9qv9-sm.png', 1, 0),
(148, 8, 33, 'California', '24.00', '0.00', '/assets/img/items/158446090888bZ5EhZrn.png', 0, 0, 0, '2020-03-17 16:01:48', '2020-03-17 16:08:02', '<p><span style=\"font-size: 0.9rem;\">(Escolha o Tamanho)&nbsp;</span>Mussarela, pêssego, abacaxi, açúcar e canela.</p>', '/assets/img/items/small/158446090888bZ5EhZrn-sm.png', 1, 0),
(149, 8, 33, 'Chocolate', '24.00', '0.00', '/assets/img/items/1584460964OgOAS4JoNh.png', 0, 0, 0, '2020-03-17 16:02:44', '2020-03-17 16:08:24', '<p><span style=\"font-size: 0.9rem;\">(Escolha o Tamanho)&nbsp;</span>Calda de chocolate e chocolate granulado.</p>', '/assets/img/items/small/1584460964OgOAS4JoNh-sm.png', 1, 0),
(150, 8, 33, 'Romeu e Julieta', '24.00', '0.00', '/assets/img/items/1584461005mkkmXCmBIq.png', 0, 0, 0, '2020-03-17 16:03:25', '2020-03-17 16:08:41', '<p><span style=\"font-size: 0.9rem;\">(Escolha o Tamanho)&nbsp;</span>Mussarela, catupiry e goiabada.</p>', '/assets/img/items/small/1584461005mkkmXCmBIq-sm.png', 1, 0),
(151, 8, 33, 'Prestigio', '24.00', '0.00', '/assets/img/items/1584461082NABFpltZJv.png', 0, 1, 0, '2020-03-17 16:04:42', '2020-03-17 16:08:56', '<p><span style=\"font-size: 0.9rem;\">(Escolha o Tamanho)&nbsp;</span>Mussarela, leite condensado, coco ralado e chocolate granulado.</p>', '/assets/img/items/small/1584461082NABFpltZJv-sm.png', 1, 0),
(152, 7, 29, 'Kinder', '10.00', '0.00', '/assets/img/items/15844647679A99JtGeli.jpg', 0, 1, 0, '2020-03-17 17:06:07', '2020-03-18 16:56:23', '<p>Brigadeirão de Kinder <br></p>', '/assets/img/items/small/15844647679A99JtGeli-sm.jpg', 0, 0),
(153, 7, 29, 'KitKat', '9.00', '0.00', '/assets/img/items/1584464820FAQomlgmd5.jpg', 0, 1, 0, '2020-03-17 17:07:00', '2020-03-18 16:56:21', '<p>Brigadeirão de KitKat<br></p>', '/assets/img/items/small/1584464820FAQomlgmd5-sm.jpg', 0, 0),
(154, 7, 29, 'Morango', '9.00', '0.00', '/assets/img/items/1584464960or1blzHZMX.jpg', 0, 1, 0, '2020-03-17 17:09:20', '2020-03-18 16:56:22', '<p>Brigadeirão de morango.<br></p>', '/assets/img/items/small/1584464960or1blzHZMX-sm.jpg', 0, 0),
(155, 7, 30, 'Brigadeiro', '9.00', '0.00', '/assets/img/items/1584465254ck6Ev0jpml.jpg', 0, 1, 0, '2020-03-17 17:14:15', '2020-03-18 16:56:22', '<p>Brownie com brigadeiro<br></p>', '/assets/img/items/small/1584465254ck6Ev0jpml-sm.jpg', 0, 0),
(156, 7, 30, 'Brigadeiro e Kinder', '10.00', '0.00', '/assets/img/items/1584465322IP8LunSPva.jpg', 0, 1, 0, '2020-03-17 17:15:22', '2020-03-18 16:56:20', '<p>Brownie com brigadeiro e kinder <br></p>', '/assets/img/items/small/1584465322IP8LunSPva-sm.jpg', 0, 0),
(157, 7, 30, 'Brigadeiro e Morango', '10.00', '0.00', '/assets/img/items/1584465385Xkok5hqj8n.jpg', 0, 1, 0, '2020-03-17 17:16:26', '2020-03-18 16:56:19', '<p>Brownie com brigadeiro e morango.<br></p>', '/assets/img/items/small/1584465385Xkok5hqj8n-sm.jpg', 0, 0),
(158, 7, 30, 'Brigadeiro com Ganache', '9.00', '0.00', '/assets/img/items/1584465450tuoFmsrGuu.jpg', 0, 1, 0, '2020-03-17 17:17:30', '2020-03-18 16:56:18', '<p>Brownie com brigadeiro e ganache<br></p>', '/assets/img/items/small/1584465450tuoFmsrGuu-sm.jpg', 0, 0),
(159, 8, 32, 'Alemã', '24.00', '0.00', '/assets/img/items/1584465940JY0YYNgOTh.png', 0, 0, 0, '2020-03-17 17:25:40', '2020-03-17 17:25:40', '<p>Mussarela, calabresa, bacon, ervilha e orégano.</p>', '/assets/img/items/small/1584465940JY0YYNgOTh-sm.png', 1, 0),
(160, 8, 32, 'A Moda 1', '24.00', '0.00', '/assets/img/items/1584466014jjKHJqGKEs.png', 0, 0, 0, '2020-03-17 17:26:54', '2020-03-17 17:26:54', '<p>Mussarela, frango, presunto, calabresa, cebola, ovos e orégano.<br></p>', '/assets/img/items/small/1584466014jjKHJqGKEs-sm.png', 1, 0),
(161, 8, 32, 'A Moda 2', '24.00', '0.00', '/assets/img/items/1584466072HN1DEjS6ZZ.png', 0, 0, 0, '2020-03-17 17:27:52', '2020-03-17 17:27:52', '<p>Mussarela, catupiry, atum, calabresa, palmito, parmesão e orégano.<br></p>', '/assets/img/items/small/1584466072HN1DEjS6ZZ-sm.png', 1, 0),
(162, 8, 32, 'A Gaucha', '24.00', '0.00', '/assets/img/items/1584466164r4QYGkvzN9.png', 0, 0, 0, '2020-03-17 17:29:24', '2020-03-17 17:29:24', '<p>Mussarela, file mignon em tiras com cebola champignon picado e azeitonas.<br></p>', '/assets/img/items/small/1584466164r4QYGkvzN9-sm.png', 1, 0),
(163, 8, 32, 'Atum', '24.00', '0.00', '/assets/img/items/1584466248xvZaqUMDmd.png', 0, 0, 0, '2020-03-17 17:30:48', '2020-03-17 17:30:48', '<p>Mussarela, atum, cebola, tomate e orégano.</p>', '/assets/img/items/small/1584466248xvZaqUMDmd-sm.png', 1, 0),
(164, 8, 32, 'Almada', '24.00', '0.00', '/assets/img/items/1584466296FVUaab2Ccu.png', 0, 0, 0, '2020-03-17 17:31:36', '2020-03-17 17:31:36', '<p>Mussarela, atum, palmito, catupiry, ovo e orégano.</p>', '/assets/img/items/small/1584466296FVUaab2Ccu-sm.png', 1, 0),
(165, 8, 32, 'A La Mendes', '24.00', '0.00', '/assets/img/items/1584466413wgurAVnWKp.png', 0, 0, 0, '2020-03-17 17:33:33', '2020-03-17 17:33:33', '<p>Mussarela, atum, ovo, ervilha, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1584466413wgurAVnWKp-sm.png', 1, 0),
(166, 8, 32, 'Alho e Oleo', '24.00', '0.00', '/assets/img/items/1584466456Wnagcv3b8y.png', 0, 0, 0, '2020-03-17 17:34:16', '2020-03-17 17:34:16', '<p>Mussarela, alho tomate, azeitona e orégano.</p>', '/assets/img/items/small/1584466456Wnagcv3b8y-sm.png', 1, 0),
(167, 7, 28, 'Brigadeiro da felicidade', '20.00', '0.00', '/assets/img/items/1584466474dSBK1x497n.jpg', 0, 1, 0, '2020-03-17 17:34:35', '2020-03-18 16:56:13', '<p>Pote de brigadeiro da felicidade 300g<br></p>', '/assets/img/items/small/1584466474dSBK1x497n-sm.jpg', 0, 0),
(168, 8, 32, 'Baronesa', '24.00', '0.00', '/assets/img/items/1584466526eIM70DDsmV.png', 0, 0, 0, '2020-03-17 17:35:26', '2020-03-17 17:35:26', '<p>Mussarela ou catupiry, peito de frango desfiado, champignon e azeitona.</p>', '/assets/img/items/small/1584466526eIM70DDsmV-sm.png', 1, 0),
(169, 8, 32, 'Baiana 1', '24.00', '0.00', '/assets/img/items/1584466585L4BaL9c54u.png', 0, 0, 0, '2020-03-17 17:36:25', '2020-03-17 17:36:25', '<p>Mussarela, catupiry, cebola, calabresa, tomate e orégano.</p>', '/assets/img/items/small/1584466585L4BaL9c54u-sm.png', 1, 0),
(170, 8, 32, 'Baiana 2', '24.00', '0.00', '/assets/img/items/1584466662a9DZjqYnVC.png', 0, 0, 0, '2020-03-17 17:37:42', '2020-03-17 17:37:42', '<p>Mussarela, calabresa, ovo, bacon, cebola e oregano.</p>', '/assets/img/items/small/1584466662a9DZjqYnVC-sm.png', 1, 0),
(171, 8, 32, 'Baianinha', '24.00', '0.00', '/assets/img/items/1584466769eK8zlNYEHe.png', 0, 0, 0, '2020-03-17 17:39:29', '2020-03-17 17:39:29', '<p>Mussarela, calabresa, ovo, pimenta, cebola e oregano.</p>', '/assets/img/items/small/1584466769eK8zlNYEHe-sm.png', 1, 0),
(172, 8, 32, 'Bacon', '24.00', '0.00', '/assets/img/items/1584466810PEKJMGAmGW.png', 0, 0, 0, '2020-03-17 17:40:10', '2020-03-17 17:40:10', '<p>Mussarela, bacon, milho, azeitona e oregano.</p>', '/assets/img/items/small/1584466810PEKJMGAmGW-sm.png', 1, 0),
(173, 8, 32, 'Bacon Esp', '24.00', '0.00', '/assets/img/items/1584466861PgOHBe1Io9.png', 0, 0, 0, '2020-03-17 17:41:01', '2020-03-17 17:41:16', '<p>Mussarela, catupiry, bacon, tomate, cebola o orégano.</p>', '/assets/img/items/small/1584466861PgOHBe1Io9-sm.png', 1, 0),
(174, 7, 28, 'Brownie', '20.00', '0.00', '/assets/img/items/1584467031lyyYMpQF2D.jpg', 0, 1, 0, '2020-03-17 17:43:52', '2020-03-18 16:56:05', '<p>Pote de Brownie supremo 300g.<br></p>', '/assets/img/items/small/1584467031lyyYMpQF2D-sm.jpg', 0, 0),
(175, 7, 28, 'Brigadeiro Supremo', '20.00', '0.00', '/assets/img/items/1584467286fELhhpVQaA.jpg', 0, 1, 0, '2020-03-17 17:48:06', '2020-03-18 16:56:03', '<p>Pote de brigadeiro supremo 300g.<br></p>', '/assets/img/items/small/1584467286fELhhpVQaA-sm.jpg', 0, 0),
(176, 7, 28, 'Taça Brownie Supremo', '15.00', '0.00', '/assets/img/items/15844675471sGchazGxf.jpg', 0, 1, 0, '2020-03-17 17:52:27', '2020-03-18 16:56:02', '<p>Mini Taça Brownie Supremo<br></p>', '/assets/img/items/small/15844675471sGchazGxf-sm.jpg', 0, 0),
(177, 7, 28, 'Taça Brigadeiro da Felicidade', '12.00', '0.00', '/assets/img/items/1584467694VV7KW7YSg5.jpg', 0, 1, 0, '2020-03-17 17:54:54', '2020-03-18 16:56:00', '<p>Mini Taça Brigadeiro da Felicidade<br></p>', '/assets/img/items/small/1584467694VV7KW7YSg5-sm.jpg', 0, 0),
(178, 7, 28, 'Taça Brigadeiro Supremo', '12.00', '0.00', '/assets/img/items/15844679013c2SGiHGKW.jpg', 0, 1, 0, '2020-03-17 17:58:21', '2020-03-18 16:55:59', '<p>Mini Taça Brigadeiro Supremo<br></p>', '/assets/img/items/small/15844679013c2SGiHGKW-sm.jpg', 0, 0),
(179, 7, 31, 'Brownies com Brigadeiro', '30.00', '0.00', '/assets/img/items/1584468069fGNq3Btvss.jpg', 0, 1, 0, '2020-03-17 18:01:10', '2020-03-18 16:55:58', '<p>Combo de 4 Brownies com Brigadeiro<br></p>', '/assets/img/items/small/1584468069fGNq3Btvss-sm.jpg', 0, 0),
(180, 7, 31, 'Brigadeirões com Kinder', '35.00', '0.00', '/assets/img/items/15844681299Wyod2Nt4n.jpg', 0, 1, 0, '2020-03-17 18:02:09', '2020-03-18 16:55:57', '<p>Combo de 4 Brigadeirões com Kinder<br></p>', '/assets/img/items/small/15844681299Wyod2Nt4n-sm.jpg', 0, 0);
INSERT INTO `items` (`id`, `restaurant_id`, `item_category_id`, `name`, `price`, `old_price`, `image`, `is_recommended`, `is_popular`, `is_new`, `created_at`, `updated_at`, `desc`, `placeholder_image`, `is_active`, `is_veg`) VALUES
(181, 7, 31, 'Brigadeirões com KitKat', '30.00', '0.00', '/assets/img/items/1584468208rYVlyV7bOJ.jpg', 0, 1, 0, '2020-03-17 18:03:28', '2020-03-18 16:55:56', '<p>Combo com 4 Brigadeirões com KitKat <br></p>', '/assets/img/items/small/1584468208rYVlyV7bOJ-sm.jpg', 0, 0),
(182, 7, 31, 'Brigadeirões com Morango', '30.00', '0.00', '/assets/img/items/1584550978inNhTkkdrt.png', 0, 1, 0, '2020-03-17 18:04:22', '2020-03-18 17:02:58', '<p>Combo com 4 Brigadeirões com Morango<br></p>', '/assets/img/items/small/1584550978inNhTkkdrt-sm.png', 0, 0),
(183, 8, 32, 'Bacon e Frango', '24.00', '0.00', '/assets/img/items/1584468407OfX9hJtFHF.png', 0, 0, 0, '2020-03-17 18:06:47', '2020-03-17 18:06:47', '<p>Mussarela, bacon, frango, catupiry, palmito, orégano.</p>', '/assets/img/items/small/1584468407OfX9hJtFHF-sm.png', 1, 0),
(184, 8, 32, 'Calabresa 1', '24.00', '0.00', '/assets/img/items/1584468456MaHhgRehlz.png', 0, 0, 0, '2020-03-17 18:07:36', '2020-03-17 18:07:36', '<p>Mussarela, calabresa, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1584468456MaHhgRehlz-sm.png', 1, 0),
(185, 8, 32, 'Calabresa Esp', '24.00', '0.00', '/assets/img/items/15844685803aBe0R76AS.png', 0, 0, 0, '2020-03-17 18:09:40', '2020-03-17 18:09:40', '<p>Mussarela, presunto, calabresa, milho, cebola, orégano.</p>', '/assets/img/items/small/15844685803aBe0R76AS-sm.png', 1, 0),
(186, 8, 32, 'Carne Seca', '24.00', '0.00', '/assets/img/items/158446879675ML7PXnXK.png', 0, 0, 0, '2020-03-17 18:13:16', '2020-03-17 18:13:16', '<p>Mussarela, carne seca, cebola, azeitona e oregano.</p>', '/assets/img/items/small/158446879675ML7PXnXK-sm.png', 1, 0),
(187, 8, 32, 'Castelhana', '24.00', '0.00', '/assets/img/items/1584468857AOh3CkdJ3D.png', 0, 0, 0, '2020-03-17 18:14:17', '2020-03-17 18:14:17', '<p>Mussarela, alho picado, salame italiano e oregano.</p>', '/assets/img/items/small/1584468857AOh3CkdJ3D-sm.png', 1, 0),
(188, 8, 32, 'Do Chefe', '24.00', '0.00', '/assets/img/items/15844689096q2hPD9j9W.png', 0, 0, 0, '2020-03-17 18:15:09', '2020-03-17 18:15:09', '<p>Mussarela, presunto, cebola, ervilha, bacon, catupiry e orégano.</p>', '/assets/img/items/small/15844689096q2hPD9j9W-sm.png', 1, 0),
(189, 8, 32, 'Do Forneiro', '24.00', '0.00', '/assets/img/items/1584468961ZZToTSOQxL.png', 0, 0, 0, '2020-03-17 18:16:01', '2020-03-17 18:16:01', '<p>Mussarela, presunto, bacon, azeitona e orégano.</p>', '/assets/img/items/small/1584468961ZZToTSOQxL-sm.png', 1, 0),
(190, 8, 32, 'Frango Cremoso', '24.00', '0.00', '/assets/img/items/1584469105URNLs6ILiy.png', 0, 0, 0, '2020-03-17 18:18:25', '2020-03-17 18:18:25', '<p>Mussarela, frango, creme de leite, maionese e orégano.</p>', '/assets/img/items/small/1584469105URNLs6ILiy-sm.png', 1, 0),
(191, 8, 32, 'File com Catupiry', '24.00', '0.00', '/assets/img/items/15844691615WsfB4o03R.png', 0, 0, 0, '2020-03-17 18:19:21', '2020-03-17 18:19:21', '<p>Mussarela, file, catupiry, azeitona e orégano.<br></p>', '/assets/img/items/small/15844691615WsfB4o03R-sm.png', 1, 0),
(192, 8, 32, 'Frango Catupiry', '24.00', '0.00', '/assets/img/items/1584469207p77hUYoxYd.png', 0, 0, 0, '2020-03-17 18:20:07', '2020-03-17 18:20:07', '<p>Mussarela, frango, catupiry, azeitona e palmito.<br></p>', '/assets/img/items/small/1584469207p77hUYoxYd-sm.png', 1, 0),
(193, 8, 32, 'Frango Esp', '24.00', '0.00', '/assets/img/items/1584469274lqfbTRGvtz.png', 0, 0, 0, '2020-03-17 18:21:15', '2020-03-17 18:21:15', '<p>Mussarela, frango, catupiry, tomate, cebola e orégano.</p>', '/assets/img/items/small/1584469274lqfbTRGvtz-sm.png', 1, 0),
(194, 8, 32, 'Frango 1', '24.00', '0.00', '/assets/img/items/1584469343XuxiUxXYbR.png', 0, 0, 0, '2020-03-17 18:22:23', '2020-03-17 18:22:23', '<p>Mussarela, frango, maionese, palmito, milho, cebola e orégano.</p>', '/assets/img/items/small/1584469343XuxiUxXYbR-sm.png', 1, 0),
(195, 8, 32, 'Frango 2', '24.00', '0.00', '/assets/img/items/1584469385xQ1ZxwDb6K.png', 0, 0, 0, '2020-03-17 18:23:05', '2020-03-17 18:23:05', '<p>Mussarela, frango, ervilha, palmito,, azeitona e orégano.<br></p>', '/assets/img/items/small/1584469385xQ1ZxwDb6K-sm.png', 1, 0),
(196, 8, 32, 'Frango Tudo', '24.00', '0.00', '/assets/img/items/1584469454REuoCAkth0.png', 0, 0, 0, '2020-03-17 18:24:14', '2020-03-17 18:24:14', '<p>Mussarela, frango, milho, ervilha, bacon, calabresa, ovo e orégano.</p>', '/assets/img/items/small/1584469454REuoCAkth0-sm.png', 1, 0),
(197, 8, 32, 'Gratinada', '24.00', '0.00', '/assets/img/items/1584469538od2tSsbG0n.png', 0, 0, 0, '2020-03-17 18:25:38', '2020-03-17 18:25:38', '<p>Catupiry, provolone, parmesão, tomate e azeitona.</p>', '/assets/img/items/small/1584469538od2tSsbG0n-sm.png', 1, 0),
(198, 8, 32, 'Italiana', '24.00', '0.00', '/assets/img/items/1584469588cxLAPcZ5J0.png', 0, 0, 0, '2020-03-17 18:26:28', '2020-03-17 18:26:28', '<p>Mussarela, presunto. lombo, bacon, ervilha, milho catupiry e orégano.</p>', '/assets/img/items/small/1584469588cxLAPcZ5J0-sm.png', 1, 0),
(199, 8, 32, 'Lombopiry', '24.00', '0.00', '/assets/img/items/1584469635Bw0T3ay6fv.png', 0, 0, 0, '2020-03-17 18:27:15', '2020-03-17 18:27:15', '<p>Mussarela, catupiry, lombo, azeitona e orégano.</p>', '/assets/img/items/small/1584469635Bw0T3ay6fv-sm.png', 1, 0),
(200, 8, 32, 'Mussarela', '24.00', '0.00', '/assets/img/items/1584469680d3QTH9o2Xs.png', 0, 0, 0, '2020-03-17 18:28:00', '2020-03-17 18:28:00', '<p>Mussarela, palmito, catupiry azeitonas e orégano.</p>', '/assets/img/items/small/1584469680d3QTH9o2Xs-sm.png', 1, 1),
(201, 8, 32, 'Marguerita', '24.00', '0.00', '/assets/img/items/1584469731IhCVBPAdk5.png', 0, 0, 0, '2020-03-17 18:28:51', '2020-03-17 18:28:51', '<p>Mussarela, tomate, manjericão e azeitona.</p>', '/assets/img/items/small/1584469731IhCVBPAdk5-sm.png', 1, 1),
(202, 8, 32, 'Napolitana', '24.00', '0.00', '/assets/img/items/15844697712kkCvRORLt.png', 0, 0, 0, '2020-03-17 18:29:31', '2020-03-17 18:29:31', '<p>Mussarela, presunto, tomate, azeitona e orégano.</p>', '/assets/img/items/small/15844697712kkCvRORLt-sm.png', 1, 0),
(203, 8, 32, 'Peruval', '24.00', '0.00', '/assets/img/items/1584469819sYD70eiUB3.png', 0, 0, 0, '2020-03-17 18:30:19', '2020-03-17 18:30:19', '<p>Mussarela, peito de peru defumado, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1584469819sYD70eiUB3-sm.png', 1, 0),
(204, 8, 32, 'Portuguesa', '24.00', '0.00', '/assets/img/items/1584469863E2wXjXp3JH.png', 0, 0, 0, '2020-03-17 18:31:04', '2020-03-17 18:31:04', '<p>Mussarela, presunto, ervilha, palmito, ovo, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1584469863E2wXjXp3JH-sm.png', 1, 0),
(205, 8, 32, 'Pizzaiolo', '24.00', '0.00', '/assets/img/items/1584469915MxAAxHtgfk.png', 0, 0, 0, '2020-03-17 18:31:56', '2020-03-17 18:31:56', '<p>Mussarela, presunto, ervilha, palmito, ovo, cebola, azeitona e orégano.</p>', '/assets/img/items/small/1584469915MxAAxHtgfk-sm.png', 1, 0),
(206, 8, 32, 'Provolone', '24.00', '0.00', '/assets/img/items/1584469948nLRgM412CV.png', 0, 0, 0, '2020-03-17 18:32:29', '2020-03-17 18:32:29', '<p>Provolone, tomate seco e orégano.</p>', '/assets/img/items/small/1584469948nLRgM412CV-sm.png', 1, 0),
(207, 8, 32, 'Palmito', '24.00', '0.00', '/assets/img/items/1584469982XAtoEXwwPe.png', 0, 0, 0, '2020-03-17 18:33:02', '2020-03-17 18:33:02', '<p>Mussarela, palmito, azeitona e orégano.</p>', '/assets/img/items/small/1584469982XAtoEXwwPe-sm.png', 1, 1),
(208, 8, 32, 'Pomodoro', '24.00', '0.00', '/assets/img/items/1584470046tQeKMXCLC2.png', 0, 0, 0, '2020-03-17 18:34:07', '2020-03-17 18:34:07', '<p>Mussarela, peito de frango desfiado, champignon, manjericão, provolone, tomate seco e azeitona.</p>', '/assets/img/items/small/1584470046tQeKMXCLC2-sm.png', 1, 0),
(209, 8, 32, '4 Queijos', '24.00', '0.00', '/assets/img/items/1584470088sZodL8FAI0.png', 0, 1, 0, '2020-03-17 18:34:48', '2020-03-17 18:34:48', '<p>Mussarela, catupiry, parmesão, provolone, azeitona e orégano.</p>', '/assets/img/items/small/1584470088sZodL8FAI0-sm.png', 1, 0),
(210, 8, 32, 'Roma', '24.00', '0.00', '/assets/img/items/1584470146Gs2qrfa02a.png', 0, 0, 0, '2020-03-17 18:35:46', '2020-03-17 18:35:46', '<p>Mussarela ou catupiry, presunto, ovo, azeitona.</p>', '/assets/img/items/small/1584470146Gs2qrfa02a-sm.png', 1, 0),
(211, 8, 32, 'Romanesca', '24.00', '0.00', '/assets/img/items/1584470400b9HDQxrYkM.png', 0, 0, 0, '2020-03-17 18:40:00', '2020-03-17 18:40:00', '<p>Mussarela, catupiry, frango, milho e orégano.</p>', '/assets/img/items/small/1584470400b9HDQxrYkM-sm.png', 1, 0),
(212, 8, 32, 'Siliciana', '24.00', '0.00', '/assets/img/items/15844704440t0k9iwyEL.png', 0, 0, 0, '2020-03-17 18:40:45', '2020-03-17 18:40:45', '<p>Mussarela, bacon, champignon, azeitona e orégano.</p>', '/assets/img/items/small/15844704440t0k9iwyEL-sm.png', 1, 0),
(213, 8, 32, 'Strogonoff', '24.00', '0.00', '/assets/img/items/1584470507k2BYZPj8Aq.png', 0, 1, 0, '2020-03-17 18:41:47', '2020-03-17 18:41:47', '<p>Mussarela, strogonoff, batata palha e oregano.</p>', '/assets/img/items/small/1584470507k2BYZPj8Aq-sm.png', 1, 0),
(214, 8, 32, 'Tomate Seco', '24.00', '0.00', '/assets/img/items/1584470652WpumjJDSd6.png', 0, 0, 0, '2020-03-17 18:44:12', '2020-03-17 18:44:12', '<p>Mussarela, tomate seco, azeitona e orégano.</p>', '/assets/img/items/small/1584470652WpumjJDSd6-sm.png', 1, 1),
(215, 8, 32, 'Toscana', '24.00', '0.00', '/assets/img/items/15844707090ApYqLRTNF.png', 0, 0, 0, '2020-03-17 18:45:09', '2020-03-17 18:45:09', '<p>Mussarela, calabresa, alho, cebola e orégano.</p>', '/assets/img/items/small/15844707090ApYqLRTNF-sm.png', 1, 0),
(216, 8, 32, 'Viena', '24.00', '0.00', '/assets/img/items/1584470750SmmD5oZZF2.png', 0, 0, 0, '2020-03-17 18:45:50', '2020-03-17 18:45:50', '<p>Mussarela, frango, champignon, azeitona e orégano.</p>', '/assets/img/items/small/1584470750SmmD5oZZF2-sm.png', 1, 0),
(217, 8, 32, 'Venus', '24.00', '0.00', '/assets/img/items/15844707905S6otgE8FW.png', 0, 0, 0, '2020-03-17 18:46:30', '2020-03-17 18:46:30', '<p>Mussarela, presunto. calabresa, catupiry e orégano.</p>', '/assets/img/items/small/15844707905S6otgE8FW-sm.png', 1, 0),
(218, 8, 32, 'Vegetariana', '24.00', '0.00', '/assets/img/items/1584470841aJG1voIenI.png', 0, 0, 0, '2020-03-17 18:47:21', '2020-03-17 18:47:21', '<p>Mussarela, palmito, milho, ervilha, tomate, cebola, alho, ovo, azeitona e orégano.</p>', '/assets/img/items/small/1584470841aJG1voIenI-sm.png', 1, 1),
(219, 8, 32, 'Dom Camilo', '24.00', '0.00', '/assets/img/items/1584470890M3V2v5R9K3.png', 0, 0, 0, '2020-03-17 18:48:10', '2020-03-17 18:48:10', '<p>Mussarela, presunto, calabresa e creme de leite.</p>', '/assets/img/items/small/1584470890M3V2v5R9K3-sm.png', 1, 0),
(220, 10, 37, 'Mini Ovos de Páscoa', '5.00', '0.00', '/assets/img/items/1584642498dS0aa4vltN.jpg', 0, 1, 0, '2020-03-19 18:28:19', '2020-03-19 18:28:19', '<p>Mini ovos de páscoa sabor ninho e nutella.<br></p>', '/assets/img/items/small/1584642498dS0aa4vltN-sm.jpg', 1, 0),
(221, 10, 37, 'Mini Ovos de Páscoa', '5.00', '0.00', '/assets/img/items/15846425649QmUNn89pg.jpg', 0, 1, 0, '2020-03-19 18:29:24', '2020-03-19 18:29:24', '<p>Mini ovos de páscoa sabor brigadeiro<br></p>', '/assets/img/items/small/15846425649QmUNn89pg-sm.jpg', 1, 0),
(222, 10, 37, 'Mini Ovos de Páscoa', '5.00', '0.00', '/assets/img/items/15846426131xh7YvqTMU.jpg', 0, 1, 0, '2020-03-19 18:30:13', '2020-03-19 18:30:13', '<p>Mini ovos de páscoa sabor kinder bueno.</p>', '/assets/img/items/small/15846426131xh7YvqTMU-sm.jpg', 1, 0),
(223, 10, 36, 'Bolo Vulcão', '35.00', '0.00', '/assets/img/items/1584642778sRpUspqQuc.jpg', 0, 1, 0, '2020-03-19 18:32:59', '2020-03-19 18:32:59', '<p>Bolo vulcão de 1kg. Massa de chocolate com cobertura de brigadeiro e leite ninho.<br></p>', '/assets/img/items/small/1584642778sRpUspqQuc-sm.jpg', 1, 0),
(224, 10, 36, 'Mini Bolo', '12.00', '0.00', '/assets/img/items/15846429603uQmSXUcGy.jpg', 0, 1, 0, '2020-03-19 18:36:00', '2020-03-19 18:36:00', '<p>Mini bolo com massa de leite com cobertura de ninho e Nutella. <br></p>', '/assets/img/items/small/15846429603uQmSXUcGy-sm.jpg', 1, 0),
(225, 10, 36, 'Mini Bolo', '12.00', '0.00', '/assets/img/items/1584643323bcrGzfDqMM.jpg', 0, 1, 0, '2020-03-19 18:37:03', '2020-03-19 18:42:03', '<p>Mini bolo de massa de chocolate com cobertura de Brigadeiro, leite ninho e morango. <br></p>', '/assets/img/items/small/1584643323bcrGzfDqMM-sm.jpg', 1, 0),
(226, 11, 39, 'DIPIRONA 500MG 10 COMPRIMIDOS -GREEN PHARMA- GENÉRICO', '5.00', '0.00', '/assets/img/items/1584995225OI2GU8XFSh.jpg', 0, 1, 0, '2020-03-23 20:27:06', '2020-03-23 20:37:34', '<h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center; letter-spacing: normal;\">DESCRIÇÃO</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"></p><p rgb(0,=\"\" 0,=\"\" 0);=\"\" font-family:=\"\" times;=\"\" font-size:=\"\" medium;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Indicações</b>: Analgésico e antitérmico.&nbsp;<br></p><p rgb(0,=\"\" 0,=\"\" 0);=\"\" font-family:=\"\" times;=\"\" font-size:=\"\" medium;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações</b>: Hipersensibilidade à dipirona ou a qualquer um dos componentes da fórmula ou, ainda, com intolerância conhecida aos derivados pirazolônicos (exemplo: isopropilaminofenazona, fenazona, propifenazona, fenilbutazona, oxifembutazona) incluindo caso anterior de agranulocitose em relação a um destes medicamentos; determinadas doenças metabólicas, como porfiria hepática aguda intermitente (risco de indução de crises de porfiria) e deficiência congênita da glicose-6-fosfato-desidrogenase (risco de hemólise); função da medula óssea insuficiente (exemplo: após tratamento citostático) ou doenças do sistema hematopoiético; asma analgésica ou intolerância analgésica do tipo urticária-angioedema, ou seja, pacientes com desenvolvimento anterior de broncoespasmo ou outras reações anafilactóides (exemplo: urticária, rinite, angioedema) provocadas por salicilatos, paracetamol ou outros antiinflamatórios não esteroidais (exemplo: diclofenaco, ibuprofeno, indometacina, naproxeno); crianças menores de 3 meses de idade ou pesando menos de 5 kg; durante os três primeiros e três últimos meses de gravidez.&nbsp;<br></p><p rgb(0,=\"\" 0,=\"\" 0);=\"\" font-family:=\"\" times;=\"\" font-size:=\"\" medium;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações adversas</b>:&nbsp;Reações anafiláticas na forma de sintomas cutâneos ou nas mucosas (tais como: prurido, ardor, rubor, urticária, inchaço), dispneia e, menos frequentemente, sintomas gastrintestinais. Podem progredir para formas graves como urticária generalizada, angioedema grave (até mesmo envolvendo a laringe), broncoespasmo grave, arritmias cardíacas, queda da pressão sanguínea (algumas vezes precedida por aumento da pressão sanguínea) e choque circulatório.&nbsp;<br></p><p rgb(0,=\"\" 0,=\"\" 0);=\"\" font-family:=\"\" times;=\"\" font-size:=\"\" medium;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções:</b>&nbsp;A administração deste medicamento pode causar reações hipotensivas isoladas, possivelmente dose-dependentes, portanto, cuidados especiais são necessários em pacientes com pressão sanguínea abaixo de 100 mmHg ou com condições circulatórias instáveis (exemplo: deficiência circulatória incipiente associada a infarto do miocárdio, lesões múltiplas ou choque recente). Pacientes com asma brônquica, com urticária crônica, com intolerância ao álcool apresentam risco especial para reações anafilactoides graves possivelmente relacionadas à dipirona. Recomenda-se não utilizar durante os primeiros 3 meses da gravidez, durante o segundo trimestre o uso somente deve ocorrer após cuidadosa avaliação do potencial risco/benefício pelo médico. A lactação deve ser evitada durante e até 48 horas após o uso da medicação devido à excreção dos metabólitos da dipirona no leite materno.</p><p rgb(0,=\"\" 0,=\"\" 0);=\"\" font-family:=\"\" times;=\"\" font-size:=\"\" medium;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"><span style=\"color: rgb(0, 0, 0); font-family: Arial;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE ESTE MEDICAMENTO DURANTE A GRAVIDEZ E EM CRIANÇAS MENORES DE TRÊS MESES DE IDADE. DIPIRONA - É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</span><br></p>', '/assets/img/items/small/1584995225OI2GU8XFSh-sm.jpg', 1, 0),
(227, 11, 39, 'DIPIRONA - ATROVERAN DIP GOTAS 20ML', '5.99', '13.10', '/assets/img/items/1584995573lX2RA4GWXP.jpg', 0, 1, 0, '2020-03-23 20:32:54', '2020-03-23 20:37:11', '<h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center; letter-spacing: normal;\">DESCRIÇÃO</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100);\"></p><div style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100); text-align: justify;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Indicação</strong>:&nbsp;Este medicamento é indicado como analgésico (para dor) e antitérmico (para febre).</div><div style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100); text-align: justify;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações</strong>: Para pacientes que possuem alergia ou intolerância à dipirona ou a qualquer um dos componentes da formulação ou a outras pirazolonas (exemplo: fenazona, propifenazona) ou a pirazolidinas (exemplo: fenilbutazona, oxifembutazona) incluindo, por exemplo, experiência prévia de agranulocitose com uma dessas substâncias. Este medicamento é contraindicado em casos de gravidez e amamentação e, não deve ser utilizado por mulheres grávidas sem orientação médica ou do cirurgião-dentista. Informe imediatamente seu médico em caso de suspeita de gravidez. Também é contraindicado para menores de 15 anos de idade.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações adversas:</strong>&nbsp;A dipirona pode causar choque anafilático, erupções na pele, coceira, ardor, vermelhidão, urticária, inchaço, anemia aplástica, agranulocitose e pancitopenia. Podem ocorrer também trombocitopenia, queda crítica da pressão sanguínea. Em casos muito raros, especialmente em pacientes com histórico de doença nos rins, pode ocorrer piora súbita ou recente da função dos rins (insuficiência renal aguda), em alguns casos com diminuição da produção de urina, redução muito acentuada da produção de urina ou perda aumentada de proteínas através da urina. Em casos isolados, pode ocorrer nefrite intersticial aguda (um tipo de inflamação nos rins). Uma coloração avermelhada pode ser observada algumas vezes na urina.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções</strong>: Em particular, os seguintes pacientes apresentam risco especial para possíveis reações anafiláticas graves relacionadas à dipirona: pacientes com asma brônquica, particularmente aqueles com rinossinusite poliposa concomitante; pacientes com urticária crônica; pacientes com intolerância ao álcool, por exemplo, pacientes que reagem até mesmo a pequenas quantidades de bebidas alcoólicas, apresentando sintomas como espirros, lacrimejamento e rubor pronunciado da face. A intolerância ao álcool pode ser indicativa da síndrome de asma analgésica prévia não diagnosticada; pacientes com intolerância a corantes (exemplo: tartrazina) ou a conservantes (exemplo: benzoatos). A administração de dipirona pode causar reações hipotensivas isoladas. Caso você tenha insuficiência dos rins ou do fígado, recomenda-se evitar o uso de altas doses de dipirona.</p><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both; text-align: start;\"><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-registroms\" data-attr=\"registroms\" data-attr-value=\"1781708620031\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Registro MS:</strong>&nbsp;1781708620031</span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Princípio Ativo:</strong>&nbsp;dipirona sódica</span></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; color: rgb(0, 0, 0); text-align: start; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE ESTE MEDICAMENTO DURANTE A GRAVIDEZ E EM CRIANÇAS MENORES DE TRÊS MESES DE IDADE. DIPIRONA - ATROVERAN DIP GOTAS 20ML É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</p></div></div><div style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(100, 100, 100); text-align: justify;\">&nbsp;</div>', '/assets/img/items/small/1584995573lX2RA4GWXP-sm.jpg', 1, 0),
(228, 11, 39, 'DIPIRONA - MAXALGINA SOLUÇÃO INFANTIL 100ML + SERINGA DOSADORA-NATULAB', '16.00', '20.60', '/assets/img/items/1584997120ZiA9oMv80v.png', 0, 1, 0, '2020-03-23 20:58:40', '2020-03-23 20:58:40', '<div class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">DESCRIÇÃO</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Indicações</strong>: Antitérmico e analgésico.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações</strong>: Pacientes que possuem alergia ou intolerância à dipirona ou a qualquer um dos componentes da formulação ou a outras pirazolonas (ex. fenazona, propifenazona) ou a pirazolidinas (ex. fenilbutazona, oxifembutazona) incluindo, por exemplo, experiência prévia de agranulocitose com uma dessas substâncias. Este medicamento é contraindicado em casos de gravidez e amamentação e, não deve ser utilizado por mulheres grávidas sem orientação médica ou do cirurgião-dentista. Informe imediatamente seu médico em caso de suspeita de gravidez. Também é contraindicado para menores de 3 meses de idade ou pesando menos de 5 kg.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações adversas:&nbsp;</strong>A dipirona pode causar choque anafilático, erupções na pele, coceira, ardor, vermelhidão, urticária, inchaço, anemia aplástica, agranulocitose e pancitopenia. Podem ocorrer também trombocitopenia, queda crítica da pressão sanguínea. Em casos muito raros, especialmente em pacientes com histórico de doença nos rins, pode ocorrer piora súbita ou recente da função dos rins (insuficiência renal aguda), em alguns casos com diminuição da produção de urina, redução muito acentuada da produção de urina ou perda aumentada de proteínas através da urina. Em casos isolados, pode ocorrer nefrite intersticial aguda (um tipo de inflamação nos rins). Uma coloração avermelhada pode ser observada algumas vezes na urina.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções</strong>: Em particular, os seguintes pacientes apresentam risco especial para possíveis reações anafiláticas graves relacionadas à dipirona: pacientes com asma brônquica, particularmente aqueles com rinossinusite poliposa concomitante; pacientes com urticária crônica; pacientes com intolerância ao álcool, por exemplo, pacientes que reagem até mesmo a pequenas quantidades de bebidas alcoólicas, apresentando sintomas como espirros, lacrimejamento e rubor pronunciado da face. A intolerância ao álcool pode ser indicativa da síndrome de asma analgésica prévia não diagnosticada; pacientes com intolerância a corantes (ex. tartrazina) ou a conservantes (ex. benzoatos). A administração de dipirona pode causar reações hipotensivas isoladas. Caso você tenha insuficiência dos rins ou do fígado, recomenda-se evitar o uso de altas doses de dipirona.</p></div></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p></div><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">OUTRAS INFORMAÇÕES</h3><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-registroms\" data-attr=\"registroms\" data-attr-value=\"1384100020114\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Registro MS:</strong>&nbsp;1384100020114</span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Princípio Ativo:</strong>&nbsp;dipirona sódica</span></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE ESTE MEDICAMENTO DURANTE A GRAVIDEZ E EM CRIANÇAS MENORES DE TRÊS MESES DE IDADE. DIPIRONA - MAXALGINA SOLUÇÃO INFANTIL 100ML + SERINGA DOSADORA É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</p></div>', '/assets/img/items/small/1584997120ZiA9oMv80v-sm.png', 1, 0),
(229, 11, 39, 'DIPIRONA - DORFLEX UNO ENXAQUECA 1G 4 COMPRIMIDOS', '4.99', '0.00', '/assets/img/items/1584997227wlnaGlNzGq.png', 0, 0, 1, '2020-03-23 21:00:27', '2020-03-23 21:01:06', '<div class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">DESCRIÇÃO</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-align: justify;\"><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Indicações:</strong>&nbsp;Antitérmico e analgésico.</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações:&nbsp;</strong>Pacientes que possuem alergia ou intolerância à dipirona ou a qualquer um dos componentes da formulação ou a outras pirazolonas (ex. fenazona, propifenazona) ou a pirazolidinas (ex. fenilbutazona, oxifembutazona) incluindo, por exemplo, experiência prévia de agranulocitose com uma dessas substâncias. Este medicamento é contraindicado em casos de gravidez e amamentação e, não deve ser utilizado por mulheres grávidas sem orientação médica ou do cirurgião-dentista. Informe imediatamente seu médico em caso de suspeita de gravidez. Também é contraindicado para menores de 3 meses de idade ou pesando menos de 5kg.</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações adversas:</strong>&nbsp;A dipirona pode causar choque anafilático, erupções na pele, coceira, ardor, vermelhidão, urticária, inchaço, anemia aplástica, agranulocitose e pancitopenia. Podem ocorrer também trombocitopenia, queda crítica da pressão sanguínea. Em casos muito raros, especialmente em pacientes com histórico de doença nos rins, pode ocorrer piora súbita ou recente da função dos rins (insuficiência renal aguda), em alguns casos com diminuição da produção de urina, redução muito acentuada da produção de urina ou perda aumentada de proteínas através da urina. Em casos isolados, pode ocorrer nefrite intersticial aguda (um tipo de inflamação nos rins). Uma coloração avermelhada pode ser observada algumas vezes na urina.&nbsp;</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções:</strong>&nbsp;Em particular, os seguintes pacientes apresentam risco especial para possíveis reações anafiláticas graves relacionadas à dipirona:&nbsp;pacientes com asma brônquica, particularmente aqueles com rinossinusite poliposa concomitante;&nbsp;pacientes com urticária crônica;&nbsp;pacientes com intolerância ao álcool, por exemplo, pacientes que reagem até mesmo a pequenas quantidades de bebidas alcoólicas, apresentando sintomas como espirros, lacrimejamento e rubor pronunciado da face. A intolerância ao álcool pode ser indicativa da síndrome de asma analgésica prévia não diagnosticada;&nbsp;pacientes com intolerância a corantes (ex. tartrazina) ou a conservantes (ex. benzoatos).&nbsp;A administração de dipirona pode causar reações hipotensivas isoladas;&nbsp;Caso você tenha insuficiência dos rins ou do fígado, recomenda-se evitar o uso de altas doses de dipirona.</div></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p></div><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">OUTRAS INFORMAÇÕES</h3><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Princípio Ativo:</strong>&nbsp;dipirona</span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">PRODUTOS:&nbsp;</span>&nbsp;<a href=\"https://www.ultrafarma.com.br/marca/sanofi-aventis\" class=\"brand\" style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 10px; line-height: inherit; vertical-align: baseline; background-color: rgb(255, 255, 255); color: rgb(120, 183, 243); text-decoration-line: underline;\">SANOFI AVENTIS</a></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE ESTE MEDICAMENTO DURANTE A GRAVIDEZ E EM CRIANÇAS MENORES DE TRÊS MESES DE IDADE. DIPIRONA - DORFLEX UNO ENXAQUECA 1G 4 COMPRIMIDOS É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</p></div>', '/assets/img/items/small/1584997227wlnaGlNzGq-sm.png', 1, 0);
INSERT INTO `items` (`id`, `restaurant_id`, `item_category_id`, `name`, `price`, `old_price`, `image`, `is_recommended`, `is_popular`, `is_new`, `created_at`, `updated_at`, `desc`, `placeholder_image`, `is_active`, `is_veg`) VALUES
(230, 11, 41, 'Luftal 75MG/ML Gota 15ML', '25.50', '27.79', '/assets/img/items/1584999701JmKUKA3Omt.jpg', 1, 0, 0, '2020-03-23 21:41:42', '2020-04-07 23:51:27', '<p><strong style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; color: rgb(100, 100, 100); margin: 0px; padding: 0px; border: 0px; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\">Luftal Gotas</strong><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: rgb(100, 100, 100);\">&nbsp;é um antigases que alivia os sintomas do acúmulo dos gases no estômago e no intestino em até 10 minutos. Indicado para o tratamento do desconforto abdominal, aumento do volume abdominal, dor ou cólicas no abdômen causados pela flatulência, atua diminuindo a tensão dos líquidos digestivos, rompendo as bolhas de ar e dificultando a formação destas.</span><br></p><div class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações</strong>: Você não deve utilizar a simeticona se tiver alergia ou sensibilidade à qualquer um dos componentes da fórmula. Não use simeticona se você apresentar algum dos seguintes sintomas: distensão abdominal grave (grande aumento do volume abdominal); cólica grave (dor na barriga de forte intensidade); dor persistente (mais que 36 horas); massa palpável na região do abdômen.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações</strong>&nbsp;<strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">adversas</strong>: A simeticona não é absorvida pelo organismo. Ela atua somente dentro do aparelho digestivo e é totalmente eliminada nas fezes, sem alterações. Portanto, reações indesejáveis são menos prováveis de ocorrer. Em casos raros, pode ocorrer eczema de contato (inflamação na pele) e, reações imediatas como urticária (alergia da pele).&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções</strong>: Não existem recomendações especiais para pacientes idosos. Não há contraindicação relativa a faixas etárias. Não utilize dose maior que a recomendada. Este medicamento não deve ser utilizado por mulheres grávidas sem orientação médica. Se você estiver grávida ou amamentando, você deve informar seu médico antes de usar este medicamento. Não são conhecidas interações de simeticona com outros medicamentos ou alimentos.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p></div><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">OUTRAS INFORMAÇÕES</h3><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><br></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-registroms\" data-attr=\"registroms\" data-attr-value=\"1018001200079\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Registro MS:</strong>&nbsp;1018001200079</span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Princípio Ativo:</strong>&nbsp;simeticona</span></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. LUFTAL 75MG/ML GOTAS 15ML É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</p></div><p><br></p>', '/assets/img/items/small/1584999701JmKUKA3Omt-sm.jpg', 1, 0),
(231, 11, 41, 'SIMETICONA - LUFTY GOTAS 15ML', '12.00', '19.00', '/assets/img/items/1584999805k5UvfhCPkp.png', 0, 0, 1, '2020-03-23 21:43:25', '2020-03-23 21:43:40', '<p>PRODUTO COM A QUALIDADE:&nbsp;<span style=\"color: rgb(160, 160, 160); font-family: Lato, sans-serif; font-size: 0px;\">&nbsp;</span><a href=\"https://www.ultrafarma.com.br/marca/airela\" class=\"brand\" style=\"background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 10px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; color: rgb(120, 183, 243); text-decoration-line: underline;\">AIRELA</a></p><p><br><br></p>', '/assets/img/items/small/1584999805k5UvfhCPkp-sm.png', 1, 0),
(232, 11, 40, '(Ant Gripal) Perfenol 20 Cap', '11.00', '17.41', '/assets/img/items/1585000162hK1cl4ZHpZ.jpg', 0, 1, 0, '2020-03-23 21:49:22', '2020-04-07 23:50:20', '<p><b style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; color: rgb(100, 100, 100); margin: 0px; padding: 0px; border: 0px; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\">Indicações:&nbsp;</b><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: rgb(100, 100, 100);\">Perfenol é um antigripal múltiplo com ação nas gripes, resfriados, congestão nasal, coriza, febre, cefaleia, dores musculares e demais sintomas presentes nos estados gripais. Uso oral. Uso adulto.</span><br></p><div class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Modo de usar:</b>&nbsp;Para adultos (de 18 a 60 anos), recomenda-se ingerir 1 cápsula a cada 4 horas. Não ingerir mais de 5 cápsulas ao dia. A duração do tratamento deverá ser conforme a orientação médica.</p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Contraindicações:&nbsp;</b><span rgb(0,=\"0,=\" 0);=\"font-family:=\" times;=\"font-size:=\" medium;=\"\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Perfenol é contraindicado para pacientes com hipersensibilidade aos componentes da fórmula, pressão alta, doença cardíaca, diabetes, glaucoma, hipertrofia da próstata, doença renal crônica, insuficiência hepática grave, disfunção tireoidiana, gravidez e lactação sem controle médico. Este medicamento é contraindicado para menores de 18 anos.</span></p><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Reações adversas</b>: Pode ocorrer tontura, vertigem, taquicardia, palpitações, hipertensão, desconforto gástrico e reações cutâneas.</p><p class=\"p3\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Precauções:&nbsp;</b>Este medicamento não deve ser utilizado por mulheres grávidas sem orientação médica ou do cirurgião-dentista. Em pacientes idosos é recomendado o uso sob orientação médica. Este medicamento induz sonolência, não devendo ser utilizado por condutores de veículo, operadores de máquina ou aqueles de cuja atenção dependa a segurança de outras pessoas. Não utilize outro medicamento que contenha paracetamol. As cápsulas não devem ser partidas ou mastigadas. Todo medicamento seve ser mantido fora do alcance de crianças.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"></p></div><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><h3 class=\"tab-content-title\" style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 900; font-stretch: inherit; font-size: 24px; line-height: 1.1; vertical-align: baseline; color: rgb(25, 56, 110); text-transform: uppercase; text-align: center;\">OUTRAS INFORMAÇÕES</h3><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-registroms\" data-attr=\"registroms\" data-attr-value=\"1049713670019\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Registro MS:</strong>&nbsp;1049713670019</span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Princípio Ativo:</strong>&nbsp;fenilefrina, clorfeniramina, paracetamol</span></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE ESTE MEDICAMENTO EM CASO DE DOENÇAS DO CORAÇÃO, PRESSÃO ALTA E GLAUCOMA.. NÃO USE JUNTO COM OUTROS MEDICAMENTOS QUE CONTENHAM PARACETAMOL, COM ÁLCOOL, OU EM CASO DE DOENÇA GRAVE DO FÍGADO. PARACETAMOL + CLORFENIRAMINA+FENILEFRINA - PERFENOL 20 CÁPSULAS É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</p></div><p><br></p>', '/assets/img/items/small/1585000162hK1cl4ZHpZ-sm.jpg', 1, 0),
(233, 11, 39, 'Paracetamol 750mg 20 Com', '10.00', '15.92', '/assets/img/items/15850006314g13Xl2lKf.jpg', 1, 0, 0, '2020-03-23 21:57:12', '2020-04-07 23:42:27', '<p><b style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; color: rgb(100, 100, 100); margin: 0px; padding: 0px; border: 0px; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Indicações</span></b><span style=\"font-family: Arial; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: rgb(100, 100, 100);\">: Indicado para dor (analgésico) e febre (antitérmico). Uso oral. Uso adulto e pediátrico acima de 12 anos de idade.&nbsp;</span><br></p><div class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><p rgb(0,=\"0,=\" 0);=\"font-family:=\" times;=\"font-size:=\" medium;=\"rgb(160,\" 154,=\"154);=\" font-size:=\"16px;=\" text-align:=\"justify;=\" rgb(160,=\"\" 154);=\"\" 16px;=\"\" justify;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Contraindicações</span></b><span style=\"font-family: Arial;\">: Não deve ser administrado para pacientes com conhecida hipersensibilidade ao paracetamol ou à qualquer outro componente da fórmula. Contraindicado para portadores de hepatopatia. Contraindicado também para pacientes que utilizem bebidas alcoólicas crônica e excessivamente.&nbsp;</span><br></p><p rgb(0,=\"0,=\" 0);=\"font-family:=\" times;=\"font-size:=\" medium;=\"rgb(160,\" 154,=\"154);=\" font-size:=\"16px;=\" text-align:=\"justify;=\" rgb(160,=\"\" 154);=\"\" 16px;=\"\" justify;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Reações adversas:</span></b><span style=\"font-family: Arial;\">&nbsp;Pode ocorrer reações de hipersensibilidade, erupções cutâneas, urticária, eritema pigmentar fixo, angioedema, choque anafilático, lesões eritematosas na pele, necrose tubular renal, coma hipoglicêmico e asma brônquica.&nbsp;</span><br></p><p rgb(0,=\"0,=\" 0);=\"font-family:=\" times;=\"font-size:=\" medium;=\"rgb(160,\" 154,=\"154);=\" font-size:=\"16px;=\" text-align:=\"justify;=\" rgb(160,=\"\" 154);=\"\" 16px;=\"\" justify;=\"\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><b style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Precauções:</span></b><span style=\"font-family: Arial;\">&nbsp;Deve-se medicar com cuidado nos casos de pacientes alcoolistas crônicos e nos tratados com indutores enzimáticos ou fármacos consumidores de glutationa (doxorrubicina), pois pode causar hepatotoxicidade grave. Em pacientes alérgicos ao ácido acetilsalicílico, o paracetamol pode provocar reações alérgicas do tipo broncoespasmo. Em crianças com idade abaixo de 2 (dois) anos, a administração deve ser feita somente sob prescrição médica. Não use outro medicamento que contenha paracetamol. Pacientes alérgicos ao ácido acetilsalicílico devem ter cuidado ao usar paracetamol. O paracetamol contém o corante amarelo de tartrazina que pode causar reações de natureza alérgica, entre as quais asma brônquica</span></p></div><div id=\"pdp-section-outras-informacoes\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; padding: 0px 0px 15px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(225, 225, 225); border-left-color: initial; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Lato, sans-serif; vertical-align: baseline; clear: both; color: rgb(100, 100, 100);\"><div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><ul style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; list-style-position: inside; list-style-image: initial;\"><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-registroms\" data-attr=\"registroms\" data-attr-value=\"1049702810019\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Registro MS:</span></strong><span style=\"font-family: Arial;\">&nbsp;1049702810019</span></span></li><li style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span id=\"attr-principioativo\" data-attr=\"principioativo\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">Princípio Ativo:</span></strong><span style=\"font-family: Arial;\">&nbsp;paracetamol</span></span></li></ul></div></div><div id=\"pdp-section-advertencia-anvisa\" class=\"product-details-section\" style=\"margin: 0px 0px 30px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Arial; vertical-align: baseline; clear: both; padding: 10px 20px !important; border: none !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 20px; border: 1px solid rgb(0, 0, 0); font: inherit; vertical-align: baseline;\"><span style=\"font-family: Arial;\">SE PERSISTIREM OS SINTOMAS, O MÉDICO DEVERÁ SER CONSULTADO. NÃO USE JUNTO COM OUTROS MEDICAMENTOS QUE CONTENHAM PARACETAMOL, COM ÁLCOOL, OU EM CASO DE DOENÇA GRAVE DO FÍGADO. PARACETAMOL 750MG 20 COMPRIMIDOS - UNIÃO QUÍMICA - GENÉRICO É UM MEDICAMENTO. SEU USO PODE TRAZER RISCOS. PROCURE UM MÉDICO E O FARMACÊUTICO. LEIA A BULA.</span></p></div><p><br></p>', '/assets/img/items/small/15850006314g13Xl2lKf-sm.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`, `is_enabled`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Pizzaria', 0, '2020-03-06 17:35:07', '2020-03-06 17:39:52', 1),
(2, 'Pizzas', 1, '2020-03-06 17:40:44', '2020-03-06 17:40:44', 21),
(3, 'Bebidas', 1, '2020-03-06 17:40:56', '2020-03-06 17:40:56', 21),
(4, 'Hot dog simples', 0, '2020-03-08 20:02:58', '2020-03-08 20:04:19', 25),
(5, 'Hot dog especial', 0, '2020-03-08 20:03:24', '2020-03-08 20:04:56', 25),
(6, 'Hot dog na chapa tradicional', 0, '2020-03-08 20:03:41', '2020-03-08 20:04:35', 25),
(7, 'Hot dog na chapa tradicional', 0, '2020-03-08 20:03:44', '2020-03-08 20:05:06', 25),
(8, 'Hot dog moda da casa', 0, '2020-03-08 20:03:58', '2020-03-08 20:05:11', 25),
(9, 'Hot dog moda da casa', 0, '2020-03-08 20:04:01', '2020-03-08 20:07:33', 25),
(10, 'Hot dog moda da casa', 0, '2020-03-08 20:04:04', '2020-03-08 20:04:50', 25),
(11, 'hot dog', 0, '2020-03-08 20:07:44', '2020-03-14 21:17:52', 25),
(12, 'Bebidas', 0, '2020-03-08 20:07:56', '2020-03-14 21:17:53', 25),
(13, 'Pizzas Doce', 1, '2020-03-11 16:52:09', '2020-03-11 16:52:09', 21),
(14, 'Hot Dog', 1, '2020-03-14 21:18:23', '2020-03-14 21:18:23', 25),
(15, 'Bebidas', 1, '2020-03-14 21:18:34', '2020-03-14 21:18:34', 25),
(16, 'Refrigerante', 1, '2020-03-14 21:34:33', '2020-03-14 21:34:33', 25),
(17, 'teste', 0, '2020-03-14 21:39:30', '2020-03-14 21:39:36', 1),
(18, 'Burguer', 1, '2020-03-14 22:26:56', '2020-03-14 22:26:56', 24),
(19, 'Bebidas', 1, '2020-03-14 22:27:06', '2020-03-14 22:27:06', 24),
(20, 'Combos', 1, '2020-03-14 22:27:15', '2020-03-14 22:27:15', 24),
(21, 'Chapa', 1, '2020-03-14 22:27:28', '2020-03-14 22:27:28', 24),
(22, 'Sonhos', 1, '2020-03-16 18:07:46', '2020-03-16 18:07:46', 41),
(23, 'Donuts', 1, '2020-03-16 18:08:06', '2020-03-16 18:08:06', 41),
(24, 'Espetinhos', 1, '2020-03-16 19:56:32', '2020-03-16 19:56:32', 43),
(25, 'Jantinhas', 1, '2020-03-16 19:56:47', '2020-03-16 19:56:47', 43),
(26, 'Bebidas', 1, '2020-03-16 19:57:07', '2020-03-16 19:57:07', 43),
(27, 'Caldos', 1, '2020-03-17 13:32:25', '2020-03-17 13:32:25', 43),
(28, 'Brigadeiro Cremoso', 1, '2020-03-17 14:12:46', '2020-03-17 14:12:46', 45),
(29, 'Brigadeirão', 1, '2020-03-17 14:13:03', '2020-03-17 14:13:03', 45),
(30, 'Brownie', 1, '2020-03-17 14:13:18', '2020-03-17 14:13:18', 45),
(31, 'Combos', 1, '2020-03-17 14:13:33', '2020-03-17 14:13:33', 45),
(32, 'Pizzas', 1, '2020-03-17 14:40:06', '2020-03-17 14:40:06', 46),
(33, 'Pizzas Doce', 1, '2020-03-17 14:40:17', '2020-03-17 14:40:17', 46),
(34, 'Lanches', 1, '2020-03-17 14:40:26', '2020-03-17 14:40:26', 46),
(35, 'Caldos', 1, '2020-03-17 14:40:35', '2020-03-17 14:40:35', 46),
(36, 'Bolo', 1, '2020-03-19 18:25:28', '2020-03-19 18:25:28', 61),
(37, 'Ovos de Páscoa', 1, '2020-03-19 18:25:41', '2020-03-19 18:25:41', 61),
(38, 'Bombom aberto', 1, '2020-03-23 11:33:42', '2020-03-23 11:33:42', 61),
(39, 'Analgésico e antitérmico.', 1, '2020-03-23 20:25:07', '2020-03-23 20:25:07', 57),
(40, 'MEDICAMENTO', 1, '2020-03-23 20:25:21', '2020-03-23 20:25:21', 57),
(41, 'Antigases', 1, '2020-03-23 21:37:05', '2020-03-23 21:37:05', 57),
(42, 'Antigripal', 1, '2020-03-23 21:50:16', '2020-03-23 21:50:16', 57);

-- --------------------------------------------------------

--
-- Estrutura para tabela `locations`
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
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 21),
(4, 'App\\User', 22),
(4, 'App\\User', 23),
(3, 'App\\User', 24),
(3, 'App\\User', 25),
(1, 'App\\User', 26),
(2, 'App\\User', 27),
(3, 'App\\User', 28),
(3, 'App\\User', 29),
(2, 'App\\User', 30),
(2, 'App\\User', 31),
(2, 'App\\User', 32),
(2, 'App\\User', 33),
(2, 'App\\User', 34),
(2, 'App\\User', 35),
(2, 'App\\User', 36),
(2, 'App\\User', 37),
(2, 'App\\User', 38),
(2, 'App\\User', 39),
(3, 'App\\User', 40),
(3, 'App\\User', 41),
(2, 'App\\User', 42),
(3, 'App\\User', 43),
(4, 'App\\User', 44),
(3, 'App\\User', 45),
(3, 'App\\User', 46),
(4, 'App\\User', 47),
(4, 'App\\User', 48),
(4, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 51),
(3, 'App\\User', 52),
(4, 'App\\User', 53),
(4, 'App\\User', 54),
(4, 'App\\User', 55),
(3, 'App\\User', 56),
(3, 'App\\User', 57),
(2, 'App\\User', 58),
(2, 'App\\User', 59),
(2, 'App\\User', 60),
(3, 'App\\User', 61),
(4, 'App\\User', 62),
(4, 'App\\User', 63),
(4, 'App\\User', 64),
(4, 'App\\User', 65),
(4, 'App\\User', 66),
(4, 'App\\User', 67);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modules`
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
-- Estrutura para tabela `orderitems`
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

--
-- Fazendo dump de dados para tabela `orderitems`
--

INSERT INTO `orderitems` (`id`, `order_id`, `item_id`, `name`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Calabresa', 1, '42.00', '2020-03-06 18:44:57', '2020-03-06 18:44:57'),
(2, 2, 1, 'Calabresa', 1, '42.00', '2020-03-06 19:08:06', '2020-03-06 19:08:06'),
(3, 3, 1, 'Calabresa', 1, '42.00', '2020-03-06 19:10:30', '2020-03-06 19:10:30'),
(4, 4, 1, 'Calabresa', 1, '42.00', '2020-03-06 19:10:56', '2020-03-06 19:10:56'),
(5, 5, 1, 'Calabresa', 1, '42.00', '2020-03-06 19:32:04', '2020-03-06 19:32:04'),
(6, 6, 1, 'Calabresa', 1, '42.00', '2020-03-06 21:47:54', '2020-03-06 21:47:54'),
(7, 7, 1, 'Calabresa', 1, '42.00', '2020-03-06 21:48:41', '2020-03-06 21:48:41'),
(8, 8, 2, 'Coca Cola', 1, '7.00', '2020-03-07 18:23:24', '2020-03-07 18:23:24'),
(9, 8, 1, 'X-Tudo', 1, '42.00', '2020-03-07 18:23:24', '2020-03-07 18:23:24'),
(10, 9, 3, 'hot dog  tradicional simples', 1, '6.00', '2020-03-08 20:16:25', '2020-03-08 20:16:25'),
(11, 10, 3, 'hot dog  tradicional simples', 1, '6.00', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(12, 11, 1, 'X-Tudo', 1, '42.00', '2020-03-10 15:28:28', '2020-03-10 15:28:28'),
(13, 12, 1, 'X-Tudo', 1, '42.00', '2020-03-10 15:29:20', '2020-03-10 15:29:20'),
(14, 13, 3, 'hot dog  tradicional simples', 1, '6.00', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(15, 14, 41, 'Serrana', 1, '38.00', '2020-03-14 00:16:19', '2020-03-14 00:16:19'),
(16, 15, 51, 'Moda da casa', 1, '12.50', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(17, 16, 3, 'Tradicional simples', 1, '6.00', '2020-03-16 03:30:13', '2020-03-16 03:30:13'),
(18, 17, 3, 'Tradicional simples', 1, '6.00', '2020-03-17 00:49:29', '2020-03-17 00:49:29'),
(19, 18, 3, 'Tradicional simples', 1, '6.00', '2020-03-17 00:51:25', '2020-03-17 00:51:25'),
(20, 19, 4, '4 Queijos', 1, '38.00', '2020-03-17 00:53:08', '2020-03-17 00:53:08'),
(21, 20, 2, 'Coca Cola', 1, '7.00', '2020-03-17 00:54:30', '2020-03-17 00:54:30'),
(22, 21, 4, '4 Queijos', 1, '38.00', '2020-03-17 00:56:33', '2020-03-17 00:56:33'),
(23, 22, 4, '4 Queijos', 1, '38.00', '2020-03-17 00:57:06', '2020-03-17 00:57:06'),
(24, 23, 51, 'Moda da casa', 1, '12.50', '2020-03-17 01:03:58', '2020-03-17 01:03:58'),
(25, 24, 47, 'Tradicional especial', 1, '7.00', '2020-03-17 01:04:34', '2020-03-17 01:04:34'),
(26, 25, 83, 'Leite ninho', 2, '4.00', '2020-03-17 16:41:53', '2020-03-17 16:41:53'),
(27, 26, 2, 'Coca Cola', 1, '7.00', '2020-03-17 21:05:37', '2020-03-17 21:05:37'),
(28, 26, 4, '4 Queijos', 1, '38.00', '2020-03-17 21:05:37', '2020-03-17 21:05:37'),
(29, 27, 27, 'Jamaicana', 1, '37.00', '2020-03-24 01:09:04', '2020-03-24 01:09:04'),
(30, 28, 6, 'Alcaparras', 1, '35.00', '2020-03-27 21:55:15', '2020-03-27 21:55:15'),
(31, 29, 3, 'Tradicional simples', 1, '6.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(32, 29, 48, 'Molho branco simples', 1, '6.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(33, 29, 49, 'Molho branco especial', 1, '7.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(34, 30, 3, 'Tradicional simples', 3, '6.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(35, 30, 3, 'Tradicional simples', 1, '6.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(36, 31, 3, 'Tradicional simples', 1, '6.00', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(37, 32, 3, 'Tradicional simples', 1, '6.00', '2020-04-10 20:42:41', '2020-04-10 20:42:41'),
(38, 33, 51, 'Moda da casa', 1, '12.50', '2020-04-11 20:34:00', '2020-04-11 20:34:00'),
(39, 34, 76, 'X-Tudo', 1, '11.99', '2020-04-13 00:33:10', '2020-04-13 00:33:10'),
(40, 35, 121, 'Frango', 1, '14.00', '2020-04-13 23:05:00', '2020-04-13 23:05:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
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

--
-- Fazendo dump de dados para tabela `orders`
--

INSERT INTO `orders` (`id`, `unique_order_id`, `orderstatus_id`, `user_id`, `coupon_name`, `location`, `address`, `tax`, `restaurant_charge`, `delivery_charge`, `total`, `created_at`, `updated_at`, `payment_mode`, `order_comment`, `restaurant_id`, `transaction_id`, `delivery_type`, `payable`) VALUES
(1, 'OD-03-06-53QE3M', 6, 22, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-06 18:44:57', '2020-03-09 16:40:46', 'COD', NULL, 1, NULL, 1, '54.00'),
(2, 'OD-03-06-GRYERO', 6, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-06 19:08:06', '2020-03-09 16:41:02', 'COD', NULL, 1, NULL, 1, '54.00'),
(3, 'OD-03-06-4KBZK6', 6, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-06 19:10:30', '2020-03-06 19:14:11', 'COD', NULL, 1, NULL, 1, '54.00'),
(4, 'OD-03-06-ZRGORV', 6, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '0.00', '49.00', '2020-03-06 19:10:56', '2020-03-06 19:13:17', 'COD', NULL, 1, NULL, 2, '49.00'),
(5, 'OD-03-06-VRV13R', 5, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '0.00', '49.00', '2020-03-06 19:32:04', '2020-03-06 19:37:18', 'COD', NULL, 1, NULL, 2, '49.00'),
(6, 'OD-03-06-OR9MRL', 6, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-06 21:47:54', '2020-03-06 21:48:20', 'COD', NULL, 1, NULL, 1, '54.00'),
(7, 'OD-03-06-MKBO39', 6, 22, NULL, '{\"lat\":\"-15.9053607\",\"lng\":\"-52.241874\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":\"Casa\"}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-06 21:48:41', '2020-03-09 16:40:24', 'COD', NULL, 1, NULL, 1, '54.00'),
(8, 'OD-03-07-OK1OR2', 6, 22, NULL, '{\"lat\":\"-15.905365753943155\",\"lng\":\"-52.241865678011266\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '60.00', '2020-03-07 18:23:24', '2020-03-09 16:39:53', 'COD', NULL, 2, NULL, 1, '60.00'),
(9, 'OD-03-08-ZR2DK1', 5, 22, NULL, '{\"lat\":\"-15.905365753943155\",\"lng\":\"-52.241865678011266\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '3.50', '14.00', '2020-03-08 20:16:25', '2020-03-08 20:24:11', 'COD', NULL, 4, NULL, 1, '14.00'),
(10, 'OD-03-09-DKKVLK', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '3.50', '16.50', '2020-03-10 00:23:19', '2020-03-11 13:45:34', 'COD', NULL, 4, NULL, 1, '16.50'),
(11, 'OD-03-10-2KZYL4', 6, 22, NULL, '{\"lat\":\"-15.8916033\",\"lng\":\"-52.2615413\",\"address\":\"Av. Min. Jo\\u00e3o Alberto, 572 - Centro, Barra do Gar\\u00e7as - MT, 78600-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, '5.00', '53.00', '2020-03-10 15:28:28', '2020-03-10 15:28:53', 'COD', NULL, 2, NULL, 1, '53.00'),
(12, 'OD-03-10-RRWZ3V', 6, 22, NULL, '{\"lat\":\"-15.8916033\",\"lng\":\"-52.2615413\",\"address\":\"Av. Min. Jo\\u00e3o Alberto, 572 - Centro, Barra do Gar\\u00e7as - MT, 78600-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, '5.00', '54.00', '2020-03-10 15:29:20', '2020-03-10 15:29:28', 'COD', NULL, 2, NULL, 1, '54.00'),
(13, 'OD-03-10-735WL8', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '3.50', '16.50', '2020-03-10 18:09:17', '2020-03-11 13:45:21', 'COD', NULL, 4, NULL, 1, '16.50'),
(14, 'OD-03-13-WLVMRD', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '58.00', '2020-03-14 00:16:19', '2020-03-14 00:17:21', 'COD', NULL, 1, NULL, 1, '58.00'),
(15, 'OD-03-16-J3WEL2', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '3.50', '24.00', '2020-03-16 03:27:57', '2020-03-16 03:29:29', 'COD', NULL, 4, NULL, 1, '24.00'),
(16, 'OD-03-16-5L0EKB', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '3.50', '9.50', '2020-03-16 03:30:13', '2020-03-17 00:50:28', 'COD', NULL, 4, NULL, 1, '9.50'),
(17, 'OD-03-16-J3MGLM', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '10.00', '2020-03-17 00:49:29', '2020-03-17 00:50:29', 'COD', NULL, 4, NULL, 1, '10.00'),
(18, 'OD-03-16-WKO7KX', 6, 44, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '13.50', '2020-03-17 00:51:25', '2020-03-17 01:03:43', 'COD', NULL, 4, NULL, 1, '13.50'),
(19, 'OD-03-16-XLQ9LQ', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '42.00', '2020-03-17 00:53:08', '2020-03-17 00:53:46', 'COD', NULL, 1, NULL, 1, '42.00'),
(20, 'OD-03-16-BKMV3M', 6, 44, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '11.00', '2020-03-17 00:54:29', '2020-03-17 00:54:48', 'COD', NULL, 1, NULL, 1, '11.00'),
(21, 'OD-03-16-WK4M3D', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '42.00', '2020-03-17 00:56:33', '2020-03-17 00:56:40', 'COD', NULL, 1, NULL, 1, '42.00'),
(22, 'OD-03-16-YRYZLP', 6, 25, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '42.00', '2020-03-17 00:57:06', '2020-03-17 01:05:49', 'COD', NULL, 1, NULL, 1, '42.00'),
(23, 'OD-03-16-R37YLW', 6, 44, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '17.50', '2020-03-17 01:03:58', '2020-03-17 01:06:09', 'COD', NULL, 4, NULL, 1, '17.50'),
(24, 'OD-03-16-8LPB35', 6, 44, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '11.00', '2020-03-17 01:04:34', '2020-03-17 15:38:23', 'COD', NULL, 4, NULL, 1, '11.00'),
(25, 'OD-03-17-73E13G', 6, 48, NULL, '{\"lat\":\"-15.891727125507654\",\"lng\":\"-52.26150911349181\",\"address\":\"Av. Min. Jo\\u00e3o Alberto, s\\/n - Centro, Barra do Gar\\u00e7as - MT, 78600-000, Brazil\",\"house\":\"Rua Moreira Cabral N 603\",\"tag\":null}', 'Rua Moreira Cabral N 603, Av. Min. João Alberto, s/n - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, '4.00', '12.00', '2020-03-17 16:41:53', '2020-03-17 16:52:09', 'COD', NULL, 5, NULL, 1, '12.00'),
(26, 'OD-03-17-1LZVLZ', 5, 44, NULL, '{\"lat\":\"-15.9053548\",\"lng\":\"-52.2418852\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '55.00', '2020-03-17 21:05:37', '2020-03-17 21:07:49', 'COD', NULL, 1, NULL, 1, '55.00'),
(27, 'OD-03-23-VKNZKA', 6, 22, NULL, '{\"lat\":\"-15.9053545\",\"lng\":\"-52.2418864\",\"address\":\"Av. Melqu\\u00eddes V\\u00edctor de Oliveira, 411 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Melquídes Víctor de Oliveira, 411 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '47.00', '2020-03-24 01:09:04', '2020-03-24 13:25:34', 'COD', NULL, 1, NULL, 1, '47.00'),
(28, 'OD-03-27-BLLR3D', 6, 22, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '55.00', '2020-03-27 21:55:15', '2020-03-29 21:24:31', 'COD', NULL, 1, NULL, 1, '55.00'),
(29, 'OD-04-07-P3AZR8', 6, 66, NULL, '{\"lat\":\"-15.8916033\",\"lng\":\"-52.2615413\",\"address\":\"Av. Min. Jo\\u00e3o Alberto, 572 - Centro, Barra do Gar\\u00e7as - MT, 78600-000, Brazil\",\"house\":null,\"tag\":null}', ', Av. Min. João Alberto, 572 - Centro, Barra do Garças - MT, 78600-000, Brazil', NULL, NULL, '4.38', '26.38', '2020-04-07 20:16:39', '2020-04-07 21:02:08', 'COD', NULL, 4, NULL, 1, '26.38'),
(30, 'OD-04-08-03DOKV', 6, 27, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '36.00', '2020-04-08 21:08:25', '2020-04-08 22:58:02', 'COD', NULL, 4, NULL, 1, '36.00'),
(31, 'OD-04-09-WKNG3A', 5, 27, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '0.00', '14.00', '2020-04-09 13:45:32', '2020-04-11 20:39:16', 'COD', NULL, 4, NULL, 2, '14.00'),
(32, 'OD-04-10-DL8PLY', 6, 67, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '10.00', '2020-04-10 20:42:41', '2020-04-10 20:43:02', 'COD', NULL, 4, NULL, 1, '10.00'),
(33, 'OD-04-11-JLOE3A', 5, 67, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '4.00', '18.50', '2020-04-11 20:34:00', '2020-04-11 20:44:48', 'COD', NULL, 4, NULL, 1, '18.50'),
(34, 'OD-04-12-K3PYRB', 6, 27, NULL, '{\"lat\":\"-15.9057534\",\"lng\":\"-52.2387439\",\"address\":\"R. Le\\u00e3o Paulo dos Santos, 72 - St. Nova Esperanca, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":\"Avenida josephina balestero,1911-St.Nova esperan\\u00e7a\",\"tag\":null}', 'Avenida josephina balestero,1911-St.Nova esperança, R. Leão Paulo dos Santos, 72 - St. Nova Esperanca, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '0.00', '11.99', '2020-04-13 00:33:10', '2020-04-13 15:43:25', 'COD', NULL, 3, NULL, 2, '11.99'),
(35, 'OD-04-13-RRX731', 6, 67, NULL, '{\"lat\":\"-15.8994136\",\"lng\":\"-52.2431843\",\"address\":\"R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragar\\u00e7as - GO, 76240-000, Brazil\",\"house\":null,\"tag\":null}', ', R. Agenor Pacheco de Menezes, 126 - St. Bela Vista, Aragarças - GO, 76240-000, Brazil', NULL, NULL, '5.00', '19.00', '2020-04-13 23:05:00', '2020-04-13 23:06:38', 'COD', NULL, 8, NULL, 1, '19.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orderstatuses`
--

CREATE TABLE `orderstatuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `orderstatuses`
--

INSERT INTO `orderstatuses` (`id`, `name`) VALUES
(1, 'Ready For Pick Up'),
(2, 'Ready For Pick Up'),
(3, 'Ready For Pick Up'),
(4, 'Ready For Pick Up'),
(5, 'Ready For Pick Up');

-- --------------------------------------------------------

--
-- Estrutura para tabela `order_item_addons`
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

--
-- Fazendo dump de dados para tabela `order_item_addons`
--

INSERT INTO `order_item_addons` (`id`, `orderitem_id`, `addon_category_name`, `addon_name`, `addon_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Borda', 'Catupiry', '7.00', '2020-03-06 18:44:57', '2020-03-06 18:44:57'),
(2, 2, 'Borda', 'Catupiry', '7.00', '2020-03-06 19:08:06', '2020-03-06 19:08:06'),
(3, 3, 'Borda', 'Catupiry', '7.00', '2020-03-06 19:10:30', '2020-03-06 19:10:30'),
(4, 4, 'Borda', 'Catupiry', '7.00', '2020-03-06 19:10:56', '2020-03-06 19:10:56'),
(5, 5, 'Borda', 'Catupiry', '7.00', '2020-03-06 19:32:04', '2020-03-06 19:32:04'),
(6, 6, 'Borda', 'Catupiry', '7.00', '2020-03-06 21:47:54', '2020-03-06 21:47:54'),
(7, 7, 'Borda', 'Catupiry', '7.00', '2020-03-06 21:48:41', '2020-03-06 21:48:41'),
(8, 9, 'Pão', 'Sírio', '0.00', '2020-03-07 18:23:24', '2020-03-07 18:23:24'),
(9, 9, 'Molho', 'Maionese Verdinha', '1.00', '2020-03-07 18:23:24', '2020-03-07 18:23:24'),
(10, 9, 'Opcionais', 'File de frango', '5.00', '2020-03-07 18:23:24', '2020-03-07 18:23:24'),
(11, 10, 'opcional', 'bacon', '2.00', '2020-03-08 20:16:25', '2020-03-08 20:16:25'),
(12, 10, 'opcional', 'mussarela', '1.50', '2020-03-08 20:16:25', '2020-03-08 20:16:25'),
(13, 10, 'opcional', 'ovo de codorna', '1.00', '2020-03-08 20:16:25', '2020-03-08 20:16:25'),
(14, 11, 'opcional', 'bacon', '2.00', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(15, 11, 'opcional', 'calabresa', '1.50', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(16, 11, 'opcional', 'mussarela', '1.50', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(17, 11, 'opcional', 'ovo de codorna', '1.00', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(18, 11, 'opcional', 'ovo de galinha', '1.00', '2020-03-10 00:23:19', '2020-03-10 00:23:19'),
(19, 12, 'Pão', 'Sírio', '0.00', '2020-03-10 15:28:28', '2020-03-10 15:28:28'),
(20, 12, 'Molho', 'Maionese Verdinha', '1.00', '2020-03-10 15:28:28', '2020-03-10 15:28:28'),
(21, 12, 'Opcionais', 'File de carne', '5.00', '2020-03-10 15:28:28', '2020-03-10 15:28:28'),
(22, 13, 'Pão', 'Sírio', '0.00', '2020-03-10 15:29:20', '2020-03-10 15:29:20'),
(23, 13, 'Molho', 'Pimenta', '2.00', '2020-03-10 15:29:20', '2020-03-10 15:29:20'),
(24, 13, 'Opcionais', 'File de carne', '5.00', '2020-03-10 15:29:20', '2020-03-10 15:29:20'),
(25, 14, 'opcional', 'bacon', '2.00', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(26, 14, 'opcional', 'calabresa', '1.50', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(27, 14, 'opcional', 'mussarela', '1.50', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(28, 14, 'opcional', 'ovo de codorna', '1.00', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(29, 14, 'opcional', 'ovo de galinha', '1.00', '2020-03-10 18:09:17', '2020-03-10 18:09:17'),
(30, 15, 'Tamanho', 'Familia', '5.00', '2020-03-14 00:16:19', '2020-03-14 00:16:19'),
(31, 15, 'Borda', 'Catupiry', '10.00', '2020-03-14 00:16:19', '2020-03-14 00:16:19'),
(32, 16, 'Adicional', 'Bacon', '2.00', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(33, 16, 'Adicional', 'Calabresa', '1.50', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(34, 16, 'Adicional', 'Mussarela', '1.50', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(35, 16, 'Adicional', 'Ovo de codorna', '1.00', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(36, 16, 'Adicional', 'Ovo de galinha', '1.00', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(37, 16, 'Adicional', 'Cheddar', '1.00', '2020-03-16 03:27:57', '2020-03-16 03:27:57'),
(38, 19, 'Adicional', 'Bacon', '2.00', '2020-03-17 00:51:25', '2020-03-17 00:51:25'),
(39, 19, 'Adicional', 'Calabresa', '1.50', '2020-03-17 00:51:25', '2020-03-17 00:51:25'),
(40, 20, 'Tamanho', 'Grande', '0.00', '2020-03-17 00:53:08', '2020-03-17 00:53:08'),
(41, 22, 'Tamanho', 'Grande', '0.00', '2020-03-17 00:56:33', '2020-03-17 00:56:33'),
(42, 23, 'Tamanho', 'Grande', '0.00', '2020-03-17 00:57:06', '2020-03-17 00:57:06'),
(43, 24, 'Adicional', 'Ovo de codorna', '1.00', '2020-03-17 01:03:58', '2020-03-17 01:03:58'),
(44, 28, 'Tamanho', 'Familia', '5.00', '2020-03-17 21:05:37', '2020-03-17 21:05:37'),
(45, 29, 'Tamanho', 'Familia', '5.00', '2020-03-24 01:09:04', '2020-03-24 01:09:04'),
(46, 30, 'Tamanho', 'Familia', '5.00', '2020-03-27 21:55:15', '2020-03-27 21:55:15'),
(47, 30, 'Borda', 'Catupiry', '10.00', '2020-03-27 21:55:15', '2020-03-27 21:55:15'),
(48, 31, 'Adicional', 'Cheddar', '1.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(49, 32, 'Adicional', 'Cheddar', '1.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(50, 33, 'Adicional', 'Cheddar', '1.00', '2020-04-07 20:16:39', '2020-04-07 20:16:39'),
(51, 35, 'Adicional', 'Bacon', '2.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(52, 35, 'Adicional', 'Calabresa', '1.50', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(53, 35, 'Adicional', 'Mussarela', '1.50', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(54, 35, 'Adicional', 'Ovo de codorna', '1.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(55, 35, 'Adicional', 'Ovo de galinha', '1.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(56, 35, 'Adicional', 'Cheddar', '1.00', '2020-04-08 21:08:25', '2020-04-08 21:08:25'),
(57, 36, 'Adicional', 'Bacon', '2.00', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(58, 36, 'Adicional', 'Calabresa', '1.50', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(59, 36, 'Adicional', 'Mussarela', '1.50', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(60, 36, 'Adicional', 'Ovo de codorna', '1.00', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(61, 36, 'Adicional', 'Ovo de galinha', '1.00', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(62, 36, 'Adicional', 'Cheddar', '1.00', '2020-04-09 13:45:32', '2020-04-09 13:45:32'),
(63, 38, 'Adicional', 'Bacon', '2.00', '2020-04-11 20:34:00', '2020-04-11 20:34:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pages`
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
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_otps`
--

CREATE TABLE `password_reset_otps` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `password_reset_otps`
--

INSERT INTO `password_reset_otps` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 6, 'YNPS2W', '2020-02-29 15:36:14', '2020-03-05 05:47:14'),
(2, 2, 'X7FW7N', '2020-02-29 15:39:08', '2020-02-29 15:39:08'),
(3, 11, '65VUCH', '2020-03-03 09:16:48', '2020-03-03 18:15:23'),
(4, 4, '3RX45T', '2020-03-03 10:01:44', '2020-03-03 18:23:27'),
(5, 5, 'A697HP', '2020-03-03 10:06:41', '2020-03-05 15:07:54'),
(6, 12, 'YV4866', '2020-03-03 10:10:09', '2020-03-03 10:10:09'),
(7, 3, 'G3ZXUU', '2020-03-03 18:13:55', '2020-03-03 18:13:55'),
(8, 22, 'AXJM97', '2020-03-11 18:29:38', '2020-03-11 18:47:05'),
(9, 27, 'H2RXUN', '2020-03-27 22:24:35', '2020-04-03 15:13:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_gateways`
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
-- Fazendo dump de dados para tabela `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `description`, `logo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'COD', 'Cash On Delivery Payment', NULL, 1, '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(2, 'Stripe', 'Online Payment with Stripe', NULL, 0, '2020-01-03 11:49:33', '2020-04-13 16:39:14'),
(3, 'Paypal', 'Paypal Express Checkout', NULL, 0, '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(4, 'PayStack', 'PayStack Payment Gateway', NULL, 0, '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(5, 'Razorpay', 'PayStack Payment Gateway', NULL, 0, '2020-01-03 11:49:33', '2020-03-04 23:04:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
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
-- Estrutura para tabela `popular_geo_places`
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
-- Fazendo dump de dados para tabela `popular_geo_places`
--

INSERT INTO `popular_geo_places` (`id`, `name`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Aragarças', '-15.8994136', '-52.2431843', 1, '2020-03-06 17:50:11', '2020-03-06 17:50:11'),
(2, 'Barra do Garças', '-15.8916033', '-52.2615413', 1, '2020-03-06 17:50:30', '2020-03-06 17:50:30'),
(3, 'Pontal do Araguaia', '-15.9045099', '-52.257365', 1, '2020-03-06 17:50:58', '2020-03-06 17:50:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `promo_sliders`
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
-- Fazendo dump de dados para tabela `promo_sliders`
--

INSERT INTO `promo_sliders` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `location_id`, `position_id`, `size`) VALUES
(3, 'Extra largo', 1, '2020-03-07 17:26:33', '2020-03-07 17:26:41', 0, 0, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `push_tokens`
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
-- Fazendo dump de dados para tabela `push_tokens`
--

INSERT INTO `push_tokens` (`id`, `token`, `status`, `is_sent`, `is_active`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'erRHUEB0EXQ:APA91bFtWAuKmd4rgbQH_0uczEL-8bnWOAMAgYGWlq08A-OCgTRoxhyxqAdUpjuQlXh_yu5qDuebaLSDxOSpDE_cR8mIgf45QeqKc1CsauTJRqSnvMif9sLQ573D3ybkxW5q8zk-7YHs', 0, 0, 1, 1, '2020-02-29 13:00:49', '2020-03-05 13:13:13'),
(2, 'flvREinJb6A:APA91bH8ydHRVoD0AlbYIHk5mCo0SgmwsQtKP_znAH2TSLE5iWeG4Yoo9fFMkWCW_ayKb4hrUCpwa_nHHGReL2wcVq_d9a6qVtdmhjrf4yUAugZ-T9xA8qKkwUl9EcLQXqNigJE6LJFF', 0, 0, 1, 3, '2020-02-29 15:01:56', '2020-02-29 15:01:56'),
(3, 'eCpsO1QpG0M:APA91bGhmWuHg6TK86tLmYHCT8f7g-hQQdN1Pn-RrdAEqKQ0viIKx-DqkCaNus2joJgRoOJC7HsjzD0xABKnbK4vHZGa91hcr0CqjrAgDEeaeqxvt9gyd91L2dZHCZKjUZwvABENgBf8', 0, 0, 1, 2, '2020-02-29 15:02:32', '2020-03-03 09:40:54'),
(4, 'eZ7SQuKukx8:APA91bGW7rFHcUrm9eYXS89BQqZBzTjAeL1dM9LmrroQX8RRRO53en9_o7qQGwGJl3chr-MCs70zLOVXNZfc0khZQ5pesPwOpsJUJs6zLA2iXIhqv76YxpGliS1sQI5NqYSt4yI_Mw4B', 0, 0, 1, 4, '2020-02-29 15:08:31', '2020-03-03 18:04:18'),
(5, 'emtpnqRd28k:APA91bEiaRdccLsT69nsBaB9kaEW7kwV_32dZ9oweYE4w2lPnwkkNl9J6qPmKrz43ok7qMOpBfHroCDiVbbZYQL1k_IlBC3C9GfIM6aKyn2QdxN4V2EI9vtWn-n3VN29jviM2TcndLwg', 0, 0, 1, 5, '2020-02-29 15:09:13', '2020-03-05 15:15:49'),
(6, 'fCNKy9BYNiA:APA91bFZ5NNfNepwplwxuD-fSXx-1XW9MzUaaEhhUUV0yQNmlyG3ssEDmJD141Dj55eMSP1X81lXkcTzcEdqCwnhNNJF9_NMKwGjwB9rycM0ZXfbYrkJFsatAW1pG5ru_DsZfzgSr0sa', 0, 0, 1, 7, '2020-02-29 16:57:20', '2020-02-29 20:06:18'),
(7, 'cHG9qEFxBMA:APA91bFSt7CJd4r_SM1EzhdVSmGD5vbemG336zOTwBspxQvckBfbpx3ike7mNOGIRlwa3wX4cH2tEMXVJsIzQdRLcT_hBxYFCxy1PwvjK2mK09WCwd1jh2bIMNaq0_teyD7364p5ce0t', 0, 0, 1, 8, '2020-02-29 17:16:44', '2020-02-29 17:16:44'),
(8, 'fIKcAbOviYo:APA91bGHK1qTVJqydhFSHGSS6oSQI8B3BatXDzT0sVkY38rZjXykAObZaGzqFG5IsUpcxF-HDQuj86C6ZjnaFmbBZJyyCV57JDrY5OrwpyTPCm3E2Qg_Jq-S0a5Hc_laZBwNmeZ4yFgh', 0, 0, 1, 10, '2020-02-29 20:04:09', '2020-02-29 20:04:09'),
(9, 'dIWMIhQAz_8:APA91bGdZfYwaKRKjMS6Mf5r7K0VqfBdgIfDg2F6OOVQLQQGg6h34izPnHUrXwK2rZTHEX7sNQ8gRcPStMByvcdDDoMmIF-eWJLxRLmNma7vSNk_-2vnPd3Y4iTvDTC-6zJ59mYTIZBh', 0, 0, 1, 12, '2020-03-03 10:17:14', '2020-03-03 18:03:23'),
(10, 'dF2HxF22weE:APA91bGpjxwlquBwX6yNbimkpsPfywnMClynTy9xO5qdrPwfu_T1LhD6RbIY-OwtR8h62EIegExGkJpi1BRXmnzl1RhgIEs7WcI8NUZIfj_dMbPfWQ32ZTPGzL1TSouzPQR6oo7_1FsY', 0, 0, 1, 6, '2020-03-04 17:14:15', '2020-03-04 17:14:15'),
(11, 'eLpjZsLA5j6MchylLS6C7N:APA91bGEwfKazBmg6UAl9hEZ4iBnqzNwfMGbLtOssZ1evXvKUtvbb_0dSnegU7TxyqbHQWjdD1S62M9GmVTaOd0mfygSJVkcOqwSQeYi5CgagQkAyDU4xTDmah8eVso3_hfSMMfUBHl1', 0, 0, 1, 15, '2020-03-04 22:22:27', '2020-03-04 22:22:27'),
(12, 'dF2HxF22weE:APA91bGpjxwlquBwX6yNbimkpsPfywnMClynTy9xO5qdrPwfu_T1LhD6RbIY-OwtR8h62EIegExGkJpi1BRXmnzl1RhgIEs7WcI8NUZIfj_dMbPfWQ32ZTPGzL1TSouzPQR6oo7_1FsY', 0, 0, 1, 17, '2020-03-04 22:27:07', '2020-03-04 22:27:07'),
(13, 'fIpqg1Czxgw:APA91bHQeJn-R7_VkZ65XmfUACB9jsewYbbd2Y06Lmipguwgo-sBJPhrU20ggC9rzhZUiDieC9V1ex5XfIslesR6wsLQB503x9XLfdKzYQl1H8f6i1sGgPbf5IIYVlyiI_tCXeKSwUGr', 0, 0, 1, 14, '2020-03-04 18:52:43', '2020-03-04 18:52:43'),
(14, 'd1rk9KP4yjQ:APA91bHP9hRmYiJWecq7x5u_BmmLMs-abVWFwmKs7HpCJSox2MxH7jAYlR1XvJXiVAl8988Uetxjq6g2YY0SUSGnPCK40DVyFuO06LMdf7d76S4VBm8Azpp5QixoJpqJexmhLXBSow4A', 0, 0, 1, 18, '2020-03-05 05:39:59', '2020-03-05 05:39:59'),
(15, 'cOlcIEOgK5A:APA91bHWxs7gLoG4mVvtk0OK6bHB6oxMi6vtuUzTkMBYyMtuBRaGmKCdhDVz2md081tYWa2g4yhu4EV2m0uHg4PeqxeRPe3SkY-XjKxMc3ZZXPfV9TVM2igyPYhv9nhHxx4mbsE9E3o9', 0, 0, 1, 22, '2020-03-06 18:52:10', '2020-03-28 15:21:39'),
(16, 'f5-yxZBEXNTAYMSTpjv-DP:APA91bHZH9JZzpX5J2Y1xxnTsriyhpZWXAOgnJej3GSjmhItj1ukPv3-feqeqJfN4cXVfji8J4yc_TtPZY9cXz8VoDKRpCpTWYtFgC4xmm_7jgSelU-omqxxmdTPt6OsiyP5fTyZbWwo', 0, 0, 1, 21, '2020-03-08 19:07:58', '2020-04-13 16:27:36'),
(17, 'de5ahw8vX5Lpdhii5XJuiX:APA91bGpN6jSD8wcQLScWeRz9fIUQ1SkCMsUc6gc04kgie3VSee6wPu_1Rih8GlYSGyugSMREhJay-s-4qliUH6XpAFEaZ2rB0YbZRY5sxp_VQYittvJk02RteA4KK-5n4kLLiG9gjoM', 0, 0, 1, 24, '2020-03-08 19:25:44', '2020-03-08 19:25:44'),
(18, 'c-cTPUUjWvs54Mt_y9vHSg:APA91bGuSyfHqHlkyk01MKg60mqb8hT3YxbgUVDNcD4VoauOS7MbWCkDmT0gXcua1qizCoRt2tWwtxR5H6UL2F0KusVvD_n4caInC0MsJ9pkwik_MIoYUJyl8csDdlfmnjvu1x2lH7_W', 0, 0, 1, 25, '2020-03-08 19:48:53', '2020-04-09 13:36:47'),
(19, 'c0PtM4Bwphg:APA91bHiGcuYSQuOJ4FBPYZBDry9bJrM4U7q0K6tABfnFotH24QkntSKKBMrwLlCoyN1rHAuUunF8Xe_owgHwbATUNPQKg--u1GBWNbyj3YYVPhLUob2c8xCwdrBNV7kjGXIZybMizhP', 0, 0, 1, 35, '2020-03-10 13:39:18', '2020-04-11 20:42:30'),
(20, 'fFeKeWRfK86h0A1X03WIAM:APA91bGTIcy32CVXJM64l0F3nYhDNQd7W0MiiH8jPEM-SeH6iFLWFvigFAFKqm6Dv9Muc_p49xKfLe0UkDZYMMxuBAL6NmAh1z_MpZ449YnGTxg-nRfKDwSIi87upto9gcXa77D64F44', 0, 0, 1, 41, '2020-03-16 20:17:30', '2020-03-16 20:17:30'),
(21, 'fGvRgIN359BJHpmpcHrrRO:APA91bG8zq2Ro2U4skBGj3rlxFgX_6mELODfQKiSW753UekGsD6gd-j8UBBeWyQ6b3AsTQqj1nqS7kA__w7A1ULynSt5ehH0a71MEi78lJkBMbt9OPL9DMp-DbsC0OjTyecJbtoTEX9t', 0, 0, 1, 43, '2020-03-17 13:24:38', '2020-03-17 13:24:38'),
(22, 'fFkolv63kAVxxjUN9fLblN:APA91bEUnSJIoZzgqQmXs5cToVXMhsP0NUxMOIHq2W58KOFXHTVIDdAaYrvUGT-95onxou9gQhSZ5OG_u_DYdxHssuGYdRdVl50q8H2Z8LG_-bfuQlU1iq46yNPZRm6Wm347IJE7ObzS', 0, 0, 1, 45, '2020-03-17 13:53:38', '2020-03-18 16:59:25'),
(23, 'fGvRgIN359BJHpmpcHrrRO:APA91bG8zq2Ro2U4skBGj3rlxFgX_6mELODfQKiSW753UekGsD6gd-j8UBBeWyQ6b3AsTQqj1nqS7kA__w7A1ULynSt5ehH0a71MEi78lJkBMbt9OPL9DMp-DbsC0OjTyecJbtoTEX9t', 0, 0, 1, 46, '2020-03-17 14:31:45', '2020-03-17 14:31:45'),
(24, 'dLYOWOMh92E:APA91bHWP5UrYS3-aeQ9Gi_9-MW2qfFEjApwx-lBUiSagov4E9bKDQaaKMnT8hwMkeMHfsfNW5uH8Mgay49oI4sSUV8VgVy-j5qZE-cf-T8Id7Oyg3XMEJ06Wha0Pk_iXLLuS6xhuHs-', 0, 0, 1, 51, '2020-03-18 14:02:48', '2020-03-18 16:57:26'),
(25, 'fGvRgIN359BJHpmpcHrrRO:APA91bG8zq2Ro2U4skBGj3rlxFgX_6mELODfQKiSW753UekGsD6gd-j8UBBeWyQ6b3AsTQqj1nqS7kA__w7A1ULynSt5ehH0a71MEi78lJkBMbt9OPL9DMp-DbsC0OjTyecJbtoTEX9t', 0, 0, 1, 57, '2020-03-23 17:23:17', '2020-03-23 17:23:17'),
(26, 'eZLKCgFambI:APA91bFKEwRo_c3CcS8_BsoMmSGDZyQ8rNovSgbc3YoYbGdR80G2C_96Glc1eJ6YCvsUX_0zzLc-DRRAJvxDd2C22MzkuVZSXR564YkDjljztAzPBJ5SmShU9v97MZCDv2HX5N4WuPdw', 0, 0, 1, 27, '2020-03-23 23:23:45', '2020-03-23 23:23:45'),
(27, 'c_zYXl1T0qM:APA91bF0UzXLKfAr8QAx26YvhEl0OLAlNbTXE2pSiEhceWlnpWgjzKjAn-jXysoA5JCWFKJNOgD7Hqp2gXqfzrSWEHjh58hsBbqluddyJAfXhhSCk5F_oe_lFlRLtBUUHxd2f9rR86ZP', 0, 0, 1, 33, '2020-04-13 22:45:10', '2020-04-13 22:45:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ratings`
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
-- Estrutura para tabela `restaurants`
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
  `extra_delivery_distance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `location_id`, `image`, `rating`, `delivery_time`, `price_range`, `is_pureveg`, `created_at`, `updated_at`, `slug`, `placeholder_image`, `latitude`, `longitude`, `certificate`, `restaurant_charges`, `delivery_charges`, `address`, `pincode`, `landmark`, `sku`, `is_active`, `is_accepted`, `is_featured`, `commission_rate`, `delivery_type`, `delivery_radius`, `delivery_charge_type`, `base_delivery_charge`, `base_delivery_distance`, `extra_delivery_charge`, `extra_delivery_distance`) VALUES
(1, 'Pigalle Pizzaria', 'Qua a Seg, 19 as 23:30', NULL, '/assets/img/restaurants/1583515969AknDL0nEZF.jpg', '5', '50', '45', 1, '2020-03-06 17:32:49', '2020-03-17 15:36:36', 'pigalle-pizzaria-9algP9LfIiVC7lA', '/assets/img/restaurants/small/1583515969AknDL0nEZF-sm.jpg', '-15.89796304', '-52.2438097', 'Liberado', NULL, '5.00', 'Rua Minervino Bertolino, n 482, setor bela vista, Aragarças - GO', '76240-000', NULL, '1583515969uLGgugLqph', 1, 1, 0, '5.00', 3, '10.00', 'DYNAMIC', '5.00', 2, '7.00', 10),
(2, 'Amostra', 'Aberto das 08 as 18 hrs', NULL, '/assets/img/restaurants/1583600905YWiiDAZ3xO.png', '5', '40', '45', 1, '2020-03-07 17:08:25', '2020-03-16 16:52:20', 'amostra-tcBmp9PEjykhY4X', '/assets/img/restaurants/small/1583600905YWiiDAZ3xO-sm.png', '-15.8916033', '-52.2615413', 'Liberado', NULL, '5.00', 'AVENIDA Ministro joao alberto, 2425', '78600-000', NULL, '1583600905H8s62iMh1h', 0, 1, 0, '5.00', 1, '10.00', 'FIXED', NULL, NULL, NULL, NULL),
(3, 'RAIZ HAMBÚRGUERIA', 'Ter a Dom, 19 as 00:00', NULL, '/assets/img/restaurants/1584388499yCXosJ7v1G.png', '5', '50', '20', 0, '2020-03-08 19:31:21', '2020-04-07 23:38:41', 'raiz-hamburgueria-n4ypLJ0iN3DjaJz', '/assets/img/restaurants/small/1584388499yCXosJ7v1G-sm.png', '-15.90280234', '-52.24446416', 'Liberado', NULL, '5.00', 'Avenida Duque de Caxias', '76240000', 'Em frente ao ginásio de esportes', '1583695881D5RcFdYCa9', 1, 1, 0, '8.00', 3, '10.00', 'DYNAMIC', '4.00', 2, '6.00', 10),
(4, 'NU DOG HOTDOGEERIA', 'Ter a Dom, 19 as 00:00', NULL, '/assets/img/restaurants/1584389538BDaoP2DU8R.jpg', '5', '30', '45', 0, '2020-03-08 19:45:29', '2020-03-16 20:24:56', 'nu-dog-hotdogeeria-KuvHpllEviKNHjx', '/assets/img/restaurants/small/1584389538BDaoP2DU8R-sm.jpg', '-15.90607319', '-52.24210918', 'Liberado', NULL, '5.00', 'Avenida duque de caxias', '76240-000', 'Em frente ao mercado pontual', '1583696729Fpcezyq5zM', 1, 1, 0, '0.00', 3, '10.00', 'DYNAMIC', '4.00', 2, '6.00', 10),
(5, 'Doce Mordidas Donuts', 'Pedidos até as 13hrs e entregas a partir das 15:30hrs', NULL, '/assets/img/restaurants/15843819803OpDwed1zy.jpg', '5', '50', '8', 0, '2020-03-16 18:06:21', '2020-03-29 20:35:05', 'doce-mordidas-donuts-6KkUzlpeeR5C5k5', '/assets/img/restaurants/small/15843819803OpDwed1zy-sm.jpg', '-15.900168', '-52.248789', 'Liberado', NULL, '4.00', 'R. Catarina de Abreu Silva - St. Aeroporto, Aragarças - GO', '76240000', NULL, '1584381981Y3CiC4nKce', 0, 1, 0, '8.00', 3, '10.00', 'DYNAMIC', '4.00', 2, '6.00', 10),
(6, 'Madeiras Espetinhos', 'Seg a Sex, 19 as 00hrs. Sáb, 11 as 18hrs (Feijoada)', NULL, '/assets/img/restaurants/158438766416dyr0mqbQ.jpg', '5', '50', '12', 0, '2020-03-16 19:41:04', '2020-04-07 23:38:52', 'madeiras-espetinhos-eyYVkdZtsY7aPWw', '/assets/img/restaurants/small/158438766416dyr0mqbQ-sm.jpg', '-15.90543347', '-52.23605812', 'Liberado', NULL, '5.00', 'Av Antônio Carlos Paneago nero 3151 Aragarças-GO setor nova esperança', '76240000', NULL, '1584387664tAqu0f1zHF', 1, 1, 0, '8.00', 3, '10.00', 'DYNAMIC', '5.00', 2, '7.00', NULL),
(7, 'Brigadeiritos', 'Qua a Sex, 15 as 20hrs.', NULL, '/assets/img/restaurants/1584454334tmONvmzgfF.jpg', NULL, '50', '18', 0, '2020-03-17 14:12:14', '2020-04-07 23:39:05', 'brigadeiritos-QrTiiAWiAIVQKU5', '/assets/img/restaurants/small/1584454334tmONvmzgfF-sm.jpg', '-15.892941', '-52.266667', 'Liberado', NULL, NULL, 'Rua Carlos Gomes n100 Campinas', '78600000', NULL, '1584454334SYuODoEgjp', 1, 1, 0, '0.00', 1, '10.00', 'FIXED', NULL, NULL, NULL, NULL),
(8, 'Pizzaria Alemoa', 'Qui a Ter, 19 as 00:00', NULL, '/assets/img/restaurants/1584455981sPv5COFUdQ.jpg', '5', '50', '42', 1, '2020-03-17 14:39:41', '2020-04-07 23:38:33', 'pizzaria-alemoa-NGrCgYtMCo4gVe8', '/assets/img/restaurants/small/1584455981sPv5COFUdQ-sm.jpg', '-15.8864473', '-52.24782497', 'Liberado', NULL, NULL, 'Av. Atílio Fontana - Jardim Mariano, Barra do Garças - MT', '78600-000', 'Em frente ao super mendonça', '1584455981V75ndKOXBS', 1, 1, 0, '8.00', 3, '10.00', 'DYNAMIC', '5.00', 2, '7.00', 10),
(9, 'Animais & Cia', 'Seg a Sex 08:00 as 18:30', NULL, '/assets/img/restaurants/1584564281OeiktFEO5j.png', '5', '60', '0', 0, '2020-03-18 20:44:42', '2020-03-29 20:34:49', 'animais-cia-pet-shop-RgAKomYkuAtQhmX', '/assets/img/restaurants/small/1584564281OeiktFEO5j-sm.png', '-15.88847498', '-52.26542562', 'Liberado', NULL, NULL, 'Rua Mato Grosso 1159', '78603-232', 'MT', '1584564282DIhRHpIbX5', 0, 1, 0, '8.00', 3, '10.00', 'FIXED', NULL, NULL, NULL, NULL),
(10, 'Ateliê Nanda Araújo', 'Ter a Sex, 13:30 as 19:30hrs.', NULL, '/assets/img/restaurants/1584642279wqpDpJWAY7.jpg', '5', '50', '10', 0, '2020-03-19 18:24:39', '2020-04-07 23:39:00', 'atelie-nanda-araujo-PhHdgy0lWpfReL4', '/assets/img/restaurants/small/1584642279wqpDpJWAY7-sm.jpg', '-15.905701', '-52.232111', 'Liberado', NULL, NULL, 'Rua GREGÓRIO f da Silva vila união n° 3049', '76240000', NULL, '1584642279Zlz3uiRjlm', 1, 1, 0, '8.00', 1, '10.00', 'DYNAMIC', '5.00', 2, '7.00', 10),
(11, 'Multi Pharma', 'Seg a Sex 08:00 as 18:40', NULL, '/assets/img/restaurants/1584984516fQrJxn4hzJ.jpg', '5', '60', '0', 0, '2020-03-23 17:28:36', '2020-04-07 23:42:56', 'multi-pharma-PG1S63I6v1Oi3Sq', '/assets/img/restaurants/small/1584984516fQrJxn4hzJ-sm.jpg', '-15.9061351', '-52.24205554', 'Liberado', NULL, NULL, 'Av, Duque de caxias, n1659, setor nova esperança, aragarças - go', '7624000', 'em frente ao pontual', '15849845161J5Lm8toz3', 1, 1, 1, '8.00', 3, '10.00', 'DYNAMIC', '5.00', 3, '7.00', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_categories`
--

CREATE TABLE `restaurant_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `restaurant_categories`
--

INSERT INTO `restaurant_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Supermercado', 1, '2020-03-06 17:37:52', '2020-03-18 13:51:05'),
(2, 'Farmácia', 1, '2020-03-06 17:38:03', '2020-03-18 13:51:06'),
(3, 'Restaurante', 1, '2020-03-06 17:38:15', '2020-03-18 13:51:07'),
(4, 'Pizzaria', 1, '2020-03-06 17:38:24', '2020-03-18 13:51:07'),
(5, 'Lanches', 1, '2020-03-06 17:38:35', '2020-03-18 13:51:09'),
(6, 'Massas', 1, '2020-03-06 17:38:55', '2020-03-18 13:51:10'),
(7, 'Sobremesa', 1, '2020-03-06 18:23:18', '2020-03-07 16:55:27'),
(8, 'Açai', 1, '2020-03-06 18:24:50', '2020-03-18 13:51:11'),
(9, 'Bebidas', 1, '2020-03-07 16:56:01', '2020-03-18 13:51:16'),
(10, 'Japonesa', 1, '2020-03-07 16:56:19', '2020-03-18 13:51:01'),
(11, 'Churrasco', 1, '2020-03-07 16:56:48', '2020-03-18 13:51:17'),
(12, 'Lojas', 1, '2020-03-07 16:56:59', '2020-03-18 13:51:19'),
(13, 'Sex Shop', 1, '2020-03-07 16:57:24', '2020-03-07 16:57:24'),
(14, 'Expresso', 1, '2020-03-07 16:57:42', '2020-03-07 16:57:42'),
(15, 'Pets', 1, '2020-03-07 17:10:43', '2020-03-07 17:10:43'),
(16, 'Multicoisas‎', 1, '2020-03-07 17:11:46', '2020-03-07 17:11:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_category_restaurant`
--

CREATE TABLE `restaurant_category_restaurant` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_category_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `restaurant_category_restaurant`
--

INSERT INTO `restaurant_category_restaurant` (`id`, `restaurant_category_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 4, 1, NULL, NULL),
(6, 2, 2, NULL, NULL),
(7, 3, 3, NULL, NULL),
(8, 3, 4, NULL, NULL),
(9, 7, 5, NULL, NULL),
(10, 2, 6, NULL, NULL),
(11, 4, 6, NULL, NULL),
(12, 1, 8, NULL, NULL),
(13, 3, 8, NULL, NULL),
(14, 9, 1, NULL, NULL),
(15, 15, 9, NULL, NULL),
(16, 7, 10, NULL, NULL),
(17, 2, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_category_sliders`
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
-- Fazendo dump de dados para tabela `restaurant_category_sliders`
--

INSERT INTO `restaurant_category_sliders` (`id`, `name`, `image`, `image_placeholder`, `categories_ids`, `is_active`, `created_at`, `updated_at`) VALUES
(8, 'Pizzaria', '/assets/img/slider/1583600289ADbaP4raru.jpg', '/assets/img/slider/small/1583600289ADbaP4raru-sm.jpg', '[\"1\"]', 1, '2020-03-07 16:58:09', '2020-03-07 16:58:09'),
(9, 'Restaurante', '/assets/img/slider/1583600329VOdLxu1HF1.jpg', '/assets/img/slider/small/1583600329VOdLxu1HF1-sm.jpg', '[\"2\"]', 1, '2020-03-07 16:58:49', '2020-03-07 16:58:49'),
(10, 'Lanches', '/assets/img/slider/15836003877aYWWnC1ny.jpg', '/assets/img/slider/small/15836003877aYWWnC1ny-sm.jpg', '[\"3\"]', 1, '2020-03-07 16:59:47', '2020-03-07 16:59:47'),
(11, 'Churrasco', '/assets/img/slider/1583600416YVKwbIvPpx.jpg', '/assets/img/slider/small/1583600416YVKwbIvPpx-sm.jpg', '[\"4\"]', 1, '2020-03-07 17:00:16', '2020-03-07 17:00:16'),
(12, 'Japonesa', '/assets/img/slider/1583600437yOqaOQIIvV.jpg', '/assets/img/slider/small/1583600437yOqaOQIIvV-sm.jpg', '[\"5\"]', 1, '2020-03-07 17:00:37', '2020-03-07 17:00:37'),
(13, 'Massas', '/assets/img/slider/1583600458sXsX3ucgfq.jpg', '/assets/img/slider/small/1583600458sXsX3ucgfq-sm.jpg', '[\"6\"]', 1, '2020-03-07 17:00:58', '2020-03-07 17:00:58'),
(14, 'Sobremesa', '/assets/img/slider/1583600595oMqFt1K2mA.jpg', '/assets/img/slider/small/1583600595oMqFt1K2mA-sm.jpg', '[\"7\"]', 1, '2020-03-07 17:03:15', '2020-03-07 17:03:15'),
(15, 'Açai', '/assets/img/slider/1583600621meeHzkXJU0.jpg', '/assets/img/slider/small/1583600621meeHzkXJU0-sm.jpg', '[\"8\"]', 1, '2020-03-07 17:03:41', '2020-03-07 17:03:41'),
(16, 'Bebidas', '/assets/img/slider/1583600645MVFobzwt6L.png', '/assets/img/slider/small/1583600645MVFobzwt6L-sm.png', '[\"9\"]', 1, '2020-03-07 17:04:05', '2020-03-07 17:04:05'),
(17, 'Farmacia', '/assets/img/slider/1583600667HzoSh34a9C.png', '/assets/img/slider/small/1583600667HzoSh34a9C-sm.png', '[\"10\"]', 1, '2020-03-07 17:04:27', '2020-03-07 17:04:27'),
(18, 'Supermercado', '/assets/img/slider/1583600690e3hFx7DFXa.png', '/assets/img/slider/small/1583600690e3hFx7DFXa-sm.png', '[\"11\"]', 1, '2020-03-07 17:04:50', '2020-03-07 17:04:50'),
(19, 'Lojas', '/assets/img/slider/1583600711PhplDaMOMk.png', '/assets/img/slider/small/1583600711PhplDaMOMk-sm.png', '[\"12\"]', 1, '2020-03-07 17:05:11', '2020-03-07 17:05:11'),
(20, 'Sex Shop', '/assets/img/slider/1583600733dcTgytNMwM.png', '/assets/img/slider/small/1583600733dcTgytNMwM-sm.png', '[\"13\"]', 1, '2020-03-07 17:05:34', '2020-03-07 17:05:34'),
(21, 'Express', '/assets/img/slider/1583600763dIYKnM5Rrf.png', '/assets/img/slider/small/1583600763dIYKnM5Rrf-sm.png', '[\"14\"]', 1, '2020-03-07 17:06:03', '2020-03-07 17:06:03'),
(22, 'Pets', '/assets/img/slider/1583601063uEktCu7E0Q.png', '/assets/img/slider/small/1583601063uEktCu7E0Q-sm.png', '[\"15\"]', 1, '2020-03-07 17:11:03', '2020-03-07 17:11:03'),
(23, 'Multicoisas‎', '/assets/img/slider/1583601122s0y20YTFKU.png', '/assets/img/slider/small/1583601122s0y20YTFKU-sm.png', '[\"16\"]', 1, '2020-03-07 17:12:02', '2020-03-07 17:12:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_earnings`
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

--
-- Fazendo dump de dados para tabela `restaurant_earnings`
--

INSERT INTO `restaurant_earnings` (`id`, `restaurant_id`, `user_id`, `amount`, `is_requested`, `is_processed`, `created_at`, `updated_at`, `restaurant_payout_id`) VALUES
(1, 1, NULL, '50.00', 1, 0, '2020-03-06 19:37:18', '2020-04-13 19:18:10', 1),
(2, 4, NULL, '25.00', 0, 0, '2020-03-08 20:24:11', '2020-04-11 20:44:48', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_payouts`
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

--
-- Fazendo dump de dados para tabela `restaurant_payouts`
--

INSERT INTO `restaurant_payouts` (`id`, `restaurant_id`, `restaurant_earning_id`, `amount`, `status`, `transaction_mode`, `transaction_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '47.50', 'COMPLETED', NULL, NULL, NULL, '2020-04-13 19:18:10', '2020-04-13 19:18:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurant_user`
--

CREATE TABLE `restaurant_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `restaurant_user`
--

INSERT INTO `restaurant_user` (`id`, `user_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 21, 1, NULL, NULL),
(2, 21, 2, NULL, NULL),
(3, 24, 3, NULL, NULL),
(4, 25, 4, NULL, NULL),
(5, 27, 1, NULL, NULL),
(6, 27, 2, NULL, NULL),
(7, 27, 3, NULL, NULL),
(8, 27, 4, NULL, NULL),
(9, 41, 5, NULL, NULL),
(10, 42, 1, NULL, NULL),
(11, 42, 2, NULL, NULL),
(12, 42, 3, NULL, NULL),
(13, 42, 4, NULL, NULL),
(14, 42, 5, NULL, NULL),
(15, 43, 6, NULL, NULL),
(16, 45, 7, NULL, NULL),
(17, 46, 8, NULL, NULL),
(18, 33, 1, NULL, NULL),
(19, 33, 2, NULL, NULL),
(20, 33, 3, NULL, NULL),
(21, 33, 4, NULL, NULL),
(22, 33, 5, NULL, NULL),
(23, 33, 6, NULL, NULL),
(24, 33, 7, NULL, NULL),
(25, 33, 8, NULL, NULL),
(26, 52, 9, NULL, NULL),
(27, 61, 10, NULL, NULL),
(28, 50, 3, NULL, NULL),
(29, 50, 4, NULL, NULL),
(30, 50, 5, NULL, NULL),
(31, 50, 6, NULL, NULL),
(32, 50, 7, NULL, NULL),
(33, 50, 8, NULL, NULL),
(34, 50, 9, NULL, NULL),
(35, 50, 10, NULL, NULL),
(36, 60, 3, NULL, NULL),
(37, 60, 4, NULL, NULL),
(38, 60, 5, NULL, NULL),
(39, 60, 6, NULL, NULL),
(40, 60, 7, NULL, NULL),
(41, 60, 8, NULL, NULL),
(42, 60, 9, NULL, NULL),
(43, 59, 3, NULL, NULL),
(44, 59, 4, NULL, NULL),
(45, 59, 5, NULL, NULL),
(46, 59, 6, NULL, NULL),
(47, 59, 7, NULL, NULL),
(48, 59, 8, NULL, NULL),
(49, 59, 9, NULL, NULL),
(50, 58, 3, NULL, NULL),
(51, 58, 4, NULL, NULL),
(52, 58, 5, NULL, NULL),
(53, 58, 6, NULL, NULL),
(54, 58, 7, NULL, NULL),
(55, 58, 8, NULL, NULL),
(56, 58, 9, NULL, NULL),
(57, 30, 3, NULL, NULL),
(58, 30, 4, NULL, NULL),
(59, 30, 5, NULL, NULL),
(60, 30, 6, NULL, NULL),
(61, 30, 7, NULL, NULL),
(62, 30, 8, NULL, NULL),
(63, 30, 9, NULL, NULL),
(64, 30, 10, NULL, NULL),
(65, 31, 2, NULL, NULL),
(66, 31, 3, NULL, NULL),
(67, 31, 4, NULL, NULL),
(68, 31, 5, NULL, NULL),
(69, 31, 6, NULL, NULL),
(70, 31, 7, NULL, NULL),
(71, 31, 8, NULL, NULL),
(72, 31, 9, NULL, NULL),
(73, 31, 10, NULL, NULL),
(74, 32, 3, NULL, NULL),
(75, 32, 4, NULL, NULL),
(76, 32, 5, NULL, NULL),
(77, 32, 6, NULL, NULL),
(78, 32, 7, NULL, NULL),
(79, 32, 8, NULL, NULL),
(80, 32, 9, NULL, NULL),
(81, 32, 10, NULL, NULL),
(82, 34, 3, NULL, NULL),
(83, 34, 4, NULL, NULL),
(84, 34, 5, NULL, NULL),
(85, 34, 6, NULL, NULL),
(86, 34, 7, NULL, NULL),
(87, 34, 8, NULL, NULL),
(88, 34, 9, NULL, NULL),
(89, 34, 10, NULL, NULL),
(90, 36, 3, NULL, NULL),
(91, 36, 4, NULL, NULL),
(92, 36, 5, NULL, NULL),
(93, 36, 6, NULL, NULL),
(94, 36, 7, NULL, NULL),
(95, 36, 8, NULL, NULL),
(96, 36, 9, NULL, NULL),
(97, 36, 10, NULL, NULL),
(98, 37, 3, NULL, NULL),
(99, 37, 4, NULL, NULL),
(100, 37, 5, NULL, NULL),
(101, 37, 6, NULL, NULL),
(102, 37, 7, NULL, NULL),
(103, 37, 8, NULL, NULL),
(104, 37, 9, NULL, NULL),
(105, 37, 10, NULL, NULL),
(106, 38, 3, NULL, NULL),
(107, 38, 4, NULL, NULL),
(108, 38, 5, NULL, NULL),
(109, 38, 6, NULL, NULL),
(110, 38, 7, NULL, NULL),
(111, 38, 8, NULL, NULL),
(112, 38, 9, NULL, NULL),
(113, 38, 10, NULL, NULL),
(114, 39, 3, NULL, NULL),
(115, 39, 4, NULL, NULL),
(116, 39, 5, NULL, NULL),
(117, 39, 6, NULL, NULL),
(118, 39, 7, NULL, NULL),
(119, 39, 8, NULL, NULL),
(120, 39, 9, NULL, NULL),
(121, 39, 10, NULL, NULL),
(122, 51, 3, NULL, NULL),
(123, 51, 4, NULL, NULL),
(124, 51, 5, NULL, NULL),
(125, 51, 6, NULL, NULL),
(126, 51, 7, NULL, NULL),
(127, 51, 8, NULL, NULL),
(128, 51, 9, NULL, NULL),
(129, 51, 10, NULL, NULL),
(130, 57, 11, NULL, NULL),
(131, 35, 1, NULL, NULL),
(132, 35, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(2, 'Delivery Guy', 'web', '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(3, 'Restaurant Owner', 'web', '2020-01-03 11:49:33', '2020-01-03 11:49:33'),
(4, 'Customer', 'web', '2020-01-03 11:49:33', '2020-01-03 11:49:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'storeColor', 'rgb(124, 36, 61)'),
(2, 'splashLogo', 'splash.jpg?v=1585336323jqTax'),
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
(20, 'currencyFormat', 'R$'),
(21, 'currencyId', 'BRL'),
(22, 'cartColorBg', '#60b246'),
(23, 'cartColorText', '#ffffff'),
(24, 'cartEmptyText', 'Your Cart is Empty'),
(25, 'firstScreenHeroImage', 'assets/img/various/158533616213Wt9O74Ct.png?v=1585336162LiYrr'),
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
(39, 'editAddressAddress', 'Address'),
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
(66, 'storeName', 'inCasa Delivery'),
(67, 'storeLogo', 'logo.png?v=1585341431RediU'),
(68, 'runningOrderDeliveryAssignedTitle', 'Delivery Guy Assigned'),
(69, 'runningOrderDeliveryAssignedSub', 'On the way to pick up your order.'),
(70, 'runningOrderCanceledTitle', 'Order Canceled'),
(71, 'runningOrderCanceledSub', 'Sorry. Your order has been canceled.'),
(72, 'stripePublicKey', 'pk_test_JUzm2mU0IOZjfNznpXzrdfgO004pv3wNA0'),
(73, 'stripeSecretKey', 'sk_test_8RNV1H9HqUEOOR8D5pUzTqRI00DwTsXTYo'),
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
(109, 'favicon-16x16', 'favicon-16x16.png?v=1585344284fmiRc'),
(110, 'favicon-32x32', 'favicon-32x32.png?v=158534428434UpI'),
(111, 'favicon-96x96', 'favicon-96x96.png?v=1585344285Cb6Tt'),
(112, 'favicon-128x128', 'favicon-128x128.png?v=1585344285aHAk5'),
(113, 'storeEmail', 'foodomaa@demo.com'),
(114, 'seoMetaTitle', 'inCasa Delivery'),
(115, 'seoMetaDescription', 'O jeito mais fácil de pedir Delivery de comida, mercado, farmácias e muito mais. Leia avaliações e peça online na maior lista de produtos da sua cidade. Faça seu pedido pela internet e receba em casa.'),
(116, 'storeUrl', 'https://incasadelivery.com/'),
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
(145, 'firstScreenHeroImageSm', 'assets/img/various/158533616213Wt9O74Ct-sm.png?v=1585336162ozGfT'),
(146, 'showMap', 'true'),
(147, 'paypalEnv', 'sandbox'),
(148, 'paypalSandboxKey', NULL),
(149, 'paypalProductionKey', NULL),
(150, 'enablePushNotification', 'true'),
(151, 'enablePushNotificationOrders', 'true'),
(152, 'firebaseSenderId', '458274085134'),
(153, 'firebaseSecret', 'AAAAarNDmQ4:APA91bGrP4_ouKUDEwXOkWtAE1zAw2GgyW3CGb3phjpnLBGHGw7cvr7xFiDD0Icasgje6fmHmRxumAZef6wQR5nT1gnGItlVkKYz2Cl9xl4E3d3GAcVDyHAM8l1WfME2qJ5OfPVdiy1K'),
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
(179, 'taxPercentage', '5'),
(180, 'firebasePublic', 'BBVsZMOi7NpDyc31hR2Z6-EXWHSeb5lgPX15QiwMrFVSWI1ls7f6QMF6RWnzygcqUpoAV50I_0RBbJ8ejroryJY'),
(181, 'deliveryLogoutConfirmation', 'Are you sure?'),
(182, 'customizationHeading', 'Customizations'),
(183, 'customizableItemText', 'Customizable'),
(184, 'customizationDoneBtnText', 'Continue'),
(185, 'paystackPublicKey', 'pk_test_ecf3496bdf36bced2112a502f5f5bb96e1340124'),
(186, 'paystackPrivateKey', NULL),
(187, 'paystackPayText', 'PAY WITH PAYSLACK'),
(188, 'minPayout', '10'),
(189, 'enableFacebookLogin', 'false'),
(190, 'facebookAppId', '656689501765658'),
(191, 'facebookLoginButtonText', 'Entrar com Facebook'),
(192, 'enableGoogleLogin', 'false'),
(193, 'googleAppId', NULL),
(194, 'googleLoginButtonText', 'Login with Google'),
(195, 'customCSS', NULL),
(196, 'enSOV', 'false'),
(197, 'twilioSid', NULL),
(198, 'twilioAccessToken', NULL),
(199, 'twilioServiceId', NULL),
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
(230, 'enableDeliveryPin', 'false'),
(231, 'deliveryOrdersRefreshBtn', 'Refresh'),
(232, 'restaurantAcceptTimeThreshold', '2'),
(233, 'deliveryAcceptTimeThreshold', '2'),
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
(249, 'walletName', 'Carteira'),
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
(261, 'enDevMode', 'false'),
(262, 'walletRedeemBtnText', 'Redeem'),
(263, 'restaurantNewOrderNotificationMsg', 'A New Order has Arrived !!!'),
(264, 'restaurantNewOrderNotificationMsgSub', 'New Order Notification'),
(265, 'deliveryGuyNewOrderNotificationMsg', 'A New Order is Waiting !!!'),
(266, 'deliveryGuyNewOrderNotificationMsgSub', 'New Order Notification'),
(267, 'firebaseSDKSnippet', 'const firebaseConfig = {\r\n  apiKey: \"AIzaSyCa5FqLBRS_GMh8PDk7MkDGZmsFJzKsXuc\",\r\n  authDomain: \"hungerdelivery-529ee.firebaseapp.com\",\r\n  databaseURL: \"https://hungerdelivery-529ee.firebaseio.com\",\r\n  projectId: \"hungerdelivery-529ee\",\r\n  storageBucket: \"hungerdelivery-529ee.appspot.com\",\r\n  messagingSenderId: \"458274085134\",\r\n  appId: \"1:458274085134:web:1e82f240ec06e894a49f5f\",\r\n  measurementId: \"G-8H5N6DPDDZ\"\r\n};'),
(268, 'cartCouponOffText', 'OFF'),
(269, 'willBeRefundedText', 'will be refunded back to your wallet.'),
(270, 'willNotBeRefundedText', 'No Refund will be made to your wallet as the restaurant has already prepared the order.'),
(271, 'cartRestaurantNotOperational', 'Restaurant is not operational on your selected location.'),
(272, 'addressDoesnotDeliverToText', 'Does not deliver to'),
(273, 'googleApiKey', 'AIzaSyB3in6Gg4aOpfUHHZTN8J8lrn-AjcGT4Mo'),
(274, 'useCurrentLocationText', 'Use Current Location'),
(275, 'gpsAccessNotGrantedMsg', 'GPS access is not granted or was denied.'),
(276, 'yourLocationText', 'YOUR LOCATION'),
(277, 'notAcceptingOrdersMsg', 'Currently Not Accepting Any Orders'),
(278, 'exploreRestautantsText', 'RESTAURANTS'),
(279, 'exploreItemsText', 'ITEMS'),
(280, 'hidePriceWhenZero', 'true'),
(281, 'phoneCountryCode', '+55'),
(282, 'orderCancellationConfirmationText', 'Do you want to cancel this order?'),
(283, 'yesCancelOrderBtn', 'Yes, Cancel Order'),
(284, 'cancelGoBackBtn', 'Go back'),
(285, 'cancelOrderMainButton', 'Cancel Order'),
(286, 'deliveryOrderPlacedText', 'Order Placed'),
(287, 'deliveryCashOnDelivery', 'Cash On Delivery'),
(288, 'socialLoginOrText', 'OR'),
(289, 'orderCancelledText', 'Order Cancelled'),
(290, 'searchAtleastThreeCharsMsg', 'Enter at least 3 characters to search.'),
(291, 'multiLanguageSelection', 'false'),
(292, 'changeLanguageText', 'Change Language'),
(293, 'deliveryFooterNewTitle', 'New Orders'),
(294, 'deliveryFooterAcceptedTitle', 'Accepted'),
(295, 'deliveryFooterAccount', 'Account'),
(296, 'enableDeliveryGuyEarning', 'true'),
(297, 'deliveryGuyCommissionFrom', 'DELIVERYCHARGE'),
(298, 'deliveryEarningsText', 'Earnings'),
(299, 'deliveryOnGoingText', 'On-Going'),
(300, 'deliveryCompletedText', 'Completed'),
(301, 'deliveryCommissionMessage', 'Commission for order: '),
(302, 'itemSearchText', 'Search results for: '),
(303, 'itemSearchNoResultText', 'No results found for: '),
(304, 'itemSearchPlaceholder', 'Search for items...'),
(305, 'googleApiKeyIP', 'AIzaSyDCyZrSfpd8CNIJLtOVOc8i0f3gFVVrRMM'),
(306, 'itemsMenuButtonText', 'MENU'),
(307, 'enPassResetEmail', 'true'),
(308, 'mail_host', 'br80.hostgator.com.br'),
(309, 'mail_port', '465'),
(310, 'mail_username', 'noreply@incasadelivery.com'),
(311, 'mail_password', 'QWcqbNw$*uSZ'),
(312, 'mail_encryption', 'SSL'),
(313, 'enRestaurantCategorySlider', 'true'),
(314, 'restaurantCategorySliderPosition', '1'),
(315, 'restaurantCategorySliderSize', '2'),
(316, 'showRestaurantCategorySliderLabel', 'true'),
(317, 'restaurantCategorySliderStyle', '1'),
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
(353, 'sendEmailFromEmailAddress', 'noreply@incasadelivery.com'),
(354, 'sendEmailFromEmailName', 'inCasa Delivery'),
(355, 'passwordResetEmailSubject', 'Alterar Senha');

-- --------------------------------------------------------

--
-- Estrutura para tabela `slides`
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
-- Fazendo dump de dados para tabela `slides`
--

INSERT INTO `slides` (`id`, `promo_slider_id`, `unique_id`, `name`, `image`, `image_placeholder`, `url`, `is_active`, `created_at`, `updated_at`) VALUES
(14, 3, NULL, 'instagran', '/assets/img/slider/15853370284o1hdnEkdY.jpg', '/assets/img/slider/small/15853370284o1hdnEkdY-sm.jpg', 'https://www.instagram.com/incasa.delivery', 1, '2020-03-27 19:23:48', '2020-03-27 19:23:48'),
(15, 3, NULL, 'facebook', '/assets/img/slider/1585337051ku3EtgCubf.jpg', '/assets/img/slider/small/1585337051ku3EtgCubf-sm.jpg', 'https://www.facebook.com/inCasaEntregas', 1, '2020-03-27 19:24:11', '2020-03-27 19:24:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `transactions`
--

INSERT INTO `transactions` (`id`, `payable_type`, `payable_id`, `wallet_id`, `type`, `amount`, `confirmed`, `meta`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 27, 8, 'deposit', 17, 1, '{\"description\":\"Commission for order: OD-03-08-ZR2DK1\"}', '09ef78d7-87b7-499f-8d51-a76c940e8e5c', '2020-03-08 20:24:11', '2020-03-08 20:24:11'),
(2, 'App\\User', 33, 14, 'deposit', 500, 1, '{\"description\":\"Commission for order: OD-03-17-1LZVLZ\"}', '87d00fdb-9eeb-40a5-b319-c02daf3dcdf4', '2020-03-17 21:07:50', '2020-03-17 21:07:50'),
(3, 'App\\User', 35, 16, 'deposit', 400, 1, '{\"description\":\"Commission for order: OD-04-11-JLOE3A\"}', '15bfce5e-7532-4006-b477-be92233f0ae9', '2020-04-11 20:44:48', '2020-04-11 20:44:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transfers`
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
-- Estrutura para tabela `translations`
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
-- Fazendo dump de dados para tabela `translations`
--

INSERT INTO `translations` (`id`, `language_name`, `data`, `created_at`, `updated_at`, `is_default`, `is_active`) VALUES
(1, 'English', '{\"desktopHeading\":\"Pe\\u00e7a em estabelecimentos perto de voc\\u00ea!\",\"desktopSubHeading\":\"<h3 class=\\\"desktop-subtitle\\\" style=\\\"margin-bottom: 20px; font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 1.2; color: rgb(66, 66, 66); font-size: 1.3rem; letter-spacing: normal;\\\">As coisas que voc\\u00ea ama, na palma da sua m\\u00e3o. Pesquise e encontre entre centenas de estabelecimentos os melhores pre\\u00e7o e qualidade no seu pedido!<\\/h3>\",\"desktopUseAppButton\":\"Use o App Agora\",\"desktopAchievementOneTitle\":\"Estabelecimentos\",\"desktopAchievementOneSub\":\"2300+\",\"desktopAchievementTwoTitle\":\"Produtos\",\"desktopAchievementTwoSub\":\"65000+\",\"desktopAchievementThreeTitle\":\"Clientes\",\"desktopAchievementThreeSub\":\"1M+\",\"desktopAchievementFourTitle\":\"Entregadores\",\"desktopAchievementFourSub\":\"5M+\",\"desktopFooterAddress\":\"<font face=\\\"Roboto\\\"><span style=\\\"font-size: 15px; white-space: pre-wrap;\\\"><b>#2020 inCasa Delivery<\\/b><\\/span><\\/font>\",\"desktopFooterSocialHeader\":\"Redes Sociais\",\"desktopSocialFacebookLink\":\"https:\\/\\/www.facebook.com\\/inCasaEntregas\",\"desktopSocialGoogleLink\":null,\"desktopSocialYoutubeLink\":null,\"desktopSocialInstagramLink\":\"https:\\/\\/www.instagram.com\\/incasa.delivery\\/\",\"gdprMessage\":\"<p><span style=\\\"color: rgb(74, 74, 74); font-family: &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Lucida Grande&quot;, Arial, Ubuntu, Cantarell, &quot;Fira Sans&quot;, sans-serif; font-size: 15px; white-space: pre-wrap;\\\">Utilizamos cookies para oferecer o melhor servi\\u00e7o poss\\u00edvel. Ao continuar navegando em nosso site, voc\\u00ea concorda com o uso de cookies.<\\/span><br><\\/p>\",\"gdprConfirmButton\":\"Okay\",\"changeLanguageText\":\"Trocar idioma\",\"firstScreenHeading\":\"Pe\\u00e7a agora mesmo nos melhores estabelecimentos.\",\"firstScreenSubHeading\":\"Pronto para escolher e pedir?\",\"firstScreenSetupLocation\":\"escolha seu local\",\"firstScreenWelcomeMessage\":\"Bem Vindo,\",\"firstScreenLoginText\":\"Ja tem uma conta?\",\"firstScreenLoginBtn\":\"Entre\",\"loginErrorMessage\":\"Woopss !! Algo deu errado. Por favor, tente novamente.\",\"pleaseWaitText\":\"Por favor, espere...\",\"loginLoginTitle\":\"ENTRAR\",\"loginLoginSubTitle\":\"Coloque seu email e senha\",\"loginLoginEmailLabel\":\"Email\",\"loginLoginPasswordLabel\":\"Senha\",\"loginDontHaveAccount\":\"N\\u00e3o tem uma conta ainda?\",\"firstScreenRegisterBtn\":\"Registre-se\",\"registerRegisterTitle\":\"Cadastrar\",\"registerRegisterSubTitle\":\"Registre agora gratuitamente\",\"loginLoginNameLabel\":\"Nome\",\"loginLoginPhoneLabel\":\"Telefone\",\"regsiterAlreadyHaveAccount\":\"j\\u00e1 tem uma conta?\",\"fieldValidationMsg\":\"Este \\u00e9 um campo obrigat\\u00f3rio.\",\"nameValidationMsg\":\"Por favor digite seu nome completo.\",\"emailValidationMsg\":\"Por favor digite um email v\\u00e1lido.\",\"phoneValidationMsg\":\"Digite um n\\u00famero de telefone neste formato: +55123456789\",\"minimumLengthValidationMessage\":\"Este campo deve ter pelo menos 8 caracteres.\",\"emailPhoneAlreadyRegistered\":\"O email ou telefone j\\u00e1 foi registrado.\",\"emailPassDonotMatch\":\"E-mail e senha n\\u00e3o coincidem.\",\"enterPhoneToVerify\":\"Digite seu n\\u00famero de telefone para verificar\",\"invalidOtpMsg\":\"COD inv\\u00e1lido. Por favor verifique e tente novamente.\",\"otpSentMsg\":\"Um COD foi enviado para\",\"resendOtpMsg\":\"Reenviar COD para\",\"resendOtpCountdownMsg\":\"Reenviar COD em\",\"verifyOtpBtnText\":\"Verificar COD\",\"socialWelcomeText\":\"Oi\",\"socialLoginOrText\":\"OU\",\"forgotPasswordLinkText\":\"Esqueceu a Senha?\",\"resetPasswordPageTitle\":\"Redefinir senha\",\"resetPasswordPageSubTitle\":\"Digite seu e-mail para continuar\",\"userNotFoundErrorMessage\":\"Usu\\u00e1rio n\\u00e3o encontrado com este email.\",\"invalidOtpErrorMessage\":\"Codigo Invalido\",\"sendOtpOnEmailButtonText\":\"Enviar COD por email\",\"alreadyHaveResetOtpButtonText\":\"Eu j\\u00e1 tenho um COD\",\"dontHaveResetOtpButtonText\":\"Eu n\\u00e3o tenho um COD\",\"enterResetOtpMessageText\":\"Digite o COD enviado em seu email\",\"verifyResetOtpButtonText\":\"Verificar COD\",\"enterNewPasswordText\":\"Digite uma nova senha abaixo\",\"newPasswordLabelText\":\"Nova Senha\",\"setNewPasswordButtonText\":\"Definir Nova Senha\",\"deliveryTypeDelivery\":\"Entrega\",\"deliveryTypeSelfPickup\":\"Local ou Retirar\",\"noRestaurantMessage\":\"Nenhum Disponivel\",\"restaurantCountText\":\"Perto de voc\\u00ea.\",\"restaurantFeaturedText\":\"Destaque\",\"homePageMinsText\":\"MINS\",\"homePageForTwoText\":\"PARA DOIS\",\"footerNearme\":\"Proximo\",\"footerExplore\":\"Explorar\",\"footerCart\":\"Sacola\",\"footerAccount\":\"Conta\",\"exploreNoResults\":\"No Items or Restaurants Found\",\"restaurantSearchPlaceholder\":\"Procurar por estabelecimentos\",\"exploreRestautantsText\":\"ESTABELECIMENTOS\",\"exploreItemsText\":\"ITEMS\",\"searchAtleastThreeCharsMsg\":\"Digite pelo menos 3 caracteres para pesquisar.\",\"exlporeByRestaurantText\":\"By\",\"recommendedBadgeText\":\"Sugerido\",\"popularBadgeText\":\"Popular\",\"newBadgeText\":\"Novo\",\"itemsPageRecommendedText\":\"RECOMENDADO\",\"floatCartViewCartText\":\"Ver Sacola\",\"floatCartItemsText\":\"Items\",\"customizableItemText\":\"Adcionais\",\"customizationHeading\":\"Adicione em seu Pedido\",\"customizationDoneBtnText\":\"Continuar\",\"pureVegText\":\"Temos Veg\",\"certificateCodeText\":\"Certificado:\",\"showMoreButtonText\":\"Mostrar\",\"showLessButtonText\":\"Esconder\",\"notAcceptingOrdersMsg\":\"Atualmente n\\u00e3o aceita pedidos\",\"itemSearchPlaceholder\":\"Pesquisar produtos ...\",\"itemSearchText\":\"Resultados da busca por:\",\"itemSearchNoResultText\":\"Nenhum resultado encontrado para:\",\"itemsMenuButtonText\":\"MENU\",\"itemPercentageDiscountText\":\"% OFF\",\"cartPageTitle\":\"Sacola\",\"cartItemsInCartText\":\"Itens na sacola\",\"cartEmptyText\":\"Sua sacola esta vazia\",\"cartSuggestionPlaceholder\":\"Escreva seu coment\\u00e1rio para o estabelecimento ...\",\"cartCouponText\":\"Cupom\",\"cartApplyCoupon\":\"Cupom Aplicado\",\"cartInvalidCoupon\":\"Cupom Invalido\",\"cartCouponOffText\":\"OFF\",\"cartBillDetailsText\":\"Detalhes da Conta\",\"cartItemTotalText\":\"Total de Itens\",\"cartToPayText\":\"Pagar\",\"cartDeliveryCharges\":\"Taxa de Entrega\",\"cartRestaurantCharges\":\"Taxa do Estabelecimento\",\"cartSetYourAddress\":\"Defina Seu Endere\\u00e7o\",\"buttonNewAddress\":\"Novo Endere\\u00e7o\",\"cartChangeLocation\":\"Trocar\",\"cartDeliverTo\":\"Entregar para\",\"checkoutSelectPayment\":\"Fazer o pagamento\",\"cartLoginHeader\":\"Quase L\\u00e1\",\"cartLoginSubHeader\":\"Entre ou cadastre-se para fazer seu pedido\",\"cartLoginButtonText\":\"Continuar\",\"selectedSelfPickupMessage\":\"Voc\\u00ea selecionou Captura autom\\u00e1tica.\",\"taxText\":\"Taxas\",\"itemsRemovedMsg\":\"Os itens adicionados no estabelecimento anterior foram removidos.\",\"ongoingOrderMsg\":\"Voc\\u00ea tem alguns pedidos em andamento. olhar\",\"cartRestaurantNotOperational\":\"O estabelecimento n\\u00e3o est\\u00e1 operacional no local selecionado.\",\"checkoutPageTitle\":\"Finalizar\",\"checkoutPaymentListTitle\":\"Escolher forma de pagamento\",\"checkoutPaymentInProcess\":\"Pagamento em processo. N\\u00e3o aperte atualizar ou voltar.\",\"checkoutStripeText\":\"Stripe\",\"checkoutStripeSubText\":\"Pagamento online\",\"checkoutCodText\":\"DISPONIVEL\",\"checkoutCodSubText\":\"Pagamento na entrega\",\"paystackPayText\":\"Pague com PayStack\",\"checkoutRazorpayText\":\"Razorpay\",\"checkoutRazorpaySubText\":\"Pague com cart\\u00e3o de credito\",\"runningOrderPlacedTitle\":\"Pedido efetuado com sucesso\",\"runningOrderPlacedSub\":\"Aguardando o estabelecimento para confirmar seu pedido\",\"runningOrderPreparingTitle\":\"Chef no trabalho !!\",\"runningOrderPreparingSub\":\"O estabelecimento est\\u00e1 preparando seu pedido\",\"runningOrderOnwayTitle\":\"Vroom Vroom!!\",\"runningOrderOnwaySub\":\"O pedido foi retirado e est\\u00e1 a caminho\",\"runningOrderDeliveryAssignedTitle\":\"Entregador atribu\\u00eddo\",\"runningOrderDeliveryAssignedSub\":\"No caminho para pegar seu pedido.\",\"runningOrderCanceledTitle\":\"Pedido cancelado\",\"runningOrderCanceledSub\":\"Desculpe. Seu pedido foi cancelado.\",\"runningOrderReadyForPickup\":\"Seu pedido est\\u00e1 pronto\",\"runningOrderReadyForPickupSub\":\"Seu pedido est\\u00e1 pronto para a retirada ou consumo.\",\"runningOrderDelivered\":\"Pedido entregue\",\"runningOrderDeliveredSub\":\"O pedido foi entregue a voc\\u00ea. aproveite.\",\"runningOrderRefreshButton\":\"Atualizar status do pedido\",\"deliveryGuyAfterName\":\"\\u00e9 seu entregador hoje.\",\"vehicleText\":\"Ve\\u00edculo:\",\"callNowButton\":\"Ligue agora\",\"allowLocationAccessMessage\":\"Permita o acesso \\u00e0 localiza\\u00e7\\u00e3o para rastreamento ao vivo.\",\"trackOrderText\":\"Acompanhar Pedido\",\"orderPlacedStatusText\":\"Pedido realizado\",\"preparingOrderStatusText\":\"Preparando Pedido\",\"deliveryGuyAssignedStatusText\":\"Entregador atribu\\u00eddo\",\"orderPickedUpStatusText\":\"Pedido recolhido\",\"deliveredStatusText\":\"Entregue\",\"canceledStatusText\":\"Cancelado\",\"readyForPickupStatusText\":\"Pronto para pegar\",\"restaurantNewOrderNotificationMsg\":\"Chegou uma nova entrega !!!\",\"restaurantNewOrderNotificationMsgSub\":\"Notifica\\u00e7\\u00e3o de nova entrega\",\"deliveryGuyNewOrderNotificationMsg\":\"Uma nova entrega est\\u00e1 esperando !!!\",\"deliveryGuyNewOrderNotificationMsgSub\":\"Notifica\\u00e7\\u00e3o de nova entrega\",\"runningOrderDeliveryPin\":\"COD de entrega:\",\"accountMyAccount\":\"Minha Conta\",\"accountManageAddress\":\"Meus Endere\\u00e7os\",\"addressDoesnotDeliverToText\":\"N\\u00e3o Entrega Para\",\"accountMyOrders\":\"Meus Pedidos\",\"accountHelpFaq\":\"Ajuda e FAQs\",\"accountLogout\":\"Sair\",\"accountMyWallet\":\"Carteira\",\"noOrdersText\":\"Voc\\u00ea ainda n\\u00e3o fez nenhum pedido.\",\"orderCancelledText\":\"Pedido cancelado\",\"searchAreaPlaceholder\":\"Pesquise sua cidade ...\",\"searchPopularPlaces\":\"Escolha uma cidade.\",\"useCurrentLocationText\":\"Usar localiza\\u00e7\\u00e3o atual\",\"gpsAccessNotGrantedMsg\":\"O acesso ao GPS foi negado, ative a permiss\\u00e3o .\",\"yourLocationText\":\"SUA LOCALIZA\\u00c7\\u00c3O\",\"editAddressAddress\":\"Endere\\u00e7o\",\"editAddressTag\":\"Tag\",\"addressTagPlaceholder\":\"Por exemplo. Trabalho, casa\",\"buttonSaveAddress\":\"Salvar endere\\u00e7o\",\"deleteAddressText\":\"Excluir\",\"noWalletTransactionsText\":\"Ainda n\\u00e3o h\\u00e1 transa\\u00e7\\u00f5es na carteira !!!\",\"walletDepositText\":\"Dep\\u00f3sito\",\"walletWithdrawText\":\"Retirar\",\"payPartialWithWalletText\":\"Pagar valor parcial com carteira\",\"willbeDeductedText\":\"ser\\u00e1 deduzido do seu saldo de\",\"payFullWithWalletText\":\"Pague o valor total com a Google Wallet.\",\"orderPaymentWalletComment\":\"Pagamento pelo pedido:\",\"orderPartialPaymentWalletComment\":\"Pagamento parcial pelo pedido:\",\"orderRefundWalletComment\":\"Reembolso pelo cancelamento do pedido.\",\"orderPartialRefundWalletComment\":\"Reembolso parcial para cancelamento de pedidos.\",\"walletRedeemBtnText\":\"Resgatar\",\"cancelOrderMainButton\":\"Cancelar pedido\",\"willBeRefundedText\":\"ser\\u00e1 devolvido de volta \\u00e0 sua carteira.\",\"willNotBeRefundedText\":\"Nenhum reembolso ser\\u00e1 feito em sua carteira, pois o estabelecimento j\\u00e1 preparou o pedido.\",\"orderCancellationConfirmationText\":\"Deseja cancelar este pedido?\",\"yesCancelOrderBtn\":\"Sim, cancelar pedido\",\"cancelGoBackBtn\":\"Voltar\",\"deliveryWelcomeMessage\":\"Bem-Vindo\",\"deliveryAcceptedOrdersTitle\":\"Pedidos aceitos\",\"deliveryNoOrdersAccepted\":\"Nenhum pedido aceito ainda\",\"deliveryNewOrdersTitle\":\"Novos Pedidos\",\"deliveryNoNewOrders\":\"Ainda n\\u00e3o h\\u00e1 novos pedidos\",\"deliveryOrderItems\":\"Itens do pedido\",\"deliveryRestaurantAddress\":\"Endere\\u00e7o do Estabelecimento\",\"deliveryDeliveryAddress\":\"Endere\\u00e7o de entrega\",\"deliveryGetDirectionButton\":\"Obter Dire\\u00e7\\u00e3o\",\"deliveryOnlinePayment\":\"Pagamento online\",\"deliveryCashOnDelivery\":\"Pagamento na entrega\",\"deliveryDeliveryPinPlaceholder\":\"INSERIR COD DE ENTREGA\",\"deliveryAcceptOrderButton\":\"Aceitar\",\"deliveryPickedUpButton\":\"Pegou\",\"deliveryDeliveredButton\":\"Entregue\",\"deliveryOrderCompletedButton\":\"Encomenda completa\",\"deliveryAlreadyAccepted\":\"Esta entrega foi aceita por outra pessoa.\",\"deliveryInvalidDeliveryPin\":\"COD de entrega incorreto. Por favor, tente novamente.\",\"deliveryLogoutDelivery\":\"Sair do Delivery\",\"deliveryLogoutConfirmation\":\"Voc\\u00ea tem certeza?\",\"deliveryOrdersRefreshBtn\":\"Atualizar\",\"deliveryOrderPlacedText\":\"Pedido realizado\",\"deliveryFooterNewTitle\":\"Pedidos\",\"deliveryFooterAcceptedTitle\":\"Aceitos\",\"deliveryFooterAccount\":\"Conta\",\"deliveryEarningsText\":\"Ganhos\",\"deliveryOnGoingText\":\"Em Andamento\",\"deliveryCompletedText\":\"Concluido\",\"deliveryCommissionMessage\":\"Comiss\\u00e3o para encomenda:\",\"updatingMessage\":\"Sistema de atualiza\\u00e7\\u00e3o\",\"categoriesFiltersText\":\"Filtros\",\"categoriesNoRestaurantsFoundText\":\"Nenhum restaurante encontrado\"}', '2020-01-03 14:50:02', '2020-03-27 19:21:27', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
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
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `auth_token`, `phone`, `default_address_id`, `delivery_pin`, `delivery_guy_detail_id`) VALUES
(1, 'Romario', 'romario@incasadelivery.com', NULL, '$2y$10$11cbV9z0X.uyw0tqhTesGeZyZbreCiEWONySbHWzRCxfmEaYq2D8e', 'sLStOTw0NxzjDbGz4k98Gv9H0Mqi2Ppkm2wNdjq1O1exJHi3X1duf3NO95bY', '2020-01-03 11:49:33', '2020-03-28 16:06:45', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NwZ2V0ZWEuaW4vcHVibGljL2FwaS9sb2dpbiIsImlhdCI6MTU4MzA4MzQ4MiwibmJmIjoxNTgzMDgzNDgyLCJqdGkiOiJ5WTJJdlA2aGtabmEzNHBiIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.RAvdZAzJkFKxr1wz0Hmd-sFWFPxsOeQ_WwzdoEyfim0', '+5566984274493', 50, NULL, NULL),
(21, 'Pizzaria Pigalle', 'pigalle@incasadelivery.com', NULL, '$2y$10$wxXh2WnTiJ6I3MrfrDIo0eDsxBvjcsi4aW27yyZRsWP5ogyhVZ6jC', '1tLTTXuQdn4aS2bjHSpqFssuYkzBM4AwfthGphsD26HoSsAid1sDbjOYP8fX', '2020-03-06 17:26:28', '2020-03-28 16:07:19', NULL, '66992301187', 0, 'HUIVL', NULL),
(22, 'Romario', 'onjogos.rs@gmail.com', NULL, '$2y$10$DrdQKeQNrDvGa9GFysWFT.4BGI7buuOpY.YJL/vz0opfmihrTk2mO', NULL, '2020-03-06 18:44:24', '2020-04-02 12:43:24', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2xvZ2luIiwiaWF0IjoxNTg1ODMxNDA0LCJuYmYiOjE1ODU4MzE0MDQsImp0aSI6IjZyN0tzYjBuRU01VldnSmYiLCJzdWIiOjIyLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.2eSByGDl9pwM-BModg4qsSMIN_sjYc9pZ8BrzXCw8pY', '+5566996319512', 32, 'H85RR', NULL),
(23, 'Thatielly Guimarães da Silva', 'Tathy.guimaraes@hotmail.com', NULL, '$2y$10$Ks2Qsfm3dqlH7nXL.ZHf8uphFOCDbIn0E0WNdFJVjWfToUt5dzIG2', NULL, '2020-03-07 17:30:14', '2020-03-07 17:30:14', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTgzNjAyMjE0LCJuYmYiOjE1ODM2MDIyMTQsImp0aSI6InhVNzlyQVlGZGRjZzIyTmYiLCJzdWIiOjIzLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.3YQghcedKixBNHOX5aB8L7O0e-W-PwRnUt17Oc3GJos', '+5566996808258', 0, 'RSKB6', NULL),
(24, 'RAIZ HAMBÚRGUERIA', 'tassyogoncalvessilva@gmail.com', NULL, '$2y$10$alab//N8iEfVuczzTxgHE.kr7zGTvQpp3YDjMNC3u6Z5mlAKcSGg2', NULL, '2020-03-08 19:14:36', '2020-03-16 20:27:53', NULL, '66992263488', 0, '3OPLB', NULL),
(25, 'Ederson pereira', 'nudog.hotdoggeria@gmail.com', NULL, '$2y$10$TP7psIKR8xrNoje3avWfC.8RbpNbumOdTJNOWhqg2JU5nbG2hxsQ.', NULL, '2020-03-08 19:27:26', '2020-04-14 22:21:38', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2xvZ2luIiwiaWF0IjoxNTg0NDA2NzQ3LCJuYmYiOjE1ODQ0MDY3NDcsImp0aSI6IjhoUXZKaENHaWhna3B6NlkiLCJzdWIiOjI1LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.b_B23b3NlDAzx7JpcyXtiFwES30AUV6oMjWRwrgHaQ8', '66992398754', 9, 'RP75F', NULL),
(26, 'ederson pereira', 'ederson@hungerdelivery.com', NULL, '$2y$10$/YjRubJXQAD6N8XtjJEYzetYJTSFuS9UOS9uaRxIAj8xiJntt/ETK', NULL, '2020-03-08 19:58:46', '2020-03-18 18:22:18', NULL, '66992398754', 0, 'WHDPB', NULL),
(27, 'ederson', 'ederjvp@hotmail.com', NULL, '$2y$10$UUw.F3fbqv59TGY0pdK29.uKTGPAg3zLWel6KLXkj6eW7bju0HToS', NULL, '2020-03-08 20:20:22', '2020-04-13 00:32:22', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg2NTUyMDEwLCJuYmYiOjE1ODY1NTIwMTAsImp0aSI6IldZZUUzS2lpd2VMMmtWYXEiLCJzdWIiOjI3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.eMoSltWMuDuoZeFVrqGOFHNJGWwbVKW20a_OlyQD4ik', '66992398754', 40, 'BX1NV', 1),
(28, 'wanderli dos reis fernandes', 'reis.fernandes.40@hotmail.com', NULL, '$2y$10$ElJ/OALH0gspUw5Nh3ib1.K4vhEpL1gjqFhyxItVK5JmyOI218H.6', NULL, '2020-03-08 20:55:04', '2020-03-08 20:55:04', NULL, '66999628462', 0, 'HKNLT', NULL),
(29, 'Tricia', 'lojabrigadeiritos@gmail.com', NULL, '$2y$10$a/ysGKBXV4GFzfaTlN55jO3UcaT7ZpeHGOiGiQasZ0fJi8uzXZ2qy', NULL, '2020-03-09 17:07:50', '2020-03-11 13:44:43', NULL, '66992150841', 0, 'R15RT', NULL),
(30, 'Lucas', 'lcslucas0@gmail.com', NULL, '$2y$10$c6/2hMyfn1AmvL7vgQzF.uSQacER2HpYRvjMItd0vUmBo.c5dxUYS', NULL, '2020-03-10 11:37:05', '2020-03-10 11:37:05', NULL, '66992399166', 0, 'GLSVJ', NULL),
(31, 'MATHEUS FERREIRA DINIZ ARAUJO', 'matheusferreiradiniz@gmail.com', NULL, '$2y$10$lP48YJZXAFaaNQUty5t3v.B.gcaTx5G.U9Ky0dMv2/v5xr3LWAgTK', NULL, '2020-03-10 12:14:57', '2020-03-10 12:14:57', NULL, '66984308934', 0, 'SFRDX', NULL),
(32, 'Luis Felipe dos Anjos Kisels', 'Luisfelipe.lfak@gmail.com', NULL, '$2y$10$/A5L3db4Etboc9TImkIyDeQGjYx6cK.IDb3LpyjvnVhJj.OGb1Zru', NULL, '2020-03-10 13:18:04', '2020-03-10 13:18:04', NULL, '66992291860', 0, 'D1BZM', NULL),
(33, 'Gelciomar moreira dos santos', 'gelciomar.barra@outlook.com', NULL, '$2y$10$MBSE8i9xxWj8uJc.UhHSDeRuqr9VL6i3db4tkgoot4LvhwWg5woF6', NULL, '2020-03-10 13:23:15', '2020-04-11 21:00:09', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg2NjM4ODA5LCJuYmYiOjE1ODY2Mzg4MDksImp0aSI6IjRqdXF3RW1wOWhSMU9pcXYiLCJzdWIiOjMzLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.eQPyxZpMvb0yKaG8ze0vi1qbXbXvq8STPBYlkBkPOvQ', '66992443345', 0, '1M0YO', 2),
(34, 'João Paulo Alves di Domenico', 'joaopauloalves788@gmail.com', NULL, '$2y$10$/zNj7bBPKSykDWzGkO0fwOdwwOSv3NdIA40TbBRNDwj8AtdI1j23y', NULL, '2020-03-10 13:23:28', '2020-03-24 13:41:09', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg1MDU3MjY5LCJuYmYiOjE1ODUwNTcyNjksImp0aSI6IlhWdGVlNUFoM2QydFNBSHMiLCJzdWIiOjM0LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0._DwuVKpKUD9BhYK7Q62KrqzwNCuYD5rIv2G8Q-zk8Kg', '66984104912', 11, '2E4NP', NULL),
(35, 'Romário Silva', 'romario.sr@live.com', NULL, '$2y$10$D/TLeq9lpO.Ve5n3o2YsEu4AyJeRyFPQgBxTkOvnEvpeNjIU0Gv3S', NULL, '2020-03-10 13:37:48', '2020-04-11 20:42:25', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg2NjM3NzQ1LCJuYmYiOjE1ODY2Mzc3NDUsImp0aSI6ImdqclVoTE44ckNtaDFJa1kiLCJzdWIiOjM1LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.c_v6tzs356xPNRGzvv8IJGbC0hFyv8eXNxtkDUP1zhI', '66984274493', 0, 'TF862', 8),
(36, 'Maurício Marques Inácio', 'Mauriciomarques1@outlook.com', NULL, '$2y$10$X1dHipH496xJGHu3u2.bB.pykROW1NsxPQLfPyJ/yuPGxNPG08l1S', NULL, '2020-03-10 13:47:10', '2020-03-10 13:47:10', NULL, '66992089248', 0, 'GAGRX', NULL),
(37, 'José Augusto Duarte da Silva', 'joseiipaula.ja.jad@gmail.com', NULL, '$2y$10$5TogvrSfyCgDEi1gaI92gOWOzkJVUU4wwN3zF8DNHM0o44TaZBbOy', NULL, '2020-03-10 14:31:52', '2020-03-10 14:31:52', NULL, '66992836896', 0, 'DT1E1', NULL),
(38, 'Jhon Wester Pires Silva', 'lobiinpires@gmail.com', NULL, '$2y$10$UrWu8xoeGNxzL42B8b.91uloDmkHqEQnBzPjY13wBb2.egzDaIMYu', NULL, '2020-03-10 23:25:47', '2020-03-11 13:44:19', NULL, '062982597369', 0, 'O2R8D', 3),
(39, 'Victor Alves Barros', 'victoralvesbarros20@gmail.com', NULL, '$2y$10$F7anFlKYX5N0zMujMHX.ee9QgZd4FINFegfi2KEM5OBAtSMvBj5Wm', NULL, '2020-03-12 16:51:50', '2020-03-12 22:02:22', NULL, '992417950', 0, 'QKHHN', 4),
(40, 'Testando', 'teste@email.com', NULL, '$2y$10$mKcfiPzVHJAUqtLhbb/aK.SR2kIjkbbDcn2OwKO1SMFib2GGDIwhC', NULL, '2020-03-13 22:59:50', '2020-03-13 22:59:50', NULL, '66999319512', 0, 'ADXKV', NULL),
(41, 'André Luis Nascimento da Silva', 'andreluisnascimentodasilva@gmail.com', NULL, '$2y$10$7sGVKCALniBAuY3B6I/WLe5BHOHxF9RuoB21XrHTMSZwwV0zpiG4C', NULL, '2020-03-16 17:51:55', '2020-03-16 18:34:28', NULL, '5566992016679', 0, 'OZW03', NULL),
(42, 'Thayná Alves Tábory', 'thaynagabriel28@gmail.com', NULL, '$2y$10$VR8CTydNTwnKlNRIbEf90en00LR8iKF75WsE5w.H45so.nV6Di.QW', NULL, '2020-03-16 18:59:03', '2020-03-16 19:04:02', NULL, '5566999377831', 0, 'EJ8GK', 5),
(43, 'Regina Alves de Araújo', 'nerycatcosta@outlook.com', NULL, '$2y$10$PugnjzdbbIkxrk/uTjZ3buavld9Wpv5w/3eyOw/k0wQEztRWHQeUm', NULL, '2020-03-16 19:02:39', '2020-03-16 19:02:39', NULL, '5566984031178', 0, 'BULXP', NULL),
(44, 'Romario', 'suave@suave.com', NULL, '$2y$10$0EvWBz.HdzcoYyC1dJJeFuAC8zo3JmUbjrOSjZXE8t22314Jg/CcW', NULL, '2020-03-16 23:40:17', '2020-03-17 21:05:24', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NDAyMDE4LCJuYmYiOjE1ODQ0MDIwMTgsImp0aSI6IkJNeUpoWDhrMmdHMkY3UXMiLCJzdWIiOjQ0LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.u1ahJ6OQKrx2T__NoaJTAS5RDTqgUYEks1ks-3VY2KA', '+5566984274123', 17, 'Q2ACP', NULL),
(45, 'Tricia Castro Giugni', 'lojasbrigadeiritos@gmail.com', NULL, '$2y$10$n3Ae2eqIjdGFn0NorbiLt.2VOx0JT8H2EcJB1AE689Q/T6Iqnq.za', NULL, '2020-03-17 13:53:33', '2020-03-17 16:52:48', NULL, '5566992920140', 0, 'SYHVT', NULL),
(46, 'Alemoa', 'leticiahenrichsen@hotmail.com', NULL, '$2y$10$0I0.dvTQws7mI0THKC3eAOvm/0SyVXrTyEE9bEARoUsD8faIdAbsq', NULL, '2020-03-17 14:31:42', '2020-03-17 17:20:48', NULL, '556692812212', 0, 'DZNCA', NULL),
(47, 'José Antonio Capitanio Batista', 'totonhobatista@gmail.com', NULL, '$2y$10$2HBpic1f8k0HsYeXg6rZNughphCCDUE2HOqrWPcPPhpYmfwT.7Q1W', NULL, '2020-03-17 16:37:27', '2020-03-17 16:37:28', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NDYzMDQ4LCJuYmYiOjE1ODQ0NjMwNDgsImp0aSI6IlA2NGpTZjRKN2VLNGx3QlQiLCJzdWIiOjQ3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.86hZ2OYA1dr45MfjnqbsOmJk8HNyJYnkiGa45Mvi0Oc', '+5566996154735', 15, 'UBWIZ', NULL),
(48, 'Victoria Correa', 'victoria-blz@outlook.com', NULL, '$2y$10$ijhoWXIYQSEsq6T68YkonOruT4zqjwJ15vAcrxlh4Q6S6KRfzAose', NULL, '2020-03-17 16:41:04', '2020-03-17 16:41:04', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NDYzMjY0LCJuYmYiOjE1ODQ0NjMyNjQsImp0aSI6ImRqNWc1QlNJUmVLVUJHRnYiLCJzdWIiOjQ4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.21EaUC4D1yHT03fjyxLY3ZnTJtgV3eqo5lxaUrETMFU', '+5566999434853', 16, 'EO3KM', NULL),
(49, 'Patrícia Oliveira', 'patiengecivil@gmail.com', NULL, '$2y$10$7gVehqX3VDV17WXHxAZFNevxi.3BFW9lDDYNQg1B86FBMFOBV52Ra', NULL, '2020-03-18 01:18:04', '2020-03-18 13:41:32', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NDk0Mjg0LCJuYmYiOjE1ODQ0OTQyODQsImp0aSI6IkFSTzl2bmVyM0JLc25hTEMiLCJzdWIiOjQ5LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.b8pWWVFrZDMEuzLZsx5cIYoNFCKrVvaKguGPTwMiBog', '+556592492802', 18, 'OHCQV', NULL),
(50, 'Thiago Demellas Batista', 'thiagodemellasll@gmail.con', NULL, '$2y$10$9ELK4wxZZ1bVybY4gw.0E.h0Pf4zePR.C3QIJH3wAqqq1uKqaInP.', NULL, '2020-03-18 12:19:33', '2020-03-18 16:19:17', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg0NTQ4MzU3LCJuYmYiOjE1ODQ1NDgzNTcsImp0aSI6InpxR2RxWnozbzRoVmNkN1IiLCJzdWIiOjUwLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.051-pp4ue0oj_LUANeQKKsxAbQesP2KU_Lj7VwviwGg', '66992531335', 0, 'G3KAG', 6),
(51, 'Vitor Augusto Calheiros de Oliveira', 'vitoraugusto2105@gmail.com', NULL, '$2y$10$wyYxo7TqvUVpBKneZQtXh.76rNbKsF3cUI5/jV8D37Yegf1KijSGK', NULL, '2020-03-18 14:01:13', '2020-03-18 23:14:27', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2RlbGl2ZXJ5L2xvZ2luIiwiaWF0IjoxNTg0NTQwMTU4LCJuYmYiOjE1ODQ1NDAxNTgsImp0aSI6Imtaell4WndITlg4V09UbEUiLCJzdWIiOjUxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1Zny64L9IZCl08dURF_s3ibbfGSOMMp2_a0pnYPDWkA', '66992178157', 0, 'P2NRG', 7),
(52, 'Danieber', 'danieber10@hotmail.com', NULL, '$2y$10$dH0R2mL4RL1eg0rFO1dLBuAI0xOZu1Yg5.FLBEPNW6WLhMfXTZj9W', NULL, '2020-03-18 20:40:58', '2020-03-18 20:40:58', NULL, '6634014110', 0, '59J3S', NULL),
(53, 'Nayara Guimaraes', 'nayaraguimaraesgeo@gmail.com', NULL, '$2y$10$CW1ulWMChmwp.krSPbVIw.gDpzOOEfEq0lIT2hmNGFFh5wWRgPc9q', NULL, '2020-03-18 20:46:39', '2020-03-18 20:46:39', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NTY0Mzk5LCJuYmYiOjE1ODQ1NjQzOTksImp0aSI6IkV6WXRmekszVVRGVnZYRXUiLCJzdWIiOjUzLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5uPf0uvpfsulCedRHFbrKCFVGsogMHXZsjqFrao879Y', '+5566992839786', 0, 'YVAJ7', NULL),
(54, 'Lilian Letícia', 'leticiareimer200910@gmail.com', NULL, '$2y$10$DM3yj91UOA8UDxdVEp91uO8HJfA6yMgh.XZ5hN4qP9yTdeiE27EWK', NULL, '2020-03-18 21:28:37', '2020-03-19 00:18:17', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NTY2OTE3LCJuYmYiOjE1ODQ1NjY5MTcsImp0aSI6IkIwSHZRUlNBWklZbWFvb2oiLCJzdWIiOjU0LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.v2DDhPgA6NguJCBckOxp2oRkmN-afmV1lL3ubplCYVo', '+5566996372308', 19, 'VESEJ', NULL),
(55, 'Erika', 'erikarosa-htinha@hotmail.com', NULL, '$2y$10$eWK0POL84eBVRx7nkcz3.O46KOB08b43V3CuR3jzQl0MqQVKJwhb.', NULL, '2020-03-18 22:55:39', '2020-03-18 23:04:21', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NTcyMTM5LCJuYmYiOjE1ODQ1NzIxMzksImp0aSI6IjhFZXZTZEZVNW1rZnRuejMiLCJzdWIiOjU1LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.JQeTFkDxbGUz8nu4SHXYzaKLnCPu151569jzu_K2DyQ', '+6699881988', 22, 'AMQEU', NULL),
(56, 'Érika Rosa da Silva', 'erikarosafarmaceutica@gmail.com', NULL, '$2y$10$7HnxgTUfN8BPGZQ3m8OaR.PI0NwhVAWKVlOfiaB8kVnyrOGrDbGDO', NULL, '2020-03-18 23:10:23', '2020-03-18 23:10:23', NULL, '066992525616', 0, '6H5ZA', NULL),
(57, 'Erika Rosa', 'drogariamultipharma@hotmail.com', NULL, '$2y$10$nphAmfcqzO2K9gVlmp/hZuU107TK2JcdShvT/DhwMg5oP.9znweF2', NULL, '2020-03-19 12:57:45', '2020-03-23 17:22:31', NULL, '66992525616', 0, 'E582V', NULL),
(58, 'Omalley Farias', 'Omalley.farias@gmail.com', NULL, '$2y$10$fRnlOOrTfPlOh9ll19vGAuQ7ffozGXeUKOZE5eB1ywFt41SbYIE1u', NULL, '2020-03-19 14:07:04', '2020-03-19 14:07:04', NULL, '66996644954', 0, 'HIK5U', NULL),
(59, 'Davidy Alexandre Freitas Sales', 'davidyalexandre20@gmail.com', NULL, '$2y$10$GUALK5dKfFBssb4rs7Qi6OpFwi7jyvFq9On.b96VXGez6TOxDxhGO', NULL, '2020-03-19 14:10:39', '2020-03-19 14:10:39', NULL, '66992230068', 0, '9MXDR', NULL),
(60, 'Miguel Moreira Da Silva Junior', 'miguelmoreirajunior@gmail.com', NULL, '$2y$10$EKayoeIAOCclzL8wh8MCk.mwYjZWODzKQCvfgbar5t3/jnQGUn0sC', NULL, '2020-03-19 14:40:50', '2020-03-19 14:40:50', NULL, '66992216761', 0, 'BZMYV', NULL),
(61, 'Fernanda de Araújo Pereira', 'nanda-eloyse@hotmail.com', NULL, '$2y$10$DXHuQWJnlnsiWki5UOlShe.df5w.s6xzVBQxCrYAllW0KzURy2A26', NULL, '2020-03-19 18:19:53', '2020-03-23 11:39:24', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL2xvZ2luIiwiaWF0IjoxNTg0OTYzNTY0LCJuYmYiOjE1ODQ5NjM1NjQsImp0aSI6Ik1VQzhwRXhqbWJyVVdTbGkiLCJzdWIiOjYxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.Hr2B8UbtpmIc8jpoyouJ6WgbrAiBc4RsBztFxq4QcgI', '5566999677488', 28, '9Z9Z4', NULL),
(62, 'Rafael Souza', 'rafacipulo@gmail.com', NULL, '$2y$10$WwjaN2RimNlZ5qlAUyv8hukpWwanJ.RAk95RlstrgQGVIeVHdHvAC', NULL, '2020-03-19 19:44:57', '2020-03-19 19:44:57', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NjQ3MDk3LCJuYmYiOjE1ODQ2NDcwOTcsImp0aSI6InZTYmV4NmVTT2Jtc3VXNEMiLCJzdWIiOjYyLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.FmbJAvWTkfP-ilwvCmkU0SP6E_KRjjpTLOnsChG3tPk', '+556697176316', 23, 'MOWKU', NULL),
(63, 'Rayane Alves', 'rperfil@hotmail.com', NULL, '$2y$10$WgnH/Ahg8FdBJOKQfbEwfuRdgsyYLNABaK5fouIxXXY8Fml9bnAOG', NULL, '2020-03-20 01:30:41', '2020-03-20 01:31:45', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0NjY3ODQxLCJuYmYiOjE1ODQ2Njc4NDEsImp0aSI6Ik5qY290UkNXYm9KMENsaWMiLCJzdWIiOjYzLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.aKVJTn4x8PSPmN3lHFw2RbqljwVaJWeP2aDMAiJRFqI', '+5566992009538', 25, 'MU8PL', NULL),
(64, 'Djane', 'djinha2@gmail.com', NULL, '$2y$10$Ck.d.IG/1pELHXPnFGezYeA/58DJ7F1Z/vYv932ri9HxjRedDs4QO', NULL, '2020-03-23 02:36:27', '2020-03-23 02:36:27', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2h1bmdlcmRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg0OTMwOTg3LCJuYmYiOjE1ODQ5MzA5ODcsImp0aSI6IlpRSWkwdElPek1Jc3VUc3EiLCJzdWIiOjY0LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.wUU-gW79dfoxOOfqqfDmYeCbZghpdbYkhnFxSG_ZHMU', '+1566992379265', 27, 'QOLKJ', NULL),
(65, 'Angela', 'amgela@gmail.com', NULL, '$2y$10$VGK0.9pWjf.Y6t5dZJszoOzhEbHEF7ZEGXHxYoFDiK8d8B/J0BwpC', NULL, '2020-04-04 15:50:10', '2020-04-04 15:50:10', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg2MDE1NDEwLCJuYmYiOjE1ODYwMTU0MTAsImp0aSI6InphS0xaNERpMFZoRDFlTDEiLCJzdWIiOjY1LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.axzotH7g_Pjp7gU319o2Awycl-n0XFO5b_D05SbOOQU', '+55984251236', 34, 'ZGKUN', NULL),
(66, 'elivanfabrizio', 'elivanfabrizio@gmail.com', NULL, '$2y$10$rfdVNFN3Gu/qVQsbLrNHjuNp/XuxRiOdO3r116K1GmkAJAmNiX2Xi', NULL, '2020-04-07 20:10:52', '2020-04-07 20:11:19', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg2MjkwMjUyLCJuYmYiOjE1ODYyOTAyNTIsImp0aSI6IjlyUDNZOWlic0hBQUI1VHIiLCJzdWIiOjY2LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.ODDJ3TtAH8V6kesv1I-WdmUmYMh7P2kl67UOEj_FB9c', '+5566996780826', 36, '0ROAO', NULL),
(67, 'Rômulo', 'romulozte@gmail.com', NULL, '$2y$10$AUhkzEJemKYMpCK.NPkm7uva1VLV5oTVwpDV3pYrWVoGjLlOIB0o.', NULL, '2020-04-10 20:42:11', '2020-04-10 20:42:11', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luY2FzYWRlbGl2ZXJ5LmNvbS9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTg2NTUxMzMxLCJuYmYiOjE1ODY1NTEzMzEsImp0aSI6Im5DZWVMSFIyN09iaFhXdloiLCJzdWIiOjY3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.hLcshQ4B4MbMdCulcKfFLSGCs85BIP11Q4C6RJRJAIo', '+5581986967949', 39, 'DV0JA', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
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
-- Fazendo dump de dados para tabela `wallets`
--

INSERT INTO `wallets` (`id`, `holder_type`, `holder_id`, `name`, `slug`, `description`, `balance`, `decimal_places`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-07 01:24:51', '2020-03-07 01:24:51'),
(2, 'App\\User', 21, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-06 17:26:29', '2020-03-06 17:26:29'),
(3, 'App\\User', 22, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-06 18:44:24', '2020-03-06 18:44:24'),
(4, 'App\\User', 23, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-07 17:30:14', '2020-03-07 17:30:14'),
(5, 'App\\User', 24, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-08 19:24:52', '2020-03-08 19:24:52'),
(6, 'App\\User', 25, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-08 19:57:04', '2020-03-08 19:57:04'),
(7, 'App\\User', 26, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-08 19:58:47', '2020-03-08 19:58:47'),
(8, 'App\\User', 27, 'Default Wallet', 'default', NULL, 17, 2, '2020-03-08 20:20:23', '2020-03-08 20:24:11'),
(9, 'App\\User', 28, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-08 22:29:38', '2020-03-08 22:29:38'),
(10, 'App\\User', 29, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-09 18:08:13', '2020-03-09 18:08:13'),
(11, 'App\\User', 31, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 12:54:13', '2020-03-10 12:54:13'),
(12, 'App\\User', 30, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 12:54:13', '2020-03-10 12:54:13'),
(13, 'App\\User', 34, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 13:29:54', '2020-03-10 13:29:54'),
(14, 'App\\User', 33, 'Default Wallet', 'default', NULL, 500, 2, '2020-03-10 13:29:54', '2020-03-17 21:07:50'),
(15, 'App\\User', 32, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 13:29:54', '2020-03-10 13:29:54'),
(16, 'App\\User', 35, 'Default Wallet', 'default', NULL, 400, 2, '2020-03-10 13:38:23', '2020-04-11 20:44:48'),
(17, 'App\\User', 37, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 14:49:12', '2020-03-10 14:49:12'),
(18, 'App\\User', 36, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-10 14:49:12', '2020-03-10 14:49:12'),
(19, 'App\\User', 38, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-11 13:43:52', '2020-03-11 13:43:52'),
(20, 'App\\User', 39, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-12 22:01:57', '2020-03-12 22:01:57'),
(21, 'App\\User', 40, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-13 23:59:59', '2020-03-13 23:59:59'),
(22, 'App\\User', 41, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-16 18:34:01', '2020-03-16 18:34:01'),
(23, 'App\\User', 42, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-16 19:00:03', '2020-03-16 19:00:03'),
(24, 'App\\User', 43, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-16 20:26:23', '2020-03-16 20:26:23'),
(25, 'App\\User', 44, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-16 23:40:18', '2020-03-16 23:40:18'),
(26, 'App\\User', 45, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-17 14:29:51', '2020-03-17 14:29:51'),
(27, 'App\\User', 46, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-17 15:34:33', '2020-03-17 15:34:33'),
(28, 'App\\User', 47, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-17 16:37:28', '2020-03-17 16:37:28'),
(29, 'App\\User', 48, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-17 16:41:05', '2020-03-17 16:41:05'),
(30, 'App\\User', 49, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 01:18:04', '2020-03-18 01:18:04'),
(31, 'App\\User', 50, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 13:40:26', '2020-03-18 13:40:26'),
(32, 'App\\User', 51, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 14:02:38', '2020-03-18 14:02:38'),
(33, 'App\\User', 53, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 20:46:39', '2020-03-18 20:46:39'),
(34, 'App\\User', 54, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 21:28:37', '2020-03-18 21:28:37'),
(35, 'App\\User', 55, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 22:55:39', '2020-03-18 22:55:39'),
(36, 'App\\User', 56, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 23:13:10', '2020-03-18 23:13:10'),
(37, 'App\\User', 52, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-18 23:13:10', '2020-03-18 23:13:10'),
(38, 'App\\User', 57, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-19 13:01:26', '2020-03-19 13:01:26'),
(39, 'App\\User', 59, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-19 14:10:41', '2020-03-19 14:10:41'),
(40, 'App\\User', 58, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-19 14:10:41', '2020-03-19 14:10:41'),
(41, 'App\\User', 60, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-19 15:35:34', '2020-03-19 15:35:34'),
(42, 'App\\User', 62, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-19 19:44:57', '2020-03-19 19:44:57'),
(43, 'App\\User', 63, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-20 01:30:41', '2020-03-20 01:30:41'),
(44, 'App\\User', 61, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-20 17:42:00', '2020-03-20 17:42:00'),
(45, 'App\\User', 64, 'Default Wallet', 'default', NULL, 0, 2, '2020-03-23 02:36:27', '2020-03-23 02:36:27'),
(46, 'App\\User', 65, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-04 15:50:10', '2020-04-04 15:50:10'),
(47, 'App\\User', 66, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-07 20:10:52', '2020-04-07 20:10:52'),
(48, 'App\\User', 67, 'Default Wallet', 'default', NULL, 0, 2, '2020-04-10 20:42:11', '2020-04-10 20:42:11');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `accept_deliveries`
--
ALTER TABLE `accept_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `addon_categories`
--
ALTER TABLE `addon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `addon_category_item`
--
ALTER TABLE `addon_category_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `delivery_collections`
--
ALTER TABLE `delivery_collections`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `delivery_collection_logs`
--
ALTER TABLE `delivery_collection_logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `delivery_guy_details`
--
ALTER TABLE `delivery_guy_details`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `gps_tables`
--
ALTER TABLE `gps_tables`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_name_unique` (`name`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices de tabela `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orderstatuses`
--
ALTER TABLE `orderstatuses`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `order_item_addons`
--
ALTER TABLE `order_item_addons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices de tabela `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `popular_geo_places`
--
ALTER TABLE `popular_geo_places`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `promo_sliders`
--
ALTER TABLE `promo_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `push_tokens`
--
ALTER TABLE `push_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Índices de tabela `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_sku_unique` (`sku`);

--
-- Índices de tabela `restaurant_categories`
--
ALTER TABLE `restaurant_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurant_category_restaurant`
--
ALTER TABLE `restaurant_category_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurant_category_sliders`
--
ALTER TABLE `restaurant_category_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurant_earnings`
--
ALTER TABLE `restaurant_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurant_payouts`
--
ALTER TABLE `restaurant_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurant_user`
--
ALTER TABLE `restaurant_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `transactions`
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
-- Índices de tabela `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  ADD KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  ADD KEY `wallets_slug_index` (`slug`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `accept_deliveries`
--
ALTER TABLE `accept_deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `addon_categories`
--
ALTER TABLE `addon_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `addon_category_item`
--
ALTER TABLE `addon_category_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT de tabela `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `delivery_collections`
--
ALTER TABLE `delivery_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `delivery_collection_logs`
--
ALTER TABLE `delivery_collection_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `delivery_guy_details`
--
ALTER TABLE `delivery_guy_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `gps_tables`
--
ALTER TABLE `gps_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT de tabela `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `orderstatuses`
--
ALTER TABLE `orderstatuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `order_item_addons`
--
ALTER TABLE `order_item_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `popular_geo_places`
--
ALTER TABLE `popular_geo_places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `promo_sliders`
--
ALTER TABLE `promo_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `push_tokens`
--
ALTER TABLE `push_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `restaurant_categories`
--
ALTER TABLE `restaurant_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `restaurant_category_restaurant`
--
ALTER TABLE `restaurant_category_restaurant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `restaurant_category_sliders`
--
ALTER TABLE `restaurant_category_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `restaurant_earnings`
--
ALTER TABLE `restaurant_earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `restaurant_payouts`
--
ALTER TABLE `restaurant_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `restaurant_user`
--
ALTER TABLE `restaurant_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT de tabela `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
