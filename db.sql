-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2020 at 10:43 PM
-- Server version: 5.7.31
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
-- Database: `flonixne_ti`
--

-- --------------------------------------------------------

--
-- Table structure for table `ti_activities`
--

CREATE TABLE `ti_activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `log_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_addresses`
--

CREATE TABLE `ti_addresses` (
  `address_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_allergenables`
--

CREATE TABLE `ti_allergenables` (
  `allergen_id` int(10) UNSIGNED NOT NULL,
  `allergenable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergenable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_allergens`
--

CREATE TABLE `ti_allergens` (
  `allergen_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_assignable_logs`
--

CREATE TABLE `ti_assignable_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `assignable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignable_id` bigint(20) UNSIGNED NOT NULL,
  `assignee_id` int(10) UNSIGNED DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_banners`
--

CREATE TABLE `ti_banners` (
  `banner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `alt_text` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_code` text COLLATE utf8mb4_unicode_ci,
  `custom_code` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_categories`
--

CREATE TABLE `ti_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_countries`
--

CREATE TABLE `ti_countries` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `country_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_countries`
--

INSERT INTO `ti_countries` (`country_id`, `country_name`, `iso_code_2`, `iso_code_3`, `format`, `status`, `priority`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(2, 'Albania', 'AL', 'ALB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(3, 'Algeria', 'DZ', 'DZA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(4, 'American Samoa', 'AS', 'ASM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(5, 'Andorra', 'AD', 'AND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(6, 'Angola', 'AO', 'AGO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(7, 'Anguilla', 'AI', 'AIA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(8, 'Antarctica', 'AQ', 'ATA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(10, 'Argentina', 'AR', 'ARG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(11, 'Armenia', 'AM', 'ARM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(12, 'Aruba', 'AW', 'ABW', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(13, 'Australia', 'AU', 'AUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(14, 'Austria', 'AT', 'AUT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(15, 'Azerbaijan', 'AZ', 'AZE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(16, 'Bahamas', 'BS', 'BHS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(17, 'Bahrain', 'BH', 'BHR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(18, 'Bangladesh', 'BD', 'BGD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(19, 'Barbados', 'BB', 'BRB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(20, 'Belarus', 'BY', 'BLR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(21, 'Belgium', 'BE', 'BEL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(22, 'Belize', 'BZ', 'BLZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(23, 'Benin', 'BJ', 'BEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(24, 'Bermuda', 'BM', 'BMU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(25, 'Bhutan', 'BT', 'BTN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(26, 'Bolivia', 'BO', 'BOL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(28, 'Botswana', 'BW', 'BWA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(29, 'Bouvet Island', 'BV', 'BVT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(30, 'Brazil', 'BR', 'BRA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(32, 'Brunei Darussalam', 'BN', 'BRN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(33, 'Bulgaria', 'BG', 'BGR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(34, 'Burkina Faso', 'BF', 'BFA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(35, 'Burundi', 'BI', 'BDI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(36, 'Cambodia', 'KH', 'KHM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(37, 'Cameroon', 'CM', 'CMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(38, 'Canada', 'CA', 'CAN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(39, 'Cape Verde', 'CV', 'CPV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(40, 'Cayman Islands', 'KY', 'CYM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(41, 'Central African Republic', 'CF', 'CAF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(42, 'Chad', 'TD', 'TCD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(43, 'Chile', 'CL', 'CHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(44, 'China', 'CN', 'CHN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(45, 'Christmas Island', 'CX', 'CXR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(47, 'Colombia', 'CO', 'COL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(48, 'Comoros', 'KM', 'COM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(49, 'Congo', 'CG', 'COG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(50, 'Cook Islands', 'CK', 'COK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(51, 'Costa Rica', 'CR', 'CRI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(53, 'Croatia', 'HR', 'HRV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(54, 'Cuba', 'CU', 'CUB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(55, 'Cyprus', 'CY', 'CYP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(56, 'Czech Republic', 'CZ', 'CZE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(57, 'Denmark', 'DK', 'DNK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(58, 'Djibouti', 'DJ', 'DJI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(59, 'Dominica', 'DM', 'DMA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(60, 'Dominican Republic', 'DO', 'DOM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(61, 'East Timor', 'TP', 'TMP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(62, 'Ecuador', 'EC', 'ECU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(63, 'Egypt', 'EG', 'EGY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(64, 'El Salvador', 'SV', 'SLV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(66, 'Eritrea', 'ER', 'ERI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(67, 'Estonia', 'EE', 'EST', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(68, 'Ethiopia', 'ET', 'ETH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(70, 'Faroe Islands', 'FO', 'FRO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(71, 'Fiji', 'FJ', 'FJI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(72, 'Finland', 'FI', 'FIN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(73, 'France', 'FR', 'FRA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(74, 'France, Metropolitan', 'FX', 'FXX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(75, 'French Guiana', 'GF', 'GUF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(76, 'French Polynesia', 'PF', 'PYF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(77, 'French Southern Territories', 'TF', 'ATF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(78, 'Gabon', 'GA', 'GAB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(79, 'Gambia', 'GM', 'GMB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(80, 'Georgia', 'GE', 'GEO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(81, 'Germany', 'DE', 'DEU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(82, 'Ghana', 'GH', 'GHA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(83, 'Gibraltar', 'GI', 'GIB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(84, 'Greece', 'GR', 'GRC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(85, 'Greenland', 'GL', 'GRL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(86, 'Grenada', 'GD', 'GRD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(87, 'Guadeloupe', 'GP', 'GLP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(88, 'Guam', 'GU', 'GUM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(89, 'Guatemala', 'GT', 'GTM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(90, 'Guinea', 'GN', 'GIN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(91, 'Guinea-bissau', 'GW', 'GNB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(92, 'Guyana', 'GY', 'GUY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(93, 'Haiti', 'HT', 'HTI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(95, 'Honduras', 'HN', 'HND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(96, 'Hong Kong', 'HK', 'HKG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(97, 'Hungary', 'HU', 'HUN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(98, 'Iceland', 'IS', 'ISL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(99, 'India', 'IN', 'IND', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(100, 'Indonesia', 'ID', 'IDN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(102, 'Iraq', 'IQ', 'IRQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(103, 'Ireland', 'IE', 'IRL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(104, 'Israel', 'IL', 'ISR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(105, 'Italy', 'IT', 'ITA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(106, 'Jamaica', 'JM', 'JAM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(107, 'Japan', 'JP', 'JPN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(108, 'Jordan', 'JO', 'JOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(109, 'Kazakhstan', 'KZ', 'KAZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(110, 'Kenya', 'KE', 'KEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(111, 'Kiribati', 'KI', 'KIR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(112, 'North Korea', 'KP', 'PRK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(113, 'Korea, Republic of', 'KR', 'KOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(114, 'Kuwait', 'KW', 'KWT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(117, 'Latvia', 'LV', 'LVA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(118, 'Lebanon', 'LB', 'LBN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(119, 'Lesotho', 'LS', 'LSO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(120, 'Liberia', 'LR', 'LBR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(122, 'Liechtenstein', 'LI', 'LIE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(123, 'Lithuania', 'LT', 'LTU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(124, 'Luxembourg', 'LU', 'LUX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(125, 'Macau', 'MO', 'MAC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(126, 'FYROM', 'MK', 'MKD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(127, 'Madagascar', 'MG', 'MDG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(128, 'Malawi', 'MW', 'MWI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(129, 'Malaysia', 'MY', 'MYS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(130, 'Maldives', 'MV', 'MDV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(131, 'Mali', 'ML', 'MLI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(132, 'Malta', 'MT', 'MLT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(133, 'Marshall Islands', 'MH', 'MHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(134, 'Martinique', 'MQ', 'MTQ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(135, 'Mauritania', 'MR', 'MRT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(136, 'Mauritius', 'MU', 'MUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(137, 'Mayotte', 'YT', 'MYT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(138, 'Mexico', 'MX', 'MEX', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(140, 'Moldova, Republic of', 'MD', 'MDA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(141, 'Monaco', 'MC', 'MCO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(142, 'Mongolia', 'MN', 'MNG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(143, 'Montserrat', 'MS', 'MSR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(144, 'Morocco', 'MA', 'MAR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(145, 'Mozambique', 'MZ', 'MOZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(146, 'Myanmar', 'MM', 'MMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(147, 'Namibia', 'NA', 'NAM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(148, 'Nauru', 'NR', 'NRU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(149, 'Nepal', 'NP', 'NPL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(150, 'Netherlands', 'NL', 'NLD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(151, 'Netherlands Antilles', 'AN', 'ANT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(152, 'New Caledonia', 'NC', 'NCL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(153, 'New Zealand', 'NZ', 'NZL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(154, 'Nicaragua', 'NI', 'NIC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(155, 'Niger', 'NE', 'NER', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(156, 'Nigeria', 'NG', 'NGA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(157, 'Niue', 'NU', 'NIU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(158, 'Norfolk Island', 'NF', 'NFK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(160, 'Norway', 'NO', 'NOR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(161, 'Oman', 'OM', 'OMN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(162, 'Pakistan', 'PK', 'PAK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(163, 'Palau', 'PW', 'PLW', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(164, 'Panama', 'PA', 'PAN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(165, 'Papua New Guinea', 'PG', 'PNG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(166, 'Paraguay', 'PY', 'PRY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(167, 'Peru', 'PE', 'PER', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(168, 'Philippines', 'PH', 'PHL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(169, 'Pitcairn', 'PN', 'PCN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(170, 'Poland', 'PL', 'POL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(171, 'Portugal', 'PT', 'PRT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(172, 'Puerto Rico', 'PR', 'PRI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(173, 'Qatar', 'QA', 'QAT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(174, 'Reunion', 'RE', 'REU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(175, 'Romania', 'RO', 'ROM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(176, 'Russian Federation', 'RU', 'RUS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(177, 'Rwanda', 'RW', 'RWA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(179, 'Saint Lucia', 'LC', 'LCA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(181, 'Samoa', 'WS', 'WSM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(182, 'San Marino', 'SM', 'SMR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(183, 'Sao Tome and Principe', 'ST', 'STP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(184, 'Saudi Arabia', 'SA', 'SAU', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(185, 'Senegal', 'SN', 'SEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(186, 'Seychelles', 'SC', 'SYC', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(187, 'Sierra Leone', 'SL', 'SLE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(188, 'Singapore', 'SG', 'SGP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(189, 'Slovak Republic', 'SK', 'SVK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(190, 'Slovenia', 'SI', 'SVN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(191, 'Solomon Islands', 'SB', 'SLB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(192, 'Somalia', 'SO', 'SOM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(193, 'South Africa', 'ZA', 'ZAF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(195, 'Spain', 'ES', 'ESP', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(196, 'Sri Lanka', 'LK', 'LKA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(197, 'St. Helena', 'SH', 'SHN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(199, 'Sudan', 'SD', 'SDN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(200, 'Suriname', 'SR', 'SUR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(202, 'Swaziland', 'SZ', 'SWZ', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(203, 'Sweden', 'SE', 'SWE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(204, 'Switzerland', 'CH', 'CHE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(206, 'Taiwan', 'TW', 'TWN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(207, 'Tajikistan', 'TJ', 'TJK', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(209, 'Thailand', 'TH', 'THA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(210, 'Togo', 'TG', 'TGO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(211, 'Tokelau', 'TK', 'TKL', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(212, 'Tonga', 'TO', 'TON', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(214, 'Tunisia', 'TN', 'TUN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(215, 'Turkey', 'TR', 'TUR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(216, 'Turkmenistan', 'TM', 'TKM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(218, 'Tuvalu', 'TV', 'TUV', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(219, 'Uganda', 'UG', 'UGA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(220, 'Ukraine', 'UA', 'UKR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(221, 'United Arab Emirates', 'AE', 'ARE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(222, 'United Kingdom', 'GB', 'GBR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(223, 'United States', 'US', 'USA', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(225, 'Uruguay', 'UY', 'URY', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(226, 'Uzbekistan', 'UZ', 'UZB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(227, 'Vanuatu', 'VU', 'VUT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(229, 'Venezuela', 'VE', 'VEN', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(230, 'Viet Nam', 'VN', 'VNM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(234, 'Western Sahara', 'EH', 'ESH', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(235, 'Yemen', 'YE', 'YEM', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(236, 'Yugoslavia', 'YU', 'YUG', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(238, 'Zambia', 'ZM', 'ZMB', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999),
(239, 'Zimbabwe', 'ZW', 'ZWE', '{address_1}\\n{address_2}\\n{city} {postcode} {state}\\n{country}', 1, 999);

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons`
--

CREATE TABLE `ti_coupons` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `redemptions` int(11) NOT NULL DEFAULT '0',
  `customer_redemptions` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` date NOT NULL,
  `validity` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `fixed_from_time` time DEFAULT NULL,
  `fixed_to_time` time DEFAULT NULL,
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `recurring_every` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_from_time` time DEFAULT NULL,
  `recurring_to_time` time DEFAULT NULL,
  `order_restriction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_coupons_history`
--

CREATE TABLE `ti_coupons_history` (
  `coupon_history_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_total` decimal(15,4) DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_used` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_currencies`
--

CREATE TABLE `ti_currencies` (
  `currency_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(15,8) NOT NULL,
  `symbol_position` tinyint(1) DEFAULT NULL,
  `thousand_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_sign` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `flag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_status` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_currencies`
--

INSERT INTO `ti_currencies` (`currency_id`, `country_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_rate`, `symbol_position`, `thousand_sign`, `decimal_sign`, `decimal_position`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `flag`, `currency_status`, `date_modified`) VALUES
(1, 222, 'Pound Sterling', 'GBP', '£', 0.00000000, 0, ',', '.', '2', 'GB', 'GBR', 826, NULL, 1, '2017-10-03 19:08:49'),
(2, 223, 'US Dollar', 'USD', '$', 0.00000000, 0, ',', '.', '2', 'US', 'USA', 840, NULL, 0, '2017-10-03 19:08:49'),
(3, 44, 'Yuan Renminbi', 'CNY', '¥', 0.00000000, 0, ',', '.', '2', 'CN', 'CHN', 156, NULL, 0, '2017-10-03 19:08:49'),
(4, 13, 'Australian Dollar', 'AUD', '$', 0.00000000, 0, ',', '.', '2', 'AU', 'AUS', 36, NULL, 1, '2017-10-03 19:08:49'),
(5, 156, 'Naira', 'NGN', '₦', 0.00000000, 0, ',', '.', '2', 'NG', 'NGA', 566, NULL, 1, '2017-10-03 19:08:49');

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers`
--

CREATE TABLE `ti_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `customer_group_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customers_online`
--

CREATE TABLE `ti_customers_online` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `access_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_uri` text COLLATE utf8mb4_unicode_ci,
  `referrer_uri` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_customer_groups`
--

CREATE TABLE `ti_customer_groups` (
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `approval` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_customer_groups`
--

INSERT INTO `ti_customer_groups` (`customer_group_id`, `group_name`, `description`, `approval`) VALUES
(1, 'Default group', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ti_extensions`
--

CREATE TABLE `ti_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '1.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_extensions`
--

INSERT INTO `ti_extensions` (`extension_id`, `name`, `version`) VALUES
(1, 'igniter.cart', 'v2.3.0'),
(2, 'igniter.frontend', 'v1.3.0'),
(3, 'igniter.local', 'v1.5.0'),
(4, 'igniter.pages', 'v1.3.6'),
(5, 'igniter.payregister', 'v1.3.4'),
(6, 'igniter.reservation', 'v1.1.7'),
(7, 'igniter.user', 'v1.4.0');

-- --------------------------------------------------------

--
-- Table structure for table `ti_extension_settings`
--

CREATE TABLE `ti_extension_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_failed_jobs`
--

CREATE TABLE `ti_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_cart_cart`
--

CREATE TABLE `ti_igniter_cart_cart` (
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_frontend_sliders`
--

CREATE TABLE `ti_igniter_frontend_sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_igniter_frontend_sliders`
--

INSERT INTO `ti_igniter_frontend_sliders` (`id`, `name`, `code`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Homepage slider', 'home-slider', NULL, '2020-09-24 20:11:20', '2020-09-24 20:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_frontend_subscribers`
--

CREATE TABLE `ti_igniter_frontend_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistics` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_pages_menus`
--

CREATE TABLE `ti_igniter_pages_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_igniter_pages_menu_items`
--

CREATE TABLE `ti_igniter_pages_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_jobs`
--

CREATE TABLE `ti_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_languages`
--

CREATE TABLE `ti_languages` (
  `language_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idiom` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `original_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_languages`
--

INSERT INTO `ti_languages` (`language_id`, `code`, `name`, `image`, `idiom`, `status`, `can_delete`, `original_id`) VALUES
(1, 'en', 'English', NULL, 'english', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_language_translations`
--

CREATE TABLE `ti_language_translations` (
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unstable` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_locationables`
--

CREATE TABLE `ti_locationables` (
  `location_id` int(11) NOT NULL,
  `locationable_id` int(11) NOT NULL,
  `locationable_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_locations`
--

CREATE TABLE `ti_locations` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location_address_1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_address_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country_id` int(11) DEFAULT NULL,
  `location_telephone` text COLLATE utf8mb4_unicode_ci,
  `location_lat` double DEFAULT NULL,
  `location_lng` double DEFAULT NULL,
  `location_radius` int(11) DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `location_image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_locations`
--

INSERT INTO `ti_locations` (`location_id`, `location_name`, `location_email`, `description`, `location_address_1`, `location_address_2`, `location_city`, `location_state`, `location_postcode`, `location_country_id`, `location_telephone`, `location_lat`, `location_lng`, `location_radius`, `location_status`, `options`, `location_image`, `permalink_slug`) VALUES
(1, 'Default', 'admin@restaurant.com', NULL, 'Broad Ln', NULL, 'Coventry', NULL, NULL, 222, '8765456789', 52.415884, -1.603648, NULL, 1, 'a:9:{s:14:\"offer_delivery\";i:1;s:16:\"offer_collection\";i:1;s:18:\"delivery_lead_time\";i:15;s:20:\"collection_lead_time\";i:15;s:22:\"delivery_time_interval\";i:15;s:24:\"collection_time_interval\";i:15;s:25:\"reservation_time_interval\";i:15;s:21:\"reservation_lead_time\";i:45;s:5:\"hours\";a:3:{s:7:\"opening\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:8:\"delivery\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}s:10:\"collection\";a:2:{s:4:\"type\";s:4:\"24_7\";s:4:\"days\";a:0:{}}}}', NULL, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_areas`
--

CREATE TABLE `ti_location_areas` (
  `area_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boundaries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_location_tables`
--

CREATE TABLE `ti_location_tables` (
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_location_tables`
--

INSERT INTO `ti_location_tables` (`location_id`, `table_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_layouts`
--

CREATE TABLE `ti_mail_layouts` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci,
  `plain_layout` text COLLATE utf8mb4_unicode_ci,
  `layout_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_partials`
--

CREATE TABLE `ti_mail_partials` (
  `partial_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mail_templates`
--

CREATE TABLE `ti_mail_templates` (
  `template_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT NULL,
  `plain_body` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_mealtimes`
--

CREATE TABLE `ti_mealtimes` (
  `mealtime_id` int(11) NOT NULL,
  `mealtime_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `mealtime_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_mealtimes`
--

INSERT INTO `ti_mealtimes` (`mealtime_id`, `mealtime_name`, `start_time`, `end_time`, `mealtime_status`) VALUES
(1, 'Breakfast', '07:00:00', '10:00:00', 1),
(2, 'Lunch', '12:00:00', '14:30:00', 1),
(3, 'Dinner', '18:00:00', '20:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_media_attachments`
--

CREATE TABLE `ti_media_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `custom_properties` text COLLATE utf8mb4_unicode_ci,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_media_attachments`
--

INSERT INTO `ti_media_attachments` (`id`, `disk`, `name`, `file_name`, `mime_type`, `size`, `tag`, `attachment_type`, `attachment_id`, `is_public`, `custom_properties`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'media', '5f6d0b7839e20518585297.png', 'slide.png', 'image/jpeg', 748127, 'images', 'sliders', 1, 1, '[]', 1, '2020-09-24 20:11:20', '2020-09-24 20:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus`
--

CREATE TABLE `ti_menus` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` decimal(15,4) NOT NULL,
  `menu_photo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT '0',
  `minimum_qty` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `menu_status` tinyint(1) NOT NULL,
  `menu_priority` int(11) NOT NULL DEFAULT '0',
  `order_restriction` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menus_specials`
--

CREATE TABLE `ti_menus_specials` (
  `special_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `special_price` decimal(15,4) DEFAULT NULL,
  `special_status` tinyint(1) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_every` text COLLATE utf8mb4_unicode_ci,
  `recurring_from` time DEFAULT NULL,
  `recurring_to` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_categories`
--

CREATE TABLE `ti_menu_categories` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_item_options`
--

CREATE TABLE `ti_menu_item_options` (
  `menu_option_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `min_selected` int(11) NOT NULL DEFAULT '0',
  `max_selected` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_item_option_values`
--

CREATE TABLE `ti_menu_item_option_values` (
  `menu_option_value_id` int(11) NOT NULL,
  `menu_option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `new_price` decimal(15,4) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `subtract_stock` tinyint(1) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_mealtimes`
--

CREATE TABLE `ti_menu_mealtimes` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `mealtime_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_options`
--

CREATE TABLE `ti_menu_options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_menu_option_values`
--

CREATE TABLE `ti_menu_option_values` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_migrations`
--

CREATE TABLE `ti_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_migrations`
--

INSERT INTO `ti_migrations` (`id`, `group`, `migration`, `batch`) VALUES
(1, 'System', '2015_03_25_000001_create_tables', 1),
(2, 'System', '2016_11_29_000300_optimize_tables_columns', 1),
(3, 'System', '2017_04_13_000300_modify_columns_on_users_and_customers_tables', 1),
(4, 'System', '2017_05_08_000300_add_columns', 1),
(5, 'System', '2017_06_11_000300_create_payments_and_payment_logs_table', 1),
(6, 'System', '2017_08_23_000300_create_themes_table', 1),
(7, 'System', '2018_01_23_000300_create_language_translations_table', 1),
(8, 'System', '2018_03_30_000300_create_extension_settings_table', 1),
(9, 'System', '2018_06_12_000300_rename_model_class_names_to_morph_map_custom_names', 1),
(10, 'System', '2018_10_19_000300_create_media_attachments_table', 1),
(11, 'System', '2018_10_21_131033_create_queue_table', 1),
(12, 'System', '2018_10_21_131044_create_sessions_table', 1),
(13, 'System', '2019_04_16_000300_nullify_customer_id_on_addresses_table', 1),
(14, 'System', '2019_07_01_000300_delete_unused_columns_from_activities_table', 1),
(15, 'System', '2019_07_22_000300_add_user_type_column_to_activities_table', 1),
(16, 'System', '2019_07_30_000300_create_mail_partials_table', 1),
(17, 'System', '2020_02_05_000300_delete_stale_unused_table', 1),
(18, 'System', '2020_04_16_000300_drop_stale_unused_columns', 1),
(19, 'System', '2020_05_24_000300_create_request_logs_table', 1),
(20, 'Admin', '2017_08_25_000300_create_location_areas_table', 1),
(21, 'Admin', '2017_08_25_000300_create_menu_categories_table', 1),
(22, 'Admin', '2018_01_19_000300_add_hash_columns_on_orders_reservations_table', 1),
(23, 'Admin', '2018_04_06_000300_drop_unique_on_order_totals_table', 1),
(24, 'Admin', '2018_04_12_000300_modify_columns_on_orders_reservations_table', 1),
(25, 'Admin', '2018_05_21_000300_drop_redundant_columns_on_kitchen_tables', 1),
(26, 'Admin', '2018_05_29_000300_add_columns_on_location_areas_table', 1),
(27, 'Admin', '2018_06_12_000300_create_locationables_table', 1),
(28, 'Admin', '2018_07_04_000300_create_user_preferences_table', 1),
(29, 'Admin', '2018_10_09_000300_auto_increment_on_order_totals_table', 1),
(30, 'Admin', '2019_04_09_000300_auto_increment_on_user_preferences_table', 1),
(31, 'Admin', '2019_07_02_000300_add_columns_on_menu_specials_table', 1),
(32, 'Admin', '2019_07_16_000300_create_reservation_tables_table', 1),
(33, 'Admin', '2019_07_21_000300_change_sort_value_ratings_to_config_on_settings_table', 1),
(34, 'Admin', '2019_11_08_000300_add_selected_columns_to_menu_options_table', 1),
(35, 'Admin', '2020_02_18_000400_create_staffs_groups_and_locations_table', 1),
(36, 'Admin', '2020_02_21_000400_create_staff_roles_table', 1),
(37, 'Admin', '2020_02_22_000300_remove_add_columns_on_staff_staff_groups_table', 1),
(38, 'Admin', '2020_02_25_000300_create_assignable_logs_table', 1),
(39, 'Admin', '2020_03_18_000300_add_quantity_column_to_order_menu_options_table', 1),
(40, 'Admin', '2020_04_05_000300_create_payment_profiles_table', 1),
(41, 'Admin', '2020_04_16_000300_drop_stale_unused_columns', 1),
(42, 'Admin', '2020_05_31_000300_drop_more_unused_columns', 1),
(43, 'Admin', '2020_06_11_000300_create_menu_mealtimes_table', 1),
(44, 'Admin', '2020_08_18_000300_create_allergens_table', 1),
(45, 'igniter.cart', '2017_10_20_000100_create_conditions_settings', 1),
(46, 'igniter.cart', '2017_11_20_010000_create_cart_table', 1),
(47, 'igniter.cart', '2018_09_20_010000_rename_content_field_on_cart_table', 1),
(48, 'igniter.frontend', '2018_01_28_000300_create_subscribers_table', 1),
(49, 'igniter.frontend', '2018_06_28_000300_create_banners_table', 1),
(50, 'igniter.frontend', '2019_11_02_000300_create_sliders_table', 1),
(51, 'igniter.pages', '2018_06_28_000300_create_pages_table', 1),
(52, 'igniter.pages', '2019_11_28_000300_create_menus_table', 1),
(53, 'igniter.pages', '2019_11_28_000400_alter_columns_on_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_orders`
--

CREATE TABLE `ti_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `payment` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_menus`
--

CREATE TABLE `ti_order_menus` (
  `order_menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  `option_values` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_menu_options`
--

CREATE TABLE `ti_order_menu_options` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_option_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_option_price` decimal(15,4) DEFAULT NULL,
  `order_menu_id` int(11) NOT NULL,
  `order_menu_option_id` int(11) NOT NULL,
  `menu_option_value_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_order_totals`
--

CREATE TABLE `ti_order_totals` (
  `order_total_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_pages`
--

CREATE TABLE `ti_pages` (
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permalink_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_pages`
--

INSERT INTO `ti_pages` (`page_id`, `language_id`, `title`, `content`, `meta_description`, `meta_keywords`, `date_added`, `date_updated`, `status`, `permalink_slug`, `layout`, `metadata`, `priority`) VALUES
(1, 1, 'About Us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2020-09-24 21:11:20', '2020-09-24 21:11:20', 1, 'about-us', 'static', '{\"navigation\":\"0\"}', NULL),
(2, 1, 'Policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2020-09-24 21:11:20', '2020-09-24 21:11:20', 1, 'policy', 'static', '{\"navigation\":\"0\"}', NULL),
(3, 1, 'Terms and Conditions', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '2020-09-24 21:11:20', '2020-09-24 21:11:20', 1, 'terms-and-conditions', 'static', '{\"navigation\":\"0\"}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_payments`
--

CREATE TABLE `ti_payments` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payment_logs`
--

CREATE TABLE `ti_payment_logs` (
  `payment_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `is_success` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_payment_profiles`
--

CREATE TABLE `ti_payment_profiles` (
  `payment_profile_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_data` text COLLATE utf8mb4_unicode_ci,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_request_logs`
--

CREATE TABLE `ti_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_request_logs`
--

INSERT INTO `ti_request_logs` (`id`, `url`, `status_code`, `referrer`, `count`, `created_at`, `updated_at`) VALUES
(1, 'http://flonix.net/openrestaurant/setup.php', 404, '[\"http:\\/\\/flonix.net\\/openrestaurant\\/\"]', 1, '2020-09-24 21:11:38', '2020-09-24 21:11:38'),
(2, 'http://flonix.net/openrestaurant/themes/demo/assets/images/favicon.ico', 404, '[\"http:\\/\\/flonix.net\\/openrestaurant\\/\"]', 1, '2020-09-24 21:11:46', '2020-09-24 21:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservations`
--

CREATE TABLE `ti_reservations` (
  `reservation_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `guest_num` int(11) NOT NULL,
  `occasion_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `reserve_time` time NOT NULL,
  `reserve_date` date NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_group_id` int(10) UNSIGNED DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `assignee_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reservation_tables`
--

CREATE TABLE `ti_reservation_tables` (
  `reservation_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_reviews`
--

CREATE TABLE `ti_reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_id` int(11) NOT NULL,
  `sale_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `review_text` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL,
  `review_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_sessions`
--

CREATE TABLE `ti_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_settings`
--

CREATE TABLE `ti_settings` (
  `setting_id` int(11) NOT NULL,
  `sort` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_settings`
--

INSERT INTO `ti_settings` (`setting_id`, `sort`, `item`, `value`, `serialized`) VALUES
(1, 'config', 'site_location_mode', 'single', NULL),
(3, 'prefs', 'default_location_id', '1', NULL),
(4, 'config', 'site_logo', 'no_photo.png', NULL),
(5, 'config', 'country_id', '222', NULL),
(6, 'config', 'timezone', 'Europe/London', NULL),
(7, 'config', 'date_format', 'd M Y', NULL),
(8, 'config', 'time_format', 'h:i a', NULL),
(9, 'config', 'default_currency_code', 'GBP', NULL),
(10, 'config', 'default_language', 'en', NULL),
(11, 'config', 'detect_language', '0', NULL),
(13, 'config', 'allow_registration', '1', NULL),
(14, 'config', 'customer_group_id', '11', NULL),
(18, 'config', 'maps_api_key', '', NULL),
(19, 'config', 'distance_unit', 'mi', NULL),
(20, 'config', 'location_order', '0', NULL),
(21, 'config', 'location_order_email', '0', NULL),
(22, 'config', 'location_reserve_email', '0', NULL),
(23, 'config', 'approve_reviews', '1', NULL),
(24, 'config', 'default_order_status', '1', NULL),
(27, 'config', 'menus_page', 'local/menus', NULL),
(28, 'config', 'guest_order', '1', NULL),
(29, 'config', 'default_reservation_status', '8', NULL),
(30, 'config', 'confirmed_reservation_status', '6', NULL),
(31, 'config', 'canceled_order_status', '9', NULL),
(32, 'config', 'canceled_reservation_status', '7', NULL),
(34, 'config', 'tax_mode', '0', NULL),
(35, 'config', 'allow_reviews', '1', NULL),
(36, 'config', 'invoice_prefix', 'INV-{year}-00', NULL),
(37, 'config', 'protocol', 'sendmail', NULL),
(38, 'config', 'smtp_host', 'smtp.mailgun.org', NULL),
(39, 'config', 'smtp_port', '587', NULL),
(40, 'config', 'smtp_user', '', NULL),
(41, 'config', 'smtp_pass', '', NULL),
(42, 'config', 'log_threshold', '1', NULL),
(43, 'config', 'permalink', '1', NULL),
(44, 'config', 'maintenance_mode', '0', NULL),
(45, 'config', 'maintenance_message', 'Site is under maintenance. Please check back later.', NULL),
(46, 'config', 'cache_mode', '0', NULL),
(47, 'config', 'cache_time', '0', NULL),
(48, 'prefs', 'default_themes', 'a:1:{s:4:\"main\";s:19:\"demo\";}', NULL),
(49, 'prefs', 'ti_setup', 'installed', NULL),
(50, 'prefs', 'ti_version', 'v3.0.4-beta.23', NULL),
(51, 'prefs', 'sys_hash', '22fd39cd2fcb04d739c54d7e9aa3edd4e661630c', NULL),
(52, 'prefs', 'site_key', NULL, NULL),
(53, 'config', 'ratings.ratings.1', 'Bad', NULL),
(54, 'config', 'ratings.ratings.2', 'Worse', NULL),
(55, 'config', 'ratings.ratings.3', 'Good', NULL),
(56, 'config', 'ratings.ratings.4', 'Average', NULL),
(57, 'config', 'ratings.ratings.5', 'Excellent', NULL),
(58, 'config', 'supported_languages.0', 'en', NULL),
(59, 'config', 'registration_email.0', 'customer', NULL),
(60, 'config', 'order_email.0', 'customer', NULL),
(61, 'config', 'order_email.1', 'admin', NULL),
(62, 'config', 'reservation_email.0', 'customer', NULL),
(63, 'config', 'reservation_email.1', 'admin', NULL),
(64, 'config', 'processing_order_status.0', '2', NULL),
(65, 'config', 'processing_order_status.1', '3', NULL),
(66, 'config', 'processing_order_status.2', '4', NULL),
(67, 'config', 'completed_order_status.0', '5', NULL),
(68, 'config', 'image_manager.max_size', '300', NULL),
(69, 'config', 'image_manager.thumb_width', '320', NULL),
(70, 'config', 'image_manager.thumb_height', '220', NULL),
(71, 'config', 'image_manager.uploads', '1', NULL),
(72, 'config', 'image_manager.new_folder', '1', NULL),
(73, 'config', 'image_manager.copy', '1', NULL),
(74, 'config', 'image_manager.move', '1', NULL),
(75, 'config', 'image_manager.rename', '1', NULL),
(76, 'config', 'image_manager.delete', '1', NULL),
(77, 'config', 'image_manager.transliteration', '0', NULL),
(78, 'config', 'image_manager.remember_days', '7', NULL),
(79, 'config', 'demo_data', '0', NULL),
(80, 'config', 'site_name', 'TastyIgniter', NULL),
(81, 'config', 'site_email', 'admin@restaurant.com', NULL),
(82, 'config', 'staff_name', 'Chef Sam', NULL),
(83, 'config', 'username', 'admin', NULL),
(84, 'config', 'password', 'SJFC1884', NULL),
(85, 'config', 'sender_name', 'TastyIgniter', NULL),
(86, 'config', 'sender_email', 'admin@restaurant.com', NULL),
(87, 'config', 'installed_themes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs`
--

CREATE TABLE `ti_staffs` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_role_id` int(11) NOT NULL,
  `staff_location_id` int(11) NOT NULL,
  `timezone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `date_added` date NOT NULL,
  `staff_status` tinyint(1) NOT NULL,
  `sale_permission` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staffs`
--

INSERT INTO `ti_staffs` (`staff_id`, `staff_name`, `staff_email`, `staff_role_id`, `staff_location_id`, `timezone`, `language_id`, `date_added`, `staff_status`, `sale_permission`) VALUES
(1, 'Chef Sam', 'admin@restaurant.com', 1, 1, '0', 1, '2020-09-24', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs_groups`
--

CREATE TABLE `ti_staffs_groups` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staffs_groups`
--

INSERT INTO `ti_staffs_groups` (`staff_id`, `staff_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staffs_locations`
--

CREATE TABLE `ti_staffs_locations` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staffs_locations`
--

INSERT INTO `ti_staffs_locations` (`staff_id`, `location_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staff_groups`
--

CREATE TABLE `ti_staff_groups` (
  `staff_group_id` int(11) NOT NULL,
  `staff_group_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_assign` tinyint(1) DEFAULT '0',
  `auto_assign_mode` tinyint(4) DEFAULT '1',
  `auto_assign_limit` int(11) DEFAULT '20',
  `auto_assign_availability` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staff_groups`
--

INSERT INTO `ti_staff_groups` (`staff_group_id`, `staff_group_name`, `permissions`, `description`, `auto_assign`, `auto_assign_mode`, `auto_assign_limit`, `auto_assign_availability`) VALUES
(1, 'Owners', '', 'Default group for owners', 0, 1, 20, 1),
(2, 'Managers', '', 'Default group for managers', 0, 1, 20, 1),
(3, 'Waiters', '', 'Default group for waiters.', 0, 1, 20, 1),
(4, 'Delivery', '', 'Default group for delivery drivers.', 0, 1, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_staff_roles`
--

CREATE TABLE `ti_staff_roles` (
  `staff_role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_staff_roles`
--

INSERT INTO `ti_staff_roles` (`staff_role_id`, `name`, `code`, `description`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'owner', 'Default role for restaurant owners', NULL, NULL, NULL),
(2, 'Manager', 'manager', 'Default role for restaurant managers.', 'a:18:{s:15:\"Admin.Dashboard\";s:1:\"1\";s:16:\"Admin.Categories\";s:1:\"1\";s:14:\"Admin.Statuses\";s:1:\"1\";s:12:\"Admin.Staffs\";s:1:\"1\";s:17:\"Admin.StaffGroups\";s:1:\"1\";s:15:\"Admin.Customers\";s:1:\"1\";s:20:\"Admin.CustomerGroups\";s:1:\"1\";s:13:\"Admin.Reviews\";s:1:\"1\";s:14:\"Admin.Payments\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:12:\"Admin.Tables\";s:1:\"1\";s:15:\"Admin.Locations\";s:1:\"1\";s:13:\"Admin.Coupons\";s:1:\"1\";s:15:\"Admin.Mealtimes\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";s:11:\"Site.Themes\";s:1:\"1\";s:18:\"Admin.MediaManager\";s:1:\"1\";}', NULL, NULL),
(3, 'Waiter', 'waiter', 'Default role for restaurant waiters.', 'a:4:{s:16:\"Admin.Categories\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";s:11:\"Admin.Menus\";s:1:\"1\";}', NULL, NULL),
(4, 'Delivery', 'delivery', 'Default role for restaurant delivery.', 'a:3:{s:14:\"Admin.Statuses\";s:1:\"1\";s:18:\"Admin.Reservations\";s:1:\"1\";s:12:\"Admin.Orders\";s:1:\"1\";}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_statuses`
--

CREATE TABLE `ti_statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `notify_customer` tinyint(1) DEFAULT NULL,
  `status_for` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_color` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_statuses`
--

INSERT INTO `ti_statuses` (`status_id`, `status_name`, `status_comment`, `notify_customer`, `status_for`, `status_color`) VALUES
(1, 'Received', 'Your order has been received.', 1, 'order', '#686663'),
(2, 'Pending', 'Your order is pending', 1, 'order', '#f0ad4e'),
(3, 'Preparation', 'Your order is in the kitchen', 1, 'order', '#00c0ef'),
(4, 'Delivery', 'Your order will be with you shortly.', 0, 'order', '#00a65a'),
(5, 'Completed', '', 0, 'order', '#00a65a'),
(6, 'Confirmed', 'Your table reservation has been confirmed.', 0, 'reserve', '#00a65a'),
(7, 'Canceled', 'Your table reservation has been canceled.', 0, 'reserve', '#dd4b39'),
(8, 'Pending', 'Your table reservation is pending.', 0, 'reserve', ''),
(9, 'Canceled', '', 0, 'order', '#ea0b29');

-- --------------------------------------------------------

--
-- Table structure for table `ti_status_history`
--

CREATE TABLE `ti_status_history` (
  `status_history_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_tables`
--

CREATE TABLE `ti_tables` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_capacity` int(11) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `table_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_tables`
--

INSERT INTO `ti_tables` (`table_id`, `table_name`, `min_capacity`, `max_capacity`, `table_status`) VALUES
(1, 'Table 1', 4, 12, 1),
(2, 'Table 2', 2, 11, 1),
(3, 'Table 3', 5, 12, 1),
(4, 'Table 4', 3, 11, 1),
(5, 'Table 5', 5, 6, 1),
(6, 'Table 6', 3, 8, 1),
(7, 'Table 7', 3, 12, 1),
(8, 'Table 8', 3, 7, 1),
(9, 'Table 9', 5, 11, 1),
(10, 'Table 10', 3, 9, 1),
(11, 'Table 11', 5, 7, 1),
(12, 'Table 12', 5, 12, 1),
(13, 'Table 13', 3, 6, 1),
(14, 'Table 14', 5, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ti_themes`
--

CREATE TABLE `ti_themes` (
  `theme_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.1',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_users`
--

CREATE TABLE `ti_users` (
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_user` tinyint(1) DEFAULT NULL,
  `reset_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL,
  `activation_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_users`
--

INSERT INTO `ti_users` (`user_id`, `staff_id`, `username`, `password`, `salt`, `super_user`, `reset_code`, `reset_time`, `activation_code`, `remember_token`, `is_activated`, `date_activated`, `last_login`, `last_seen`) VALUES
(1, 1, 'admin', '$2y$10$HLREx6MCpM3POgP/0bvbLOcc1GbShhhbW6vgvKs.AQKm2Ka7w1gmG', NULL, 1, NULL, NULL, NULL, 'h0tBMCEe5ScSnooGAj1TdKI718xWKdeSQQHcL2Ncjf', 1, '2020-09-24 21:11:19', '2020-09-24 22:12:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ti_user_preferences`
--

CREATE TABLE `ti_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ti_working_hours`
--

CREATE TABLE `ti_working_hours` (
  `location_id` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `opening_time` time NOT NULL DEFAULT '00:00:00',
  `closing_time` time NOT NULL DEFAULT '00:00:00',
  `status` tinyint(1) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ti_working_hours`
--

INSERT INTO `ti_working_hours` (`location_id`, `weekday`, `opening_time`, `closing_time`, `status`, `type`) VALUES
(1, 0, '00:00:00', '23:59:00', 1, 'opening'),
(1, 1, '00:00:00', '23:59:00', 1, 'opening'),
(1, 2, '00:00:00', '23:59:00', 1, 'opening'),
(1, 3, '00:00:00', '23:59:00', 1, 'opening'),
(1, 4, '00:00:00', '23:59:00', 1, 'opening'),
(1, 5, '00:00:00', '23:59:00', 1, 'opening'),
(1, 6, '00:00:00', '23:59:00', 1, 'opening'),
(1, 0, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 1, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 2, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 3, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 4, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 5, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 6, '00:00:00', '23:59:00', 1, 'delivery'),
(1, 0, '00:00:00', '23:59:00', 1, 'collection'),
(1, 1, '00:00:00', '23:59:00', 1, 'collection'),
(1, 2, '00:00:00', '23:59:00', 1, 'collection'),
(1, 3, '00:00:00', '23:59:00', 1, 'collection'),
(1, 4, '00:00:00', '23:59:00', 1, 'collection'),
(1, 5, '00:00:00', '23:59:00', 1, 'collection'),
(1, 6, '00:00:00', '23:59:00', 1, 'collection');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ti_activities`
--
ALTER TABLE `ti_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `ti_allergenables`
--
ALTER TABLE `ti_allergenables`
  ADD UNIQUE KEY `allergenable_unique` (`allergen_id`,`allergenable_id`,`allergenable_type`),
  ADD KEY `allergenable_index` (`allergenable_type`,`allergenable_id`),
  ADD KEY `allergenables_allergen_id_index` (`allergen_id`);

--
-- Indexes for table `ti_allergens`
--
ALTER TABLE `ti_allergens`
  ADD PRIMARY KEY (`allergen_id`);

--
-- Indexes for table `ti_assignable_logs`
--
ALTER TABLE `ti_assignable_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignable_logs_assignable_type_assignable_id_index` (`assignable_type`,`assignable_id`);

--
-- Indexes for table `ti_banners`
--
ALTER TABLE `ti_banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `ti_categories`
--
ALTER TABLE `ti_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `ti_countries`
--
ALTER TABLE `ti_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `ti_customers`
--
ALTER TABLE `ti_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD UNIQUE KEY `extensions_name_unique` (`name`);

--
-- Indexes for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extension_settings_item_unique` (`item`);

--
-- Indexes for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_igniter_cart_cart`
--
ALTER TABLE `ti_igniter_cart_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ti_igniter_frontend_sliders`
--
ALTER TABLE `ti_igniter_frontend_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `igniter_frontend_sliders_code_unique` (`code`);

--
-- Indexes for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_igniter_pages_menus`
--
ALTER TABLE `ti_igniter_pages_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `igniter_pages_menus_theme_code_index` (`theme_code`);

--
-- Indexes for table `ti_igniter_pages_menu_items`
--
ALTER TABLE `ti_igniter_pages_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `igniter_pages_menu_items_menu_id_index` (`menu_id`),
  ADD KEY `igniter_pages_menu_items_parent_id_index` (`parent_id`);

--
-- Indexes for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `ti_languages`
--
ALTER TABLE `ti_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD UNIQUE KEY `language_translations_locale_namespace_group_item_unique` (`locale`,`namespace`,`group`,`item`),
  ADD KEY `language_translations_group_index` (`group`);

--
-- Indexes for table `ti_locations`
--
ALTER TABLE `ti_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `ti_location_tables`
--
ALTER TABLE `ti_location_tables`
  ADD PRIMARY KEY (`location_id`,`table_id`);

--
-- Indexes for table `ti_mail_layouts`
--
ALTER TABLE `ti_mail_layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `ti_mail_partials`
--
ALTER TABLE `ti_mail_partials`
  ADD PRIMARY KEY (`partial_id`);

--
-- Indexes for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `mail_templates_data_template_id_code_unique` (`layout_id`,`code`);

--
-- Indexes for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  ADD PRIMARY KEY (`mealtime_id`);

--
-- Indexes for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_attachments_attachment_type_attachment_id_index` (`attachment_type`,`attachment_id`),
  ADD KEY `media_attachments_tag_index` (`tag`);

--
-- Indexes for table `ti_menus`
--
ALTER TABLE `ti_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  ADD PRIMARY KEY (`special_id`),
  ADD UNIQUE KEY `menus_specials_special_id_menu_id_unique` (`special_id`,`menu_id`);

--
-- Indexes for table `ti_menu_categories`
--
ALTER TABLE `ti_menu_categories`
  ADD UNIQUE KEY `menu_categories_menu_id_category_id_unique` (`menu_id`,`category_id`),
  ADD KEY `menu_categories_menu_id_index` (`menu_id`),
  ADD KEY `menu_categories_category_id_index` (`category_id`);

--
-- Indexes for table `ti_menu_item_options`
--
ALTER TABLE `ti_menu_item_options`
  ADD PRIMARY KEY (`menu_option_id`);

--
-- Indexes for table `ti_menu_item_option_values`
--
ALTER TABLE `ti_menu_item_option_values`
  ADD PRIMARY KEY (`menu_option_value_id`);

--
-- Indexes for table `ti_menu_mealtimes`
--
ALTER TABLE `ti_menu_mealtimes`
  ADD UNIQUE KEY `menu_mealtimes_menu_id_mealtime_id_unique` (`menu_id`,`mealtime_id`),
  ADD KEY `menu_mealtimes_menu_id_index` (`menu_id`),
  ADD KEY `menu_mealtimes_mealtime_id_index` (`mealtime_id`);

--
-- Indexes for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_orders`
--
ALTER TABLE `ti_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_hash_index` (`hash`);

--
-- Indexes for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  ADD PRIMARY KEY (`order_menu_id`);

--
-- Indexes for table `ti_order_menu_options`
--
ALTER TABLE `ti_order_menu_options`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  ADD PRIMARY KEY (`order_total_id`);

--
-- Indexes for table `ti_pages`
--
ALTER TABLE `ti_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `ti_payments`
--
ALTER TABLE `ti_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payments_code_unique` (`code`);

--
-- Indexes for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  ADD PRIMARY KEY (`payment_log_id`);

--
-- Indexes for table `ti_payment_profiles`
--
ALTER TABLE `ti_payment_profiles`
  ADD PRIMARY KEY (`payment_profile_id`),
  ADD KEY `payment_profiles_customer_id_index` (`customer_id`),
  ADD KEY `payment_profiles_payment_id_index` (`payment_id`);

--
-- Indexes for table `ti_request_logs`
--
ALTER TABLE `ti_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservations_location_id_table_id_index` (`location_id`,`table_id`),
  ADD KEY `reservations_hash_index` (`hash`);

--
-- Indexes for table `ti_reservation_tables`
--
ALTER TABLE `ti_reservation_tables`
  ADD UNIQUE KEY `reservation_tables_reservation_id_table_id_unique` (`reservation_id`,`table_id`),
  ADD KEY `reservation_tables_reservation_id_index` (`reservation_id`),
  ADD KEY `reservation_tables_table_id_index` (`table_id`);

--
-- Indexes for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_review_id_sale_type_sale_id_index` (`review_id`,`sale_type`,`sale_id`);

--
-- Indexes for table `ti_sessions`
--
ALTER TABLE `ti_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `ti_settings`
--
ALTER TABLE `ti_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `settings_sort_item_unique` (`sort`,`item`);

--
-- Indexes for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indexes for table `ti_staffs_groups`
--
ALTER TABLE `ti_staffs_groups`
  ADD PRIMARY KEY (`staff_id`,`staff_group_id`);

--
-- Indexes for table `ti_staffs_locations`
--
ALTER TABLE `ti_staffs_locations`
  ADD PRIMARY KEY (`staff_id`,`location_id`);

--
-- Indexes for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  ADD PRIMARY KEY (`staff_group_id`);

--
-- Indexes for table `ti_staff_roles`
--
ALTER TABLE `ti_staff_roles`
  ADD PRIMARY KEY (`staff_role_id`);

--
-- Indexes for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  ADD PRIMARY KEY (`status_history_id`);

--
-- Indexes for table `ti_tables`
--
ALTER TABLE `ti_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `ti_themes`
--
ALTER TABLE `ti_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `themes_code_unique` (`code`);

--
-- Indexes for table `ti_users`
--
ALTER TABLE `ti_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_staff_id_unique` (`staff_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ti_working_hours`
--
ALTER TABLE `ti_working_hours`
  ADD KEY `working_hours_location_id_weekday_type_index` (`location_id`,`weekday`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ti_activities`
--
ALTER TABLE `ti_activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_addresses`
--
ALTER TABLE `ti_addresses`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_allergens`
--
ALTER TABLE `ti_allergens`
  MODIFY `allergen_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_assignable_logs`
--
ALTER TABLE `ti_assignable_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_banners`
--
ALTER TABLE `ti_banners`
  MODIFY `banner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_categories`
--
ALTER TABLE `ti_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_countries`
--
ALTER TABLE `ti_countries`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `ti_coupons`
--
ALTER TABLE `ti_coupons`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_coupons_history`
--
ALTER TABLE `ti_coupons_history`
  MODIFY `coupon_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_currencies`
--
ALTER TABLE `ti_currencies`
  MODIFY `currency_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ti_customers`
--
ALTER TABLE `ti_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_customers_online`
--
ALTER TABLE `ti_customers_online`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_customer_groups`
--
ALTER TABLE `ti_customer_groups`
  MODIFY `customer_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_extensions`
--
ALTER TABLE `ti_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ti_extension_settings`
--
ALTER TABLE `ti_extension_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_failed_jobs`
--
ALTER TABLE `ti_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_igniter_frontend_sliders`
--
ALTER TABLE `ti_igniter_frontend_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_igniter_frontend_subscribers`
--
ALTER TABLE `ti_igniter_frontend_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_igniter_pages_menus`
--
ALTER TABLE `ti_igniter_pages_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_igniter_pages_menu_items`
--
ALTER TABLE `ti_igniter_pages_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_jobs`
--
ALTER TABLE `ti_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_languages`
--
ALTER TABLE `ti_languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_language_translations`
--
ALTER TABLE `ti_language_translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_locations`
--
ALTER TABLE `ti_locations`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_location_areas`
--
ALTER TABLE `ti_location_areas`
  MODIFY `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_mail_layouts`
--
ALTER TABLE `ti_mail_layouts`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_mail_partials`
--
ALTER TABLE `ti_mail_partials`
  MODIFY `partial_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_mail_templates`
--
ALTER TABLE `ti_mail_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_mealtimes`
--
ALTER TABLE `ti_mealtimes`
  MODIFY `mealtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ti_media_attachments`
--
ALTER TABLE `ti_media_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_menus`
--
ALTER TABLE `ti_menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menus_specials`
--
ALTER TABLE `ti_menus_specials`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menu_item_options`
--
ALTER TABLE `ti_menu_item_options`
  MODIFY `menu_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menu_item_option_values`
--
ALTER TABLE `ti_menu_item_option_values`
  MODIFY `menu_option_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menu_options`
--
ALTER TABLE `ti_menu_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_menu_option_values`
--
ALTER TABLE `ti_menu_option_values`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_migrations`
--
ALTER TABLE `ti_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `ti_orders`
--
ALTER TABLE `ti_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_menus`
--
ALTER TABLE `ti_order_menus`
  MODIFY `order_menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_menu_options`
--
ALTER TABLE `ti_order_menu_options`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_order_totals`
--
ALTER TABLE `ti_order_totals`
  MODIFY `order_total_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_pages`
--
ALTER TABLE `ti_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ti_payments`
--
ALTER TABLE `ti_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_payment_logs`
--
ALTER TABLE `ti_payment_logs`
  MODIFY `payment_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_payment_profiles`
--
ALTER TABLE `ti_payment_profiles`
  MODIFY `payment_profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_request_logs`
--
ALTER TABLE `ti_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ti_reservations`
--
ALTER TABLE `ti_reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_reviews`
--
ALTER TABLE `ti_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_settings`
--
ALTER TABLE `ti_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `ti_staffs`
--
ALTER TABLE `ti_staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_staff_groups`
--
ALTER TABLE `ti_staff_groups`
  MODIFY `staff_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ti_staff_roles`
--
ALTER TABLE `ti_staff_roles`
  MODIFY `staff_role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ti_statuses`
--
ALTER TABLE `ti_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ti_status_history`
--
ALTER TABLE `ti_status_history`
  MODIFY `status_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_tables`
--
ALTER TABLE `ti_tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ti_themes`
--
ALTER TABLE `ti_themes`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ti_users`
--
ALTER TABLE `ti_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ti_user_preferences`
--
ALTER TABLE `ti_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
