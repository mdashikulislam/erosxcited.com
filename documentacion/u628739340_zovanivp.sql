-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-12-2023 a las 16:30:50
-- Versión del servidor: 10.6.15-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u628739340_zovanivp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `update_length` int(10) UNSIGNED NOT NULL COMMENT 'The max length of updates',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int(11) UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `pinterest` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `currency_symbol` char(10) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `min_subscription_amount` int(11) UNSIGNED NOT NULL,
  `payment_gateway` enum('PayPal','Stripe') NOT NULL DEFAULT 'PayPal',
  `min_width_height_image` varchar(100) NOT NULL,
  `fee_commission` int(10) UNSIGNED NOT NULL,
  `max_subscription_amount` int(10) UNSIGNED NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `link_privacy` varchar(200) NOT NULL,
  `link_terms` varchar(200) NOT NULL,
  `currency_position` varchar(100) NOT NULL DEFAULT 'left',
  `facebook_login` enum('on','off') NOT NULL DEFAULT 'off',
  `amount_min_withdrawal` int(10) UNSIGNED NOT NULL,
  `youtube` varchar(200) NOT NULL,
  `github` varchar(200) NOT NULL,
  `comment_length` int(10) UNSIGNED NOT NULL,
  `days_process_withdrawals` int(10) UNSIGNED NOT NULL,
  `google_login` enum('on','off') NOT NULL DEFAULT 'off',
  `number_posts_show` tinyint(3) UNSIGNED NOT NULL,
  `number_comments_show` tinyint(3) UNSIGNED NOT NULL,
  `registration_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 No, 1 Yes',
  `account_verification` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 No, 1 Yes',
  `logo` varchar(100) NOT NULL,
  `logo_2` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `home_index` varchar(100) NOT NULL,
  `bg_gradient` varchar(100) NOT NULL,
  `img_1` varchar(100) NOT NULL,
  `img_2` varchar(100) NOT NULL,
  `img_3` varchar(100) NOT NULL,
  `img_4` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `show_counter` enum('on','off') NOT NULL DEFAULT 'on',
  `color_default` varchar(100) NOT NULL,
  `decimal_format` enum('comma','dot') NOT NULL DEFAULT 'dot',
  `version` varchar(5) NOT NULL,
  `link_cookies` varchar(200) NOT NULL,
  `story_length` int(10) UNSIGNED NOT NULL,
  `maintenance_mode` enum('on','off') NOT NULL DEFAULT 'off',
  `company` varchar(100) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `vat` varchar(100) NOT NULL,
  `widget_creators_featured` enum('on','off') NOT NULL DEFAULT 'on',
  `home_style` int(10) UNSIGNED NOT NULL,
  `file_size_allowed_verify_account` int(10) UNSIGNED NOT NULL,
  `payout_method_paypal` enum('on','off') NOT NULL DEFAULT 'on',
  `payout_method_bank` enum('on','off') NOT NULL DEFAULT 'on',
  `min_tip_amount` int(10) UNSIGNED NOT NULL,
  `max_tip_amount` int(10) UNSIGNED NOT NULL,
  `min_ppv_amount` int(10) UNSIGNED NOT NULL,
  `max_ppv_amount` int(10) UNSIGNED NOT NULL,
  `min_deposits_amount` int(10) UNSIGNED NOT NULL,
  `max_deposits_amount` int(10) UNSIGNED NOT NULL,
  `button_style` enum('rounded','normal') NOT NULL DEFAULT 'rounded',
  `twitter_login` enum('on','off') NOT NULL DEFAULT 'off',
  `hide_admin_profile` enum('on','off') NOT NULL DEFAULT 'off',
  `requests_verify_account` enum('on','off') NOT NULL DEFAULT 'on',
  `navbar_background_color` varchar(30) NOT NULL,
  `navbar_text_color` varchar(30) NOT NULL,
  `footer_background_color` varchar(30) NOT NULL,
  `footer_text_color` varchar(30) NOT NULL,
  `preloading` enum('on','off') NOT NULL DEFAULT 'off',
  `preloading_image` varchar(100) NOT NULL,
  `watermark` enum('on','off') NOT NULL DEFAULT 'on',
  `earnings_simulator` enum('on','off') NOT NULL DEFAULT 'on',
  `custom_css` text NOT NULL,
  `custom_js` text NOT NULL,
  `alert_adult` enum('on','off') NOT NULL DEFAULT 'off',
  `genders` varchar(250) NOT NULL,
  `cover_default` varchar(100) NOT NULL,
  `who_can_see_content` enum('all','users') NOT NULL DEFAULT 'all',
  `users_can_edit_post` enum('on','off') NOT NULL DEFAULT 'on',
  `disable_wallet` enum('on','off') NOT NULL DEFAULT 'on',
  `disable_banner_cookies` enum('on','off') NOT NULL DEFAULT 'off',
  `wallet_format` enum('real_money','credits','points','tokens') NOT NULL DEFAULT 'real_money',
  `maximum_files_post` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `maximum_files_msg` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `announcement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcement_show` varchar(100) NOT NULL,
  `announcement_cookie` varchar(20) NOT NULL,
  `limit_categories` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `captcha_contact` enum('on','off') NOT NULL DEFAULT 'on',
  `disable_tips` enum('on','off') NOT NULL DEFAULT 'off',
  `payout_method_payoneer` enum('on','off') NOT NULL DEFAULT 'off',
  `payout_method_zelle` enum('on','off') NOT NULL DEFAULT 'off',
  `type_announcement` char(10) NOT NULL DEFAULT 'primary',
  `referral_system` enum('on','off') NOT NULL DEFAULT 'off',
  `auto_approve_post` enum('on','off') NOT NULL DEFAULT 'on',
  `watermark_on_videos` enum('on','off') NOT NULL DEFAULT 'on',
  `percentage_referred` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `referral_transaction_limit` char(10) NOT NULL DEFAULT '1',
  `video_encoding` enum('on','off') NOT NULL DEFAULT 'off',
  `live_streaming_status` enum('on','off') NOT NULL DEFAULT 'off',
  `live_streaming_minimum_price` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `live_streaming_max_price` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `agora_app_id` varchar(200) NOT NULL,
  `tiktok` varchar(200) NOT NULL,
  `snapchat` varchar(200) NOT NULL,
  `limit_live_streaming_paid` int(10) UNSIGNED NOT NULL,
  `limit_live_streaming_free` int(10) UNSIGNED NOT NULL,
  `live_streaming_free` enum('0','1') NOT NULL DEFAULT '0',
  `type_withdrawals` char(50) NOT NULL DEFAULT 'custom',
  `shop` tinyint(1) NOT NULL DEFAULT 0,
  `min_price_product` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `max_price_product` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `digital_product_sale` tinyint(1) NOT NULL DEFAULT 0,
  `custom_content` tinyint(1) NOT NULL DEFAULT 0,
  `tax_on_wallet` tinyint(1) NOT NULL DEFAULT 1,
  `stripe_connect` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `stripe_connect_countries` longtext NOT NULL,
  `physical_products` tinyint(1) NOT NULL DEFAULT 0,
  `disable_login_register_email` tinyint(1) NOT NULL DEFAULT 0,
  `disable_contact` tinyint(1) NOT NULL DEFAULT 0,
  `specific_day_payment_withdrawals` int(10) UNSIGNED NOT NULL,
  `disable_new_post_notification` tinyint(1) NOT NULL DEFAULT 0,
  `disable_search_creators` tinyint(1) NOT NULL DEFAULT 0,
  `search_creators_genders` tinyint(1) NOT NULL DEFAULT 0,
  `generate_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `autofollow_admin` tinyint(1) NOT NULL DEFAULT 0,
  `allow_zip_files` tinyint(1) NOT NULL DEFAULT 1,
  `reddit` varchar(200) NOT NULL,
  `telegram` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `push_notification_status` tinyint(1) NOT NULL DEFAULT 0,
  `onesignal_appid` varchar(150) NOT NULL,
  `onesignal_restapi` varchar(150) NOT NULL,
  `status_pwa` tinyint(1) NOT NULL DEFAULT 1,
  `zip_verification_creator` tinyint(1) NOT NULL DEFAULT 1,
  `amount_max_withdrawal` int(10) UNSIGNED NOT NULL,
  `story_status` tinyint(1) NOT NULL DEFAULT 0,
  `story_image` tinyint(1) NOT NULL DEFAULT 1,
  `story_text` tinyint(1) NOT NULL DEFAULT 1,
  `story_max_videos_length` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `payout_method_western_union` enum('on','off') NOT NULL DEFAULT 'off'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `keywords`, `update_length`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `pinterest`, `instagram`, `google_adsense`, `currency_symbol`, `currency_code`, `min_subscription_amount`, `payment_gateway`, `min_width_height_image`, `fee_commission`, `max_subscription_amount`, `date_format`, `link_privacy`, `link_terms`, `currency_position`, `facebook_login`, `amount_min_withdrawal`, `youtube`, `github`, `comment_length`, `days_process_withdrawals`, `google_login`, `number_posts_show`, `number_comments_show`, `registration_active`, `account_verification`, `logo`, `logo_2`, `favicon`, `home_index`, `bg_gradient`, `img_1`, `img_2`, `img_3`, `img_4`, `avatar`, `show_counter`, `color_default`, `decimal_format`, `version`, `link_cookies`, `story_length`, `maintenance_mode`, `company`, `country`, `address`, `city`, `zip`, `vat`, `widget_creators_featured`, `home_style`, `file_size_allowed_verify_account`, `payout_method_paypal`, `payout_method_bank`, `min_tip_amount`, `max_tip_amount`, `min_ppv_amount`, `max_ppv_amount`, `min_deposits_amount`, `max_deposits_amount`, `button_style`, `twitter_login`, `hide_admin_profile`, `requests_verify_account`, `navbar_background_color`, `navbar_text_color`, `footer_background_color`, `footer_text_color`, `preloading`, `preloading_image`, `watermark`, `earnings_simulator`, `custom_css`, `custom_js`, `alert_adult`, `genders`, `cover_default`, `who_can_see_content`, `users_can_edit_post`, `disable_wallet`, `disable_banner_cookies`, `wallet_format`, `maximum_files_post`, `maximum_files_msg`, `announcement`, `announcement_show`, `announcement_cookie`, `limit_categories`, `captcha_contact`, `disable_tips`, `payout_method_payoneer`, `payout_method_zelle`, `type_announcement`, `referral_system`, `auto_approve_post`, `watermark_on_videos`, `percentage_referred`, `referral_transaction_limit`, `video_encoding`, `live_streaming_status`, `live_streaming_minimum_price`, `live_streaming_max_price`, `agora_app_id`, `tiktok`, `snapchat`, `limit_live_streaming_paid`, `limit_live_streaming_free`, `live_streaming_free`, `type_withdrawals`, `shop`, `min_price_product`, `max_price_product`, `digital_product_sale`, `custom_content`, `tax_on_wallet`, `stripe_connect`, `stripe_connect_countries`, `physical_products`, `disable_login_register_email`, `disable_contact`, `specific_day_payment_withdrawals`, `disable_new_post_notification`, `disable_search_creators`, `search_creators_genders`, `generate_qr_code`, `autofollow_admin`, `allow_zip_files`, `reddit`, `telegram`, `linkedin`, `push_notification_status`, `onesignal_appid`, `onesignal_restapi`, `status_pwa`, `zip_verification_creator`, `amount_max_withdrawal`, `story_status`, `story_image`, `story_text`, `story_max_videos_length`, `payout_method_western_union`) VALUES
