-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 12. September 2011 um 09:23
-- Server Version: 5.0.67
-- PHP-Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `cakemelody104zd`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Best Rock Songs'),
(2, 'Blues & Slow'),
(3, 'Dance'),
(4, 'Hip-Hop'),
(5, 'Latin'),
(6, 'Pop'),
(7, 'R''n''B'),
(8, 'Rock & Alternative'),
(9, 'World & Reggae'),
(10, 'Progressive & House'),
(11, 'Progressive & Trance'),
(12, 'Best Romanian Songs'),
(13, 'Drum & Bass & Jungle'),
(14, 'Hed Kandi'),
(15, 'Radio SWR3'),
(16, 'Skale Tracker Songs');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL auto_increment,
  `nickname` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `comments`
--

INSERT INTO `comments` (`id`, `nickname`, `comment`, `ip`, `date`, `user_id`) VALUES
(1, 'Emil', 'this company provide very clear code and nice stuff', '127.0.0.0', '2009-04-06', 0),
(2, 'Sven', 'I know this company for a very long time and etc etc...', '127.0.0.0', '2009-04-06', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `favourites`
--

CREATE TABLE IF NOT EXISTS `favourites` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL,
  `company_fav_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `favourites`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(7) unsigned NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `description` tinytext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `groups`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL auto_increment,
  `video_id` int(11) NOT NULL,
  `rateval` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `ratings`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) collate utf8_unicode_ci NOT NULL,
  `data` text collate utf8_unicode_ci NOT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `sessions`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `rights` int(4) unsigned NOT NULL,
  `active` enum('true','false') NOT NULL default 'false',
  `online` enum('true','false') NOT NULL default 'false',
  `name` varchar(32) NOT NULL,
  `pastname` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `interests` varchar(255) NOT NULL,
  `userpage` varchar(512) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `e-mail` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nickname`, `email`, `rights`, `active`, `online`, `name`, `pastname`, `created`, `interests`, `userpage`, `image`) VALUES
