-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 07:15 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add registers', 7, 'add_registers'),
(26, 'Can change registers', 7, 'change_registers'),
(27, 'Can delete registers', 7, 'delete_registers'),
(28, 'Can view registers', 7, 'view_registers'),
(29, 'Can add otp verification', 8, 'add_otpverification'),
(30, 'Can change otp verification', 8, 'change_otpverification'),
(31, 'Can delete otp verification', 8, 'delete_otpverification'),
(32, 'Can view otp verification', 8, 'view_otpverification'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add product image', 11, 'add_productimage'),
(42, 'Can change product image', 11, 'change_productimage'),
(43, 'Can delete product image', 11, 'delete_productimage'),
(44, 'Can view product image', 11, 'view_productimage'),
(45, 'Can add cart', 12, 'add_cart'),
(46, 'Can change cart', 12, 'change_cart'),
(47, 'Can delete cart', 12, 'delete_cart'),
(48, 'Can view cart', 12, 'view_cart'),
(49, 'Can add wishlist', 13, 'add_wishlist'),
(50, 'Can change wishlist', 13, 'change_wishlist'),
(51, 'Can delete wishlist', 13, 'delete_wishlist'),
(52, 'Can view wishlist', 13, 'view_wishlist'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add contact', 15, 'add_contact'),
(58, 'Can change contact', 15, 'change_contact'),
(59, 'Can delete contact', 15, 'delete_contact'),
(60, 'Can view contact', 15, 'view_contact');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$VkQ8rPXS5JVYg410v4REdu$PB1htReAZb1aoGcBnpqCDbcsCfK9SyH2sPDE+yBtCz0=', NULL, 1, 'Admin', '', '', 'admin@gmail.com', 1, 1, '2022-12-10 06:31:26.846028');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `quantity`, `time`, `product_id`, `user_id`) VALUES
(6, 1, '2022-12-25 17:30:19.340941', 9, 1),
(9, 1, '2022-12-24 16:27:13.608910', 12, 1),
(11, 1, '2022-12-30 18:35:43.735090', 10, 1),
(16, 3, '2022-12-30 20:23:10.649509', 10, 2),
(17, 1, '2022-12-30 19:29:28.776356', 11, 2),
(18, 4, '2022-12-30 20:23:09.077779', 9, 2),
(19, 1, '2022-12-30 19:49:22.283577', 12, 2),
(20, 5, '2022-12-30 20:23:15.926623', 18, 2),
(21, 5, '2022-12-30 20:23:18.583059', 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `category`) VALUES
(1, 'Computer'),
(2, 'Mouse'),
(3, 'Laptop'),
(4, 'Keyboard'),
(5, 'Monitor'),
(6, 'Hard Disk');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile`, `message`, `user_id`) VALUES
(1, 'testing', 'test123@gmail.com', 1234567890, 'hiiii...', 1),
(2, 'test', 'test123@gmail.com', 1234560123, 'hello', 2),
(3, 'Gondaliya Nikul', 'gondaliyanikul81@gmail.com', 11223344, 'gyhbkgygkyhkgygkyjt....', 2),
(4, 'king', 'king@gmail.com', 2147483647, 'how are you...', 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(12, 'Shop', 'cart'),
(9, 'Shop', 'category'),
(15, 'Shop', 'contact'),
(14, 'Shop', 'order'),
(8, 'Shop', 'otpverification'),
(10, 'Shop', 'product'),
(11, 'Shop', 'productimage'),
(7, 'Shop', 'registers'),
(13, 'Shop', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Shop', '0001_initial', '2022-12-09 06:15:39.440066'),
(2, 'contenttypes', '0001_initial', '2022-12-09 06:15:39.513400'),
(3, 'auth', '0001_initial', '2022-12-09 06:15:40.369092'),
(4, 'admin', '0001_initial', '2022-12-09 06:15:40.589307'),
(5, 'admin', '0002_logentry_remove_auto_add', '2022-12-09 06:15:40.599131'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-09 06:15:40.622483'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-12-09 06:15:40.761192'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-12-09 06:15:40.857735'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-12-09 06:15:40.892158'),
(10, 'auth', '0004_alter_user_username_opts', '2022-12-09 06:15:40.906990'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-12-09 06:15:40.991803'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-12-09 06:15:40.998026'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-12-09 06:15:41.013154'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-12-09 06:15:41.042234'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-12-09 06:15:41.071214'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-12-09 06:15:41.104196'),
(17, 'auth', '0011_update_proxy_permissions', '2022-12-09 06:15:41.120694'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-12-09 06:15:41.149676'),
(19, 'sessions', '0001_initial', '2022-12-09 06:15:41.224009'),
(20, 'Shop', '0002_registers_user_type', '2022-12-09 10:19:22.782522'),
(21, 'Shop', '0003_otpverification', '2022-12-10 05:37:54.843775'),
(22, 'Shop', '0004_category', '2022-12-11 06:59:22.192760'),
(23, 'Shop', '0005_alter_category_table', '2022-12-11 10:59:57.076671'),
(24, 'Shop', '0006_product', '2022-12-12 10:58:19.557974'),
(25, 'Shop', '0007_alter_product_display_size', '2022-12-12 11:52:18.030351'),
(26, 'Shop', '0008_alter_product_company_alter_product_description_and_more', '2022-12-12 12:24:22.485489'),
(27, 'Shop', '0009_alter_product_description', '2022-12-12 12:32:39.191735'),
(28, 'Shop', '0010_alter_product_description', '2022-12-12 12:43:39.420717'),
(29, 'Shop', '0011_productimage', '2022-12-14 05:49:06.360028'),
(30, 'Shop', '0012_alter_productimage_image1_alter_productimage_image2_and_more', '2022-12-14 06:12:05.561881'),
(31, 'Shop', '0013_alter_product_description_alter_product_name', '2022-12-15 04:51:15.456824'),
(32, 'Shop', '0014_alter_product_price', '2022-12-15 04:55:31.339664'),
(33, 'Shop', '0015_alter_productimage_product_id', '2022-12-16 05:26:44.688756'),
(34, 'Shop', '0016_rename_product_id_productimage_product', '2022-12-16 05:29:07.828703'),
(35, 'Shop', '0017_cart', '2022-12-16 06:46:11.339172'),
(36, 'Shop', '0018_alter_cart_table', '2022-12-16 06:48:29.825126'),
(37, 'Shop', '0019_wishlist', '2022-12-19 05:45:10.148469'),
(38, 'Shop', '0020_order', '2022-12-21 06:27:48.178799'),
(39, 'Shop', '0021_alter_order_table', '2022-12-21 06:30:44.407204'),
(40, 'Shop', '0022_alter_order_phone', '2022-12-21 10:37:33.622519'),
(41, 'Shop', '0023_alter_order_phone', '2022-12-21 10:39:17.477859'),
(42, 'Shop', '0024_contact', '2022-12-28 05:40:49.719811');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2yd28pbei728yrfg6p3ljrt7zgyu6o00', 'eyJlbWFpbCI6IiJ9:1pBF8F:3yN6dV4SobUqe-DLCNRV0LDaKIea4rcg_0wckOyMhaM', '2023-01-13 13:09:07.041527'),
('3s710ob7jun8phbmc2dn2jie6q4mi2pl', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1pJvsd:B7szOQsHTgZAWtuv6qR15A7s0NdyOAPEDAsEH81l_50', '2023-02-06 12:24:55.643013'),
('63nx2fv97kfd1j3tnbxd8577epiwmc6c', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1pA7bg:tPaTwHq6Ra78M7McyZ_Ws3JJsvoDY9F4kKYDSCaW2lw', '2023-01-10 10:54:52.581252'),
('72bvot4pr7rydzizfs3qvn8dv5qokiwr', '.eJyrVsqtLM7IL3DITczMycxLLMkv0kvOz1WywiGuo5QKEgHLgxjF6ApqAf1EHoQ:1pBUc3:eYdE-4hygjM-_qF9KcdZFvpwO1Kg9HWKdJT5RnHbOf8', '2023-01-14 05:40:55.190172'),
('cmhscbh81iu9qqyguqo7lzbpm895wz1x', 'eyJlbWFpbCI6IiJ9:1pUKCq:JD1Bf9cilIvzyyA8Jz9MDYxNjvWp-JRaXXWV9wV5jHA', '2023-03-07 04:24:44.507940'),
('hro6gddr582bmjpb8qhpiopcm539ti5z', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1p9qI2:Ixb6DFYMWJ_dhEcQ7Aun7KsD7LeDLOywwhkmiemWg6I', '2023-01-09 16:25:26.552043'),
('jcozjmqg2v1rfksdvrsup10u2e4cofd0', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1p69q8:YK_DesvPs61ZZY8D6d_WQ6wiRnTIEeNsP2Jf6TrENXk', '2022-12-16 12:34:24.155310'),
('k2a6ajct9e4vgdbi6jevxaxa3wfglmso', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1p3dPK:MhATgzhW_M786qguYb9la9ZQ316Y_VQ7SfBz-I3VqMQ', '2022-12-09 13:32:18.904731'),
('k4v4hpwyp2h0nixat0o2ay7mgq60j3ir', 'eyJlbWFpbCI6ImdvbmRhbGl5YW5pa3VsODFAZ21haWwuY29tIn0:1p8gVf:zVvHHdqHXNaOURGEsgXeaE4EQD8zI4VPyMHN7g36m8U', '2023-01-06 11:46:43.397771'),
('kkwx6mxdgds0zzpze2h3hahcxoa59yur', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1p9ghj:BCrNBfVucMiO5XkDSKh2EAiGibSRaurlpNbbs2YbpB0', '2023-01-09 06:11:19.460777'),
('mck8s0pptkke8hyxv7o7l5st5ee6q8cd', 'eyJlbWFpbCI6ImdvbmRhbGl5YW5pa3VsODFAZ21haWwuY29tIn0:1p9rJM:JXxQe-qjteTZ_E8mX7Mv_NYZ1PTn7kgMiGihMAqRDgU', '2023-01-09 17:30:52.740005'),
('nj6wq1oisqox9r4bs729r5jv5hej11rk', 'eyJlbWFpbCI6ImdvbmRhbGl5YW5pa3VsODFAZ21haWwuY29tIn0:1p8gVe:7A1OfrJcGqjBtYUm2fgGdjG00srp1LupUnFQiIqlpOs', '2023-01-06 11:46:42.060860'),
('q6k7qx0dxbjznhidpnwvaw0begz8yfdy', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1pADQB:ZBXrUU8lvJcPwziceNOKjeNwkyS6i9TSSg12sw65X8c', '2023-01-10 17:07:23.790939'),
('q85k2d0grf17t5a1ab0kfszm4gyv74az', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1p3rhT:UgNTVkMEry25bEA6iObLm_by_pEqILz_QDqOGJ1aPnQ', '2022-12-10 04:47:59.648055'),
('v55ea1gwfjycj8c4hnfxkvvr7rxskdb6', 'eyJlbWFpbCI6ImdvbmRhbGl5YW5pa3VsODFAZ21haWwuY29tIn0:1pBTKp:Dyd6RxELkRGPqCeKd76n-i0nC5f2B6JBIg2DcP5NFP4', '2023-01-14 04:19:03.328322'),
('ymopyjf6i9qy22wn4u40v44acgtz6hkt', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1pA1mp:U5NaGtVQsCXNT-ZfccGL85_0wDO0luC70NUBJx1PCNY', '2023-01-10 04:41:59.871632'),
('zwqoseztsu06fzoo7kaf7er0hgqh5awk', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1p3cF3:D2C6_VfqaQYkIZf9GqVWkjChB1wMmyt-uH4UMO0WbzI', '2022-12-09 12:17:37.658646');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pin` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `fname`, `lname`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `country`, `pin`, `user_id`) VALUES
(6, 'nikul', 'gondaliya', 'abc@xyz.com', 1234567890, 'ahmedabad', 'thakkarbapa nagar', 'ahmedabad', 'gujarat', 'india', 123456, 1),
(7, 'abc', 'xyz', 'test123@gmail.com', 123456789, 'ahmedabad', 'thakkarbapa nagar', 'ahmedabad', 'gujarat', 'india', 987654, 1),
(15, 'Gondaliya', 'Nikul', 'gondaliyanikul81@gmail.com', 2147483647, 'Ahmedabad', 'thakkarbapa nagar', 'Ahmedabad', 'Gujarat', 'India', 362020, 2);

-- --------------------------------------------------------

--
-- Table structure for table `otp_verification`
--

CREATE TABLE `otp_verification` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp_verification`
--

INSERT INTO `otp_verification` (`id`, `email`, `otp`) VALUES
(3, 'gondaliyanikul81@gmail.com', 228301),
(4, 'myshop@mailinator.com', 445176),
(5, 'mymails@mailinator.com', 374123);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `company` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `model` varchar(50) NOT NULL,
  `display_size` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `company`, `category`, `quantity`, `model`, `display_size`, `description`) VALUES
(9, 'ASUS 27 inch', 18000, 'Vivo', 'Computer', 192, 'VZ279HEG1R', '68.58 cm (27 inch) LED Display', 'ASUS 27 inch Full HD LED Backlit IPS Panel Gaming Monitor (VZ279HEG1R)  (Response Time: 1 ms, 75 Hz Refresh Rate)'),
(10, 'DELL Inspiron Core i3 11th Gen', 39990, 'Dell', 'Laptop', 497, 'D560841WIN9S', '39.62 cm (15.6 inch)', 'Sporting an 11th Gen Intel Core i3 processor and dual drive SSD and HDD options, the Dell Inspiron 3511 11th Gen Core i3 Laptop provides a high response rate and silent performance.'),
(11, 'Wireless Optical Mouse', 449, 'SmartBuy', 'Mouse', 290, 'E160X', 'None', 'Scroll On the Go with Flipkart SmartBuy E160X Wireless mouse with Advanced Optical sensor and Bluetooth 5.0. High on precision, higher on tracking at 1600DPI with accurate scrolling up to 500lines/sec'),
(12, 'Wireless Laptop Keyboard ', 1099, 'Keyboard', 'Keyboard', 488, 'POR-373 Key2 & Mouse Combo', 'None', 'Key2 an innovative and next gen combo of stylish and ergonomically designed mini wireless keyboard & a mouse which gives you freedom from long clumsy wires and a cluttered workspace. The keyboard saves space as it is NOT a FULL-SIZE KEYBOARD'),
(13, 'SAMSUNG 27 inch Full HD LED', 12799, 'Samsung', 'Monitor', 400, 'LF27T350FHWXXL', '68.58 cm (27 inch) LED Backlit Display', 'Experience an All-expansive view with this 3-sided borderless Full HD Samsung Monitor. The IPS panel preserves color vividness and clarity across every inch of the screen. AMD Radeon FreeSync keeps your monitor'),
(14, 'WD 4 TB External Hard Disk Drive (HDD)', 7499, 'Hard Disk', 'Hard Disk', 690, 'WDBFTM0040BGD-WESN', 'None', 'WD 4 TB External Hard Disk Drive (HDD)  (Gold)'),
(15, 'APPLE 2022 MacBook AIR M2', 112990, 'Apple', 'Laptop', 200, ' MLY33HN/A', ' 34.54 cm (13.6 Inch)', 'APPLE 2022 MacBook AIR M2 - (8 GB/256 GB SSD/Mac OS Monterey) MLY33HN/A  (13.6 Inch, Midnight, 1.24 Kg)'),
(16, 'Lenovo IdeaPad 3 Core i3 11th Gen', 37990, 'Lenovo', 'Laptop', 600, '15ITL6', ' 39.62 cm (15.6 inch)', 'Get an opportunity to work anytime and from anywhere as you bring home the Lenovo IdeaPad 3 Core i3 11th Gen laptop. It features a slim 19.9 mm body and weight of about 1.41 kg to ensure flexible portability and stylish looks no matter where you go.'),
(17, 'acer 21.5 inch Full HD IPS Panel White Color Ultra Slim Monitor', 8279, 'Acer', 'Monitor', 900, 'HA220Q', '54.61 cm (21.5 inch) LED Backlit Display', 'You can complete your office work without any interruptions on the Acer 54.61 cm (21.5) Full HD Desktop Monitor. With a thickness of up to 6.6 mm, this desktop monitor has a sleek and elegant design.'),
(18, 'SmartBuy Turbo Wireless Mouse', 399, 'Mouse', 'Mouse', 1000, 'M7151', 'None', 'Support Windows XP / Vista / 7 / 8 / 10, Linux, and Mac 10 or Higher Version');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `image4` varchar(100) NOT NULL,
  `image5` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES
(1, 9, 'asus_compures.jpg', 'asus_compures2.jpg', 'asus_compures3.jpg', 'asus_compures4.jpg', 'asus_compures5.jpg'),
(2, 10, 'dell-laptop1.png', 'dell-laptop2.png', 'dell-laptop3.png', 'dell-laptop4.png', 'dell-laptop5.png'),
(3, 11, 'mouse1.png', 'mouse2.png', 'mouse3.png', 'mouse4.png', 'mouse5.png'),
(4, 12, 'keybord1.png', 'keybord2.png', 'keybord3.png', 'keybord4.png', 'keybord5.png'),
(5, 13, 'monitor1.png', 'monitor2.png', 'monitor3.png', 'monitor4.png', 'monitor5.png'),
(6, 14, 'Hard-Disk1.png', 'Hard-Disk2.png', 'Hard-Disk3.png', 'Hard-Disk4.png', ''),
(7, 15, 'apple-laptop1.png', 'apple-laptop2.png', 'apple-laptop3.png', 'apple-laptop4.png', 'apple-laptop5.png'),
(8, 16, 'lenovo-laptop.png', 'lenovo-laptop1.png', 'lenovo-laptop2.png', 'lenovo-laptop3.png', 'lenovo-laptop4.png'),
(9, 17, 'monitor-1.png', 'monitor-2.png', 'monitor-3.png', 'monitor-4.png', 'monitor-5.png'),
(10, 18, 'mouse-1.png', 'mouse-2.png', 'mouse-3.png', 'mouse-4.png', 'mouse-5.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` longtext NOT NULL,
  `user_type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `password`, `user_type`) VALUES
(1, 'admin', 1234567890, 'admin@gmail.com', 'admin', 1),
(2, 'Gondaliya Nikul', 2147483647, 'gondaliyanikul81@gmail.com', 'gondaliya@123', 0),
(3, 'king', 1020304567, 'myshop@mailinator.com', 'myshop@123', 0),
(4, 'king', 1020304050, 'mymails@mailinator.com', 'mymails123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) NOT NULL,
  `time` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `time`, `product_id`, `user_id`) VALUES
(11, '2022-12-21 09:21:50.228682', 16, 1),
(23, '2022-12-22 19:05:09.706426', 15, 1),
(59, '2022-12-23 20:18:40.031848', 17, 1),
(60, '2022-12-25 16:28:01.158286', 18, 1),
(61, '2022-12-25 16:34:28.809309', 12, 1),
(64, '2022-12-30 11:27:19.599453', 13, 1),
(65, '2022-12-30 19:07:51.384636', 10, 2),
(67, '2023-01-01 16:20:27.852763', 13, 2),
(68, '2023-01-01 17:35:40.223627', 15, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Shop_cart_product_id_70f22612_fk_products_id` (`product_id`),
  ADD KEY `Shop_cart_user_id_fc7dff5b_fk_users_id` (`user_id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_user_id_7a55ae84_fk_users_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_e323497c_fk_users_id` (`user_id`);

--
-- Indexes for table `otp_verification`
--
ALTER TABLE `otp_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_product_id_id_0bdc1432` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_product_id_fbf2a693_fk_products_id` (`product_id`),
  ADD KEY `wishlist_user_id_87cb4cfc_fk_users_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `otp_verification`
--
ALTER TABLE `otp_verification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Shop_cart_product_id_70f22612_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `Shop_cart_user_id_fc7dff5b_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_user_id_7a55ae84_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_user_id_e323497c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_product_id_8b9355c5_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_product_id_fbf2a693_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlist_user_id_87cb4cfc_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