(1, 'ZonaVip', '\n¡Bienvenido a ZonaVIP, tu destino exclusivo para descubrir y conectar con los creadores de contenido más destacados! Sumérgete en un mundo lleno de talento, innovación y entretenimiento único.', 'donations,support,creators,Creaty,subscription', 250, '1', '', 'no-reply@sponzy.net', 'kosaricorp@gmail.com', 'off', 5120, '', 'paypal@yousite.com', '', '', '', '', '', '$', 'USD', 2, 'PayPal', '400', 20, 100, 'M d, Y', 'https://zonavip.kosari.ne/p/privacy', 'https://zonavip.kosari.ne/p/terms-of-service', 'left', 'off', 50, '', '', 150, 7, 'off', 5, 2, '1', '', 'logo-1701368260.png', 'logo_2-1701368260.png', 'favicon.png', 'home_index-1702409145.png', 'background-1702143226.jpg', 'img_1.svg', 'img_2.svg', 'img_3.svg', 'image_index_4-1702407187.jpg', 'default.jpg', 'off', '#450ea7', 'dot', '4.9', 'https://zonavip.kosari.ne/p/cookies', 500, 'off', '', '', '', '', '', '', 'off', 0, 1024, 'on', 'on', 5, 100, 5, 100, 5, 100, 'rounded', 'off', 'off', 'on', '#ffffff', '#3a3a3a', '#ffffff', '#5f5f5f', 'off', '', 'on', 'on', '', '', 'off', 'male,female', '', 'all', 'on', 'off', 'off', 'real_money', 5, 5, '', '', '', 3, 'off', 'off', 'off', 'off', 'primary', 'off', 'on', 'on', 5, '1', 'off', 'off', 5, 100, '', '', '', 0, 0, '0', 'custom', 1, 5, 100, 1, 1, 1, 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '', '', 0, '', '', 1, 1, 0, 0, 1, 1, 30, 'on');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `updates_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on',
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `keywords`, `mode`, `image`) VALUES
(1, 'Artist', 'artist', '', '', 'on', 'artist-By4bfBlXy75qPKK99RgC5MN9g8lUTWo8.jpg'),
(2, 'Designer', 'designer', '', '', 'on', 'designer-SP7jB58pOuQW7Wz3Tf2v32OOZrU6zgxh.jpg'),
(3, 'Drawing and Painting', 'drawing-and-painting', '', '', 'on', 'drawing-and-painting-sRKBmjTngYwmwZ5PZ2OIPr2K2MS5WT2Q.jpg'),
(4, 'Developer', 'developer', '', '', 'on', 'developer-fpZjQGTE9TCtNIkE3K7XmOyoFHsrcI7Q.jpg'),
(5, 'Animation', 'animation', 'Category Animation', 'animate, animation', 'on', 'animation-N600Gsc1uJffH9Jsdjo9kYpq3TKl7E9x.jpg'),
(7, 'Photography', 'photography', '', '', 'on', 'photography-Q8AA4mr4v3Y7AkNEj9dU46oHjTJqAWcO.jpg'),
(8, 'Video and Film', 'video-and-film', '', '', 'on', 'video-and-film-F4BHush4GW0y9WzMrxWCJXEoKMcZWZeZ.jpg'),
(9, 'Podcasts', 'podcasts', '', '', 'on', 'podcasts-ubacYB2BVCgzu79lqOXp9Zfa2jtjwgFE.jpg'),
(10, 'Others', 'others', '', '', 'on', 'others-PplPsJxWsOu7ex6qWqWdQtMhYDufxM2k.jpg'),
(12, 'Writing', 'writing', '', '', 'on', 'writing-Q5b6A8vlTiE4W1pokW1sR1TGxJigTLAv.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `updates_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Trash, 1 Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comments_id` int(10) UNSIGNED NOT NULL,
  `replies_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `txn_id` varchar(200) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `screenshot_transfer` varchar(100) NOT NULL,
  `percentage_applied` varchar(50) DEFAULT NULL,
  `transaction_fee` double(10,2) NOT NULL,
  `taxes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `txn_id`, `amount`, `payment_gateway`, `date`, `status`, `screenshot_transfer`, `percentage_applied`, `transaction_fee`, `taxes`) VALUES
(1, 1, '3VC77981708863129', 100, 'PayPal', '2023-12-07 20:37:27', 'active', '', '5.4% + 0.30', 5.70, ''),
(2, 1, '9YX70288BN566224X', 100, 'PayPal', '2023-12-07 20:38:02', 'active', '', '5.4% + 0.30', 5.70, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"b26c591a-84ca-43c2-81bc-2e8b7e06421e\",\"displayName\":\"App\\\\Listeners\\\\SubscriptionDisabledListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:42:\\\"App\\\\Listeners\\\\SubscriptionDisabledListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:36:\\\"App\\\\Events\\\\SubscriptionDisabledEvent\\\":2:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:16:\\\"freeSubscription\\\";s:3:\\\"yes\\\";}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701368336, 1701368336),
(2, 'default', '{\"uuid\":\"c45bb7f2-7244-46e3-bfbb-d4973f6d79a8\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701368785, 1701368785),
(3, 'default', '{\"uuid\":\"582b89f6-6395-4887-b0a1-ac9000ac5e00\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701981708, 1701981708),
(4, 'default', '{\"uuid\":\"b112c8c4-ab4b-4d73-a528-e24d08bfc9e8\",\"displayName\":\"App\\\\Notifications\\\\TipReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:3;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:29:\\\"App\\\\Notifications\\\\TipReceived\\\":2:{s:35:\\\"\\u0000App\\\\Notifications\\\\TipReceived\\u0000data\\\";a:2:{s:6:\\\"tipper\\\";s:5:\\\"Admin\\\";s:6:\\\"amount\\\";s:1:\\\"5\\\";}s:2:\\\"id\\\";s:36:\\\"b4825d9f-98e2-4fa7-96c6-fedad918a2e7\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1701981739, 1701981739),
(5, 'default', '{\"uuid\":\"a410b2f2-b9d2-4ba6-bef6-84c5435b5f7d\",\"displayName\":\"App\\\\Notifications\\\\NewSale\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:3;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:25:\\\"App\\\\Notifications\\\\NewSale\\\":2:{s:4:\\\"sale\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:20:\\\"App\\\\Models\\\\Purchases\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"58874d6b-ffe3-4fdd-97d2-b8061a0fd563\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1701981901, 1701981901),
(6, 'default', '{\"uuid\":\"6d9d3053-0e55-43d9-87e3-03ea15d686f5\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701982159, 1701982159),
(7, 'default', '{\"uuid\":\"9eeab394-0ad6-48fa-9075-f602a8055eed\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701982537, 1701982537),
(8, 'default', '{\"uuid\":\"db446039-5601-48ae-979f-e907c173b6ff\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701982907, 1701982907),
(9, 'default', '{\"uuid\":\"1cc06c39-b2c9-483b-aadf-67635372df8c\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701982941, 1701982941),
(10, 'default', '{\"uuid\":\"30eb2a13-e53a-4ee3-8a4f-ce03e67fea8d\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701983015, 1701983015),
(11, 'default', '{\"uuid\":\"52579be8-ac0f-42fb-94d5-646c1f172d6d\",\"displayName\":\"App\\\\Listeners\\\\SubscriptionDisabledListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:42:\\\"App\\\\Listeners\\\\SubscriptionDisabledListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:36:\\\"App\\\\Events\\\\SubscriptionDisabledEvent\\\":2:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:16:\\\"freeSubscription\\\";s:3:\\\"yes\\\";}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701983031, 1701983031),
(12, 'default', '{\"uuid\":\"96813396-acbf-4f32-8c58-4224f662f8dd\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701983079, 1701983079),
(13, 'default', '{\"uuid\":\"e18386ed-65aa-4e6a-9bca-84e5356669f3\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701983870, 1701983870),
(14, 'default', '{\"uuid\":\"99d6f692-d8a8-4af3-98a2-7ed6430efecd\",\"displayName\":\"App\\\\Listeners\\\\SubscriptionDisabledListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:42:\\\"App\\\\Listeners\\\\SubscriptionDisabledListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:36:\\\"App\\\\Events\\\\SubscriptionDisabledEvent\\\":2:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:16:\\\"freeSubscription\\\";s:3:\\\"yes\\\";}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701984605, 1701984605),
(15, 'default', '{\"uuid\":\"c64785cb-5fa0-4619-a4aa-9dbf8f60a4d5\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701984625, 1701984625),
(16, 'default', '{\"uuid\":\"4dbcf016-89b7-493f-9b02-92a9dd8eb724\",\"displayName\":\"App\\\\Notifications\\\\TipReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:4;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:29:\\\"App\\\\Notifications\\\\TipReceived\\\":2:{s:35:\\\"\\u0000App\\\\Notifications\\\\TipReceived\\u0000data\\\";a:2:{s:6:\\\"tipper\\\";s:5:\\\"Admin\\\";s:6:\\\"amount\\\";s:2:\\\"25\\\";}s:2:\\\"id\\\";s:36:\\\"5d02ef21-eb22-4bda-bbfc-08a881008d75\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1701984864, 1701984864),
(17, 'default', '{\"uuid\":\"90d0ad2d-039b-4cba-8537-147d68572f36\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1701985750, 1701985750),
(18, 'default', '{\"uuid\":\"6a03c52d-2326-4b6e-8655-c4f8f84fa5f5\",\"displayName\":\"App\\\\Notifications\\\\TipReceived\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:7;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:29:\\\"App\\\\Notifications\\\\TipReceived\\\":2:{s:35:\\\"\\u0000App\\\\Notifications\\\\TipReceived\\u0000data\\\";a:2:{s:6:\\\"tipper\\\";s:5:\\\"Admin\\\";s:6:\\\"amount\\\";s:2:\\\"80\\\";}s:2:\\\"id\\\";s:36:\\\"1f933224-b4c7-42c6-b9aa-89b2b8265852\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1701985849, 1701985849),
(19, 'default', '{\"uuid\":\"ea7e2f32-dcbf-4aef-a227-16fdeb04343f\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1702489966, 1702489966),
(20, 'default', '{\"uuid\":\"341ec2a4-580e-442a-a7f9-012b953a1cec\",\"displayName\":\"App\\\\Listeners\\\\NewPostListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:29:\\\"App\\\\Listeners\\\\NewPostListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\NewPostEvent\\\":1:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Updates\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1702489989, 1702489989);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `abbreviation`) VALUES
(1, 'English', 'en'),
(2, 'Español', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `updates_id` int(11) UNSIGNED NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '0 trash, 1 active',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `updates_id`, `status`, `date`) VALUES
(1, 1, 2, '1', '2023-12-07 20:42:32'),
(2, 1, 11, '1', '2023-12-07 21:49:13'),
(3, 10, 7, '1', '2023-12-20 15:55:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_comments`
--