(1, 'demo@yahoo.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 'admin', 'demo@yahoo.com', 15, 'true', 'false', 'Admin', 'Songs', '2007-11-18 00:00:00', 'music song', '<p>Hallo ich bin der Admin!</p>', ''),
(20, 'demouser@xyz.de', '202cb962ac59075b964b07152d234b70', 'demo', 'demouser@xyz.de', 0, 'true', 'false', 'Demo', 'Demo', '2011-08-29 16:25:40', '', '', ''),
(22, 'xyz@demo.de', '202cb962ac59075b964b07152d234b70', 'emil', 'xyz@demo.de', 0, 'true', 'false', 'youuu', 'youuu', '2011-09-01 19:01:27', '', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `bandname` varchar(255) NOT NULL,
  `songtitle` varchar(255) NOT NULL,
  `tubecode` varchar(255) NOT NULL,
  `info` varchar(255) default NULL,
  `tags` varchar(255) default NULL,
  `recom` int(11) NOT NULL,
  `date` date NOT NULL,
  `hasimg` int(11) NOT NULL default '1',
  `removed` int(11) NOT NULL default '0',
  `ip1` varchar(255) default NULL,
  `ip2` varchar(255) default NULL,
  `views` int(11) NOT NULL,
  `viewdate` date default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `tubecode` (`tubecode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1977 ;

--
-- Daten für Tabelle `videos`
--

INSERT INTO `videos` (`id`, `category_id`, `bandname`, `songtitle`, `tubecode`, `info`, `tags`, `recom`, `date`, `hasimg`, `removed`, `ip1`, `ip2`, `views`, `viewdate`, `user_id`) VALUES
(1, 8, '8-bit trip', '8-bit trip song', '4qsWFFuYZYI', '', '', 0, '2009-09-18', 1, 0, '', '', 19, NULL, 1),
(5, 3, 'Arizona vs Suzy Solar', 'Samurai ( Asure mix )', 'OxD7KhxGzJE', '', '', 0, '2009-09-30', 0, 1, '', '', 15, NULL, 1),
(6, 3, 'Alex M O R P H Feat Simon', ' No Regrets ASOT 396', '70c1HYUyOME', '', '', 0, '2009-09-18', 1, 0, '', '', 8, NULL, 1),
(9, 3, 'Daniel Kandi', 'Nova (original rise mix)', 'YpQIvGx2uCw', '', '', 0, '2009-09-18', 0, 1, '', '', 346, NULL, 1),
(10, 3, 'Activa pres. Solar Movement', 'Eclipse (Mat Zo Remix) TATW 272', 'MTAHzfoKOcI', '', '', 0, '2009-09-16', 0, 1, '', '', 1571, NULL, 1),
(11, 3, 'Gareth Emery ', 'Exposure [Garuda]', 'LVmmuzZu384', '', '', 0, '2009-09-18', 0, 1, '', '', 357, NULL, 1),
(13, 3, 'Mat Zo', 'Lucky Strike | Full & HQ', 'ngAtU6bXSYY', '', '', 0, '2009-09-18', 0, 1, '', '', 589, NULL, 1),
(15, 3, 'Tristan Garner vs Crystal Waters', 'Gypsy Woman 2009', 'TpkoaL2OC8o', '', '', 0, '2009-09-18', 0, 1, '', '', 324, NULL, 1),
(22, 3, 'Madonna', 'What It Feels Like For A Girl ', '41GVBn_n6X4', '', '', 0, '2009-09-18', 1, 0, '', '', 224, NULL, 1),
(31, 3, 'Adam Nickey Feat. Tiff Lacey', 'Letting Go', 'bnDjF_-cQO4', '', '', 0, '2009-09-18', 1, 0, '', '', 18, NULL, 1),
(33, 3, 'Subliminal Cuts', 'Le Voie Le Soleil', 'e3CZ9O9noFA', '', '', 0, '2009-09-18', 0, 1, '', '', 623, NULL, 1),
(34, 3, 'Robyn', 'Handle Me (Soulseekerz Club Remix)', 'yMjKV2rBbVo', '', '', 0, '2009-09-18', 0, 1, '', '', 489, NULL, 1),
(35, 3, 'Booty Luv', 'Boogie 2Nite (Seamus Haji Mix Official edit)', 'j67M1QoBqrY', '', '', 0, '2009-09-18', 0, 1, '', '', 568, NULL, 1),
(38, 3, 'Liquid', 'Sweet Harmony (Mike Cosford  Liquid 95)', 'A3K-a6db_jc', '', '', 0, '2009-09-18', 0, 1, '', '', 701, NULL, 1),
(40, 3, 'Chris Lake', 'Changes', 'DkX7zJHAPsA', '', '', 0, '2009-09-18', 0, 1, '', '', 622, NULL, 1),
(41, 3, 'Chris lake', 'Carry me away ( Music Video )', 'ScRdE_6HbHA', '', '', 0, '2009-09-18', 0, 1, '', '', 700, NULL, 1),
(42, 3, 'Ronski Speed', 'Overfloat (Ronski Speed pres Sun Decade Mix)', 'G61mIAQyc3o', '', '', 0, '2009-09-18', 0, 1, '', '', 657, NULL, 1),
(45, 3, 'Frankie Wilde', 'Blue water', 'o6-wZ2cvoAc', '', '', 0, '2009-09-18', 0, 1, '', '', 680, NULL, 1),
(47, 3, 'Black Rock feat Debra Andrew', 'Bluewater', 'SRbq6JJU738', '', '', 0, '2009-09-18', 0, 1, '', '', 335, NULL, 1),
(49, 3, 'Hilary Duff', 'With Love Castillo Remix', 'sEhNmVRmv-4', '', '', 0, '2009-09-18', 0, 1, '', '', 545, NULL, 1),
(50, 3, 'Hilary Duff', 'Stranger Official Remix Video (HQ)', 'B6h20GyRFV4', '', '', 0, '2009-09-18', 0, 1, '', '', 746, NULL, 1),
(51, 3, 'Fragma', 'Deeper', 'qwPOldq12gA', '', '', 0, '2009-09-18', 0, 1, '', '', 689, NULL, 1),
(52, 3, 'Ever After', 'Bonnie Bailey (Eric''s Beach Mix)', 'rpb_5ZaFNrg', '', '', 0, '2009-09-18', 0, 1, '', '', 691, NULL, 1),
(57, 9, 'Maxi Priest', 'Close to you', '-G4zRwcmY9o', '', '', 0, '2009-09-18', 0, 1, '', '', 578, NULL, 1),
(58, 3, 'Undercover', 'Baker Street', 'Gq9XykJ-Po0', '', '', 0, '2009-09-18', 0, 1, '', '', 625, NULL, 1),
(60, 4, 'C+C Music Factory', 'Keep it comin', 'wQNSNSaY5x4', '', '', 1, '2009-09-18', 0, 1, '', '', 351, NULL, 1),
(61, 3, 'C & C Music Factory', 'Just A Touch Of Love (1991)', 'b2PbCRgk-SE', '', '', 0, '2009-09-18', 0, 1, '', '', 339, NULL, 1),
(62, 3, 'Was Not Was', 'Shake Your Head', 'ij_CY8IRP8k', '', '', 0, '2009-09-18', 0, 1, '', '', 552, NULL, 1),
(63, 3, 'Sash! feat Tina Cousins', 'Just Around The Hill (Dance remix)', '4JgUhDL21xI', '', '', 0, '2009-09-18', 1, 0, '', '', 53, NULL, 1),
(64, 3, 'Seal', 'Get It Together (Peter Rauhofer''s Classic Club Mix)', 'IUAzw7-qRR0', '', '', 0, '2009-09-18', 0, 1, '', '', 652, NULL, 1),
(66, 4, 'LL Cool J ', 'Doin'' It', 'VBs-I_QwgIU', '', '', 1, '2009-09-18', 0, 1, '', '', 335, NULL, 1),
(67, 4, 'LL Cool J', 'Hey Lover', 'BmaXc1cryMw', '', '', 0, '2009-09-18', 0, 1, '', '', 332, NULL, 1),
(68, 7, 'Brownstone', 'If you love me', '1bzEYg-CpQE', '', '', 1, '2009-09-18', 0, 1, '', '', 340, NULL, 1),
(69, 4, 'Salt''n''Pepa', 'Let''s Talk About Sex', 'BsqvuG0ZSbs', '', '', 1, '2009-09-18', 1, 0, '', '', 52, NULL, 1),
(70, 4, 'OPP', 'Naughty By Nature', 'qmuFlaFYdgE', '', '', 1, '2009-09-18', 1, 0, '', '', 255, NULL, 1),
(71, 3, 'Double Trouble & Rebel MC', 'Just Keep Rockin', '4pcS_wmFtdM', '', '', 0, '2009-09-18', 1, 0, '', '', 30, NULL, 1),
(72, 4, 'Coolio', 'Too Hot', 'mqp_DNGVK_A', '', '', 0, '2009-09-18', 0, 1, '', '', 456, NULL, 1),
(73, 4, 'Marky Mark and the Funky Bunch', 'Good Vibrations', 'tu9Mpkdkjck', '', '', 0, '2009-09-18', 0, 1, '', '', 577, NULL, 1),
(80, 3, 'Armand Van Helden', 'You don''t know me(1999)', 'yNSpLqmY6K0', '', '', 0, '2009-09-18', 1, 0, '', '', 251, NULL, 1),
(81, 3, 'Armand Van Helden', 'Funk Phenomena 2K', 'z7XO0bn-sZQ', '', '', 1, '2009-09-18', 1, 0, '', '', 31, NULL, 1),
(86, 3, 'Angelic', 'Can''t keep me silent', 'hqXhyBJSEAw', '', '', 0, '2009-09-19', 0, 1, '', '', 743, NULL, 1),
(87, 3, 'Cornell vs Lisa Marie Experience', 'Keep On Jumping', 'jn0trtD3yww', '', '', 0, '2009-09-19', 0, 1, '', '', 15, NULL, 1),
(90, 3, 'De Nuit ', 'All that mattered', 'wqekScVfupY', '', '', 0, '2009-09-19', 0, 1, '', '', 788, NULL, 1),
(91, 3, 'De Nuit', 'All That Mattered (East Sunshine Remix)', 'zsftD1PDZhU', '', '', 0, '2009-09-19', 0, 1, '', '', 1961, NULL, 1),
(92, 3, 'Lady Gaga', 'Poker Face (Div-A-Matic Edit)', 'kRexKZVVkZc', '', '', 0, '2009-09-19', 0, 1, '', '', 552, NULL, 1),
(93, 9, 'The Source Ft Candi Station', 'You got the love', 'LOnZMqZCF2Y', '', '', 0, '2009-09-19', 0, 1, '', '', 456, NULL, 1),
(95, 3, 'Spooky', 'Schmoo', 'rAFijBAqQBU', '', '', 0, '2009-09-19', 0, 1, '', '', 663, NULL, 1),
(96, 3, 'Empire Of The Sun', 'Walking On A Dream (Johan Baath Remix)', '32SFVcv_r-o', '', '', 0, '2009-09-19', 0, 1, '', '', 772, NULL, 1),
(97, 3, 'David Guetta feat. Kelly Rowland', 'When Love Takes Over', 'uTDafjfxu5c', '', '', 1, '2009-09-19', 0, 1, '', '', 825, NULL, 1),
(99, 3, 'Michael Jackson', 'Rock With You (Frankie Knuckles Remix)', 'WXatWr1JJ5c', '', '', 0, '2009-09-19', 0, 1, '', '', 564, NULL, 1),
(100, 3, 'Michael Jackson', 'Don''t Stop ''Til You Get Enough (Roger''s Underground Solution Mix)', 'fuQfgBIdDCw', '', '', 1, '2009-09-19', 0, 1, '', '', 781, NULL, 1),
(103, 3, 'Basic Element', 'To You', 'jaQ8HyA33O0', '', '', 0, '2009-09-19', 0, 1, '', '', 39, NULL, 1),
(104, 3, 'Guru Josh Project', 'Infinity 2008', 'w9KnuJZkBjg', '', '', 1, '2009-09-19', 0, 1, '', '', 48, NULL, 1),
(105, 4, 'Copycatz', 'Infinity Remix', '3wOna6-1z9A', '', '', 0, '2009-09-19', 0, 1, '', '', 345, NULL, 1),
(106, 9, 'Sweet Like Chocolate', 'Shanks & Bigfoot', 'DHFFol-8REI', '', '', 1, '2009-09-19', 0, 1, '', '', 458, NULL, 1),
(107, 3, 'Kristine Blonde', 'Love Shy [Electrique Boutique Remix]', 'OINt-HKX57k', '', '', 1, '2009-09-19', 0, 1, '', '', 889, NULL, 1),
(108, 3, 'Mousse T', 'Horny HQ', 'byVOZviaeLs', '', '', 0, '2009-09-19', 0, 1, '', '', 334, NULL, 1),
(109, 3, 'Anna Grace', 'Let The Feelings Go', 'nZKUmMNv2qw', '', '', 1, '2009-09-19', 0, 1, '', '', 783, NULL, 1),
(110, 3, 'Frankie Wilde', 'Rise Again', '5HfzXTyrAMM', '', '', 1, '2009-09-19', 0, 1, '', '', 437, NULL, 1),
(112, 9, 'Trentemoller', 'Miss You', '5DUCKGyojpE', '', '', 0, '2009-09-19', 0, 1, '', '', 341, NULL, 1),
(113, 3, 'Cut''n''move', 'Give It Up', 'hYDemDKgsX8', '', '', 1, '2009-09-19', 0, 1, '', '', 445, NULL, 1),
(114, 3, 'Bizarre Inc feat Angie Brown', 'I''m Gonna Get You (1992)', 'CqFNzRaOEvE', '', '', 0, '2009-09-19', 0, 1, '', '', 555, NULL, 1),
(115, 3, 'Crystal Waters', 'Gypsy Woman 1990', '1TqOlB3yO8Q', '', '', 0, '2009-09-19', 0, 1, '', '', 555, NULL, 1),
(116, 3, 'Crystal Waters', 'Makin Happy', 'PJAQ1Ogng_s', '', '', 0, '2009-09-19', 0, 1, '', '', 334, NULL, 1),
(118, 3, 'Xpansions', 'Move Your Body 1990', 'TYhUgq5XC0M', '', '', 0, '2009-09-19', 0, 1, '', '', 555, NULL, 1),
(119, 3, 'CeCe Peniston', 'We Got a Love Thang', '1XM2zEwcv5E', '', '', 1, '2009-09-19', 0, 1, '', '', 445, NULL, 1),
(120, 3, 'David Guetta ft. Kelly Rowland', 'When Love takes over (HQ)', 'YrzS2KNs8No', '', '', 1, '2009-09-19', 0, 1, '', '', 786, NULL, 1),
(121, 3, 'LONNIE GORDON', 'GONNA CATCH YOU (1991)', 'XbX3T-jgUQo', '', '', 1, '2009-09-19', 0, 1, '', '', 679, NULL, 1),
(122, 9, 'Unique II', 'Break My Stride', 'khmqDEz6TRk', '', '', 0, '2009-09-19', 1, 0, '', '', 40, NULL, 1),
(124, 3, 'Sven Vath', 'L''Esperanza', 'POk9Lp5rxNo', '', '', 0, '2009-09-19', 0, 1, '', '', 334, NULL, 1),
(125, 3, 'Djuma Soundsystem', 'Les Djinns', '1eEygIR4whE', '', '', 0, '2009-09-19', 0, 1, '', '', 40, NULL, 1),
(126, 3, 'ALPHABEAT', 'Fascination Remix ', 'EWWx-zvNCLo', '', '', 1, '2009-09-19', 0, 1, '', '', 447, NULL, 1),
(127, 3, 'Vanessa Hudgens', 'Say Ok Albert Castillo Remix', 'qPKL7mbOPik', '', '', 0, '2009-09-19', 0, 1, '', '', 436, NULL, 1),
(128, 3, 'Angel City', 'Do You Know ', 'kK1lHN2QlLQ', '', '', 0, '2009-09-19', 0, 1, '', '', 30, NULL, 1),
(130, 3, 'Mandy Vs Booka Shade', 'Body Language Original Mix', '6q9aQXK0DnM', '', '', 0, '2009-09-19', 0, 1, '', '', 446, NULL, 1),
(131, 3, 'Asle', 'Golden Sun (Haji & Emanuel edit)', '8pkBWFuDRuI', '', '', 1, '2009-09-19', 0, 1, '', '', 555, NULL, 1),
(132, 3, 'Booka Shade', 'Night Falls', 'vCGo7Ve8qdQ', '', '', 1, '2009-09-19', 0, 1, '', '', 559, '2011-08-31', 1),
(133, 3, 'Nomad', 'Devotion (1991)', 'x45BtoJpoks', '', '', 1, '2009-09-19', 0, 1, '', '', 446, '2011-08-31', 1),
(134, 3, 'SL2', 'On A Ragga Tip 1992', 'gXCN1DhHTZA', '', '', 1, '2009-09-19', 0, 1, '', '', 32, NULL, 1),
(135, 3, 'SL2', 'Way In My Brain (Remix) 1993', 'yDGQMwHjiO8', '', '', 1, '2009-09-19', 0, 1, '', '', 678, NULL, 1),
(136, 3, 'Shades Of Rhythm', 'Sweet Sensation', '3UxCOP22vus', '', '', 1, '2009-09-19', 0, 1, '', '', 335, NULL, 1),
(137, 3, 'Prodigy', 'Wind It Up', 'oJzGyBTEzfg', '', '', 1, '2009-09-19', 0, 1, '', '', 334, NULL, 1),
(139, 3, 'Awesome 3', 'Don''t Go', '-4HhUSQA_7s', '', '', 1, '2009-09-19', 0, 1, '', '', 334, NULL, 1),
(140, 10, 'Booka Shade', 'Night Falls', 'W3v50lQ0SSA', NULL, 'Booka Shade', 1, '2011-08-29', 0, 1, NULL, '127.0.0.1', 1, '2011-08-31', 1),
(1948, 16, 'Mizhenskiy', 'The Autumn Hall ', 'ui1hr-Qtnx8', NULL, 'The Autumn Hall ', 0, '2010-06-20', 1, 0, NULL, '85.180.20.5', 7, '2010-07-02', 1),
(1299, 15, 'La Roux', 'Bulletproof', 'NQdC7h609k8', NULL, 'La Roux', 0, '2010-03-27', 1, 0, NULL, '85.180.2.55', 10, '2010-07-01', 1),
(1058, 13, 'Ltj Bukem & Mc Conrad', 'Logical progression', 'X5clAkYEF5w', NULL, 'Ltj Bukem & Mc Conrad', 0, '2010-01-07', 1, 0, NULL, '85.180.17.120', 39, '2010-06-27', 1),
(1949, 10, 'Booka Shade', 'Mandarin Girl ', 'C_LCL13iww4', NULL, 'Booka Shade', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1950, 9, 'Booka Shade', 'Sweet Lies ', '22ezuwsMR6w', NULL, 'Booka Shade', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(655, 12, 'Play & Win ', 'Only (Official Video)', 'FBmUpHoXIvo', NULL, 'Play  Win  Only', 0, '2009-12-07', 1, 0, NULL, '85.180.15.105', 29, '2010-06-06', 1),
(383, 1, 'SILBERMOND ', 'ICH BEREUE NICHTS', 'ZLm_TQNehGQ', '', '', 0, '2009-11-14', 1, 0, '', '', 88, '2010-07-01', 1),
(378, 5, 'Thalia', 'Amor a la Mexicana-original dance mix (hq surround)', 'F6JfV0ljwqM', '', '', 0, '2009-11-14', 1, 0, '', '', 60, '2010-06-28', 1),
(278, 11, 'Activa pres. Solar Movement', 'Eclipse (Mat Zo Remix)', 'MTAHzfoKOcI', '', '', 1, '2009-11-14', 0, 1, '', '', 2192, '2010-06-29', 1),
(173, 6, 'Rick Astley', 'Take me to your heart', 'eqQRN5OWgBw', '', '', 0, '2009-09-19', 1, 0, '', '', 825, '2010-05-17', 1),
(1951, 10, 'Booka Shade', 'In White Rooms ', 't4HfbN75lFs', NULL, 'Booka Shade', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1952, 10, 'Booka Shade', 'In white rooms (mexico mix) ', 'Ox9ejlbg2SQ', NULL, 'Booka Shade', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1953, 3, 'Inner City', 'Big Fun (1988) ', 'omfiVkkJ1OU', NULL, 'Inner City', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1954, 3, 'The KLF', 'Last Train', 'MsCV64QDEV0', NULL, 'The KLF', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1955, 3, 'The KLF', '3 AM Eternal ', 'Fd8iKvzUD_4', NULL, 'The KLF', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1956, 3, 'The KLF', '3 a.m. Eternal ', 'R7EPqKDqrKo', NULL, 'The KLF', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1957, 3, '808 State', 'Pacific State ', '6jQ_bOP0HfY', NULL, '808 State', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1958, 3, 'M.A.R.S.', 'Pump Up The Volume ', 'eGPhUr-T6UM', NULL, 'M.A.R.S.', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1959, 3, 'Black Box', 'Everybody Everybody ', 'DLDSHbumd4k', NULL, 'Black Box', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1960, 3, 'Snap ', 'The power ', 'z33tH-JdPDg', NULL, 'Snap ', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1961, 3, 'Snap', 'Mary Had A Little Boy ', 'EMEWokWxbmQ', NULL, 'Snap', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1962, 3, 'Snap', 'Color of Love ', 'xltLLH7rdEU', NULL, 'Snap', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1963, 3, 'Bizarre Inc', 'Playing With Knives ', 'TLlvYaCZ8Vc', NULL, 'Bizarre Inc', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1964, 2, 'Enigma', 'Mea Culpa (World of Enigma) ', 'vy4remKJtoE', NULL, 'Enigma', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1965, 10, 'ROBIN S', 'Show Me Love ( Steve Wilde Remix 2010 )', 'CmWJrsYSRSM', NULL, 'ROBIN S', 0, '2011-08-31', 1, 0, NULL, '127.0.0.1', 0, NULL, 1),
(1966, 10, 'Swedish House Mafia ', 'Miami to Ibiza (Original Mix) ', 'Lod5JlsFXWA', NULL, 'Swedish House Mafia ', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1967, 10, 'Axwell & Dirty South ', 'Sweet Disposition (Jacks Remix) ', 'eJMXithBzjc', NULL, 'Axwell & Dirty South ', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1968, 10, 'Matt Caseli & Strobe feat. Baby D', 'Phantasy (Official Video HD) ', 'V0ivFWVBJrQ', NULL, 'Matt Caseli & Strobe feat. Baby D', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1969, 10, 'Judge Jules', 'So Special ', 'FPQrlC-a_Jw', NULL, 'Judge Jules', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 5, NULL, 1),
(1970, 10, 'Evren Furtuna', 'Punching Ground (Original Mix) ', 'SaRwQmvFWM8', NULL, 'Evren Furtuna', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1971, 10, 'Nadia Ali, Starkillers & Alex Kenji', 'Pressure (Alesso Remix)', 'cQPmBrskaX0', NULL, 'Nadia Ali, Starkillers & Alex Kenji', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1972, 10, 'Nadia Ali', 'Rapture (Avicii Remix)', 'GbVxvITmwIc', NULL, 'Nadia Ali', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1973, 10, 'Allure featuring JES', 'Show Me The Way', 'EK_QZj5meqA', NULL, 'Allure featuring JES', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1974, 10, 'Tim Berg', 'Bromance (The Love You Seek)', 'S7V_vOME9OQ', NULL, 'Tim Berg', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1975, 10, 'Tim Berg', 'Bromance (Aviciis Arena Mix) ', '_11S2tNHAP0', NULL, 'Tim Berg', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 0, NULL, 1),
(1976, 10, 'Suspect 44', 'Japanese Schoolgirls (Original Mix) ', 's8uyO_U9Fr0', NULL, 'Suspect 44', 1, '2011-08-31', 0, 1, NULL, '127.0.0.1', 1, NULL, 1);
