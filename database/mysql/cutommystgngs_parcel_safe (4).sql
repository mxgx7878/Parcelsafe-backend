-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 03, 2023 at 01:15 PM
-- Server version: 10.6.15-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cutommystgngs_parcel_safe`
--

-- --------------------------------------------------------

--
-- Table structure for table `count`
--

CREATE TABLE `count` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `count`
--

INSERT INTO `count` (`id`, `count`, `created_at`, `updated_at`) VALUES
(1, 107, '2023-09-14 13:51:14', '2023-10-03 09:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(11) DEFAULT NULL COMMENT '1: In Process, 2: Resolved',
  `resolution` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `issue`, `message`, `user_id`, `status`, `resolution`, `created_at`, `updated_at`) VALUES
(1, 'This is my issue', 'This is my message', 53, 0, 'sgdkgsjhdkaj', '2023-08-29 15:37:50', '2023-09-26 23:12:26'),
(2, 'This is my issue', 'This is my message', 53, 0, 'Velit nostrud cupidi', '2023-08-29 16:50:39', '2023-09-08 17:37:07'),
(3, 'Issue', '......', 53, NULL, 'Ex et sunt molestiae', '2023-08-29 17:40:34', '2023-09-08 17:39:12'),
(4, 'option', '.......', 53, 0, 'Hellow World', '2023-08-29 17:47:29', '2023-09-08 20:33:05'),
(5, 'option', '.......', 53, NULL, 'Est quisquam maiore', '2023-08-29 17:47:54', '2023-09-08 17:38:01'),
(6, 'option', '.......', 53, 0, 'Hello Jenny How are you? Your issue is resolved now..', '2023-08-29 17:48:14', '2023-09-08 17:41:03'),
(7, 'Issue', '.....', 53, 0, 'Done', '2023-08-29 17:53:01', '2023-10-02 16:03:34'),
(8, 'option', 'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdfdfdffdfffffdfffffdfffdsfffffffffdfdfffffffffffffffffffdsfffffffffffffffffffdffffffffffdffffffffffffffffffffffffffffffdsfffffffffdsffffffffffffffffffgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', 53, 1, NULL, '2023-08-29 18:04:05', '2023-08-29 18:04:05'),
(9, 'option', 'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdfdfdffdfffffdfffffdfffdsfffffffffdfdfffffffffffffffffffdsfffffffffffffffffffdffffffffffdffffffffffffffffffffffffffffffdsfffffffffdsffffffffffffffffffgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', 53, 0, 'ok', '2023-08-29 18:13:03', '2023-09-14 15:48:16'),
(10, 'option', 'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdfdfdffdfffffdfffffdfffdsfffffffffdfdfffffffffffffffffffdsfffffffffffffffffffdffffffffffdffffffffffffffffffffffffffffffdsfffffff', 53, 1, NULL, '2023-08-29 18:17:38', '2023-08-29 18:17:38'),
(11, 'option', 'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdfdfdffdfffffdfffffdfffdsfffffffffdfdfffffffffffffffffffdsfffffffffffffffffffdffffffffffdfffffffffffffffffffffffff', 53, 0, 'resolved', '2023-08-29 18:21:50', '2023-09-26 23:12:48'),
(12, 'This is my issue', 'This is my message', 53, 0, 'resolved', '2023-08-29 19:59:10', '2023-09-26 23:13:16'),
(13, 'Issue', '....', 55, 1, NULL, '2023-08-30 18:38:16', '2023-08-30 18:38:16'),
(14, 'Issue', 'Hello', 53, 1, NULL, '2023-08-30 21:18:01', '2023-08-30 21:18:01'),
(15, 'Issue', 'Hello', 53, 1, NULL, '2023-08-30 21:18:01', '2023-08-30 21:18:01'),
(16, 'Issue', 'hjhjhj', 53, 1, NULL, '2023-09-02 00:23:56', '2023-09-02 00:23:56'),
(17, 'option', 'test...............', 57, 1, NULL, '2023-09-02 01:11:43', '2023-09-02 01:11:43'),
(18, 'Issue', 'issue .......', 58, 1, NULL, '2023-09-02 01:20:29', '2023-09-02 01:20:29'),
(19, 'testissue', 'testmessage', 53, 0, 'Hello World', '2023-09-07 19:39:11', '2023-09-08 17:33:41'),
(20, 'testissue', 'testmessage', 53, 0, 'Helloooooooooooooooooo', '2023-09-08 13:53:55', '2023-09-08 17:33:23'),
(21, 'testnameupdate', '...', 53, 1, NULL, '2023-09-13 21:09:26', '2023-09-13 21:09:26'),
(22, 'testnameupdate', '..', 53, 1, NULL, '2023-10-02 15:54:12', '2023-10-02 15:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `issue_type`
--

CREATE TABLE `issue_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `issue_type`
--

