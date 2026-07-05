-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 05, 2026 at 04:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eticketing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(14, 7, 'Membuat Tiket', 'Anda membuat tiket keluhan: air mati', '2026-07-01 08:53:42', '2026-07-01 08:53:42'),
(16, 1, 'Membuat Tiket', 'Anda membuat tiket keluhan: tes', '2026-07-02 23:56:56', '2026-07-02 23:56:56'),
(18, 1, 'Tiket Masuk', 'Tiket keluhan baru dibuat oleh Budi Pelapor: ttes', '2026-07-02 23:57:51', '2026-07-02 23:57:51'),
(19, 1, 'Membuat Tiket', 'Anda membuat tiket keluhan: tes', '2026-07-03 00:29:58', '2026-07-03 00:29:58'),
(22, 1, 'Status Berubah', 'Helpdesk (Helpdesk Jaringan) mengubah status tiket \'jaringan wifi lambat\' menjadi CLOSED', '2026-07-03 01:00:44', '2026-07-03 01:00:44'),
(24, 1, 'Tiket Masuk', 'Tiket keluhan baru dibuat oleh Budi Pelapor: Internet mati', '2026-07-03 06:32:36', '2026-07-03 06:32:36'),
(25, 3, 'Membuat Tiket', 'Anda membuat tiket keluhan: tes', '2026-07-04 06:12:32', '2026-07-04 06:12:32'),
(26, 1, 'Tiket Masuk', 'Tiket keluhan baru dibuat oleh Budi Pelapor: tes', '2026-07-04 06:12:32', '2026-07-04 06:12:32'),
(27, 1, 'Assign Tiket', 'Anda menugaskan tiket \'tes\' kepada Tim Support', '2026-07-04 06:27:21', '2026-07-04 06:27:21'),
(28, 2, 'Tugas Baru', 'Anda ditugaskan oleh Admin untuk tiket: tes', '2026-07-04 06:27:21', '2026-07-04 06:27:21'),
(29, 3, 'Tiket Diproses', 'Tiket \'tes\' Anda ditugaskan kepada Tim Support', '2026-07-04 06:27:21', '2026-07-04 06:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_27_164650_create_tickets_table', 1),
(5, '2026_06_27_164701_create_ticket_histories_table', 1),
(6, '2026_06_27_164709_create_ticket_comments_table', 1),
(7, '2026_06_27_165247_create_personal_access_tokens_table', 2),
(8, '2026_07_01_050053_add_hidden_flags_to_tickets_table', 3),
(9, '2026_07_01_142237_create_notifications_table', 4),
(10, '2026_07_01_142258_create_activity_logs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `ticket_id`, `title`, `message`, `created_at`, `updated_at`) VALUES
(14, 1, 2, 'Tiket Baru!', 'Ada tiket masuk dari Budi Pelapor yang butuh penanganan.', '2026-07-04 06:12:32', '2026-07-04 06:12:32'),
(15, 2, 2, 'Tugas Baru!', 'Anda ditugaskan menangani tiket: tes.', '2026-07-04 06:27:21', '2026-07-04 06:27:21'),
(16, 3, 2, 'Tiket Anda Mulai Diproses', 'Tiket Anda telah ditugaskan dan akan ditangani oleh Tim Support.', '2026-07-04 06:27:21', '2026-07-04 06:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'fb5a3cd1ec602219f3a1406b891ec8992db7a4b42f5af68f5ccfcb98cd059abf', '[\"*\"]', '2026-06-27 22:09:26', NULL, '2026-06-27 22:09:25', '2026-06-27 22:09:26'),
(2, 'App\\Models\\User', 2, 'auth_token', '1e4a0c465c8c2fce8cca86fa5b2230b145f51d15b31ce3b54e20d055d76a88d7', '[\"*\"]', NULL, NULL, '2026-06-27 22:10:30', '2026-06-27 22:10:30'),
(3, 'App\\Models\\User', 3, 'auth_token', 'c31d737e27fba60f6123ed3132f02187516552f5da5a6aff6239ef994b3f1498', '[\"*\"]', NULL, NULL, '2026-06-27 22:11:02', '2026-06-27 22:11:02'),
(4, 'App\\Models\\User', 1, 'auth_token', 'e70a36b9d4f9e130ac129ab8abbe051848a58e455faee49cea588dce7779dae6', '[\"*\"]', '2026-06-29 07:15:29', NULL, '2026-06-29 07:15:29', '2026-06-29 07:15:29'),
(5, 'App\\Models\\User', 2, 'auth_token', '5734f1b5389d8f9a43fc3e93ff0f70ef19632c9b4b8e713e46285a688bdc572f', '[\"*\"]', NULL, NULL, '2026-06-29 07:16:42', '2026-06-29 07:16:42'),
(6, 'App\\Models\\User', 3, 'auth_token', '43acfafe3b691c8ffb2a15a15d93a46b4c5bba9936e823258281336dc02b9c57', '[\"*\"]', NULL, NULL, '2026-06-29 07:17:49', '2026-06-29 07:17:49'),
(7, 'App\\Models\\User', 1, 'auth_token', 'f56ad9a20045ef45cd4a7cf7b68250ea2884e042d5a2d7eccf92465d836a63a1', '[\"*\"]', NULL, NULL, '2026-06-29 07:19:35', '2026-06-29 07:19:35'),
(8, 'App\\Models\\User', 2, 'auth_token', '7794159d0333bc1dae0eb84bc5f09a86a13176bb6484afd576bf2e96c04eced4', '[\"*\"]', NULL, NULL, '2026-06-29 07:22:23', '2026-06-29 07:22:23'),
(9, 'App\\Models\\User', 2, 'auth_token', '2ae4a993181d66261c7fba6fca01742bd6a384490d320947151396defa848300', '[\"*\"]', NULL, NULL, '2026-06-29 07:32:43', '2026-06-29 07:32:43'),
(10, 'App\\Models\\User', 3, 'auth_token', 'd440c5cb9c4ea318b5237bda91b134186db2ef79d163ed0ac0db4cc6c42e2e21', '[\"*\"]', NULL, NULL, '2026-06-29 07:42:11', '2026-06-29 07:42:11'),
(11, 'App\\Models\\User', 2, 'auth_token', 'd13cab9dc63d1a2ec9c4a047bc392ce8e4309d94e33ce62af934b81500a291e8', '[\"*\"]', '2026-06-29 07:54:54', NULL, '2026-06-29 07:54:53', '2026-06-29 07:54:54'),
(12, 'App\\Models\\User', 3, 'auth_token', 'f887fc0e76fee3818d7617ab6b4da470fce5c6341dd66548ce260efce091ecf1', '[\"*\"]', '2026-06-29 07:55:55', NULL, '2026-06-29 07:55:54', '2026-06-29 07:55:55'),
(13, 'App\\Models\\User', 1, 'auth_token', '00858a51896691ea5b434f34979f7c6f872c376aaebf597944f374558fde7d6f', '[\"*\"]', '2026-06-29 08:01:02', NULL, '2026-06-29 07:57:09', '2026-06-29 08:01:02'),
(14, 'App\\Models\\User', 3, 'auth_token', '4d66f6bfff693e52e0353ae81c432107c3e840a255a801be9e3413571fcf0ce5', '[\"*\"]', '2026-06-29 08:02:06', NULL, '2026-06-29 08:02:04', '2026-06-29 08:02:06'),
(15, 'App\\Models\\User', 1, 'auth_token', '6ce65427bd0f72fcca7301fcc45fdb9d1c8c528b6df57e32a82c093c5e0d8eef', '[\"*\"]', '2026-06-29 08:03:06', NULL, '2026-06-29 08:03:04', '2026-06-29 08:03:06'),
(16, 'App\\Models\\User', 4, 'auth_token', 'b001de3a458139fb5ef685a6cc043db9eb0a56817cf99f94a6f0441efbd9642a', '[\"*\"]', '2026-06-29 11:26:43', NULL, '2026-06-29 11:26:41', '2026-06-29 11:26:43'),
(17, 'App\\Models\\User', 5, 'auth_token', '133ac3173f4acf60be7a3e7e71f5a6dcf0c233d23ac81fcd190d6aff3c759872', '[\"*\"]', '2026-06-29 11:44:10', NULL, '2026-06-29 11:44:08', '2026-06-29 11:44:10'),
(18, 'App\\Models\\User', 1, 'auth_token', 'ccdd54de1e468077f265d91dc7650444d6d99f920ca6571733d8b50ae6ca19bc', '[\"*\"]', '2026-06-29 11:45:00', NULL, '2026-06-29 11:44:59', '2026-06-29 11:45:00'),
(19, 'App\\Models\\User', 3, 'auth_token', '16a36ccc67b82ac0eac9165ca05cd164a7bb3e08d83af9a44b5d11b91ff35ce3', '[\"*\"]', '2026-06-29 22:43:49', NULL, '2026-06-29 22:24:15', '2026-06-29 22:43:49'),
(20, 'App\\Models\\User', 1, 'auth_token', '870dc67cf4d5954c62148b4b7f834034e37ec4c883c23508736d1ffe5942b847', '[\"*\"]', '2026-06-29 22:44:29', NULL, '2026-06-29 22:44:28', '2026-06-29 22:44:29'),
(21, 'App\\Models\\User', 4, 'auth_token', '86b1acefcd5c2343c951765e84300a519c783a27a4a8c7af2da93b57ac049285', '[\"*\"]', '2026-06-29 22:45:16', NULL, '2026-06-29 22:44:53', '2026-06-29 22:45:16'),
(22, 'App\\Models\\User', 2, 'auth_token', '76ee558e7503576367097820e01224b096fbcb71b3d795e9482364bc854370f3', '[\"*\"]', '2026-06-29 22:45:46', NULL, '2026-06-29 22:45:46', '2026-06-29 22:45:46'),
(23, 'App\\Models\\User', 1, 'auth_token', '9993a65aa7d5a0af0a7f1987b3d12f24722bbe34003198df4c57c737a700dde4', '[\"*\"]', '2026-06-29 22:46:27', NULL, '2026-06-29 22:46:26', '2026-06-29 22:46:27'),
(24, 'App\\Models\\User', 3, 'auth_token', '670c771956b0847fb7ecd2dea4f64641a1faa5a53f44665a8ba208bf6963599d', '[\"*\"]', '2026-06-29 22:46:52', NULL, '2026-06-29 22:46:51', '2026-06-29 22:46:52'),
(25, 'App\\Models\\User', 1, 'auth_token', '09e31db124e4d3d643ad1235d1d836d8d1159986358160bfe46efd4535206811', '[\"*\"]', '2026-06-29 23:06:31', NULL, '2026-06-29 23:06:29', '2026-06-29 23:06:31'),
(26, 'App\\Models\\User', 3, 'auth_token', 'b9d362ab293dd7cc880f826484126405db4b638594f020dfea73477c31cd8fa6', '[\"*\"]', '2026-06-30 03:00:04', NULL, '2026-06-30 02:59:24', '2026-06-30 03:00:04'),
(27, 'App\\Models\\User', 1, 'auth_token', 'f558d02df800fbd317cc76b7b5861c133e999fc7d1f7e8e7eb6bc18b90264280', '[\"*\"]', '2026-06-30 03:03:45', NULL, '2026-06-30 03:01:08', '2026-06-30 03:03:45'),
(28, 'App\\Models\\User', 2, 'auth_token', '90b1d7611eda6b1b554f7687ec9de09043506180ee9d4780ba2bbdfa991c026e', '[\"*\"]', '2026-06-30 03:11:25', NULL, '2026-06-30 03:04:24', '2026-06-30 03:11:25'),
(29, 'App\\Models\\User', 1, 'auth_token', 'a894928f4c5f34c9c70654d50862b2509f0379674f18955bdd9f2c3aaebecf85', '[\"*\"]', '2026-06-30 03:22:46', NULL, '2026-06-30 03:11:47', '2026-06-30 03:22:46'),
(30, 'App\\Models\\User', 3, 'auth_token', '66debdc2d5e7dd0354bb10f4f134709920fe7b0c412d1b9a10c52e6ca19a672e', '[\"*\"]', '2026-06-30 07:06:01', NULL, '2026-06-30 03:24:52', '2026-06-30 07:06:01'),
(31, 'App\\Models\\User', 3, 'auth_token', 'fee6bc4d9282694bbbb91966d67037f81b5a7e34cd80d9bf9a808aca625085ec', '[\"*\"]', '2026-06-30 07:42:07', NULL, '2026-06-30 07:08:19', '2026-06-30 07:42:07'),
(32, 'App\\Models\\User', 3, 'auth_token', '1c69655eb3f82430057efeda6f3ca6ec2901b0f0b6927412efdf55fb732c2127', '[\"*\"]', '2026-06-30 07:50:45', NULL, '2026-06-30 07:50:07', '2026-06-30 07:50:45'),
(33, 'App\\Models\\User', 2, 'auth_token', 'dc26458d036b705411817ffc5fc750941ee7193c7ac5f2f5c291cd73a20a5c13', '[\"*\"]', '2026-06-30 07:52:35', NULL, '2026-06-30 07:51:58', '2026-06-30 07:52:35'),
(34, 'App\\Models\\User', 3, 'auth_token', '04b83a8fc58ce5b1c7913f2d2173b9aa86532d40b5f418d5e09b9dc6f976188a', '[\"*\"]', '2026-06-30 07:58:43', NULL, '2026-06-30 07:57:48', '2026-06-30 07:58:43'),
(35, 'App\\Models\\User', 1, 'auth_token', '7eb65f86e8408ff1343c18f7d034dc2e854a15fb9753a65cd2bfcfaf4e0f4d59', '[\"*\"]', '2026-06-30 07:59:33', NULL, '2026-06-30 07:59:07', '2026-06-30 07:59:33'),
(36, 'App\\Models\\User', 2, 'auth_token', 'a089df75c678a8ed5dc1baeeaab6feb050d236b8d52bb3c52eb38503d726a657', '[\"*\"]', '2026-06-30 08:02:26', NULL, '2026-06-30 08:00:26', '2026-06-30 08:02:26'),
(37, 'App\\Models\\User', 4, 'auth_token', '67de2de6074be87d7573334cf5919c1368dca528560ef259c29ecead8703c50a', '[\"*\"]', '2026-06-30 21:25:20', NULL, '2026-06-30 21:25:19', '2026-06-30 21:25:20'),
(38, 'App\\Models\\User', 1, 'auth_token', 'cf22d280697a00e3c12e3f7a852eb556abc55c2b94713e3b81641686af5ba7d7', '[\"*\"]', '2026-06-30 21:26:55', NULL, '2026-06-30 21:26:40', '2026-06-30 21:26:55'),
(39, 'App\\Models\\User', 3, 'auth_token', '347e36f28343b069f299c98e31549c9fb6bbc733d564d0217031d51081850e01', '[\"*\"]', '2026-06-30 21:30:25', NULL, '2026-06-30 21:27:54', '2026-06-30 21:30:25'),
(40, 'App\\Models\\User', 1, 'auth_token', 'bcd53e77ed107662ff4b0edb8d9f18b5e79c277bfdab6a82a06fcd35c1b46840', '[\"*\"]', '2026-06-30 21:32:23', NULL, '2026-06-30 21:31:51', '2026-06-30 21:32:23'),
(41, 'App\\Models\\User', 4, 'auth_token', '4f1210271bd256fe47da4f1889537d626bd4ee5839e3f6f804762af322d96600', '[\"*\"]', '2026-06-30 21:40:35', NULL, '2026-06-30 21:32:44', '2026-06-30 21:40:35'),
(42, 'App\\Models\\User', 3, 'auth_token', 'bf70981b1bb153c9a22765791c7ca94a76f9957f93277a85e190f19f232ab2f0', '[\"*\"]', '2026-06-30 21:41:47', NULL, '2026-06-30 21:41:10', '2026-06-30 21:41:47'),
(43, 'App\\Models\\User', 1, 'auth_token', 'f8af70c0a603e0cf78a3675f046c13ad64baff5bab98eceb1ce15886b0ad3d78', '[\"*\"]', '2026-06-30 21:42:04', NULL, '2026-06-30 21:42:02', '2026-06-30 21:42:04'),
(44, 'App\\Models\\User', 4, 'auth_token', 'a8a5030b62ceaca0da6cb02cbd06ff635d0fbdc421f79dfd6c89b7d6dd526c02', '[\"*\"]', '2026-06-30 22:05:50', NULL, '2026-06-30 21:46:07', '2026-06-30 22:05:50'),
(45, 'App\\Models\\User', 1, 'auth_token', '84714727d45ef007a419c0430bbf93ff0452d2c1200c3d72628d2807ab8a9e0d', '[\"*\"]', '2026-06-30 22:06:30', NULL, '2026-06-30 22:06:22', '2026-06-30 22:06:30'),
(46, 'App\\Models\\User', 3, 'auth_token', '2a5f754dba4aa0746530685e02e992ee396e4bb114620c6e94d664275a53553d', '[\"*\"]', '2026-06-30 22:08:20', NULL, '2026-06-30 22:06:58', '2026-06-30 22:08:20'),
(47, 'App\\Models\\User', 1, 'auth_token', '15396b68367e641820fd5027adc8ddc7116f25ea0f2ee0132d0770df057d20d8', '[\"*\"]', '2026-06-30 22:08:53', NULL, '2026-06-30 22:08:37', '2026-06-30 22:08:53'),
(48, 'App\\Models\\User', 2, 'auth_token', '67cba4760147e3b250d9c91fbfbea67d2be12f7cf8330d0a4becfa9467da0029', '[\"*\"]', '2026-06-30 22:09:38', NULL, '2026-06-30 22:09:26', '2026-06-30 22:09:38'),
(49, 'App\\Models\\User', 3, 'auth_token', 'a213604a07fe8f3fc273b604f3472eccc09f944ec23fdd8c6402bc34f645b3a5', '[\"*\"]', '2026-06-30 22:18:39', NULL, '2026-06-30 22:09:56', '2026-06-30 22:18:39'),
(50, 'App\\Models\\User', 3, 'auth_token', 'ca9161568810004ca5ba34c746d26b0e57cf326e55b4674cfc622256edf48913', '[\"*\"]', '2026-06-30 22:26:45', NULL, '2026-06-30 22:25:36', '2026-06-30 22:26:45'),
(51, 'App\\Models\\User', 3, 'auth_token', '0e24eff4d30a92fd946b3fb10f99c799200edab4db19954e24ca946d336cfe6f', '[\"*\"]', '2026-06-30 22:38:23', NULL, '2026-06-30 22:37:15', '2026-06-30 22:38:23'),
(52, 'App\\Models\\User', 1, 'auth_token', 'c7710a80f202c4ada6e4c18d74f14a5dbb7bb43623fe96bc42ebed11d9d4be2f', '[\"*\"]', '2026-07-01 06:54:39', NULL, '2026-07-01 06:53:02', '2026-07-01 06:54:39'),
(53, 'App\\Models\\User', 3, 'auth_token', '8477b0e71185c42afdef0caebdb96c8530576e7a95b3482c80ceb576c30a4bed', '[\"*\"]', '2026-07-01 06:55:14', NULL, '2026-07-01 06:54:55', '2026-07-01 06:55:14'),
(54, 'App\\Models\\User', 1, 'auth_token', 'a11acc58838215532db9d527ec9abc59e1687ba8777461e3b1fbb2e4c03dd634', '[\"*\"]', '2026-07-01 07:39:21', NULL, '2026-07-01 06:55:43', '2026-07-01 07:39:21'),
(55, 'App\\Models\\User', 3, 'auth_token', '8da84237d4f6705fcfdffdce1df675b8247b8eede8973ae4b9c242c632d9ddd8', '[\"*\"]', '2026-07-01 07:40:12', NULL, '2026-07-01 07:39:53', '2026-07-01 07:40:12'),
(56, 'App\\Models\\User', 3, 'auth_token', '7c69243177c4737d0641e196f60dc57c4585c2987192c5eafc6a026495cb020e', '[\"*\"]', '2026-07-01 07:42:42', NULL, '2026-07-01 07:41:25', '2026-07-01 07:42:42'),
(57, 'App\\Models\\User', 3, 'auth_token', '42c9386d57aa45b8963648fa35ded170f7a5815a0b5ef7179d5f05914ad36bff', '[\"*\"]', '2026-07-01 08:01:44', NULL, '2026-07-01 08:00:27', '2026-07-01 08:01:44'),
(58, 'App\\Models\\User', 3, 'auth_token', '0d49df1675fc324210573952de9ca6a75d308987bdb4114ac130f0952a038f71', '[\"*\"]', '2026-07-01 08:06:44', NULL, '2026-07-01 08:05:12', '2026-07-01 08:06:44'),
(59, 'App\\Models\\User', 3, 'auth_token', '7aaef920d5d2d505b5d562ffcd1f5201f2f0f9cb932812f4d37e842c3bb90370', '[\"*\"]', '2026-07-01 08:15:10', NULL, '2026-07-01 08:13:45', '2026-07-01 08:15:10'),
(60, 'App\\Models\\User', 1, 'auth_token', '0ce7a2da2e05fd7cb242a648cf39f3b9180634ab69c0f2091a5ff7bb2172ac3a', '[\"*\"]', '2026-07-01 08:17:57', NULL, '2026-07-01 08:15:32', '2026-07-01 08:17:57'),
(61, 'App\\Models\\User', 4, 'auth_token', '9b250ee25195f6df673eb21a6b427db35fd555b23854158b72caf71d6037c20e', '[\"*\"]', '2026-07-01 08:20:01', NULL, '2026-07-01 08:18:50', '2026-07-01 08:20:01'),
(62, 'App\\Models\\User', 3, 'auth_token', '33e624ccf3118c0d882b7f0b90af0813ec6633a3c0c0d36f96ab2d40ee2038f5', '[\"*\"]', '2026-07-01 08:20:36', NULL, '2026-07-01 08:20:18', '2026-07-01 08:20:36'),
(63, 'App\\Models\\User', 1, 'auth_token', 'cd4a0e030977b5cef198398604ffbc71c26f9185604ca39f9f596ad919fc3c6d', '[\"*\"]', '2026-07-01 08:27:22', NULL, '2026-07-01 08:20:55', '2026-07-01 08:27:22'),
(64, 'App\\Models\\User', 5, 'auth_token', '5cf18c0badb01fef0db96175f4454629fac306724e080ecf26ffcb41c9b6779d', '[\"*\"]', '2026-07-01 08:29:33', NULL, '2026-07-01 08:29:26', '2026-07-01 08:29:33'),
(65, 'App\\Models\\User', 1, 'auth_token', '04120d7a36f85cdf6613736aa938f6c4af74c75d38334a54fc7934255753ff9c', '[\"*\"]', '2026-07-01 08:39:21', NULL, '2026-07-01 08:38:48', '2026-07-01 08:39:21'),
(66, 'App\\Models\\User', 4, 'auth_token', 'a85690b72802e2e17e31708bccf28c0892076395e221be678a055c738322a64c', '[\"*\"]', '2026-07-01 08:40:12', NULL, '2026-07-01 08:39:44', '2026-07-01 08:40:12'),
(67, 'App\\Models\\User', 1, 'auth_token', 'f3beab946da44f0b552d55d8c2e8b949ebe8b15a4ecb998785f58113c5d5138d', '[\"*\"]', '2026-07-01 08:42:22', NULL, '2026-07-01 08:42:11', '2026-07-01 08:42:22'),
(68, 'App\\Models\\User', 4, 'auth_token', '39e4bcf8e5f4b98cf492ec64a7750e1fa3b5e6243e2e08a793c718b68d78b536', '[\"*\"]', '2026-07-01 08:43:16', NULL, '2026-07-01 08:43:02', '2026-07-01 08:43:16'),
(69, 'App\\Models\\User', 6, 'auth_token', '1719cece47a66b214e92aa5ae94326f4eda66aa5ab1f6749cf6ac705ab238fd5', '[\"*\"]', '2026-07-01 08:48:36', NULL, '2026-07-01 08:48:23', '2026-07-01 08:48:36'),
(70, 'App\\Models\\User', 3, 'auth_token', 'c472cb76ac4005dce5d76feb7cc60bcf62e0c9ccee85b790cc417fa5b3e32dac', '[\"*\"]', '2026-07-01 08:49:06', NULL, '2026-07-01 08:49:01', '2026-07-01 08:49:06'),
(71, 'App\\Models\\User', 6, 'auth_token', 'f6bce659a9ee63ee55ab168859d185bf7e2f7baa727d8dd15d0c1c58538362a1', '[\"*\"]', '2026-07-01 08:49:55', NULL, '2026-07-01 08:49:34', '2026-07-01 08:49:55'),
(72, 'App\\Models\\User', 7, 'auth_token', '738e0f01444179983569e37e137d227b5f64cfa07668a976dfe9b90bcc227eec', '[\"*\"]', '2026-07-01 08:51:30', NULL, '2026-07-01 08:51:15', '2026-07-01 08:51:30'),
(73, 'App\\Models\\User', 7, 'auth_token', '8e5ce47a5b54cc47a08af6bf0b85047586589890b4abbf196d834a7f1b78ee0e', '[\"*\"]', '2026-07-01 08:53:45', NULL, '2026-07-01 08:53:16', '2026-07-01 08:53:45'),
(74, 'App\\Models\\User', 6, 'auth_token', '33dbce15fdd43489ebb9b9459380bf65306fb7ce93f1ff27e77ca5db4c59d41d', '[\"*\"]', '2026-07-01 08:54:23', NULL, '2026-07-01 08:54:08', '2026-07-01 08:54:23'),
(75, 'App\\Models\\User', 3, 'auth_token', 'f5d9d1f6e24d86c4480d1934369b90cf65af9836d58d6c1cf0e5eb7c16824dd2', '[\"*\"]', '2026-07-02 03:33:50', NULL, '2026-07-02 03:33:18', '2026-07-02 03:33:50'),
(76, 'App\\Models\\User', 8, 'auth_token', 'cb0295f778d7d86348a4570fc27327945dd287a1d26dd7e13752e330aa472c1b', '[\"*\"]', '2026-07-02 04:30:45', NULL, '2026-07-02 03:34:33', '2026-07-02 04:30:45'),
(77, 'App\\Models\\User', 3, 'auth_token', 'bd9c520c028912924e9dcfe6c21854930ca3e81e149f69a77b72798331fedf0f', '[\"*\"]', '2026-07-02 04:34:27', NULL, '2026-07-02 04:32:15', '2026-07-02 04:34:27'),
(78, 'App\\Models\\User', 8, 'auth_token', '228bb03654ccfd2019fd2120bf213c5eddab02e2b7d89e0e8821ddec4229418f', '[\"*\"]', '2026-07-02 04:36:54', NULL, '2026-07-02 04:36:52', '2026-07-02 04:36:54'),
(79, 'App\\Models\\User', 1, 'auth_token', 'd2dab1539a693054dc0a022550f9fdbe44fad4f3b4e03f37beab51ac0fd256c1', '[\"*\"]', '2026-07-02 04:37:50', NULL, '2026-07-02 04:37:20', '2026-07-02 04:37:50'),
(80, 'App\\Models\\User', 1, 'auth_token', 'fb606d35c060821c84b59cc7a3500627114b37ad2c68763dfbf3209713259bb5', '[\"*\"]', '2026-07-02 04:39:27', NULL, '2026-07-02 04:38:56', '2026-07-02 04:39:27'),
(81, 'App\\Models\\User', 3, 'auth_token', '0ebecda37fe592da81915689786520036d8267b44cc547a27050cabf6cc54499', '[\"*\"]', '2026-07-02 04:57:34', NULL, '2026-07-02 04:57:34', '2026-07-02 04:57:34'),
(82, 'App\\Models\\User', 1, 'auth_token', 'bd4cd4219dd5e3beb1b94392cd6caaa4e152ed823802dba6e8d531ac67c156cd', '[\"*\"]', '2026-07-02 05:01:26', NULL, '2026-07-02 04:58:12', '2026-07-02 05:01:26'),
(83, 'App\\Models\\User', 2, 'auth_token', '283a78cd0494124e2eb51d791f958dcc6023b2e1dd1821f4b0c6a5b040910b03', '[\"*\"]', '2026-07-02 05:17:47', NULL, '2026-07-02 05:02:27', '2026-07-02 05:17:47'),
(84, 'App\\Models\\User', 1, 'auth_token', 'd0f4e163d829e432698f833b92766a8cf14c7de869783a347cd9fbb1c5fae204', '[\"*\"]', '2026-07-02 22:59:44', NULL, '2026-07-02 05:18:04', '2026-07-02 22:59:44'),
(85, 'App\\Models\\User', 3, 'auth_token', '007f2e8bd3177506b74f2cb40cca6dad0552fab028e89e122ea7a263d35e80f5', '[\"*\"]', '2026-07-02 23:49:38', NULL, '2026-07-02 23:48:52', '2026-07-02 23:49:38'),
(86, 'App\\Models\\User', 1, 'auth_token', '34b2b6c7d5c2a9c36697af9aac963fd67f2b3cc802b7675a86b5ab3fa2f9922b', '[\"*\"]', '2026-07-02 23:51:21', NULL, '2026-07-02 23:50:09', '2026-07-02 23:51:21'),
(87, 'App\\Models\\User', 3, 'auth_token', 'a80538cffa8cdfcde8c11c1cd49d85a1f887609ec867adb3396cea63e0fcef79', '[\"*\"]', '2026-07-02 23:54:12', NULL, '2026-07-02 23:51:56', '2026-07-02 23:54:12'),
(88, 'App\\Models\\User', 1, 'auth_token', '843790dce02a123a2fdc5bbdd06d1d5bf1b2d49354e56712a4eed4f36463cf0f', '[\"*\"]', '2026-07-02 23:55:42', NULL, '2026-07-02 23:54:53', '2026-07-02 23:55:42'),
(89, 'App\\Models\\User', 3, 'auth_token', 'bba8a1714cc6243a3683d3ea25d56c47d4e7682bbbf43cff6e286152bfe14d92', '[\"*\"]', '2026-07-02 23:56:10', NULL, '2026-07-02 23:56:05', '2026-07-02 23:56:10'),
(90, 'App\\Models\\User', 1, 'auth_token', '38bd68a81d10f8b173ce378ca7c4d9f40e856f11c78f5d436cbbc33cf6b2c916', '[\"*\"]', '2026-07-02 23:57:03', NULL, '2026-07-02 23:56:38', '2026-07-02 23:57:03'),
(91, 'App\\Models\\User', 3, 'auth_token', 'fa8c625771e6afd39e8a6f9a60e919fd3152c9feaf7f79204797426be3a416e5', '[\"*\"]', '2026-07-02 23:57:59', NULL, '2026-07-02 23:57:35', '2026-07-02 23:57:59'),
(92, 'App\\Models\\User', 1, 'auth_token', 'b18a6dae2133fe10cdc99abf5a20ca5b50b771180d461ec3c898b7359236d14b', '[\"*\"]', '2026-07-03 00:59:54', NULL, '2026-07-03 00:23:49', '2026-07-03 00:59:54'),
(93, 'App\\Models\\User', 4, 'auth_token', '9968d90f132f53c0c5eac7c70ea2ba492de82f80e4f59b00d647580c061a987a', '[\"*\"]', '2026-07-03 01:00:52', NULL, '2026-07-03 01:00:25', '2026-07-03 01:00:52'),
(94, 'App\\Models\\User', 1, 'auth_token', 'f0c2594aa1e79a2d9ee4551466167d605896ba8a8d83442733b36d8790629bd2', '[\"*\"]', '2026-07-03 01:01:30', NULL, '2026-07-03 01:01:08', '2026-07-03 01:01:30'),
(95, 'App\\Models\\User', 2, 'auth_token', '7447799ca4892c4f997a2ce25470b0c4346a61b8e3bb0546312406e3ec029ccd', '[\"*\"]', '2026-07-03 01:10:23', NULL, '2026-07-03 01:02:02', '2026-07-03 01:10:23'),
(96, 'App\\Models\\User', 1, 'auth_token', '023c82dc6a78b605c9a22af2e537de0b8a8c74f00f486067d0d75901de2b5aea', '[\"*\"]', '2026-07-03 01:10:57', NULL, '2026-07-03 01:10:44', '2026-07-03 01:10:57'),
(97, 'App\\Models\\User', 3, 'auth_token', '1cec850ec49d535569b3372f4a6dccbdc9ebab40dc397c192bd26136b1ba5b54', '[\"*\"]', '2026-07-03 01:11:35', NULL, '2026-07-03 01:11:20', '2026-07-03 01:11:35'),
(98, 'App\\Models\\User', 3, 'auth_token', 'e84bfd51d21f1c363045220479020f556080d0eec872bc67a4432ce748c3cddc', '[\"*\"]', '2026-07-03 06:08:32', NULL, '2026-07-03 06:08:31', '2026-07-03 06:08:32'),
(99, 'App\\Models\\User', 3, 'auth_token', 'fe9585db4f2354a73de5cd501db7ad852c889955d5110100de2d1829fca3f3db', '[\"*\"]', '2026-07-03 06:15:03', NULL, '2026-07-03 06:09:25', '2026-07-03 06:15:03'),
(100, 'App\\Models\\User', 1, 'auth_token', 'dddf3c2ad06fdc54bf697fb37e7ed5736643cbaa6e8539473535e3315e77b021', '[\"*\"]', '2026-07-03 06:15:25', NULL, '2026-07-03 06:15:18', '2026-07-03 06:15:25'),
(101, 'App\\Models\\User', 2, 'auth_token', '719ed05adcceba93ffb910ed4998c14a9a6e9594aee5e30153d8f6abe6f36a9b', '[\"*\"]', '2026-07-03 06:16:06', NULL, '2026-07-03 06:15:45', '2026-07-03 06:16:06'),
(102, 'App\\Models\\User', 4, 'auth_token', 'b57305389421237bd88d2501292a43f386f22d145bf12e861b4cbc6d65eeaace', '[\"*\"]', '2026-07-03 06:28:30', NULL, '2026-07-03 06:19:38', '2026-07-03 06:28:30'),
(103, 'App\\Models\\User', 7, 'auth_token', '4ca026d9e168c172031905405e0b5dbd6d8faab6bdf0843e791eb67f5e37db86', '[\"*\"]', '2026-07-03 06:29:13', NULL, '2026-07-03 06:29:06', '2026-07-03 06:29:13'),
(104, 'App\\Models\\User', 2, 'auth_token', '73b0cff9ad09234deb9dadc0514a1643734262ab1207f2c22f88a7192d366ab7', '[\"*\"]', '2026-07-03 06:30:58', NULL, '2026-07-03 06:30:56', '2026-07-03 06:30:58'),
(105, 'App\\Models\\User', 3, 'auth_token', '8961727f58b7de74b83f9bb9057f62987f6dc07a81bc1a170891829b200a03c5', '[\"*\"]', '2026-07-03 06:32:43', NULL, '2026-07-03 06:31:26', '2026-07-03 06:32:43'),
(106, 'App\\Models\\User', 1, 'auth_token', '7093f3dc9263c84fce8eaef058cdc28e063de0b4d1c3c777d07fc94aac3e5f6c', '[\"*\"]', '2026-07-03 06:33:08', NULL, '2026-07-03 06:33:04', '2026-07-03 06:33:08'),
(107, 'App\\Models\\User', 2, 'auth_token', 'b29b5337d5a778b8e3f6eeb31ac12786d65c2cb8a0ff0a325b377dbf0574d1f5', '[\"*\"]', '2026-07-03 06:33:32', NULL, '2026-07-03 06:33:30', '2026-07-03 06:33:32'),
(108, 'App\\Models\\User', 1, 'auth_token', '737216e30ffd585c299d215f8ab1f1c974937e4e89db482d8bd930834c453555', '[\"*\"]', '2026-07-03 06:35:28', NULL, '2026-07-03 06:34:04', '2026-07-03 06:35:28'),
(109, 'App\\Models\\User', 3, 'auth_token', '217dbfac936b7d9fd4a0adafae3b67db1d6dbda3aa03f037fdd3b1fcac4bdb67', '[\"*\"]', '2026-07-03 06:36:05', NULL, '2026-07-03 06:35:52', '2026-07-03 06:36:05'),
(110, 'App\\Models\\User', 1, 'auth_token', 'f5eec628f06db49322423e7cc80bfc6c195d31e848a99bc7d26a2e4bae9e60e4', '[\"*\"]', '2026-07-03 06:36:36', NULL, '2026-07-03 06:36:34', '2026-07-03 06:36:36'),
(111, 'App\\Models\\User', 2, 'auth_token', '39ceb0bdeef41664cc1a2274915a88092c76b002224d405e7ce1684375cceaf6', '[\"*\"]', '2026-07-03 06:37:03', NULL, '2026-07-03 06:37:02', '2026-07-03 06:37:03'),
(112, 'App\\Models\\User', 3, 'auth_token', '8bb5f6095a981415e58b875cce4c815a0f4596dc99888dcfe394dce7744c0789', '[\"*\"]', '2026-07-04 06:13:37', NULL, '2026-07-04 06:10:47', '2026-07-04 06:13:37'),
(113, 'App\\Models\\User', 3, 'auth_token', '9a948eca57ea2a710bea136f8482298be3c6e8fecf50ddbc288d4b7074c69225', '[\"*\"]', '2026-07-04 06:15:51', NULL, '2026-07-04 06:15:46', '2026-07-04 06:15:51'),
(114, 'App\\Models\\User', 3, 'auth_token', 'e4edee70c58db728560dceb1b7544efcc9e93a29efccda820f34d9cda35d7df5', '[\"*\"]', '2026-07-04 06:24:38', NULL, '2026-07-04 06:22:55', '2026-07-04 06:24:38'),
(115, 'App\\Models\\User', 1, 'auth_token', '298162837be1074a9ca7d1a50da3a2d8288cf50978a0029471957987cdbc6c3d', '[\"*\"]', '2026-07-04 06:27:39', NULL, '2026-07-04 06:25:39', '2026-07-04 06:27:39'),
(116, 'App\\Models\\User', 2, 'auth_token', '94374569e2c6aada7d5fbce21657c8bf92dce2b8f9ef40e840837f8d4e55e303', '[\"*\"]', '2026-07-04 06:28:52', NULL, '2026-07-04 06:28:13', '2026-07-04 06:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VkZGWLpEQAjNQ8XdwTy2iqXD6UXQpaoMQ30pNtVG', NULL, '127.0.0.1', 'Dart/3.11 (dart:io)', 'eyJfdG9rZW4iOiJKZHVRRFVXa0VoajZqYVBNb2FVV0pQdUJCMDZ5TFNOeGU1NEZUMld2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEwLjAuMi4yOjgwMDBcL3RpY2tldC1pbWFnZVwvU1RyUWw5SWtDeXFkSmFtZmdHZUViWVhKa2ppZlJBQ0szVWxCQlZ0NC5qcGciLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1783171381);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `helpdesk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `status` enum('open','assign','in_progress','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hidden_by_user` tinyint(1) NOT NULL DEFAULT 0,
  `hidden_by_helpdesk` tinyint(1) NOT NULL DEFAULT 0,
  `hidden_by_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `helpdesk_id`, `title`, `description`, `file_path`, `status`, `created_at`, `updated_at`, `hidden_by_user`, `hidden_by_helpdesk`, `hidden_by_admin`) VALUES
(2, 3, 2, 'tes', 'tes', 'tickets/STrQl9IkCyqdJamfgGeEbYXJkjifRACK3UlBBVt4.jpg', 'assign', '2026-07-04 06:12:32', '2026-07-04 06:27:21', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `ticket_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'tes', '2026-07-04 06:23:14', '2026-07-04 06:23:14'),
(2, 2, 1, 'tes', '2026-07-04 06:27:06', '2026-07-04 06:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_histories`
--

CREATE TABLE `ticket_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_histories`
--

INSERT INTO `ticket_histories` (`id`, `ticket_id`, `user_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 'Created Ticket', 'Tiket baru dibuat dengan status Open', '2026-07-04 06:12:32', '2026-07-04 06:12:32'),
(3, 2, 1, 'Ticket Assigned', 'Tiket ditugaskan ke helpdesk', '2026-07-04 06:27:21', '2026-07-04 06:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','helpdesk','user') NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@test.com', NULL, '$2y$12$TfrvI7gGlRuK11ywFj8KjeonTRkzSg9QRUGOOI//4atUMyqO5EAgW', 'admin', 1, NULL, '2026-06-27 21:57:00', '2026-06-27 21:57:00'),
(2, 'Tim Support', 'helpdesk@test.com', NULL, '$2y$12$0KU6Xwqx5ezYuO5drL9l5.DQlbQ4oEsG1CUnbMax49MHv2Bc9o.La', 'helpdesk', 1, NULL, '2026-06-27 21:57:01', '2026-06-27 21:57:01'),
(3, 'Budi Pelapor', 'user@test.com', NULL, '$2y$12$mggm7LtWIR9rotETU/QC6OtCB1HsG7KDqIBHk0FTi.iVXkmeB/QEy', 'user', 1, NULL, '2026-06-27 22:02:37', '2026-06-27 22:02:37'),
(4, 'Helpdesk Jaringan', 'helpdesk2@test.com', NULL, '$2y$12$TPbjtfkw8Piur/97bov.VO.3q8N9B6.c0BB3HwmCB.ky..5dTEVqu', 'helpdesk', 1, NULL, '2026-06-29 11:15:13', '2026-06-29 11:15:13'),
(5, 'Helpdesk Software', 'helpdesk3@test.com', NULL, '$2y$12$F76n4rIALpHPQh1/3SLZouCCt/mKeQIj1OgseL/z.oNdUfIR/xWH.', 'helpdesk', 1, NULL, '2026-06-29 11:16:10', '2026-06-29 11:16:10'),
(6, 'Aran', 'aran@test.com', NULL, '$2y$12$gOESr8nqvvdT85.Gfc0c.OcEf.QobQSO3UKzvk4J0jLrHyT5uTfUS', 'user', 1, NULL, '2026-07-01 08:48:23', '2026-07-01 08:48:23'),
(7, 'Rana', 'rana@test.com', NULL, '$2y$12$I0.uCqczpswORLABdI6kAe5Yx/WcGep2lkW2qkPDL2JxC7MoeFsp2', 'user', 1, NULL, '2026-07-01 08:51:15', '2026-07-01 08:51:15'),
(8, 'Yuda', 'yuda@test.com', NULL, '$2y$12$vXJfpx7J/vA3HCCkukhh4.zpUWkRn2dAwXPU4X2oRvX2G/CGF9XE6', 'user', 1, NULL, '2026-07-02 03:34:33', '2026-07-02 05:01:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_helpdesk_id_foreign` (`helpdesk_id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_histories_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_histories_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_helpdesk_id_foreign` FOREIGN KEY (`helpdesk_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  ADD CONSTRAINT `ticket_histories_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
