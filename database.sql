-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 09. Nov 2020 um 15:19
-- Server-Version: 10.1.47-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `dynamicbots`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bots`
--

CREATE TABLE `bots` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bot_name` varchar(255) NOT NULL,
  `node_id` varchar(255) NOT NULL,
  `state` enum('need_install','active','disabled','deleted') NOT NULL,
  `server_addr` varchar(255) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `server_password` varchar(255) DEFAULT NULL,
  `default_channel` int(11) DEFAULT NULL,
  `channel_password` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) NOT NULL,
  `badges` varchar(255) DEFAULT NULL,
  `bot_id` int(11) DEFAULT NULL,
  `last_stream` longtext,
  `tag_id` int(11) DEFAULT NULL,
  `auto_repeat` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bot_nodes`
--

CREATE TABLE `bot_nodes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `node_ip` varchar(255) NOT NULL,
  `node_port` int(11) NOT NULL,
  `node_user` varchar(255) NOT NULL,
  `node_password` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `state` enum('active','disabled') NOT NULL,
  `path` text,
  `cfg` longtext,
  `user_id` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faq`
--

CREATE TABLE `faq` (
  `1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `NewsID` int(244) NOT NULL,
  `NewsTitle` varchar(255) NOT NULL,
  `NewsNew` varchar(255) NOT NULL,
  `NewsAuthor` varchar(255) NOT NULL,
  `NewsDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_info` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

CREATE TABLE `settings` (
  `login` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `default_max_botlimit` int(11) NOT NULL,
  `choose_hostsystem` int(11) NOT NULL,
  `recaptcha_score_check` int(11) NOT NULL DEFAULT '0',
  `user_ip_check` int(11) NOT NULL DEFAULT '1',
  `user_agent_check` int(11) NOT NULL DEFAULT '0',
  `email_server` int(11) NOT NULL DEFAULT '0',
  `email_account_confirm` int(11) NOT NULL DEFAULT '0',
  `email_ticket_response` int(11) NOT NULL DEFAULT '0',
  `pushover_team_key` varchar(255) DEFAULT NULL,
  `pushover_application_key` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `slot_price` decimal(12,2) NOT NULL DEFAULT '10.00',
  `paypal_mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stream_links`
--

CREATE TABLE `stream_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `department` enum('general','tech','account') NOT NULL,
  `state` enum('open','closed') NOT NULL,
  `priority` enum('low','mid','high') NOT NULL,
  `last_response` enum('customer','support') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `state` enum('active','pending','banned') NOT NULL,
  `role` enum('customer','firstlevel','secondlevel','admin') NOT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `bot_limit` int(11) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_addr` varchar(255) DEFAULT NULL,
  `desc` text,
  `verify_code` varchar(255) DEFAULT NULL,
  `support_pin` varchar(11) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `bot_slots` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bots`
--
ALTER TABLE `bots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bot_nodes`
--
ALTER TABLE `bot_nodes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`NewsID`);

--
-- Indizes für die Tabelle `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`login`);

--
-- Indizes für die Tabelle `stream_links`
--
ALTER TABLE `stream_links`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bots`
--
ALTER TABLE `bots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bot_nodes`
--
ALTER TABLE `bot_nodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `NewsID` int(244) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `stream_links`
--
ALTER TABLE `stream_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
