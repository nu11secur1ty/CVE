-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 11:26 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsup`
--

-- --------------------------------------------------------

--
-- Table structure for table `tagencies`
--

CREATE TABLE `tagencies` (
  `id` int(5) NOT NULL,
  `name` varchar(250) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `ldap_guid` varchar(50) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagencies`
--

INSERT INTO `tagencies` (`id`, `name`, `mail`, `ldap_guid`, `disable`) VALUES
(0, 'Aucune', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tassets`
--

CREATE TABLE `tassets` (
  `id` int(15) NOT NULL,
  `sn_internal` varchar(20) NOT NULL,
  `sn_manufacturer` varchar(40) NOT NULL,
  `sn_indent` varchar(40) NOT NULL,
  `netbios` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  `type` int(5) NOT NULL,
  `manufacturer` int(5) NOT NULL,
  `model` int(5) NOT NULL,
  `user` int(5) NOT NULL,
  `state` int(5) NOT NULL,
  `department` int(5) NOT NULL,
  `date_install` date NOT NULL,
  `date_stock` date NOT NULL,
  `date_standbye` date NOT NULL,
  `date_recycle` date NOT NULL,
  `date_end_warranty` date NOT NULL,
  `date_last_ping` date NOT NULL,
  `location` int(5) NOT NULL,
  `socket` varchar(50) NOT NULL,
  `technician` int(5) NOT NULL,
  `maintenance` int(10) NOT NULL,
  `virtualization` int(1) NOT NULL,
  `net_scan` int(1) NOT NULL DEFAULT '1',
  `discover_net_scan` int(1) NOT NULL,
  `discover_import_csv` int(1) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets`
--

INSERT INTO `tassets` (`id`, `sn_internal`, `sn_manufacturer`, `sn_indent`, `netbios`, `description`, `type`, `manufacturer`, `model`, `user`, `state`, `department`, `date_install`, `date_stock`, `date_standbye`, `date_recycle`, `date_end_warranty`, `date_last_ping`, `location`, `socket`, `technician`, `maintenance`, `virtualization`, `net_scan`, `discover_net_scan`, `discover_import_csv`, `disable`) VALUES
(0, '', '', '', 'Aucun', '', 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tassets_iface`
--

CREATE TABLE `tassets_iface` (
  `id` int(10) NOT NULL,
  `role_id` int(5) NOT NULL,
  `asset_id` int(10) NOT NULL,
  `netbios` varchar(200) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `mac` varchar(20) NOT NULL,
  `date_ping_ok` datetime NOT NULL,
  `date_ping_ko` datetime NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tassets_iface_role`
--

CREATE TABLE `tassets_iface_role` (
  `id` int(4) NOT NULL,
  `name` varchar(250) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_iface_role`
--

INSERT INTO `tassets_iface_role` (`id`, `name`, `disable`) VALUES
(1, 'LAN', 0),
(2, 'WIFI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tassets_location`
--

CREATE TABLE `tassets_location` (
  `id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_location`
--

INSERT INTO `tassets_location` (`id`, `name`, `disable`) VALUES
(0, 'Aucune', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tassets_manufacturer`
--

CREATE TABLE `tassets_manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_manufacturer`
--

INSERT INTO `tassets_manufacturer` (`id`, `name`) VALUES
(1, 'Dell');

-- --------------------------------------------------------

--
-- Table structure for table `tassets_model`
--

CREATE TABLE `tassets_model` (
  `id` int(5) NOT NULL,
  `type` int(5) NOT NULL,
  `manufacturer` int(5) NOT NULL,
  `image` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ip` int(1) NOT NULL,
  `wifi` int(1) NOT NULL,
  `warranty` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_model`
--

INSERT INTO `tassets_model` (`id`, `type`, `manufacturer`, `image`, `name`, `ip`, `wifi`, `warranty`) VALUES
(1, 1, 1, '3020.jpg', 'Optiplex 3020', 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tassets_network`
--

CREATE TABLE `tassets_network` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `network` varchar(45) NOT NULL,
  `netmask` varchar(45) NOT NULL,
  `scan` int(1) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tassets_state`
--

CREATE TABLE `tassets_state` (
  `id` int(5) NOT NULL,
  `order` int(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `block_ip_search` int(1) NOT NULL,
  `disable` int(1) NOT NULL,
  `display` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_state`
--

INSERT INTO `tassets_state` (`id`, `order`, `name`, `description`, `block_ip_search`, `disable`, `display`) VALUES
(1, 1, 'Stock', 'Équipement en stock', 0, 0, 'badge text-75 border-l-3 brc-black-tp8 bgc-info text-white'),
(2, 2, 'Installé', 'Équipement installé en production', 1, 0, 'badge text-75 border-l-3 brc-black-tp8 bgc-success text-white'),
(3, 3, 'Standbye', 'Équipement de coté', 0, 0, 'badge text-75 border-l-3 brc-black-tp8 bgc-warning text-white'),
(4, 4, 'Recyclé', 'Équipement recyclé, jeté', 0, 0, 'badge text-75 border-l-3 brc-black-tp8 bgc-dark text-white');

-- --------------------------------------------------------

--
-- Table structure for table `tassets_thread`
--

CREATE TABLE `tassets_thread` (
  `id` int(10) NOT NULL,
  `asset` int(10) NOT NULL,
  `text` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tassets_type`
--

CREATE TABLE `tassets_type` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `virtualization` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tassets_type`
--

INSERT INTO `tassets_type` (`id`, `name`, `virtualization`) VALUES
(1, 'PC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tattachments`
--

CREATE TABLE `tattachments` (
  `id` int(10) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `procedure_id` int(10) NOT NULL,
  `asset_id` int(10) NOT NULL,
  `storage_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tavailability`
--

CREATE TABLE `tavailability` (
  `id` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `subcat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tavailability_dep`
--

CREATE TABLE `tavailability_dep` (
  `id` int(3) NOT NULL,
  `category` int(5) NOT NULL,
  `subcat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tavailability_target`
--

CREATE TABLE `tavailability_target` (
  `id` int(5) NOT NULL,
  `subcat` int(5) NOT NULL,
  `target` float NOT NULL,
  `year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tcategory`
--

CREATE TABLE `tcategory` (
  `id` int(11) NOT NULL,
  `number` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `service` int(5) NOT NULL,
  `technician` int(10) NOT NULL,
  `technician_group` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcategory`
--

INSERT INTO `tcategory` (`id`, `number`, `name`, `service`, `technician`, `technician_group`) VALUES
(0, 0, 'Aucune', 0, 0, 0),
(1, 0, 'Application', 0, 0, 0),
(2, 0, 'Materiel', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcompany`
--

CREATE TABLE `tcompany` (
  `id` int(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(100) NOT NULL,
  `SIRET` varchar(20) NOT NULL,
  `TVA` varchar(20) NOT NULL,
  `limit_ticket_number` int(5) NOT NULL DEFAULT '0',
  `limit_ticket_days` int(5) NOT NULL,
  `limit_ticket_date_start` date NOT NULL,
  `limit_hour_number` int(5) NOT NULL,
  `limit_hour_days` int(5) NOT NULL,
  `limit_hour_date_start` date NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcompany`
--

INSERT INTO `tcompany` (`id`, `name`, `address`, `zip`, `city`, `country`, `SIRET`, `TVA`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `limit_hour_number`, `limit_hour_days`, `limit_hour_date_start`, `disable`) VALUES
(0, 'Aucune', '', '', '', '', '', '', 0, 0, '0000-00-00', 0, 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcriticality`
--

CREATE TABLE `tcriticality` (
  `id` int(2) NOT NULL,
  `number` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `service` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcriticality`
--

INSERT INTO `tcriticality` (`id`, `number`, `name`, `color`, `service`) VALUES
(0, 0, 'Aucune', '#B0B0B0', 0),
(1, 0, 'Critique', '#d15b47', 0),
(2, 1, 'Grave', '#f89406', 0),
(3, 2, 'Moyenne', '#f8c806', 0),
(4, 3, 'Basse', '#82af6f', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tevents`
--

CREATE TABLE `tevents` (
  `id` int(10) NOT NULL,
  `technician` int(10) NOT NULL,
  `incident` int(10) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `allday` varchar(10) NOT NULL,
  `type` int(1) NOT NULL,
  `title` varchar(150) NOT NULL,
  `classname` varchar(50) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tgroups`
--

CREATE TABLE `tgroups` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(1) NOT NULL,
  `service` int(5) NOT NULL,
  `disable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgroups`
--

INSERT INTO `tgroups` (`id`, `name`, `type`, `service`, `disable`) VALUES
(0, 'Aucun', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tgroups_assoc`
--

CREATE TABLE `tgroups_assoc` (
  `id` int(10) NOT NULL,
  `group` int(5) NOT NULL,
  `user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tincidents`
--

CREATE TABLE `tincidents` (
  `id` int(10) NOT NULL,
  `type` int(3) NOT NULL DEFAULT '0',
  `type_answer` int(10) NOT NULL,
  `technician` int(10) NOT NULL,
  `t_group` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `user` int(10) NOT NULL,
  `u_group` int(5) NOT NULL,
  `u_service` int(5) NOT NULL,
  `u_agency` int(5) NOT NULL,
  `sender_service` int(5) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_hope` date NOT NULL,
  `date_res` datetime NOT NULL,
  `date_modif` datetime NOT NULL,
  `state` int(1) NOT NULL,
  `user_validation` int(1) NOT NULL,
  `user_validation_date` date NOT NULL,
  `priority` int(2) NOT NULL,
  `criticality` int(2) NOT NULL,
  `img1` varchar(500) NOT NULL,
  `img2` varchar(500) NOT NULL,
  `img3` varchar(500) NOT NULL,
  `img4` varchar(500) NOT NULL,
  `img5` varchar(500) NOT NULL,
  `time` int(10) NOT NULL,
  `time_hope` int(10) NOT NULL,
  `creator` int(3) NOT NULL,
  `category` int(3) NOT NULL,
  `subcat` int(3) NOT NULL,
  `techread` int(1) NOT NULL DEFAULT '1',
  `techread_date` datetime NOT NULL,
  `userread` int(1) NOT NULL DEFAULT '1',
  `template` int(1) NOT NULL,
  `disable` int(1) NOT NULL,
  `notify` int(1) NOT NULL,
  `place` int(5) NOT NULL,
  `asset_id` int(8) NOT NULL,
  `start_availability` datetime NOT NULL,
  `end_availability` datetime NOT NULL,
  `availability_planned` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tlogs`
--

CREATE TABLE `tlogs` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `message` varchar(1024) NOT NULL,
  `user` int(10) NOT NULL,
  `ip` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmails`
--

CREATE TABLE `tmails` (
  `id` int(10) NOT NULL,
  `incident` int(10) NOT NULL,
  `open` int(1) NOT NULL,
  `close` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tparameters`
--

CREATE TABLE `tparameters` (
  `id` int(1) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `server_url` varchar(200) DEFAULT NULL,
  `server_private_key` varchar(40) NOT NULL,
  `server_timezone` varchar(100) NOT NULL,
  `server_language` varchar(10) NOT NULL,
  `restrict_ip` varchar(255) NOT NULL,
  `log` int(1) NOT NULL,
  `version` varchar(10) NOT NULL,
  `system_error` int(1) NOT NULL,
  `update_menu` int(1) NOT NULL DEFAULT '1',
  `update_channel` varchar(10) NOT NULL,
  `timeout` int(5) NOT NULL,
  `cron_daily` date NOT NULL,
  `cron_monthly` int(2) NOT NULL,
  `maxline` int(4) NOT NULL,
  `mail` int(1) NOT NULL,
  `mail_smtp` varchar(100) DEFAULT NULL,
  `mail_smtp_class` varchar(15) NOT NULL DEFAULT 'isSMTP()',
  `mail_port` int(4) NOT NULL,
  `mail_ssl_check` int(1) NOT NULL,
  `mail_auth` varchar(10) DEFAULT NULL,
  `mail_secure` varchar(10) DEFAULT NULL,
  `mail_username` varchar(150) DEFAULT NULL,
  `mail_password` varchar(150) DEFAULT NULL,
  `mail_txt` varchar(300) NOT NULL,
  `mail_txt_end` varchar(500) NOT NULL,
  `mail_cc` varchar(150) NOT NULL,
  `mail_cci` int(1) NOT NULL,
  `mail_from_name` varchar(60) NOT NULL,
  `mail_from_adr` varchar(200) NOT NULL,
  `mail_auto` int(1) NOT NULL,
  `mail_auto_user_modify` int(1) NOT NULL DEFAULT '0',
  `mail_auto_user_newticket` int(1) NOT NULL,
  `mail_auto_tech_modify` int(1) NOT NULL DEFAULT '0',
  `mail_auto_tech_attribution` int(1) NOT NULL,
  `mail_newticket` int(1) NOT NULL,
  `mail_newticket_address` varchar(200) NOT NULL,
  `mail_template` varchar(50) NOT NULL,
  `mail_color_title` varchar(6) NOT NULL,
  `mail_color_bg` varchar(6) NOT NULL,
  `mail_color_text` varchar(6) NOT NULL,
  `mail_link` int(1) NOT NULL,
  `mail_link_redirect_url` varchar(200) NOT NULL,
  `mail_order` int(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `user_advanced` int(1) NOT NULL,
  `user_register` int(1) NOT NULL,
  `user_limit_ticket` int(1) NOT NULL DEFAULT '0',
  `user_company_view` int(1) DEFAULT '0',
  `user_agency` int(1) NOT NULL,
  `user_limit_service` int(1) NOT NULL,
  `user_disable_attempt` int(1) NOT NULL,
  `user_disable_attempt_number` int(2) NOT NULL,
  `user_password_policy` int(1) NOT NULL,
  `user_password_policy_min_lenght` int(2) NOT NULL,
  `user_password_policy_special_char` int(1) NOT NULL,
  `user_password_policy_min_maj` int(1) NOT NULL,
  `user_password_policy_expiration` int(1) NOT NULL,
  `user_forgot_pwd` int(1) NOT NULL,
  `time_display_msg` int(5) NOT NULL,
  `auto_refresh` int(5) NOT NULL,
  `login_state` varchar(10) NOT NULL,
  `default_skin` varchar(10) NOT NULL,
  `notify` int(1) NOT NULL,
  `ldap` int(1) NOT NULL,
  `ldap_auth` int(1) NOT NULL,
  `ldap_sso` int(1) NOT NULL,
  `ldap_type` int(1) NOT NULL,
  `ldap_service` int(1) NOT NULL,
  `ldap_service_url` varchar(500) NOT NULL,
  `ldap_agency` int(1) NOT NULL,
  `ldap_agency_url` varchar(500) NOT NULL,
  `ldap_server` varchar(100) NOT NULL,
  `ldap_port` int(5) NOT NULL,
  `ldap_domain` varchar(200) NOT NULL,
  `ldap_url` varchar(2000) NOT NULL,
  `ldap_login_field` varchar(20) NOT NULL,
  `ldap_user` varchar(100) NOT NULL,
  `ldap_password` varchar(150) NOT NULL,
  `ldap_disable_user` int(1) NOT NULL,
  `planning` int(1) NOT NULL,
  `debug` int(1) NOT NULL,
  `imap` int(1) NOT NULL,
  `imap_server` varchar(50) NOT NULL,
  `imap_port` varchar(50) NOT NULL,
  `imap_ssl_check` int(1) NOT NULL,
  `imap_user` varchar(50) NOT NULL,
  `imap_password` varchar(150) NOT NULL,
  `imap_reply` int(1) NOT NULL,
  `imap_inbox` varchar(20) NOT NULL,
  `imap_blacklist` varchar(1000) NOT NULL,
  `imap_post_treatment` varchar(100) NOT NULL,
  `imap_post_treatment_folder` varchar(100) NOT NULL,
  `imap_mailbox_service` int(1) NOT NULL,
  `api` int(1) NOT NULL,
  `api_client_ip` varchar(512) NOT NULL,
  `api_key` varchar(128) NOT NULL,
  `order` varchar(100) NOT NULL,
  `procedure` int(1) NOT NULL,
  `survey` int(1) NOT NULL,
  `survey_mail_text` varchar(500) NOT NULL,
  `survey_ticket_state` int(2) NOT NULL,
  `survey_auto_close_ticket` int(1) NOT NULL,
  `project` int(1) NOT NULL,
  `ticket_places` int(1) NOT NULL,
  `ticket_type` int(1) NOT NULL,
  `ticket_default_state` int(1) NOT NULL,
  `ticket_autoclose` int(1) NOT NULL,
  `ticket_autoclose_delay` int(3) NOT NULL,
  `ticket_autoclose_state` int(1) NOT NULL,
  `user_validation` int(1) NOT NULL,
  `user_validation_delay` int(3) NOT NULL,
  `user_validation_perimeter` varchar(10) NOT NULL,
  `ticket_cat_auto_attribute` int(1) NOT NULL,
  `availability` int(1) NOT NULL,
  `availability_all_cat` int(1) NOT NULL,
  `availability_dep` int(1) NOT NULL,
  `availability_condition_type` varchar(20) NOT NULL,
  `availability_condition_value` int(4) NOT NULL,
  `asset` int(1) NOT NULL,
  `asset_ip` int(1) NOT NULL,
  `asset_warranty` int(1) NOT NULL,
  `asset_vnc_link` int(1) NOT NULL,
  `meta_state` int(1) NOT NULL,
  `company_limit_ticket` int(1) NOT NULL DEFAULT '0',
  `company_limit_hour` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tparameters`
--

INSERT INTO `tparameters` (`id`, `company`, `server_url`, `server_private_key`, `server_timezone`, `server_language`, `restrict_ip`, `log`, `version`, `system_error`, `update_menu`, `update_channel`, `timeout`, `cron_daily`, `cron_monthly`, `maxline`, `mail`, `mail_smtp`, `mail_smtp_class`, `mail_port`, `mail_ssl_check`, `mail_auth`, `mail_secure`, `mail_username`, `mail_password`, `mail_txt`, `mail_txt_end`, `mail_cc`, `mail_cci`, `mail_from_name`, `mail_from_adr`, `mail_auto`, `mail_auto_user_modify`, `mail_auto_user_newticket`, `mail_auto_tech_modify`, `mail_auto_tech_attribution`, `mail_newticket`, `mail_newticket_address`, `mail_template`, `mail_color_title`, `mail_color_bg`, `mail_color_text`, `mail_link`, `mail_link_redirect_url`, `mail_order`, `logo`, `user_advanced`, `user_register`, `user_limit_ticket`, `user_company_view`, `user_agency`, `user_limit_service`, `user_disable_attempt`, `user_disable_attempt_number`, `user_password_policy`, `user_password_policy_min_lenght`, `user_password_policy_special_char`, `user_password_policy_min_maj`, `user_password_policy_expiration`, `user_forgot_pwd`, `time_display_msg`, `auto_refresh`, `login_state`, `default_skin`, `notify`, `ldap`, `ldap_auth`, `ldap_sso`, `ldap_type`, `ldap_service`, `ldap_service_url`, `ldap_agency`, `ldap_agency_url`, `ldap_server`, `ldap_port`, `ldap_domain`, `ldap_url`, `ldap_login_field`, `ldap_user`, `ldap_password`, `ldap_disable_user`, `planning`, `debug`, `imap`, `imap_server`, `imap_port`, `imap_ssl_check`, `imap_user`, `imap_password`, `imap_reply`, `imap_inbox`, `imap_blacklist`, `imap_post_treatment`, `imap_post_treatment_folder`, `imap_mailbox_service`, `api`, `api_client_ip`, `api_key`, `order`, `procedure`, `survey`, `survey_mail_text`, `survey_ticket_state`, `survey_auto_close_ticket`, `project`, `ticket_places`, `ticket_type`, `ticket_default_state`, `ticket_autoclose`, `ticket_autoclose_delay`, `ticket_autoclose_state`, `user_validation`, `user_validation_delay`, `user_validation_perimeter`, `ticket_cat_auto_attribute`, `availability`, `availability_all_cat`, `availability_dep`, `availability_condition_type`, `availability_condition_value`, `asset`, `asset_ip`, `asset_warranty`, `asset_vnc_link`, `meta_state`, `company_limit_ticket`, `company_limit_hour`) VALUES
(1, 'Societe', 'http://gestsup', '8b0e66c56dbe165ca7073bf183c655f9', '', 'fr_FR', '', 0, '3.2.10', 0, 1, 'stable', 24, '2020-12-19', 3, 14, 1, '', 'isSMTP()', 25, 1, '0', '0', '', '', 'Bonjour, <br />Vous avez fait la demande suivante auprès du support:', '', 'support@exemple.fr', 0, 'Support exemple', '', 0, 0, 0, 0, 0, 0, 'admin@exemple.fr', 'default.htm', '3b91d1', 'f5f5f5', '3b91d1', 1, '', 0, 'logo.png', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 250, 0, '1', '', 0, 0, 0, 0, 0, 0, '', 0, '', 'localhost', 389, 'exemple.fr', 'cn=users', 'SamAcountName', '', '', 1, 1, 0, 0, '', '', 0, '', '', 1, 'INBOX', '', '', '', 0, 0, '', '', 'tstates.number, tincidents.priority, tincidents.criticality, tincidents.date_create', 0, 0, 'Dans le cadre de l’amélioration de notre support merci de répondre au sondage suivant:', 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 0, 0, 1, 0, 'criticality', 0, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tparameters_imap_multi_mailbox`
--

CREATE TABLE `tparameters_imap_multi_mailbox` (
  `id` int(5) NOT NULL,
  `mail` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `service_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tparameters_user_validation_exclusion`
--

CREATE TABLE `tparameters_user_validation_exclusion` (
  `id` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `subcat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tplaces`
--

CREATE TABLE `tplaces` (
  `id` int(5) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tplaces`
--

INSERT INTO `tplaces` (`id`, `name`) VALUES
(0, 'Aucun');

-- --------------------------------------------------------

--
-- Table structure for table `tplugins`
--

CREATE TABLE `tplugins` (
  `id` int(5) NOT NULL,
  `name` varchar(128) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(254) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `version` varchar(10) NOT NULL,
  `enable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tplugins`
--

INSERT INTO `tplugins` (`id`, `name`, `label`, `description`, `icon`, `version`, `enable`) VALUES
(1, 'availability', 'Disponibilité', 'Active le suivi des catégories afin de produire des statistiques de disponibilité', 'clock', '1.1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tpriority`
--

CREATE TABLE `tpriority` (
  `id` int(2) NOT NULL,
  `number` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(15) NOT NULL,
  `service` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpriority`
--

INSERT INTO `tpriority` (`id`, `number`, `name`, `color`, `service`) VALUES
(0, 0, 'Aucune', '#B0B0B0', 0),
(1, 0, 'Urgent', '#d15b47', 0),
(2, 1, 'Très haute', '#f89406', 0),
(3, 2, 'Haute', '#f8c806', 0),
(4, 3, 'Moyenne', '#e7ef20', 0),
(5, 4, 'Basse', '#c2c921', 0),
(6, 5, 'Très basse', '#82af6f', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tprocedures`
--

CREATE TABLE `tprocedures` (
  `id` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `subcat` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `text` mediumtext NOT NULL,
  `file1` varchar(30) NOT NULL,
  `company_id` int(5) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tprofiles`
--

CREATE TABLE `tprofiles` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(10) NOT NULL,
  `img` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tprofiles`
--

INSERT INTO `tprofiles` (`id`, `name`, `level`, `img`) VALUES
(1, 'technicien', 0, 'technician.png'),
(2, 'utilisateur avec pouvoir', 1, 'poweruser.png'),
(3, 'utilisateur', 2, 'user.png'),
(4, 'superviseur', 3, 'supervisor.png'),
(5, 'administrateur', 4, 'admin.png');

-- --------------------------------------------------------

--
-- Table structure for table `tprojects`
--

CREATE TABLE `tprojects` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tprojects_task`
--

CREATE TABLE `tprojects_task` (
  `id` int(5) NOT NULL,
  `number` int(3) NOT NULL,
  `project_id` int(5) NOT NULL,
  `ticket_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trights`
--

CREATE TABLE `trights` (
  `id` int(5) NOT NULL,
  `profile` int(5) NOT NULL,
  `search` int(1) NOT NULL COMMENT 'Affiche le champ de recherche',
  `task_checkbox` int(1) NOT NULL COMMENT 'Autorise les actions sur la sélection de plusieurs lignes dans la liste des tickets et des équipements',
  `procedure` int(1) NOT NULL COMMENT 'Affiche le menu procédure',
  `procedure_add` int(1) NOT NULL COMMENT 'Droit d''ajouter des procédures',
  `procedure_delete` int(1) NOT NULL COMMENT 'Droit de supprimer des procédures',
  `procedure_modify` int(1) NOT NULL COMMENT 'Modification des procédures',
  `procedure_company` int(1) NOT NULL COMMENT 'Affiche le champ société sur une procédure',
  `procedure_list_company_only` int(1) NOT NULL COMMENT 'Affiche uniquement les procédures de la société rattachée à l''utilisateur',
  `stat` int(1) NOT NULL COMMENT 'Affiche le menu Statistiques',
  `planning` int(1) NOT NULL COMMENT 'Affiche le menu Planning',
  `project` int(1) NOT NULL COMMENT 'Affiche le menu projet',
  `availability` int(1) NOT NULL COMMENT 'Affiche le menu Disponibilité',
  `asset` int(1) NOT NULL COMMENT 'Affiche le menu équipement',
  `asset_net_scan` int(1) NOT NULL COMMENT 'Affiche le bouton de désactivation du scan réseau pour cet équipement',
  `asset_delete` int(1) NOT NULL COMMENT 'Droit de suppression des équipements',
  `asset_virtualization_disp` int(1) NOT NULL COMMENT 'Affiche le champ équipement virtuel',
  `asset_location_disp` int(1) NOT NULL COMMENT 'Affiche le champ localisation sur un équipement',
  `asset_list_department_only` int(1) NOT NULL COMMENT 'Affiche uniquement les équipements du service auquel est rattaché l''utilisateur',
  `asset_list_company_only` int(1) NOT NULL COMMENT 'Affiche uniquement les équipements de la société rattachée à l''utilisateur',
  `asset_list_view_only` int(1) NOT NULL COMMENT 'Affiche uniquement la liste des équipements, sans droit d''éditer une fiche',
  `asset_list_col_location` int(1) NOT NULL COMMENT 'Affiche la colonne localisation dans la liste des tickets',
  `admin` int(1) NOT NULL COMMENT 'Affiche le menu Administration',
  `admin_groups` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Groupes uniquement',
  `admin_lists` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes uniquement',
  `admin_lists_category` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes > Catégories',
  `admin_lists_subcat` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes > Sous-catégories',
  `admin_lists_criticality` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes > Criticités',
  `admin_lists_priority` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes > Priorité',
  `admin_lists_type` int(1) NOT NULL COMMENT 'Affiche le menu Administration > Listes > Types des tickets',
  `admin_user_profile` int(1) NOT NULL COMMENT 'Droit de modification de profil des utilisateurs',
  `admin_user_view` int(1) NOT NULL COMMENT 'Droit de modification des vues des utilisateurs',
  `admin_backup` int(1) NOT NULL COMMENT 'Affiche menu sauvegarde',
  `dashboard_service_only` int(1) NOT NULL COMMENT 'Affiche uniquement les tickets du ou des services auquel est rattaché l''utilisateur',
  `dashboard_agency_only` int(1) NOT NULL COMMENT 'Affiche uniquement les tickets des agences auxquelles est rattaché l''utilisateur',
  `dashboard_firstname` int(1) NOT NULL COMMENT 'Affiche le prénom dans la colonne demandeur et technicien dans la liste des tickets',
  `dashboard_col_user_service` int(1) NOT NULL COMMENT 'Affiche la colonne service du demandeur dans la liste des tickets',
  `dashboard_col_service` int(1) NOT NULL COMMENT 'Affiche la colonne service dans la liste des tickets',
  `dashboard_col_agency` int(1) NOT NULL COMMENT 'Affiche la colonne agence dans la liste des tickets',
  `dashboard_col_company` int(1) NOT NULL COMMENT 'Affiche la colonne société dans la liste des tickets',
  `dashboard_col_type` int(1) NOT NULL COMMENT 'Affiche la colonne type dans la liste des tickets',
  `dashboard_col_category` int(1) NOT NULL COMMENT 'Affiche la colonne catégorie dans la liste des tickets',
  `dashboard_col_subcat` int(1) NOT NULL COMMENT 'Affiche la colonne sous-catégorie dans la liste des tickets',
  `dashboard_col_asset` int(1) NOT NULL COMMENT 'Affiche la colonne équipement dans la liste des tickets',
  `dashboard_col_criticality` int(1) NOT NULL COMMENT 'Affiche la colonne criticité dans la liste des tickets',
  `dashboard_col_priority` int(1) NOT NULL COMMENT 'Affiche la colonne priorité dans la liste des tickets',
  `dashboard_col_date_create` int(1) NOT NULL COMMENT 'Affiche la colonne date de création dans la liste des tickets',
  `dashboard_col_date_create_hour` int(1) NOT NULL COMMENT 'Affiche l''heure de création du ticket dans la colonne date de création, sur la liste des tickets',
  `dashboard_col_date_hope` int(1) NOT NULL COMMENT 'Affiche la colonne date de résolution estimée dans la liste des tickets',
  `dashboard_col_date_res` int(1) NOT NULL COMMENT 'Affiche la colonne date de résolution dans la liste des tickets',
  `dashboard_col_time` int(1) NOT NULL COMMENT 'Affiche la colonne temps passé dans la liste des tickets',
  `userbar` int(1) NOT NULL COMMENT 'Affiche les propriétés étendue de la barre utilisateur',
  `side` int(1) NOT NULL COMMENT 'Affiche la colonne de gauche',
  `side_open_ticket` int(1) NOT NULL COMMENT 'Affiche le bouton Ouvrir un nouveau ticket',
  `side_asset_create` int(1) NOT NULL COMMENT 'Affiche le bouton ajouter équipement',
  `side_asset_all_state` int(11) NOT NULL COMMENT 'Affiche tous les états des équipements dans le menu de gauche',
  `side_your` int(1) NOT NULL COMMENT 'Affiche la section vos tickets',
  `side_your_not_read` int(1) NOT NULL COMMENT 'Affiche vos tickets non lus',
  `side_your_not_attribute` int(1) NOT NULL COMMENT 'Affiche les tickets non attribués',
  `side_your_meta` int(1) NOT NULL COMMENT 'Affiche le meta état à traiter personnel',
  `side_your_tech_group` int(1) NOT NULL COMMENT 'Affiche les tickets associés à un groupe de technicien dans lequel vous êtes présent',
  `side_all` int(1) NOT NULL COMMENT 'Affiche la section tous les tickets',
  `side_all_wait` int(1) NOT NULL COMMENT 'Affiche la vue nouveaux tickets dans tous les tickets',
  `side_all_meta` int(1) NOT NULL COMMENT 'Affiche le meta état à traiter pour tous les techniciens',
  `side_all_service_disp` int(1) NOT NULL COMMENT 'Affiche tous les tickets associés aux services de l''utilisateur connecté',
  `side_all_service_edit` int(1) NOT NULL COMMENT 'Permet de modifier tous les tickets associés aux services de l''utilisateur connecté',
  `side_all_agency_disp` int(1) NOT NULL COMMENT 'Affiche tous les tickets associés aux agences de l''utilisateur connecté',
  `side_all_agency_edit` int(1) NOT NULL COMMENT 'Permet de modifier tous les tickets associés aux agences de l''utilisateur connecté',
  `side_company` int(1) NOT NULL DEFAULT '0' COMMENT 'Affiche la section tous les tickets de ma société',
  `side_view` int(1) NOT NULL COMMENT 'Affiche les vues personnelles',
  `ticket_next` int(1) NOT NULL COMMENT 'Affiche les flèches ticket suivant et précédent',
  `ticket_print` int(1) NOT NULL COMMENT 'Impression des tickets',
  `ticket_template` int(1) NOT NULL COMMENT 'Affiche le bouton modèle de ticket',
  `ticket_calendar` int(1) NOT NULL COMMENT 'Planifier un ticket',
  `ticket_event` int(1) NOT NULL COMMENT 'Créer un rappel de ticket',
  `ticket_save` int(1) NOT NULL COMMENT 'Sauvegarde de ticket',
  `ticket_type` int(1) NOT NULL COMMENT 'Modification du type dans le ticket',
  `ticket_type_disp` int(1) NOT NULL COMMENT 'Affiche le champ type dans le ticket',
  `ticket_type_service_limit` int(1) NOT NULL COMMENT 'Affiche uniquement les types associés au service',
  `ticket_type_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ type dans le ticket',
  `ticket_type_answer_disp` int(1) NOT NULL COMMENT 'Affiche le champ type de réponse sur le ticket',
  `ticket_service` int(1) NOT NULL COMMENT 'Modification du service dans le ticket',
  `ticket_service_disp` int(1) NOT NULL COMMENT 'Affiche le champ service dans le ticket',
  `ticket_service_mandatory` int(11) NOT NULL COMMENT 'Oblige la saisie du champ service',
  `ticket_user` int(1) NOT NULL COMMENT 'Modification du demandeur',
  `ticket_user_disp` int(1) NOT NULL COMMENT 'Affiche le champ utilisateur dans le ticket',
  `ticket_user_actions` int(1) NOT NULL COMMENT 'Affiche les boutons actions pour le demandeur',
  `ticket_user_company` int(1) NOT NULL COMMENT 'Affiche le nom de la société de l''utilisateur dans la liste des utilisateurs sur un ticket',
  `ticket_tech` int(1) NOT NULL COMMENT 'Modification du technicien',
  `ticket_tech_disp` int(1) NOT NULL COMMENT 'Affiche le champ technicien dans le ticket',
  `ticket_tech_service_lock` int(1) NOT NULL COMMENT 'Bloque la modification du champ technicien si la limite par service est activée et qu''il ouvre un ticket pour un autre service ',
  `ticket_tech_mandatory` int(11) NOT NULL COMMENT 'Oblige la saisie du champ technicien',
  `ticket_tech_admin` int(1) NOT NULL COMMENT 'Affiche les administrateurs dans la liste des techniciens sur un ticket.',
  `ticket_tech_super` int(1) NOT NULL COMMENT 'Affiche les superviseurs dans la liste des techniciens sur un ticket',
  `ticket_asset` int(1) NOT NULL COMMENT 'Modification de l''équipement sur un ticket',
  `ticket_asset_disp` int(1) NOT NULL COMMENT 'Affiche le champ équipement dans le ticket',
  `ticket_asset_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ équipement',
  `ticket_cat` int(1) NOT NULL COMMENT 'Modification des catégories',
  `ticket_cat_disp` int(1) NOT NULL COMMENT 'Affiche le champ catégorie dans le ticket',
  `ticket_cat_actions` int(1) NOT NULL COMMENT 'Affiche les boutons actions pour les catégories',
  `ticket_cat_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ catégorie',
  `ticket_agency` int(1) NOT NULL COMMENT 'Affiche le champ agence dans le ticket',
  `ticket_agency_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ agence',
  `ticket_sender_service_disp` int(1) NOT NULL COMMENT 'Affiche le champ service du demandeur dans le ticket',
  `ticket_place` int(1) NOT NULL COMMENT 'Modification du lieu',
  `ticket_place_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ lieu sur le ticket',
  `ticket_title` int(1) NOT NULL COMMENT 'Modification du titre dans le ticket',
  `ticket_title_disp` int(1) NOT NULL COMMENT 'Affiche le champ titre dans le ticket',
  `ticket_title_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ titre',
  `ticket_description` int(1) NOT NULL COMMENT 'Modification de la description',
  `ticket_description_disp` int(1) NOT NULL COMMENT 'Affiche le champ description dans le ticket',
  `ticket_description_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie de la description',
  `ticket_description_insert_image` int(1) NOT NULL COMMENT 'Affiche le bouton inserer image sur le champ description',
  `ticket_resolution_disp` int(1) NOT NULL COMMENT 'Affiche le champ resolution dans le ticket',
  `ticket_resolution_insert_image` int(1) NOT NULL COMMENT 'Affiche le bouton inserer image sur le champ résolution',
  `ticket_attachment` int(1) NOT NULL COMMENT 'Ajouter des pièces jointes',
  `ticket_attachment_delete` int(1) NOT NULL COMMENT 'Autorise la suppression de pièce jointe sur un ticket',
  `ticket_date_create` int(1) NOT NULL COMMENT 'Modification de la date de création',
  `ticket_date_create_disp` int(1) NOT NULL COMMENT 'Affiche le champ date de création dans le ticket',
  `ticket_date_hope` int(1) NOT NULL COMMENT 'Modification de la date de résolution estimée',
  `ticket_date_hope_disp` int(1) NOT NULL COMMENT 'Affiche le champ date de résolution estimée dans le ticket',
  `ticket_date_hope_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ date de résolution estimée',
  `ticket_date_res` int(1) NOT NULL COMMENT 'Modification de la date de résolution dans le ticket',
  `ticket_date_res_disp` int(1) NOT NULL COMMENT 'Affiche le champ date de résolution dans le ticket',
  `ticket_time` int(1) NOT NULL COMMENT 'Modification du temps passé par ticket',
  `ticket_time_disp` int(1) NOT NULL COMMENT 'Affiche le champ temps passé dans le ticket',
  `ticket_time_hope` int(1) NOT NULL COMMENT 'Modification du temps estimé passé par ticket',
  `ticket_time_hope_disp` int(1) NOT NULL COMMENT 'Affiche le champ temps estimé dans le ticket',
  `ticket_priority` int(1) NOT NULL COMMENT 'Modification de la priorité dans le ticket',
  `ticket_priority_disp` int(1) NOT NULL COMMENT 'Affiche le champ priorité dans le ticket',
  `ticket_priority_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ priorité',
  `ticket_priority_service_limit` int(1) NOT NULL COMMENT 'Affiche uniquement les priorités associées au service',
  `ticket_criticality` int(1) NOT NULL COMMENT 'Modification de la criticité dans le ticket',
  `ticket_criticality_disp` int(1) NOT NULL COMMENT 'Affiche le champ criticité dans le ticket',
  `ticket_criticality_mandatory` int(1) NOT NULL COMMENT 'Oblige la saisie du champ criticité',
  `ticket_criticality_service_limit` int(1) NOT NULL COMMENT 'Affiche uniquement les criticités associées au service',
  `ticket_state` int(1) NOT NULL COMMENT 'Modification du champ état dans le ticket',
  `ticket_state_disp` int(1) NOT NULL COMMENT 'Affiche le champ état dans le ticket',
  `ticket_user_validation` int(1) NOT NULL COMMENT 'Affiche le champ validation demandeur sur les tickets',
  `ticket_availability` int(1) NOT NULL COMMENT 'Modification de la partie disponibilité',
  `ticket_availability_disp` int(1) NOT NULL COMMENT 'Affiche la partie disponibilité',
  `ticket_delete` int(1) NOT NULL COMMENT 'Droit de suppression de tickets',
  `ticket_close` int(1) NOT NULL COMMENT 'Affiche le bouton de clôture dans le ticket',
  `ticket_reopen` int(1) NOT NULL COMMENT 'Affiche le bouton de ré-ouverture sur un ticket résolu',
  `ticket_thread_add` int(1) NOT NULL COMMENT 'Ajouter des réponses',
  `ticket_thread_delete` int(1) NOT NULL COMMENT 'Suppression d''une résolution',
  `ticket_thread_edit` int(1) NOT NULL COMMENT 'Modification de ses résolutions',
  `ticket_thread_edit_all` int(1) NOT NULL COMMENT 'Modification de toutes les résolutions',
  `ticket_thread_post` int(1) NOT NULL COMMENT 'Droit de répondre dans les tickets',
  `ticket_thread_private` int(1) NOT NULL COMMENT 'Autorise à passer le message en privé',
  `ticket_thread_private_button` int(1) NOT NULL COMMENT 'Affiche un bouton pour ajouter un message en privé',
  `ticket_save_close` int(1) NOT NULL COMMENT 'Affiche le bouton enregistrer et fermer dans le ticket',
  `ticket_send_mail` int(1) NOT NULL COMMENT 'Affiche le bouton envoyer un mail dans le ticket',
  `ticket_cancel` int(1) NOT NULL COMMENT 'Affiche le bouton annuler dans le ticket',
  `ticket_new_type` int(1) NOT NULL COMMENT 'Modification du type pour les nouveaux tickets',
  `ticket_new_type_disp` int(1) NOT NULL COMMENT 'Affiche le champ type pour les nouveaux tickets',
  `ticket_new_service` int(1) NOT NULL COMMENT 'Modification du service pour les nouveaux tickets',
  `ticket_new_service_disp` int(1) NOT NULL COMMENT 'Affiche le champ service pour les nouveaux tickets',
  `ticket_new_user` int(1) NOT NULL COMMENT 'Modification du demandeur pour les nouveaux tickets',
  `ticket_new_user_disp` int(1) NOT NULL COMMENT 'Affiche le champ demandeur pour les nouveaux tickets',
  `ticket_new_tech_disp` int(1) NOT NULL COMMENT 'Affiche le champ technicien pour les nouveaux tickets',
  `ticket_new_asset_disp` int(1) NOT NULL COMMENT 'Affiche le champ équipement pour les nouveaux tickets',
  `ticket_new_cat` int(1) NOT NULL COMMENT 'Modification de la catégorie pour les nouveaux tickets',
  `ticket_new_cat_disp` int(1) NOT NULL COMMENT 'Affiche le champ catégorie pour les nouveaux tickets',
  `ticket_new_resolution_disp` int(1) NOT NULL COMMENT 'Affiche le champ résolution pour les nouveaux tickets',
  `ticket_new_send` int(1) NOT NULL COMMENT 'Affiche le bouton envoyer pour les nouveaux tickets',
  `ticket_new_save` int(1) NOT NULL COMMENT 'Affiche le bouton sauvegarder sur les nouveaux tickets',
  `user_profil_company` int(1) NOT NULL DEFAULT '2' COMMENT 'Modification de la société sur la fiche utilisateur',
  `user_profil_service` int(1) NOT NULL COMMENT 'Modification du service sur la fiche de l''utilisateur',
  `user_profil_agency` int(1) NOT NULL COMMENT 'Modification de l''agence sur la fiche de l''utilisateur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trights`
--

INSERT INTO `trights` (`id`, `profile`, `search`, `task_checkbox`, `procedure`, `procedure_add`, `procedure_delete`, `procedure_modify`, `procedure_company`, `procedure_list_company_only`, `stat`, `planning`, `project`, `availability`, `asset`, `asset_net_scan`, `asset_delete`, `asset_virtualization_disp`, `asset_location_disp`, `asset_list_department_only`, `asset_list_company_only`, `asset_list_view_only`, `asset_list_col_location`, `admin`, `admin_groups`, `admin_lists`, `admin_lists_category`, `admin_lists_subcat`, `admin_lists_criticality`, `admin_lists_priority`, `admin_lists_type`, `admin_user_profile`, `admin_user_view`, `admin_backup`, `dashboard_service_only`, `dashboard_agency_only`, `dashboard_firstname`, `dashboard_col_user_service`, `dashboard_col_service`, `dashboard_col_agency`, `dashboard_col_company`, `dashboard_col_type`, `dashboard_col_category`, `dashboard_col_subcat`, `dashboard_col_asset`, `dashboard_col_criticality`, `dashboard_col_priority`, `dashboard_col_date_create`, `dashboard_col_date_create_hour`, `dashboard_col_date_hope`, `dashboard_col_date_res`, `dashboard_col_time`, `userbar`, `side`, `side_open_ticket`, `side_asset_create`, `side_asset_all_state`, `side_your`, `side_your_not_read`, `side_your_not_attribute`, `side_your_meta`, `side_your_tech_group`, `side_all`, `side_all_wait`, `side_all_meta`, `side_all_service_disp`, `side_all_service_edit`, `side_all_agency_disp`, `side_all_agency_edit`, `side_company`, `side_view`, `ticket_next`, `ticket_print`, `ticket_template`, `ticket_calendar`, `ticket_event`, `ticket_save`, `ticket_type`, `ticket_type_disp`, `ticket_type_service_limit`, `ticket_type_mandatory`, `ticket_type_answer_disp`, `ticket_service`, `ticket_service_disp`, `ticket_service_mandatory`, `ticket_user`, `ticket_user_disp`, `ticket_user_actions`, `ticket_user_company`, `ticket_tech`, `ticket_tech_disp`, `ticket_tech_service_lock`, `ticket_tech_mandatory`, `ticket_tech_admin`, `ticket_tech_super`, `ticket_asset`, `ticket_asset_disp`, `ticket_asset_mandatory`, `ticket_cat`, `ticket_cat_disp`, `ticket_cat_actions`, `ticket_cat_mandatory`, `ticket_agency`, `ticket_agency_mandatory`, `ticket_sender_service_disp`, `ticket_place`, `ticket_place_mandatory`, `ticket_title`, `ticket_title_disp`, `ticket_title_mandatory`, `ticket_description`, `ticket_description_disp`, `ticket_description_mandatory`, `ticket_description_insert_image`, `ticket_resolution_disp`, `ticket_resolution_insert_image`, `ticket_attachment`, `ticket_attachment_delete`, `ticket_date_create`, `ticket_date_create_disp`, `ticket_date_hope`, `ticket_date_hope_disp`, `ticket_date_hope_mandatory`, `ticket_date_res`, `ticket_date_res_disp`, `ticket_time`, `ticket_time_disp`, `ticket_time_hope`, `ticket_time_hope_disp`, `ticket_priority`, `ticket_priority_disp`, `ticket_priority_mandatory`, `ticket_priority_service_limit`, `ticket_criticality`, `ticket_criticality_disp`, `ticket_criticality_mandatory`, `ticket_criticality_service_limit`, `ticket_state`, `ticket_state_disp`, `ticket_user_validation`, `ticket_availability`, `ticket_availability_disp`, `ticket_delete`, `ticket_close`, `ticket_reopen`, `ticket_thread_add`, `ticket_thread_delete`, `ticket_thread_edit`, `ticket_thread_edit_all`, `ticket_thread_post`, `ticket_thread_private`, `ticket_thread_private_button`, `ticket_save_close`, `ticket_send_mail`, `ticket_cancel`, `ticket_new_type`, `ticket_new_type_disp`, `ticket_new_service`, `ticket_new_service_disp`, `ticket_new_user`, `ticket_new_user_disp`, `ticket_new_tech_disp`, `ticket_new_asset_disp`, `ticket_new_cat`, `ticket_new_cat_disp`, `ticket_new_resolution_disp`, `ticket_new_send`, `ticket_new_save`, `user_profil_company`, `user_profil_service`, `user_profil_agency`) VALUES
(1, 0, 2, 2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2),
(2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 2, 0, 2, 0, 0),
(3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 2, 0, 2, 0, 0),
(4, 3, 2, 2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 0, 2, 0, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2),
(5, 4, 2, 2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 0, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 2, 0, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tservices`
--

CREATE TABLE `tservices` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ldap_guid` varchar(50) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tservices`
--

INSERT INTO `tservices` (`id`, `name`, `ldap_guid`, `disable`) VALUES
(0, 'Aucun', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tstates`
--

CREATE TABLE `tstates` (
  `id` int(11) NOT NULL,
  `number` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `mail_object` varchar(200) NOT NULL,
  `display` varchar(100) NOT NULL,
  `meta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tstates`
--

INSERT INTO `tstates` (`id`, `number`, `name`, `description`, `mail_object`, `display`, `meta`) VALUES
(1, 2, 'Attente PEC', 'tickets en attente de prise en charge', 'Notification d\'ouverture', 'badge text-75 border-l-3 brc-black-tp8 bgc-primary text-white', 1),
(2, 3, 'En cours', 'tickets en cours de traitement', 'Notification', 'badge text-75 border-l-3 brc-black-tp8 bgc-warning text-white', 1),
(3, 5, 'Résolu', 'tickets résolus', 'Notification de clôture', 'badge text-75 border-l-3 brc-black-tp8 bgc-success text-white', 0),
(4, 6, 'Rejeté', 'tickets rejetés', 'Notification de rejet', 'badge text-75 border-l-3 brc-black-tp8 bgc-dark text-white', 0),
(5, 1, 'Non attribué', 'tickets pas encore associés à un technicien', 'Notification de déclaration', 'badge text-75 border-l-3 brc-black-tp8 bgc-danger text-white', 0),
(6, 4, 'Attente Retour', 'tickets en attente d\'éléments de la part du demandeur', 'Notification d\'attente de retour ', 'badge text-75 border-l-3 brc-black-tp8 bgc-pink text-white', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tsubcat`
--

CREATE TABLE `tsubcat` (
  `id` int(10) NOT NULL,
  `cat` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `technician` int(10) NOT NULL,
  `technician_group` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsubcat`
--

INSERT INTO `tsubcat` (`id`, `cat`, `name`, `technician`, `technician_group`) VALUES
(0, 0, 'Aucune', 0, 0),
(1, 1, 'Office', 0, 0),
(2, 2, 'PC', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tsurvey_answers`
--

CREATE TABLE `tsurvey_answers` (
  `id` int(5) NOT NULL,
  `date` datetime NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `question_id` int(5) NOT NULL,
  `answer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tsurvey_questions`
--

CREATE TABLE `tsurvey_questions` (
  `id` int(5) NOT NULL,
  `number` int(5) NOT NULL,
  `type` int(5) NOT NULL COMMENT '1=yes/no,2=text,3=select,4=scale',
  `text` varchar(250) NOT NULL,
  `scale` int(2) NOT NULL,
  `select_1` varchar(100) NOT NULL,
  `select_2` varchar(100) NOT NULL,
  `select_3` varchar(100) NOT NULL,
  `select_4` varchar(100) NOT NULL,
  `select_5` varchar(100) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ttemplates`
--

CREATE TABLE `ttemplates` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `incident` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tthreads`
--

CREATE TABLE `tthreads` (
  `id` int(10) NOT NULL,
  `ticket` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `author` int(10) NOT NULL,
  `text` mediumtext NOT NULL,
  `type` int(1) NOT NULL,
  `tech1` int(5) NOT NULL,
  `tech2` int(5) NOT NULL,
  `group1` int(5) NOT NULL,
  `group2` int(5) NOT NULL,
  `user` int(5) NOT NULL,
  `state` int(1) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `dest_mail` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ttime`
--

CREATE TABLE `ttime` (
  `id` int(2) NOT NULL,
  `min` int(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttime`
--

INSERT INTO `ttime` (`id`, `min`, `name`) VALUES
(1, 1, '1m'),
(2, 5, '5m'),
(3, 10, '10m'),
(4, 30, '30m'),
(5, 60, '1h'),
(6, 180, '3h'),
(7, 300, '5h'),
(8, 480, '1j'),
(9, 960, '2j'),
(10, 2400, '1s');

-- --------------------------------------------------------

--
-- Table structure for table `ttoken`
--

CREATE TABLE `ttoken` (
  `id` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `token` varchar(64) NOT NULL,
  `action` varchar(50) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ttypes`
--

CREATE TABLE `ttypes` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `service` int(5) NOT NULL,
  `user_validation` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttypes`
--

INSERT INTO `ttypes` (`id`, `name`, `service`, `user_validation`) VALUES
(0, 'Aucun', 0, 0),
(1, 'Demande', 0, 0),
(2, 'Incident', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ttypes_answer`
--

CREATE TABLE `ttypes_answer` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttypes_answer`
--

INSERT INTO `ttypes_answer` (`id`, `name`, `disable`) VALUES
(0, 'Aucune', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tusers`
--

CREATE TABLE `tusers` (
  `id` int(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `profile` int(10) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `function` varchar(100) NOT NULL,
  `company` int(5) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `custom1` varchar(100) NOT NULL,
  `custom2` varchar(100) NOT NULL,
  `disable` int(1) NOT NULL,
  `chgpwd` int(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_pwd_chg` date NOT NULL,
  `auth_attempt` int(2) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `skin` varchar(10) NOT NULL,
  `default_ticket_state` varchar(10) NOT NULL,
  `dashboard_ticket_order` varchar(200) NOT NULL,
  `limit_ticket_number` int(5) NOT NULL,
  `limit_ticket_days` int(5) NOT NULL,
  `limit_ticket_date_start` date NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'fr_FR',
  `ldap_guid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tusers`
--

INSERT INTO `tusers` (`id`, `login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`) VALUES
(0, 'aucun', '', '', '', 'Aucun', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 1, 0, '2016-10-21 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '2016-10-21', 'fr_FR', ''),
(1, 'admin', '$2y$10$glFUqEIHUovXiUIK9l9pVed52YMqGYyu2bl0sdLzMAnbnbNheK/4a', 'salt', 'admin', '', 4, 'admin@exemple.fr', '06 09 56 89 45', '', '0', '', 0, '', '', '0', '', '', '', 0, 0, '2021-06-02 11:25:40', '2021-06-02', 0, '192.168.1.160', '', '', '', 0, 0, '0000-00-00', 'fr_FR', ''),
(2, 'user', '$2y$10$IyYLTCVl4EeMHALAq9KoX.aci8MigMCpSxjlVY97u9d1CYt.8lec6', 'salt', 'user', '', 2, 'user@exemple.fr', '', '', '0', '', 0, '', '', '0', '', '', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', ''),
(3, 'poweruser', '$2y$10$TF7YnhwQoBM8kiIBTR.FaOpGn5ZzYHJIHGPQdvwCbk9r/n1ANio5i', 'salt', 'poweruser', '', 1, 'poweruser@exemple.fr', '', '', '0', '', 0, '', '', '0', '', '', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', ''),
(4, 'super', '$2y$10$erzI5AMjA0d5QxjZAL9nRu.PQudBpsIBrap/wBg.RH7gjcJbMev9a', 'salt', 'supervisor', '', 3, 'supervisor@exemple.fr', '', '', '0', '', 0, '', '', '0', '', '', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', ''),
(5, 'tech', '$2y$10$7jnBeZwjB68tBwU.ROwHP.aeBVZYMSSJiG6XSIBePwKXgokH5sC9q', 'salt', 'tech', '', 0, 'tech@exemple.fr', '', '', '0', '', 0, '', '', '0', '', '', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', ''),
(6, 'delete_user_gs', '', '', 'Utilisateur', 'Supprimé', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '');

-- --------------------------------------------------------

--
-- Table structure for table `tusers_agencies`
--

CREATE TABLE `tusers_agencies` (
  `id` int(5) NOT NULL,
  `user_id` int(10) NOT NULL,
  `agency_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tusers_services`
--

CREATE TABLE `tusers_services` (
  `id` int(5) NOT NULL,
  `user_id` int(10) NOT NULL,
  `service_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tusers_tech`
--

CREATE TABLE `tusers_tech` (
  `id` int(5) NOT NULL,
  `user` int(10) NOT NULL,
  `tech` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tviews`
--

CREATE TABLE `tviews` (
  `id` int(11) NOT NULL,
  `uid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` int(5) NOT NULL,
  `subcat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tagencies`
--
ALTER TABLE `tagencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets`
--
ALTER TABLE `tassets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `manufacturer` (`manufacturer`),
  ADD KEY `model` (`model`),
  ADD KEY `user` (`user`),
  ADD KEY `state` (`state`),
  ADD KEY `department` (`department`),
  ADD KEY `location` (`location`),
  ADD KEY `technician` (`technician`),
  ADD KEY `maintenance` (`maintenance`);

--
-- Indexes for table `tassets_iface`
--
ALTER TABLE `tassets_iface`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tassets_iface_role`
--
ALTER TABLE `tassets_iface_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_location`
--
ALTER TABLE `tassets_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_manufacturer`
--
ALTER TABLE `tassets_manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_model`
--
ALTER TABLE `tassets_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_network`
--
ALTER TABLE `tassets_network`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_state`
--
ALTER TABLE `tassets_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_thread`
--
ALTER TABLE `tassets_thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tassets_type`
--
ALTER TABLE `tassets_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tattachments`
--
ALTER TABLE `tattachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `procedure_id` (`procedure_id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- Indexes for table `tavailability`
--
ALTER TABLE `tavailability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`);

--
-- Indexes for table `tavailability_dep`
--
ALTER TABLE `tavailability_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`);

--
-- Indexes for table `tavailability_target`
--
ALTER TABLE `tavailability_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcat` (`subcat`);

--
-- Indexes for table `tcategory`
--
ALTER TABLE `tcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technician` (`technician`),
  ADD KEY `technician_group` (`technician_group`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `tcompany`
--
ALTER TABLE `tcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcriticality`
--
ALTER TABLE `tcriticality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `tevents`
--
ALTER TABLE `tevents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technician` (`technician`),
  ADD KEY `incident` (`incident`);

--
-- Indexes for table `tgroups`
--
ALTER TABLE `tgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `tgroups_assoc`
--
ALTER TABLE `tgroups_assoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group` (`group`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `tincidents`
--
ALTER TABLE `tincidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state` (`state`),
  ADD KEY `technician` (`technician`),
  ADD KEY `user` (`user`),
  ADD KEY `u_service` (`u_service`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`),
  ADD KEY `u_agency` (`u_agency`),
  ADD KEY `priority` (`priority`),
  ADD KEY `criticality` (`criticality`),
  ADD KEY `sender_service` (`sender_service`),
  ADD KEY `type` (`type`),
  ADD KEY `t_group` (`t_group`),
  ADD KEY `u_group` (`u_group`),
  ADD KEY `creator` (`creator`),
  ADD KEY `place` (`place`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `type_answer` (`type_answer`);

--
-- Indexes for table `tlogs`
--
ALTER TABLE `tlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `tmails`
--
ALTER TABLE `tmails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incident` (`incident`);

--
-- Indexes for table `tparameters`
--
ALTER TABLE `tparameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tparameters_imap_multi_mailbox`
--
ALTER TABLE `tparameters_imap_multi_mailbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `tparameters_user_validation_exclusion`
--
ALTER TABLE `tparameters_user_validation_exclusion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`);

--
-- Indexes for table `tplaces`
--
ALTER TABLE `tplaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tplugins`
--
ALTER TABLE `tplugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpriority`
--
ALTER TABLE `tpriority`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `tprocedures`
--
ALTER TABLE `tprocedures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `tprofiles`
--
ALTER TABLE `tprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tprojects`
--
ALTER TABLE `tprojects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tprojects_task`
--
ALTER TABLE `tprojects_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `trights`
--
ALTER TABLE `trights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tservices`
--
ALTER TABLE `tservices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tstates`
--
ALTER TABLE `tstates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsubcat`
--
ALTER TABLE `tsubcat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technician` (`technician`),
  ADD KEY `technician_group` (`technician_group`),
  ADD KEY `cat` (`cat`);

--
-- Indexes for table `tsurvey_answers`
--
ALTER TABLE `tsurvey_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `tsurvey_questions`
--
ALTER TABLE `tsurvey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ttemplates`
--
ALTER TABLE `ttemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incident` (`incident`);

--
-- Indexes for table `tthreads`
--
ALTER TABLE `tthreads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket` (`ticket`),
  ADD KEY `author` (`author`),
  ADD KEY `tech1` (`tech1`),
  ADD KEY `tech2` (`tech2`),
  ADD KEY `group1` (`group1`),
  ADD KEY `group2` (`group2`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `ttime`
--
ALTER TABLE `ttime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ttoken`
--
ALTER TABLE `ttoken`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ttypes`
--
ALTER TABLE `ttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `ttypes_answer`
--
ALTER TABLE `ttypes_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tusers`
--
ALTER TABLE `tusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company` (`company`);

--
-- Indexes for table `tusers_agencies`
--
ALTER TABLE `tusers_agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `tusers_services`
--
ALTER TABLE `tusers_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `tusers_tech`
--
ALTER TABLE `tusers_tech`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `tech` (`tech`);

--
-- Indexes for table `tviews`
--
ALTER TABLE `tviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `subcat` (`subcat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagencies`
--
ALTER TABLE `tagencies`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tassets`
--
ALTER TABLE `tassets`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tassets_iface`
--
ALTER TABLE `tassets_iface`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tassets_iface_role`
--
ALTER TABLE `tassets_iface_role`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tassets_location`
--
ALTER TABLE `tassets_location`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tassets_manufacturer`
--
ALTER TABLE `tassets_manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tassets_model`
--
ALTER TABLE `tassets_model`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tassets_network`
--
ALTER TABLE `tassets_network`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tassets_state`
--
ALTER TABLE `tassets_state`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tassets_thread`
--
ALTER TABLE `tassets_thread`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tassets_type`
--
ALTER TABLE `tassets_type`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tattachments`
--
ALTER TABLE `tattachments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tavailability`
--
ALTER TABLE `tavailability`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tavailability_dep`
--
ALTER TABLE `tavailability_dep`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tavailability_target`
--
ALTER TABLE `tavailability_target`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tcategory`
--
ALTER TABLE `tcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tcompany`
--
ALTER TABLE `tcompany`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tcriticality`
--
ALTER TABLE `tcriticality`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tevents`
--
ALTER TABLE `tevents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tgroups`
--
ALTER TABLE `tgroups`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tgroups_assoc`
--
ALTER TABLE `tgroups_assoc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tincidents`
--
ALTER TABLE `tincidents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tlogs`
--
ALTER TABLE `tlogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmails`
--
ALTER TABLE `tmails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tparameters`
--
ALTER TABLE `tparameters`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tparameters_imap_multi_mailbox`
--
ALTER TABLE `tparameters_imap_multi_mailbox`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tparameters_user_validation_exclusion`
--
ALTER TABLE `tparameters_user_validation_exclusion`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tplaces`
--
ALTER TABLE `tplaces`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tplugins`
--
ALTER TABLE `tplugins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tpriority`
--
ALTER TABLE `tpriority`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tprocedures`
--
ALTER TABLE `tprocedures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tprofiles`
--
ALTER TABLE `tprofiles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tprojects`
--
ALTER TABLE `tprojects`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tprojects_task`
--
ALTER TABLE `tprojects_task`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trights`
--
ALTER TABLE `trights`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tservices`
--
ALTER TABLE `tservices`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tstates`
--
ALTER TABLE `tstates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tsubcat`
--
ALTER TABLE `tsubcat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tsurvey_answers`
--
ALTER TABLE `tsurvey_answers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tsurvey_questions`
--
ALTER TABLE `tsurvey_questions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ttemplates`
--
ALTER TABLE `ttemplates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tthreads`
--
ALTER TABLE `tthreads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ttime`
--
ALTER TABLE `ttime`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ttoken`
--
ALTER TABLE `ttoken`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ttypes`
--
ALTER TABLE `ttypes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ttypes_answer`
--
ALTER TABLE `ttypes_answer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tusers`
--
ALTER TABLE `tusers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tusers_agencies`
--
ALTER TABLE `tusers_agencies`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tusers_services`
--
ALTER TABLE `tusers_services`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tusers_tech`
--
ALTER TABLE `tusers_tech`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tviews`
--
ALTER TABLE `tviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
