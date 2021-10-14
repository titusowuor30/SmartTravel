-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2021 at 12:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travello`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication_tmsuser`
--

CREATE TABLE `authentication_tmsuser` (
  `id` int(11) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authentication_tmsuser`
--

INSERT INTO `authentication_tmsuser` (`id`, `mobileno`, `user_id`) VALUES
(1, '070000009', 1);

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
  `id` int(11) NOT NULL,
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
(1, 'Can add tms user', 1, 'add_tmsuser'),
(2, 'Can change tms user', 1, 'change_tmsuser'),
(3, 'Can delete tms user', 1, 'delete_tmsuser'),
(4, 'Can view tms user', 1, 'view_tmsuser'),
(5, 'Can add book bus', 2, 'add_bookbus'),
(6, 'Can change book bus', 2, 'change_bookbus'),
(7, 'Can delete book bus', 2, 'delete_bookbus'),
(8, 'Can view book bus', 2, 'view_bookbus'),
(9, 'Can add bus booking', 3, 'add_busbooking'),
(10, 'Can change bus booking', 3, 'change_busbooking'),
(11, 'Can delete bus booking', 3, 'delete_busbooking'),
(12, 'Can view bus booking', 3, 'view_busbooking'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add bus', 5, 'add_bus'),
(18, 'Can change bus', 5, 'change_bus'),
(19, 'Can delete bus', 5, 'delete_bus'),
(20, 'Can view bus', 5, 'view_bus'),
(21, 'Can add booked seats', 6, 'add_bookedseats'),
(22, 'Can change booked seats', 6, 'change_bookedseats'),
(23, 'Can delete booked seats', 6, 'delete_bookedseats'),
(24, 'Can view booked seats', 6, 'view_bookedseats'),
(25, 'Can add package details', 7, 'add_packagedetails'),
(26, 'Can change package details', 7, 'change_packagedetails'),
(27, 'Can delete package details', 7, 'delete_packagedetails'),
(28, 'Can view package details', 7, 'view_packagedetails'),
(29, 'Can add regions', 8, 'add_regions'),
(30, 'Can change regions', 8, 'change_regions'),
(31, 'Can delete regions', 8, 'delete_regions'),
(32, 'Can view regions', 8, 'view_regions'),
(33, 'Can add source', 9, 'add_source'),
(34, 'Can change source', 9, 'change_source'),
(35, 'Can delete source', 9, 'delete_source'),
(36, 'Can view source', 9, 'view_source'),
(37, 'Can add tour_reservation', 10, 'add_tour_reservation'),
(38, 'Can change tour_reservation', 10, 'change_tour_reservation'),
(39, 'Can delete tour_reservation', 10, 'delete_tour_reservation'),
(40, 'Can view tour_reservation', 10, 'view_tour_reservation'),
(41, 'Can add tms booking', 11, 'add_tmsbooking'),
(42, 'Can change tms booking', 11, 'change_tmsbooking'),
(43, 'Can delete tms booking', 11, 'delete_tmsbooking'),
(44, 'Can view tms booking', 11, 'view_tmsbooking'),
(45, 'Can add feedback', 12, 'add_feedback'),
(46, 'Can change feedback', 12, 'change_feedback'),
(47, 'Can delete feedback', 12, 'delete_feedback'),
(48, 'Can view feedback', 12, 'view_feedback'),
(49, 'Can add destination', 13, 'add_destination'),
(50, 'Can change destination', 13, 'change_destination'),
(51, 'Can delete destination', 13, 'delete_destination'),
(52, 'Can view destination', 13, 'view_destination'),
(53, 'Can add Mpesa Call Back', 14, 'add_mpesacallbacks'),
(54, 'Can change Mpesa Call Back', 14, 'change_mpesacallbacks'),
(55, 'Can delete Mpesa Call Back', 14, 'delete_mpesacallbacks'),
(56, 'Can view Mpesa Call Back', 14, 'view_mpesacallbacks'),
(57, 'Can add Mpesa Call', 15, 'add_mpesacalls'),
(58, 'Can change Mpesa Call', 15, 'change_mpesacalls'),
(59, 'Can delete Mpesa Call', 15, 'delete_mpesacalls'),
(60, 'Can view Mpesa Call', 15, 'view_mpesacalls'),
(61, 'Can add Mpesa Payment', 16, 'add_mpesapayment'),
(62, 'Can change Mpesa Payment', 16, 'change_mpesapayment'),
(63, 'Can delete Mpesa Payment', 16, 'delete_mpesapayment'),
(64, 'Can view Mpesa Payment', 16, 'view_mpesapayment'),
(65, 'Can add tms payment', 17, 'add_tmspayment'),
(66, 'Can change tms payment', 17, 'change_tmspayment'),
(67, 'Can delete tms payment', 17, 'delete_tmspayment'),
(68, 'Can view tms payment', 17, 'view_tmspayment'),
(69, 'Can add log entry', 18, 'add_logentry'),
(70, 'Can change log entry', 18, 'change_logentry'),
(71, 'Can delete log entry', 18, 'delete_logentry'),
(72, 'Can view log entry', 18, 'view_logentry'),
(73, 'Can add permission', 19, 'add_permission'),
(74, 'Can change permission', 19, 'change_permission'),
(75, 'Can delete permission', 19, 'delete_permission'),
(76, 'Can view permission', 19, 'view_permission'),
(77, 'Can add group', 20, 'add_group'),
(78, 'Can change group', 20, 'change_group'),
(79, 'Can delete group', 20, 'delete_group'),
(80, 'Can view group', 20, 'view_group'),
(81, 'Can add user', 21, 'add_user'),
(82, 'Can change user', 21, 'change_user'),
(83, 'Can delete user', 21, 'delete_user'),
(84, 'Can view user', 21, 'view_user'),
(85, 'Can add content type', 22, 'add_contenttype'),
(86, 'Can change content type', 22, 'change_contenttype'),
(87, 'Can delete content type', 22, 'delete_contenttype'),
(88, 'Can view content type', 22, 'view_contenttype'),
(89, 'Can add session', 23, 'add_session'),
(90, 'Can change session', 23, 'change_session'),
(91, 'Can delete session', 23, 'delete_session'),
(92, 'Can view session', 23, 'view_session');

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
(1, 'pbkdf2_sha256$260000$3cclEPtrvU3W8z5RVpxzRD$h6U7/2DfIkHoggrFbuZ14QnU5W/c0qy5EQNX1jYhNMw=', '2021-10-14 10:50:23.771224', 1, 'folio', '', '', 'admin@gmail.com', 1, 1, '2021-10-14 10:49:47.914120');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_destination`
--

CREATE TABLE `bookticketapp_destination` (
  `dest_id` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `dest_name` varchar(25) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `day1` varchar(200) NOT NULL,
  `day2` varchar(200) NOT NULL,
  `day3` varchar(200) NOT NULL,
  `day4` varchar(200) NOT NULL,
  `day5` varchar(200) NOT NULL,
  `day6` varchar(200) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookticketapp_destination`
--

INSERT INTO `bookticketapp_destination` (`dest_id`, `days`, `price`, `rating`, `dest_name`, `img1`, `img2`, `desc`, `day1`, `day2`, `day3`, `day4`, `day5`, `day6`, `region_id`) VALUES
(1, 5, 20000, 5, 'Hot ♨  Springs', 'pics/2_NyVaKa0.png', 'pics/banner3_nAquAcP.png', 'fohiqepd;ryo3ef2fu', 'Beach sand bath', 'Visit hot ♨  springs', 'Hotel special', 'Grand hotel visit', 'NULL', 'NULL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_feedback`
--

CREATE TABLE `bookticketapp_feedback` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `tmsuser_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_packagedetails`
--

CREATE TABLE `bookticketapp_packagedetails` (
  `pname` varchar(20) NOT NULL,
  `amount` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_regions`
--

CREATE TABLE `bookticketapp_regions` (
  `id` int(11) NOT NULL,
  `region_name` varchar(20) NOT NULL,
  `img1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookticketapp_regions`
--

INSERT INTO `bookticketapp_regions` (`id`, `region_name`, `img1`) VALUES
(1, 'Nairobi Provine', 'pics/1_yAp0P3U.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_source`
--

CREATE TABLE `bookticketapp_source` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_tmsbooking`
--

CREATE TABLE `bookticketapp_tmsbooking` (
  `booking_id` varchar(6) NOT NULL,
  `source` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `departure_date` date NOT NULL,
  `no_of_person` int(10) UNSIGNED NOT NULL CHECK (`no_of_person` >= 0),
  `amount` int(10) UNSIGNED NOT NULL CHECK (`amount` >= 0),
  `package_id` varchar(20) DEFAULT NULL,
  `tmsuser_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookticketapp_tour_reservation`
--

CREATE TABLE `bookticketapp_tour_reservation` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `id_number` varchar(10) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `tour_site` varchar(200) NOT NULL,
  `tour_ticket` varchar(200) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses_bookbus`
--

CREATE TABLE `buses_bookbus` (
  `id` int(11) NOT NULL,
  `no_of_seats` int(11) NOT NULL,
  `seat_no` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `pick_up_station` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses_bookedseats`
--

CREATE TABLE `buses_bookedseats` (
  `id` int(11) NOT NULL,
  `seats` varchar(100) NOT NULL,
  `bus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses_bus`
--

CREATE TABLE `buses_bus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `no_of_seats` decimal(2,0) NOT NULL,
  `remaining_seats` decimal(2,0) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `departure_time` time(6) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses_busbooking`
--

CREATE TABLE `buses_busbooking` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(30) NOT NULL,
  `pick_up_station` varchar(100) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `price` int(11) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `time` time(6) NOT NULL,
  `no_of_seats` int(11) NOT NULL,
  `bus_name` varchar(20) NOT NULL,
  `bus_id` varchar(100) NOT NULL,
  `seat_numbers` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buses_user`
--

CREATE TABLE `buses_user` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-10-14 10:50:37.148664', '1', 'folio', 1, '[{\"added\": {}}]', 1, 1),
(2, '2021-10-14 10:50:51.636490', '1', 'Nairobi Provine', 1, '[{\"added\": {}}]', 8, 1),
(3, '2021-10-14 10:51:41.611229', '1', 'Hot ♨  Springs', 1, '[{\"added\": {}}]', 13, 1);

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
(18, 'admin', 'logentry'),
(20, 'auth', 'group'),
(19, 'auth', 'permission'),
(21, 'auth', 'user'),
(1, 'authentication', 'tmsuser'),
(13, 'BookTicketApp', 'destination'),
(12, 'BookTicketApp', 'feedback'),
(7, 'BookTicketApp', 'packagedetails'),
(8, 'BookTicketApp', 'regions'),
(9, 'BookTicketApp', 'source'),
(11, 'BookTicketApp', 'tmsbooking'),
(10, 'BookTicketApp', 'tour_reservation'),
(2, 'buses', 'bookbus'),
(6, 'buses', 'bookedseats'),
(5, 'buses', 'bus'),
(3, 'buses', 'busbooking'),
(4, 'buses', 'user'),
(22, 'contenttypes', 'contenttype'),
(14, 'PaymentApp', 'mpesacallbacks'),
(15, 'PaymentApp', 'mpesacalls'),
(16, 'PaymentApp', 'mpesapayment'),
(17, 'PaymentApp', 'tmspayment'),
(23, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-14 10:48:30.372598'),
(2, 'auth', '0001_initial', '2021-10-14 10:48:40.887428'),
(3, 'authentication', '0001_initial', '2021-10-14 10:48:42.121720'),
(4, 'BookTicketApp', '0001_initial', '2021-10-14 10:48:50.558640'),
(5, 'BookTicketApp', '0002_alter_tour_reservation_id_number', '2021-10-14 10:48:50.996129'),
(6, 'BookTicketApp', '0003_tour_reservation_destination', '2021-10-14 10:48:52.777238'),
(7, 'BookTicketApp', '0004_remove_tour_reservation_destination', '2021-10-14 10:48:53.542809'),
(8, 'PaymentApp', '0001_initial', '2021-10-14 10:48:55.995760'),
(9, 'admin', '0001_initial', '2021-10-14 10:48:58.464359'),
(10, 'admin', '0002_logentry_remove_auto_add', '2021-10-14 10:48:58.495590'),
(11, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-14 10:48:58.542480'),
(12, 'contenttypes', '0002_remove_content_type_name', '2021-10-14 10:48:59.261163'),
(13, 'auth', '0002_alter_permission_name_max_length', '2021-10-14 10:49:00.589212'),
(14, 'auth', '0003_alter_user_email_max_length', '2021-10-14 10:49:00.745472'),
(15, 'auth', '0004_alter_user_username_opts', '2021-10-14 10:49:00.807968'),
(16, 'auth', '0005_alter_user_last_login_null', '2021-10-14 10:49:01.807927'),
(17, 'auth', '0006_require_contenttypes_0002', '2021-10-14 10:49:01.854770'),
(18, 'auth', '0007_alter_validators_add_error_messages', '2021-10-14 10:49:01.917265'),
(19, 'auth', '0008_alter_user_username_max_length', '2021-10-14 10:49:02.057910'),
(20, 'auth', '0009_alter_user_last_name_max_length', '2021-10-14 10:49:02.229744'),
(21, 'auth', '0010_alter_group_name_max_length', '2021-10-14 10:49:02.557812'),
(22, 'auth', '0011_update_proxy_permissions', '2021-10-14 10:49:02.651590'),
(23, 'auth', '0012_alter_user_first_name_max_length', '2021-10-14 10:49:02.823451'),
(24, 'buses', '0001_initial', '2021-10-14 10:49:08.291790'),
(25, 'buses', '0002_alter_busbooking_bus_id', '2021-10-14 10:49:09.088611'),
(26, 'sessions', '0001_initial', '2021-10-14 10:49:09.901059');

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
('4i2k9ebbdiu81pobj0ekt5ypv85nzk8s', '.eJxVjEsOwiAUAO_C2hCgfF267xnIe_AqVQNJaVfGuxuSLnQ7M5k3i3DsJR6dtrhmdmWSXX4ZQnpSHSI_oN4bT63u24p8JPy0nc8t0-t2tn-DAr2MLQW9uIQgNFgJCZ3AyYDVInlUApMO00LBoPcYCD0J5yZlUOogrULBPl_xwzfC:1mayJb:yRm6FjWQ-XCHgXX8JreDUpcCtQOs-dVUguHKRPVFrDw', '2021-10-28 10:50:23.795251');

-- --------------------------------------------------------

--
-- Table structure for table `paymentapp_mpesacallbacks`
--

CREATE TABLE `paymentapp_mpesacallbacks` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ip_address` longtext NOT NULL,
  `caller` longtext NOT NULL,
  `conversation_id` longtext NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentapp_mpesacalls`
--

CREATE TABLE `paymentapp_mpesacalls` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ip_address` longtext NOT NULL,
  `caller` longtext NOT NULL,
  `conversation_id` longtext NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentapp_mpesapayment`
--

CREATE TABLE `paymentapp_mpesapayment` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `type` longtext NOT NULL,
  `reference` longtext NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` longtext NOT NULL,
  `organization_balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentapp_tmspayment`
--

CREATE TABLE `paymentapp_tmspayment` (
  `payment_id` varchar(6) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL CHECK (`amount` >= 0),
  `mode` varchar(25) NOT NULL,
  `tmsuser_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication_tmsuser`
--
ALTER TABLE `authentication_tmsuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- Indexes for table `bookticketapp_destination`
--
ALTER TABLE `bookticketapp_destination`
  ADD PRIMARY KEY (`dest_id`),
  ADD KEY `BookTicketApp_destin_region_id_6a128733_fk_BookTicke` (`region_id`);

--
-- Indexes for table `bookticketapp_feedback`
--
ALTER TABLE `bookticketapp_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BookTicketApp_feedba_tmsuser_id_6cd8dc47_fk_authentic` (`tmsuser_id`);

--
-- Indexes for table `bookticketapp_packagedetails`
--
ALTER TABLE `bookticketapp_packagedetails`
  ADD PRIMARY KEY (`pname`);

--
-- Indexes for table `bookticketapp_regions`
--
ALTER TABLE `bookticketapp_regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookticketapp_source`
--
ALTER TABLE `bookticketapp_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookticketapp_tmsbooking`
--
ALTER TABLE `bookticketapp_tmsbooking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `BookTicketApp_tmsboo_package_id_577e3a0d_fk_BookTicke` (`package_id`),
  ADD KEY `BookTicketApp_tmsboo_tmsuser_id_a2254ff8_fk_authentic` (`tmsuser_id`);

--
-- Indexes for table `bookticketapp_tour_reservation`
--
ALTER TABLE `bookticketapp_tour_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BookTicketApp_tour_r_source_id_b94e3e80_fk_BookTicke` (`source_id`),
  ADD KEY `BookTicketApp_tour_r_user_id_de62964d_fk_authentic` (`user_id`);

--
-- Indexes for table `buses_bookbus`
--
ALTER TABLE `buses_bookbus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buses_bookedseats`
--
ALTER TABLE `buses_bookedseats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bus_id` (`bus_id`);

--
-- Indexes for table `buses_bus`
--
ALTER TABLE `buses_bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buses_bus_destination_id_7ff9bea6_fk_BookTicke` (`destination_id`),
  ADD KEY `buses_bus_source_id_80230a8f_fk_BookTicketApp_source_id` (`source_id`);

--
-- Indexes for table `buses_busbooking`
--
ALTER TABLE `buses_busbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buses_user`
--
ALTER TABLE `buses_user`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `paymentapp_mpesacallbacks`
--
ALTER TABLE `paymentapp_mpesacallbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentapp_mpesacalls`
--
ALTER TABLE `paymentapp_mpesacalls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentapp_mpesapayment`
--
ALTER TABLE `paymentapp_mpesapayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentapp_tmspayment`
--
ALTER TABLE `paymentapp_tmspayment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `PaymentApp_tmspaymen_tmsuser_id_02541b63_fk_authentic` (`tmsuser_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authentication_tmsuser`
--
ALTER TABLE `authentication_tmsuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookticketapp_destination`
--
ALTER TABLE `bookticketapp_destination`
  MODIFY `dest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookticketapp_feedback`
--
ALTER TABLE `bookticketapp_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookticketapp_regions`
--
ALTER TABLE `bookticketapp_regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookticketapp_source`
--
ALTER TABLE `bookticketapp_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookticketapp_tour_reservation`
--
ALTER TABLE `bookticketapp_tour_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses_bookbus`
--
ALTER TABLE `buses_bookbus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses_bookedseats`
--
ALTER TABLE `buses_bookedseats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses_bus`
--
ALTER TABLE `buses_bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses_busbooking`
--
ALTER TABLE `buses_busbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses_user`
--
ALTER TABLE `buses_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `paymentapp_mpesacallbacks`
--
ALTER TABLE `paymentapp_mpesacallbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentapp_mpesacalls`
--
ALTER TABLE `paymentapp_mpesacalls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentapp_mpesapayment`
--
ALTER TABLE `paymentapp_mpesapayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication_tmsuser`
--
ALTER TABLE `authentication_tmsuser`
  ADD CONSTRAINT `authentication_tmsuser_user_id_34bdbd84_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
-- Constraints for table `bookticketapp_destination`
--
ALTER TABLE `bookticketapp_destination`
  ADD CONSTRAINT `BookTicketApp_destin_region_id_6a128733_fk_BookTicke` FOREIGN KEY (`region_id`) REFERENCES `bookticketapp_regions` (`id`);

--
-- Constraints for table `bookticketapp_feedback`
--
ALTER TABLE `bookticketapp_feedback`
  ADD CONSTRAINT `BookTicketApp_feedba_tmsuser_id_6cd8dc47_fk_authentic` FOREIGN KEY (`tmsuser_id`) REFERENCES `authentication_tmsuser` (`id`);

--
-- Constraints for table `bookticketapp_tmsbooking`
--
ALTER TABLE `bookticketapp_tmsbooking`
  ADD CONSTRAINT `BookTicketApp_tmsboo_package_id_577e3a0d_fk_BookTicke` FOREIGN KEY (`package_id`) REFERENCES `bookticketapp_packagedetails` (`pname`),
  ADD CONSTRAINT `BookTicketApp_tmsboo_tmsuser_id_a2254ff8_fk_authentic` FOREIGN KEY (`tmsuser_id`) REFERENCES `authentication_tmsuser` (`id`);

--
-- Constraints for table `bookticketapp_tour_reservation`
--
ALTER TABLE `bookticketapp_tour_reservation`
  ADD CONSTRAINT `BookTicketApp_tour_r_source_id_b94e3e80_fk_BookTicke` FOREIGN KEY (`source_id`) REFERENCES `bookticketapp_source` (`id`),
  ADD CONSTRAINT `BookTicketApp_tour_r_user_id_de62964d_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_tmsuser` (`id`);

--
-- Constraints for table `buses_bookedseats`
--
ALTER TABLE `buses_bookedseats`
  ADD CONSTRAINT `buses_bookedseats_bus_id_3ecf51a2_fk_buses_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `buses_bus` (`id`);

--
-- Constraints for table `buses_bus`
--
ALTER TABLE `buses_bus`
  ADD CONSTRAINT `buses_bus_destination_id_7ff9bea6_fk_BookTicke` FOREIGN KEY (`destination_id`) REFERENCES `bookticketapp_destination` (`dest_id`),
  ADD CONSTRAINT `buses_bus_source_id_80230a8f_fk_BookTicketApp_source_id` FOREIGN KEY (`source_id`) REFERENCES `bookticketapp_source` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `paymentapp_tmspayment`
--
ALTER TABLE `paymentapp_tmspayment`
  ADD CONSTRAINT `PaymentApp_tmspaymen_tmsuser_id_02541b63_fk_authentic` FOREIGN KEY (`tmsuser_id`) REFERENCES `authentication_tmsuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