CREATE TABLE `live_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `live_streamings_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `joined` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `tip` enum('0','1') NOT NULL DEFAULT '0',
  `tip_amount` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_likes`
--

CREATE TABLE `live_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `live_streamings_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_online_users`
--

CREATE TABLE `live_online_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `live_streamings_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_streamings`
--

CREATE TABLE `live_streamings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `channel` text NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `availability` char(50) NOT NULL DEFAULT 'all_pay'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_sessions`
--

CREATE TABLE `login_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(100) NOT NULL,
  `device` varchar(100) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `platform` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `login_sessions`
--

INSERT INTO `login_sessions` (`id`, `user_id`, `ip`, `device`, `device_type`, `browser`, `platform`, `country`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', 'WebKit', 'desktop', 'Chrome 106.0.0.0', 'Windows 10.0', NULL, '2022-10-16 05:00:54', '2022-10-16 05:00:54'),
(2, 1, '127.0.0.1', 'WebKit', 'desktop', 'Chrome 109.0.0.0', 'Windows 10.0', NULL, '2023-01-27 00:32:30', '2023-01-27 00:32:30'),
(3, 1, '127.0.0.1', 'WebKit', 'desktop', 'Chrome 114.0.0.0', 'Windows 10.0', NULL, '2023-07-28 10:46:43', '2023-07-28 10:46:43'),
(4, 1, '127.0.0.1', 'WebKit', 'desktop', 'Chrome 115.0.0.0', 'Windows 10.0', NULL, '2023-08-02 12:37:59', '2023-08-11 21:19:44'),
(5, 1, '2800:e2:9980:2b2:d0ce:c661:1b1e:48e6', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', NULL, '2023-11-30 17:13:18', '2023-12-09 17:33:18'),
(6, 2, '2800:e2:9980:2b2:796c:439c:9611:3c8b', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-11-30 18:24:10', '2023-11-30 18:24:10'),
(7, 3, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 20:38:47', '2023-12-07 20:38:47'),
(8, 4, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 20:48:22', '2023-12-07 21:36:23'),
(9, 5, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 20:54:26', '2023-12-07 20:54:26'),
(10, 6, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 21:03:14', '2023-12-07 21:03:14'),
(11, 7, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 21:11:59', '2023-12-07 21:11:59'),
(12, 7, '190.29.80.28', 'iPhone', 'phone', 'Chrome 119.0.6045.169', 'iOS 17_0', 'Colombia', '2023-12-07 21:16:33', '2023-12-07 21:16:33'),
(13, 1, '2800:e2:9980:2b2:6586:b815:f62a:911a', 'iPhone', 'phone', 'Chrome 119.0.6045.169', 'iOS 17_0', NULL, '2023-12-07 21:23:00', '2023-12-07 21:23:00'),
(14, 8, '2800:e2:9980:2b2:6586:b815:f62a:911a', 'iPhone', 'phone', 'Chrome 119.0.6045.169', 'iOS 17_0', 'Colombia', '2023-12-07 21:26:03', '2023-12-07 21:26:03'),
(15, 8, '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-07 21:28:44', '2023-12-07 21:28:44'),
(16, 1, '2800:e2:9980:2b2:59d1:5084:945e:22c0', 'WebKit', 'desktop', 'Chrome 120.0.0.0', 'Windows 10.0', NULL, '2023-12-12 18:51:55', '2023-12-20 16:29:52'),
(17, 9, '2001:1388:1880:8bb8:99ae:2cfe:1f36:792e', 'WebKit', 'desktop', 'Chrome 119.0.0.0', 'Windows 10.0', 'Peru', '2023-12-13 17:46:56', '2023-12-13 17:46:56'),
(18, 1, '2800:e2:9980:2b2:b544:eb23:acc3:a7af', 'WebKit', 'desktop', 'Chrome 88.0.4324.188', 'Linux ', NULL, '2023-12-14 05:26:53', '2023-12-14 05:26:53'),
(19, 4, '2800:e2:9980:2b2:b544:eb23:acc3:a7af', 'iPhone', 'phone', 'Safari 16.6', 'iOS 16_6', 'Colombia', '2023-12-14 05:27:47', '2023-12-14 05:27:47'),
(20, 1, '2800:e2:9980:2b2:9434:6aa1:ea04:7ac8', 'iPhone', 'phone', 'Chrome 120.0.6099.119', 'iOS 17_0', NULL, '2023-12-20 15:37:24', '2023-12-20 15:58:51'),
(21, 10, '2601:84:8b00:dea0:60cc:7fde:df0a:4267', 'iPhone', 'phone', 'Chrome 120.0.6099.119', 'iOS 16_2', 'United States', '2023-12-20 15:39:53', '2023-12-20 15:39:53'),
(22, 7, '2800:e2:9980:2b2:9434:6aa1:ea04:7ac8', 'iPhone', 'phone', 'Chrome 120.0.6099.119', 'iOS 17_0', 'Colombia', '2023-12-20 15:43:32', '2023-12-20 15:43:32'),
(23, 11, '2800:e2:9980:2b2:59d1:5084:945e:22c0', 'WebKit', 'desktop', 'Chrome 120.0.0.0', 'Windows 10.0', 'Colombia', '2023-12-20 16:29:29', '2023-12-20 16:29:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `updates_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `width` varchar(5) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `img_type` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `encoded` enum('yes','no') NOT NULL DEFAULT 'no',
  `video_poster` varchar(255) DEFAULT NULL,
  `duration_video` varchar(50) DEFAULT NULL,
  `quality_video` varchar(20) DEFAULT NULL,
  `video_embed` varchar(200) NOT NULL,
  `music` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `updates_id`, `user_id`, `type`, `image`, `width`, `height`, `img_type`, `video`, `encoded`, `video_poster`, `duration_video`, `quality_video`, `video_embed`, `music`, `file`, `file_name`, `file_size`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'image', '26568d3c7c96f31701368775e68rjirnmy5dlhr5wqqd.png', '1920', '1080', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'sdj5qhbzAN443EPlycoePY7oEMMUI0t52Cp623PVMfRg2xe3dWuFgJkS9RnwgCl1pemzCuIharcx8asjZ9EbyUX7azCSGkKZRUHmNKsnUzqfjBZkuVaiW69at2caRHhwmzRQ5Cq3HIrvKSZC9eBCLr6568d3c7da10b1701368775', 'active', '2023-11-30 18:26:16', '2023-11-30 18:26:25'),
(2, 2, 3, 'image', '365722e09ca39d1701981705vyb4ceiwui2mbcklbsip.jpg', '530', '960', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', '4QExjcQZKbA8dlPxWkkOcIpOWgQsgyam7vGt74McXpdn8mg1hDKCBpkFUze29Nezjx6OO9hFZBracwFcIoHDr8yg2nL8m331CV9U3iAQ7eHmHoDNLwgmku3bZPudh9Wsdcs6w4eE98STveJMgVtpHJ65722e09cf8131701981705', 'active', '2023-12-07 20:41:45', '2023-12-07 20:41:48'),
(3, 3, 4, 'image', '465722fca47b8b1701982154thftwc0lbutnv4lva3c7.jpg', '736', '903', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'Ug0kHRc3NKVNnZ0aCA8qBRbDk52xj2mOSA22BZyvDcRBkqlklHKU6tFKAnms4bO7SsVKlzNS5V8NVZyuDLbK2QNhIcd4ZbZ3o3M2lzJAGStqzLGoUUN8WEay9DG90AtfF33AAAmix5nCopexPAywsI65722fca4d9c21701982154', 'active', '2023-12-07 20:49:14', '2023-12-07 20:49:19'),
(4, 4, 5, 'image', '565723147e198f1701982535yhqksptuzn4mqhuosb0f.jpg', '736', '1177', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'jy08fjgXq1Hb5TxzKvPAU1wurUN4viRyj5WkATgrg0kwiapb1jZdVq58gA6TuoMwtEXiR2fIxwzTdLYMLNicTINCVfzLM7NODkpQCQikekBCugHhEl13bXdyPHVdaMO9I4L8izcK43MLD6MJaALabT65723147e87251701982535', 'active', '2023-12-07 20:55:35', '2023-12-07 20:55:37'),
(5, 5, 1, 'image', '1657232a6f3c751701982886nsqohxwa5g8ytc7rx3xs.jpg', '600', '600', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'jJAJ5cruzugNoPxQ20Lf7kxcFeI4kiPCZe0lslD8uDTDPyEAKN0EMyRHevmjGgyxEjnnOBxhPUJALHpxVIx1XZuvk1jzTdNNVMHhtN7NjeQ7OenVfLCv3DCYLkjLRLJEGmDC704gBrSwCIBiJ6Zz74657232a7033fe1701982887', 'active', '2023-12-07 21:01:27', '2023-12-07 21:01:47'),
(6, 6, 1, 'image', '1657232dc15c4f1701982940ihdeakhhob0wg2w51w1k.jpg', '736', '903', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'EIEYwCONWCePPkDeUeYF0Ck2P3jyWbhTFsw7KX14A3QdDgyHXOl9Mma52MCU89d7gNoDYV84VUoiRLIhJ7uZxfAqEpY1P00sAjK7e2yFikeEV3XdyfkTohKmSEbUxr7lXRxF2CTItr2kNBpL0xygz9657232dc1b3781701982940', 'active', '2023-12-07 21:02:20', '2023-12-07 21:02:21'),
(7, 7, 6, 'image', '665723320333081701983008gem5opz5z5u6mgn5yhwq.jpg', '640', '800', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'IkLiYZtjwSXXnejxtqkpjkahpep5nrRCE39u7oqTVpkOjsa6zRBe6cBWcpuRFIodKUZzC0JuZIkuzO315bOMCGQU1sCsTBK4GSYvOT4zgPMJJxSH6nMfIXtXqMcIshmfzP5om7UMoVVoOtLlrB0Zgc657233203733e1701983008', 'active', '2023-12-07 21:03:28', '2023-12-07 21:03:35'),
(8, 8, 6, 'image', '6657233546ae3617019830606dcxlrofebikti3kabdc.jpg', '235', '326', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'h1f9dYCux0ppadOssJeIG5yJaIX6gOSIaCcRsCcaAtMGPMs0Ir1yxuI07cGihBa5hmE4oKfPCvMun8KUuISBjUsgliLB1z6T8yjkOOolfpLeZZeHbcsEkrMFue8B7qQWOsY2FRR0RwMeHC4i7oL1Iv657233546bb931701983060', 'active', '2023-12-07 21:04:20', '2023-12-07 21:04:39'),
(9, 9, 7, 'image', '765723675f31be170198386149hqexvknwttczuir0m2.jpeg', '1024', '1024', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'cZT5jstPIGutNkfrIjwwparXQWxgbKNWzoppWgKwA4qPhtOVoKB7DlZ7VYVji83WLLa346PbXL9HWAc5WkxjbbGvrmWbbQUJKWJLjlobnT6jbJxg3U0tFr9Ot8831OfjJwtlCNbvKpkKnO7YgT4Mkt65723676056501701983862', 'active', '2023-12-07 21:17:42', '2023-12-07 21:17:50'),
(10, 10, 8, 'image', '86572396763dcc17019846157w9ljspyvpxpi9w9ptia.jpg', '736', '1084', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', '9L07aciFdGUUxCaNxS4edj6uLlzBbjmuCsWOD82paFvINCqaFr4CUBJEbBdocVIb7LBCtm7vZRR8m6S4q7NYZyuC9jcsaTHyMvvYuitUVGQLZiCg7rCShWzPilTmcPJdmyO6qKvEidEoSfiQCGQ95e657239676a5ea1701984615', 'active', '2023-12-07 21:30:15', '2023-12-07 21:30:25'),
(11, 11, 1, 'image', '165723dc3a7b251701985731mnt1rw2v8sbprbg6qlro.jpg', '530', '960', '', '', 'no', NULL, NULL, NULL, '', '', '', '', '', 'X9T9XOYpParfoSlHtr4zFec0xIRgfmr8FUzpX61qFRU6ZTDXl01bbXQh50cnFTRXzIcwVJxLQyLDgqVPlbZAmpLeVKGmNet1uKeiDoBkTQjfLMf9PRQ0qVrUDiGDJ0WQo8ZVsEjE3vUzB9liEgNQUc65723dc3abaf71701985731', 'active', '2023-12-07 21:48:51', '2023-12-07 21:49:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media_messages`
--

CREATE TABLE `media_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `messages_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `file` varchar(255) NOT NULL,
  `width` varchar(5) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `video_poster` varchar(255) DEFAULT NULL,
  `duration_video` varchar(50) DEFAULT NULL,
  `quality_video` varchar(20) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `encoded` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media_products`
--

CREATE TABLE `media_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `media_products`
--

INSERT INTO `media_products` (`id`, `products_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, '365722e4b433011701981771kfqc3rnkq716saioww3v.jpg', '2023-12-07 20:43:59', '2023-12-07 20:43:59'),
(2, 2, '465723067d11061701982311ulxkizjxfyc6fxxiuqnl.jpg', '2023-12-07 20:52:30', '2023-12-07 20:52:30'),
(3, 3, '5657231b3d5b7c1701982643d6stoz1hf4gvbastluxt.jpg', '2023-12-07 20:57:27', '2023-12-07 20:57:27'),
(4, 4, '165723242ecb761701982786a49bbzltsfhl0iadoifk.jpg', '2023-12-07 21:00:41', '2023-12-07 21:00:41'),
(5, 5, '66572340a65b6f1701983242vxjgzcjxm7y8gqk4gcjt.jpg', '2023-12-07 21:07:32', '2023-12-07 21:07:32'),
(6, 6, '665723452a35ce1701983314qyzsyxxiuoyunwbyredj.jpg', '2023-12-07 21:09:03', '2023-12-07 21:09:03'),
(7, 7, '76572369b384ec1701983899uhtewbllacnfxjo3q2lx.jpeg', '2023-12-07 21:19:16', '2023-12-07 21:19:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media_stories`
--

CREATE TABLE `media_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `video_length` varchar(20) DEFAULT NULL,
  `video_poster` varchar(100) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `font_color` varchar(50) NOT NULL DEFAULT '#ffffff',
  `font` varchar(50) NOT NULL DEFAULT 'Arial',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversations_id` int(11) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED NOT NULL,
  `to_user_id` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach_file` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('new','readed') NOT NULL DEFAULT 'new',
  `remove_from` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 Active',
  `file` varchar(150) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `format` varchar(10) NOT NULL,
  `size` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tip` enum('yes','no') NOT NULL DEFAULT 'no',
  `tip_amount` int(10) UNSIGNED NOT NULL,
  `mode` enum('active','pending') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `destination` int(10) UNSIGNED NOT NULL,
  `author` int(10) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL COMMENT '1 Subscribed, 2  Like, 3 reply, 4 Like Comment',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 unseen, 1 seen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `destination`, `author`, `target`, `type`, `status`, `created_at`) VALUES
(1, 3, 1, 1, 5, '1', '2023-12-07 20:42:19'),
(2, 3, 1, 2, 2, '1', '2023-12-07 20:42:32'),
(3, 3, 1, 1, 15, '1', '2023-12-07 20:45:01'),
(4, 4, 1, 4, 1, '1', '2023-12-07 21:34:16'),
(5, 4, 1, 1, 5, '1', '2023-12-07 21:34:24'),
(6, 7, 1, 1, 5, '1', '2023-12-07 21:50:49'),
(7, 6, 10, 6, 1, '0', '2023-12-20 15:40:18'),
(8, 6, 10, 7, 2, '0', '2023-12-20 15:55:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `lang` char(10) NOT NULL DEFAULT 'es',
  `access` varchar(50) NOT NULL DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `description`, `keywords`, `lang`, `access`) VALUES
(2, 'Terms of Service', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets</p>', 'terms-of-service', 'Terms of Service of Sponzy', 'terms, Terms of Service', 'en', 'all'),
(3, 'Privacy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \n\n<br/><br/>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'privacy', '', '', 'en', 'all'),
(5, 'About us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets<br />\r\n<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', 'about', '', '', 'en', 'all'),
(8, 'How it works', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'how-it-works', '', '', 'en', 'all'),
(9, 'Cookies Policy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets', 'cookies', 'Page Cookies Policy', 'cookies, policy', 'en', 'all');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` enum('1','0') NOT NULL DEFAULT '1',
  `sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `fee` decimal(3,1) NOT NULL,
  `fee_cents` decimal(6,2) NOT NULL,
  `email` varchar(80) NOT NULL,
  `token` varchar(200) NOT NULL,
  `key` varchar(255) NOT NULL,
  `key_secret` varchar(255) NOT NULL,
  `bank_info` text NOT NULL,
  `recurrent` enum('yes','no') NOT NULL,
  `logo` varchar(50) NOT NULL,
  `webhook_secret` varchar(255) NOT NULL,
  `subscription` enum('yes','no') NOT NULL DEFAULT 'yes',
  `ccbill_accnum` varchar(200) NOT NULL,
  `ccbill_subacc` varchar(200) NOT NULL,
  `ccbill_flexid` varchar(200) NOT NULL,
  `ccbill_salt` varchar(200) NOT NULL,
  `ccbill_subacc_subscriptions` varchar(200) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `project_secret` varchar(255) DEFAULT NULL,
  `ccbill_datalink_username` varchar(255) DEFAULT NULL,
  `ccbill_datalink_password` varchar(255) DEFAULT NULL,
  `ccbill_skip_subaccount_cancellations` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `type`, `enabled`, `sandbox`, `fee`, `fee_cents`, `email`, `token`, `key`, `key_secret`, `bank_info`, `recurrent`, `logo`, `webhook_secret`, `subscription`, `ccbill_accnum`, `ccbill_subacc`, `ccbill_flexid`, `ccbill_salt`, `ccbill_subacc_subscriptions`, `project_id`, `project_secret`, `ccbill_datalink_username`, `ccbill_datalink_password`, `ccbill_skip_subaccount_cancellations`) VALUES
(1, 'PayPal', 'normal', '1', 'true', 5.4, 0.30, '', '02bGGfD9bHevK3eJN06CdDvFSTXsTrTG44yGdAONeN1R37jqnLY1PuNF0mJRoFnsEygyf28yePSCA1eR0alQk4BX89kGG9Rlha2D2KX55TpDFNR5o774OshrkHSZLOFo2fAhHzcWKnwsYDFKgwuaRg', 'AfWuMIJRN5hET3xqI7QSvJlwwTSx08VQaSaZs1nOXbI527inRYUPbvqL6bOTJMrRSLABmi6Dn7tKbOpR', 'EKvrHIxEIm2hDy1fPw3C8_0aZ81VUrAevNvqCtXh4A8-xcF-h2m4KgUmrP9F-PHCKBB7tlxFBSskCkR9', '', 'yes', 'paypal.png', 'https://zonavip.kosari.net/webhook/paypal', 'yes', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(2, 'Stripe', 'card', '0', 'true', 2.9, 0.30, '', 'asfQSGRvYzS1P0X745krAAyHeU7ZbTpHbYKnxI2abQsBUi48EpeAu5lFAU2iBmsUWO5tpgAn9zzussI4Cce5ZcANIAmfBz0bNR9g3UfR4cserhkJwZwPsETiXiZuCixXVDHhCItuXTPXXSA6KITEoT', '', '', '', 'yes', 'stripe.png', '', 'yes', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(3, 'Bank', 'bank', '1', 'false', 3.0, 0.00, '', 'MUXRUWEuhBulbgDGUS4PbTCCjlUGr4VcGb59RU2rRWtgCHstntxq2eOeeDvIHKUwxj5z2njJ6DUGfmt0PzFnEWuspasmCserf705dJeQcVttZtHugTlBMlzt0Uf6K4DjVmGVtyZuPzXakjrFGVLYRd', '', '', 'BANCO: Davivienda\r\nNúmero de cuenta: 752826962838\r\nNombre: zonavip', 'no', '', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(4, 'CCBill', 'card', '0', 'true', 0.0, 0.00, '', 'zYYFZRjTfypGTPg0TCgWK8SKdLjGEMuNGMYedjl1D0hgmSPDS0UUduCNqkYL609NWH6ru6qdaBGFIzxeL85HwEtIOBfEQRC16qIQZ1zkTM1wbcC4fe2Wxpom6g8zmoOR1ppFN6MbPFHUJQur434Nzg', '', '', '', 'yes', '', '', 'yes', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(5, 'Paystack', 'card', '0', 'true', 0.0, 0.00, '', '4w2JnfBSvoZKLiVRzHRWu3pzkgsFslVZBn8Z4mmwzVJ5KVfiFZN9kTgfFEVu90E1wPN8TnaXhtmYKwkzZ0p6HGUo1S5yVXisVxlD2PIOcm6v096akLbMAgjxiXCdFlCALkZXqi4pfrwxpYd7BGFk8c', '', '', '', 'yes', '', '', 'yes', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(6, 'Coinpayments', 'normal', '0', 'true', 0.0, 0.00, '', 'nzfADI4PgRHRn8m3r7UrR0arnfT9u1rDOQL5SKGbqPjDOZGDZA35NX3y0lQBAdmIyGVS58Rr9OtebfpGNpiXROq1G1DJNqq6xoD04fLKWTaAS2Xh3CZvECa1OfH5cchJ2P6kEl167Caax2XyAwwjGl', '', '', '', 'no', 'coinpayments.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(7, 'Mercadopago', 'normal', '1', 'true', 0.0, 0.00, '', 'UmqNKk1EzDyjGgJxAswkhzL8bSdHusZh8RxF4hqzCEf52qdMOAMzMCchsKrLZgPcuTry6AZLLG7DUGwlpXVVpv1CajJbiV3j4EvPqbbIkBCoOptrDWZY1nRJhMc39v6NDOKFo9TjHQdnwU5pZSSReW', '', 'TEST-2099712422963543-040702-a082ed0bdb45848b5678c502a77fe5bd-619228414', '', 'no', 'mercadopago.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(8, 'Flutterwave', 'normal', '0', 'true', 0.0, 0.00, '', 'jMF4RWTW14dfJxlusZ22jGeCLdc8i3416CNiw2ny4l8kGBILQDTrhLtCsDxmb1MfBQA6xGh5BhQBrOXCUBB8lQMZrCaJQykG3Nxbv0ADFUSJiNewq7kbSkxyR3rCbbVjhBYMtWt6dpJTB78CafpA6T', '', '', '', 'no', 'flutterwave.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(9, 'Mollie', 'normal', '0', 'true', 0.0, 0.00, '', 'EqvhQZimw0L3zWQ35AV93iDOqgQnkXV9cqLnIvgsnz2zRLpjeZUv5JnC3QzTjtctYuVmzuo06N31tLCRPFJNkomdh7Rhk2zxe68GzgWsL1hc6YEM5V5W6JVnqwQfAzNGZkY6ZRFKmZCMbFQXOF3WkR', '', '', '', 'no', 'mollie.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(10, 'Razorpay', 'normal', '0', 'true', 0.0, 0.00, '', 'PsNqGq2rlLjo4AaTTsJpxshttwFFrLXjaKcwwQeG2r8aekDoETl9OG1cqND9PluycCfXazyzUiLo7ZFWs2tBWYwOpGcM8i5ID93Kr7Y6l79XrBcST56QONVpEcAuLRs36Z2t1Q1MBlR315c6vSpAFX', '', '', '', 'no', 'razorpay.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(11, 'Coinbase', 'normal', '0', 'true', 0.0, 0.00, '', 'sjuRSAj4VdjaBx2bcdXgDbvTdpiHJF40CNsX5vqw4VaaaohvDS48Oc30N6DAxIxChfd2qWQ99q6e11E90OOKwmo0RbXUv3fdpPksWMvJUkm8i7F5ajbsy0LbjqyidUBqJP0BG6H3NkidnbhtfcDF45', '', '', '', 'no', 'coinbase.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0),
(12, 'NowPayments', 'normal', '0', 'true', 0.0, 0.00, '', '4DPdFIbqqPqI8XjseCCV1RRVwVuuQx6WtYdHIkMDtxgUKCQaS9Mqww4WUwa6fIxn7NN9ediLstZyIYQQIIt9l6rUANRSzrUVt86J5FopCkZHvysC8CMRBS3LOnKDbNHiUmVh91CkmvjiwCrFApfrtH', '', '', '', 'no', 'nowpayments.png', '', 'no', '', '', '', '', '', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pay_per_views`
--

CREATE TABLE `pay_per_views` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `updates_id` int(10) UNSIGNED NOT NULL,
  `messages_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `interval` varchar(100) NOT NULL,
  `paystack` varchar(150) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plans`
--

INSERT INTO `plans` (`id`, `user_id`, `name`, `price`, `interval`, `paystack`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'user_3_weekly', 5.00, 'weekly', '', '1', '2023-12-07 20:39:33', '2023-12-07 20:39:33'),
(2, 3, 'user_3', 15.00, 'monthly', '', '1', '2023-12-07 20:39:33', '2023-12-07 20:39:33'),
(3, 3, 'user_3_quarterly', 25.00, 'quarterly', '', '1', '2023-12-07 20:39:33', '2023-12-07 20:39:33'),
(4, 3, 'user_3_biannually', 40.00, 'biannually', '', '1', '2023-12-07 20:39:33', '2023-12-07 20:39:33'),
(5, 3, 'user_3_yearly', 60.00, 'yearly', '', '1', '2023-12-07 20:39:33', '2023-12-07 20:39:33'),
(6, 4, 'user_4_weekly', 5.00, 'weekly', '', '1', '2023-12-07 20:48:49', '2023-12-07 20:48:49'),
(7, 4, 'user_4', 10.00, 'monthly', '', '1', '2023-12-07 20:48:49', '2023-12-07 20:48:49'),
(8, 4, 'user_4_quarterly', 20.00, 'quarterly', '', '1', '2023-12-07 20:48:49', '2023-12-07 20:48:49'),
(9, 4, 'user_4_biannually', 45.00, 'biannually', '', '1', '2023-12-07 20:48:49', '2023-12-07 20:48:49'),
(10, 5, 'user_5_weekly', 8.00, 'weekly', '', '1', '2023-12-07 20:54:55', '2023-12-07 20:54:55'),
(11, 5, 'user_5', 20.00, 'monthly', '', '1', '2023-12-07 20:54:55', '2023-12-07 20:54:55'),
(12, 5, 'user_5_quarterly', 50.00, 'quarterly', '', '1', '2023-12-07 20:54:55', '2023-12-07 20:54:55'),
(13, 7, 'user_7_weekly', 5.00, 'weekly', '', '1', '2023-12-07 21:17:03', '2023-12-07 21:17:03'),
(14, 7, 'user_7', 10.00, 'monthly', '', '1', '2023-12-07 21:17:03', '2023-12-07 21:17:03'),
(15, 7, 'user_7_quarterly', 25.00, 'quarterly', '', '1', '2023-12-07 21:17:03', '2023-12-07 21:17:03'),
(16, 6, 'user_6', 0.00, 'monthly', '', '1', '2023-12-20 15:40:18', '2023-12-20 15:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` char(20) NOT NULL DEFAULT 'digital',
  `price` decimal(10,2) NOT NULL,
  `delivery_time` int(10) UNSIGNED NOT NULL,
  `country_free_shipping` char(20) NOT NULL,
  `tags` text NOT NULL,
  `description` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `mime` varchar(50) DEFAULT NULL,
  `extension` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `box_contents` varchar(200) NOT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `type`, `price`, `delivery_time`, `country_free_shipping`, `tags`, `description`, `file`, `mime`, `extension`, `size`, `status`, `created_at`, `updated_at`, `shipping_fee`, `quantity`, `box_contents`, `category`) VALUES
(1, 3, 'Video llamada Hot', 'custom', 20.00, 1, '', 'videollamada, llamada', 'Tengamos un rato agradable por video llamada', '', NULL, NULL, NULL, '1', '2023-12-07 20:43:59', '2023-12-07 20:43:59', 0.00, 0, '', ''),
(2, 4, 'Pack de fotos y videos personalizados', 'custom', 15.00, 1, '', 'fotos, videos, pack', 'Pide las fotos y videos como tu quieras amor', '', NULL, NULL, NULL, '1', '2023-12-07 20:52:30', '2023-12-07 20:52:30', 0.00, 0, '', '5'),
(3, 5, 'Manual para mejorar en la intimidad', 'custom', 25.00, 1, '', 'tantra, manual, intimidad', 'Mejora en la intimidad con mi manual', '', NULL, NULL, NULL, '1', '2023-12-07 20:57:27', '2023-12-07 20:57:27', 0.00, 0, '', '2'),
(4, 1, 'Mujeres en Forma 21 Días de Reto Fitness', 'digital', 35.00, 0, '', 'gym, fitness', '¿Te gustaría conocer las herramientas y trucos más poderosos a nivel mundial para realizar tus ejercicios en casa en un reto de 21 días?\r\n\r\nCon el MasterClass MUJERES EN FORMA: 21 DÍAS DE RETO FITNESS aprenderás cómo crear hábitos de ejercicios en casa de 10 a 15 minutos, para aquellas mujeres que quieran ver resultados en poco tiempo.', '16572326f1fe141701982831d6hpinwucfsetqjvapn4.jpg', 'image/jpeg', 'jpg', '77.6kB', '1', '2023-12-07 21:00:41', '2023-12-07 21:00:41', 0.00, 0, '', '2'),
(6, 6, 'Hablemos por Chat', 'custom', 8.00, 1, '', 'chat, social', 'Tengamos una hermosa amistad, hablemos amor', '', NULL, NULL, NULL, '1', '2023-12-07 21:09:03', '2023-12-07 21:09:03', 0.00, 0, '', '1'),
(7, 7, 'Te enseño a cómo empezar en el mundo gamer', 'digital', 29.00, 0, '', 'gamer', 'Quieres aprender a ser un gamer profesional en cualquier juego? Entonces compra mi guía', '7657236cd663211701983949t7hfazx9hjmzwzdygia2.jpeg', 'image/jpeg', 'jpeg', '219.3kB', '1', '2023-12-07 21:19:16', '2023-12-07 21:19:16', 0.00, 0, '', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transactions_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `delivery_status` varchar(50) NOT NULL DEFAULT 'delivered',
  `description_custom_content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `purchases`
--

INSERT INTO `purchases` (`id`, `transactions_id`, `user_id`, `products_id`, `delivery_status`, `description_custom_content`, `created_at`, `updated_at`, `address`, `city`, `zip`, `phone`) VALUES
(1, 2, 1, 1, 'delivered', 'Quiero tener una video llamada contigo', '2023-12-07 20:45:01', '2023-12-07 20:45:31', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referral_transactions`
--

CREATE TABLE `referral_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transactions_id` int(10) UNSIGNED DEFAULT NULL,
  `referrals_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(10) UNSIGNED NOT NULL,
  `earnings` double(10,2) NOT NULL,
  `type` char(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `updates_id` bigint(20) UNSIGNED NOT NULL,
  `comments_id` bigint(20) UNSIGNED NOT NULL,
  `reply` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserved`
--

CREATE TABLE `reserved` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(49, 'artisan'),
(47, 'blog'),
(30, 'bootstrap'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(45, 'core'),
(46, 'cpanel'),
(32, 'creators'),
(37, 'dashboard'),
(41, 'database'),
(50, 'explore'),
(35, 'featured'),
(1, 'fuck'),
(9, 'goods'),
(52, 'home'),
(11, 'jobs'),
(21, 'join'),
(53, 'lang'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(48, 'offline'),
(15, 'popular'),
(6, 'porn'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(51, 'shop'),
(26, 'signup'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restrictions`
--

CREATE TABLE `restrictions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_restricted` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `name`, `slug`) VALUES
(1, 'Servicio', 'servicio'),
(2, 'Producto Digital', 'producto-digital'),
(3, 'Producto Fisico', 'producto-fisico'),
(4, 'Videollamada', 'video-llamada'),
(5, 'Fotos y Videos', 'fotos-videos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `countries_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` char(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stories`
--

CREATE TABLE `stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `story_backgrounds`
--

CREATE TABLE `story_backgrounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `story_backgrounds`
--

INSERT INTO `story_backgrounds` (`id`, `name`) VALUES
(1, '01.jpg'),
(2, '02.png'),
(3, '03.jpg'),
(4, '04.jpg'),
(5, '05.jpg'),
(6, '06.png'),
(7, '07.jpg'),
(8, '08.png'),
(9, '09.jpg'),
(10, '10.png'),
(11, '11.jpg'),
(12, '12.jpg'),
(13, '13.jpg'),
(14, '14.jpg'),
(15, '15.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `story_fonts`
--

CREATE TABLE `story_fonts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `story_views`
--

CREATE TABLE `story_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `media_stories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stripe_state_tokens`
--

CREATE TABLE `stripe_state_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_payment` varchar(255) DEFAULT NULL,
  `free` enum('yes','no') NOT NULL DEFAULT 'no',
  `subscription_id` varchar(50) NOT NULL,
  `cancelled` enum('yes','no') NOT NULL DEFAULT 'no',
  `rebill_wallet` enum('on','off') NOT NULL DEFAULT 'off',
  `interval` varchar(100) NOT NULL DEFAULT 'monthly',
  `taxes` text DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`, `last_payment`, `free`, `subscription_id`, `cancelled`, `rebill_wallet`, `interval`, `taxes`, `payment_id`) VALUES
(1, 1, '', '', '', 'user_4', NULL, NULL, '2024-01-07 21:34:16', '2023-12-07 21:34:16', '2023-12-07 21:34:16', NULL, 'no', '', 'no', 'on', 'monthly', '', NULL),
(2, 10, '', '', '', 'user_6', NULL, NULL, NULL, '2023-12-20 15:40:18', '2023-12-20 15:40:18', NULL, 'yes', '', 'no', 'off', 'monthly', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) DEFAULT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `percentage` decimal(5,2) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `iso_state` char(10) DEFAULT NULL,
  `stripe_id` varchar(100) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `txn_id` varchar(250) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subscriptions_id` int(10) UNSIGNED NOT NULL,
  `subscribed` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `earning_net_user` decimal(10,2) NOT NULL,
  `earning_net_admin` decimal(10,2) NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `approved` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '0 Pending, 1 Success, 2 Canceled',
  `amount` float NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'subscription',
  `percentage_applied` varchar(50) NOT NULL,
  `referred_commission` int(10) UNSIGNED NOT NULL,
  `taxes` text DEFAULT NULL,
  `direct_payment` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`id`, `txn_id`, `user_id`, `subscriptions_id`, `subscribed`, `created_at`, `earning_net_user`, `earning_net_admin`, `payment_gateway`, `approved`, `amount`, `type`, `percentage_applied`, `referred_commission`, `taxes`, `direct_payment`) VALUES
(1, 'w_3dCSEB06yMcwuksjSGUpDk9Cc', 1, 0, 3, '2023-12-07 20:42:19', 4.75, 0.25, 'Wallet', '1', 5, 'tip', '5%', 0, '', 0),
(2, 'purchase_YxuDq2R7ErhEZuPxkDAjLMdx8', 1, 0, 3, '2023-12-07 20:45:01', 19.00, 1.00, 'Wallet', '1', 20, 'purchase', '5%', 0, '', 0),
(3, 'subw_am3f68Hqm3UKDJZ0oKfNonMJ4', 1, 1, 4, '2023-12-07 21:34:16', 9.50, 0.50, 'Wallet', '1', 10, 'subscription', '5%', 0, '', 0),
(4, 'w_D7eZCrMbgTTtK48CnxkckPRRf', 1, 0, 4, '2023-12-07 21:34:24', 23.75, 1.25, 'Wallet', '1', 25, 'tip', '5%', 0, '', 0),
(5, 'w_vt2cBXhL1jt0g0iDgpFYWJg0F', 1, 0, 7, '2023-12-07 21:50:49', 64.00, 16.00, 'Wallet', '1', 80, 'tip', '20%', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `two_factor_codes`
--

CREATE TABLE `two_factor_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_id` varchar(255) NOT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  `fixed_post` enum('0','1') NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `status` char(20) NOT NULL DEFAULT 'active',
  `video_views` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `updates`
--

INSERT INTO `updates` (`id`, `title`, `description`, `user_id`, `date`, `token_id`, `locked`, `fixed_post`, `price`, `status`, `video_views`) VALUES
(1, NULL, 'Excelente!!', 2, '2023-11-30 18:26:25', 'ZfiRJ4g3EfPJCwF3x8Hkrziq89veXydjoFmfHdz4Cm3SmcnGWhHaWfWWGn2orzO9XCDZOLjA1lpCG1hdDIcb0SFWwox2E2DQkG6LVVggND88VL5oFkkrGMEYfXEQAeYNDapTSsiqOTIPPw0iIzZcR0', 'yes', '0', 0.00, 'active', 0),
(2, NULL, 'Buenos días', 3, '2023-12-07 20:41:48', 'X8tk8kJY0d6VD99qfIlbasV7He2pmrlmNgeIrEEIatml9H2QblaQ73EtVKJufeCuvha2ehoMpOkqU5qdn01QEoaaLo2y0fU2nuxT8nxDaGeYe3qmyZ1P5CdcaWtLazr3b6WOxDoFeXajY9nZlLKUjs', 'yes', '0', 0.00, 'active', 0),
(3, NULL, 'Estoy mojada', 4, '2023-12-07 20:49:19', 'aTJcW97dFbhUT9KpFPb0438H1h7m2AVH7lLD1cIP3f3Zn6FhcO298PJOLvc4bUEdII8n2CVcXCayxGGJJB7bfaPCO2d8PCLHUDrJEELCN4LGByoadWX2e8CQFE0fvzfF2FzA0OWvzi4q53xqfwsi81', 'yes', '0', 0.00, 'active', 0),
(4, NULL, 'Tengo calor', 5, '2023-12-07 20:55:37', 'pTk6iHWsnA0R3oFe2BMOlqv9Sb2QpUFpYmGB2vGVWuTdts5R3pDkvtIKdhnnwMz4N4Lv7jNNlHnh9Ipbt8dLGkMbGJi1yaOqwWkYsmAzbxmMoHZkm8BnWceaCHn0xkFBUrkHBcG4uXJORO4ZtFMA9L', 'yes', '0', 0.00, 'active', 0),
(5, NULL, 'Con el MasterClass MUJERES EN FORMA: 21 DÍAS DE RETO FITNESS aprenderás cómo crear hábitos de ejercicios en casa de 10 a 15 minutos', 1, '2023-12-07 21:01:47', '7Uaj9dR92FMb5eW0UDuKTpOksiiNP44Zdks95FdYWGg9s2O9BZ8BCklnj35zskSGdoBQKTaWBx7XEBHn8GCNCaaDsPd1STJGJQNe39SicoKXxKCfEyuPvHzYTQy9UprxYqotUNzJyyslXSfBC8ZzRT', 'yes', '0', 0.00, 'active', 0),
(6, NULL, 'Nuestra Hermosa creadora sofia\r\nhttps://zonavip.kosari.net/sofia4', 1, '2023-12-07 21:02:21', 'NDsDAJWhbkR2IaUGeYzz9RGTazEAwvYeGizEEKHbJKIG8NjVfGDU5QqzFSKVohK5xuvWulX1h7FZvg5MSuMGYt7d2vNyicLS8MGu1DdDMeEEBylVaa00z4ymx7cozMTQlVndKxXayLftvcZqSiHEGR', 'yes', '0', 0.00, 'active', 0),
(7, NULL, 'Holaa', 6, '2023-12-07 21:03:35', 'VyPsODcdYCWccFYS7rSFSlU9lEA1gHlH18pza9XVL9uNbqB2waXM5zW1jFXnt7v7GHqMGS7qLtv3e8NvIA5bNiB5RWhBuLee6Z5RrXBwC8Nno99uhO58B0Mjku1IXATRnsR7kTzjUatRDloMx3YBPW', 'yes', '0', 0.00, 'active', 0),
(8, NULL, 'Mira como me consiento', 6, '2023-12-07 21:04:39', '8AARkn2rZLcfGhGowhqtxeQ7ZVNzHlllXqyUh2YRrRtsdmrM1BqLVKgOLkSWbZe51H3gK7EFLBJven3Sc4b7X17TuzS0zQt3gUBY4QRCR1myQx2J6RZrgmZTXGYFWeZT6zxNt3IM6Qk0ECMpb5phC5', 'yes', '0', 15.00, 'active', 0),
(9, NULL, 'Listos para jugar el warzone', 7, '2023-12-07 21:17:50', 'B65yx3LZYaTJyaajP0P9XX3xHTK2HRFBE9O9mvWTIqDhlP85nqHQs2DeT6h8pQ0o1Yju33HwCiy0pKvpHzNVRGbWLp7Z9HsgpyBP8lOHC2TaQht8fkOHoZb9LJrcXDankBUG0EFuUef9tkxlTxHjer', 'yes', '0', 0.00, 'active', 0),
(10, NULL, 'Que lindo dia', 8, '2023-12-07 21:30:25', 'd5vetQ5ZU4w9vAIIw4bR3Bt7PdesCayFpoCx2ZeE4ZCVpuYjdfAWGIklTa0QMMexwnehSM8rJhi9Ap854Pje2Uffpw7rCa4XbDp26X49aZeFZOwBMd78Uh55veV64qjHSaHmxm7BMjvhzkNLr8ho25', 'yes', '0', 0.00, 'active', 0),
(11, NULL, 'Dayana top 10 de creadoras', 1, '2023-12-07 21:49:10', 'w3At3PuD8qIjfqp0OFYsrEA7GmIYGDOWiAn0wMcvVlRdUlTBB6PDvP3JpXoYniLQemqnzdc0ltwYw1ty5sdHJQfHjS1P3j6euGYtAjCsj2oHBYiVOPZVRr2aG4MBzbPdn9ofkDNNUEXlcRQX5to5On', 'yes', '0', 0.00, 'active', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(70) NOT NULL,
  `cover` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `permission` enum('all','none') NOT NULL DEFAULT 'none',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `confirmation_code` varchar(125) NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `bank` text NOT NULL,
  `featured` enum('yes','no') NOT NULL DEFAULT 'no',
  `featured_date` timestamp NULL DEFAULT NULL,
  `about` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `story` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) NOT NULL,
  `oauth_provider` varchar(255) NOT NULL,
  `categories_id` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `verified_id` enum('yes','no','reject') DEFAULT 'no',
  `address` varchar(200) NOT NULL,
  `city` varchar(150) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `youtube` varchar(200) NOT NULL,
  `pinterest` varchar(200) NOT NULL,
  `github` varchar(200) NOT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `email_new_subscriber` enum('yes','no') NOT NULL DEFAULT 'yes',
  `plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_new_subscriber` enum('yes','no') NOT NULL DEFAULT 'yes',
  `notify_liked_post` enum('yes','no') NOT NULL DEFAULT 'yes',
  `notify_commented_post` enum('yes','no') NOT NULL DEFAULT 'yes',
  `company` varchar(50) NOT NULL,
  `post_locked` enum('yes','no') NOT NULL DEFAULT 'yes',
  `ip` varchar(40) NOT NULL,
  `dark_mode` enum('on','off') NOT NULL DEFAULT 'off',
  `gender` varchar(50) NOT NULL,
  `birthdate` varchar(30) NOT NULL,
  `allow_download_files` enum('no','yes') NOT NULL DEFAULT 'no',
  `language` varchar(10) NOT NULL,
  `free_subscription` enum('yes','no') NOT NULL DEFAULT 'no',
  `wallet` decimal(10,2) NOT NULL,
  `tiktok` varchar(200) NOT NULL,
  `snapchat` varchar(200) NOT NULL,
  `paystack_plan` varchar(100) NOT NULL,
  `paystack_authorization_code` varchar(100) NOT NULL,
  `paystack_last4` int(10) UNSIGNED NOT NULL,
  `paystack_exp` varchar(50) NOT NULL,
  `paystack_card_brand` varchar(25) NOT NULL,
  `notify_new_tip` enum('yes','no') NOT NULL DEFAULT 'yes',
  `hide_profile` enum('yes','no') NOT NULL DEFAULT 'no',
  `hide_last_seen` enum('yes','no') NOT NULL DEFAULT 'no',
  `last_login` varchar(250) NOT NULL,
  `hide_count_subscribers` enum('yes','no') NOT NULL DEFAULT 'no',
  `hide_my_country` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_my_birthdate` enum('yes','no') NOT NULL DEFAULT 'no',
  `notify_new_post` enum('yes','no') NOT NULL DEFAULT 'yes',
  `notify_email_new_post` enum('yes','no') NOT NULL DEFAULT 'yes',
  `custom_fee` int(10) UNSIGNED NOT NULL,
  `hide_name` enum('yes','no') NOT NULL DEFAULT 'no',
  `birthdate_changed` enum('yes','no') NOT NULL DEFAULT 'no',
  `email_new_tip` enum('yes','no') NOT NULL DEFAULT 'yes',
  `email_new_ppv` enum('yes','no') NOT NULL DEFAULT 'yes',
  `notify_new_ppv` enum('yes','no') NOT NULL DEFAULT 'yes',
  `active_status_online` enum('yes','no') NOT NULL DEFAULT 'yes',
  `payoneer_account` varchar(200) NOT NULL,
  `zelle_account` varchar(200) NOT NULL,
  `notify_liked_comment` enum('yes','no') NOT NULL DEFAULT 'yes',
  `permissions` text NOT NULL,
  `blocked_countries` text NOT NULL,
  `two_factor_auth` enum('yes','no') NOT NULL DEFAULT 'no',
  `notify_live_streaming` enum('yes','no') NOT NULL DEFAULT 'yes',
  `notify_mentions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `stripe_connect_id` varchar(255) DEFAULT NULL,
  `completed_stripe_onboarding` tinyint(1) NOT NULL DEFAULT 0,
  `device_token` varchar(255) DEFAULT NULL,
  `telegram` varchar(200) NOT NULL,
  `vk` varchar(200) NOT NULL,
  `twitch` varchar(200) NOT NULL,
  `discord` varchar(200) NOT NULL,
  `reddit` varchar(200) NOT NULL,
  `spotify` varchar(200) NOT NULL,
  `posts_privacy` tinyint(1) NOT NULL DEFAULT 1,
  `document_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `countries_id`, `password`, `email`, `date`, `avatar`, `cover`, `status`, `role`, `permission`, `remember_token`, `token`, `confirmation_code`, `paypal_account`, `payment_gateway`, `bank`, `featured`, `featured_date`, `about`, `story`, `profession`, `oauth_uid`, `oauth_provider`, `categories_id`, `website`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `price`, `balance`, `verified_id`, `address`, `city`, `zip`, `facebook`, `twitter`, `instagram`, `youtube`, `pinterest`, `github`, `last_seen`, `email_new_subscriber`, `plan`, `notify_new_subscriber`, `notify_liked_post`, `notify_commented_post`, `company`, `post_locked`, `ip`, `dark_mode`, `gender`, `birthdate`, `allow_download_files`, `language`, `free_subscription`, `wallet`, `tiktok`, `snapchat`, `paystack_plan`, `paystack_authorization_code`, `paystack_last4`, `paystack_exp`, `paystack_card_brand`, `notify_new_tip`, `hide_profile`, `hide_last_seen`, `last_login`, `hide_count_subscribers`, `hide_my_country`, `show_my_birthdate`, `notify_new_post`, `notify_email_new_post`, `custom_fee`, `hide_name`, `birthdate_changed`, `email_new_tip`, `email_new_ppv`, `notify_new_ppv`, `active_status_online`, `payoneer_account`, `zelle_account`, `notify_liked_comment`, `permissions`, `blocked_countries`, `two_factor_auth`, `notify_live_streaming`, `notify_mentions`, `stripe_connect_id`, `completed_stripe_onboarding`, `device_token`, `telegram`, `vk`, `twitch`, `discord`, `reddit`, `spotify`, `posts_privacy`, `document_id`) VALUES
(1, 'Admin', 'Admin', '48', '$2y$10$w43/UwUKRX2XJ6quJVbSeey3fpxaVIRPxDkhzgVZmwHXDIx3g1uPa', 'kosaricorp@gmail.com', '2023-11-30 17:12:56', 'admin-11701984192ratyc9ykbl.jpeg', 'admin-11701368297bcg6p9ei8p.png', 'active', 'admin', 'all', 'dRy9FItRYS9iRQl8r99qXGYkcDLnvpa97KcbeZZT71HAiOJUf2KPWQRv4GoO', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '', '', '', '', 'yes', '2019-02-21 03:25:00', '', 'Bienvenido a zonavip', 'Ceo ZonaVip', '', '', '', 'https://zonavip.kosari.net/', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', 'Medellin', '', '', '', '', '', '', '', '2023-12-20 16:30:24', 'yes', 'user_1', 'yes', 'yes', 'yes', '', 'yes', '', 'off', '', '12/14/1997', 'no', 'es', 'yes', 60.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'no', 0, 'no', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', 'full_access', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(2, 'Dayana', 'dayana2', '48', '$2y$10$7VFXNl7lPmAgz93gR.Wy0e0sseHu8WqV63cvqKJMH4vgTrvcMoSGe', 'dayana@gmail.com', '2023-11-30 18:24:10', 'dayana2-21701368662pclrzuyrnx.png', 'dayana2-21701368760wx7nuvezxc.png', 'active', 'normal', 'none', '', 'jL3CrIcsX1KRsMnbYdwfMly2ut33uIyg8vx5McM50vxrx8MENdXzK4lCQAySzoLMpjKb8xxkBUk', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-11-30 18:29:44', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:796c:439c:9611:3c8b', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(3, 'daniela', 'daniela3', '48', '$2y$10$2Avy/L89cKC2gtHRlfRoIucHQjrun2n0bSoFg3aVijzdvjU9JHvjy', 'daniela@gmail.com', '2023-12-07 20:38:47', 'daniela3-31701981675skg5gzar3z.jpg', 'daniela3-31701981692vmhfnozuju.png', 'active', 'normal', 'none', '', '3GibAUyu2ESzImcriawmqwrgyzoRgkTr6N0l6PRQFuYFxXPzxWgX9gNLJySBb3gh7alyPutp2YT', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 23.75, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-07 20:48:10', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(4, 'sofia', 'sofia4', '48', '$2y$10$DczWMXJ6HF4KDHMK.lf87ugpMHAOkfsrNC34Or8dGMK5DLA91JeLq', 'sofia@gmail.com', '2023-12-07 20:48:22', 'sofia4-41701982135ob43vjgwcy.jpg', 'sofia4-41701982145stqunx5hri.png', 'active', 'normal', 'none', '', 'nadZ4KQxQXpxsxV3dercUBUnaJ5d7blNWiU7rEnUVqRDKxoY29u19bHpR3uKXMdxLzEe7PuSTSz', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 33.25, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-14 05:30:48', 'yes', 'user_4', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(5, 'margarita', 'margarita5', '48', '$2y$10$FOIcVaXOqALMpppVnm39HuWHjGx6LtBZJrmoakTJVUWya9nupij.e', 'margarita@gmail.com', '2023-12-07 20:54:26', 'margarita5-5170198250364xx7w1j3x.jpg', 'margarita5-51701982520ouqdzqncak.png', 'active', 'normal', 'none', '', 'mBB37sM4Aoyp3B27nVkv0EAUi1Kcw8714PLti9pxNhcCVi1UQBdAkx3m7CtToQBe0X8gBqsoydr', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-07 21:02:41', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(6, 'maria', 'maria6', '48', '$2y$10$dsxA0Guy8lGgzvQ6jzfA7.4Gha0zfVsNWPRhSs4pjsOrhLwaYGWFS', 'maria@gmail.com', '2023-12-07 21:03:14', 'maria6-61701983040mxkmztoacp.jpg', 'maria6-61702531504swpi17jyhk.jpg', 'active', 'normal', 'none', '', 'D7BDsubZvMUIt9fXhJftYVwIJPvxp22QIbLL2KrNf9zkMBPaOpCUDQyYv01zjr29vGRIw1UA65J', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-14 05:26:07', 'yes', 'user_6', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'off', '', '', 'no', 'es', 'yes', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(7, 'gamerzone', 'gamerzone7', '48', '$2y$10$kgFBKzxPcemSKIBDRgJkEOVj2xXV8V9qdy/2C4yUmJHkB2d5XrF3q', 'gamerzone@gmail.com', '2023-12-07 21:11:59', 'gamerzone7-717019838065wwuoxheys.jpeg', 'gamerzone7-71701983846nbjbuzmmtt.jpeg', 'active', 'normal', 'none', '', 'NRPanOjI6Zi0Bw3sxxtU4JHFCNtzBSJ9ShHwK7wTItd3hKAr8C8nNyeuOyry8NYj1cjvcXhmd1d', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 64.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-20 15:58:25', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6dd4:fa45:afbd:8ad8', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(8, 'lucia', 'lucia8', '48', '$2y$10$8igEN6Eqyx/VlDewkVW0cu1TdZOxv8e4SUHObUXH08yvRTZPa4BCa', 'lucia@gmail.com', '2023-12-07 21:26:03', 'lucia8-81701984581l4bpd8xqen.jpg', 'lucia8-81701984591dx6rhfa9ka.png', 'active', 'normal', 'none', '', 'h90aeqXxSnzvkfmioHjdql5yuOW5xTeTcZy07vMfspHc6vkiD9qtKs2iYAsjyRR9gj5c7vtSzGC', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-07 22:11:58', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:6586:b815:f62a:911a', 'off', '', '', 'no', 'es', 'yes', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(9, 'will', 'will9', '170', '$2y$10$WkU5RucXFPC04/XaHPnr5.UNrRQS/ev4S.rmMGFsfUFLGxq.wbLdC', 'carlosguti2289@gmail.com', '2023-12-13 17:46:56', 'default.jpg', '', 'active', 'normal', 'none', '', 'zlqIq2EOf0n4kT2ESvQmel8yNspGzWpiyDkHJIFNZrDm6Evr5cM9p4yFGw16bLJky92tBuw7WlK', '', '', '', '', 'no', NULL, '', 'Welcome to my page. If you like my content, please consider support. Thank you for your support!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-14 01:10:37', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2001:1388:1880:8bb8:99ae:2cfe:1f36:792e', 'on', '', '', 'no', 'en', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(10, 'Juan', 'juan10', '1', '$2y$10$78j4nV0mPB1l71DfG/QcV.NrxO0VO0AAlb4fK8VhyjSKkEA/2EZwq', 'webforming@gmail.com', '2023-12-20 15:39:53', 'default.jpg', '', 'active', 'normal', 'none', '', 'Sdm5eb4CPAw2biYneZimL0avzKImKC8myqS72sHLA5eJIU2uvsQIgoSc6Cl5myLyE7axuSz4CTQ', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-20 15:57:04', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2601:84:8b00:dea0:60cc:7fde:df0a:4267', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', '', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, ''),
(11, 'zonavip', 'zonavip11', '48', '$2y$10$nFh/kO7lHp7fhReqiPJLw.uQFS77t4gNVnm3aGyNGyb00l/9JcM3y', 'zonavip@gmail.com', '2023-12-20 16:29:29', 'default.jpg', '', 'active', 'admin', 'all', '', 'xXHUsN9obfzbdpbmO8LbMHh4KD8wMAiqYGnKfiLFqZlS5eeux0Ow08AMta6GAgzRuLfkV6kd0DU', '', '', '', '', 'no', NULL, '', 'Bienvenido a mi página. Si le gusta mi contenido, considere el soporte. ¡Gracias por tu apoyo!', '', '', '', '', '', NULL, NULL, NULL, NULL, 0.00, 0.00, 'yes', '', '', '', '', '', '', '', '', '', '2023-12-20 16:29:35', 'yes', '', 'yes', 'yes', 'yes', '', 'yes', '2800:e2:9980:2b2:59d1:5084:945e:22c0', 'off', '', '', 'no', 'es', 'no', 0.00, '', '', '', '', 0, '', '', 'yes', 'no', 'no', '', 'no', 'no', 'no', 'yes', 'yes', 0, 'no', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', 'dashboard,general_settings,announcements,maintenance,billing,tax,countries_states,email,live_streaming,push_notifications,stories,shop,products,shop_categories,storage,theme,custom_css_js,posts,subscriptions,transactions,deposits,members,referrals,languages,categories,reports,withdrawals,verification_requests,pages,blog,payment_settings,profiles_social,social_login,google,pwa', '', 'no', 'yes', 'yes', NULL, 0, NULL, '', '', '', '', '', '', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_devices`
--

CREATE TABLE `user_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `device_type` char(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verification_requests`
--

CREATE TABLE `verification_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(150) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_reverse` varchar(100) DEFAULT NULL,
  `image_selfie` varchar(100) DEFAULT NULL,
  `status` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `form_w9` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_views`
--

CREATE TABLE `video_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `updates_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `amount` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gateway` varchar(100) NOT NULL,
  `account` text NOT NULL,
  `estimated_payment` timestamp NULL DEFAULT NULL,
  `date_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags` (`tags`),
  ADD KEY `slug` (`slug`);

--
-- Indices de la tabla `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_index` (`user_id`),
  ADD KEY `bookmarks_updates_id_index` (`updates_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post` (`updates_id`,`user_id`,`status`);

--
-- Indices de la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_likes_user_id_index` (`user_id`),
  ADD KEY `comments_likes_comments_id_index` (`comments_id`),
  ADD KEY `comments_likes_replies_id_index` (`replies_id`);

--
-- Indices de la tabla `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_1` (`user_1`,`user_2`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usr` (`user_id`,`updates_id`,`status`);

--
-- Indices de la tabla `live_comments`
--
ALTER TABLE `live_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_comments_user_id_index` (`user_id`),
  ADD KEY `live_comments_live_streamings_id_index` (`live_streamings_id`);

--
-- Indices de la tabla `live_likes`
--
ALTER TABLE `live_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_likes_user_id_index` (`user_id`),
  ADD KEY `live_likes_live_streamings_id_index` (`live_streamings_id`);

--
-- Indices de la tabla `live_online_users`
--
ALTER TABLE `live_online_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_online_users_user_id_index` (`user_id`),
  ADD KEY `live_online_users_live_streamings_id_index` (`live_streamings_id`);

--
-- Indices de la tabla `live_streamings`
--
ALTER TABLE `live_streamings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_streamings_user_id_index` (`user_id`);

--
-- Indices de la tabla `login_sessions`
--
ALTER TABLE `login_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_updates_id_index` (`updates_id`),
  ADD KEY `media_user_id_index` (`user_id`),
  ADD KEY `media_type_index` (`type`),
  ADD KEY `media_token_index` (`token`),
  ADD KEY `media_encoded_index` (`encoded`);

--
-- Indices de la tabla `media_messages`
--
ALTER TABLE `media_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_messages_messages_id_index` (`messages_id`),
  ADD KEY `media_messages_type_index` (`type`),
  ADD KEY `media_messages_token_index` (`token`),
  ADD KEY `media_messages_encoded_index` (`encoded`);

--
-- Indices de la tabla `media_products`
--
ALTER TABLE `media_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_products_products_id_index` (`products_id`);

--
-- Indices de la tabla `media_stories`
--
ALTER TABLE `media_stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_stories_stories_id_index` (`stories_id`),
  ADD KEY `media_stories_name_index` (`name`),
  ADD KEY `media_stories_type_index` (`type`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remove_from` (`remove_from`),
  ADD KEY `conversation_id` (`conversations_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `mode` (`mode`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination` (`destination`),
  ADD KEY `author` (`author`),
  ADD KEY `target` (`target`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hash` (`token`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pay_per_views`
--
ALTER TABLE `pay_per_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pay_per_views_user_id_index` (`user_id`),
  ADD KEY `pay_per_views_updates_id_index` (`updates_id`),
  ADD KEY `pay_per_views_messages_id_index` (`messages_id`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`),
  ADD KEY `plans_user_id_index` (`user_id`),
  ADD KEY `plans_paystack_index` (`paystack`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_index` (`user_id`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_transactions_id_index` (`transactions_id`),
  ADD KEY `purchases_user_id_index` (`user_id`),
  ADD KEY `purchases_products_id_index` (`products_id`);

--
-- Indices de la tabla `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_user_id_index` (`user_id`),
  ADD KEY `referrals_referred_by_index` (`referred_by`);

--
-- Indices de la tabla `referral_transactions`
--
ALTER TABLE `referral_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_transactions_referrals_id_index` (`referrals_id`),
  ADD KEY `referral_transactions_user_id_index` (`user_id`),
  ADD KEY `referral_transactions_referred_by_index` (`referred_by`),
  ADD KEY `referral_transactions_transactions_id_index` (`transactions_id`);

--
-- Indices de la tabla `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_user_id_index` (`user_id`),
  ADD KEY `replies_updates_id_index` (`updates_id`),
  ADD KEY `replies_comments_id_index` (`comments_id`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user_id`,`report_id`);

--
-- Indices de la tabla `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indices de la tabla `restrictions`
--
ALTER TABLE `restrictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restrictions_user_id_index` (`user_id`),
  ADD KEY `restrictions_user_restricted_index` (`user_restricted`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indices de la tabla `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_categories_slug_index` (`slug`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_countries_id_index` (`countries_id`),
  ADD KEY `name` (`name`),
  ADD KEY `code` (`code`);

--
-- Indices de la tabla `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_user_id_index` (`user_id`),
  ADD KEY `stories_status_index` (`status`);

--
-- Indices de la tabla `story_backgrounds`
--
ALTER TABLE `story_backgrounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_backgrounds_name_index` (`name`);

--
-- Indices de la tabla `story_fonts`
--
ALTER TABLE `story_fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `story_views`
--
ALTER TABLE `story_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_views_user_id_index` (`user_id`),
  ADD KEY `story_views_media_stories_id_index` (`media_stories_id`);

--
-- Indices de la tabla `stripe_state_tokens`
--
ALTER TABLE `stripe_state_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_payment` (`last_payment`(191)),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stripe_status` (`stripe_status`),
  ADD KEY `stripe_id` (`stripe_id`),
  ADD KEY `stripe_price` (`stripe_price`),
  ADD KEY `free` (`free`);

--
-- Indices de la tabla `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_id` (`subscription_id`);

--
-- Indices de la tabla `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subscriber` (`subscriptions_id`),
  ADD KEY `subscribed` (`subscribed`),
  ADD KEY `earning_net_user` (`earning_net_user`),
  ADD KEY `earning_net_admin` (`earning_net_admin`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `amount` (`amount`),
  ADD KEY `approved` (`approved`);

--
-- Indices de la tabla `two_factor_codes`
--
ALTER TABLE `two_factor_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `video_views` (`video_views`),
  ADD KEY `status` (`status`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`),
  ADD KEY `permission` (`permission`),
  ADD KEY `categories_id` (`categories_id`),
  ADD KEY `stripe_id` (`stripe_id`(191)),
  ADD KEY `users_blocked_countries_index` (`blocked_countries`(1024)),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`),
  ADD KEY `permissions` (`permissions`(1024)),
  ADD KEY `countries_id` (`countries_id`);

--
-- Indices de la tabla `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_devices_player_id_unique` (`player_id`);

--
-- Indices de la tabla `verification_requests`
--
ALTER TABLE `verification_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `video_views`
--
ALTER TABLE `video_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_views_user_id_index` (`user_id`),
  ADD KEY `video_views_updates_id_index` (`updates_id`),
  ADD KEY `video_views_ip_index` (`ip`);

--
-- Indices de la tabla `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaings_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `live_comments`
--
ALTER TABLE `live_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_likes`
--
ALTER TABLE `live_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_online_users`
--
ALTER TABLE `live_online_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_streamings`
--
ALTER TABLE `live_streamings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_sessions`
--
ALTER TABLE `login_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `media_messages`
--
ALTER TABLE `media_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `media_products`
--
ALTER TABLE `media_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `media_stories`
--
ALTER TABLE `media_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pay_per_views`
--
ALTER TABLE `pay_per_views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `referral_transactions`
--
ALTER TABLE `referral_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserved`
--
ALTER TABLE `reserved`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `restrictions`
--
ALTER TABLE `restrictions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `story_backgrounds`
--
ALTER TABLE `story_backgrounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `story_fonts`
--
ALTER TABLE `story_fonts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `story_views`
--
ALTER TABLE `story_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stripe_state_tokens`
--
ALTER TABLE `stripe_state_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `two_factor_codes`
--
ALTER TABLE `two_factor_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `verification_requests`
--
ALTER TABLE `verification_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video_views`
--
ALTER TABLE `video_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
