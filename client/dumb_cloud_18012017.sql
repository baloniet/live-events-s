/*
Navicat MySQL Data Transfer

Source Server         : cloud
Source Server Version : 50714
Source Host           : 146.148.118.78:3306
Source Database       : live_events

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-18 18:05:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for a_person
-- ----------------------------
DROP TABLE IF EXISTS `a_person`;
CREATE TABLE `a_person` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`activity_id`  int(11) NOT NULL ,
`person_id`  int(11) NOT NULL ,
`isTeacher`  tinyint(1) NULL DEFAULT NULL ,
`isVolunteer`  tinyint(1) NULL DEFAULT NULL ,
`isRenter`  tinyint(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_a_person_1_idx` (`activity_id`) USING BTREE ,
INDEX `fk_a_person_2_idx` (`person_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=38

;

-- ----------------------------
-- Records of a_person
-- ----------------------------
BEGIN;
INSERT INTO `a_person` VALUES ('14', '2016-12-02 19:34:26', '12', '1102', '1', '0', null), ('15', '2016-12-02 19:44:40', '13', '1103', '1', '0', null), ('16', '2016-12-02 19:44:40', '13', '1104', '1', '0', null), ('17', '2016-12-02 19:48:34', '14', '14', '1', '0', null), ('18', '2016-12-02 19:48:34', '14', '17', '0', '1', null), ('19', '2016-12-02 20:19:09', '15', '15', '1', '0', null), ('20', '2016-12-02 20:24:43', '16', '21', '1', '0', null), ('21', '2016-12-02 20:24:43', '16', '23', '0', '1', null), ('22', '2016-12-02 20:28:30', '17', '21', '1', '0', null), ('24', '2016-12-02 20:36:58', '18', '1105', '1', '0', null), ('26', '2016-12-04 10:16:39', '19', '15', '1', '0', null), ('29', '2016-12-15 21:11:06', '22', '21', '1', '0', null), ('30', '2016-12-15 21:11:06', '22', '23', '0', '1', null), ('31', '2016-12-24 09:45:14', '12', '1004', '1', '0', null), ('33', '2016-12-26 11:52:49', '23', '21', '1', '0', '0'), ('34', '2016-12-26 11:52:49', '23', '18', '0', '1', '0'), ('35', '2016-12-26 11:52:49', '23', '1004', '0', '0', '1'), ('36', '2016-12-27 12:05:38', '24', '14', '1', '0', '0'), ('37', '2017-01-13 12:13:31', '25', '1054', '0', '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for a_template
-- ----------------------------
DROP TABLE IF EXISTS `a_template`;
CREATE TABLE `a_template` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`activity_id`  int(11) NOT NULL ,
`template_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `fk_a_template_1` (`activity_id`) USING BTREE ,
INDEX `fk_a_template_2` (`template_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of a_template
-- ----------------------------
BEGIN;
INSERT INTO `a_template` VALUES ('3', '12', '1'), ('5', '12', '4'), ('6', '12', '1'), ('7', '19', '2'), ('8', '17', '4'), ('9', '24', '1'), ('10', '24', '2'), ('11', '24', '4'), ('12', '18', '4');
COMMIT;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation date of activity' ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`theme_id`  int(11) NULL DEFAULT NULL ,
`isRented`  tinyint(1) NULL DEFAULT 0 COMMENT 'defines if activity is rented' ,
`oDate`  timestamp NULL DEFAULT NULL COMMENT 'defines if activity is canceled on given date' ,
`aDate`  timestamp NULL DEFAULT NULL COMMENT 'acceptance date or date of activity confirmation' ,
`publish`  tinyint(1) NULL DEFAULT NULL COMMENT 'allow publish? 1=yes,0=no' ,
`isAcc`  tinyint(1) NULL DEFAULT 0 COMMENT 'is activity accepted' ,
`isOff`  tinyint(1) NULL DEFAULT 0 COMMENT 'is activity declined or canceled' ,
`short`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'short description' ,
`project_id`  tinyint(4) NULL DEFAULT NULL ,
`kind_id`  int(11) NULL DEFAULT NULL ,
`type_id`  int(11) NULL DEFAULT NULL ,
`partner_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`kind_id`) REFERENCES `kind` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_activity_1_idx` (`theme_id`) USING BTREE ,
INDEX `fk_project_1` (`project_id`) USING BTREE ,
INDEX `fk_kind_1` (`kind_id`) USING BTREE ,
INDEX `fk_type_1` (`type_id`) USING BTREE ,
INDEX `fk_partner_1` (`partner_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=26

;

-- ----------------------------
-- Records of activity
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES ('12', '2016-12-02 19:34:25', 'Delavnica za mlade', 'Namenjena mladostnikom nad 12 let. Nadgrajujemo svoje socialne in komunikacijske veščine, se učimo uspešneje razvijati in graditi medosebne odnose, premagovati tremo, prepričljivo komunicirati ter se bolj učinkovito soočati z negotovostjo in nepredvidljivostjo na področju zaposlovanja. ', '10', '1', null, '2016-12-22 14:46:33', '1', '1', '0', 'Namenjena mladostnikom nad 12 let.', null, null, '1', null), ('13', '2016-12-02 19:44:40', 'Druženje vrtcev z Gospodično Mično', 'Ustvarjalne delavnice za vse generacije.', '11', '0', null, '2016-12-22 15:04:20', '1', '1', '0', null, null, null, null, null), ('14', '2016-12-02 19:48:05', 'Medkulturno v Kranju', 'Interaktivne delavnice, kjer pridobivamo nova znanja, delimo izkušnje, spoznavamo slovensko, orientalsko in drugo folkloro, raziskujemo kulinarične posebnosti, ustvarjamo ter predvsem zabavno in koristno preživljamo prosti čas.', '6', '0', null, '2017-01-11 05:36:43', null, '1', '0', null, null, null, null, null), ('15', '2016-12-02 20:19:09', 'Petje ljudskih pesmi', 'Razvedrimo se ob čudovitih pesmih, ki ogrejejo srce! ', '6', '0', null, null, null, '0', '0', null, null, null, null, null), ('16', '2016-12-02 20:24:42', 'Slovenija moja dežela - za tujce', 'Brezplačne delavnice za tujce za pomoč pri vključevanju v slovensko družbo. Spoznavali boste slovensko kulturo in družbo, pridobili praktične informacije, ki jih potrebujete za življenje in delo v Republiki Sloveniji ter se seznanili z upravnimi postopki za vsakdanje življenje. ', '12', '0', null, null, null, '0', '0', null, null, null, null, null), ('17', '2016-12-02 20:28:30', 'Info točka za seniorje', 'Svetujemo vam, kam se obrniti po pomoč in kje najti prave informacije za vsakovrstne težave, ki se človeku pojavijo v tretjem življenjskem obdobju, kot so na primer osebne stiske, težave in dvomi v zvezi s socialnovarstvenimi prejemki in še čem. Nudimo vam tudi pomoč pri iskanju in izpolnjevanju različnih obrazcev. V težavah nas pokličite na telefon 082 058 457 ali pišite na e-naslov mck@luniverza.si.', '13', '0', null, '2016-12-26 07:13:28', '1', '1', '0', null, null, null, null, null), ('18', '2016-12-02 20:36:17', 'Skupina za samopomoč TRNULJČICE', 'Tedenska prijateljska srečanja za starejše, ki si želijo druženja, odkritega in spoštljivega pogovora ter človeške bližine. Informacije in prijava na e-naslov info@drustvo-zrokovroki.si ali telefon 051 425 351 (Eva).', '13', '0', null, null, '1', '0', '0', null, '1', null, null, '1'), ('19', '2016-12-04 10:16:39', 'Joga - vadba za telo, um in duha', 'Formiramo novo skupino, ki bo pričela v decembru in potekala do konca januarja. ', '14', '0', null, '2016-12-25 16:05:23', '1', '1', '0', null, null, null, null, null), ('22', '2016-12-15 21:11:05', 'Planinarjenje', 'Vsak dan druga gora', '9', '0', null, null, null, '0', '0', null, null, null, null, null), ('23', null, 'Testna', '', '5', '1', null, '2017-01-14 07:47:30', '0', '1', '0', '', '1', '2', '2', '1'), ('24', null, 'Astrološka delavnica', 'Astrologija nam odpira razumevanje kozmičnih vplivov planetov. Predavanje Tadeja Šinka.', null, '0', '2017-01-05 14:45:37', null, '1', '0', '1', 'Predavanje Tadeja Šinka.', '1', null, null, '2'), ('25', null, 'Nova testna aktivnost', 'Tale je povsem namenjena testiranju v vseh oblikah in variantah.', '13', '1', null, null, '1', '0', '0', 'Na kratko ne povemo nič v tem primeru..', '1', '5', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for citizenship
-- ----------------------------
DROP TABLE IF EXISTS `citizenship`;
CREATE TABLE `citizenship` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name_UNIQUE` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of citizenship
-- ----------------------------
BEGIN;
INSERT INTO `citizenship` VALUES ('1', 'Slovensko');
COMMIT;

-- ----------------------------
-- Table structure for commune
-- ----------------------------
DROP TABLE IF EXISTS `commune`;
CREATE TABLE `commune` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name_UNIQUE` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of commune
-- ----------------------------
BEGIN;
INSERT INTO `commune` VALUES ('1', 'Občina Kranj');
COMMIT;

-- ----------------------------
-- Table structure for e_person
-- ----------------------------
DROP TABLE IF EXISTS `e_person`;
CREATE TABLE `e_person` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`person_id`  int(11) NOT NULL ,
`event_id`  int(11) NOT NULL ,
`cDate`  datetime NULL DEFAULT CURRENT_TIMESTAMP ,
`oDate`  datetime NULL DEFAULT NULL ,
`note`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`aDate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
UNIQUE INDEX `index4` (`person_id`, `event_id`) USING BTREE ,
INDEX `fk_e_person_1_idx` (`event_id`) USING BTREE ,
INDEX `fk_e_person_2_idx` (`person_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=339

;

-- ----------------------------
-- Records of e_person
-- ----------------------------
BEGIN;
INSERT INTO `e_person` VALUES ('1', '1060', '193', '2016-12-02 19:38:20', null, null, null), ('2', '1060', '194', '2016-12-02 19:38:20', null, null, null), ('3', '1060', '195', '2016-12-02 19:38:20', null, null, null), ('4', '1060', '196', '2016-12-02 19:38:20', null, null, null), ('5', '1060', '198', '2016-12-02 19:38:20', null, null, null), ('6', '1060', '202', '2016-12-02 19:38:20', null, null, null), ('7', '1060', '201', '2016-12-02 19:38:21', null, null, null), ('8', '1060', '199', '2016-12-02 19:38:21', null, null, null), ('9', '1060', '200', '2016-12-02 19:38:21', null, null, null), ('10', '1060', '203', '2016-12-02 19:38:21', null, null, null), ('11', '1060', '197', '2016-12-02 19:38:21', null, null, null), ('12', '1006', '229', '2016-12-02 20:41:50', null, null, null), ('13', '1006', '233', '2016-12-02 20:41:50', null, null, null), ('14', '1006', '230', '2016-12-02 20:41:50', null, null, null), ('15', '1006', '234', '2016-12-02 20:41:50', null, null, null), ('16', '1006', '231', '2016-12-02 20:41:50', null, null, null), ('17', '1006', '235', '2016-12-02 20:41:50', null, null, null), ('18', '1006', '232', '2016-12-02 20:41:50', null, null, null), ('19', '1006', '236', '2016-12-02 20:41:50', null, null, null), ('20', '1006', '237', '2016-12-02 20:41:50', null, null, null), ('21', '1006', '238', '2016-12-02 20:41:50', null, null, null), ('22', '1006', '239', '2016-12-02 20:41:50', null, null, null), ('23', '1003', '226', '2016-12-02 20:42:02', null, null, null), ('24', '1003', '227', '2016-12-02 20:42:02', '2016-12-15 21:20:04', null, null), ('25', '1003', '228', '2016-12-02 20:42:02', null, null, null), ('26', '1072', '226', '2016-12-02 20:52:07', null, null, null), ('27', '1072', '228', '2016-12-02 20:52:07', null, null, null), ('28', '1072', '227', '2016-12-02 20:52:07', null, null, '2016-12-15 21:19:56'), ('29', '1018', '288', '2016-12-02 22:07:18', null, null, null), ('30', '1018', '289', '2016-12-02 22:07:18', null, null, null), ('31', '1018', '294', '2016-12-02 22:07:18', null, null, null), ('32', '1018', '296', '2016-12-02 22:07:18', null, null, null), ('33', '1018', '291', '2016-12-02 22:07:18', null, null, null), ('34', '1018', '290', '2016-12-02 22:07:18', null, null, null), ('35', '1018', '295', '2016-12-02 22:07:18', null, null, null), ('36', '1018', '292', '2016-12-02 22:07:18', null, null, null), ('37', '1018', '297', '2016-12-02 22:07:18', null, null, null), ('38', '1018', '293', '2016-12-02 22:07:19', null, null, '2016-12-15 21:20:25'), ('39', '1018', '298', '2016-12-02 22:07:19', null, null, null), ('40', '1018', '299', '2016-12-02 22:07:19', null, null, null), ('41', '1018', '300', '2016-12-02 22:07:19', null, null, null), ('42', '1018', '240', '2016-12-02 22:07:19', null, null, '2016-12-15 21:25:40'), ('43', '1018', '301', '2016-12-02 22:07:19', null, null, null), ('44', '1018', '241', '2016-12-02 22:07:19', null, null, null), ('45', '1018', '302', '2016-12-02 22:07:19', null, null, null), ('46', '1018', '283', '2016-12-02 22:07:19', null, null, null), ('47', '1018', '284', '2016-12-02 22:07:19', '2016-12-20 15:34:17', null, null), ('48', '1018', '285', '2016-12-02 22:07:19', null, null, null), ('49', '1018', '286', '2016-12-02 22:07:19', null, null, null), ('50', '1018', '287', '2016-12-02 22:07:19', null, null, null), ('51', '1084', '213', '2016-12-02 22:07:41', null, null, null), ('52', '1084', '204', '2016-12-02 22:07:41', null, null, '2016-12-15 21:24:27'), ('53', '1084', '214', '2016-12-02 22:07:41', null, null, null), ('54', '1084', '205', '2016-12-02 22:07:41', null, null, null), ('55', '1084', '206', '2016-12-02 22:07:41', null, null, null), ('56', '1084', '207', '2016-12-02 22:07:41', null, null, null), ('57', '1084', '208', '2016-12-02 22:07:41', null, null, null), ('58', '1084', '209', '2016-12-02 22:07:41', null, null, null), ('59', '1084', '210', '2016-12-02 22:07:41', null, null, null), ('60', '1084', '212', '2016-12-02 22:07:41', null, null, null), ('61', '1084', '211', '2016-12-02 22:07:41', null, null, null), ('62', '1087', '277', '2016-12-02 22:08:13', null, null, null), ('63', '1087', '278', '2016-12-02 22:08:13', null, null, null), ('64', '1087', '279', '2016-12-02 22:08:13', null, null, null), ('65', '1087', '280', '2016-12-02 22:08:13', null, null, null), ('66', '1087', '281', '2016-12-02 22:08:13', null, null, null), ('67', '1087', '282', '2016-12-02 22:08:13', null, null, null), ('68', '1087', '262', '2016-12-02 22:08:13', null, null, null), ('69', '1087', '273', '2016-12-02 22:08:13', null, null, null), ('70', '1087', '274', '2016-12-02 22:08:13', null, null, null), ('71', '1087', '275', '2016-12-02 22:08:13', null, null, null), ('72', '1087', '276', '2016-12-02 22:08:13', null, null, null), ('73', '1049', '233', '2016-12-03 15:44:18', null, null, null), ('74', '1049', '229', '2016-12-03 15:44:18', null, null, null), ('75', '1049', '234', '2016-12-03 15:44:18', null, null, null), ('76', '1049', '236', '2016-12-03 15:44:18', null, null, null), ('77', '1049', '230', '2016-12-03 15:44:18', null, null, null), ('78', '1049', '235', '2016-12-03 15:44:18', null, null, null), ('79', '1049', '232', '2016-12-03 15:44:18', null, null, null), ('80', '1049', '237', '2016-12-03 15:44:18', null, null, null), ('81', '1049', '238', '2016-12-03 15:44:18', null, null, null), ('82', '1049', '239', '2016-12-03 15:44:18', null, null, null), ('83', '1049', '231', '2016-12-03 15:44:18', null, null, null), ('84', '1106', '303', '2016-12-04 10:18:32', null, null, null), ('85', '1106', '304', '2016-12-04 10:18:32', null, null, null), ('86', '1106', '305', '2016-12-04 10:18:32', null, null, null), ('87', '1106', '306', '2016-12-04 10:18:32', null, null, null), ('88', '1106', '307', '2016-12-04 10:18:32', null, null, null), ('89', '1106', '308', '2016-12-04 10:18:32', null, null, null), ('90', '1106', '309', '2016-12-04 10:18:32', null, null, null), ('91', '1106', '310', '2016-12-04 10:18:32', '2017-01-05 14:38:45', null, '2017-01-05 15:05:41'), ('92', '1106', '311', '2016-12-04 10:18:32', null, null, '2017-01-14 15:22:51'), ('93', '1106', '312', '2016-12-04 10:18:32', null, null, '2017-01-14 15:22:52'), ('94', '1106', '313', '2016-12-04 10:18:32', null, null, null), ('95', '1006', '241', '2016-12-04 12:09:33', null, null, null), ('96', '1006', '293', '2016-12-04 12:09:33', null, null, '2016-12-15 21:20:26'), ('97', '1006', '294', '2016-12-04 12:09:33', null, null, null), ('98', '1006', '295', '2016-12-04 12:09:33', null, null, null), ('99', '1006', '296', '2016-12-04 12:09:33', null, null, null), ('100', '1006', '297', '2016-12-04 12:09:33', null, null, null);
INSERT INTO `e_person` VALUES ('101', '1006', '298', '2016-12-04 12:09:33', null, null, null), ('102', '1006', '299', '2016-12-04 12:09:33', null, null, null), ('103', '1006', '300', '2016-12-04 12:09:33', null, null, null), ('104', '1006', '301', '2016-12-04 12:09:33', null, null, null), ('105', '1006', '302', '2016-12-04 12:09:34', null, null, null), ('114', '1054', '283', '2016-12-13 18:40:54', null, null, null), ('115', '1054', '284', '2016-12-13 18:40:54', null, null, '2016-12-20 15:34:16'), ('116', '1054', '240', '2016-12-13 18:40:54', null, null, '2016-12-15 21:25:39'), ('117', '1054', '285', '2016-12-13 18:40:54', null, null, null), ('118', '1054', '286', '2016-12-13 18:40:54', null, null, null), ('119', '1054', '287', '2016-12-13 18:40:54', null, null, null), ('120', '1054', '288', '2016-12-13 18:40:54', null, null, null), ('121', '1054', '289', '2016-12-13 18:40:54', null, null, null), ('122', '1054', '290', '2016-12-13 18:40:54', null, null, null), ('123', '1054', '291', '2016-12-13 18:40:54', null, null, null), ('124', '1054', '292', '2016-12-13 18:40:54', null, null, null), ('125', '1054', '215', '2016-12-14 16:15:56', null, null, null), ('126', '1054', '216', '2016-12-14 16:15:56', '2016-12-14 17:56:53', null, null), ('127', '1054', '217', '2016-12-14 16:15:56', null, null, null), ('128', '1054', '218', '2016-12-14 16:15:56', null, null, null), ('129', '1054', '219', '2016-12-14 16:15:56', null, null, null), ('130', '1054', '220', '2016-12-14 16:15:56', null, null, '2017-01-11 12:06:33'), ('131', '1054', '221', '2016-12-14 16:15:56', null, null, null), ('132', '1054', '222', '2016-12-14 16:15:56', null, null, null), ('133', '1054', '223', '2016-12-14 16:15:56', null, null, null), ('134', '1054', '224', '2016-12-14 16:15:56', null, null, null), ('135', '1054', '225', '2016-12-14 16:15:56', null, null, null), ('136', '1107', '204', '2016-12-14 17:54:23', null, null, null), ('137', '1107', '205', '2016-12-14 17:54:23', null, null, null), ('138', '1107', '206', '2016-12-14 17:54:23', null, null, null), ('139', '1107', '207', '2016-12-14 17:54:23', null, null, null), ('140', '1107', '209', '2016-12-14 17:54:23', null, null, null), ('141', '1107', '208', '2016-12-14 17:54:23', null, null, null), ('142', '1107', '210', '2016-12-14 17:54:23', null, null, null), ('143', '1107', '211', '2016-12-14 17:54:23', null, null, null), ('144', '1107', '212', '2016-12-14 17:54:23', null, null, null), ('145', '1107', '213', '2016-12-14 17:54:23', null, null, null), ('146', '1107', '214', '2016-12-14 17:54:23', null, null, null), ('147', '1060', '225', '2016-12-14 17:57:46', null, null, null), ('148', '1060', '217', '2016-12-14 17:57:46', null, null, null), ('149', '1060', '218', '2016-12-14 17:57:46', null, null, null), ('150', '1060', '219', '2016-12-14 17:57:46', null, null, null), ('151', '1060', '220', '2016-12-14 17:57:46', null, null, null), ('152', '1060', '221', '2016-12-14 17:57:46', null, null, null), ('153', '1060', '222', '2016-12-14 17:57:46', null, null, null), ('154', '1060', '223', '2016-12-14 17:57:46', null, null, null), ('155', '1060', '215', '2016-12-14 17:57:46', '2016-12-14 18:00:13', null, null), ('156', '1060', '224', '2016-12-14 17:57:46', null, null, null), ('157', '1060', '216', '2016-12-14 17:57:46', null, null, '2016-12-14 17:57:57'), ('158', '1108', '324', '2016-12-15 21:17:28', null, null, null), ('159', '1107', '324', '2016-12-15 21:17:42', null, null, null), ('160', '1108', '283', '2016-12-16 12:01:42', null, null, null), ('161', '1108', '240', '2016-12-16 12:01:42', '2016-12-20 16:11:05', null, null), ('162', '1108', '284', '2016-12-16 12:01:42', null, null, null), ('163', '1108', '286', '2016-12-16 12:01:42', null, null, null), ('164', '1108', '287', '2016-12-16 12:01:42', null, null, null), ('165', '1108', '285', '2016-12-16 12:01:42', null, null, null), ('166', '1108', '288', '2016-12-16 12:01:42', null, null, null), ('167', '1108', '289', '2016-12-16 12:01:42', null, null, null), ('168', '1108', '290', '2016-12-16 12:01:42', null, null, null), ('169', '1108', '291', '2016-12-16 12:01:42', null, null, null), ('170', '1108', '292', '2016-12-16 12:01:42', null, null, null), ('172', '1083', '208', '2016-12-23 14:37:19', null, null, null), ('173', '1060', '304', '2016-12-27 11:54:13', null, null, null), ('174', '1054', '205', '2017-01-04 09:18:44', null, null, null), ('175', '1054', '210', '2017-01-04 09:18:44', null, null, null), ('179', '1054', '212', '2017-01-04 09:18:44', null, null, null), ('180', '1054', '208', '2017-01-04 09:18:44', null, null, null), ('181', '1054', '213', '2017-01-04 09:18:44', null, null, null), ('182', '1054', '209', '2017-01-04 09:18:44', null, null, null), ('183', '1054', '214', '2017-01-04 09:18:44', null, null, null), ('184', '1054', '204', '2017-01-04 09:18:44', null, null, null), ('185', '1054', '194', '2017-01-04 09:20:00', null, null, null), ('186', '1054', '193', '2017-01-04 09:38:15', null, null, null), ('188', '1054', '195', '2017-01-04 09:38:15', null, null, null), ('189', '1054', '196', '2017-01-04 09:38:15', null, null, null), ('190', '1054', '197', '2017-01-04 09:38:15', null, null, null), ('191', '1054', '198', '2017-01-04 09:38:15', null, null, null), ('192', '1054', '199', '2017-01-04 09:38:15', null, null, null), ('193', '1054', '200', '2017-01-04 09:38:15', null, null, null), ('194', '1054', '201', '2017-01-04 09:38:15', null, null, null), ('195', '1054', '202', '2017-01-04 09:38:15', null, null, null), ('196', '1054', '203', '2017-01-04 09:38:15', null, null, null), ('198', '22', '201', '2017-01-08 15:02:16', null, null, '2017-01-14 13:52:14'), ('199', '22', '200', '2017-01-08 15:04:42', null, null, null), ('200', '22', '199', '2017-01-08 16:22:42', null, null, null), ('203', '22', '197', '2017-01-08 16:24:12', null, null, null), ('204', '22', '196', '2017-01-08 16:24:16', null, null, null), ('205', '1079', '286', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('206', '1079', '297', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('207', '1079', '291', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('208', '1079', '287', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('209', '1079', '240', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('210', '1079', '298', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('211', '1079', '288', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('212', '1079', '292', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('213', '1079', '241', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('214', '1079', '299', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('215', '1079', '293', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('216', '1079', '289', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null);
INSERT INTO `e_person` VALUES ('217', '1079', '300', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('218', '1079', '283', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('219', '1079', '294', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('220', '1079', '290', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('221', '1079', '295', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('222', '1079', '301', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('223', '1079', '284', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('224', '1079', '296', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('225', '1079', '302', '2017-01-08 16:29:33', '2017-01-08 18:05:04', null, null), ('226', '1079', '285', '2017-01-08 16:29:33', '2017-01-08 17:42:11', null, null), ('227', '22', '323', '2017-01-08 18:07:45', null, null, null), ('228', '22', '193', '2017-01-08 18:07:55', '2017-01-08 19:15:30', null, null), ('229', '22', '195', '2017-01-08 18:07:55', null, null, null), ('230', '22', '194', '2017-01-08 18:07:55', null, null, '2017-01-09 07:09:44'), ('233', '22', '198', '2017-01-08 18:07:55', null, null, null), ('237', '22', '202', '2017-01-08 18:07:55', null, null, null), ('238', '22', '203', '2017-01-08 18:07:55', null, null, null), ('239', '22', '286', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('240', '22', '297', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('241', '22', '240', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('242', '22', '298', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('243', '22', '291', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('244', '22', '287', '2017-01-08 18:25:10', '2017-01-08 18:30:48', null, null), ('245', '22', '292', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('246', '22', '241', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('247', '22', '299', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('248', '22', '288', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('249', '22', '293', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('250', '22', '289', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('251', '22', '300', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('252', '22', '283', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('253', '22', '294', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('254', '22', '284', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('255', '22', '290', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('256', '22', '301', '2017-01-08 18:25:11', '2017-01-08 18:30:48', null, null), ('257', '22', '295', '2017-01-08 18:25:12', '2017-01-08 18:30:48', null, null), ('258', '22', '285', '2017-01-08 18:25:12', '2017-01-08 18:30:48', null, null), ('259', '22', '302', '2017-01-08 18:25:12', null, null, '2017-01-14 12:44:19'), ('260', '22', '296', '2017-01-08 18:25:12', '2017-01-08 18:30:48', null, null), ('272', '1107', '193', '2017-01-08 18:52:57', null, null, null), ('325', '1107', '308', '2017-01-09 21:27:03', null, null, null), ('326', '1030', '313', '2017-01-09 21:39:44', null, null, null), ('327', '1107', '220', '2017-01-11 05:36:58', null, null, '2017-01-11 12:06:34'), ('328', '1107', '215', '2017-01-11 05:37:44', null, null, null), ('329', '1107', '216', '2017-01-11 05:37:44', null, null, null), ('330', '1107', '217', '2017-01-11 05:37:44', null, null, null), ('331', '1107', '218', '2017-01-11 05:37:44', null, null, null), ('332', '1107', '219', '2017-01-11 05:37:44', null, null, null), ('334', '1107', '222', '2017-01-11 05:37:44', null, null, null), ('335', '1107', '221', '2017-01-11 05:37:44', null, null, null), ('336', '1107', '223', '2017-01-11 05:37:44', null, null, null), ('337', '1107', '224', '2017-01-11 05:37:44', null, null, null), ('338', '1107', '225', '2017-01-11 05:37:44', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name_UNIQUE` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of education
-- ----------------------------
BEGIN;
INSERT INTO `education` VALUES ('2', 'OŠ'), ('4', 'Srednješolska');
COMMIT;

-- ----------------------------
-- Table structure for errors
-- ----------------------------
DROP TABLE IF EXISTS `errors`;
CREATE TABLE `errors` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`gui`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`msg`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`company_id`  int(11) NULL DEFAULT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`fDate`  timestamp NULL DEFAULT NULL ,
`response`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=18

;

-- ----------------------------
-- Records of errors
-- ----------------------------
BEGIN;
INSERT INTO `errors` VALUES ('1', ' scheduler', 'Ob kliku na dogodek bi se morala prikazati forma za urjejanje dogodka, kot modalno okno ali pa tudi ne.', '1', '2016-12-02 20:21:20', '2016-12-04 20:24:49', 'urejeno'), ('2', 'event form', 'Če naziv dogodka ni podan, je kopija naziva aktivnosti.', '1', '2016-12-02 20:34:23', null, null), ('3', 'event-view view', 'nekaj podatkov o osebi ali pa link na podrobnosti', '1', '2016-12-04 19:23:55', null, null), ('4', 'room schedule', 'paginator', '1', '2016-12-04 19:24:18', '2016-12-04 20:24:36', 'ni potrebe'), ('5', 'person teacher schedule', 'paginator', '1', '2016-12-04 19:24:26', '2016-12-04 20:24:25', 'uirejeno'), ('6', 'person member schedule', 'paginator', '1', '2016-12-04 19:24:34', '2016-12-04 20:18:03', 'urejeno'), ('7', 'person member schedule', 'pregled članov, vnos osebe', '1', '2016-12-04 19:24:54', null, null), ('8', 'room schedule', 'okjujuju', '1', '2016-12-14 18:03:13', null, null), ('9', 'template genlist', 'v uporabi naj bo kljukica', '1', '2016-12-21 15:59:58', null, null), ('10', 'room schedule', 'Pri pregledu kapacitet - prostori bi bilo ugodno (po default) privzeti prikaz zasedenosti vseh prostorov; če bi želeli spremljati posamezen prostor, bi kliknili izbiro \"ožji izbor\" in nato posameznen izbirni kvadratek. Pri prikazu smo sedaj vajeni, da so prostori na vodoravni osi, čas pa vertikalno. Tako je dober pregled nad prostorko zasedenostjo in morebitnim prekrivanjem. Lp Zoran', '1', '2016-12-27 12:24:07', null, null), ('11', 'activity form', 'Pri definiranju aktivnosti bi bilo ugodno, da bi s klikom izbire \"enkratni dogodek\" vse podatke o aktivnosti prenesli tudi na istoimenski dogodek in omogočil vpis podrobnosti zanj. Tako bi potrebne vnose močno zreducirali. Med potrebne parametre aktivnosti je potrebno uvrstiti parametra \"največje število udeležencev\" in \"število rezerv\" ter možnost vnosa Opombe (npr. \"Obvezna ležalka\"). Lp Zoran', '1', '2016-12-27 12:33:18', null, null), ('12', 'activity form', 'Vnos nove aktivnosti: V polju za izvajalca bi bilo poleg izbora obstoječega smiselno dodati možnost (bližnjico) za vnos novega (še neregistriranega) izvajalca; enako velja za najemnika. Lp Zoran', '1', '2016-12-27 14:30:24', null, null), ('13', ' scheduler', 'Pregled/Danes: v veliko pomoč bi bilo, če bi po horizontalni osi videli, v katerem prostoru so prikazana dogajanja. Verikalo je treba raztegniti do 20.00 ure. Dobrodošlo bi bilo tudi, če bi višino vrstic nekoliko zmanjšali, da bi več prišlo na mali ekran. Lp Zoran', '1', '2016-12-28 11:23:35', null, null), ('14', 'event form', 'Urejanje dogodka: Kot že omenjeno, je smiselno za vsako aktivnost avtomatsko pripraviti vsaj en dogodek tako, da se podatki ob določanju  posamezne aktivnosti avtomatično preprišejo v parametre dogodka, z dopisom manjkajočih informacij. Smiselno bi bilo, da se vnos vsake aktivnosti zaključi z definiranjem dogodka, sicer se lahko zgodi, da to spregledamo. Aktivnosti brez vsaj enega dogodka v načelu ne bi smelo biti.  Pri opredelitvi časovnega termina bi bilo smiselno ponuditi spustni meni za začetek (na 15 min. natančno) in konec, pri čemer bi program lahko ponudil standardne termine (npr. od 18.00 do 19.30 ure) in standardne prostore za posamezno aktivnost (npr. za vadbo sobo 10 ali 12). Lp Zoran', '1', '2016-12-28 13:32:49', null, null), ('15', 'event form', 'Urejanje/Določanje dogodka: Novo ustvarjeni dogodek naj ima status \"v pripravi\". Potrditve dogodkov bi bilo najbolje izvesti z enkratno masovno operacijo \"Aktiviranje dogodkov\" v sklopu (mesečnega) tabelaričnega pregleda dogodkov, ko bi se program za aktualni mesec zadnjič preverjal.  Šlo bi za kljukanje potrditvenih kvadratkov, kjer bi bilo privzeto, da je vsak dogodek v osnovi potrjen, če kljukice v kvadratku ne zbrišemo in tako dogodek izvzamemo iz aktiviranja. Druga stvar pa je preklic dogodka, ko je bil že aktiviran. Preklic ali aktiviranje naj bo sicer možno tudi pri določitvi dogodka. Lp Zoran', '1', '2016-12-28 13:56:18', null, null), ('16', ' scheduler', 'Vsi pregledi: glede na to, da bo večina uporabnikov program uporabljala na prenosnem računalniku s 15\'\' zaslonom, je primerno slikovne prikaze temu prilagoditi. Površino ekrana lahko bolje izkoristimo, če zapolnimo s podatki/izbirami celotno širino ekrana, v vertikalni smeri pa smo bolj varčni s prostorom (npr. z uporabo manjših fontov). Obstajati mora možnost izpisa na papir. Lp Zoran', '1', '2016-12-28 14:52:34', null, null), ('17', 'person form', 'Vnos nove osebe: treba je uvesti dodatno polje »Lokacija včlanitve«, glede na to, da se bodo na kranjski MC lahko včlanjevali tudi v Cerkljah, Predvoru in drugod. Lokacijo naj bo možno izbrati iz spustnega seznama z listo aktualnih lokacij.Lp Zoran', '1', '2016-12-28 16:25:30', null, null);
COMMIT;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'event name' ,
`content`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'additional content' ,
`room_id`  int(11) NULL DEFAULT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create date' ,
`starttime`  timestamp NULL DEFAULT NULL COMMENT 'start time of event' ,
`endtime`  timestamp NULL DEFAULT NULL COMMENT 'end time of event' ,
`isDay`  tinyint(1) NULL DEFAULT NULL COMMENT 'if 1 then this is all day event' ,
`activity_id`  int(11) NOT NULL ,
`mevent_id`  int(11) NULL DEFAULT NULL COMMENT 'master event id' ,
`oDate`  timestamp NULL DEFAULT NULL COMMENT 'date of event cancelation' ,
`aDate`  timestamp NULL DEFAULT NULL COMMENT 'date of event acceptance' ,
`isAcc`  tinyint(1) NULL DEFAULT NULL COMMENT 'is event cofirmed 1=yes ' ,
`isOff`  tinyint(1) NULL DEFAULT NULL COMMENT 'is event canceled 1=yes' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`mevent_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
INDEX `fk_event_2_idx` (`room_id`) USING BTREE ,
INDEX `fk_event_1_idx` (`activity_id`) USING BTREE ,
INDEX `fk_event_3_idx` (`mevent_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=353

;

-- ----------------------------
-- Records of event
-- ----------------------------
BEGIN;
INSERT INTO `event` VALUES ('193', 'Ponedeljkova delavnica', '', '14', '2016-12-02 19:36:17', '2016-12-05 17:00:00', '2016-12-05 19:30:00', null, '12', null, null, '2016-12-22 14:46:33', '1', null), ('194', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2016-12-12 17:00:00', '2016-12-12 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('195', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2016-12-19 17:00:00', '2016-12-19 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('196', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2016-12-26 17:00:00', '2016-12-26 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('197', 'Ponedeljkova delavnica', '', '14', '2016-12-02 19:36:45', '2017-01-02 17:00:00', '2017-01-02 19:30:00', null, '12', '193', '2017-01-09 10:07:11', '2017-01-04 08:49:10', '1', '1'), ('198', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-01-09 17:00:00', '2017-01-09 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('199', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-01-16 17:00:00', '2017-01-16 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('200', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-01-23 17:00:00', '2017-01-23 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('201', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-01-30 17:00:00', '2017-01-30 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('202', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-02-06 17:00:00', '2017-02-06 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('203', 'Ponedeljkova delavnica', '', '5', '2016-12-02 19:36:45', '2017-02-13 17:00:00', '2017-02-13 19:30:00', null, '12', '193', null, '2016-12-22 14:46:33', '1', null), ('204', 'Torkova delavnica', '', '13', '2016-12-02 19:45:25', '2016-12-06 09:00:00', '2016-12-06 10:00:00', null, '13', null, null, '2016-12-22 15:04:20', '1', null), ('205', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2016-12-13 09:00:00', '2016-12-13 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('206', 'Torkova delavnica', '', '8', '2016-12-02 19:46:14', '2016-12-20 09:00:00', '2016-12-20 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('207', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-01-03 09:00:00', '2017-01-03 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('208', 'Torkova delavnica', '', '13', '2016-12-02 19:46:14', '2016-12-27 09:00:00', '2016-12-27 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('209', 'Torkova delavnica', '', '15', '2016-12-02 19:46:14', '2017-01-10 15:30:00', '2017-01-10 16:30:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('210', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-01-17 09:00:00', '2017-01-17 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('211', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-01-24 09:00:00', '2017-01-24 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('212', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-01-31 09:00:00', '2017-01-31 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('213', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-02-07 09:00:00', '2017-02-07 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('214', 'Torkova delavnica', '', '5', '2016-12-02 19:46:14', '2017-02-14 09:00:00', '2017-02-14 10:00:00', null, '13', '204', null, '2016-12-22 15:04:20', '1', null), ('215', 'Sredina delavnica', '', '11', '2016-12-02 19:49:03', '2016-12-21 09:00:00', '2016-12-21 10:30:00', null, '14', null, null, '2017-01-11 05:36:43', '1', null), ('216', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2016-12-14 10:30:00', '2016-12-14 12:00:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('217', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2016-12-21 09:00:00', '2016-12-21 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('218', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2016-12-28 09:00:00', '2016-12-28 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('219', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2017-01-04 09:00:00', '2017-01-04 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('220', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2017-01-11 12:00:00', '2017-01-11 14:00:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('221', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2017-01-18 09:00:00', '2017-01-18 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('222', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2017-02-01 09:00:00', '2017-02-01 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('223', 'Sredina delavnica', '', '5', '2016-12-02 20:12:54', '2017-02-08 09:00:00', '2017-02-08 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('224', 'Sredina delavnica', '', '5', '2016-12-02 20:12:55', '2017-01-25 09:00:00', '2017-01-25 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('225', 'Sredina delavnica', '', '5', '2016-12-02 20:12:55', '2017-02-15 09:00:00', '2017-02-15 10:30:00', null, '14', '215', null, '2017-01-11 05:36:43', '1', null), ('226', 'Četrkova delavnica', '', '12', '2016-12-02 20:19:40', '2016-12-24 18:00:00', '2016-12-24 20:00:00', null, '15', null, null, null, null, null), ('227', 'Četrkova delavnica', '', '5', '2016-12-02 20:20:10', '2016-12-15 17:00:00', '2016-12-15 19:00:00', null, '15', '226', null, null, null, null), ('228', 'Četrkova delavnica', '', '5', '2016-12-02 20:20:10', '2016-12-22 17:00:00', '2016-12-22 19:00:00', null, '15', '226', null, null, null, null), ('229', 'Torkova delavnica', '', '14', '2016-12-02 20:25:13', '2016-12-23 10:00:00', '2016-12-23 12:00:00', null, '16', null, null, null, null, null), ('230', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2016-12-15 12:00:00', '2016-12-15 14:00:00', null, '16', '229', null, null, null, null), ('231', 'Torkova delavnica', '', '14', '2016-12-02 20:25:27', '2016-12-20 10:00:00', '2016-12-20 12:00:00', null, '16', '229', null, null, null, null), ('232', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2016-12-27 10:00:00', '2016-12-27 12:00:00', null, '16', '229', null, null, null, null), ('233', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-01-03 10:00:00', '2017-01-03 12:00:00', null, '16', '229', null, null, null, null), ('234', 'Torkova delavnica', '', '13', '2016-12-02 20:25:27', '2017-01-10 10:00:00', '2017-01-10 12:00:00', null, '16', '229', null, null, null, null), ('235', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-01-17 10:00:00', '2017-01-17 12:00:00', null, '16', '229', null, null, null, null), ('236', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-01-24 10:00:00', '2017-01-24 12:00:00', null, '16', '229', null, null, null, null), ('237', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-01-31 10:00:00', '2017-01-31 12:00:00', null, '16', '229', null, null, null, null), ('238', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-02-07 10:00:00', '2017-02-07 12:00:00', null, '16', '229', null, null, null, null), ('239', 'Torkova delavnica', '', '5', '2016-12-02 20:25:27', '2017-02-14 10:00:00', '2017-02-14 12:00:00', null, '16', '229', null, null, null, null), ('240', 'Info v torek', '', '8', '2016-12-02 20:29:14', '2016-12-20 12:00:00', '2016-12-20 14:00:00', null, '17', null, null, '2016-12-26 07:13:28', '1', null), ('241', 'Info v četrtek', '', '9', '2016-12-02 20:29:41', '2016-12-22 08:00:00', '2016-12-22 10:00:00', null, '17', null, null, '2016-12-26 07:13:28', '1', null), ('262', 'Ob torkih', '', '15', '2016-12-02 20:37:33', '2016-12-20 08:00:00', '2016-12-20 10:00:00', null, '18', null, null, null, null, null), ('273', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2016-12-13 15:30:00', '2016-12-13 17:30:00', null, '18', '262', '2017-01-08 09:24:30', null, null, '1'), ('274', 'Ob torkih', '', '10', '2016-12-02 20:39:40', '2016-12-20 08:00:00', '2016-12-20 10:00:00', null, '18', '262', null, null, null, null), ('275', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2016-12-27 08:00:00', '2016-12-27 10:00:00', null, '18', '262', null, null, null, null), ('276', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-01-03 08:00:00', '2017-01-03 10:00:00', null, '18', '262', '2017-01-09 10:08:18', '2017-01-09 10:08:15', '1', '1'), ('277', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-01-10 08:00:00', '2017-01-10 10:00:00', null, '18', '262', '2017-01-09 21:20:26', null, null, '1'), ('278', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-01-17 08:00:00', '2017-01-17 10:00:00', null, '18', '262', null, null, null, null), ('279', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-01-24 08:00:00', '2017-01-24 10:00:00', null, '18', '262', null, '2017-01-11 05:34:50', '1', null), ('280', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-01-31 08:00:00', '2017-01-31 10:00:00', null, '18', '262', null, null, null, null), ('281', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-02-07 08:00:00', '2017-02-07 10:00:00', null, '18', '262', null, null, null, null), ('282', 'Ob torkih', '', '6', '2016-12-02 20:39:40', '2017-02-14 08:00:00', '2017-02-14 10:00:00', null, '18', '262', null, null, null, null), ('283', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2016-12-14 12:30:00', '2016-12-14 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('284', 'Info v torek', '', '8', '2016-12-02 20:40:21', '2016-12-20 12:00:00', '2016-12-20 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('285', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2016-12-27 13:00:00', '2016-12-27 15:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('286', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-01-03 12:00:00', '2017-01-03 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('287', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-01-10 12:00:00', '2017-01-10 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('288', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-01-17 12:00:00', '2017-01-17 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('289', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-01-24 12:00:00', '2017-01-24 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('290', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-01-31 12:00:00', '2017-01-31 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('291', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-02-07 12:00:00', '2017-02-07 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('292', 'Info v torek', '', '5', '2016-12-02 20:40:21', '2017-02-14 12:00:00', '2017-02-14 14:00:00', null, '17', '240', null, '2016-12-26 07:13:28', '1', null), ('293', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2016-12-14 11:30:00', '2016-12-14 17:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('294', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2016-12-22 08:00:00', '2016-12-22 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('295', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2016-12-29 11:00:00', '2016-12-29 12:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('296', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-01-05 08:00:00', '2017-01-05 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('297', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-01-12 08:00:00', '2017-01-12 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('298', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-01-19 08:00:00', '2017-01-19 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('299', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-01-26 08:00:00', '2017-01-26 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('300', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-02-02 08:00:00', '2017-02-02 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('301', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-02-09 08:00:00', '2017-02-09 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('302', 'Info v četrtek', '', '5', '2016-12-02 20:40:28', '2017-02-16 08:00:00', '2017-02-16 10:00:00', null, '17', '241', null, '2016-12-26 07:13:28', '1', null), ('303', 'Vadba v četrtek', '', '13', '2016-12-04 10:17:22', '2016-12-21 08:00:00', '2016-12-21 09:30:00', null, '19', null, null, '2016-12-25 16:05:23', '1', null), ('304', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2016-12-08 08:00:00', '2016-12-08 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('305', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2016-12-15 08:00:00', '2016-12-15 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('306', 'Vadba v četrek', 'Še zadnje vaje pred Božičem.', '6', '2016-12-04 10:17:35', '2016-12-22 08:00:00', '2016-12-22 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('307', 'Vadba v četrek', 'Danes posebno prednovoletno vzdušje!', '6', '2016-12-04 10:17:35', '2016-12-29 08:00:00', '2016-12-29 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('308', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-01-19 08:00:00', '2017-01-19 09:30:00', null, '19', '303', '2017-01-11 05:34:45', '2016-12-25 16:05:23', '1', '1'), ('309', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-01-29 09:00:00', '2017-01-29 10:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('310', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-01-05 08:00:00', '2017-01-05 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('311', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-02-02 08:00:00', '2017-02-02 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('312', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-02-09 08:00:00', '2017-02-09 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('313', 'Vadba v četrek', '', '6', '2016-12-04 10:17:35', '2017-01-12 08:00:00', '2017-01-12 09:30:00', null, '19', '303', null, '2016-12-25 16:05:23', '1', null), ('323', 'štrikanje', '', '10', '2016-12-14 18:09:24', '2016-12-22 11:00:00', '2016-12-22 11:30:00', '1', '12', null, null, '2016-12-22 14:46:33', '1', '1'), ('324', 'Jošt nad Kranjem', 'Po Sodarci gor, po cesti dol', '8', '2016-12-15 21:13:11', '2016-12-24 11:00:00', '2016-12-24 19:00:00', null, '22', null, null, null, null, null), ('325', 'testni', 'preklicani', null, '2016-12-26 12:06:12', '2017-01-02 11:00:00', '2017-01-02 11:30:00', null, '23', null, null, '2017-01-14 07:47:30', '1', '0'), ('351', 'Astrološka delavnica ', 'predavanje', '12', '2016-12-27 12:09:08', '2016-12-30 19:00:00', '2016-12-30 20:30:00', null, '24', null, '2017-01-05 14:45:37', null, '1', '1'), ('352', 'Nova testna aktivnost', 'Tale je povsem namenjena testiranju v vseh oblikah in variantah.', null, '2017-01-14 08:01:20', '2017-01-14 11:00:00', '2017-01-14 12:00:00', null, '25', null, null, null, '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name of a kind' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of kind
-- ----------------------------
BEGIN;
INSERT INTO `kind` VALUES ('1', 'Testna vsebina 01'), ('2', 'Testna vsebina 02'), ('3', 'Testna 03'), ('4', 'Testna 04'), ('5', 'Vsebina 05');
COMMIT;

-- ----------------------------
-- Table structure for le_user
-- ----------------------------
DROP TABLE IF EXISTS `le_user`;
CREATE TABLE `le_user` (
`person_id`  tinyint(4) NULL DEFAULT NULL COMMENT 'person id' ,
`auth0_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'auth0_id' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'auth0 nickname' ,
`email`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'auth0 login email' ,
`cDate`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation date' ,
`active`  tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is user active' ,
`lDate`  timestamp NULL DEFAULT NULL COMMENT 'last login datetime' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of le_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`partner_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_partner_2` (`partner_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of location
-- ----------------------------
BEGIN;
INSERT INTO `location` VALUES ('1', 'Žirovnica', '2'), ('2', 'Bled', '3'), ('3', 'Škofja Loka', '4'), ('4', 'Cerklje', '1'), ('5', 'Kranj', '1');
COMMIT;

-- ----------------------------
-- Table structure for p_address
-- ----------------------------
DROP TABLE IF EXISTS `p_address`;
CREATE TABLE `p_address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`post_id`  int(11) NULL DEFAULT NULL ,
`person_id`  int(11) NULL DEFAULT NULL ,
`commune_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_c_address_person1_idx` (`person_id`) USING BTREE ,
INDEX `fk_c_address_person2_idx` (`commune_id`) USING BTREE ,
INDEX `fk_c_address_person3_idx` (`post_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of p_address
-- ----------------------------
BEGIN;
INSERT INTO `p_address` VALUES ('2', '2016-12-15 21:08:01', 'Ulica 4', '4', '1108', '1'), ('3', '2016-12-18 11:48:01', 'Zgornji breg 45', '4', '22', '1');
COMMIT;

-- ----------------------------
-- Table structure for p_citi
-- ----------------------------
DROP TABLE IF EXISTS `p_citi`;
CREATE TABLE `p_citi` (
`person_id`  int(11) NOT NULL ,
`citizenship_id`  int(11) NOT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`person_id`),
FOREIGN KEY (`citizenship_id`) REFERENCES `citizenship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
INDEX `fk_p_citi_person_idx` (`person_id`) USING BTREE ,
INDEX `fk_p_citi_citizenship1_idx` (`citizenship_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of p_citi
-- ----------------------------
BEGIN;
INSERT INTO `p_citi` VALUES ('22', '1', '2016-12-01 19:53:13'), ('1108', '1', '2016-12-15 21:07:24');
COMMIT;

-- ----------------------------
-- Table structure for p_edu
-- ----------------------------
DROP TABLE IF EXISTS `p_edu`;
CREATE TABLE `p_edu` (
`person_id`  int(11) NOT NULL ,
`education_id`  int(11) NOT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`person_id`),
FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
INDEX `fk_p_edu_person1_idx` (`person_id`) USING BTREE ,
INDEX `fk_p_edu_education1_idx` (`education_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of p_edu
-- ----------------------------
BEGIN;
INSERT INTO `p_edu` VALUES ('22', '2', '2016-12-01 19:53:13'), ('1107', '2', '2016-12-14 15:56:33'), ('1108', '2', '2016-12-15 21:08:01');
COMMIT;

-- ----------------------------
-- Table structure for p_email
-- ----------------------------
DROP TABLE IF EXISTS `p_email`;
CREATE TABLE `p_email` (
`person_id`  int(11) NOT NULL ,
`email`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`emailType`  int(11) NOT NULL ,
PRIMARY KEY (`person_id`, `emailType`),
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
INDEX `fk_p_email_person1_idx` (`person_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of p_email
-- ----------------------------
BEGIN;
INSERT INTO `p_email` VALUES ('13', 'učitelj.marko@tonimail.com', '2016-12-20 15:29:15', '1'), ('14', 'učitelj.tone@tonimail.com', '2016-12-20 15:29:15', '1'), ('15', 'univerzalni.pero@tonimail.com', '2016-12-20 15:29:15', '1'), ('16', 'univerzalni.france@tonimail.com', '2016-12-20 15:29:15', '1'), ('17', 'prosti.svit@tonimail.com', '2016-12-20 15:29:15', '1'), ('18', 'prosti.kvit@tonimail.com', '2016-12-20 15:29:15', '1'), ('19', 'tega.ni@tonimail.com', '2016-12-20 15:29:15', '1'), ('20', 'tapa.je@tonimail.com', '2016-12-20 15:29:15', '1'), ('21', 'darko.hribovc@tonimail.com', '2016-12-20 15:29:15', '1'), ('22', 'janez.lavric@gmail.com', '2016-12-05 21:00:51', '1'), ('23', 'micka.naša@tonimail.com', '2016-12-20 15:29:15', '1'), ('1000', 'casey.conley@tonimail.com', '2016-12-20 15:29:15', '1'), ('1001', 'tatum.boone@tonimail.com', '2016-12-20 15:29:15', '1'), ('1002', 'merrill.solomon@tonimail.com', '2016-12-20 15:29:15', '1'), ('1003', 'india.calderon@tonimail.com', '2016-12-20 15:29:15', '1'), ('1004', 'joy.alvarez@tonimail.com', '2016-12-20 15:29:15', '1'), ('1005', 'brenna.wood@tonimail.com', '2016-12-20 15:29:15', '1'), ('1006', 'lance.berg@tonimail.com', '2016-12-20 15:29:15', '1'), ('1007', 'xavier.velazquez@tonimail.com', '2016-12-20 15:29:15', '1'), ('1008', 'bianca.cabrera@tonimail.com', '2016-12-20 15:29:15', '1'), ('1009', 'yen.shelton@tonimail.com', '2016-12-20 15:29:15', '1'), ('1010', 'yoko.frank@tonimail.com', '2016-12-20 15:29:15', '1'), ('1011', 'basia.atkinson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1012', 'lacy.landry@tonimail.com', '2016-12-20 15:29:15', '1'), ('1013', 'janna.hopkins@tonimail.com', '2016-12-20 15:29:15', '1'), ('1014', 'harriet.english@tonimail.com', '2016-12-20 15:29:15', '1'), ('1015', 'lee.bridges@tonimail.com', '2016-12-20 15:29:15', '1'), ('1016', 'gregory.guthrie@tonimail.com', '2016-12-20 15:29:15', '1'), ('1017', 'hope.heath@tonimail.com', '2016-12-20 15:29:15', '1'), ('1018', 'thor.grant@tonimail.com', '2016-12-20 15:29:15', '1'), ('1019', 'jillian.head@tonimail.com', '2016-12-20 15:29:15', '1'), ('1020', 'gay.mccall@tonimail.com', '2016-12-20 15:29:15', '1'), ('1021', 'gemma.sampson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1022', 'evan.macias@tonimail.com', '2016-12-20 15:29:15', '1'), ('1023', 'doris.britt@tonimail.com', '2016-12-20 15:29:15', '1'), ('1024', 'maile.sweeney@tonimail.com', '2016-12-20 15:29:15', '1'), ('1025', 'prescott.holland@tonimail.com', '2016-12-20 15:29:15', '1'), ('1026', 'shea.rose@tonimail.com', '2016-12-20 15:29:15', '1'), ('1027', 'ryder.melendez@tonimail.com', '2016-12-20 15:29:15', '1'), ('1028', 'adrian.mcguire@tonimail.com', '2016-12-20 15:29:15', '1'), ('1029', 'chaim.farley@tonimail.com', '2016-12-20 15:29:15', '1'), ('1030', 'kimberly.beck@tonimail.com', '2016-12-20 15:29:15', '1'), ('1031', 'xenos.keller@tonimail.com', '2016-12-20 15:29:15', '1'), ('1032', 'martha.conley@tonimail.com', '2016-12-20 15:29:15', '1'), ('1033', 'cain.chandler@tonimail.com', '2016-12-20 15:29:15', '1'), ('1034', 'austin.melendez@tonimail.com', '2016-12-20 15:29:15', '1'), ('1035', 'lila.horton@tonimail.com', '2016-12-20 15:29:15', '1'), ('1036', 'colby.lamb@tonimail.com', '2016-12-20 15:29:15', '1'), ('1037', 'maia.moss@tonimail.com', '2016-12-20 15:29:15', '1'), ('1038', 'christen.dotson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1039', 'abdul.rodriguez@tonimail.com', '2016-12-20 15:29:15', '1'), ('1040', 'cheyenne.underwood@tonimail.com', '2016-12-20 15:29:15', '1'), ('1041', 'jamal.forbes@tonimail.com', '2016-12-20 15:29:15', '1'), ('1042', 'gillian.elliott@tonimail.com', '2016-12-20 15:29:15', '1'), ('1043', 'ocean.howard@tonimail.com', '2016-12-20 15:29:15', '1'), ('1044', 'macaulay.delgado@tonimail.com', '2016-12-20 15:29:15', '1'), ('1045', 'aimee.pratt@tonimail.com', '2016-12-20 15:29:15', '1'), ('1046', 'allistair.michael@tonimail.com', '2016-12-20 15:29:15', '1'), ('1047', 'herrod.holmes@tonimail.com', '2016-12-20 15:29:15', '1'), ('1048', 'brennan.malone@tonimail.com', '2016-12-20 15:29:15', '1'), ('1049', 'angelica.rosales@tonimail.com', '2016-12-20 15:29:15', '1'), ('1050', 'rudyard.pacheco@tonimail.com', '2016-12-20 15:29:15', '1'), ('1051', 'akeem.guerra@tonimail.com', '2016-12-20 15:29:15', '1'), ('1052', 'malik.wright@tonimail.com', '2016-12-20 15:29:15', '1'), ('1053', 'hanna.park@tonimail.com', '2016-12-20 15:29:15', '1'), ('1054', 'gwendolyna.alexander@tonimail.com', '2016-12-20 15:29:15', '1'), ('1055', 'martena.nichols@tonimail.com', '2016-12-20 15:29:15', '1'), ('1056', 'jenna.vaughn@tonimail.com', '2016-12-20 15:29:15', '1'), ('1057', 'graiden.miles@tonimail.com', '2016-12-20 15:29:15', '1'), ('1058', 'gareth.robertson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1059', 'jelani.price@tonimail.com', '2016-12-20 15:29:15', '1'), ('1060', 'nora.barber@tonimail.com', '2016-12-20 15:29:15', '1'), ('1061', 'bruce.spence@tonimail.com', '2016-12-20 15:29:15', '1'), ('1062', 'chloe.peterson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1063', 'alana.wiley@tonimail.com', '2016-12-20 15:29:15', '1'), ('1064', 'wynter.porter@tonimail.com', '2016-12-20 15:29:15', '1'), ('1065', 'reece.hewitt@tonimail.com', '2016-12-20 15:29:15', '1'), ('1066', 'norman.stevens@tonimail.com', '2016-12-20 15:29:15', '1'), ('1067', 'anne.delaney@tonimail.com', '2016-12-20 15:29:15', '1'), ('1068', 'paki.valencia@tonimail.com', '2016-12-20 15:29:15', '1'), ('1069', 'brett.buchanan@tonimail.com', '2016-12-20 15:29:15', '1'), ('1070', 'naomi.lynn@tonimail.com', '2016-12-20 15:29:15', '1'), ('1071', 'basil.williams@tonimail.com', '2016-12-20 15:29:15', '1'), ('1072', 'drake.bean@tonimail.com', '2016-12-20 15:29:15', '1'), ('1073', 'althea.ellis@tonimail.com', '2016-12-20 15:29:15', '1'), ('1074', 'bevis.nolan@tonimail.com', '2016-12-20 15:29:15', '1'), ('1075', 'jesse.watkins@tonimail.com', '2016-12-20 15:29:15', '1'), ('1076', 'randall.gallegos@tonimail.com', '2016-12-20 15:29:15', '1'), ('1077', 'quinn.garrison@tonimail.com', '2016-12-20 15:29:15', '1'), ('1078', 'lani.nash@tonimail.com', '2016-12-20 15:29:15', '1'), ('1079', 'tarik.bass@tonimail.com', '2016-12-20 15:29:15', '1'), ('1080', 'kuame.daniels@tonimail.com', '2016-12-20 15:29:15', '1'), ('1081', 'moses.carlson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1082', 'amery.gill@tonimail.com', '2016-12-20 15:29:15', '1'), ('1083', 'pamela.mcconnell@tonimail.com', '2016-12-20 15:29:15', '1'), ('1084', 'allegra.stanton@tonimail.com', '2016-12-20 15:29:15', '1'), ('1085', 'dara.yang@tonimail.com', '2016-12-20 15:29:15', '1'), ('1086', 'rebecca.jones@tonimail.com', '2016-12-20 15:29:15', '1'), ('1087', 'hu.wilder@tonimail.com', '2016-12-20 15:29:15', '1'), ('1088', 'libby.davidson@tonimail.com', '2016-12-20 15:29:15', '1');
INSERT INTO `p_email` VALUES ('1089', 'dakota.sawyer@tonimail.com', '2016-12-20 15:29:15', '1'), ('1090', 'quin.watson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1091', 'hillary.hutchinson@tonimail.com', '2016-12-20 15:29:15', '1'), ('1092', 'hector.kirby@tonimail.com', '2016-12-20 15:29:15', '1'), ('1093', 'illana.campos@tonimail.com', '2016-12-20 15:29:15', '1'), ('1094', 'lacy.weber@tonimail.com', '2016-12-20 15:29:15', '1'), ('1095', 'jasmine.raymond@tonimail.com', '2016-12-20 15:29:15', '1'), ('1096', 'erich.simmons@tonimail.com', '2016-12-20 15:29:15', '1'), ('1097', 'thaddeus.england@tonimail.com', '2016-12-20 15:29:15', '1'), ('1098', 'amal.smith@tonimail.com', '2016-12-20 15:29:15', '1'), ('1099', 'ulla.ferrell@tonimail.com', '2016-12-20 15:29:15', '1'), ('1102', 'iris.šober@tonimail.com', '2016-12-20 15:29:15', '1'), ('1103', 'gospodična.mična@tonimail.com', '2016-12-20 15:29:15', '1'), ('1104', 'striček.matiček@tonimail.com', '2016-12-20 15:29:15', '1'), ('1105', 'eva.trnuljčica@tonimail.com', '2016-12-20 15:29:15', '1'), ('1106', 'slavka.mamka@tonimail.com', '2016-12-20 15:29:15', '1'), ('1107', 'a@b.com', '2016-12-20 15:21:45', '1'), ('1108', 'a@b.com', '2016-12-15 21:08:25', '1'), ('1109', 'janez.dvanez@tonimail.com', '2016-12-20 15:29:15', '1');
COMMIT;

-- ----------------------------
-- Table structure for p_phone
-- ----------------------------
DROP TABLE IF EXISTS `p_phone`;
CREATE TABLE `p_phone` (
`person_id`  int(11) NOT NULL ,
`number`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`numberType`  int(11) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`person_id`, `numberType`),
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
INDEX `fk_p_phone_person1_idx` (`person_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of p_phone
-- ----------------------------
BEGIN;
INSERT INTO `p_phone` VALUES ('21', '+386512789456', '2016-11-26 16:49:30', '1'), ('22', '041590295', '2016-12-05 21:00:51', '1'), ('1004', '2134', '2016-12-20 15:20:09', '1'), ('1054', '123', '2016-12-18 09:22:16', '1'), ('1107', '45234534', '2016-12-20 15:21:45', '1'), ('1108', '1345678946', '2016-12-15 21:08:25', '1'), ('1110', '12345', '2017-01-06 20:30:50', '1');
COMMIT;

-- ----------------------------
-- Table structure for p_stat
-- ----------------------------
DROP TABLE IF EXISTS `p_stat`;
CREATE TABLE `p_stat` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`person_id`  int(11) NOT NULL ,
`statement_id`  int(11) NOT NULL ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`location_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`statement_id`) REFERENCES `statement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_p_stat_person1_idx` (`person_id`) USING BTREE ,
INDEX `fk_p_stat_statement1_idx` (`statement_id`) USING BTREE ,
INDEX `fk_location_1` (`location_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of p_stat
-- ----------------------------
BEGIN;
INSERT INTO `p_stat` VALUES ('3', '22', '1', '2017-01-06 19:53:15', '4'), ('4', '22', '1', '2017-01-06 20:00:41', '3'), ('5', '1054', '1', '2017-01-06 20:12:04', '4'), ('6', '1054', '1', '2017-01-06 20:12:26', '5'), ('7', '1054', '1', '2017-01-06 20:29:12', '1');
COMMIT;

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`isMain`  tinyint(1) NULL DEFAULT 0 ,
`short`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of partner
-- ----------------------------
BEGIN;
INSERT INTO `partner` VALUES ('1', 'MC Kranj', '1', 'KR'), ('2', 'MC Jesenice', '0', 'JES'), ('3', 'MC Radovljica', '0', 'RAD'), ('4', 'MC Škofja Loka', '0', 'ŠKL');
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`firstName`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lastName`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`birthDate`  datetime NULL DEFAULT CURRENT_TIMESTAMP ,
`cDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
`isTeacher`  tinyint(1) NULL DEFAULT 0 ,
`isVolunteer`  tinyint(1) NULL DEFAULT 0 ,
`isMember`  tinyint(1) NULL DEFAULT 0 ,
`isEmployee`  tinyint(1) NULL DEFAULT 0 ,
`isRenter`  tinyint(1) NULL DEFAULT 0 ,
`sex`  tinyint(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1111

;

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO `person` VALUES ('13', 'Učitelj', 'Marko', null, '2016-11-24 08:23:02', '1', '0', '0', '0', '0', null), ('14', 'Učitelj', 'Tone', null, '2016-11-24 08:23:02', '1', '0', '0', '0', '0', null), ('15', 'Univerzalni', 'Pero', null, '2016-11-24 08:23:02', '1', '1', '0', '0', '0', null), ('16', 'Univerzalni', 'France', null, '2016-11-24 08:23:02', '1', '1', '0', '0', '0', null), ('17', 'Prosti', 'Svit', null, '2016-11-24 08:23:02', '0', '1', '0', '0', '0', null), ('18', 'Prosti', 'Kvit', null, '2016-11-24 08:23:02', '0', '1', '0', '0', '0', null), ('19', 'Tega', 'Ni', null, '2016-11-24 08:23:02', '0', '0', '0', '0', '0', null), ('20', 'Tapa', 'Je', null, '2016-11-24 08:23:02', '0', '0', '1', '0', '0', null), ('21', 'Darko', 'Hribovc', '2016-11-01 00:00:00', '2016-11-26 16:49:30', '1', '0', '0', '0', '0', null), ('22', 'Janez2', 'Banez2', '2016-12-08 00:00:00', '2016-12-01 19:53:13', '0', '1', '1', '0', '0', null), ('23', 'Micka', 'Naša', '2016-12-08 00:00:00', '2016-12-01 19:53:29', '0', '1', '0', '0', '0', null), ('1000', 'Casey', 'Conley', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1001', 'Tatum', 'Boone', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1002', 'Merrill', 'Solomon', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1003', 'India', 'Calderon', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1004', 'Joy', 'Alvarez', '2016-12-02 00:00:00', '2016-12-02 13:43:53', '1', '1', '1', '1', '1', null), ('1005', 'Brenna', 'Wood', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1006', 'Lance', 'Berg', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1007', 'Xavier', 'Velazquez', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1008', 'Bianca', 'Cabrera', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1009', 'Yen', 'Shelton', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1010', 'Yoko', 'Frank', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1011', 'Basia', 'Atkinson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1012', 'Lacy', 'Landry', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1013', 'Janna', 'Hopkins', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1014', 'Harriet', 'English', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1015', 'Lee', 'Bridges', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1016', 'Gregory', 'Guthrie', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1017', 'Hope', 'Heath', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1018', 'Thor', 'Grant', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1019', 'Jillian', 'Head', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1020', 'Gay', 'Mccall', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1021', 'Gemma', 'Sampson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1022', 'Evan', 'Macias', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1023', 'Doris', 'Britt', '2016-12-02 00:00:00', '2016-12-02 13:43:53', '0', '0', '0', '0', '1', null), ('1024', 'Maile', 'Sweeney', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1025', 'Prescott', 'Holland', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1026', 'Shea', 'Rose', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1027', 'Ryder', 'Melendez', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1028', 'Adrian', 'Mcguire', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1029', 'Chaim', 'Farley', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1030', 'Kimberly', 'Beck', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1031', 'Xenos', 'Keller', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1032', 'Martha', 'Conley', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1033', 'Cain', 'Chandler', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1034', 'Austin', 'Melendez', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1035', 'Lila', 'Horton', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1036', 'Colby', 'Lamb', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1037', 'Maia', 'Moss', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1038', 'Christen', 'Dotson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1039', 'Abdul', 'Rodriguez', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1040', 'Cheyenne', 'Underwood', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1041', 'Jamal', 'Forbes', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1042', 'Gillian', 'Elliott', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1043', 'Ocean', 'Howard', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1044', 'Macaulay', 'Delgado', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1045', 'Aimee', 'Pratt', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1046', 'Allistair', 'Michael', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1047', 'Herrod', 'Holmes', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1048', 'Brennan', 'Malone', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1049', 'Angelica', 'Rosales', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1050', 'Rudyard', 'Pacheco', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1051', 'Akeem', 'Guerra', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1052', 'Malik', 'Wright', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1053', 'Hanna', 'Park', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1054', 'Gwendolyna', 'Alexander', '2016-12-02 00:00:00', '2016-12-02 13:43:53', '0', '0', '1', '0', '1', '0'), ('1055', 'Martena', 'Nichols', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1056', 'Jenna', 'Vaughn', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1057', 'Graiden', 'Miles', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1058', 'Gareth', 'Robertson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1059', 'Jelani', 'Price', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1060', 'Nora', 'Barber', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1061', 'Bruce', 'Spence', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1062', 'Chloe', 'Peterson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1063', 'Alana', 'Wiley', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1064', 'Wynter', 'Porter', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1065', 'Reece', 'Hewitt', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1066', 'Norman', 'Stevens', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1067', 'Anne', 'Delaney', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1068', 'Paki', 'Valencia', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1069', 'Brett', 'Buchanan', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1070', 'Naomi', 'Lynn', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1071', 'Basil', 'Williams', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1072', 'Drake', 'Bean', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1073', 'Althea', 'Ellis', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1074', 'Bevis', 'Nolan', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1075', 'Jesse', 'Watkins', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1076', 'Randall', 'Gallegos', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1077', 'Quinn', 'Garrison', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1078', 'Lani', 'Nash', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1079', 'Tarik', 'Bass', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1080', 'Kuame', 'Daniels', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1081', 'Moses', 'Carlson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1082', 'Amery', 'Gill', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1083', 'Pamela', 'Mcconnell', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1084', 'Allegra', 'Stanton', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1085', 'Dara', 'Yang', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1086', 'Rebecca', 'Jones', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1087', 'Hu', 'Wilder', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1088', 'Libby', 'Davidson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null);
INSERT INTO `person` VALUES ('1089', 'Dakota', 'Sawyer', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1090', 'Quin', 'Watson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1091', 'Hillary', 'Hutchinson', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1092', 'Hector', 'Kirby', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1093', 'Illana', 'Campos', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1094', 'Lacy', 'Weber', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1095', 'Jasmine', 'Raymond', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1096', 'Erich', 'Simmons', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1097', 'Thaddeus', 'England', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1098', 'Amal', 'Smith', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1099', 'Ulla', 'Ferrell', '2016-12-02 13:43:53', '2016-12-02 13:43:53', '0', '0', '1', '0', '0', null), ('1102', 'Iris', 'Šober', null, '2016-12-02 19:32:31', '1', '0', '0', '0', '0', null), ('1103', 'Gospodična', 'Mična', null, '2016-12-02 19:43:00', '1', '0', '0', '0', '0', null), ('1104', 'Striček', 'Matiček', null, '2016-12-02 19:43:11', '1', '0', '0', '0', '0', null), ('1105', 'Eva', 'Trnuljčica', null, '2016-12-02 20:36:33', '1', '0', '0', '0', '0', null), ('1106', 'Slavka', 'Mamka', null, '2016-12-04 10:17:53', '0', '0', '1', '0', '0', null), ('1107', 'tone', 'balone', null, '2016-12-14 15:56:33', '0', '0', '1', '0', '0', null), ('1108', 'Janez', 'Podatek', '1932-12-08 00:00:00', '2016-12-15 21:03:03', '0', '0', '1', '0', '0', null), ('1109', 'Janez', 'Dvanez', null, '2016-12-20 15:13:17', '0', '0', '0', '0', '0', '0'), ('1110', 'frenk', 'podatek', null, '2017-01-06 20:30:50', '0', '0', '0', '0', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`zipcode`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `ID_UNIQUE` (`name`, `zipcode`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES ('4', 'Kranj', '4000'), ('5', 'Ljubljana', '1000');
COMMIT;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
`id`  tinyint(4) NOT NULL AUTO_INCREMENT ,
`name`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'project name' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of project
-- ----------------------------
BEGIN;
INSERT INTO `project` VALUES ('1', 'Test');
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`onChart`  tinyint(1) NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name_UNIQUE` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=17

;

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES ('5', 'Delavnica', '0'), ('6', 'Učilnica', '0'), ('8', 'Kuhinja', '1'), ('9', 'Soba 3 (jedilnica)', '1'), ('10', 'Soba 4', '1'), ('11', 'Soba 5', '1'), ('12', 'Soba 6', '1'), ('13', 'Soba 10', '1'), ('14', 'Soba 11', '1'), ('15', 'Soba 12', '1'), ('16', 'Ostalo', '0');
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
`id`  tinyint(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'setting name' ,
`value`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'setting value' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `unique` (`name`, `value`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES ('6', 'flyer', 'http://admin.xinetixstudio.com/media/luniverza.si/docs/Zlo%C5%BEenka%20MC%20december%202016.pdf'), ('7', 'program', 'http://admin.xinetixstudio.com/media/luniverza.si/docs/Program%20dnevnih%20aktivnosti%20na%20MC-december.pdf');
COMMIT;

-- ----------------------------
-- Table structure for statement
-- ----------------------------
DROP TABLE IF EXISTS `statement`;
CREATE TABLE `statement` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`project_id`  tinyint(11) NULL DEFAULT NULL COMMENT 'project id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of statement
-- ----------------------------
BEGIN;
INSERT INTO `statement` VALUES ('1', 'Izjava', '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n<html>\n<head>\n	<meta http-equiv=\"content-type\" content=\"text/html; charset=windows-1250\"/>\n	<title></title>\n	<meta name=\"generator\" content=\"LibreOffice 5.2.4.2 (Windows)\"/>\n	<meta name=\"author\" content=\"Mojca Rozman\"/>\n	<meta name=\"created\" content=\"2016-05-11T13:05:00\"/>\n	<meta name=\"changedby\" content=\"MCK\"/>\n	<meta name=\"changed\" content=\"2016-05-11T13:05:00\"/>\n	<meta name=\"AppVersion\" content=\"15.0000\"/>\n	<meta name=\"DocSecurity\" content=\"0\"/>\n	<meta name=\"HyperlinksChanged\" content=\"false\"/>\n	<meta name=\"LinksUpToDate\" content=\"false\"/>\n	<meta name=\"ScaleCrop\" content=\"false\"/>\n	<meta name=\"ShareDoc\" content=\"false\"/>\n	<style type=\"text/css\">\n		@page { margin-left: 2.5cm; margin-right: 2.5cm; margin-top: 0.75cm; margin-bottom: 0.96cm }\n		p { margin-bottom: 0.25cm; direction: ltr; line-height: 120%; text-align: justify; orphans: 2; widows: 2;\n		    font-family: Calibri, Candara, Segoe, \"Segoe UI\", Optima, Arial, sans-serif; font-size: 16px; }\n		li 	{ margin-bottom: 0.25cm; direction: ltr; line-height: 120%; text-align: left; orphans: 2; widows: 2;\n		    font-family: Calibri, Candara, Segoe, \"Segoe UI\", Optima, Arial, sans-serif; font-size: 14px; }\n		.liFS { font-size: 14px; text-align: justify}\n		ol {\n    counter-reset: list;\n}\nol > li {\n    list-style: none;\n    position: relative;\n}\nol > li:before {\n    counter-increment: list;\n    content: counter(list, lower-alpha) \".) \";\n    position: absolute;\n    left: -1.4em;\n}\n	</style>\n</head>\n<body lang=\"sl-SI\">\n<div title=\"header\">\n	<p style=\"text-align:center\">\n	<img src=\"/assets/images/image001.jpg\" name=\"Slika 14\" align=\"bottom\" width=\"100%\" border=\"1\" htop=\"0\"/>\n</p>\n</div><br>\n<p style=\"text-align: center\"><b>IZJAVA O VKLJUČITVI</b></p>\n<p style=\"text-align: center\" style=\"margin-bottom: 0.35cm; line-height: 100%\"><b>v aktivnosti Medgeneracijskega centra ZA Gorenjce</b></p><br>\n<div class=\"font-family: Calibri, Candara, Segoe, \"Segoe UI\", Optima, Arial, sans-serif;\">\n<table><tr><td>\n<p>IME IN PRIIMEK:</p></td><td><p>{{firstname}} {{lastname}}</p></td></tr><tr><td>\n<p>NASLOV:</p></td><td><p>_______________________________________________________________</p></td></tr><tr><td>\n<p>POŠTNA ŠTEVILKA:</p></td><td><p>_________________________ POŠTA: ______________________________</p></td></tr><tr><td>\n<p>OBČINA:</p></td><td><p>_______________________________________________________________</p></td></tr><tr><td>\n<p>DATUM ROJSTVA:</p></td><td><p>_______________________________________________________________</p></td></tr><tr><td>\n<p>TELEFON:</p></td><td><p>{{mobileNumber}}</p></td></tr><tr><td>\n<p>E-MAIL:</p></td><td><p>{{email}}</p></td></tr></table>\n<p  style=\"margin-bottom: 0cm; line-height: 200%\">DRŽAVLJANSTVO\n(ustrezno obkroži): 	a.) slovensko-stalno		c.) tuje-stalno	</p>\n<p  style=\"margin-left: 5cm; text-indent: 1.25cm; margin-bottom: 0cm; line-height: 200%\">\nb.) slovensko-začasno		d.) tuje-začasno</p><br>\n\n<table>\n<tr><td width=\"65%\">IZOBRAZBA (ustrezno obkroži):</td><td width=\"35%\">STATUS (ustrezno obkroži):</td></tr>\n<tr><td>a.) nedokončana OŠ</td><td>&nbsp;&nbsp;&nbsp;&nbsp;a.) dijak/študent</td></tr>\n<tr><td>b.) dokončana OŠ</td><td>&nbsp;&nbsp;&nbsp;&nbsp;b.) brezposelni</td></tr>\n<tr><td>c.) 2-3 letna poklicna šola	</td><td>&nbsp;&nbsp;&nbsp;&nbsp;c.) kmet, gospodinja</td></tr>\n<tr><td>d.) 4 letna srednja šola, splošna/strokovna gimnazija</td><td>&nbsp;&nbsp;&nbsp;&nbsp;d.) zaposlen/a</td></tr>\n<tr><td>e.) 2 letna višja šola</td><td>&nbsp;&nbsp;&nbsp;&nbsp;e.) upokojenec/ka</td></tr>\n<tr><td>f.) visoka šola, fakulteta, več SP</td><td>&nbsp;&nbsp;&nbsp;&nbsp;f.) drugo: ___________</td></tr></table><br>\n<p  style=\"margin-bottom: 0.21cm; line-height: 100%\">AKTIVNOST,\nV KATERO SE VKLJUČUJEM (obkrožite):</p>\n<ol type=\"a\">\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Individualno svetovanje</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	IKT delavnice in mentorstvo (računalniške delavnice)</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Delavnice tujih jezikov</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Aktivnosti za pomoč priseljencem pri vključevanju v slovensko družbo</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Ustvarjalne, kulinarične delavnice</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Skupinska in individualna učna pomoč</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Družabni dogodki (družabne igre, ples &hellip;)</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Vključevanje starejših v izvedbo aktivnosti vrtcev</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Enkratna predavanja na različne teme (potopisna predavanja &hellip;)</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Delavnice za zdravo in aktivno staranje (gibalne aktivnosti,\n	predavanja&hellip;)</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Medkulturne delavnice (spoznavanje kultur priseljencev)</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Skupine za samopomoč</p>\n	<li/>\n<p  style=\"margin-bottom: 0.21cm; line-height: 200%\">\n	Drugo:\n	____________________________________________________________________</p>\n</ol>\n<p  style=\"margin-left: 0.63cm; margin-bottom: 0.21cm; line-height: 200%\">\n<br/>\n<br/>\n</p>\n<p style=\"text-align:center\">\n	<img src=\"/assets/images/image001.jpg\" name=\"Slika 14\" align=\"bottom\" width=\"100%\" border=\"1\" htop=\"0\"/>\n</p><br>\n<p  style=\"margin-bottom: 0.21cm; line-height: 100%\">NAMEN VKLJUČITVE (obkrožite):</p>\n<ol type=\"a\">\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Spoznavanje novih ljudi</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Druženje</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Učenje novih veščin</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Dvig samopodobe</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Razvoj komunikacijskih veščin</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Učenje tujih jezikov</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\">\n	Medgeneracijsko sodelovanje</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 150%\"><br>\n	Drugo:______________________________________________________________________\n	____________________________________________________________________________</p>\n</ol>\n\n<p  style=\"margin-bottom: 0.35cm; line-height: 100%\" class=\"liFS\">POGOJI VKLJUČITVE:\nV program Medgeneracijskega centra se lahko vključi\nkdorkoli, ki želi svoj prosti čas kakovostno preživljati. Pogoj\nvključitve je podpisana Izjava o vključitvi v Medgeneracijski center.\n</p>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\" class=\"liFS\">POSTOPEK PRITOŽBE:\nVsak uporabnik naših storitev in programov, ki z njimi ni\nzadovoljen, se lahko pritoži na naslednji način:</p>\n<ul>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%; font-size:12px \" class=\"liFS\">\n	pisno ali ustno na zapisnik	pri strokovnemu delavcu Medgeneracijskega centra,</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\" class=\"liFS\">\n	po redni pošti na naslov Ljudske univerze Kranj (za Medgeneracijski center),</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\" class=\"liFS\">\n	po elektronski pošti(<a href=\"mailto:mck@luniverza.si\">mck@luniverza.si</a>),</p>\n	<li/>\n<p  style=\"margin-bottom: 0cm; line-height: 100%\" class=\"liFS\">\n	z anonimno oddajo pritožbe v nabiralnik, ki se nahaja v prostorih Medgeneracijskega centra.</p>\n</ul>\n<p  style=\"margin-bottom: 0.35cm; line-height: 100%\" class=\"liFS\">Uporabnik\nsme vložiti pritožbo v roku 8 dni od nastanka okoliščin, ki so\npodlaga za pritožbo. Strokovni delavec programa mora poslati odgovor\nna prejeto pritožbo najkasneje v 30 dneh od prejema pritožbe s\npriporočeno pošto na naslov uporabnika. Uporabnik, ki ni zadovoljen z\nrešitvijo pritožbe, lahko vloži zoper strokovnega delavca ugovor na\nSvet zavoda, v roku 8 dni po izvedeni storitvi. Svet zavoda pregleda\nugovor in določi, kaj naj se ukrene. O tem obvesti uporabnika.\n<b>Pravilnik o pritožbenem postopku je na voljo pri strokovnem delavcu. </b>\n</p>\n<p  style=\"margin-bottom: 0.35cm; line-height: 100%\" class=\"liFS\">HIŠNI RED je dostopen na oglasni deski Medgeneracijskega centra.\n</p>\n\n<p  style=\"margin-bottom: 0.35cm; line-height: 100%\">S podpisom izjave o vključitvi\n_____________________________________________________<br>\n(IME IN PRIIMEK) izjavljam: &shy;&shy;&shy;&shy;&shy;</p>\n<ul>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da sem seznanjen/a s hišnim redom, ki je dostopen na oglasni deski\n	Medgeneracijskega centra,</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da sem seznanjen/a s postopkom pritožbe. Pravilnik o pritožbenem\n	postopku je na voljo pri strokovnemu delavcu Medgeneracijskega\n	centra,</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da so dani podatki resnični. Medgeneracijskemu centru Kranj\n	dovoljujem uporabo svojih podatkov pri vodenju in obdelavi podatkov\n	v skladu z Zakonom o varstvu osebnih podatkov,</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da me Medgeneracijski center lahko obvešča (po elektronski pošti) o\n	posameznih aktivnostih, katerih se lahko brezplačno udeležim,</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da se me lahko na aktivnostih fotografira ali snema in objavi v\n	javnih občilih (radio, TV, časopisi, spletne strani, facebook itd.),</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da sem obveščen, da udeleženci niso dodatno poškodbeno, zdravstveno\n	ali kako drugače zavarovani v času izvedbe aktivnosti,</p>\n	<li/>\n<p  style=\"line-height: 50%\">\n	da sem obveščen, da je vsak sam odgovoren za varnost osebnih\n	predmetov.</p>\n</ul>\n<table class=\"leFS\" width=\"100%\">\n<tr><td></td><td></td></tr>\n<tr><td width=\"40%\">Datum: ______________________</td><td>Podpis:</td><td>__________________________</td></tr>\n<tr><td></td><td>Podpis strokovnega delavca:</td><td>__________________________</td></tr>\n</table>\n</div>\n</body>\n</html>', null);
COMMIT;

-- ----------------------------
-- Table structure for t_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_kind`;
CREATE TABLE `t_kind` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`theme_id`  int(11) NOT NULL ,
`kind_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`kind_id`) REFERENCES `kind` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_theme_1` (`theme_id`) USING BTREE ,
INDEX `fk_kind_2` (`kind_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of t_kind
-- ----------------------------
BEGIN;
INSERT INTO `t_kind` VALUES ('1', '5', '1'), ('2', '5', '2'), ('3', '13', '4'), ('4', '13', '3'), ('5', '13', '5'), ('8', '11', '1');
COMMIT;

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name of template' ,
`active`  tinyint(1) NULL DEFAULT NULL COMMENT 'is this template active for use, 1=yes, 0=no' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of template
-- ----------------------------
BEGIN;
INSERT INTO `template` VALUES ('1', 'Gorenjski glas', '1'), ('2', 'Moja leta', '1'), ('3', 'Kričač', '0'), ('4', 'Kranjske novice', '1');
COMMIT;

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'target group or activity theme' ,
`name`  varchar(245) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`color`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#FFF' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of theme
-- ----------------------------
BEGIN;
INSERT INTO `theme` VALUES ('5', 'Šport', '#0f0'), ('6', 'Kultura', '#0080ff'), ('9', 'Planinarjenje', '#71b32e'), ('10', 'Za mlade', '#8000ff'), ('11', 'Za otroke', '#ff0'), ('12', 'Za tujce', '#00bfff'), ('13', 'Za seniorje', '#c3d6d6'), ('14', 'Sprostitev telesa in duha', '#ff8000');
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES ('1', 'Delavnica'), ('2', 'Predavanje');
COMMIT;

-- ----------------------------
-- View structure for v_activity
-- ----------------------------
DROP VIEW IF EXISTS `v_activity`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_activity` AS select `a`.`id` AS `id`,`a`.`cDate` AS `cDate`,`a`.`name` AS `name`,`a`.`content` AS `content`,`a`.`theme_id` AS `theme_id`,ifnull(`t`.`color`,'#FFF') AS `color`,`a`.`isRented` AS `isRented`,`a`.`isAcc` AS `isAcc`,`a`.`isOff` AS `isOff`,(select count(0) from `event` where ((`event`.`activity_id` = `a`.`id`) and isnull(`event`.`isOff`))) AS `cnt` from (`activity` `a` left join `theme` `t` on((`a`.`theme_id` = `t`.`id`))) ;

-- ----------------------------
-- View structure for v_amember
-- ----------------------------
DROP VIEW IF EXISTS `v_amember`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_amember` AS select distinct `a`.`id` AS `id`,`a`.`cDate` AS `cDate`,`a`.`name` AS `name`,`a`.`content` AS `content`,`a`.`theme_id` AS `theme_id`,`a`.`color` AS `color`,`p`.`id` AS `person_id`,`a`.`isRented` AS `isRented` from (((`v_activity` `a` join `e_person` `e`) join `event` `evt`) join `person` `p`) where ((`a`.`id` = `evt`.`activity_id`) and (`evt`.`id` = `e`.`event_id`) and (`e`.`person_id` = `p`.`id`) and isnull(`e`.`oDate`) and isnull(`evt`.`isOff`)) ;

-- ----------------------------
-- View structure for v_apeople
-- ----------------------------
DROP VIEW IF EXISTS `v_apeople`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_apeople` AS select `activity`.`id` AS `id`,group_concat(concat(' ',`person`.`firstName`,' ',`person`.`lastName`) separator ',') AS `people` from ((`a_person` join `activity` on((`a_person`.`activity_id` = `activity`.`id`))) join `person` on((`a_person`.`person_id` = `person`.`id`))) group by `a_person`.`activity_id` ;

-- ----------------------------
-- View structure for v_aperson
-- ----------------------------
DROP VIEW IF EXISTS `v_aperson`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_aperson` AS select `a`.`id` AS `id`,`a`.`cDate` AS `cDate`,`a`.`name` AS `name`,`a`.`content` AS `content`,`a`.`theme_id` AS `theme_id`,`a`.`color` AS `color`,`p`.`person_id` AS `person_id`,`a`.`isRented` AS `isRented` from (`a_person` `p` join `v_activity` `a`) where (`p`.`activity_id` = `a`.`id`) ;

-- ----------------------------
-- View structure for v_eperson
-- ----------------------------
DROP VIEW IF EXISTS `v_eperson`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_eperson` AS select distinct `e_person`.`person_id` AS `person_id`,`person`.`firstName` AS `firstName`,`person`.`lastName` AS `lastName`,concat(`person`.`firstName`,`person`.`lastName`) AS `name` from (`e_person` join `person` on((`e_person`.`person_id` = `person`.`id`))) ;

-- ----------------------------
-- View structure for v_event
-- ----------------------------
DROP VIEW IF EXISTS `v_event`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_event` AS select `e`.`id` AS `id`,`e`.`name` AS `name`,`e`.`content` AS `content`,`e`.`room_id` AS `room_id`,`e`.`cDate` AS `cDate`,`e`.`starttime` AS `starttime`,`e`.`endtime` AS `endtime`,`e`.`isDay` AS `isDay`,`e`.`activity_id` AS `activity_id`,`e`.`mevent_id` AS `mevent_id`,`t`.`color` AS `color`,`t`.`name` AS `themeName`,`r`.`name` AS `roomName`,(select count(0) from `event` where (`event`.`mevent_id` = `e`.`id`)) AS `cnt`,`e`.`oDate` AS `oDate`,`e`.`aDate` AS `aDate`,`e`.`isAcc` AS `isAcc`,`e`.`isOff` AS `isOff` from (((`event` `e` left join `activity` `a` on((`e`.`activity_id` = `a`.`id`))) left join `theme` `t` on((`a`.`theme_id` = `t`.`id`))) left join `room` `r` on((`e`.`room_id` = `r`.`id`))) ;

-- ----------------------------
-- View structure for v_fevent
-- ----------------------------
DROP VIEW IF EXISTS `v_fevent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_fevent` AS select `event`.`id` AS `id`,`event`.`starttime` AS `starttime`,`event`.`endtime` AS `endtime`,`event`.`name` AS `name`,`activity`.`isRented` AS `isRented`,`event`.`isAcc` AS `isAcc`,`event`.`isOff` AS `isOff`,`room`.`name` AS `rName`,`activity`.`publish` AS `publish`,`event`.`content` AS `content`,`activity`.`content` AS `aContent`,`activity`.`name` AS `aName`,(select count(0) from `e_person` where (`e_person`.`event_id` = `event`.`id`)) AS `pReg`,(select count(0) from `e_person` where ((`e_person`.`event_id` = `event`.`id`) and (`e_person`.`aDate` is not null) and isnull(`e_person`.`oDate`))) AS `pRegA`,(select count(0) from `e_person` where ((`e_person`.`event_id` = `event`.`id`) and (`e_person`.`oDate` is not null))) AS `pRegO`,(select count(0) from `a_template` where (`a_template`.`activity_id` = `event`.`activity_id`)) AS `tCnt`,`v_apeople`.`people` AS `people`,`theme`.`color` AS `color`,`activity`.`id` AS `activity_id`,`room`.`id` AS `room_id` from ((((`event` join `room` on((`event`.`room_id` = `room`.`id`))) join `activity` on((`event`.`activity_id` = `activity`.`id`))) join `v_apeople` on((`activity`.`id` = `v_apeople`.`id`))) join `theme` on((`activity`.`theme_id` = `theme`.`id`))) ;

-- ----------------------------
-- View structure for v_fevent_m
-- ----------------------------
DROP VIEW IF EXISTS `v_fevent_m`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_fevent_m` AS select `event`.`id` AS `id`,`event`.`starttime` AS `starttime`,`event`.`endtime` AS `endtime`,`event`.`name` AS `name`,`activity`.`isRented` AS `isRented`,`event`.`isAcc` AS `eAcc`,`event`.`isOff` AS `eOff`,`room`.`name` AS `rName`,`event`.`content` AS `content`,`activity`.`name` AS `aName`,`theme`.`color` AS `color`,`activity`.`id` AS `activity_id`,`room`.`id` AS `room_id`,`e_person`.`person_id` AS `person_id`,`activity`.`isAcc` AS `aAcc`,`activity`.`isOff` AS `aOff`,`activity`.`project_id` AS `project_id`,`activity`.`partner_id` AS `partner_id`,`e_person`.`cDate` AS `cDate`,`e_person`.`oDate` AS `oDate`,`e_person`.`aDate` AS `aDate`,`person`.`firstName` AS `firstName`,`person`.`lastName` AS `lastName`,concat(`person`.`firstName`,' ',`person`.`lastName`) AS `person_name`,`e_person`.`id` AS `eperson_id`,`project`.`name` AS `projName`,`partner`.`name` AS `partName`,`theme`.`name` AS `tName` from (((((((`event` join `room` on((`event`.`room_id` = `room`.`id`))) join `activity` on((`event`.`activity_id` = `activity`.`id`))) join `theme` on((`activity`.`theme_id` = `theme`.`id`))) join `e_person` on((`event`.`id` = `e_person`.`event_id`))) join `person` on((`e_person`.`person_id` = `person`.`id`))) left join `project` on((`project`.`id` = `activity`.`project_id`))) left join `partner` on((`partner`.`id` = `activity`.`partner_id`))) ;

-- ----------------------------
-- View structure for v_fevent_t
-- ----------------------------
DROP VIEW IF EXISTS `v_fevent_t`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_fevent_t` AS select `event`.`id` AS `id`,`event`.`starttime` AS `starttime`,`event`.`endtime` AS `endtime`,`event`.`name` AS `name`,`activity`.`isRented` AS `isRented`,`event`.`isAcc` AS `eAcc`,`event`.`isOff` AS `eOff`,`room`.`name` AS `rName`,`event`.`content` AS `content`,`activity`.`name` AS `aName`,`theme`.`color` AS `color`,`activity`.`id` AS `activity_id`,`room`.`id` AS `room_id`,`activity`.`isAcc` AS `aAcc`,`activity`.`isOff` AS `aOff`,`activity`.`project_id` AS `project_id`,`activity`.`partner_id` AS `partner_id`,`person`.`firstName` AS `firstName`,`person`.`lastName` AS `lastName`,concat(`person`.`firstName`,' ',`person`.`lastName`) AS `person_name`,`project`.`name` AS `projName`,`partner`.`name` AS `partName`,`theme`.`name` AS `tName`,`a_person`.`id` AS `a_person_id`,`a_person`.`person_id` AS `person_id` from (((((((`event` left join `room` on((`event`.`room_id` = `room`.`id`))) join `activity` on((`event`.`activity_id` = `activity`.`id`))) join `theme` on((`activity`.`theme_id` = `theme`.`id`))) join `person`) left join `project` on((`project`.`id` = `activity`.`project_id`))) left join `partner` on((`partner`.`id` = `activity`.`partner_id`))) join `a_person` on(((`a_person`.`activity_id` = `activity`.`id`) and (`a_person`.`person_id` = `person`.`id`)))) ;

-- ----------------------------
-- View structure for v_location
-- ----------------------------
DROP VIEW IF EXISTS `v_location`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_location` AS select `location`.`id` AS `id`,`location`.`name` AS `name`,`location`.`partner_id` AS `partner_id`,`partner`.`name` AS `pName`,`partner`.`isMain` AS `isMain`,`partner`.`short` AS `short` from (`location` join `partner` on((`location`.`partner_id` = `partner`.`id`))) ;

-- ----------------------------
-- View structure for v_mein
-- ----------------------------
DROP VIEW IF EXISTS `v_mein`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_mein` AS select distinct `me`.`id` AS `notid`,`me`.`id` AS `id`,`me`.`name` AS `name`,`me`.`content` AS `content`,`me`.`room_id` AS `room_id`,`me`.`cDate` AS `cDate`,`me`.`starttime` AS `starttime`,`me`.`endtime` AS `endtime`,`me`.`isDay` AS `isDay`,`me`.`activity_id` AS `activity_id`,`me`.`mevent_id` AS `mevent_id`,`me`.`oDate` AS `oDate`,`me`.`aDate` AS `aDate`,`me`.`isAcc` AS `isAcc`,`me`.`isOff` AS `isOff`,`ep`.`person_id` AS `person_id` from (((`e_person` `ep` join `activity` `a`) join `event` `e`) join `event` `me`) where ((`e`.`id` = `ep`.`event_id`) and (`e`.`activity_id` = `a`.`id`) and (`e`.`mevent_id` = `me`.`id`) and isnull(`ep`.`oDate`)) ;

-- ----------------------------
-- View structure for v_member
-- ----------------------------
DROP VIEW IF EXISTS `v_member`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_member` AS select `person`.`id` AS `id`,`person`.`firstName` AS `firstName`,`person`.`lastName` AS `lastName`,`person`.`birthDate` AS `birthDate`,`person`.`isTeacher` AS `isTeacher`,`person`.`isVolunteer` AS `isVolunteer`,`person`.`isMember` AS `isMember`,`person`.`isEmployee` AS `isEmployee`,`person`.`isRenter` AS `isRenter`,`person`.`email` AS `email`,`person`.`number` AS `number`,`person`.`address` AS `address`,`person`.`zipcode` AS `zipcode`,`person`.`name` AS `name`,`person`.`sex` AS `sex` from `v_person` `person` where (`person`.`isMember` = TRUE) ;

-- ----------------------------
-- View structure for v_mevent
-- ----------------------------
DROP VIEW IF EXISTS `v_mevent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_mevent` AS select `e`.`id` AS `id`,`e`.`mevent_id` AS `mevent_id`,`e`.`name` AS `name`,`e`.`content` AS `content`,`e`.`room_id` AS `room_id`,`e`.`cDate` AS `cDate`,`e`.`starttime` AS `starttime`,`e`.`endtime` AS `endtime`,`e`.`isDay` AS `isDay`,`e`.`activity_id` AS `activity_id`,`e`.`color` AS `color`,`p`.`id` AS `person_id`,`e`.`oDate` AS `oDate`,`e`.`aDate` AS `aDate`,`e`.`isAcc` AS `isAcc`,`e`.`isOff` AS `isOff`,`ep`.`id` AS `eperson_id`,`ep`.`cDate` AS `pCDate`,`ep`.`oDate` AS `pODate`,`ep`.`aDate` AS `pADate` from ((`person` `p` join `v_event` `e`) join `e_person` `ep` on(((`ep`.`person_id` = `p`.`id`) and (`e`.`id` = `ep`.`event_id`)))) where ((`ep`.`person_id` = `p`.`id`) and (`ep`.`event_id` = `e`.`id`)) ;

-- ----------------------------
-- View structure for v_mevent_a
-- ----------------------------
DROP VIEW IF EXISTS `v_mevent_a`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_mevent_a` AS select distinct `e`.`activity_id` AS `id`,`ep`.`id` AS `eperson_id`,`ep`.`aDate` AS `adate`,`ep`.`cDate` AS `cdate`,`ep`.`oDate` AS `odate`,`p`.`id` AS `person_id`,`p`.`firstName` AS `firstname`,`p`.`lastName` AS `lastname`,concat(`p`.`firstName`,' ',`p`.`lastName`) AS `person_name` from ((`person` `p` join `v_event` `e`) join `e_person` `ep`) where ((`ep`.`person_id` = `p`.`id`) and (`ep`.`event_id` = `e`.`id`)) ;

-- ----------------------------
-- View structure for v_mevent_e
-- ----------------------------
DROP VIEW IF EXISTS `v_mevent_e`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_mevent_e` AS select distinct `e`.`id` AS `id`,`ep`.`id` AS `eperson_id`,`ep`.`aDate` AS `adate`,`ep`.`cDate` AS `cdate`,`ep`.`oDate` AS `odate`,`p`.`id` AS `person_id`,`p`.`firstName` AS `firstname`,`p`.`lastName` AS `lastname`,concat(`p`.`firstName`,' ',`p`.`lastName`) AS `person_name` from ((`person` `p` join `v_event` `e`) join `e_person` `ep`) where ((`ep`.`person_id` = `p`.`id`) and (`ep`.`event_id` = `e`.`id`)) ;

-- ----------------------------
-- View structure for v_person
-- ----------------------------
DROP VIEW IF EXISTS `v_person`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_person` AS select `person`.`id` AS `id`,`person`.`firstName` AS `firstName`,`person`.`lastName` AS `lastName`,`person`.`birthDate` AS `birthDate`,`person`.`isTeacher` AS `isTeacher`,`person`.`isVolunteer` AS `isVolunteer`,`person`.`isMember` AS `isMember`,`person`.`isEmployee` AS `isEmployee`,`person`.`isRenter` AS `isRenter`,`p_email`.`email` AS `email`,`p_phone`.`number` AS `number`,`p_address`.`address` AS `address`,`post`.`zipcode` AS `zipcode`,`post`.`name` AS `name`,`person`.`sex` AS `sex` from ((((`person` left join `p_email` on((`p_email`.`person_id` = `person`.`id`))) left join `p_phone` on((`p_phone`.`person_id` = `person`.`id`))) left join `p_address` on((`p_address`.`person_id` = `person`.`id`))) left join `post` on((`p_address`.`post_id` = `post`.`id`))) ;

-- ----------------------------
-- View structure for v_pevent
-- ----------------------------
DROP VIEW IF EXISTS `v_pevent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_pevent` AS select `e`.`id` AS `id`,`e`.`mevent_id` AS `mevent_id`,`e`.`name` AS `name`,`e`.`content` AS `content`,`e`.`room_id` AS `room_id`,`e`.`cDate` AS `cDate`,`e`.`starttime` AS `starttime`,`e`.`endtime` AS `endtime`,`e`.`isDay` AS `isDay`,`e`.`activity_id` AS `activity_id`,`e`.`color` AS `color`,`p`.`id` AS `person_id`,`e`.`isOff` AS `isOff`,`e`.`isAcc` AS `isAcc`,`e`.`aDate` AS `aDate`,`e`.`oDate` AS `oDate` from ((`person` `p` join `v_event` `e`) join `a_person` `ap`) where ((`ap`.`person_id` = `p`.`id`) and (`ap`.`activity_id` = `e`.`activity_id`)) ;

-- ----------------------------
-- View structure for v_report
-- ----------------------------
DROP VIEW IF EXISTS `v_report`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_report` AS select distinct `e`.`id` AS `id`,`e`.`name` AS `name`,`e`.`content` AS `content`,`e`.`starttime` AS `starttime`,`e`.`endtime` AS `endtime`,`e`.`isDay` AS `isDay`,`a`.`name` AS `aname`,`a`.`content` AS `acontent`,`a`.`short` AS `ashort`,`a`.`id` AS `activity_id`,`t`.`template_id` AS `template_id` from (((`v_event` `e` join `activity` `a`) join `a_template` `t`) join `template` `tpl`) where ((`e`.`activity_id` = `a`.`id`) and (`t`.`activity_id` = `a`.`id`) and (`t`.`template_id` = `tpl`.`id`) and (`tpl`.`active` = TRUE) and (`a`.`publish` = TRUE) and (`a`.`isAcc` = TRUE) and (`e`.`isAcc` = TRUE)) order by `e`.`id` ;

-- ----------------------------
-- View structure for v_stat_per
-- ----------------------------
DROP VIEW IF EXISTS `v_stat_per`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_stat_per` AS select count(distinct `p`.`person_id`) AS `cnt_p`,count(distinct `e`.`id`) AS `cnt_e`,count(distinct `e`.`room_id`) AS `cnt_r` from (`e_person` `p` join `event` `e`) where ((`p`.`event_id` = `e`.`id`) and (`e`.`starttime` between sysdate() and (sysdate() + interval 7 day))) ;

-- ----------------------------
-- View structure for v_stat_per_ext
-- ----------------------------
DROP VIEW IF EXISTS `v_stat_per_ext`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_stat_per_ext` AS select count(0) AS `cnt`,cast(sum((`event`.`endtime` - `event`.`starttime`)) as time) AS `sumtime`,`e_person`.`person_id` AS `person_id`,(`e_person`.`oDate` is not null) AS `off`,((`e_person`.`aDate` is not null) and isnull(`e_person`.`oDate`)) AS `ack`,year(`event`.`starttime`) AS `year`,month(`event`.`starttime`) AS `month` from (`e_person` join `event` on((`e_person`.`event_id` = `event`.`id`))) group by `e_person`.`person_id`,((`e_person`.`aDate` is not null) and isnull(`e_person`.`oDate`)),(`e_person`.`oDate` is not null),year(`event`.`starttime`),month(`event`.`starttime`) ;

-- ----------------------------
-- View structure for v_stat_room_ext
-- ----------------------------
DROP VIEW IF EXISTS `v_stat_room_ext`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_stat_room_ext` AS select count(0) AS `cnt`,((`event`.`isAcc` is not null) and (isnull(`event`.`isOff`) or (`event`.`isOff` = 0))) AS `ack`,(`event`.`isOff` is not null) AS `off`,`event`.`room_id` AS `room_id`,year(`event`.`starttime`) AS `year`,month(`event`.`starttime`) AS `month`,cast(sum((`event`.`endtime` - `event`.`starttime`)) as time) AS `sumtime` from (`event` join `room` on((`event`.`room_id` = `room`.`id`))) group by `event`.`room_id`,((`event`.`isAcc` is not null) and (isnull(`event`.`isOff`) or (`event`.`isOff` = 0))),(`event`.`isOff` is not null),year(`event`.`starttime`),month(`event`.`starttime`) ;

-- ----------------------------
-- View structure for v_stat_tch_ext
-- ----------------------------
DROP VIEW IF EXISTS `v_stat_tch_ext`;
CREATE ALGORITHM=UNDEFINED DEFINER=`event`@`%` SQL SECURITY DEFINER VIEW `v_stat_tch_ext` AS select count(0) AS `cnt`,`a_person`.`person_id` AS `person_id`,year(`event`.`starttime`) AS `year`,month(`event`.`starttime`) AS `month`,cast(sum((`event`.`endtime` - `event`.`starttime`)) as time) AS `sumtime`,((if((`event`.`isAcc` = 1),1,0) = 1) and (if((`event`.`isOff` = 1),1,0) = 0)) AS `ack`,if((`event`.`isOff` = 1),1,0) AS `off` from ((`a_person` join `activity` on((`a_person`.`activity_id` = `activity`.`id`))) join `event` on((`event`.`activity_id` = `activity`.`id`))) group by `a_person`.`person_id`,year(`event`.`starttime`),month(`event`.`starttime`),((if((`event`.`isAcc` = 1),1,0) = 1) and (if((`event`.`isOff` = 1),1,0) = 0)),if((`event`.`isOff` = 1),1,0) ;
DROP TRIGGER IF EXISTS `a_person_BEFORE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `a_person_BEFORE_INSERT` BEFORE INSERT ON `a_person` FOR EACH ROW BEGIN
set NEW.cDate=now();
END
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for a_person
-- ----------------------------
ALTER TABLE `a_person` AUTO_INCREMENT=38;

-- ----------------------------
-- Auto increment value for a_template
-- ----------------------------
ALTER TABLE `a_template` AUTO_INCREMENT=13;
DROP TRIGGER IF EXISTS `BI_ACT`;
DELIMITER ;;
CREATE TRIGGER `BI_ACT` BEFORE INSERT ON `activity` FOR EACH ROW begin
 if (NEW.isAcc=1) then SET NEW.aDate = now(); end if;
 if (NEW.isOff=1) then SET NEW.oDate = now(); end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BU_ACT`;
DELIMITER ;;
CREATE TRIGGER `BU_ACT` BEFORE UPDATE ON `activity` FOR EACH ROW begin
 if NEW.isAcc <> OLD.isAcc  then
	 if NEW.isAcc <> 0 then 
	  begin
	    SET NEW.aDate = now(); 
	   	update live_events.event e
	    		set 	
				e.isAcc = 1,
				e.aDate = now()
			where
				e.activity_id = NEW.id;	
	  end;
	else 
	  begin
		SET NEW.aDate = null; 
		update live_events.event e
	    		set 	
				e.isAcc = 0,
				e.aDate = null
			where
				e.activity_id = NEW.id;
	  end;
	 end if;
 end if;

 if NEW.isOff <> OLD.isOff  then
	if NEW.isOff <> 0 then
	begin
		 SET NEW.oDate = now();
		update live_events.event e
	    		set 	
				e.isOff = 1,
				e.oDate = now()
			where
				e.activity_id = NEW.id;
	end;
	else
	begin
		SET NEW.oDate = null;
		update live_events.event e
	    		set 	
				e.isOff = 0,
				e.oDate = null
			where
				e.activity_id = NEW.id;
	end;
	end if;
 end if;


end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for activity
-- ----------------------------
ALTER TABLE `activity` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for address
-- ----------------------------
ALTER TABLE `address` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for citizenship
-- ----------------------------
ALTER TABLE `citizenship` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for commune
-- ----------------------------
ALTER TABLE `commune` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for e_person
-- ----------------------------
ALTER TABLE `e_person` AUTO_INCREMENT=339;

-- ----------------------------
-- Auto increment value for education
-- ----------------------------
ALTER TABLE `education` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for errors
-- ----------------------------
ALTER TABLE `errors` AUTO_INCREMENT=18;
DROP TRIGGER IF EXISTS `event_BEFORE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `event_BEFORE_INSERT` BEFORE INSERT ON `event` FOR EACH ROW BEGIN
 set NEW.cDate = now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BU_EVT`;
DELIMITER ;;
CREATE TRIGGER `BU_EVT` BEFORE UPDATE ON `event` FOR EACH ROW begin
 if NEW.isAcc <> OLD.isAcc  then
	 if NEW.isAcc <> 0 then 
	    SET NEW.aDate = now(); 
	else 
	    SET NEW.aDate = null; 
	 end if;
 end if;

 if NEW.isOff <> OLD.isOff  then
	if NEW.isOff <> 0 then
		 SET NEW.oDate = now();
	else
		SET NEW.oDate = null;
	end if;
 end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for event
-- ----------------------------
ALTER TABLE `event` AUTO_INCREMENT=353;

-- ----------------------------
-- Auto increment value for kind
-- ----------------------------
ALTER TABLE `kind` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for location
-- ----------------------------
ALTER TABLE `location` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for p_address
-- ----------------------------
ALTER TABLE `p_address` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for p_stat
-- ----------------------------
ALTER TABLE `p_stat` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for partner
-- ----------------------------
ALTER TABLE `partner` AUTO_INCREMENT=5;
DROP TRIGGER IF EXISTS `person_BEFORE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `person_BEFORE_INSERT` BEFORE INSERT ON `person` FOR EACH ROW BEGIN
	set NEW.cDate=now();
END
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for person
-- ----------------------------
ALTER TABLE `person` AUTO_INCREMENT=1111;

-- ----------------------------
-- Auto increment value for post
-- ----------------------------
ALTER TABLE `post` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for project
-- ----------------------------
ALTER TABLE `project` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for room
-- ----------------------------
ALTER TABLE `room` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for settings
-- ----------------------------
ALTER TABLE `settings` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for statement
-- ----------------------------
ALTER TABLE `statement` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for t_kind
-- ----------------------------
ALTER TABLE `t_kind` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for template
-- ----------------------------
ALTER TABLE `template` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for theme
-- ----------------------------
ALTER TABLE `theme` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for type
-- ----------------------------
ALTER TABLE `type` AUTO_INCREMENT=3;
SET FOREIGN_KEY_CHECKS=1;
