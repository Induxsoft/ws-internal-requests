-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.52 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para workspaces
CREATE DATABASE IF NOT EXISTS `workspaces` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `workspaces`;

-- Volcando estructura para vista workspaces.gettaskpercentprogressstate
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `gettaskpercentprogressstate` (
	`batch_log` INT(11) NOT NULL,
	`pp` DECIMAL(26,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla workspaces.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `usergroup` int(11) NOT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  KEY `RLProfileItem_SItemSys_PK` (`item`),
  KEY `RLProfileUserGroup_UserGroupSys_PK` (`usergroup`),
  CONSTRAINT `RLProfileUserGroup_UserGroupSys_PK` FOREIGN KEY (`usergroup`) REFERENCES `usergroup` (`sys_pk`),
  CONSTRAINT `RLProfileItem_SItemSys_PK` FOREIGN KEY (`item`) REFERENCES `sitem` (`sys_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista workspaces.qrygroupprofile
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `qrygroupprofile` (
	`sys_pk` INT(11) NOT NULL,
	`sys_timestamp` DATETIME NOT NULL,
	`sys_guid` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`sys_dtcreated` DATETIME NULL,
	`sys_user` VARCHAR(5) NULL COLLATE 'latin1_swedish_ci',
	`sys_lastuser` VARCHAR(5) NULL COLLATE 'latin1_swedish_ci',
	`sys_exported` TINYINT(1) NULL,
	`sys_dtexported` DATETIME NULL,
	`sys_info` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci',
	`item` INT(11) NOT NULL,
	`usergroup` INT(11) NOT NULL,
	`groupid` VARCHAR(15) NOT NULL COLLATE 'latin1_swedish_ci',
	`description` VARCHAR(250) NULL COLLATE 'latin1_swedish_ci',
	`itemid` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista workspaces.qryuserprofile
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `qryuserprofile` (
	`userid` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`item` INT(11) NOT NULL,
	`description` VARCHAR(250) NULL COLLATE 'latin1_swedish_ci',
	`itemid` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista workspaces.qryusersbygroup
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `qryusersbygroup` (
	`UserID` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`UserName` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`PWD` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci',
	`Message` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Locked` TINYINT(1) NULL,
	`Notes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`GroupID` VARCHAR(15) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla workspaces.sitem
CREATE TABLE IF NOT EXISTS `sitem` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `itemid` varchar(32) NOT NULL,
  `itemparent` int(11) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  UNIQUE KEY `itemid` (`itemid`),
  KEY `RLSItemItemParent_SItemSys_PK` (`itemparent`),
  CONSTRAINT `RLSItemItemParent_SItemSys_PK` FOREIGN KEY (`itemparent`) REFERENCES `sitem` (`sys_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch
CREATE TABLE IF NOT EXISTS `sys_batch` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `batch_name` varchar(32) NOT NULL,
  `batch_enabled` tinyint(1) DEFAULT NULL,
  `batch_enabled_at` datetime DEFAULT NULL,
  `batch_previous` varchar(32) DEFAULT NULL,
  `batch_previous_state` int(11) DEFAULT NULL,
  `batch_worktimebegin` int(11) DEFAULT NULL,
  `batch_worktimeend` int(11) DEFAULT NULL,
  `batch_timeout` int(11) DEFAULT NULL,
  `batch_scheduled` int(11) DEFAULT NULL,
  `batch_last_execution` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  UNIQUE KEY `idx_601FDE4D08C54E38987715423AF9B344` (`batch_name`),
  KEY `fk_258DF1325283414C871F47BBABFD1836` (`batch_previous_state`),
  KEY `fk_D452B3A029C649C1BA1817EB62D3AE2C` (`batch_scheduled`),
  CONSTRAINT `fk_D452B3A029C649C1BA1817EB62D3AE2C` FOREIGN KEY (`batch_scheduled`) REFERENCES `sys_batch_schedule` (`id`),
  CONSTRAINT `fk_258DF1325283414C871F47BBABFD1836` FOREIGN KEY (`batch_previous_state`) REFERENCES `sys_batch_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch_log
CREATE TABLE IF NOT EXISTS `sys_batch_log` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `sys_batch` int(11) NOT NULL,
  `batch_start_at` datetime DEFAULT NULL,
  `batch_finish_at` datetime DEFAULT NULL,
  `batch_state` int(11) NOT NULL,
  `batch_log_previous` int(11) DEFAULT NULL,
  `batch_os_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  KEY `fk_BD6BDEB675C14B61BE7AE11148BE6C69` (`batch_state`),
  CONSTRAINT `fk_BD6BDEB675C14B61BE7AE11148BE6C69` FOREIGN KEY (`batch_state`) REFERENCES `sys_batch_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch_schedule
CREATE TABLE IF NOT EXISTS `sys_batch_schedule` (
  `id` int(11) NOT NULL,
  `const` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch_state
CREATE TABLE IF NOT EXISTS `sys_batch_state` (
  `id` int(11) NOT NULL,
  `const` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch_task
CREATE TABLE IF NOT EXISTS `sys_batch_task` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `sys_batch` int(11) NOT NULL,
  `batch_task_syntax` varchar(4096) NOT NULL,
  `batch_task_cursor_source` varchar(4096) DEFAULT NULL,
  `batch_task_result` tinyint(1) DEFAULT NULL,
  `batch_task_description` varchar(1024) DEFAULT NULL,
  `batch_task_percent` decimal(4,2) DEFAULT NULL,
  `batch_task_fatal` tinyint(1) DEFAULT NULL,
  `batch_task_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_batch_task_log
CREATE TABLE IF NOT EXISTS `sys_batch_task_log` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `batch_log` int(11) NOT NULL,
  `task_sys_batch_task` int(11) NOT NULL,
  `task_sentence` varchar(4096) DEFAULT NULL,
  `task_start_at` datetime DEFAULT NULL,
  `task_finish_at` datetime DEFAULT NULL,
  `task_state` int(11) NOT NULL,
  `task_message` varchar(1024) DEFAULT NULL,
  `task_percent_progress` decimal(4,2) DEFAULT NULL,
  `task_progress` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  KEY `fk_25840C021F6C420792FC55D88E37F356` (`task_state`),
  CONSTRAINT `fk_25840C021F6C420792FC55D88E37F356` FOREIGN KEY (`task_state`) REFERENCES `sys_task_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_catalog
CREATE TABLE IF NOT EXISTS `sys_catalog` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `objectname` varchar(64) NOT NULL,
  `objectdescription` varchar(4096) DEFAULT NULL,
  `objecttype` varchar(64) NOT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  UNIQUE KEY `objectname` (`objectname`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_lockinfo
CREATE TABLE IF NOT EXISTS `sys_lockinfo` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `sys_table` int(11) NOT NULL,
  `sys_row` int(11) NOT NULL,
  `sys_token` int(11) NOT NULL,
  `sys_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  KEY `sys_lockinfo_catalog` (`sys_table`),
  KEY `sys_lockinfo_session` (`sys_token`),
  CONSTRAINT `sys_lockinfo_session` FOREIGN KEY (`sys_token`) REFERENCES `sys_session` (`sys_pk`),
  CONSTRAINT `sys_lockinfo_catalog` FOREIGN KEY (`sys_table`) REFERENCES `sys_catalog` (`sys_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_session
CREATE TABLE IF NOT EXISTS `sys_session` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `iuser` int(11) NOT NULL,
  `clientinfo` varchar(64) NOT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_task_state
CREATE TABLE IF NOT EXISTS `sys_task_state` (
  `id` int(11) NOT NULL,
  `const` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.sys_temp_permissions
CREATE TABLE IF NOT EXISTS `sys_temp_permissions` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  `currUser` varchar(120) DEFAULT NULL,
  `authUser` varchar(120) DEFAULT NULL,
  `permission` varchar(32) DEFAULT NULL,
  `used` tinyint(1) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.tuser
CREATE TABLE IF NOT EXISTS `tuser` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `notes` longtext,
  `pwd` varchar(32) DEFAULT NULL,
  `userid` varchar(120) NOT NULL,
  `username` varchar(120) NOT NULL,
  `pwdmd5` varchar(64) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.usergroup
CREATE TABLE IF NOT EXISTS `usergroup` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `description` varchar(80) NOT NULL,
  `groupid` varchar(15) NOT NULL,
  `notes` longtext,
  `uf_hidetoolbar` varchar(1) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  UNIQUE KEY `groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workspaces.user_usergroup_
CREATE TABLE IF NOT EXISTS `user_usergroup_` (
  `sys_pk` int(11) NOT NULL AUTO_INCREMENT,
  `groups` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `sys_timestamp` datetime NOT NULL,
  `sys_guid` varchar(32) NOT NULL,
  `sys_dtcreated` datetime DEFAULT NULL,
  `sys_user` varchar(5) DEFAULT NULL,
  `sys_lastuser` varchar(5) DEFAULT NULL,
  `sys_exported` tinyint(1) DEFAULT NULL,
  `sys_dtexported` datetime DEFAULT NULL,
  `sys_info` varchar(32) DEFAULT NULL,
  `sys_recver` int(11) DEFAULT NULL,
  `sys_deleted` tinyint(1) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_pk`),
  UNIQUE KEY `sys_guid` (`sys_guid`),
  KEY `RL_User_UserGroup_Groups_UserSys_PK` (`groups`),
  KEY `RL_User_UserGroup_Users_UserGroupSys_PK` (`users`),
  CONSTRAINT `RL_User_UserGroup_Users_UserGroupSys_PK` FOREIGN KEY (`users`) REFERENCES `tuser` (`sys_pk`),
  CONSTRAINT `RL_User_UserGroup_Groups_UserSys_PK` FOREIGN KEY (`groups`) REFERENCES `usergroup` (`sys_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista workspaces.gettaskpercentprogressstate
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `gettaskpercentprogressstate`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `gettaskpercentprogressstate` AS select batch_log,sum(task_progress) AS pp from sys_batch_task_log group by batch_log ;

-- Volcando estructura para vista workspaces.qrygroupprofile
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `qrygroupprofile`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qrygroupprofile` AS select profile.sys_pk, profile.sys_timestamp, profile.sys_guid, profile.sys_dtcreated, profile.sys_user, profile.sys_lastuser, profile.sys_exported, profile.sys_dtexported, profile.sys_info, profile.item, profile.usergroup, usergroup.groupid, sitem.description, sitem.itemid from usergroup inner join (sitem inner join profile on sitem.sys_pk = profile.item) on usergroup.sys_pk = profile.usergroup ;

-- Volcando estructura para vista workspaces.qryuserprofile
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `qryuserprofile`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qryuserprofile` AS select tuser.userid, profile.item, sitem.description, sitem.itemid from sitem inner join (tuser inner join (user_usergroup_ inner join profile on user_usergroup_.groups=profile.usergroup) on tuser.sys_pk=user_usergroup_.users) on sitem.sys_pk=profile.item group by tuser.userid, profile.item, sitem.description, sitem.itemid ;

-- Volcando estructura para vista workspaces.qryusersbygroup
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `qryusersbygroup`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `qryusersbygroup` AS SELECT TUser.UserID, TUser.UserName, TUser.PWD, TUser.Message, TUser.Locked, TUser.Notes, UserGroup.GroupID FROM TUser INNER JOIN (UserGroup INNER JOIN User_UserGroup_ ON UserGroup.Sys_PK=User_UserGroup_.Groups) ON TUser.Sys_PK=User_UserGroup_.Users ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