INSERT INTO `issue_type` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(3, 'testnameupdate', 1, '2023-09-08 14:37:01', '2023-09-08 18:37:01'),
(4, 'sasaSA', 1, '2023-09-08 20:31:52', '2023-09-08 20:31:52'),
(5, 'test', 1, '2023-10-02 21:55:53', '2023-10-02 21:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(90, 'App\\Models\\User', 55, 'API Token', '79b56474215334e7d45b4a4561a9ad2e989172adb1f2474d0e89a759d4b322a0', '[\"*\"]', NULL, '2023-08-29 22:04:09', '2023-08-29 22:04:09'),
(91, 'App\\Models\\User', 55, 'API Token', '6f10dd71dc3b2077cb552227512313907a8a249f9663b204c9bdeea884c8d988', '[\"*\"]', '2023-08-29 22:10:20', '2023-08-29 22:04:51', '2023-08-29 22:10:20'),
(92, 'App\\Models\\User', 55, 'API Token', '9c0a3183a6f424581bae5372bbaa81ad38c3e344cdfd67315592f080de3348ca', '[\"*\"]', '2023-08-30 17:09:55', '2023-08-29 22:34:54', '2023-08-30 17:09:55'),
(93, 'App\\Models\\User', 55, 'API Token', '31062422ef6b5f6f11bec50af34a08ddb9465c2da86d44d7db01d07155e6db15', '[\"*\"]', '2023-08-30 02:56:46', '2023-08-30 02:54:38', '2023-08-30 02:56:46'),
(96, 'App\\Models\\User', 55, 'API Token', '850f913e6629c5fc07a6e6be3f260553441310097bdf24f89f915f2b62e27e84', '[\"*\"]', '2023-08-30 18:38:15', '2023-08-30 17:35:54', '2023-08-30 18:38:15'),
(97, 'App\\Models\\User', 53, 'API Token', '8acbb76e3ecc8a4b7e84902d97f121351c63c10b48fe0cda74abf3e278494891', '[\"*\"]', NULL, '2023-08-30 20:13:56', '2023-08-30 20:13:56'),
(98, 'App\\Models\\User', 53, 'API Token', '639e13f7364e05fec73ecced2255619baccd87c1ad4ab7b401ba9fee1b5b25d5', '[\"*\"]', NULL, '2023-08-30 20:16:38', '2023-08-30 20:16:38'),
(99, 'App\\Models\\User', 53, 'API Token', '1f0738db8de5ce51a384799192a281c9e946689db2091abafc7774f3e0c8fdbb', '[\"*\"]', NULL, '2023-08-30 20:17:51', '2023-08-30 20:17:51'),
(100, 'App\\Models\\User', 53, 'API Token', '2727ab1d88b918e7a16d6cd81eaa44c78ed40c68455bdd8cc12fabcc77ee40cf', '[\"*\"]', '2023-08-30 21:17:58', '2023-08-30 21:17:06', '2023-08-30 21:17:58'),
(101, 'App\\Models\\User', 53, 'API Token', '1c59b7d3bd75a8e95fd65379b6259d64f5b2f3149560576be58ab8b7816de249', '[\"*\"]', '2023-08-30 22:47:23', '2023-08-30 21:23:12', '2023-08-30 22:47:23'),
(104, 'App\\Models\\User', 53, 'API Token', 'fba25dc962404ca4dee90ce01f16378fc0005fb771ec4ce930963d3558ac466a', '[\"*\"]', NULL, '2023-08-31 22:22:59', '2023-08-31 22:22:59'),
(105, 'App\\Models\\User', 53, 'API Token', 'a9c868e5850ca3e494c6a4e12a27999ac9fb12bffe923790345e26a1a6cfbeaf', '[\"*\"]', '2023-09-01 00:35:22', '2023-08-31 23:34:17', '2023-09-01 00:35:22'),
(106, 'App\\Models\\User', 53, 'API Token', '53df25c8cf3363f1dc6e6d219f893cf0d21e5c1b7b7eac3aff2bf0f6df1b4799', '[\"*\"]', '2023-08-31 23:48:22', '2023-08-31 23:39:47', '2023-08-31 23:48:22'),
(107, 'App\\Models\\User', 55, 'API Token', '8585f6659c6fa9d095c0e2aaa45442f4f3840802d38e7a88cf831bbcd71e0a71', '[\"*\"]', '2023-09-01 00:11:31', '2023-08-31 23:50:20', '2023-09-01 00:11:31'),
(108, 'App\\Models\\User', 53, 'API Token', '3ce66c4f3a3818470df65b1ac8999b1de71f7843e34e0d018e4f48a99896a28b', '[\"*\"]', '2023-09-01 00:16:40', '2023-09-01 00:12:29', '2023-09-01 00:16:40'),
(109, 'App\\Models\\User', 55, 'API Token', '66144b255c5eaca2ca50c9155030917749633cfe4d4f88833c70fb398b548f41', '[\"*\"]', '2023-09-01 00:31:52', '2023-09-01 00:26:18', '2023-09-01 00:31:52'),
(110, 'App\\Models\\User', 53, 'API Token', 'dd43a0af6f9ee288790ef0a4b8549131bfe27672c9ec02b35690971fbed2fcd4', '[\"*\"]', '2023-09-01 00:33:00', '2023-09-01 00:32:52', '2023-09-01 00:33:00'),
(111, 'App\\Models\\User', 55, 'API Token', 'ea7b5929a6b9ebb00a12ef8f2843d569add56a936696176f53aa678523002b80', '[\"*\"]', '2023-09-01 00:33:52', '2023-09-01 00:33:43', '2023-09-01 00:33:52'),
(112, 'App\\Models\\User', 53, 'API Token', '3fbec8edaa3b332479f092354ed4b281441aa642cf3e049c53e08acd27cd31cf', '[\"*\"]', '2023-09-01 06:43:39', '2023-09-01 00:56:21', '2023-09-01 06:43:39'),
(115, 'App\\Models\\User', 53, 'API Token', '56d7a91a2880292dad0f21f31d2ee4151ea441c550c5468cda6c581c04d25272', '[\"*\"]', '2023-09-02 02:33:09', '2023-09-01 15:55:50', '2023-09-02 02:33:09'),
(119, 'App\\Models\\User', 53, 'API Token', 'a5ba66ed5b87846ac156672cebe18b9fcb1798963c56e1cbedc29ae108a7aaf5', '[\"*\"]', '2023-09-01 21:44:17', '2023-09-01 20:40:02', '2023-09-01 21:44:17'),
(124, 'App\\Models\\User', 53, 'API Token', '2f957f167857b0d7ff14f63bd4ae8dff4a7fccf94edee36c48bbe9c8e4317a43', '[\"*\"]', '2023-09-02 00:23:56', '2023-09-02 00:23:07', '2023-09-02 00:23:56'),
(128, 'App\\Models\\User', 53, 'API Token', 'cf1eb7be3632c3908fa38f972ab3f420f43102b7a28ac85e6e6b306ddecd350b', '[\"*\"]', '2023-09-02 00:38:19', '2023-09-02 00:36:08', '2023-09-02 00:38:19'),
(130, 'App\\Models\\User', 56, 'API Token', 'f61ff501431bd751f16073f119cf464c29fd9d32534808b3c603d4a1b65eff21', '[\"*\"]', NULL, '2023-09-02 00:41:28', '2023-09-02 00:41:28'),
(131, 'App\\Models\\User', 56, 'API Token', 'b8a052be8285a30bab0099fe8cc1d67e2bc5ec6d76f63dbe6dff836c171523fa', '[\"*\"]', '2023-09-02 00:44:07', '2023-09-02 00:42:06', '2023-09-02 00:44:07'),
(132, 'App\\Models\\User', 53, 'API Token', 'fdb99e34c53510c0603f8f0de9dd8a27ad15268939083edecefbffd0a31272a6', '[\"*\"]', '2023-09-02 00:49:00', '2023-09-02 00:48:50', '2023-09-02 00:49:00'),
(135, 'App\\Models\\User', 57, 'API Token', '2e958a9b070c833bd91b0ebd8ca7ef64e882be52111b05a6494afed954d32650', '[\"*\"]', NULL, '2023-09-02 01:07:30', '2023-09-02 01:07:30'),
(136, 'App\\Models\\User', 57, 'API Token', '34c8dbe96a44d33c9e6f1484eaf8a1161da1e2cd467b85c35118756b5585e315', '[\"*\"]', '2023-09-02 01:11:43', '2023-09-02 01:07:53', '2023-09-02 01:11:43'),
(138, 'App\\Models\\User', 58, 'API Token', 'e5c52f60ed84cbd8b015134b74a609483907b16c5287101ae5d96f68e38bc957', '[\"*\"]', NULL, '2023-09-02 01:17:09', '2023-09-02 01:17:09'),
(139, 'App\\Models\\User', 58, 'API Token', '7433ffc4c5a0c66c17cd855764610260402f2ead2b15c845840b3637383a37a7', '[\"*\"]', '2023-09-02 01:20:29', '2023-09-02 01:17:44', '2023-09-02 01:20:29'),
(141, 'App\\Models\\User', 53, 'API Token', '22ef52f33dc98352fbadc1c1a5dd409c2df6321b6d04db592d019bfc481866f8', '[\"*\"]', NULL, '2023-09-02 01:31:03', '2023-09-02 01:31:03'),
(143, 'App\\Models\\User', 53, 'API Token', '4375f7276b16ebbaec659e208b12d76e1c603d7f733743b15b3eefd5c491090d', '[\"*\"]', '2023-09-02 02:20:21', '2023-09-02 02:18:47', '2023-09-02 02:20:21'),
(145, 'App\\Models\\User', 53, 'API Token', 'adac80608000f2621a44c713795a55f4979be316130b306b80a624782d05a458', '[\"*\"]', NULL, '2023-09-02 03:42:39', '2023-09-02 03:42:39'),
(146, 'App\\Models\\User', 53, 'API Token', 'bb67449d5deb476af21fc33eacaf937ff81ddc877d6cce9540dc3104f5200f3c', '[\"*\"]', NULL, '2023-09-02 03:47:15', '2023-09-02 03:47:15'),
(147, 'App\\Models\\User', 53, 'API Token', '80da24ee05a00819b792240981c2b7a8548ff891dda9289fec8202b80fe33a01', '[\"*\"]', NULL, '2023-09-02 03:56:11', '2023-09-02 03:56:11'),
(148, 'App\\Models\\User', 53, 'API Token', '4fc12c0a336850c7ef4e0685f663d98d90ee539e416999ce245615f2b0955693', '[\"*\"]', NULL, '2023-09-02 03:58:09', '2023-09-02 03:58:09'),
(171, 'App\\Models\\User', 59, 'API Token', '1ae617940cf30ff33f755e9b275dc768ffee31512f8b7b6558835713e3b194aa', '[\"*\"]', '2023-09-08 19:54:08', '2023-09-08 19:33:58', '2023-09-08 19:54:08'),
(177, 'App\\Models\\User', 60, 'API Token', '4f85c44c3ecee04473732e9f78fb337e72007593a3817de1a41b267a182fc512', '[\"*\"]', '2023-09-13 20:48:41', '2023-09-13 20:27:40', '2023-09-13 20:48:41'),
(178, 'App\\Models\\User', 53, 'API Token', '622eece31735b726ab80c7066412de63a7c611020911744f0f6dae12569080b1', '[\"*\"]', '2023-09-19 04:18:38', '2023-09-13 20:32:04', '2023-09-19 04:18:38'),
(180, 'App\\Models\\User', 60, 'API Token', '373d836467d7a6821d933a0fe3f80e5107621454a79880cd4a89a8c031f1a128', '[\"*\"]', NULL, '2023-09-14 14:43:26', '2023-09-14 14:43:26'),
(193, 'App\\Models\\User', 53, 'API Token', 'd511a6fc8f499d87bb5752e9f5e0663e73a14ba2d0eec45efa431b05b1666f68', '[\"*\"]', '2023-09-19 04:51:47', '2023-09-19 04:47:14', '2023-09-19 04:51:47'),
(194, 'App\\Models\\User', 53, 'API Token', '0de86f628454970a0a3585e56b5b2fb775b4e9341f9dbe3e3c3e06305412437c', '[\"*\"]', '2023-09-20 02:25:35', '2023-09-19 05:04:22', '2023-09-20 02:25:35'),
(195, 'App\\Models\\User', 53, 'API Token', '32ac80e68a33b973a303458e432b7d383926a759d379aa777f91120dcc96a916', '[\"*\"]', NULL, '2023-09-20 00:37:35', '2023-09-20 00:37:35'),
(196, 'App\\Models\\User', 53, 'API Token', '2c1688faa38fd4293f8317140c8d2d895699c1a096d52980a9458e26133b1976', '[\"*\"]', '2023-09-24 15:16:28', '2023-09-20 02:34:03', '2023-09-24 15:16:28'),
(197, 'App\\Models\\User', 53, 'API Token', '18ebd65d3aa63fc12a8776e1e754c36cd6da049ba8c6543b96348360d58dfa53', '[\"*\"]', '2023-09-25 21:55:26', '2023-09-20 02:34:53', '2023-09-25 21:55:26'),
(198, 'App\\Models\\User', 61, 'API Token', 'f4a0f20bb62330ad8a263dc90dc7f42f1ec93b0341bfdbc3a553a35a0ee7b480', '[\"*\"]', NULL, '2023-09-22 18:50:17', '2023-09-22 18:50:17'),
(199, 'App\\Models\\User', 61, 'API Token', '7cb2d58a8b2d651b3a5208f947559628fc8d00622b8be38a989d5823a1f994ff', '[\"*\"]', '2023-09-22 19:00:38', '2023-09-22 18:50:42', '2023-09-22 19:00:38'),
(203, 'App\\Models\\User', 53, 'API Token', '7a9c4ce2f62dbcf9d69c4fb7b45b5e6e8a5a9a340242490b0e8cb06db25c7ad1', '[\"*\"]', '2023-09-27 21:14:05', '2023-09-27 21:12:39', '2023-09-27 21:14:05'),
(204, 'App\\Models\\User', 53, 'API Token', '38add464f835daa1b16d7b2a18f140841e701db209a60e3b8bbcee249f26516e', '[\"*\"]', NULL, '2023-09-27 21:18:41', '2023-09-27 21:18:41'),
(205, 'App\\Models\\User', 54, 'API Token', 'bc049ab94ebbad29bf7fae440c1ecb07414a2510d2735a57e4c31de72add62da', '[\"*\"]', '2023-10-02 21:55:53', '2023-10-02 15:31:49', '2023-10-02 21:55:53'),
(206, 'App\\Models\\User', 53, 'API Token', '177f21d96871c3a808c9a040fd4b9c01b3fe208ca8ae5fcb772398d55b1a1ed9', '[\"*\"]', '2023-10-02 16:31:16', '2023-10-02 15:52:06', '2023-10-02 16:31:16'),
(207, 'App\\Models\\User', 53, 'API Token', '5d776300d07d4a465e59fc498a09d57739cbee96c7a492c12462a8a551463045', '[\"*\"]', NULL, '2023-10-02 16:49:22', '2023-10-02 16:49:22'),
(208, 'App\\Models\\User', 53, 'API Token', 'd07730351a7e8fa222f10a3f0ab895b59ec2d3050896b9f14e30dae565660d2f', '[\"*\"]', NULL, '2023-10-02 18:03:35', '2023-10-02 18:03:35'),
(209, 'App\\Models\\User', 53, 'API Token', '6786c95ed9687ca7a9aea1fe5a3b6fb19e0354955ad26b761b30434657917ea6', '[\"*\"]', '2023-10-02 19:10:44', '2023-10-02 19:10:34', '2023-10-02 19:10:44'),
(210, 'App\\Models\\User', 54, 'API Token', '299d629cc3234aa2020b4a61d2daefcd080b354013ed42f77903cf829af80353', '[\"*\"]', '2023-10-02 22:53:29', '2023-10-02 19:30:19', '2023-10-02 22:53:29'),
(211, 'App\\Models\\User', 53, 'API Token', '030124a3fcc074e2551cee079eda350cedb25985f4ff765e8ed5a17c518504fc', '[\"*\"]', NULL, '2023-10-02 20:49:06', '2023-10-02 20:49:06'),
(212, 'App\\Models\\User', 53, 'API Token', '558b596d375196d962fc8ce9a6a23f368b68956ddcb941fae02b6fe24d201875', '[\"*\"]', NULL, '2023-10-02 22:48:02', '2023-10-02 22:48:02'),
(213, 'App\\Models\\User', 53, 'API Token', '623df6ab6e56ecc3b709058d7cccc01109dddf3f7e8bb7a19ab6c7c5e7bc9a94', '[\"*\"]', '2023-10-02 23:04:43', '2023-10-02 23:04:34', '2023-10-02 23:04:43'),
(214, 'App\\Models\\User', 54, 'API Token', 'adb5207d76b6a5d8cf900eb6ad3c97b3f50c9490086978a6b30a10a44df5321a', '[\"*\"]', '2023-10-03 13:55:17', '2023-10-03 13:55:02', '2023-10-03 13:55:17'),
(215, 'App\\Models\\User', 53, 'API Token', '0e4d12e5227602043740ca8e06ae179bcfdbba6ba59f722e1303b8f6017b7ae6', '[\"*\"]', '2023-10-03 14:48:33', '2023-10-03 14:48:14', '2023-10-03 14:48:33'),
(216, 'App\\Models\\User', 53, 'API Token', '5661a742eaf6167c387f654033f2905cd0721cfd8453d5a9caf0362aa0b37c23', '[\"*\"]', NULL, '2023-10-03 14:50:11', '2023-10-03 14:50:11');

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(10) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '1: Active, 0: InActive',
  `safe_state` tinyint(2) NOT NULL COMMENT '1:Online, 0:Ofline',
  `subscription_status` tinyint(2) NOT NULL COMMENT '1: Active, 0: Expired',
  `main_user_id` tinyint(11) DEFAULT NULL,
  `user_assosiation_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `serial_number`, `address`, `city`, `state`, `postal_code`, `status`, `safe_state`, `subscription_status`, `main_user_id`, `user_assosiation_date`, `created_at`, `updated_at`) VALUES
(1, 'Safe one o one', 'sa-1693440000', 'address-4343', 'Eden', 'GA', '31307', 0, 1, 0, NULL, NULL, '2023-08-31 17:02:38', '2023-09-07 15:10:24'),
(2, 'Manual Safe', 'sa-1693526400', 'address-1', 'Eden', 'GA', '31307', 1, 0, 0, NULL, NULL, '2023-09-01 15:54:58', '2023-09-07 14:52:57'),
(3, 'Jermaine Spencer', 'Je-1693526400', 'Et harum dolores deb', 'Amet dolor totam bl', '546456', '29', 1, 1, 1, NULL, NULL, '2023-09-01 17:55:30', '2023-09-07 14:53:00'),
(4, 'Kathleen Gay', 'Ka-1693526400', 'Dolorum elit dolori', 'Consectetur iure in', '2000', '46', 1, 0, 1, NULL, NULL, '2023-09-01 17:56:15', '2023-09-01 18:18:02'),
(5, 'Germaine Chase', 'Ge-1693526400', 'Animi in quo dolore', 'Aut dolorum qui id', '16', '80', 1, 1, 1, NULL, NULL, '2023-09-01 18:16:20', '2023-09-01 18:16:20'),
(6, 'Kaseem Brennan', 'Ka-1693526400', 'Et tenetur tempora m', 'Consequuntur eos au', '100', '53', 0, 1, 0, NULL, NULL, '2023-09-01 18:22:11', '2023-09-01 18:22:11'),
(7, 'Nehru Donaldson', 'Ne-1693526400', 'Voluptate incidunt', 'Sed sit esse eum q', '50', '52', 1, 0, 1, NULL, NULL, '2023-09-01 18:48:01', '2023-09-01 18:48:01'),
(8, 'Malik Leblanc', 'Ma-1693526400', 'Praesentium ut tempo', 'Est voluptate volupt', '3', '31', 1, 0, 0, NULL, NULL, '2023-09-01 18:48:55', '2023-09-01 18:48:55'),
(9, 'safe testing', 'sa-1693526400', 'Testing Address', 'City', '12321', '2222', 1, 0, 1, NULL, NULL, '2023-09-01 21:34:04', '2023-09-01 21:34:30'),
(10, 'Martin', 'Ma-1693526400', 'Test1', 'Maiores doloribus un', '34', '234', 1, 0, 0, NULL, NULL, '2023-09-01 21:43:26', '2023-09-01 21:43:26'),
(11, 'NewSafeReact', 'Ne-1693526400', 'sadsad', 'asdsad', '322', '23213', 1, 1, 1, NULL, NULL, '2023-09-02 00:18:59', '2023-09-02 00:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_type` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `heading`, `content`, `file`, `file_type`, `created_at`, `updated_at`) VALUES
(1, 'Testing 23', 'this is my content', NULL, NULL, '2023-10-02 19:31:25', '2023-10-02 19:35:58'),
(2, 'Testing', 'this is my content', NULL, NULL, '2023-10-02 19:35:47', '2023-10-02 19:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_code` int(5) DEFAULT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `forgot_password_code` int(11) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_role` int(11) DEFAULT 2,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `address_1`, `address_2`, `city`, `postal_code`, `country`, `email_code`, `email_verified_at`, `mobile_code`, `mobile_verified_at`, `password`, `forgot_password_code`, `remember_token`, `user_role`, `status`, `created_at`, `updated_at`) VALUES
(53, 'martin', 'martingarix7878@gmail.com', '+122222222222', 'add 1', 'add 2', 'test', '123434', 'test', '17689', '2023-08-21 15:15:26', 34801, '2023-08-21 15:14:25', '$2y$10$4ugkNWXze.bf9PVVEyLAZuLLSlaHmtBwTqe1PJGG0cBNnwL/1sfGq', 41079, NULL, 2, 0, '2023-08-21 15:09:04', '2023-10-02 15:56:52'),
(54, 'martin', 'parcelsafe@gmail.com', '22222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xAE/6yrflDHjMoCbrJqxyuaFbjvvEEFpQCBKHqbsKETTvsAflPBpa', NULL, NULL, 1, 1, NULL, '2023-09-14 14:55:16'),
(55, 'william', 'william@gmail.com', '+187867878787', 'add', 'asASASA', 'no', '76767', 'United States', '85126', NULL, 12697, NULL, '$2y$10$1Bt0YjjqiFtnesBONdVf2e4su8vUN3yeQRju2yGaolhhAUXw.MOWO', NULL, NULL, 2, 0, '2023-08-29 22:04:09', '2023-09-15 16:43:28'),
(56, 'Test Test', 'test33@gmail.com', '+13377364333', 'add...', NULL, 'test', '000000', 'United States', '96715', NULL, NULL, NULL, '$2y$10$TzdOh4waGZSssBQssplm6.//HIm5uOtAzXAPGxEixuIIf.fjmrhUK', NULL, NULL, 2, 1, '2023-09-02 00:41:28', '2023-09-02 00:44:07'),
(57, 'Test 2', 'test22@gmail.com', '+1 76576596665', 'add....', 'Add.... 2', 'test ....', '000000', 'United States', NULL, NULL, NULL, NULL, '$2y$10$DrgRN6RO0CCdZ/t6nwlPUe0frsw0F2./XJpHic9RzsO/NJggahlbe', NULL, NULL, 2, 1, '2023-09-02 01:07:30', '2023-09-02 01:10:50'),
(58, 'Test 2', 'test2@gmail.com', '+100008656569', 'add..........', 'Add 2.....', 'Test....', '99996', 'United States', NULL, NULL, NULL, NULL, '$2y$10$/zmiabypVpfr10FfX.e71epJiT6tO4TyLhxorPCu3Uu7bsvErG3.G', NULL, NULL, 2, 0, '2023-09-02 01:17:09', '2023-09-15 16:43:37'),
(59, 'jhontest', 'jhon7878@gmail.com', '122143434', 'add 1', 'add 2', 'testcity', '123434', 'testcountry', NULL, NULL, NULL, NULL, '$2y$10$EPbi3HmrIsgntGSXWpc/9eKsXN5na7gkiSxUrmh5gB7zYJoKeshG2', NULL, NULL, 2, 1, '2023-09-07 16:58:43', '2023-09-08 19:34:19'),
(60, 'ssss', 'jhons7878@gmail.com', '122143434', 'add 1', 'add 2', 'testcity', 'asdasd', 'testcountry', NULL, NULL, NULL, NULL, '$2y$10$ZxIUF0hkyn3woD01WxQiTen1R8sq5YIkJXU8cLCTFMOPc104.fWtu', NULL, NULL, 2, 1, '2023-09-13 20:27:40', '2023-09-14 15:01:13'),
(61, 'Kevin Zerman', 'Zerman@att.net', '+12623093738', '3732 S Madison Ave', NULL, 'Tulsa', '74105', 'United States', NULL, NULL, NULL, NULL, '$2y$10$kepbP0CnA3EaRGGgMPTZdO1OsrVS8oVNITYt.D/A/H3WLMsC/3bce', NULL, NULL, 2, 1, '2023-09-22 18:50:17', '2023-09-22 18:50:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `count`
--
ALTER TABLE `count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_type`
--
ALTER TABLE `issue_type`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
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
-- AUTO_INCREMENT for table `count`
--
ALTER TABLE `count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `issue_type`
--
ALTER TABLE `issue_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `safes`
--
ALTER TABLE `safes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
