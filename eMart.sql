-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 21, 2022 at 12:51 PM
-- Server version: 10.3.34-MariaDB-0+deb10u1
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elemaratia_1shabannder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', '01157276799', 1, 'def.png', 'admin@gmail.com', NULL, '$2y$10$HpY/JdVSuWIhS69h7pXFW.f7soNfWCAIu26hTEkhyuv9GTU5ybeSy', 'ZsI7Y16b3jzlruZlT2WAda1vDiDsX5kBgexFqq21VE3VUwfSHiOQfFZ05oST', '2022-07-23 13:19:45', '2022-07-23 13:19:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 500, 0, NULL, '2022-08-12 11:53:53', 0.00, 10.00, 0.00, 0.00),
(2, 1, 0, 0, '2022-07-23 13:19:45', '2022-07-23 13:19:45', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الكمية', '2022-07-23 14:18:19', '2022-08-20 00:17:42'),
(2, 'العرض', '2022-08-03 13:55:53', '2022-08-03 13:55:53'),
(3, 'الطول', '2022-08-03 13:56:01', '2022-08-03 13:56:01'),
(4, 'الوحدات', '2022-08-17 20:01:55', '2022-08-17 20:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(8, '2022-08-12-62f63a794dacb.png', 'Main Banner', 1, '2022-08-12 11:33:13', '2022-08-12 11:33:16', '#', 'product', 1),
(9, '2022-08-12-62f63a853b215.png', 'Main Banner', 1, '2022-08-12 11:33:25', '2022-08-12 11:33:29', '#', 'product', 1),
(10, '2022-08-12-62f63a94129f6.png', 'Main Banner', 1, '2022-08-12 11:33:40', '2022-08-12 11:33:46', '#', 'product', 1),
(11, '2022-08-12-62f63aa17e008.png', 'Main Banner', 1, '2022-08-12 11:33:53', '2022-08-12 11:33:56', '#', 'product', 1),
(12, '2022-08-12-62f63ab01fcbe.png', 'Main Banner', 1, '2022-08-12 11:34:08', '2022-08-12 11:34:10', '#', 'product', 1),
(13, '2022-08-12-62f63aca0de05.png', 'Footer Banner', 1, '2022-08-12 11:34:34', '2022-08-12 11:35:40', '#', 'product', 1),
(14, '2022-08-12-62f63af8ca263.png', 'Footer Banner', 1, '2022-08-12 11:35:20', '2022-08-12 11:35:54', '#', 'product', 1),
(15, '2022-08-12-62f657a7ca9c7.png', 'Footer Banner', 0, '2022-08-12 13:37:43', '2022-08-12 13:39:24', '#', 'product', 13);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'بريل', '2022-07-23-62dbc5e1856a1.png', 1, '2022-07-23 13:56:49', '2022-07-23 13:56:49'),
(2, 'نيستل', '2022-07-23-62dbc5ec765e4.png', 1, '2022-07-23 13:57:00', '2022-07-23 13:57:00'),
(3, 'فريش', '2022-07-23-62dbc5fbc3451.png', 1, '2022-07-23 13:57:15', '2022-07-23 13:57:15'),
(4, 'المراعي', '2022-07-23-62dbc6096cf79.png', 1, '2022-07-23 13:57:29', '2022-07-23 13:57:29'),
(5, 'شيبسي', '2022-07-23-62dbc92670e9b.png', 1, '2022-07-23 14:10:46', '2022-07-23 14:10:46'),
(6, 'جهينة', '2022-07-23-62dbc93a01e59.png', 1, '2022-07-23 14:11:06', '2022-07-23 14:11:06'),
(7, 'بيبسي', '2022-07-23-62dbc94c950c7.png', 1, '2022-07-23 14:11:24', '2022-07-23 14:11:24'),
(8, 'اريل', '2022-07-23-62dbc9b7a34f2.png', 1, '2022-07-23 14:13:11', '2022-07-23 14:13:11'),
(9, 'شاي', '2022-08-07-62efdc27c08d4.png', 1, '2022-08-08 00:37:11', '2022-08-08 00:37:11'),
(10, 'براند', '2022-08-07-62efdc477206e.png', 1, '2022-08-08 00:37:43', '2022-08-08 00:37:43'),
(11, 'فيليبس', '2022-08-07-62efdc5809f4e.png', 1, '2022-08-08 00:38:00', '2022-08-08 00:38:00'),
(12, 'ريحانة', '2022-08-12-62f63d34ca762.png', 1, '2022-08-12 11:44:52', '2022-08-12 11:44:52'),
(13, 'schwepes', '2022-08-18-62fea87d28902.png', 1, '2022-08-18 21:00:45', '2022-08-18 21:00:45'),
(14, 'fayrouz', '2022-08-18-62fea8a7091de.png', 1, '2022-08-18 21:01:27', '2022-08-18 21:01:27'),
(15, 'BIRELL', '2022-08-18-62fea8becb131.png', 1, '2022-08-18 21:01:50', '2022-08-18 21:01:50'),
(16, 'FRATZ', '2022-08-18-62fea8cce8b48.png', 1, '2022-08-18 21:02:04', '2022-08-18 21:02:04'),
(17, 'MOUSSY', '2022-08-18-62fea8d8d310d.png', 1, '2022-08-18 21:02:16', '2022-08-18 21:02:16'),
(18, 'MOUSSY', '2022-08-18-62fea8e35e250.png', 1, '2022-08-18 21:02:27', '2022-08-18 21:02:27'),
(19, 'نسكافية', '2022-08-19-62ffbc67ea48b.png', 1, '2022-08-19 16:37:59', '2022-08-19 16:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '8', '2020-10-11 07:43:44', '2022-08-19 16:49:11'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"name\":\"\\u0639\\u0631\\u0628\\u064a\",\"direction\":\"rtl\",\"code\":\"eg\",\"status\":1,\"default\":true}]', '2020-10-11 07:53:02', '2022-07-23 13:39:04'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-06-05 09:35:46'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-06-05 09:35:46'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '+1157276799', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'مؤسسة Shahpanndar', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-08-12-62f63949c903b.png', NULL, '2022-08-12 11:28:09'),
(13, 'company_mobile_logo', '2022-08-12-62f63949c9a50.png', NULL, '2022-08-12 11:28:09'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Shahpanndar@gmail.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#450057\",\"secondary\":\"#050608\"}', '2020-10-11 13:53:02', '2022-08-12 14:52:53'),
(19, 'company_footer_logo', '2022-08-12-62f63fb182fce.png', NULL, '2022-08-12 11:55:29'),
(20, 'company_copyright_text', '', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2022-08-12-62f63fb183c27.png', '2020-10-11 13:53:02', '2022-08-12 11:55:29'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'AAAAS2aGhcE:APA91bHyQGfoT_KorwfmQDmINGzYoR_PDQ22Qa0yY1TSIFupNFB6fyMVyC59XtXJmMfa0EUVtAl9XIWR-OZxV7HkSDFKSveh7975vkDE98lpSBrDSsulnHyO3QO2hYsNR-w-oU-JXY9q', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"\\u062c\\u0627\\u0631\\u064a \\u062a\\u0646\\u0641\\u064a\\u0630 \\u0627\\u0644\\u0637\\u0644\\u0628\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"\\u062a\\u0623\\u0643\\u064a\\u062f \\u0627\\u0644\\u0637\\u0644\\u0628\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":null,\"message\":\"\\u062c\\u0627\\u0631\\u064a \\u0645\\u0639\\u0627\\u0644\\u062c\\u0629 \\u0627\\u0644\\u0637\\u0644\\u0628\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u062e\\u0631\\u062c \\u0645\\u0646 \\u0627\\u062c\\u0644 \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u0645\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"\\u062a\\u0645 \\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0637\\u0644\\u0628\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"eg\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'EG', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-06-05 09:35:46'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#000000\",\"text_color\":\"#000000\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":\"1\",\"site_key\":null,\"secret_key\":null}', '2022-07-24 07:54:29', '2022-07-24 07:54:29'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-06-05 09:35:46'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'single', NULL, '2022-08-12 12:02:03'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'المملكة العربية السعودية جدة', NULL, NULL),
(75, 'billing_input_by_customer', '0', NULL, NULL),
(76, 'wallet_status', '1', NULL, NULL),
(77, 'loyalty_point_status', '1', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '1', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '1', NULL, NULL),
(81, 'loyalty_point_minimum_point', '1', NULL, NULL),
(82, 'currency_symbol_position', 'left', '2022-07-23 14:30:20', '2022-07-23 14:30:21'),
(83, 'timezone', 'Africa/Cairo', NULL, NULL),
(84, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(85, 'shop_banner', '2022-08-12-62f63949c5238.png', NULL, NULL),
(86, 'map_api_key', 'AIzaSyB8f75aOAEAUzHo2y6tpX01-K-jzxtH_W8', NULL, NULL),
(87, 'map_api_key_server', 'AIzaSyB8f75aOAEAUzHo2y6tpX01-K-jzxtH_W8', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(25, 15, '15-bwDdC-1660468603', 13, NULL, '{\"choice_1\":\"\\u0639\\u0644\\u0628\\u0629\"}', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0639\\u0644\\u0628\\u0629\"}', 'علبة', 5, 100, 0, 0, 'smn-pM3ZLy', 'سمنة', '2022-08-12-62f63dec5fc49.png', 1, 'admin', '2022-08-16 11:32:15', '2022-08-16 11:32:54', 'مؤسسة Shahpanndar', 0.00, 'order_wise'),
(26, 15, '15-bwDdC-1660468603', 13, NULL, '{\"choice_1\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', 'كرتونة=12علبة', 5, 500, 0, 0, 'smn-pM3ZLy', 'سمنة', '2022-08-12-62f63dec5fc49.png', 1, 'admin', '2022-08-16 11:32:39', '2022-08-16 11:33:02', 'مؤسسة Shahpanndar', 0.00, 'order_wise'),
(35, 19, '19-EzfqF-1660991179', 13, NULL, '{\"choice_1\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', 'كرتونة=12علبة', 1, 500, 0, 0, 'smn-pM3ZLy', 'سمنة', '2022-08-12-62f63dec5fc49.png', 1, 'admin', '2022-08-20 11:37:48', '2022-08-20 11:37:48', 'مؤسسة Shahpanndar', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(2, '6-m1KW7-1659481874', 2, 5.00, '2022-08-03 08:15:21', '2022-08-03 08:15:21'),
(3, '5-7PWyf-1659705435', 2, 5.00, '2022-08-05 22:18:45', '2022-08-05 22:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(29, 'أرز وبقوليات', 'arz-obkolyat', '2022-08-12-62f57f0d4d07a.png', 0, 0, '2022-08-12 07:13:33', '2022-08-13 11:36:04', 0, 0),
(30, 'زيت وسمنة', 'zyt-osmn', '2022-08-12-62f57f266a9cb.png', 0, 0, '2022-08-12 07:13:58', '2022-08-13 11:36:03', 0, 0),
(31, 'مشروبات غازيه', 'mshrobat-ghazyh', '2022-08-12-62f57f7480ab4.png', 0, 0, '2022-08-12 07:15:16', '2022-08-18 14:27:02', 0, 0),
(32, 'سكر ومحليات ودقيق', 'skr-omhlyat-odkyk', '2022-08-12-62f57f8815ec2.png', 0, 0, '2022-08-12 07:15:36', '2022-08-18 14:25:24', 0, 0),
(33, 'توابل  - وعطارة', 'toabl-oaatar', '2022-08-12-62f57f9599402.png', 0, 0, '2022-08-12 07:15:49', '2022-08-18 14:26:30', 0, 0),
(34, 'مكرونة ومعجنات', 'mkron-omaagnat', '2022-08-12-62f57fc198ced.png', 0, 0, '2022-08-12 07:16:33', '2022-08-13 11:36:02', 0, 0),
(35, 'الضحي', 'aldhy', '2022-08-12-62f58091846ae.png', 32, 1, '2022-08-12 07:20:01', '2022-08-12 07:20:01', 0, 0),
(36, 'عافية', 'aaafy', '2022-08-12-62f580f1963e4.png', 30, 1, '2022-08-12 07:21:37', '2022-08-12 07:21:37', 0, 0),
(38, 'صلصة', 'sls', '2022-08-12-62f6522eb7668.png', 29, 1, '2022-08-12 13:14:22', '2022-08-12 13:14:22', 0, 0),
(39, 'مكرونة', 'mkron', '2022-08-12-62f6523c50104.png', 29, 1, '2022-08-12 13:14:36', '2022-08-12 13:14:36', 0, 0),
(42, 'ارز', 'arz', 'def.png', 29, 1, '2022-08-12 16:06:39', '2022-08-12 16:06:39', 0, 0),
(54, 'ورقيات', 'orkyat', '2022-08-20-6300cc332ed66.png', 0, 0, '2022-08-18 14:38:56', '2022-08-20 11:57:39', 0, 0),
(55, 'عصائر', 'aasayr', '2022-08-18-62fe4f4a92560.png', 0, 0, '2022-08-18 14:40:10', '2022-08-18 14:40:10', 0, 0),
(56, 'بسكوت وكيك', 'bskot-okyk', '2022-08-18-62fe4f95d18c3.png', 0, 0, '2022-08-18 14:41:25', '2022-08-18 14:41:25', 0, 0),
(57, 'حلاوه وطحينة', 'hlaoh-othyn', '2022-08-18-62fe5064155bb.png', 0, 0, '2022-08-18 14:44:52', '2022-08-18 14:44:52', 0, 0),
(58, 'شيكولاته وحلويات', 'shykolath-ohloyat', '2022-08-18-62fe5091b4522.png', 0, 0, '2022-08-18 14:45:37', '2022-08-18 14:45:37', 0, 0),
(59, 'لمار', 'lmar', '2022-08-18-62fe526f964c0.png', 55, 1, '2022-08-18 14:53:35', '2022-08-18 14:53:35', 0, 0),
(60, 'منظفات  الملابس', 'mnthfat-almlabs', '2022-08-19-62ffd18a72075.png', 0, 0, '2022-08-18 20:35:36', '2022-08-19 18:08:10', 0, 0),
(61, 'بيبسي', 'bybsy', '2022-08-18-62fea32b1b372.png', 31, 1, '2022-08-18 20:38:03', '2022-08-18 20:38:03', 0, 0),
(62, 'ميرندا', 'myrnda', '2022-08-18-62fea344c2157.png', 31, 1, '2022-08-18 20:38:28', '2022-08-18 20:38:28', 0, 0),
(63, 'سفن اب', 'sfn-ab', '2022-08-18-62fea3501f321.png', 29, 1, '2022-08-18 20:38:40', '2022-08-18 20:38:40', 0, 0),
(65, 'نسكافية', 'nskafy', '2022-08-19-62ffbcb098b09.png', 0, 0, '2022-08-19 16:39:12', '2022-08-19 17:22:49', 1, 0),
(66, 'أسماك معلبة', 'asmak-maalb', '2022-08-19-62ffc86b84a40.png', 0, 0, '2022-08-19 17:29:15', '2022-08-19 17:29:15', 0, 0),
(67, 'صن شاين', 'sn-shayn', 'def.png', 66, 1, '2022-08-19 17:31:13', '2022-08-19 17:31:13', 0, 0),
(68, 'دولفين', 'dolfyn', '2022-08-19-62ffc9209126c.png', 66, 1, '2022-08-19 17:32:16', '2022-08-19 17:32:16', 0, 0),
(69, 'أعشاب ومشروبات ساخنة', 'aaashab-omshrobat-sakhn', '2022-08-19-62ffccc73c268.png', 0, 0, '2022-08-19 17:47:51', '2022-08-19 17:47:51', 0, 0),
(70, 'البان وجبنة', 'alban-ogbn', '2022-08-19-62ffcd7e172c6.png', 0, 0, '2022-08-19 17:50:54', '2022-08-19 17:50:54', 0, 0),
(71, 'مياة معدنية', 'mya-maadny', '2022-08-20-63003408f2f56.png', 0, 0, '2022-08-19 17:51:44', '2022-08-20 01:08:24', 0, 0),
(72, 'حلو ومخبوزات', 'hlo-omkhbozat', '2022-08-20-63003404608e2.png', 0, 0, '2022-08-19 17:52:42', '2022-08-20 01:08:20', 0, 0),
(73, 'شاي وبن', 'shay-obn', '2022-08-20-630033fda3c9d.png', 0, 0, '2022-08-19 17:55:45', '2022-08-20 01:08:13', 0, 0),
(74, 'عسل ومربى', 'aasl-omrb', '2022-08-20-630033f711521.png', 0, 0, '2022-08-19 17:58:57', '2022-08-20 01:08:07', 0, 0),
(75, 'صابون ومطهرات', 'sabon-omthrat', '2022-08-20-630033f27f994.png', 0, 0, '2022-08-19 18:09:09', '2022-08-20 01:08:02', 0, 0),
(76, 'مبيدات ومعطرات', 'mbydat-omaatrat', '2022-08-20-630033eec141b.png', 0, 0, '2022-08-19 18:09:46', '2022-08-20 01:07:58', 0, 0),
(77, 'عناية شخصية', 'aanay-shkhsy', '2022-08-20-630033e934c7c.png', 0, 0, '2022-08-19 18:10:40', '2022-08-20 01:07:53', 0, 0),
(78, 'كلور وديتول سائل', 'klor-odytol-sayl', '2022-08-20-630033e4977a5.png', 0, 0, '2022-08-19 18:13:01', '2022-08-20 01:07:48', 0, 0),
(79, 'مشروبات طاقة', 'mshrobat-tak', '2022-08-20-630033d2bb867.png', 0, 0, '2022-08-19 18:15:59', '2022-08-20 01:07:30', 0, 0),
(80, 'مشروبات شعير', 'mshrobat-shaayr', '2022-08-20-630033c5dde8c.png', 0, 0, '2022-08-19 18:17:37', '2022-08-20 01:07:17', 0, 0),
(98, 'شويبس جولد ليمون ونعناع 250مل', 'shoybs-gold-lymon-onaanaaa-250ml', '2022-08-20-6300ddebcc281.png', 80, 1, '2022-08-20 13:13:15', '2022-08-20 13:13:15', 0, 0),
(99, 'شوبيس جولد اناناس 250 مل', 'shobys-gold-ananas-250-ml', '2022-08-20-6300de2e2bdc2.png', 80, 1, '2022-08-20 13:14:22', '2022-08-20 13:14:22', 0, 0),
(100, 'لبن بخيره كامل الدسم 1 لتر', 'lbn-bkhyrh-kaml-aldsm-1-ltr', '2022-08-20-6300e007801dc.png', 70, 1, '2022-08-20 13:22:15', '2022-08-20 13:22:15', 0, 0),
(101, 'لبن بخيره كامل الدسم 1/2 لتر', 'lbn-bkhyrh-kaml-aldsm-12-ltr', '2022-08-20-6300e03b4c1ef.png', 70, 1, '2022-08-20 13:23:07', '2022-08-20 13:23:07', 0, 0),
(102, 'لبن جهينة كامل الدسم 1 لتر', 'lbn-ghyn-kaml-aldsm-1-ltr', '2022-08-20-6300e06c5b9e8.png', 70, 1, '2022-08-20 13:23:56', '2022-08-20 13:23:56', 0, 0),
(103, 'لبن جهينة خالي  الدسم 1 لتر', 'lbn-ghyn-khaly-aldsm-1-ltr', '2022-08-20-6300e0954560a.png', 70, 1, '2022-08-20 13:24:37', '2022-08-20 13:24:37', 0, 0),
(104, 'لبن جهينة كامل الدسم 1.5 لتر', 'lbn-ghyn-kaml-aldsm-15-ltr', '2022-08-20-6300e0bd8c8cc.png', 70, 1, '2022-08-20 13:25:17', '2022-08-20 13:25:17', 0, 0),
(105, 'لبن جهينة 200 مل', 'lbn-ghyn-200-ml', '2022-08-20-6300e0f0f2430.png', 70, 1, '2022-08-20 13:26:08', '2022-08-20 13:26:08', 0, 0),
(106, 'مكس جهينة فروالة 200 مل', 'mks-ghyn-froal-200-ml', '2022-08-20-6300e195b0d4c.png', 70, 1, '2022-08-20 13:28:53', '2022-08-20 13:28:53', 0, 0),
(107, 'مكس جهينة موز 200 مل', 'mks-ghyn-moz-200-ml', '2022-08-20-6300e261ad0d2.png', 70, 1, '2022-08-20 13:32:17', '2022-08-20 13:32:17', 0, 0),
(108, 'مكس جهينة شيكولاتة 200 مل', 'mks-ghyn-shykolat-200-ml', '2022-08-20-6300e3bfafdec.png', 70, 1, '2022-08-20 13:38:07', '2022-08-20 13:38:07', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(2, 0, 2, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(3, 0, 3, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(4, 0, 4, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(5, 0, 5, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(6, 0, 6, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(7, 0, 10, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(8, 0, 11, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(9, 0, 12, 0.00, NULL, '2022-08-03 14:14:25', '2022-08-03 14:14:25'),
(10, 0, 13, 0.00, NULL, '2022-08-05 20:14:07', '2022-08-05 20:14:07'),
(11, 0, 14, 0.00, NULL, '2022-08-05 20:14:07', '2022-08-05 20:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'Mahmud Ghazni', 'support@ghazni.me', '0494 46 68 30', 'Let\'s Talk About Your Newly Registered Website', 'Hi There,\r\n\r\nRecently I found your website while analyzing a bunch of newly registered domain names. I noticed that you are using WordPress to create your website. That\'s Cool. I\'m a WordPress & SEO Expert. I can do complete SEO (On-page/Off-page) setup and all other technical tasks to get your website ranked first in Google for specific keywords.\r\n\r\nI have recently ranked some more such websites. You can check them first. After checking, If you think my work is ok, you can hire me for your website SEO. I look forward to hearing back from you. Thanks.\r\n\r\nKind Regards, \r\nMahmud Ghazni\r\nWhatsApp: +8801322311024 \r\nEmail: mahmud.ghazni@yahoo.com\r\nDhaka, Bangladesh\r\n\r\nNote: Please disregard this Message if you are not interested.', 1, '0', '2022-08-06 05:13:09', '2022-08-12 07:28:12', NULL),
(2, 'Monarch', 'monaarch.mkt@gmail.com', '1201201200', 'Re: Boosting SEO and Driving Online Presence', 'Hey, Hope you are doing well,\r\n\r\nDo you wish to buy SEO, actually SEO is one of the key things to enhance your operation for your website to grow your business?\r\n\r\nPlease respond with your phone number and suitable time to talk. So we can schedule a follow-up call for you accordingly. \r\n\r\nHave a nice day :)\r\n\r\nRegards, Monarch', 1, '0', '2022-08-06 05:37:38', '2022-08-12 07:28:10', NULL),
(3, 'زيد', 'z.m.rajeh302@gmail.com', '0568328635', 'الدمام', 'Please make discounts', 1, '0', '2022-08-08 03:36:10', '2022-08-12 07:28:08', NULL),
(5, 'Reda', 'reda2016123@gmail.com', '01159627492', 'R', 'R', 0, '0', '2022-08-20 10:35:56', '2022-08-20 10:35:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', '55', '7LcfdRsLgm', '2022-08-20', '2022-08-22', '1.00', '20.00', '20.00', 'amount', 1, '2022-08-20 10:39:56', '2022-08-20 10:39:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 0, NULL, '2022-08-19 17:13:08'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2022-08-19 17:13:01'),
(3, 'Indian Rupi', '₹', 'INR', '60', 0, '2020-10-15 17:23:04', '2022-08-19 17:13:00'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2022-08-19 17:12:58'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2022-08-19 17:12:59'),
(8, 'EG', 'EG', 'EG', '1', 1, '2022-08-19 16:48:44', '2022-08-19 16:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(2, 'عروض خاصة', 13, '0.00', 'flat', 1, '2022-08-12 14:45:05', '2022-08-12 14:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `is_active`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'ahmed', 'elbahgi', '+201157276799', 'a@gmail.com', '12121', 'passport', '[\"2022-08-02-62e90406771ea.png\"]', '2022-08-02-62e904067ad74.png', '$2y$10$G0zI/GM8sTJczJW5w3Oat.sO3lDUC6hmkLmt6cbxyLC02yhe39KB6', 1, '2022-08-02 11:01:26', '2022-08-02 11:01:51', 'jNBCfLqRyRimf0wdLr9ycv8IJCFfrQB2BeduSwywTWQqFtiagh', 'fp2ENO3-QruUpvGQUZ-CjM:APA91bGTAT1rBjBq1id8YYokgk_ySIickU_VoyOZGHFwxj7m1gCm3KgXwvRnQDdRizi5W2vPgCfeC3he0o6wlckq58nlZfPCnYfnRZOegWjkhVtOfjMeBtFc3-r04y94LWvxhJuNwtLF');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'عروض الصيف', '2022-08-12', '2022-12-12', 1, 0, NULL, NULL, 'def.png', 'aarod-alsyf', '2022-08-12 13:36:19', '2022-08-13 19:19:18', NULL, 'feature_deal'),
(2, 'عروض الصيف', '2022-08-12', '2022-12-12', 1, 0, NULL, NULL, '2022-08-12-62f6584fe4fe3.png', 'aarod-alsyf', '2022-08-12 13:40:31', '2022-08-12 14:45:07', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 14, '0.00', NULL, '2022-08-12 13:36:36', '2022-08-12 13:36:36'),
(2, 1, 13, '0.00', NULL, '2022-08-12 13:36:42', '2022-08-12 13:36:42'),
(4, 1, 15, '0.00', NULL, '2022-08-12 13:36:55', '2022-08-12 13:36:55'),
(5, 2, 14, '0.00', NULL, '2022-08-12 13:40:41', '2022-08-12 13:40:41'),
(6, 2, 13, '0.00', NULL, '2022-08-12 13:40:45', '2022-08-12 13:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('05a92522409b571014d94350112afb6302509b093c212efa515bf85a94c13270273aed86284d54d8', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 14:54:37', '2022-08-12 14:54:37', '2023-08-12 16:54:37'),
('074ec2ee3d4e9c59b01126468754f0aa18a22c71b6f6608dfd81437362cba8da0743214e2e52b9b5', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:29:52', '2022-08-06 03:29:52', '2023-08-05 20:29:52'),
('0833c76bf976d0ec1bd365e0a3313cb5e8b2125ef3f570a55f8d98c569f66826d5b80e69174f242d', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-19 23:49:58', '2022-08-19 23:49:58', '2023-08-20 01:49:58'),
('1d571ffdedea18760e8437f5f3b87babfa09d5100ca04d0bd3b53ffed44ebaa8ff07381810789e47', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 12:09:48', '2022-08-12 12:09:48', '2023-08-12 14:09:48'),
('1fb12597dc4067ee41b9691ac5d03fbaefceff53585f15fdd25d134998980f8b6d44e73b97eef604', 9, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 04:01:55', '2022-08-06 04:01:55', '2023-08-05 21:01:55'),
('2592627782291dbc29bd69614e46d5effb7860a440d65a87db5d1d3ab5d1d15bfee0636f88e4c965', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:32:26', '2022-08-06 03:32:26', '2023-08-05 20:32:26'),
('29fd01278f295fb3e464d631b7b241add78d695278ed228077ff09374901201f18d7dc1f3cb28449', 9, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 00:17:39', '2022-08-06 00:17:39', '2023-08-05 17:17:39'),
('3008834acd8ee92e5b4657c5eba5bf43e8561b2613b4af7d2e84c1b3cc545e57ef4fad27b1199551', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 11:37:45', '2022-08-20 11:37:45', '2023-08-20 13:37:45'),
('30b994b7d116c645337a295e43d5b1020861bcf5239ec6dd01533d6ce6414069ecf613b7dd5a1079', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 18:18:13', '2022-08-20 18:18:13', '2023-08-20 20:18:13'),
('34394f514eee4917478c0c3fdccd9c623d380cead9837f00580209341e3d35b005d23fbc2f59d722', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 13:48:26', '2022-08-12 13:48:26', '2023-08-12 15:48:26'),
('3fea083940c34e4dc9dcb43d466f6a587f6bfb72ef804466c754cdaa9c857ca45c11b2b855209a81', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 00:04:13', '2022-08-20 00:04:13', '2023-08-20 02:04:13'),
('47a44343669e44420f63aaad67dd1bc5baab515194b1e2bf774b422941f056293c4a65168b9c7b4a', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 06:22:27', '2022-08-05 06:22:27', '2023-08-04 23:22:27'),
('53815bfdf74968071ce5ade2f8484546a466a33c067463e1b99f1e77260197e8f2ad69340f463f8d', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 23:31:31', '2022-08-05 23:31:31', '2023-08-05 16:31:31'),
('597983025a1897b8adca6f7237450a3101e228c7e8ae2e37aced393700ac0485dcfa9c30c1782cfd', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 17:40:16', '2022-08-17 17:40:16', '2023-08-17 19:40:16'),
('66096cc6ea1092387521b7a653060e9746e8c2530f36f8d066289497e43a42065d2bcfacfaec26ee', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 23:07:46', '2022-08-13 23:07:46', '2023-08-14 01:07:46'),
('670dd5c2607b759c1a7efb6cacf6ccca2d1882d29854fe1c374833d6353c83bf921089d12d61e47d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 01:19:38', '2022-08-20 01:19:38', '2023-08-20 03:19:38'),
('6791c04c865ae0f22ee1a59d471d7a424870317cc482bd9468deb1ba948fa7b24d11e07ec7800dce', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 17:35:27', '2022-08-17 17:35:27', '2023-08-17 19:35:27'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('71621d5c5651af3d5fff2571ef4ed24af4d4567e7457595b7ad9951fc92e2d2bc43f062e4c595030', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 23:11:01', '2022-08-05 23:11:01', '2023-08-05 16:11:01'),
('79555b9e4c84081f6268558fea92a4eaab9644c542888cb49c3f287fede03f6cc7fe04c68c8a008e', 9, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 22:44:22', '2022-08-05 22:44:22', '2023-08-05 15:44:22'),
('7bb98bd4806514cf1d427a577bc029caac07e46d94b0918c383ec88d4c1e0b6065c47cfa215d7d5c', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 10:25:04', '2022-08-20 10:25:04', '2023-08-20 12:25:04'),
('82ad43e3834575c0685cc5ae2c78562e8770fe7a2d0ae90a1d696df2b3ad9075096d682157db5587', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 11:43:31', '2022-08-20 11:43:31', '2023-08-20 13:43:31'),
('8c28f527eb180545acc7d8553d33b9e15937e296ba70752aa4ac1eef1876be60f8e5b1fbdcb636ee', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-07-24 08:09:22', '2022-07-24 08:09:22', '2023-07-24 10:09:22'),
('8eb1164365c42330b7bea1bf2891804b8ad72ee1ac180bebb1e0e58df8d00f5f4cc2aada03cbbcd1', 5, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 22:16:50', '2022-08-05 22:16:50', '2023-08-05 15:16:50'),
('a2db137044870cd47e052c7050831e49ed61adc08e3ff32742ed65e95defd136fae3dc7ceee6eec6', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-06 03:28:15', '2022-08-06 03:28:15', '2023-08-05 20:28:15'),
('b63561f3b7175d9328d75252bfef6ea3a3b94af7a0f311e9390cbe780fc3e7bf1fbe929fc9a0a249', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-17 19:59:06', '2022-08-17 19:59:06', '2023-08-17 21:59:06'),
('b85f855ead7e4e307ad24db400bc5801f93a508734f9396e43e9d55c2c9b06e2a6bead6aa1ffed4a', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 20:26:47', '2022-08-13 20:26:47', '2023-08-13 22:26:47'),
('b864342f5b0ddfbd12d24fc0b56242e968c580d16541662b042a0eab938f27b9e0a40a0074d853f5', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-07-24 07:59:09', '2022-07-24 07:59:09', '2023-07-24 09:59:09'),
('b97cae6cb713130551da0d1054ebf7056f2d13a8438145bc572e4a6c9ae2b8de7413dad08c90fe82', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 21:11:45', '2022-08-13 21:11:45', '2023-08-13 23:11:45'),
('bcc66336cd5e661636c7dc14a86e3e44585498eeedd6e1476156b3386a7d30da3c097d9e9f5fbe4b', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-12 12:33:57', '2022-08-12 12:33:57', '2023-08-12 14:33:57'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('d2d8bcd88d91fde67a9c5de5b119c6e9fbfcdf0ed4be42b848aebd82a023e7006755ee938ae76b35', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-08-16 11:39:05', '2022-08-16 11:39:05', '2023-08-16 13:39:05'),
('d3f25ad6c948ca7e28178eb776b261f66f482a17fa0520f0a71b5c018d6f14345c95853a07a461b2', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-07-23 13:51:32', '2022-07-23 13:51:32', '2023-07-23 15:51:32'),
('d80fbd6fe065841ce06578ca968ec225bdb3eb3b35b7215492076e84c775e50de2281dcfe6d2f6f8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-08-20 00:59:55', '2022-08-20 00:59:55', '2023-08-20 02:59:55'),
('df544e540726a0ef1442454e6acff73340a4cb4b0093176fc41b4161a6db5c67a789d09c5f18cd17', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 21:10:19', '2022-08-13 21:10:19', '2023-08-13 23:10:19'),
('dfb8170cced9b76b89eff34945e40b51600807ef5a0cf85590d346f96cbb00343c09b6abb412abe4', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 06:17:29', '2022-08-05 06:17:29', '2023-08-04 23:17:29'),
('e9cbe0bfc8399f1a91a73d82624029c494a4f4a6d0f26da17be7e595e47ab718b8b08001486467d6', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 23:12:20', '2022-08-05 23:12:20', '2023-08-05 16:12:20'),
('e9e7906d180eccd4eb2ea03b9d6b94277c81cb285781e908d11194f2a66338e762d1cdd22cfd23be', 10, 1, 'LaravelAuthApp', '[]', 0, '2022-08-13 22:22:06', '2022-08-13 22:22:06', '2023-08-14 00:22:06'),
('f993eb7f564e453cc8bb1c4cacbec9d6815eca8b8c0dc00010f299094d5c034b5d939b5c546b090c', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-08-05 23:13:55', '2022-08-05 23:13:55', '2023-08-05 16:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 100, 'null', '2022-07-23 12:07:48', '2022-07-23 12:09:51', 0, NULL, NULL, 0, 0.00, '2-82483-1658578068', '458804', 1, 'admin', NULL, NULL, NULL, 3, '{\"id\":3,\"customer_id\":2,\"contact_person_name\":\"Bahgi Bahgi\",\"address_type\":\"Home\",\"address\":\"\\u0634\",\"city\":\"\\u0646\",\"zip\":\"54\",\"phone\":\"+201157276799\",\"created_at\":\"2022-07-23T12:07:44.000000Z\",\"updated_at\":\"2022-07-23T12:07:44.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640853256980744\",\"longitude\":\"31.08023073524237\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '5', 'customer', 'unpaid', 'delivered', 'cash_on_delivery', '', 405, '4', '2022-07-25 06:20:26', '2022-08-12 08:18:48', 0, NULL, '0', 2, 5.00, '8257-E26RX-1658730026', '397385', 1, 'admin', '{\"id\":4,\"customer_id\":0,\"contact_person_name\":\"ahmed elbahgi\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra\\r\\nashme asjra\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-07-25T06:20:20.000000Z\",\"updated_at\":\"2022-07-25T06:20:20.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100003, '10', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 400, '7', '2022-08-05 23:45:31', '2022-08-05 23:55:08', 0, NULL, NULL, 0, 0.00, '10-506818-1659710731', '688673', 1, 'admin', '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T14:32:32.000000Z\",\"updated_at\":\"2022-08-05T14:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', NULL, NULL, 7, '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T14:32:32.000000Z\",\"updated_at\":\"2022-08-05T14:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '10', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 400, '7', '2022-08-06 03:33:16', '2022-08-06 05:00:47', 0, NULL, NULL, 0, 0.00, '10-477994-1659724396', '674211', 1, 'admin', '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T14:32:32.000000Z\",\"updated_at\":\"2022-08-05T14:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', NULL, NULL, 7, '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T14:32:32.000000Z\",\"updated_at\":\"2022-08-05T14:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '9', 'customer', 'unpaid', 'processing', 'cash_on_delivery', '', 1000, '9', '2022-08-06 04:05:21', '2022-08-06 05:03:13', 0, NULL, NULL, 0, 0.00, '9-295706-1659726321', '951897', 1, 'admin', '{\"id\":9,\"customer_id\":9,\"contact_person_name\":\"\\u0627\\u064a\\u0645\\u0646 \\u0631\\u0627\\u062c\\u062d\",\"address_type\":\"Home\",\"address\":\"3g\",\"city\":\"rrr\",\"zip\":\"23322\",\"phone\":\"+966578163625\",\"created_at\":\"2022-08-05T19:04:55.000000Z\",\"updated_at\":\"2022-08-05T19:04:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"24.558366756128684\",\"longitude\":\"46.61802984774113\",\"is_billing\":0}', 1, NULL, 9, '{\"id\":9,\"customer_id\":9,\"contact_person_name\":\"\\u0627\\u064a\\u0645\\u0646 \\u0631\\u0627\\u062c\\u062d\",\"address_type\":\"Home\",\"address\":\"3g\",\"city\":\"rrr\",\"zip\":\"23322\",\"phone\":\"+966578163625\",\"created_at\":\"2022-08-05T19:04:55.000000Z\",\"updated_at\":\"2022-08-05T19:04:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"24.558366756128684\",\"longitude\":\"46.61802984774113\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100006, '9', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 4500, '9', '2022-08-06 23:50:02', '2022-08-06 23:50:16', 0, NULL, NULL, 0, 0.00, '9-550886-1659797402', '324766', 1, 'admin', '{\"id\":9,\"customer_id\":9,\"contact_person_name\":\"\\u0627\\u064a\\u0645\\u0646 \\u0631\\u0627\\u062c\\u062d\",\"address_type\":\"Home\",\"address\":\"3g\",\"city\":\"rrr\",\"zip\":\"23322\",\"phone\":\"+966578163625\",\"created_at\":\"2022-08-05T19:04:55.000000Z\",\"updated_at\":\"2022-08-05T19:04:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"24.558366756128684\",\"longitude\":\"46.61802984774113\",\"is_billing\":0}', NULL, NULL, 9, '{\"id\":9,\"customer_id\":9,\"contact_person_name\":\"\\u0627\\u064a\\u0645\\u0646 \\u0631\\u0627\\u062c\\u062d\",\"address_type\":\"Home\",\"address\":\"3g\",\"city\":\"rrr\",\"zip\":\"23322\",\"phone\":\"+966578163625\",\"created_at\":\"2022-08-05T19:04:55.000000Z\",\"updated_at\":\"2022-08-05T19:04:55.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"24.558366756128684\",\"longitude\":\"46.61802984774113\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '12', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 105, '10', '2022-08-12 07:26:59', '2022-08-12 07:27:50', 0, NULL, '0', 2, 5.00, '2876-m8nzd-1660256819', '578083', 1, 'admin', '{\"id\":10,\"customer_id\":12,\"contact_person_name\":\"ahmed ashraf\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra, ashme asjr\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-11T22:26:56.000000Z\",\"updated_at\":\"2022-08-11T22:26:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100008, '12', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 105, '10', '2022-08-12 07:32:20', '2022-08-12 07:32:25', 0, NULL, '0', 2, 5.00, '1331-0Ej5z-1660257140', '380305', 1, 'admin', '{\"id\":10,\"customer_id\":12,\"contact_person_name\":\"ahmed ashraf\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra, ashme asjr\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-11T22:26:56.000000Z\",\"updated_at\":\"2022-08-11T22:26:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 10, '{\"id\":10,\"customer_id\":12,\"contact_person_name\":\"ahmed ashraf\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra, ashme asjr\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-11T22:26:56.000000Z\",\"updated_at\":\"2022-08-11T22:26:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100009, '12', 'customer', 'paid', 'confirmed', 'cash_on_delivery', '', 205, '10', '2022-08-12 08:17:19', '2022-08-12 14:43:47', 0, NULL, '0', 2, 5.00, '2085-OThhY-1660259839', '115087', 1, 'admin', '{\"id\":10,\"customer_id\":12,\"contact_person_name\":\"ahmed ashraf\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra, ashme asjr\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-11T22:26:56.000000Z\",\"updated_at\":\"2022-08-11T22:26:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, NULL, 10, '{\"id\":10,\"customer_id\":12,\"contact_person_name\":\"ahmed ashraf\",\"address_type\":\"home\",\"address\":\"ahmedashraf, ashmeasjra, ashme asjr\",\"city\":\"cairo\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-11T22:26:56.000000Z\",\"updated_at\":\"2022-08-11T22:26:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100010, '3', 'customer', 'paid', 'delivered', 'cash', NULL, 2, NULL, '2022-08-12 08:19:30', '2022-08-12 08:19:30', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100011, '13', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 105, '11', '2022-08-12 11:53:08', '2022-08-12 11:53:53', 0, NULL, '0', 2, 5.00, '5593-cJEvA-1660305188', '129404', 1, 'admin', '{\"id\":11,\"customer_id\":0,\"contact_person_name\":\"\\u064a\\u0627\\u0642\\u0648\\u062a\",\"address_type\":\"home\",\"address\":\"\\u0645\\u0635\\u0631\\r\\n\\u0627\\u0644\\u0633\\u0628\\u0639\",\"city\":\"\\u0628\\u0631\\u0643\\u0629\\u0627\\u0644\\u0633\\u0628\\u0639\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-12T11:53:05.000000Z\",\"updated_at\":\"2022-08-12T11:53:05.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100012, '10', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 200, '7', '2022-08-12 13:49:47', '2022-08-12 14:14:28', 0, NULL, NULL, 0, 0.00, '10-66874-1660312187', '181130', 1, 'admin', '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T23:32:32.000000Z\",\"updated_at\":\"2022-08-05T23:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', NULL, NULL, 7, '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T23:32:32.000000Z\",\"updated_at\":\"2022-08-05T23:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100013, '13', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '12', '2022-08-12 14:49:33', '2022-08-12 14:50:23', 0, NULL, '0', 2, 5.00, '6003-QX406-1660315773', '163626', 1, 'admin', '{\"id\":12,\"customer_id\":0,\"contact_person_name\":\"\\u0646\\u0638\\u0627\\u0645 \\u0627\\u062f\\u0627\\u0631\\u0629 \\u0641\\u0648\\u0627\\u062a\\u064a\\u0631\",\"address_type\":\"home\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"city\":\"\\u0645\\u062f\\u064a\\u0646\\u0629 \\u0646\\u0635\\u0631\",\"zip\":\"11865\",\"phone\":\"+201157276799\",\"created_at\":\"2022-08-12T14:49:27.000000Z\",\"updated_at\":\"2022-08-12T14:49:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100014, '10', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 600, '7', '2022-08-13 22:35:58', '2022-08-14 17:03:58', 0, NULL, NULL, 0, 0.00, '10-21975-1660430158', '509969', 1, 'admin', '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T23:32:32.000000Z\",\"updated_at\":\"2022-08-05T23:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', NULL, NULL, 7, '{\"id\":7,\"customer_id\":10,\"contact_person_name\":\"Hhh Hhhq\",\"address_type\":\"Home\",\"address\":\"6g\",\"city\":\"g\",\"zip\":\"8\",\"phone\":\"+96612345677\",\"created_at\":\"2022-08-05T23:32:32.000000Z\",\"updated_at\":\"2022-08-05T23:32:32.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.6408071026516\",\"longitude\":\"31.080164685845375\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100015, '0', 'customer', 'paid', 'delivered', 'cash', NULL, 148, NULL, '2022-08-18 14:14:16', '2022-08-18 14:14:16', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100016, '0', 'customer', 'paid', 'delivered', 'cash', NULL, 1062.4, NULL, '2022-08-18 21:40:23', '2022-08-18 21:40:23', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100017, '17', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 500, '13', '2022-08-20 00:21:34', '2022-08-20 00:21:48', 0, NULL, NULL, 0, 0.00, '17-765176-1660954894', '877439', 1, 'admin', '{\"id\":13,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"test\",\"city\":\"test\",\"zip\":\"test\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:21:31.000000Z\",\"updated_at\":\"2022-08-20T00:21:31.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640821525881808\",\"longitude\":\"31.080174744129177\",\"is_billing\":0}', NULL, NULL, 13, '{\"id\":13,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"test\",\"city\":\"test\",\"zip\":\"test\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:21:31.000000Z\",\"updated_at\":\"2022-08-20T00:21:31.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640821525881808\",\"longitude\":\"31.080174744129177\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100018, '17', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 117.6, '13', '2022-08-20 00:23:27', '2022-08-20 00:23:34', 0, NULL, NULL, 0, 0.00, '17-836642-1660955007', '823249', 1, 'admin', '{\"id\":13,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"test\",\"city\":\"test\",\"zip\":\"test\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:21:31.000000Z\",\"updated_at\":\"2022-08-20T00:21:31.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640821525881808\",\"longitude\":\"31.080174744129177\",\"is_billing\":0}', NULL, NULL, 13, '{\"id\":13,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"test\",\"city\":\"test\",\"zip\":\"test\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:21:31.000000Z\",\"updated_at\":\"2022-08-20T00:21:31.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640821525881808\",\"longitude\":\"31.080174744129177\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100019, '17', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 100, '14', '2022-08-20 00:46:55', '2022-08-20 00:47:06', 0, NULL, NULL, 0, 0.00, '17-723970-1660956415', '984526', 1, 'admin', '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', NULL, NULL, 14, '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100020, '17', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1690, '14', '2022-08-20 01:02:48', '2022-08-20 01:04:12', 0, NULL, NULL, 0, 0.00, '17-144268-1660957368', '841390', 1, 'admin', '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', NULL, NULL, 14, '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100021, '18', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 100, '15', '2022-08-20 10:27:37', '2022-08-20 10:36:53', 0, NULL, NULL, 0, 0.00, '18-761396-1660991257', '534689', 1, 'admin', '{\"id\":15,\"customer_id\":18,\"contact_person_name\":\"\\u0631\\u0636\\u0627 \\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"Workplace\",\"address\":\"\\u0627\\u0644\\u062d\\u0649 \\u0627\\u0644\\u062d\\u0627\\u062f\\u0649 \\u0639\\u0634\\u0631\\u060c \\u0627\\u0644\\u0634\\u064a\\u062e \\u0632\\u0627\\u064a\\u062f\\u060c\\u060c 2XW8+HXH, Sheikh Zayed City, Giza Governorate 3242760, Egypt\",\"city\":\"guze\",\"zip\":\"1125\",\"phone\":\"+201159627492\",\"created_at\":\"2022-08-20T10:27:27.000000Z\",\"updated_at\":\"2022-08-20T10:27:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.046458394870015\",\"longitude\":\"30.967357680201534\",\"is_billing\":0}', NULL, NULL, 15, '{\"id\":15,\"customer_id\":18,\"contact_person_name\":\"\\u0631\\u0636\\u0627 \\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"Workplace\",\"address\":\"\\u0627\\u0644\\u062d\\u0649 \\u0627\\u0644\\u062d\\u0627\\u062f\\u0649 \\u0639\\u0634\\u0631\\u060c \\u0627\\u0644\\u0634\\u064a\\u062e \\u0632\\u0627\\u064a\\u062f\\u060c\\u060c 2XW8+HXH, Sheikh Zayed City, Giza Governorate 3242760, Egypt\",\"city\":\"guze\",\"zip\":\"1125\",\"phone\":\"+201159627492\",\"created_at\":\"2022-08-20T10:27:27.000000Z\",\"updated_at\":\"2022-08-20T10:27:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.046458394870015\",\"longitude\":\"30.967357680201534\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100022, '18', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 80, '15', '2022-08-20 10:41:31', '2022-08-20 12:10:01', 20, 'coupon_discount', '7LcfdRsLgm', 0, 0.00, '18-757642-1660992091', '737057', 1, 'admin', '{\"id\":15,\"customer_id\":18,\"contact_person_name\":\"\\u0631\\u0636\\u0627 \\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"Workplace\",\"address\":\"\\u0627\\u0644\\u062d\\u0649 \\u0627\\u0644\\u062d\\u0627\\u062f\\u0649 \\u0639\\u0634\\u0631\\u060c \\u0627\\u0644\\u0634\\u064a\\u062e \\u0632\\u0627\\u064a\\u062f\\u060c\\u060c 2XW8+HXH, Sheikh Zayed City, Giza Governorate 3242760, Egypt\",\"city\":\"guze\",\"zip\":\"1125\",\"phone\":\"+201159627492\",\"created_at\":\"2022-08-20T10:27:27.000000Z\",\"updated_at\":\"2022-08-20T10:27:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.046458394870015\",\"longitude\":\"30.967357680201534\",\"is_billing\":0}', 1, NULL, 15, '{\"id\":15,\"customer_id\":18,\"contact_person_name\":\"\\u0631\\u0636\\u0627 \\u0645\\u062d\\u0645\\u062f\",\"address_type\":\"Workplace\",\"address\":\"\\u0627\\u0644\\u062d\\u0649 \\u0627\\u0644\\u062d\\u0627\\u062f\\u0649 \\u0639\\u0634\\u0631\\u060c \\u0627\\u0644\\u0634\\u064a\\u062e \\u0632\\u0627\\u064a\\u062f\\u060c\\u060c 2XW8+HXH, Sheikh Zayed City, Giza Governorate 3242760, Egypt\",\"city\":\"guze\",\"zip\":\"1125\",\"phone\":\"+201159627492\",\"created_at\":\"2022-08-20T10:27:27.000000Z\",\"updated_at\":\"2022-08-20T10:27:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.046458394870015\",\"longitude\":\"30.967357680201534\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100023, '2', 'customer', 'paid', 'delivered', 'cash', NULL, 400, NULL, '2022-08-20 11:53:05', '2022-08-20 11:53:05', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100024, '17', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 500, '14', '2022-08-20 12:21:12', '2022-08-20 12:21:18', 0, NULL, NULL, 0, 0.00, '17-511585-1660998072', '803277', 1, 'admin', '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', NULL, NULL, 14, '{\"id\":14,\"customer_id\":17,\"contact_person_name\":\"Adham Adham\",\"address_type\":\"Home\",\"address\":\"\\u0634\\u0627\\u0647\\u064a\\u0646\\u060c \\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt\",\"city\":\"y\",\"zip\":\"h\",\"phone\":\"+2001157276700\",\"created_at\":\"2022-08-20T00:46:52.000000Z\",\"updated_at\":\"2022-08-20T00:46:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"30.640747678920395\",\"longitude\":\"31.080115064978603\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100025, '20', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 347, '16', '2022-08-20 18:20:26', '2022-08-20 18:22:13', 0, NULL, NULL, 0, 0.00, '20-763117-1661019626', '736643', 1, 'admin', '{\"id\":16,\"customer_id\":20,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u0648\\u062f \\u0631\\u0645\\u0636\\u0627\\u0646\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u062d\\u064a \\u0627\\u0644\\u0631\\u0627\\u0628\\u0639\",\"city\":\"\\u0627\\u0643\\u062a\\u0648\\u0628\\u0631\",\"zip\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0629\",\"phone\":\"+2001118805161\",\"created_at\":\"2022-08-20T18:19:41.000000Z\",\"updated_at\":\"2022-08-20T18:19:41.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 1, NULL, 16, '{\"id\":16,\"customer_id\":20,\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u0648\\u062f \\u0631\\u0645\\u0636\\u0627\\u0646\",\"address_type\":\"Home\",\"address\":\"\\u0627\\u0644\\u062d\\u064a \\u0627\\u0644\\u0631\\u0627\\u0628\\u0639\",\"city\":\"\\u0627\\u0643\\u062a\\u0648\\u0628\\u0631\",\"zip\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0629\",\"phone\":\"+2001118805161\",\"created_at\":\"2022-08-20T18:19:41.000000Z\",\"updated_at\":\"2022-08-20T18:19:41.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633\",\"slug\":\"hkyb-adydas-l5Edli\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-23-62dbca373571d.png\\\"]\",\"thumbnail\":\"2022-07-23-62dbca373661a.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\",\\\"#00008B\\\",\\\"#C71585\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0635\\\\u063a\\\\u064a\\\\u0631\\\\u0629 \\\",\\\"  \\\\u0648\\\\u0633\\\\u0637\\\",\\\"  \\\\u0643\\\\u0628\\\\u064a\\\\u0631\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-\\\\u0635\\\\u063a\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-\\\\u0648\\\\u0633\\\\u0637\\\",\\\"price\\\":220,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-\\\\u0643\\\\u0628\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":400,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkBlue-\\\\u0635\\\\u063a\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkBlue-\\\\u0648\\\\u0633\\\\u0637\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkBlue-\\\\u0643\\\\u0628\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"MediumVioletRed-\\\\u0635\\\\u063a\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"MediumVioletRed-\\\\u0648\\\\u0633\\\\u0637\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"MediumVioletRed-\\\\u0643\\\\u0628\\\\u064a\\\\u0631\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-23T14:15:19.000000Z\",\"updated_at\":\"2022-07-23T14:29:55.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-23-62dbca3736aed.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-07-23 12:07:48', '2022-07-23 12:07:48', NULL, 'MediumVioletRed-صغيرة', '{\"color\":\"MediumVioletRed\",\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0635\\u063a\\u064a\\u0631\\u0629\"}', 'discount_on_product', 1, 0),
(2, 100002, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633\",\"slug\":\"hkyb-adydas-l5Edli\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-23-62dbca373571d.png\\\",\\\"2022-07-24-62dd005127405.png\\\"]\",\"thumbnail\":\"2022-07-24-62dd00514b07c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 4 \\\\u0639\\\\u0644\\\\u0628\\\\u0629 \\\",\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=4\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":400,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1400},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1400}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2800,\"details\":\"<p>\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-23T14:15:19.000000Z\",\"updated_at\":\"2022-07-24T08:18:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-24-62dd005152594.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":1,\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633\",\"id\":2},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":1,\"locale\":\"eg\",\"key\":\"description\",\"value\":\"<p>\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633<\\/p>\",\"id\":3}],\"reviews\":[]}', 1, 400, 0, 0, 'delivered', 'unpaid', '2022-07-25 06:20:26', '2022-08-02 11:09:34', NULL, 'كرتونة=4علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 4 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0),
(3, 100003, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633\",\"slug\":\"hkyb-adydas-l5Edli\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-23-62dbca373571d.png\\\",\\\"2022-07-24-62dd005127405.png\\\"]\",\"thumbnail\":\"2022-07-24-62dd00514b07c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 4 \\\\u0639\\\\u0644\\\\u0628\\\\u0629 \\\",\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=4\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":400,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1399},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1400}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2799,\"details\":\"<p>\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-23T05:15:19.000000Z\",\"updated_at\":\"2022-07-24T21:20:26.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-24-62dd005152594.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 400, 0, 0, 'pending', 'unpaid', '2022-08-05 23:45:31', '2022-08-05 23:45:31', NULL, 'كرتونة=4علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 4 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0),
(4, 100004, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633\",\"slug\":\"hkyb-adydas-l5Edli\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-23-62dbca373571d.png\\\",\\\"2022-07-24-62dd005127405.png\\\"]\",\"thumbnail\":\"2022-07-24-62dd00514b07c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 4 \\\\u0639\\\\u0644\\\\u0628\\\\u0629 \\\",\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=4\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":400,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1398},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"400\\\",\\\"qty\\\":1400}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2798,\"details\":\"<p>\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0623\\u062f\\u064a\\u062f\\u0627\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-23T05:15:19.000000Z\",\"updated_at\":\"2022-08-05T14:45:31.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-24-62dd005152594.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 400, 0, 0, 'pending', 'unpaid', '2022-08-06 03:33:16', '2022-08-06 03:33:16', NULL, 'كرتونة=4علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 4 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0),
(5, 100005, 6, 1, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0634\\u0637 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\",\"slug\":\"msht-khrbayy-UICLt8\",\"category_ids\":\"[{\\\"id\\\":\\\"11\\\",\\\"position\\\":1}]\",\"brand_id\":8,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-03-62ea8d5c1a3b1.png\\\",\\\"2022-08-05-62ecfe2221936.png\\\"]\",\"thumbnail\":\"2022-08-05-62ecfe2224f32.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"details\":\"<p>\\u0645\\u0634\\u0637 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-03T14:59:40.000000Z\",\"updated_at\":\"2022-08-05T11:25:22.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0645\\u0634\\u0637 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\",\"meta_description\":\"\\u0645\\u0634\\u0637 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\",\"meta_image\":\"2022-08-05-62ecfe2225236.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1000, 0, 0, 'pending', 'unpaid', '2022-08-06 04:05:21', '2022-08-06 04:05:21', NULL, '', '[]', 'discount_on_product', 1, 0),
(6, 100006, 2, 1, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0633\\u0627\\u0645\\u0633\\u0648\\u0646\\u062c\",\"slug\":\"mobayl-samsong-ErUA9C\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-23-62dbca8d8a4cc.png\\\"]\",\"thumbnail\":\"2022-07-23-62dbca8d8b23b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\",\\\"#4169E1\\\"]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":4500,\\\"sku\\\":\\\"1200\\\",\\\"qty\\\":20},{\\\"type\\\":\\\"RoyalBlue\\\",\\\"price\\\":4500,\\\"sku\\\":\\\"123124\\\",\\\"qty\\\":20}]\",\"published\":0,\"unit_price\":4500,\"purchase_price\":4500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":40,\"details\":\"<p>\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0633\\u0627\\u0645\\u0633\\u0648\\u0646\\u062c<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-23T05:16:45.000000Z\",\"updated_at\":\"2022-08-04T21:26:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-23-62dbca8d8b5a3.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 4500, 0, 0, 'pending', 'unpaid', '2022-08-06 23:50:02', '2022-08-06 23:50:02', NULL, 'Aqua', '{\"color\":\"Aqua\"}', 'discount_on_product', 1, 0),
(7, 100007, 11, 1, '{\"id\":11,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629\",\"slug\":\"ryhan-uGAIwk\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":8,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f581479ffa2.png\\\"]\",\"thumbnail\":\"2022-08-12-62f58147a0245.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"details\":\"<p>\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-11T22:23:03.000000Z\",\"updated_at\":\"2022-08-11T22:24:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f58147a02e5.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 07:26:59', '2022-08-12 07:26:59', NULL, '', '[]', 'discount_on_product', 1, 0),
(8, 100008, 11, 1, '{\"id\":11,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629\",\"slug\":\"ryhan-uGAIwk\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":8,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f581479ffa2.png\\\"]\",\"thumbnail\":\"2022-08-12-62f58147a0245.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":99,\"details\":\"<p>\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-11T22:23:03.000000Z\",\"updated_at\":\"2022-08-11T22:26:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f58147a02e5.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 07:32:20', '2022-08-12 07:32:20', NULL, '', '[]', 'discount_on_product', 1, 0),
(9, 100009, 11, 1, '{\"id\":11,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629\",\"slug\":\"ryhan-uGAIwk\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":8,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f581479ffa2.png\\\"]\",\"thumbnail\":\"2022-08-12-62f58147a0245.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":98,\"details\":\"<p>\\u0631\\u064a\\u062d\\u0627\\u0646\\u0629<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-11T22:23:03.000000Z\",\"updated_at\":\"2022-08-11T22:32:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f58147a02e5.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 2, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 08:17:19', '2022-08-12 08:17:19', NULL, '', '[]', 'discount_on_product', 1, 0),
(10, 100010, 10, 1, '{\"id\":10,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test product\",\"slug\":\"test-product-WRa620\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1},{\\\"id\\\":\\\"21\\\",\\\"position\\\":2}]\",\"brand_id\":8,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-10-62f4200eec24a.png\\\"]\",\"thumbnail\":\"2022-08-10-62f4200ef18ef.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":2,\"purchase_price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-10T21:15:58.000000Z\",\"updated_at\":\"2022-08-11T22:24:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 2, 0, 0, 'delivered', 'paid', '2022-08-12 08:19:30', '2022-08-12 08:19:30', NULL, '', '[]', 'discount_on_product', 1, 0),
(11, 100011, 14, 1, '{\"id\":14,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0628\\u0642\\u0648\\u0644\\u064a\\u0627\\u062a\",\"slug\":\"-Bp7VIz\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63e2155c7e.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e21578f4.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1000,\"details\":\"<p>\\u0628\\u0642\\u0648\\u0644\\u064a\\u0627\\u062a<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:48:49.000000Z\",\"updated_at\":\"2022-08-12T11:52:36.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63e2157ca0.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'delivered', 'unpaid', '2022-08-12 11:53:08', '2022-08-12 11:53:53', NULL, '', '[]', 'discount_on_product', 1, 0),
(12, 100012, 13, 1, '{\"id\":13,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0645\\u0646\\u0629\",\"slug\":\"smn-pM3ZLy\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63dec5e026.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63dec5fc49.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"details\":\"<p>\\u0633\\u0645\\u0646\\u0629<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:47:56.000000Z\",\"updated_at\":\"2022-08-12T11:52:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63dec60013.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 13:49:47', '2022-08-12 13:49:47', NULL, '', '[]', 'discount_on_product', 1, 0),
(13, 100012, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0634\\u064a\\u0628\\u0633\\u064a \\u0648\\u0645\\u0633\\u0644\\u064a\\u0627\\u062a\",\"slug\":\"shybsy-omslyat-gsbY3N\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"position\\\":1},{\\\"id\\\":\\\"37\\\",\\\"position\\\":2}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63ea78dd93.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63ea78faef.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1000,\"details\":\"<p>\\u0634\\u064a\\u0628\\u0633\\u064a \\u0648\\u0645\\u0633\\u0644\\u064a\\u0627\\u062a \\u062d\\u062c\\u0645 \\u0643\\u0628\\u064a\\u0631&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0643\\u0631\\u0648\\u062a\\u0648\\u0646\\u0629 = 12 \\u0643\\u064a\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:51:03.000000Z\",\"updated_at\":\"2022-08-12T13:26:55.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63ea78ff20.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 13:49:47', '2022-08-12 13:49:47', NULL, '', '[]', 'discount_on_product', 1, 0),
(14, 100013, 13, 1, '{\"id\":13,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0645\\u0646\\u0629\",\"slug\":\"smn-pM3ZLy\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63dec5e026.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63dec5fc49.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":99,\"details\":\"<p>\\u0633\\u0645\\u0646\\u0629<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:47:56.000000Z\",\"updated_at\":\"2022-08-12T13:49:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63dec60013.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 100, 0, 0, 'pending', 'unpaid', '2022-08-12 14:49:33', '2022-08-12 14:49:33', NULL, '', '[]', 'discount_on_product', 1, 0),
(15, 100014, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0634\\u064a\\u0628\\u0633\\u064a \\u0648\\u0645\\u0633\\u0644\\u064a\\u0627\\u062a\",\"slug\":\"shybsy-omslyat-gsbY3N\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"position\\\":1},{\\\"id\\\":\\\"37\\\",\\\"position\\\":2}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63ea78dd93.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63ea78faef.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":999,\"details\":\"<p>\\u0634\\u064a\\u0628\\u0633\\u064a \\u0648\\u0645\\u0633\\u0644\\u064a\\u0627\\u062a \\u062d\\u062c\\u0645 \\u0643\\u0628\\u064a\\u0631&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0643\\u0631\\u0648\\u062a\\u0648\\u0646\\u0629 = 12 \\u0643\\u064a\\u0633<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:51:03.000000Z\",\"updated_at\":\"2022-08-12T13:49:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63ea78ff20.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-13 22:35:58', '2022-08-13 22:35:58', NULL, '', '[]', 'discount_on_product', 1, 0),
(16, 100014, 15, 1, '{\"id\":15,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0635\\u0644\\u0635\\u0629 \\u0648\\u062a\\u0648\\u0627\\u0628\\u0644\",\"slug\":\"sls-otoabl-lcSrsS\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1},{\\\"id\\\":\\\"38\\\",\\\"position\\\":2}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63e7ca4334.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e7ca5f15.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 12 \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"   \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=12\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":500,\\\"sku\\\":\\\"1222\\\",\\\"qty\\\":122},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"15\\\",\\\"qty\\\":122}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":244,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:50:20.000000Z\",\"updated_at\":\"2022-08-12T14:58:44.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63e7ca62ea.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 500, 0, 0, 'pending', 'unpaid', '2022-08-13 22:35:58', '2022-08-13 22:35:58', NULL, 'كرتونة=12علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0),
(17, 100015, 17, 1, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0646\\u062a\\u062c 1\",\"slug\":\"mntg-1-euCUhM\",\"category_ids\":\"[{\\\"id\\\":\\\"32\\\",\\\"position\\\":1},{\\\"id\\\":\\\"35\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f6926cbb967.png\\\"]\",\"thumbnail\":\"2022-08-12-62f6926cbd4a6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":200,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":\"<p>\\u0648\\u0635\\u0641 \\u0645\\u0646\\u062a\\u062c 1<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T17:48:28.000000Z\",\"updated_at\":\"2022-08-17T17:30:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f6926cbd8e8.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 150, 0, 2, 'delivered', 'paid', '2022-08-18 14:14:16', '2022-08-18 14:14:16', NULL, '', '[]', 'discount_on_product', 1, 0),
(18, 100016, 17, 1, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0646\\u062a\\u062c 1\",\"slug\":\"mntg-1-euCUhM\",\"category_ids\":\"[{\\\"id\\\":\\\"32\\\",\\\"position\\\":1},{\\\"id\\\":\\\"35\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f6926cbb967.png\\\"]\",\"thumbnail\":\"2022-08-12-62f6926cbd4a6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":200,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"flat\",\"current_stock\":49,\"details\":\"<p>\\u0648\\u0635\\u0641 \\u0645\\u0646\\u062a\\u062c 1<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T17:48:28.000000Z\",\"updated_at\":\"2022-08-18T14:14:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f6926cbd8e8.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 150, 0, 8, 'delivered', 'paid', '2022-08-18 21:40:23', '2022-08-18 21:40:23', NULL, '', '[]', 'discount_on_product', 1, 0),
(19, 100016, 25, 1, '{\"id\":25,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631  \\u0645\\u0627\\u0646\\u062c\\u0648  1\\u0644\\u062a\\u0631\",\"slug\":\"aasyr-lmar-mango-1ltr-eoZ6Pj\",\"category_ids\":\"[{\\\"id\\\":\\\"55\\\",\\\"position\\\":1},{\\\"id\\\":\\\"59\\\",\\\"position\\\":2}]\",\"brand_id\":10,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-18-62fe544049a37.png\\\"]\",\"thumbnail\":\"2022-08-18-62fe54404b112.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0647 12 \\\\u0639\\\\u0628\\\\u0648\\\\u0629 1 \\\\u0644\\\\u062a\\\\u0631\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u064712\\\\u0639\\\\u0628\\\\u0648\\\\u06291\\\\u0644\\\\u062a\\\\u0631\\\",\\\"price\\\":120,\\\"sku\\\":\\\"15015\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":120,\"purchase_price\":110,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":5,\"details\":\"<p>\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 &nbsp;\\u0645\\u0627\\u0646\\u062c\\u0648 &nbsp;1\\u0644\\u062a\\u0631<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-18T15:01:20.000000Z\",\"updated_at\":\"2022-08-18T15:01:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 \\u00a0\\u0645\\u0627\\u0646\\u062c\\u0648 \\u00a01\\u0644\\u062a\\u0631\",\"meta_description\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 \\u00a0\\u0645\\u0627\\u0646\\u062c\\u0648 \\u00a01\\u0644\\u062a\\u0631\",\"meta_image\":\"2022-08-18-62fe54404b48a.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 120, 0, 9.6, 'delivered', 'paid', '2022-08-18 21:40:23', '2022-08-18 21:40:23', NULL, 'كرتونه12عبوة1لتر', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0647 12 \\u0639\\u0628\\u0648\\u0629 1 \\u0644\\u062a\\u0631\"}', 'discount_on_product', 1, 0),
(20, 100017, 13, 1, '{\"id\":13,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0645\\u0646\\u0629\",\"slug\":\"smn-pM3ZLy\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63dec5e026.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63dec5fc49.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 12 \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"     \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=12\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":500,\\\"sku\\\":\\\"1230\\\",\\\"qty\\\":12222},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"142\\\",\\\"qty\\\":12222}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":24444,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:47:56.000000Z\",\"updated_at\":\"2022-08-19T23:54:21.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63dec60013.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 500, 0, 0, 'pending', 'unpaid', '2022-08-20 00:21:34', '2022-08-20 00:21:34', NULL, 'كرتونة=12علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0),
(21, 100018, 25, 1, '{\"id\":25,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631  \\u0645\\u0627\\u0646\\u062c\\u0648  1\\u0644\\u062a\\u0631\",\"slug\":\"aasyr-lmar-mango-1ltr-eoZ6Pj\",\"category_ids\":\"[{\\\"id\\\":\\\"55\\\",\\\"position\\\":1},{\\\"id\\\":\\\"59\\\",\\\"position\\\":2}]\",\"brand_id\":10,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-18-62fe544049a37.png\\\"]\",\"thumbnail\":\"2022-08-18-62fe54404b112.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0647 12 \\\\u0639\\\\u0628\\\\u0648\\\\u0629 1 \\\\u0644\\\\u062a\\\\u0631\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u064712\\\\u0639\\\\u0628\\\\u0648\\\\u06291\\\\u0644\\\\u062a\\\\u0631\\\",\\\"price\\\":120,\\\"sku\\\":\\\"15015\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":120,\"purchase_price\":110,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 &nbsp;\\u0645\\u0627\\u0646\\u062c\\u0648 &nbsp;1\\u0644\\u062a\\u0631<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-18T15:01:20.000000Z\",\"updated_at\":\"2022-08-19T23:54:11.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 \\u00a0\\u0645\\u0627\\u0646\\u062c\\u0648 \\u00a01\\u0644\\u062a\\u0631\",\"meta_description\":\"\\u0639\\u0635\\u064a\\u0631 \\u0644\\u0645\\u0627\\u0631 \\u00a0\\u0645\\u0627\\u0646\\u062c\\u0648 \\u00a01\\u0644\\u062a\\u0631\",\"meta_image\":\"2022-08-18-62fe54404b48a.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 120, 0, 2.4, 'pending', 'unpaid', '2022-08-20 00:23:27', '2022-08-20 00:23:27', NULL, 'كرتونه12عبوة1لتر', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0647 12 \\u0639\\u0628\\u0648\\u0629 1 \\u0644\\u062a\\u0631\"}', 'discount_on_product', 1, 0),
(22, 100019, 19, 1, '{\"id\":19,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0643\\u0631\",\"slug\":\"skr-NNwZ0e\",\"category_ids\":\"[{\\\"id\\\":\\\"32\\\",\\\"position\\\":1},{\\\"id\\\":\\\"35\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63d766d07f.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"details\":\"<p>\\u0633\\u0643\\u0631<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-17T17:30:07.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-20 00:46:55', '2022-08-20 00:46:55', NULL, '', '[]', 'discount_on_product', 1, 0),
(23, 100020, 27, 1, '{\"id\":27,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0634\\u0627\\u064a \\u0627\\u0644\\u0639\\u0631\\u0648\\u0633\\u0629 100 \\u062c\\u0645\",\"slug\":\"shay-alaaros-100-gm-VLPidx\",\"category_ids\":\"[{\\\"id\\\":\\\"65\\\",\\\"position\\\":1}]\",\"brand_id\":14,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-19-62ffc3be4735b.png\\\"]\",\"thumbnail\":\"2022-08-19-62ffc3be48a86.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 20\\\\u0643\\\\u064a\\\\u0644\\\\u0648\\\",\\\"\\\\u0643\\\\u064a\\\\u0644\\\\u0648  24 \\\\u0639\\\\u0628\\\\u0648\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u062920\\\\u0643\\\\u064a\\\\u0644\\\\u0648\\\",\\\"price\\\":1690,\\\"sku\\\":null,\\\"qty\\\":5},{\\\"type\\\":\\\"\\\\u0643\\\\u064a\\\\u0644\\\\u064824\\\\u0639\\\\u0628\\\\u0648\\\\u0629\\\",\\\"price\\\":84.5,\\\"sku\\\":null,\\\"qty\\\":100}]\",\"published\":0,\"unit_price\":1690,\"purchase_price\":1600,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":105,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-19T17:09:18.000000Z\",\"updated_at\":\"2022-08-19T23:54:12.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-19-62ffc3be48e17.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1690, 0, 0, 'pending', 'unpaid', '2022-08-20 01:02:48', '2022-08-20 01:02:48', NULL, 'كرتونة20كيلو', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 20\\u0643\\u064a\\u0644\\u0648\"}', 'discount_on_product', 1, 0),
(24, 100021, 22, 1, '{\"id\":22,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0635\\u0644\\u0635\\u0629 \\u0648\\u062a\\u0648\\u0627\\u0628\\u0644\",\"slug\":\"sls-otoabl-K7ICJ8\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1},{\\\"id\\\":\\\"38\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e7ca5f15.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":243,\"details\":\"\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-17T17:30:05.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-20 10:27:37', '2022-08-20 10:36:53', NULL, '', '[]', 'discount_on_product', 0, 0),
(25, 100022, 22, 1, '{\"id\":22,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0635\\u0644\\u0635\\u0629 \\u0648\\u062a\\u0648\\u0627\\u0628\\u0644\",\"slug\":\"sls-otoabl-K7ICJ8\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1},{\\\"id\\\":\\\"38\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e7ca5f15.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":243,\"details\":\"\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-20T10:36:53.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-20 10:41:31', '2022-08-20 10:41:31', NULL, '', '[]', 'discount_on_product', 1, 0),
(26, 100023, 19, 1, '{\"id\":19,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0643\\u0631\",\"slug\":\"skr-NNwZ0e\",\"category_ids\":\"[{\\\"id\\\":\\\"32\\\",\\\"position\\\":1},{\\\"id\\\":\\\"35\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63d766d07f.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":99,\"details\":\"<p>\\u0633\\u0643\\u0631<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-20T00:46:55.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 100, 0, 0, 'delivered', 'paid', '2022-08-20 11:53:05', '2022-08-20 11:53:05', NULL, '', '[]', 'discount_on_product', 1, 0),
(27, 100024, 13, 1, '{\"id\":13,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0633\\u0645\\u0646\\u0629\",\"slug\":\"smn-pM3ZLy\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-12-62f63dec5e026.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63dec5fc49.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"\\\\u0627\\\\u0644\\\\u062d\\\\u062c\\\\u0645\\\",\\\"options\\\":[\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629 = 12 \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"     \\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"\\\\u0643\\\\u0631\\\\u062a\\\\u0648\\\\u0646\\\\u0629=12\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":500,\\\"sku\\\":\\\"1230\\\",\\\"qty\\\":12221},{\\\"type\\\":\\\"\\\\u0639\\\\u0644\\\\u0628\\\\u0629\\\",\\\"price\\\":100,\\\"sku\\\":\\\"142\\\",\\\"qty\\\":12222}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":24443,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-12T11:47:56.000000Z\",\"updated_at\":\"2022-08-20T00:21:34.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-12-62f63dec60013.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 500, 0, 0, 'pending', 'unpaid', '2022-08-20 12:21:12', '2022-08-20 12:21:12', NULL, 'كرتونة=12علبة', '{\"\\u0627\\u0644\\u062d\\u062c\\u0645\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\"}', 'discount_on_product', 1, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(28, 100025, 22, 1, '{\"id\":22,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0635\\u0644\\u0635\\u0629 \\u0648\\u062a\\u0648\\u0627\\u0628\\u0644\",\"slug\":\"sls-otoabl-K7ICJ8\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1},{\\\"id\\\":\\\"38\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e7ca5f15.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":242,\"details\":\"\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-20T10:41:31.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 0, 'pending', 'unpaid', '2022-08-20 18:20:26', '2022-08-20 18:20:26', NULL, '', '[]', 'discount_on_product', 1, 0),
(29, 100025, 21, 1, '{\"id\":21,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0628\\u0642\\u0648\\u0644\\u064a\\u0627\\u062a\",\"slug\":\"bkolyat-zaTkUu\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"position\\\":1},{\\\"id\\\":\\\"39\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":10,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f63e21578f4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":55,\"tax\":0,\"tax_type\":null,\"discount\":12,\"discount_type\":\"flat\",\"current_stock\":17248,\"details\":\"<p>\\u0628\\u0642\\u0648\\u0644\\u064a\\u0627\\u062a<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-17T17:30:06.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 0, 12, 'pending', 'unpaid', '2022-08-20 18:20:26', '2022-08-20 18:20:26', NULL, '', '[]', 'discount_on_product', 1, 0),
(30, 100025, 24, 1, '{\"id\":24,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0646\\u062a\\u062c 1\",\"slug\":\"mntg-1-HBqZTD\",\"category_ids\":\"[{\\\"id\\\":\\\"32\\\",\\\"position\\\":1},{\\\"id\\\":\\\"35\\\",\\\"position\\\":2},{\\\"id\\\":\\\"0\\\",\\\"position\\\":3}]\",\"brand_id\":12,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"2022-08-12-62f6926cbd4a6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":200,\"tax\":0,\"tax_type\":null,\"discount\":2,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":\"<p>\\u0648\\u0635\\u0641 \\u0645\\u0646\\u062a\\u062c 1<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-17T17:30:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":null,\"multiply_qty\":null,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 150, 0, 2, 'pending', 'unpaid', '2022-08-20 18:20:26', '2022-08-20 18:20:26', NULL, '', '[]', 'discount_on_product', 1, 0),
(31, 100025, 31, 1, '{\"id\":31,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0634\\u0648\\u064a\\u0628\\u0633 \\u062c\\u0648\\u0644\\u062f \\u064a\\u0648\\u0633\\u0641\\u064a250\\u0645\\u0644\",\"slug\":\"shoybs-gold-yosfy250ml-aYEvbL\",\"category_ids\":\"[{\\\"id\\\":\\\"80\\\",\\\"position\\\":1}]\",\"brand_id\":13,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-20-63011d788ad9b.png\\\"]\",\"thumbnail\":\"2022-08-20-63011d788c443.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":11,\"purchase_price\":10,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-20T17:44:24.000000Z\",\"updated_at\":\"2022-08-20T18:14:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-20-63011d788c7cc.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 11, 0, 0, 'pending', 'unpaid', '2022-08-20 18:20:26', '2022-08-20 18:20:26', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100002, '400.00', '400.00', '0.00', 'delivery man', 'disburse', '5.00', '0.00', '2022-08-02 11:09:34', '2022-08-02 11:09:34', 5, 'admin', 'delivery man', 'cash_on_delivery', '3239-N5ZFh-1659438574', 1),
(1, 100011, '100.00', '100.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2022-08-12 11:53:53', '2022-08-12 11:53:53', 13, 'admin', 'admin', 'cash_on_delivery', '2993-Fnsnn-1660305233', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('aymanalirajeh@gmail.com', 'Z6TMqmNMVax2DBsI8bHBNYHM5F42DyIP6zOlBlpFQ8IGWPR2pQWdJJOc3nNyKtuvLy9hLMHBS7Ls4fVAF2TUVBXNuaqNhroJASMRXciuxSEveMRbYAYL2lHP', '2022-08-05 22:15:12', 'customer'),
('z.m.rajeh302@gmail.com', 'MzxKmoP6NcrG0FXVX70TpOfLY56YurWIJ95EkBNPhiL5cVKBCDkXI8oI20SfeZveR7M4Tn7W3pBvkgYbOKsS9GVvG1LEys9WuZwvmBRPZn1UPn5cK07tfK0M', '2022-08-08 03:32:35', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`) VALUES
(11, 'admin', 1, 'ريحانة', 'ryhan-uGAIwk', '[{\"id\":\"30\",\"position\":1},{\"id\":\"36\",\"position\":2}]', 8, 'kg', 1, 1, '[\"2022-08-12-62f581479ffa2.png\"]', '2022-08-12-62f58147a0245.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 100, '0', 'percent', '0', 'flat', 96, '<p>ريحانة</p>', 0, NULL, '2022-08-12 07:23:03', '2022-08-12 11:48:17', 0, 1, NULL, NULL, '2022-08-12-62f58147a02e5.png', 1, NULL, 0.00, 0, NULL, NULL),
(12, 'admin', 1, 'سكر', 'skr-WvWF20', '[{\"id\":\"32\",\"position\":1},{\"id\":\"35\",\"position\":2}]', 12, 'kg', 1, 1, '[\"2022-08-12-62f63d766b4b9.png\"]', '2022-08-12-62f63d766d07f.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 55, '0', 'percent', '0', 'flat', 100, '<p>سكر</p>', 0, NULL, '2022-08-12 11:45:58', '2022-08-19 23:54:21', 0, 1, NULL, NULL, '2022-08-12-62f63d766d420.png', 1, NULL, 0.00, 0, NULL, NULL),
(13, 'admin', 1, 'سمنة', 'smn-pM3ZLy', '[{\"id\":\"30\",\"position\":1},{\"id\":\"36\",\"position\":2}]', 12, 'kg', 1, 1, '[\"2022-08-12-62f63dec5e026.png\"]', '2022-08-12-62f63dec5fc49.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\",\"     \\u0639\\u0644\\u0628\\u0629\"]}]', '[{\"type\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629=12\\u0639\\u0644\\u0628\\u0629\",\"price\":500,\"sku\":\"1230\",\"qty\":12220},{\"type\":\"\\u0639\\u0644\\u0628\\u0629\",\"price\":100,\"sku\":\"142\",\"qty\":12222}]', 0, 100, 55, '0', 'percent', '0', 'flat', 24442, NULL, 0, NULL, '2022-08-12 11:47:56', '2022-08-20 12:21:12', 1, 1, NULL, NULL, '2022-08-12-62f63dec60013.png', 1, NULL, 0.00, 0, NULL, NULL),
(14, 'admin', 1, 'بقوليات', '-Bp7VIz', '[{\"id\":\"29\",\"position\":1},{\"id\":\"39\",\"position\":2}]', 10, 'kg', 1, 1, '[\"2022-08-12-62f63e2155c7e.png\"]', '2022-08-12-62f63e21578f4.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\",\"  \\u0639\\u0644\\u0628\\u0629\"]}]', '[{\"type\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629=12\\u0639\\u0644\\u0628\\u0629\",\"price\":500,\"sku\":\"5230\",\"qty\":13124},{\"type\":\"\\u0639\\u0644\\u0628\\u0629\",\"price\":100,\"sku\":\"1245\",\"qty\":4124}]', 0, 100, 55, '0', 'percent', '12', 'flat', 17248, '<p>بقوليات</p>', 0, NULL, '2022-08-12 11:48:49', '2022-08-19 23:54:21', 1, 1, NULL, NULL, '2022-08-12-62f63e2157ca0.png', 1, NULL, 0.00, 0, NULL, NULL),
(15, 'admin', 1, 'صلصة وتوابل', 'sls-otoabl-lcSrsS', '[{\"id\":\"29\",\"position\":1},{\"id\":\"38\",\"position\":2}]', 10, 'kg', 1, 1, '[\"2022-08-12-62f63e7ca4334.png\"]', '2022-08-12-62f63e7ca5f15.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 = 12 \\u0639\\u0644\\u0628\\u0629\",\"   \\u0639\\u0644\\u0628\\u0629\"]}]', '[{\"type\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629=12\\u0639\\u0644\\u0628\\u0629\",\"price\":500,\"sku\":\"1222\",\"qty\":121},{\"type\":\"\\u0639\\u0644\\u0628\\u0629\",\"price\":100,\"sku\":\"15\",\"qty\":122}]', 0, 100, 55, '0', 'percent', '0', 'flat', 243, NULL, 0, NULL, '2022-08-12 11:50:20', '2022-08-17 17:30:09', 1, 1, NULL, NULL, '2022-08-12-62f63e7ca62ea.png', 1, NULL, 0.00, 0, NULL, NULL),
(17, 'admin', 1, 'منتج 1', 'mntg-1-euCUhM', '[{\"id\":\"32\",\"position\":1},{\"id\":\"35\",\"position\":2}]', 12, 'kg', 1, 1, '[\"2022-08-12-62f6926cbb967.png\"]', '2022-08-12-62f6926cbd4a6.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 200, '0', 'percent', '2', 'flat', 45, '<p>وصف منتج 1</p>', 0, NULL, '2022-08-12 17:48:28', '2022-08-18 21:40:23', 1, 1, NULL, NULL, '2022-08-12-62f6926cbd8e8.png', 1, NULL, 0.00, 0, NULL, NULL),
(18, 'admin', 1, 'ريحانة', 'ryhan-eNqgJt', '[{\"id\":\"30\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 8, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f58147a0245.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 100, 100, '0', NULL, '0', 'flat', 96, '<p>ريحانة</p>', 0, NULL, NULL, '2022-08-17 17:30:07', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(19, 'admin', 1, 'سكر', 'skr-NNwZ0e', '[{\"id\":\"32\",\"position\":1},{\"id\":\"35\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 12, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f63d766d07f.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 100, 55, '0', NULL, '0', 'flat', 95, '<p>سكر</p>', 0, NULL, NULL, '2022-08-20 11:53:05', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(20, 'admin', 1, 'سمنة', 'smn-n4w3sJ', '[{\"id\":\"30\",\"position\":1},{\"id\":\"36\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 12, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f63dec5fc49.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 100, 55, '0', NULL, '0', 'flat', 24444, '', 0, NULL, NULL, '2022-08-17 17:30:06', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(21, 'admin', 1, 'بقوليات', 'bkolyat-zaTkUu', '[{\"id\":\"29\",\"position\":1},{\"id\":\"39\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 10, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f63e21578f4.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 100, 55, '0', NULL, '12', 'flat', 17247, '<p>بقوليات</p>', 0, NULL, NULL, '2022-08-20 18:20:26', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(22, 'admin', 1, 'صلصة وتوابل', 'sls-otoabl-K7ICJ8', '[{\"id\":\"29\",\"position\":1},{\"id\":\"38\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 10, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f63e7ca5f15.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 100, 55, '0', NULL, '0', 'flat', 241, '', 0, NULL, NULL, '2022-08-20 18:20:26', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(24, 'admin', 1, 'منتج 1', 'mntg-1-HBqZTD', '[{\"id\":\"32\",\"position\":1},{\"id\":\"35\",\"position\":2},{\"id\":\"0\",\"position\":3}]', 12, 'kg', 1, 1, '[\"def.png\"]', '2022-08-12-62f6926cbd4a6.png', '1', NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, 150, 200, '0', NULL, '2', 'flat', 49, '<p>وصف منتج 1</p>', 0, NULL, NULL, '2022-08-20 18:20:26', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(25, 'admin', 1, 'عصير لمار  مانجو  1لتر', 'aasyr-lmar-mango-1ltr-eoZ6Pj', '[{\"id\":\"55\",\"position\":1},{\"id\":\"59\",\"position\":2}]', 10, 'ltrs', 1, 1, '[\"2022-08-20-6300cbdc9198e.png\"]', '2022-08-20-6300cbdc93782.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0647 12 \\u0639\\u0628\\u0648\\u0629 1 \\u0644\\u062a\\u0631\"]}]', '[{\"type\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u064712\\u0639\\u0628\\u0648\\u06291\\u0644\\u062a\\u0631\",\"price\":120,\"sku\":\"15015\",\"qty\":0}]', 0, 120, 110, '0', 'percent', '2', 'percent', 0, '<p>عصير لمار &nbsp;مانجو &nbsp;1لتر</p>', 0, NULL, '2022-08-18 15:01:20', '2022-08-20 11:56:47', 1, 1, 'عصير لمار  مانجو  1لتر', 'عصير لمار  مانجو  1لتر', '2022-08-20-6300cbdc94091.png', 1, NULL, 0.00, 0, NULL, NULL),
(26, 'admin', 1, 'أبو عوف بندق - 200جم', 'abo-aaof-bndk-200gm-8GAWld', '[{\"id\":\"65\",\"position\":1}]', 14, 'kg', 1, 1, '[\"2022-08-19-62ffbe2644c3a.png\",\"2022-08-19-62ffbe7b3dd3e.png\"]', '2022-08-19-62ffbe7b3f53f.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0639\\u0628\\u0648\\u0629 12 \\u0643\\u064a\\u0633\"]}]', '[{\"type\":\"\\u0639\\u0628\\u0648\\u062912\\u0643\\u064a\\u0633\",\"price\":50,\"sku\":null,\"qty\":50}]', 0, 50, 47, '0', 'percent', '0', 'flat', 50, NULL, 0, NULL, '2022-08-19 16:45:26', '2022-08-19 23:54:12', 1, 1, NULL, NULL, '2022-08-19-62ffbe26468c9.png', 1, NULL, 0.00, 0, NULL, NULL),
(27, 'admin', 1, 'شاي العروسة 100 جم', 'shay-alaaros-100-gm-VLPidx', '[{\"id\":\"65\",\"position\":1}]', 14, 'kg', 1, 1, '[\"2022-08-19-62ffc3be4735b.png\"]', '2022-08-19-62ffc3be48a86.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"\\u0627\\u0644\\u062d\\u062c\\u0645\",\"options\":[\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u0629 20\\u0643\\u064a\\u0644\\u0648\",\"  \\u0643\\u064a\\u0644\\u0648  24 \\u0639\\u0628\\u0648\\u0629\"]}]', '[{\"type\":\"\\u0643\\u0631\\u062a\\u0648\\u0646\\u062920\\u0643\\u064a\\u0644\\u0648\",\"price\":1690,\"sku\":null,\"qty\":4},{\"type\":\"\\u0643\\u064a\\u0644\\u064824\\u0639\\u0628\\u0648\\u0629\",\"price\":84.5,\"sku\":null,\"qty\":100}]', 0, 1690, 1600, '0', 'percent', '0', 'flat', 104, NULL, 0, NULL, '2022-08-19 17:09:18', '2022-08-20 16:59:57', 1, 1, NULL, NULL, '2022-08-20-6301130d0c563.png', 1, NULL, 0.00, 0, NULL, NULL),
(28, 'admin', 1, 'شويبس جولد ليمون ونعناع 250مل', 'shoybs-gold-lymon-onaanaaa-250ml-ar2gWv', '[{\"id\":\"80\",\"position\":1},{\"id\":\"98\",\"position\":2}]', 13, 'kg', 1, 1, '[\"2022-08-20-630119a21abaa.png\"]', '2022-08-20-630119a21c893.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 6, 5, '0', 'percent', '0', 'flat', 0, NULL, 0, NULL, '2022-08-20 17:28:02', '2022-08-20 17:29:48', 1, 1, NULL, NULL, '2022-08-20-630119a21ccf3.png', 1, NULL, 0.00, 0, NULL, NULL),
(29, 'admin', 1, 'شوبيس جولد اناناس 250 مل', 'shobys-gold-ananas-250-ml-cAbQrh', '[{\"id\":\"80\",\"position\":1},{\"id\":\"99\",\"position\":2}]', 13, 'kg', 1, 1, '[\"2022-08-20-63011a99c3b95.png\"]', '2022-08-20-63011a99c5567.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 6, 5, '0', 'percent', '0', 'flat', 0, NULL, 0, NULL, '2022-08-20 17:32:09', '2022-08-20 17:32:09', 1, 1, NULL, NULL, '2022-08-20-63011a99c59ae.png', 1, NULL, 0.00, 0, NULL, NULL),
(30, 'admin', 1, 'شويبس جولد رمان 1 لتر محمول', 'shoybs-gold-rman-1-ltr-mhmol-HH8jS1', '[{\"id\":\"80\",\"position\":1}]', 13, 'kg', 1, 1, '[\"2022-08-20-63011c59e1581.png\"]', '2022-08-20-63011c59e2c11.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 12, 11, '0', 'percent', '0', 'flat', 0, NULL, 0, NULL, '2022-08-20 17:39:37', '2022-08-20 17:39:37', 1, 1, NULL, NULL, '2022-08-20-63011c59e2f9a.png', 1, NULL, 0.00, 0, NULL, NULL),
(31, 'admin', 1, 'شويبس جولد يوسفي250مل', 'shoybs-gold-yosfy250ml-aYEvbL', '[{\"id\":\"80\",\"position\":1}]', 13, 'kg', 1, 1, '[\"2022-08-20-63011d788ad9b.png\"]', '2022-08-20-63011d788c443.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 11, 10, '0', 'percent', '0', 'flat', 9, NULL, 0, NULL, '2022-08-20 17:44:24', '2022-08-20 18:20:26', 1, 1, NULL, NULL, '2022-08-20-63011d788c7cc.png', 1, NULL, 0.00, 0, NULL, NULL),
(32, 'admin', 1, 'بيبسي كانز ستار 330مل', 'bybsy-kanz-star-330ml-eh15bG', '[{\"id\":\"31\",\"position\":1},{\"id\":\"61\",\"position\":2}]', 7, 'kg', 1, 1, '[\"2022-08-20-6301237cb8624.png\"]', '2022-08-20-6301237cb9edf.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 6, 5, '0', 'percent', '0', 'flat', 0, NULL, 0, NULL, '2022-08-20 18:10:04', '2022-08-20 18:10:04', 1, 1, NULL, NULL, '2022-08-20-6301237cba264.png', 1, NULL, 0.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 14, 13, 'ممتازة جدا', '[]', 5, 1, '2022-08-12 11:54:13', '2022-08-12 11:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2022-08-02 11:09:34', '2022-08-02 11:09:34', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '2', 'Bahgi Bahgi', 'Home', 'و', 'ا', '5', '+201157276799', '2022-07-23 11:41:37', '2022-07-23 11:41:37', NULL, NULL, '30.640853256980744', '31.08023006469011', 0),
(2, '2', 'Bahgi Bahgiش', 'Home', 'ش', 'ل', '8', '+201157276799', '2022-07-23 12:07:25', '2022-07-23 12:07:25', NULL, NULL, '30.64085296851624', '31.080225370824333', 0),
(3, '2', 'Bahgi Bahgi', 'Home', 'ش', 'ن', '54', '+201157276799', '2022-07-23 12:07:44', '2022-07-23 12:07:44', NULL, NULL, '30.640853256980744', '31.08023073524237', 1),
(4, '0', 'ahmed elbahgi', 'home', 'ahmedashraf, ashmeasjra\r\nashme asjra', 'cairo', '11865', '+201157276799', '2022-07-25 06:20:20', '2022-07-25 06:20:20', NULL, NULL, '', '', 0),
(5, '0', 'DARB ALMOTMYZON EST', 'permanent', 'Jeddah', 'Jeddah', '22230', '0578163625', '2022-08-03 08:16:20', '2022-08-03 08:16:20', NULL, NULL, '', '', 0),
(7, '10', 'Hhh Hhhq', 'Home', '6g', 'g', '8', '+96612345677', '2022-08-05 23:32:32', '2022-08-05 23:32:32', NULL, NULL, '30.6408071026516', '31.080164685845375', 0),
(8, '9', 'ايمن راجح', 'Home', 'الرياض', 'الرياض', '23332', '+966578163625', '2022-08-06 03:02:57', '2022-08-06 03:02:57', NULL, NULL, '0.0013937428592307173', '-0.0000278279185295105', 1),
(9, '9', 'ايمن راجح', 'Home', '3g', 'rrr', '23322', '+966578163625', '2022-08-06 04:04:55', '2022-08-06 04:04:55', NULL, NULL, '24.558366756128684', '46.61802984774113', 0),
(10, '12', 'ahmed ashraf', 'home', 'ahmedashraf, ashmeasjra, ashme asjr', 'cairo', '11865', '+201157276799', '2022-08-12 07:26:56', '2022-08-12 07:26:56', NULL, NULL, '', '', 0),
(11, '0', 'ياقوت', 'home', 'مصر\r\nالسبع', 'بركةالسبع', '11865', '+201157276799', '2022-08-12 11:53:05', '2022-08-12 11:53:05', NULL, NULL, '', '', 0),
(12, '0', 'نظام ادارة فواتير', 'home', 'القاهرة', 'مدينة نصر', '11865', '+201157276799', '2022-08-12 14:49:27', '2022-08-12 14:49:27', NULL, NULL, '', '', 0),
(13, '17', 'Adham Adham', 'Home', 'test', 'test', 'test', '+2001157276700', '2022-08-20 00:21:31', '2022-08-20 00:21:31', NULL, NULL, '30.640821525881808', '31.080174744129177', 0),
(14, '17', 'Adham Adham', 'Home', 'شاهين، مدينة بركة السبع،، J3RJ+823, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6164044, Egypt', 'y', 'h', '+2001157276700', '2022-08-20 00:46:52', '2022-08-20 00:46:52', NULL, NULL, '30.640747678920395', '31.080115064978603', 0),
(15, '18', 'رضا محمد', 'Workplace', 'الحى الحادى عشر، الشيخ زايد،، 2XW8+HXH, Sheikh Zayed City, Giza Governorate 3242760, Egypt', 'guze', '1125', '+201159627492', '2022-08-20 10:27:27', '2022-08-20 10:27:27', NULL, NULL, '30.046458394870015', '30.967357680201534', 0),
(16, '20', 'محمود رمضان', 'Home', 'الحي الرابع', 'اكتوبر', 'الجيزة', '+2001118805161', '2022-08-20 18:19:41', '2022-08-20 18:19:41', NULL, NULL, '0.0', '0.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', '5.00', '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', '', 'fa fa-twitter', 0, 1, '2020-12-31 21:18:03', '2022-08-06 22:30:04'),
(2, 'linkedin', '', 'fa fa-linkedin', 0, 1, '2021-02-27 16:23:01', '2022-08-06 22:30:12'),
(3, 'google-plus', '', 'fa fa-google-plus-square', 0, 1, '2021-02-27 16:23:30', '2022-08-06 22:30:17'),
(4, 'pinterest', '', 'fa fa-pinterest', 0, 1, '2021-02-27 16:24:14', '2022-08-06 22:30:22'),
(5, 'instagram', '', 'fa fa-instagram', 0, 1, '2021-02-27 16:24:36', '2022-08-06 22:30:27'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 0, 1, '2021-02-27 19:19:42', '2022-08-06 22:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'تم التأخر في تسليم الطلب', 'تأخر في تسليم الطلب', 'low', 'المندوب كذاب', NULL, 'open', '2022-08-06 14:43:05', '2022-08-06 22:02:15'),
(2, 18, 'k', 'شكوي مندوب التوصيل', 'low', 'k', NULL, 'pending', '2022-08-20 10:42:59', '2022-08-20 10:42:59'),
(3, 18, 'غ', 'رد سيئ من جانب الإدارة', 'low', 'غ', NULL, 'pending', '2022-08-20 11:59:44', '2022-08-20 11:59:44'),
(4, 18, 'ل', 'تأخر في تسليم الطلب', 'low', 'ل', NULL, 'pending', '2022-08-20 11:59:58', '2022-08-20 11:59:58'),
(5, 18, 'ش', 'شكوي مندوب التوصيل', 'low', 'ش', NULL, 'pending', '2022-08-20 12:00:04', '2022-08-20 12:00:04'),
(6, 17, 'ت', 'شكوي مندوب التوصيل', 'low', 'ن', NULL, 'pending', '2022-08-20 12:00:08', '2022-08-20 12:00:08'),
(7, 18, 'ش', 'رد سيئ من جانب الإدارة', 'low', 'ش', NULL, 'pending', '2022-08-20 12:00:10', '2022-08-20 12:00:10'),
(8, 18, 'ش', 'تفاصيل أخري', 'low', 'ش', NULL, 'pending', '2022-08-20 12:00:17', '2022-08-20 12:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_convs`
--

INSERT INTO `support_ticket_convs` (`id`, `support_ticket_id`, `admin_id`, `customer_message`, `admin_message`, `position`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'hey', NULL, 0, '2022-08-20 11:44:07', '2022-08-20 11:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 15, 'eg', 'name', 'صلصة وتوابل', 14),
('App\\Model\\Product', 15, 'eg', 'description', '<p>صلصة وتوابل</p>', 15),
('App\\Model\\Product', 14, 'eg', 'name', 'بقوليات', 16),
('App\\Model\\Product', 14, 'eg', 'description', '<p>بقوليات</p>', 17),
('App\\Model\\Product', 13, 'eg', 'name', 'سمنة', 18),
('App\\Model\\Product', 13, 'eg', 'description', '<p>سمنة</p>', 19),
('App\\Model\\Category', 60, 'eg', 'name', 'منظفات  - مطهرات', 22),
('App\\Model\\Product', 26, 'eg', 'name', 'أبو عوف بندق - 200جم', 23),
('App\\Model\\Product', 25, 'eg', 'name', 'عصير لمار  مانجو  1لتر', 24),
('App\\Model\\Product', 25, 'eg', 'description', '<p>عصير لمار &nbsp;مانجو &nbsp;1لتر</p>', 25),
('App\\Model\\Product', 27, 'eg', 'name', 'شاي العروسة 100 جم', 26),
('App\\Model\\Product', 31, 'eg', 'name', 'شويبس جولد يوسفي250مل', 27);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'Bahgi', 'Bahgi', '+201157276799', 'def.png', 'bahgi@gmail.com', NULL, '$2y$10$Y0nc2D6pfIAN8un4ObvWee2BD4VRNYpbFUEIcjLNWqFyai0wllbcO', NULL, '2022-07-23 13:51:32', '2022-07-23 13:51:32', NULL, NULL, NULL, NULL, NULL, NULL, 'cHJ5DbV8TRe2b08img2qx1:APA91bHHN7AB61E3Xdirt18yyULVYPBAQdVkl9d0hCk073awNQVv90nYKgO7quiEqhZrGInmKhHXMAfmi_IoCid5XKCSF-ozAVvh4po-upuBWvA8JgzFFOYjmXld27FdrXGLp9zTtCrI', 1, NULL, NULL, NULL, NULL, NULL, 0, 'tQGZHAbeoL3tYvjs5xcHFhZbm4Hp55b7IMEKhHzB', 0, NULL, NULL),
(3, NULL, 'احمد', 'احمد', '+201157276790', 'def.png', 'ahmedashrafelbahgi@gmail.com', NULL, '$2y$10$Eorsh.4ZinNabtlk00QbiOo.xWh.spH6o7b6fs0hEW9Yri/wVCJMm', NULL, '2022-07-24 07:59:09', '2022-07-24 07:59:09', NULL, NULL, NULL, NULL, NULL, NULL, 'cHJ5DbV8TRe2b08img2qx1:APA91bHHN7AB61E3Xdirt18yyULVYPBAQdVkl9d0hCk073awNQVv90nYKgO7quiEqhZrGInmKhHXMAfmi_IoCid5XKCSF-ozAVvh4po-upuBWvA8JgzFFOYjmXld27FdrXGLp9zTtCrI', 1, NULL, NULL, NULL, NULL, NULL, 0, 'IXbryzQQIk7HbSDI0u0AXAEEq3d5S12Bg60lpFYp', 0, NULL, NULL),
(4, NULL, 'احمد', 'أشرف', '+201157276747', 'def.png', 'rehamsaeed567@gmail.com', NULL, '$2y$10$o20QcwviDy0Bvdku72.kUOhxBaTH/H9eCTiMaoWlHpnG3LiIXhbFC', NULL, '2022-07-24 08:09:22', '2022-07-24 08:09:22', NULL, NULL, NULL, NULL, NULL, NULL, 'cHJ5DbV8TRe2b08img2qx1:APA91bHHN7AB61E3Xdirt18yyULVYPBAQdVkl9d0hCk073awNQVv90nYKgO7quiEqhZrGInmKhHXMAfmi_IoCid5XKCSF-ozAVvh4po-upuBWvA8JgzFFOYjmXld27FdrXGLp9zTtCrI', 1, NULL, NULL, NULL, NULL, NULL, 0, 'Mx2LH9guP5a8NJD6P2qrNQ1WuQsVGTxiXiekPCEB', 0, NULL, NULL),
(5, NULL, 'ahmed', 'elbahgi', '01157276799', 'def.png', 'admin@gmail.com', NULL, '$2y$10$O5jwMe9eE8Nt8QoXAKpnm.tYMWGJqZO51CkBZHh96UP0ljAeuZd0m', NULL, '2022-07-25 06:19:16', '2022-08-05 22:16:50', NULL, NULL, NULL, NULL, NULL, NULL, 'fZo9pUaeS3mlqQUx5fOGNx:APA91bEVoigoogpAWjp5MyPb7oruJxpegBoNSx_lsKQC-u1L-F8ZsKhQPshomSHxmfoUPrXyGrovHSlcxPoaWact6sd90aJSxCbuV5vjQSQtleMgVilolLqFbR76AgkN_ksIGk481hRL', 1, NULL, NULL, NULL, NULL, NULL, 0, 's1mIkdGWcY4SfKrQA4qM0bZbnJ28vO8P0mbERkes', 0, NULL, NULL),
(6, NULL, 'ايمن', 'راجح', '0578163625', 'def.png', 'aymanalirajeh@gmail.com', NULL, '$2y$10$/KQSKRBUsf8hsvTULkWG1OevtxkFaDnpSeKFRtBGM.D46PhG7nv9C', 'N9Pev7C0D568cVXphbrO39ec2UG5cn3rRhYaMTjC0lZgIfe90vx5ImxyNbQh', '2022-08-03 06:43:42', '2022-08-05 22:29:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(7, NULL, 'زيد', 'معين', '0568328635', 'def.png', 'z.m.rajeh302@gmail.com', NULL, '$2y$10$dJ0cNWH85iHYC9BJOi8rEOl9L1hATuY2ZoK/G62NckzAf/AHtDNZS', NULL, '2022-08-03 20:06:55', '2022-08-03 20:06:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(8, NULL, 'احمد', 'اشرف', '+96612345678', 'def.png', 'drive@gmail.com', NULL, '$2y$10$Dn.HeQGKz7RgQMj.O0eU5e.7C6AZUBtg7hq740tSaNKQKOi7I11pG', NULL, '2022-08-05 06:17:29', '2022-08-05 06:22:27', NULL, NULL, NULL, NULL, NULL, NULL, 'dpxgrS99Sj-bu549daypMA:APA91bG3etIekLI9p4fwPUjrqJofAe0GHPbA3SKIKK1mlewzSSMeWr9oAjDAHC17EfqxyJDSkmNlKyXFJGv8ErGPX1ifsOitAJ5jwZTiIrSPDKpK2LNjwiMDTKmAKEHAkDNWoLTtBZbj', 1, NULL, NULL, NULL, NULL, NULL, 0, 'lFnkpeoBvtPgrc7qpzwokLuha4BBhvA6rNrfdf54', 0, NULL, NULL),
(9, NULL, 'ايمن', 'راجح', '+966578163625', 'def.png', 'aymanalirajeh123@gmail.com', NULL, '$2y$10$75GdKfnyG9alk3F56ZwTIew6.XPkUQDhlngGMARKk7jmFd0pdLVEu', NULL, '2022-08-05 22:44:22', '2022-08-06 04:01:55', NULL, NULL, NULL, NULL, NULL, NULL, 'f3ALy1iYRlya6sFL4szZAW:APA91bH7ypGXXnM46ciSNRXMEJCLsmiM9Myd5pRiHT3iTIyC_56aaUxO23xE872udRfgwMcQSp76Go47an_aLKZTgZOrY961Ia3rP5rEGmrQtXR7LrE1ZseAB8UmhBeXI_FBE6zBxoAU', 1, NULL, NULL, NULL, NULL, NULL, 0, 'r98hAM6yKIzyQ6LRO25ikyWz9Pq91fmZwUUKp7vP', 0, NULL, NULL),
(10, NULL, 'Hhh', 'Hhh', '+96612345677', 'def.png', 'h@gmail.com', NULL, '$2y$10$gmQRG9On37QHFuZainVC8Oe5IS9kJztqtzc0Fk8k3Oqo4nQV5RSjG', NULL, '2022-08-05 23:11:01', '2022-08-19 23:49:58', NULL, NULL, NULL, NULL, NULL, NULL, 'e4e7IG58TPSDEXe9hZ5QMS:APA91bHzvWLmNvzkp9N6c1jkA1TJiSpN9_if7qPkUyh2GMycQjqNXJIDX_1AG2-DNboMwT7HN-sh1d8w1ugAnE-33M7mtQkQfCvYl6-fwkXmGG_gulX4FxcQhpO66l2-izwMWH5fbSoW', 1, NULL, NULL, NULL, NULL, NULL, 0, 'bGGukG3jHBhqaCmAEXzW037rasBnl0Uy0T6AQgKg', 0, NULL, NULL),
(11, NULL, 'اسماعيل', 'راجح', '+9660596726713', 'def.png', 'smaylrajh14@gmail.com', NULL, '$2y$10$R0CTGPNOOfxR8QvOWcviwe6w9cVRDMgj7DOpDNOEXz6ypEGVM5KHi', NULL, '2022-08-05 23:12:20', '2022-08-05 23:13:55', NULL, NULL, NULL, NULL, NULL, NULL, 'cPBxla8vRkmuGd4mbkfsGO:APA91bGtcMI58DR2caDk-RZmROavvzx8okAvTCO_x50qJ1Q0KYZEoNhyBX3xPi9adEUT41_yP4EJiXcvwPDb9ruEaJqn56V6YfKgO0EB6Y1ol-Xu97AarKbxFoDpHnpLnjvDNggw8X-R', 1, NULL, NULL, NULL, NULL, NULL, 0, 'Bg0tD0NCf0tY2NQMHCmEKdyD3aHmdBUjXrEtmc6K', 0, NULL, NULL),
(12, NULL, '0111171799', 'ashraf', '1234567890', 'def.png', 'ahmedashrafelbah11@gmail.com', NULL, '$2y$10$xgog9QfBACav.8v/i56nBe/8eqduAOE5Ke2zR9C66/9708pB1f296', NULL, '2022-08-12 07:26:06', '2022-08-12 07:26:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(13, NULL, 'البهجي', 'احمد', '01157276791', 'def.png', 'admin1@admin.com', NULL, '$2y$10$R3SLyxcJKS9yixcSQ9oqp.wOvzdtmShutJESYYe5JeSuRt/vcb1Vy', NULL, '2022-08-12 11:51:54', '2022-08-12 11:51:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(14, NULL, 'Ahmed', 'The', '+201234567890', 'def.png', 'ahmed@gmail.com', NULL, '$2y$10$ohxEQ5j8RI3o7MHQ9atlg.X0jffIbdjJdrQmc19gtbDh9hYV0bK2a', NULL, '2022-08-13 21:11:45', '2022-08-13 21:11:45', NULL, NULL, NULL, NULL, NULL, NULL, 'f9SwuDBySMqBCyutJ9mUrT:APA91bHVI5DqUQu18NM5dWw0Lb5S7_ZBoipvYBGGO6UxQXh6CUQWAgiDoDyf9EefxnTP4eXcbBuQgCUK-pqOhMCaMjx_6W1D7Rq-j3huzoKYTC65tDtv03UjNWtvKbT0RPx_uo6Nc8oK', 1, NULL, NULL, NULL, NULL, NULL, 0, 'Ko0MGN7EKiKJun2I5nMve444cfJtZcJZVf1icl6S', 0, NULL, NULL),
(15, NULL, 'اسلام', 'سعيد', '+2001122945133', 'def.png', 'islamsaeedx9@gmail.com', NULL, '$2y$10$MdVSI6t7hmveEvKGh.bBj.ENigHDGCVC4nnUn/yLr/X5M12ojpfke', NULL, '2022-08-13 23:07:46', '2022-08-13 23:07:46', NULL, NULL, NULL, NULL, NULL, NULL, 'exlYObeWRRWthan5g_VOz7:APA91bFKRJ7GDw0y0C6I6xe9Wb3SAcFvZxmLpEfZXtrQAH0Rrny7HN6V4NTYjK2Au2rgBiPzQtDvhtvs-5XeibOVFSpHS9rsdJG6OUFhIfl4Jba9jttoEV_PW0XB5S16LxpbO9ZNFq5B', 1, NULL, NULL, NULL, NULL, NULL, 0, 'NyYkwfAWiMELeC4bD4h05JepXYZGYmTGrujLOR63', 0, NULL, NULL),
(16, NULL, 'اسلام', 'سعيد', '+2001003930958', 'def.png', 'Bonusco2020@gmail.com', NULL, '$2y$10$HLFbcZqlek1eQPSKmXvm4Oh7mIu1gsXOmxmw8S8woahvIymXBSjTC', NULL, '2022-08-16 11:39:03', '2022-08-16 11:39:03', NULL, NULL, NULL, NULL, NULL, NULL, 'exlYObeWRRWthan5g_VOz7:APA91bFKRJ7GDw0y0C6I6xe9Wb3SAcFvZxmLpEfZXtrQAH0Rrny7HN6V4NTYjK2Au2rgBiPzQtDvhtvs-5XeibOVFSpHS9rsdJG6OUFhIfl4Jba9jttoEV_PW0XB5S16LxpbO9ZNFq5B', 1, NULL, NULL, NULL, NULL, NULL, 0, 'pqIgSZqyKCwd1a5Vn8i12ncATK6ZlW3a4QKkwPi8', 0, NULL, NULL),
(17, NULL, 'Adham', 'Adham', '+2001157276700', 'def.png', 'test', NULL, '$2y$10$HFP88cghD4t.f5nTiOqvI.ziKAEoVW6KCil/ykpc6SiO45wg2waHy', NULL, '2022-08-20 00:04:13', '2022-08-20 01:19:38', NULL, NULL, NULL, NULL, NULL, NULL, 'e4e7IG58TPSDEXe9hZ5QMS:APA91bEuZ0w_vfQ9CwvbOWwpY2h_6VGyTm_6lHg4SZYIbIQRRz1xxk_WIR4PYNfX8cPIUPq_lfevpe5k1fxedzyRjuBBRnByuByG7uRCr80S5DpyiuTxkXzhsvweTMZFayZRbxPXwx3r', 1, NULL, NULL, NULL, NULL, NULL, 0, 'JnpBEZ64KdxGVSWVQPS6XFAHHBGsbUwOPXMuhjAj', 0, NULL, NULL),
(18, NULL, 'رضا', 'محمد', '+201159627492', '2022-08-20-6300bb0a3164f.png', 'reda2016123@gmail.com', NULL, '$2y$10$Pqo2477lhpb7OsMDHMD0rOKnNO1uIM99n1BP5WFKTSqTJvZ1/jHlC', NULL, '2022-08-20 10:25:04', '2022-08-20 11:43:31', NULL, NULL, NULL, NULL, NULL, NULL, 'c3p0w3xzQEK3koCUtwuevp:APA91bEGhFSQ9tuhy4dfX881HsiKmQR3VgBgGowiH6I-MBK1fBR8PqZWgsdMefbi_YRHCR2LFkyO9dLObBg71-ltJdoIC3cwcPLZ2JEG8d6eZhxcIn6s6XOk6tu_K-zjb5IH-F-nfL59', 1, NULL, NULL, NULL, NULL, NULL, 0, '0CEvsEbtMKfLhtaoL9WrgXHkTHBWJ96TKTKJ9YT7', 0, NULL, NULL),
(19, NULL, 'محمد', 'فتحي', '+2001117307256', 'def.png', 'ehnasia@gmail.com', NULL, '$2y$10$.T2WuevjbaK6SCM9CIwkZeC1Q1Zm0dPqSIrAz/aYkBTZ1sQd4QylK', NULL, '2022-08-20 10:26:17', '2022-08-20 11:37:45', NULL, NULL, NULL, NULL, NULL, NULL, 'c4B6TVLhRPGn7GjHeuYvUL:APA91bHdZ25FZ_TiZMakF8wlZsOJXlcimVrVHiGleaaZpg21Nkh7lZ-u0NhFdYO3wcA2HNNZ5GJVnacbOalw-br1cInGfHvpMqBz24J3Kb8O3jzDFUJR71urwbyC0UYJbRcCeNSlNZKZ', 1, NULL, NULL, NULL, NULL, NULL, 0, 'JdGjQpcWozEqDtBHpgkykq6YQjkXCvQcSpwFNj8n', 0, NULL, NULL),
(20, NULL, 'محمود', 'رمضان', '+2001118805161', 'def.png', 'ma9445263@gmail.com', NULL, '$2y$10$t9ndwi9lRWhD1Xgp2uFLLuZxpAJHUSXiN7Uj2GtbccApWT2GA5mru', NULL, '2022-08-20 18:18:13', '2022-08-20 18:18:13', NULL, NULL, NULL, NULL, NULL, NULL, 'eKRZGZA3QdGVe98djOsuGE:APA91bFSAllJ81QII1zmOed7vyKF_20blyhxr9bZzuYw7NeLf9gjOMCrCSRPkq_Az7c6uOeqCSmN2dTljfXTTCyXys1YoLTsTTVwGJlIMuFBe9mtOimC4ZuyYAVl2zCKbVp4xMYaoKCl', 1, NULL, NULL, NULL, NULL, NULL, 0, 'VMKdm76f049czkdiWQkBVKgEuatmhIQBnhUNJ8Yn', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 16, 14, '2022-08-16 11:51:26', '2022-08-16 11:51:26'),
(8, 18, 13, '2022-08-20 11:57:36', '2022-08-20 11:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100026;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
