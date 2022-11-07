-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 05, 2017 at 10:34 AM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_2` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_3` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` smallint(5) UNSIGNED NOT NULL,
  `iso_3166-2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_region_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` tinyint(3) UNSIGNED NOT NULL,
  `sub_region_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`name`, `code_2`, `code_3`, `country_code`, `iso_3166-2`, `region`, `sub_region`, `region_code`, `sub_region_code`, `region_id`, `sub_region_id`) VALUES
('Afghanistan', 'AF', 'AFG', 4, 'ISO 3166-2:AF', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Åland Islands', 'AX', 'ALA', 248, 'ISO 3166-2:AX', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Albania', 'AL', 'ALB', 8, 'ISO 3166-2:AL', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Algeria', 'DZ', 'DZA', 12, 'ISO 3166-2:DZ', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('American Samoa', 'AS', 'ASM', 16, 'ISO 3166-2:AS', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Andorra', 'AD', 'AND', 20, 'ISO 3166-2:AD', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Angola', 'AO', 'AGO', 24, 'ISO 3166-2:AO', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Anguilla', 'AI', 'AIA', 660, 'ISO 3166-2:AI', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Antarctica', 'AQ', 'ATA', 10, 'ISO 3166-2:AQ', '', '', '', '', 7, 8),
('Antigua and Barbuda', 'AG', 'ATG', 28, 'ISO 3166-2:AG', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Argentina', 'AR', 'ARG', 32, 'ISO 3166-2:AR', 'Americas', 'South America', '019', '005', 6, 9),
('Armenia', 'AM', 'ARM', 51, 'ISO 3166-2:AM', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Aruba', 'AW', 'ABW', 533, 'ISO 3166-2:AW', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Australia', 'AU', 'AUS', 36, 'ISO 3166-2:AU', 'Oceania', 'Australia and New Zealand', '009', '053', 5, 11),
('Austria', 'AT', 'AUT', 40, 'ISO 3166-2:AT', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Azerbaijan', 'AZ', 'AZE', 31, 'ISO 3166-2:AZ', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Bahamas', 'BS', 'BHS', 44, 'ISO 3166-2:BS', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Bahrain', 'BH', 'BHR', 48, 'ISO 3166-2:BH', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Bangladesh', 'BD', 'BGD', 50, 'ISO 3166-2:BD', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Barbados', 'BB', 'BRB', 52, 'ISO 3166-2:BB', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Belarus', 'BY', 'BLR', 112, 'ISO 3166-2:BY', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Belgium', 'BE', 'BEL', 56, 'ISO 3166-2:BE', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Belize', 'BZ', 'BLZ', 84, 'ISO 3166-2:BZ', 'Americas', 'Central America', '019', '013', 6, 14),
('Benin', 'BJ', 'BEN', 204, 'ISO 3166-2:BJ', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Bermuda', 'BM', 'BMU', 60, 'ISO 3166-2:BM', 'Americas', 'Northern America', '019', '021', 6, 16),
('Bhutan', 'BT', 'BTN', 64, 'ISO 3166-2:BT', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Bolivia (Plurinational State of)', 'BO', 'BOL', 68, 'ISO 3166-2:BO', 'Americas', 'South America', '019', '005', 6, 9),
('Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535, 'ISO 3166-2:BQ', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Bosnia and Herzegovina', 'BA', 'BIH', 70, 'ISO 3166-2:BA', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Botswana', 'BW', 'BWA', 72, 'ISO 3166-2:BW', 'Africa', 'Southern Africa', '002', '018', 4, 17),
('Bouvet Island', 'BV', 'BVT', 74, 'ISO 3166-2:BV', '', '', '', '', 7, 8),
('Brazil', 'BR', 'BRA', 76, 'ISO 3166-2:BR', 'Americas', 'South America', '019', '005', 6, 9),
('British Indian Ocean Territory', 'IO', 'IOT', 86, 'ISO 3166-2:IO', '', '', '', '', 7, 8),
('Brunei Darussalam', 'BN', 'BRN', 96, 'ISO 3166-2:BN', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Bulgaria', 'BG', 'BGR', 100, 'ISO 3166-2:BG', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Burkina Faso', 'BF', 'BFA', 854, 'ISO 3166-2:BF', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Burundi', 'BI', 'BDI', 108, 'ISO 3166-2:BI', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Cabo Verde', 'CV', 'CPV', 132, 'ISO 3166-2:CV', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Cambodia', 'KH', 'KHM', 116, 'ISO 3166-2:KH', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Cameroon', 'CM', 'CMR', 120, 'ISO 3166-2:CM', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Canada', 'CA', 'CAN', 124, 'ISO 3166-2:CA', 'Americas', 'Northern America', '019', '021', 6, 16),
('Cayman Islands', 'KY', 'CYM', 136, 'ISO 3166-2:KY', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Central African Republic', 'CF', 'CAF', 140, 'ISO 3166-2:CF', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Chad', 'TD', 'TCD', 148, 'ISO 3166-2:TD', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Chile', 'CL', 'CHL', 152, 'ISO 3166-2:CL', 'Americas', 'South America', '019', '005', 6, 9),
('China', 'CN', 'CHN', 156, 'ISO 3166-2:CN', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Christmas Island', 'CX', 'CXR', 162, 'ISO 3166-2:CX', '', '', '', '', 7, 8),
('Cocos (Keeling) Islands', 'CC', 'CCK', 166, 'ISO 3166-2:CC', '', '', '', '', 7, 8),
('Colombia', 'CO', 'COL', 170, 'ISO 3166-2:CO', 'Americas', 'South America', '019', '005', 6, 9),
('Comoros', 'KM', 'COM', 174, 'ISO 3166-2:KM', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Congo', 'CG', 'COG', 178, 'ISO 3166-2:CG', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Congo (Democratic Republic of the)', 'CD', 'COD', 180, 'ISO 3166-2:CD', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Cook Islands', 'CK', 'COK', 184, 'ISO 3166-2:CK', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Costa Rica', 'CR', 'CRI', 188, 'ISO 3166-2:CR', 'Americas', 'Central America', '019', '013', 6, 14),
('Côte d\'Ivoire', 'CI', 'CIV', 384, 'ISO 3166-2:CI', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Croatia', 'HR', 'HRV', 191, 'ISO 3166-2:HR', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Cuba', 'CU', 'CUB', 192, 'ISO 3166-2:CU', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Curaçao', 'CW', 'CUW', 531, 'ISO 3166-2:CW', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Cyprus', 'CY', 'CYP', 196, 'ISO 3166-2:CY', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Czech Republic', 'CZ', 'CZE', 203, 'ISO 3166-2:CZ', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Denmark', 'DK', 'DNK', 208, 'ISO 3166-2:DK', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Djibouti', 'DJ', 'DJI', 262, 'ISO 3166-2:DJ', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Dominica', 'DM', 'DMA', 212, 'ISO 3166-2:DM', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Dominican Republic', 'DO', 'DOM', 214, 'ISO 3166-2:DO', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Ecuador', 'EC', 'ECU', 218, 'ISO 3166-2:EC', 'Americas', 'South America', '019', '005', 6, 9),
('Egypt', 'EG', 'EGY', 818, 'ISO 3166-2:EG', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('El Salvador', 'SV', 'SLV', 222, 'ISO 3166-2:SV', 'Americas', 'Central America', '019', '013', 6, 14),
('Equatorial Guinea', 'GQ', 'GNQ', 226, 'ISO 3166-2:GQ', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Eritrea', 'ER', 'ERI', 232, 'ISO 3166-2:ER', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Estonia', 'EE', 'EST', 233, 'ISO 3166-2:EE', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Ethiopia', 'ET', 'ETH', 231, 'ISO 3166-2:ET', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Falkland Islands (Malvinas)', 'FK', 'FLK', 238, 'ISO 3166-2:FK', 'Americas', 'South America', '019', '005', 6, 9),
('Faroe Islands', 'FO', 'FRO', 234, 'ISO 3166-2:FO', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Fiji', 'FJ', 'FJI', 242, 'ISO 3166-2:FJ', 'Oceania', 'Melanesia', '009', '054', 5, 21),
('Finland', 'FI', 'FIN', 246, 'ISO 3166-2:FI', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('France', 'FR', 'FRA', 250, 'ISO 3166-2:FR', 'Europe', 'Western Europe', '150', '155', 3, 12),
('French Guiana', 'GF', 'GUF', 254, 'ISO 3166-2:GF', 'Americas', 'South America', '019', '005', 6, 9),
('French Polynesia', 'PF', 'PYF', 258, 'ISO 3166-2:PF', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('French Southern Territories', 'TF', 'ATF', 260, 'ISO 3166-2:TF', '', '', '', '', 7, 8),
('Gabon', 'GA', 'GAB', 266, 'ISO 3166-2:GA', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Gambia', 'GM', 'GMB', 270, 'ISO 3166-2:GM', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Georgia', 'GE', 'GEO', 268, 'ISO 3166-2:GE', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Germany', 'DE', 'DEU', 276, 'ISO 3166-2:DE', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Ghana', 'GH', 'GHA', 288, 'ISO 3166-2:GH', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Gibraltar', 'GI', 'GIB', 292, 'ISO 3166-2:GI', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Greece', 'GR', 'GRC', 300, 'ISO 3166-2:GR', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Greenland', 'GL', 'GRL', 304, 'ISO 3166-2:GL', 'Americas', 'Northern America', '019', '021', 6, 16),
('Grenada', 'GD', 'GRD', 308, 'ISO 3166-2:GD', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Guadeloupe', 'GP', 'GLP', 312, 'ISO 3166-2:GP', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Guam', 'GU', 'GUM', 316, 'ISO 3166-2:GU', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Guatemala', 'GT', 'GTM', 320, 'ISO 3166-2:GT', 'Americas', 'Central America', '019', '013', 6, 14),
('Guernsey', 'GG', 'GGY', 831, 'ISO 3166-2:GG', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Guinea', 'GN', 'GIN', 324, 'ISO 3166-2:GN', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Guinea-Bissau', 'GW', 'GNB', 624, 'ISO 3166-2:GW', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Guyana', 'GY', 'GUY', 328, 'ISO 3166-2:GY', 'Americas', 'South America', '019', '005', 6, 9),
('Haiti', 'HT', 'HTI', 332, 'ISO 3166-2:HT', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Heard Island and McDonald Islands', 'HM', 'HMD', 334, 'ISO 3166-2:HM', '', '', '', '', 7, 8),
('Holy See', 'VA', 'VAT', 336, 'ISO 3166-2:VA', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Honduras', 'HN', 'HND', 340, 'ISO 3166-2:HN', 'Americas', 'Central America', '019', '013', 6, 14),
('Hong Kong', 'HK', 'HKG', 344, 'ISO 3166-2:HK', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Hungary', 'HU', 'HUN', 348, 'ISO 3166-2:HU', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Iceland', 'IS', 'ISL', 352, 'ISO 3166-2:IS', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('India', 'IN', 'IND', 356, 'ISO 3166-2:IN', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Indonesia', 'ID', 'IDN', 360, 'ISO 3166-2:ID', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Iran (Islamic Republic of)', 'IR', 'IRN', 364, 'ISO 3166-2:IR', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Iraq', 'IQ', 'IRQ', 368, 'ISO 3166-2:IQ', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Ireland', 'IE', 'IRL', 372, 'ISO 3166-2:IE', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Isle of Man', 'IM', 'IMN', 833, 'ISO 3166-2:IM', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Israel', 'IL', 'ISR', 376, 'ISO 3166-2:IL', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Italy', 'IT', 'ITA', 380, 'ISO 3166-2:IT', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Jamaica', 'JM', 'JAM', 388, 'ISO 3166-2:JM', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Japan', 'JP', 'JPN', 392, 'ISO 3166-2:JP', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Jersey', 'JE', 'JEY', 832, 'ISO 3166-2:JE', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Jordan', 'JO', 'JOR', 400, 'ISO 3166-2:JO', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Kazakhstan', 'KZ', 'KAZ', 398, 'ISO 3166-2:KZ', 'Asia', 'Central Asia', '142', '143', 2, 23),
('Kenya', 'KE', 'KEN', 404, 'ISO 3166-2:KE', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Kiribati', 'KI', 'KIR', 296, 'ISO 3166-2:KI', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Korea (Democratic People\'s Republic of)', 'KP', 'PRK', 408, 'ISO 3166-2:KP', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Korea (Republic of)', 'KR', 'KOR', 410, 'ISO 3166-2:KR', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Kuwait', 'KW', 'KWT', 414, 'ISO 3166-2:KW', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Kyrgyzstan', 'KG', 'KGZ', 417, 'ISO 3166-2:KG', 'Asia', 'Central Asia', '142', '143', 2, 23),
('Lao People\'s Democratic Republic', 'LA', 'LAO', 418, 'ISO 3166-2:LA', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Latvia', 'LV', 'LVA', 428, 'ISO 3166-2:LV', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Lebanon', 'LB', 'LBN', 422, 'ISO 3166-2:LB', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Lesotho', 'LS', 'LSO', 426, 'ISO 3166-2:LS', 'Africa', 'Southern Africa', '002', '018', 4, 17),
('Liberia', 'LR', 'LBR', 430, 'ISO 3166-2:LR', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Libya', 'LY', 'LBY', 434, 'ISO 3166-2:LY', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('Liechtenstein', 'LI', 'LIE', 438, 'ISO 3166-2:LI', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Lithuania', 'LT', 'LTU', 440, 'ISO 3166-2:LT', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Luxembourg', 'LU', 'LUX', 442, 'ISO 3166-2:LU', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Macao', 'MO', 'MAC', 446, 'ISO 3166-2:MO', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD', 807, 'ISO 3166-2:MK', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Madagascar', 'MG', 'MDG', 450, 'ISO 3166-2:MG', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Malawi', 'MW', 'MWI', 454, 'ISO 3166-2:MW', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Malaysia', 'MY', 'MYS', 458, 'ISO 3166-2:MY', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Maldives', 'MV', 'MDV', 462, 'ISO 3166-2:MV', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Mali', 'ML', 'MLI', 466, 'ISO 3166-2:ML', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Malta', 'MT', 'MLT', 470, 'ISO 3166-2:MT', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Marshall Islands', 'MH', 'MHL', 584, 'ISO 3166-2:MH', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Martinique', 'MQ', 'MTQ', 474, 'ISO 3166-2:MQ', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Mauritania', 'MR', 'MRT', 478, 'ISO 3166-2:MR', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Mauritius', 'MU', 'MUS', 480, 'ISO 3166-2:MU', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Mayotte', 'YT', 'MYT', 175, 'ISO 3166-2:YT', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Mexico', 'MX', 'MEX', 484, 'ISO 3166-2:MX', 'Americas', 'Central America', '019', '013', 6, 14),
('Micronesia (Federated States of)', 'FM', 'FSM', 583, 'ISO 3166-2:FM', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Moldova (Republic of)', 'MD', 'MDA', 498, 'ISO 3166-2:MD', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Monaco', 'MC', 'MCO', 492, 'ISO 3166-2:MC', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Mongolia', 'MN', 'MNG', 496, 'ISO 3166-2:MN', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Montenegro', 'ME', 'MNE', 499, 'ISO 3166-2:ME', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Montserrat', 'MS', 'MSR', 500, 'ISO 3166-2:MS', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Morocco', 'MA', 'MAR', 504, 'ISO 3166-2:MA', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('Mozambique', 'MZ', 'MOZ', 508, 'ISO 3166-2:MZ', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Myanmar', 'MM', 'MMR', 104, 'ISO 3166-2:MM', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Namibia', 'NA', 'NAM', 516, 'ISO 3166-2:NA', 'Africa', 'Southern Africa', '002', '018', 4, 17),
('Nauru', 'NR', 'NRU', 520, 'ISO 3166-2:NR', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Nepal', 'NP', 'NPL', 524, 'ISO 3166-2:NP', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Netherlands', 'NL', 'NLD', 528, 'ISO 3166-2:NL', 'Europe', 'Western Europe', '150', '155', 3, 12),
('New Caledonia', 'NC', 'NCL', 540, 'ISO 3166-2:NC', 'Oceania', 'Melanesia', '009', '054', 5, 21),
('New Zealand', 'NZ', 'NZL', 554, 'ISO 3166-2:NZ', 'Oceania', 'Australia and New Zealand', '009', '053', 5, 11),
('Nicaragua', 'NI', 'NIC', 558, 'ISO 3166-2:NI', 'Americas', 'Central America', '019', '013', 6, 14),
('Niger', 'NE', 'NER', 562, 'ISO 3166-2:NE', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Nigeria', 'NG', 'NGA', 566, 'ISO 3166-2:NG', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Niue', 'NU', 'NIU', 570, 'ISO 3166-2:NU', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Norfolk Island', 'NF', 'NFK', 574, 'ISO 3166-2:NF', 'Oceania', 'Australia and New Zealand', '009', '053', 5, 11),
('Northern Mariana Islands', 'MP', 'MNP', 580, 'ISO 3166-2:MP', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Norway', 'NO', 'NOR', 578, 'ISO 3166-2:NO', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Oman', 'OM', 'OMN', 512, 'ISO 3166-2:OM', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Pakistan', 'PK', 'PAK', 586, 'ISO 3166-2:PK', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Palau', 'PW', 'PLW', 585, 'ISO 3166-2:PW', 'Oceania', 'Micronesia', '009', '057', 5, 22),
('Palestine, State of', 'PS', 'PSE', 275, 'ISO 3166-2:PS', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Panama', 'PA', 'PAN', 591, 'ISO 3166-2:PA', 'Americas', 'Central America', '019', '013', 6, 14),
('Papua New Guinea', 'PG', 'PNG', 598, 'ISO 3166-2:PG', 'Oceania', 'Melanesia', '009', '054', 5, 21),
('Paraguay', 'PY', 'PRY', 600, 'ISO 3166-2:PY', 'Americas', 'South America', '019', '005', 6, 9),
('Peru', 'PE', 'PER', 604, 'ISO 3166-2:PE', 'Americas', 'South America', '019', '005', 6, 9),
('Philippines', 'PH', 'PHL', 608, 'ISO 3166-2:PH', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Pitcairn', 'PN', 'PCN', 612, 'ISO 3166-2:PN', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Poland', 'PL', 'POL', 616, 'ISO 3166-2:PL', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Portugal', 'PT', 'PRT', 620, 'ISO 3166-2:PT', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Puerto Rico', 'PR', 'PRI', 630, 'ISO 3166-2:PR', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Qatar', 'QA', 'QAT', 634, 'ISO 3166-2:QA', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Réunion', 'RE', 'REU', 638, 'ISO 3166-2:RE', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Romania', 'RO', 'ROU', 642, 'ISO 3166-2:RO', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Russian Federation', 'RU', 'RUS', 643, 'ISO 3166-2:RU', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Rwanda', 'RW', 'RWA', 646, 'ISO 3166-2:RW', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Saint Barthélemy', 'BL', 'BLM', 652, 'ISO 3166-2:BL', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654, 'ISO 3166-2:SH', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Saint Kitts and Nevis', 'KN', 'KNA', 659, 'ISO 3166-2:KN', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Saint Lucia', 'LC', 'LCA', 662, 'ISO 3166-2:LC', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Saint Martin (French part)', 'MF', 'MAF', 663, 'ISO 3166-2:MF', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'ISO 3166-2:PM', 'Americas', 'Northern America', '019', '021', 6, 16),
('Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 'ISO 3166-2:VC', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Samoa', 'WS', 'WSM', 882, 'ISO 3166-2:WS', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('San Marino', 'SM', 'SMR', 674, 'ISO 3166-2:SM', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Sao Tome and Principe', 'ST', 'STP', 678, 'ISO 3166-2:ST', 'Africa', 'Middle Africa', '002', '017', 4, 6),
('Saudi Arabia', 'SA', 'SAU', 682, 'ISO 3166-2:SA', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Senegal', 'SN', 'SEN', 686, 'ISO 3166-2:SN', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Serbia', 'RS', 'SRB', 688, 'ISO 3166-2:RS', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Seychelles', 'SC', 'SYC', 690, 'ISO 3166-2:SC', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Sierra Leone', 'SL', 'SLE', 694, 'ISO 3166-2:SL', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Singapore', 'SG', 'SGP', 702, 'ISO 3166-2:SG', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Sint Maarten (Dutch part)', 'SX', 'SXM', 534, 'ISO 3166-2:SX', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Slovakia', 'SK', 'SVK', 703, 'ISO 3166-2:SK', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('Slovenia', 'SI', 'SVN', 705, 'ISO 3166-2:SI', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Solomon Islands', 'SB', 'SLB', 90, 'ISO 3166-2:SB', 'Oceania', 'Melanesia', '009', '054', 5, 21),
('Somalia', 'SO', 'SOM', 706, 'ISO 3166-2:SO', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('South Africa', 'ZA', 'ZAF', 710, 'ISO 3166-2:ZA', 'Africa', 'Southern Africa', '002', '018', 4, 17),
('South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 'ISO 3166-2:GS', '', '', '', '', 7, 8),
('South Sudan', 'SS', 'SSD', 728, 'ISO 3166-2:SS', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Spain', 'ES', 'ESP', 724, 'ISO 3166-2:ES', 'Europe', 'Southern Europe', '150', '039', 3, 3),
('Sri Lanka', 'LK', 'LKA', 144, 'ISO 3166-2:LK', 'Asia', 'Southern Asia', '142', '034', 2, 1),
('Sudan', 'SD', 'SDN', 729, 'ISO 3166-2:SD', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('Suriname', 'SR', 'SUR', 740, 'ISO 3166-2:SR', 'Americas', 'South America', '019', '005', 6, 9),
('Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'ISO 3166-2:SJ', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Swaziland', 'SZ', 'SWZ', 748, 'ISO 3166-2:SZ', 'Africa', 'Southern Africa', '002', '018', 4, 17),
('Sweden', 'SE', 'SWE', 752, 'ISO 3166-2:SE', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('Switzerland', 'CH', 'CHE', 756, 'ISO 3166-2:CH', 'Europe', 'Western Europe', '150', '155', 3, 12),
('Syrian Arab Republic', 'SY', 'SYR', 760, 'ISO 3166-2:SY', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Taiwan, Province of China', 'TW', 'TWN', 158, 'ISO 3166-2:TW', 'Asia', 'Eastern Asia', '142', '030', 2, 20),
('Tajikistan', 'TJ', 'TJK', 762, 'ISO 3166-2:TJ', 'Asia', 'Central Asia', '142', '143', 2, 23),
('Tanzania, United Republic of', 'TZ', 'TZA', 834, 'ISO 3166-2:TZ', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Thailand', 'TH', 'THA', 764, 'ISO 3166-2:TH', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Timor-Leste', 'TL', 'TLS', 626, 'ISO 3166-2:TL', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Togo', 'TG', 'TGO', 768, 'ISO 3166-2:TG', 'Africa', 'Western Africa', '002', '011', 4, 15),
('Tokelau', 'TK', 'TKL', 772, 'ISO 3166-2:TK', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Tonga', 'TO', 'TON', 776, 'ISO 3166-2:TO', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Trinidad and Tobago', 'TT', 'TTO', 780, 'ISO 3166-2:TT', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Tunisia', 'TN', 'TUN', 788, 'ISO 3166-2:TN', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('Turkey', 'TR', 'TUR', 792, 'ISO 3166-2:TR', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Turkmenistan', 'TM', 'TKM', 795, 'ISO 3166-2:TM', 'Asia', 'Central Asia', '142', '143', 2, 23),
('Turks and Caicos Islands', 'TC', 'TCA', 796, 'ISO 3166-2:TC', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Tuvalu', 'TV', 'TUV', 798, 'ISO 3166-2:TV', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Uganda', 'UG', 'UGA', 800, 'ISO 3166-2:UG', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Ukraine', 'UA', 'UKR', 804, 'ISO 3166-2:UA', 'Europe', 'Eastern Europe', '150', '151', 3, 13),
('United Arab Emirates', 'AE', 'ARE', 784, 'ISO 3166-2:AE', 'Asia', 'Western Asia', '142', '145', 2, 10),
('United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', 826, 'ISO 3166-2:GB', 'Europe', 'Northern Europe', '150', '154', 3, 2),
('United States Minor Outlying Islands', 'UM', 'UMI', 581, 'ISO 3166-2:UM', '', '', '', '', 7, 8),
('United States of America', 'US', 'USA', 840, 'ISO 3166-2:US', 'Americas', 'Northern America', '019', '021', 6, 16),
('Uruguay', 'UY', 'URY', 858, 'ISO 3166-2:UY', 'Americas', 'South America', '019', '005', 6, 9),
('Uzbekistan', 'UZ', 'UZB', 860, 'ISO 3166-2:UZ', 'Asia', 'Central Asia', '142', '143', 2, 23),
('Vanuatu', 'VU', 'VUT', 548, 'ISO 3166-2:VU', 'Oceania', 'Melanesia', '009', '054', 5, 21),
('Venezuela (Bolivarian Republic of)', 'VE', 'VEN', 862, 'ISO 3166-2:VE', 'Americas', 'South America', '019', '005', 6, 9),
('Viet Nam', 'VN', 'VNM', 704, 'ISO 3166-2:VN', 'Asia', 'South-Eastern Asia', '142', '035', 2, 18),
('Virgin Islands (British)', 'VG', 'VGB', 92, 'ISO 3166-2:VG', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Virgin Islands (U.S.)', 'VI', 'VIR', 850, 'ISO 3166-2:VI', 'Americas', 'Caribbean', '019', '029', 6, 7),
('Wallis and Futuna', 'WF', 'WLF', 876, 'ISO 3166-2:WF', 'Oceania', 'Polynesia', '009', '061', 5, 5),
('Western Sahara', 'EH', 'ESH', 732, 'ISO 3166-2:EH', 'Africa', 'Northern Africa', '002', '015', 4, 4),
('Yemen', 'YE', 'YEM', 887, 'ISO 3166-2:YE', 'Asia', 'Western Asia', '142', '145', 2, 10),
('Zambia', 'ZM', 'ZMB', 894, 'ISO 3166-2:ZM', 'Africa', 'Eastern Africa', '002', '014', 4, 19),
('Zimbabwe', 'ZW', 'ZWE', 716, 'ISO 3166-2:ZW', 'Africa', 'Eastern Africa', '002', '014', 4, 19);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`) VALUES
(7, ''),
(4, 'Africa'),
(6, 'Americas'),
(2, 'Asia'),
(3, 'Europe'),
(5, 'Oceania');

-- --------------------------------------------------------

--
-- Table structure for table `sub_regions`
--

CREATE TABLE `sub_regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `region_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sub_regions`
--

INSERT INTO `sub_regions` (`id`, `region_id`, `name`) VALUES
(1, 2, 'Southern Asia'),
(2, 3, 'Northern Europe'),
(3, 3, 'Southern Europe'),
(4, 4, 'Northern Africa'),
(5, 5, 'Polynesia'),
(6, 4, 'Middle Africa'),
(7, 6, 'Caribbean'),
(8, 7, ''),
(9, 6, 'South America'),
(10, 2, 'Western Asia'),
(11, 5, 'Australia and New Zealand'),
(12, 3, 'Western Europe'),
(13, 3, 'Eastern Europe'),
(14, 6, 'Central America'),
(15, 4, 'Western Africa'),
(16, 6, 'Northern America'),
(17, 4, 'Southern Africa'),
(18, 2, 'South-Eastern Asia'),
(19, 4, 'Eastern Africa'),
(20, 2, 'Eastern Asia'),
(21, 5, 'Melanesia'),
(22, 5, 'Micronesia'),
(23, 2, 'Central Asia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD UNIQUE KEY `country_name` (`name`),
  ADD UNIQUE KEY `country_code_2` (`code_2`),
  ADD UNIQUE KEY `country_code_3` (`code_3`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sub_regions`
--
ALTER TABLE `sub_regions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sub_regions`
--
ALTER TABLE `sub_regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
