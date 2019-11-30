/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.41 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `bp` */

DROP TABLE IF EXISTS `bp`;

CREATE TABLE `bp` (
  `BPId` varchar(100) DEFAULT NULL,
  `GuanCode` varchar(100) DEFAULT NULL,
  `SimCard` varchar(100) DEFAULT NULL,
  `ProductCode` varchar(100) DEFAULT NULL,
  `GuanBodyCode` varchar(100) DEFAULT NULL,
  `MonitorCode` varchar(100) DEFAULT NULL,
  `GPSCode` varchar(100) DEFAULT NULL,
  `SensorCode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bp` */

insert  into `bp`(`BPId`,`GuanCode`,`SimCard`,`ProductCode`,`GuanBodyCode`,`MonitorCode`,`GPSCode`,`SensorCode`) values ('19031234','19031234','111','111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19034321','19034321','11111111','11111111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','1111122222','1111122222','TY2024','QY12864','SZ14AA','JN4ZA20'),('19034321','19034321','1222331','1222331','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','444444','444444','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','1111','1111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031223','19031223','1111','1111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','111','111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','11111','11111','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031123','19031123','1112311','1112311','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','111111123111322','111111123111322','TY2024','QY12864','SZ14AA','JN4ZA20'),('19033214','19033214','12231555','12231555','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','1211','1211','TY2024','QY12864','SZ14AA','JN4ZA20'),('19034321','19034321','66778','66778','TY2024','QY12864','SZ14AA','JN4ZA20'),('19031234','19031234','1234','1234','TY2024','QY12864','SZ14AA','JN4ZA20'),('19034312','19034312','4311','4311','TY2024','QY12864','SZ14AA','JN4ZA20'),('19035555','19035555','1124678','1124678','TY2024','QY12864','SZ14AA','JN4ZA20'),('BP19039999','BP19039999','00000','00000','TY2024','QY12864','SZ14AA','JN4ZA20'),('BP19038888','BP19038888','88888','88888','TY2024','QY12864','SZ14AA','JN4ZA20'),('BP19037777','BP19037777','777777','777777','TY2024','QY12864','SZ14AA','JN4ZA20'),('BP19038888','BP19038888','18240787640','18240787640','TY2024','QY12864','SZ14AA','JN4ZA20'),('BPnull','BPnull',NULL,NULL,'TY2024','QY12864','SZ14AA','JN4ZA20'),('BPnull','BPnull',NULL,NULL,'TY2024','QY12864','SZ14AA','JN4ZA20');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `keywords` varchar(64) NOT NULL,
  `autor` varchar(16) NOT NULL,
  `addtime` date NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`keywords`,`autor`,`addtime`,`content`) values (2,'新闻2','军事','李四','2018-01-13','港媒称歼20开展首次实战训练'),(3,'新闻3','科技','王五','2018-01-12','英特尔再曝新漏洞，黑客可控制笔记本'),(5,'新闻5','历史','赵七','2018-01-06','毛泽东生前警卫：不孤独因有毛主席相伴'),(4,'新闻4','电影','马六','2018-01-09','2018内地好莱坞引进片前瞻'),(1,'新闻1','社会','张三','2018-01-14','2018春运售票进入高峰期'),(6,'新闻6','财经','周八','2018-01-01','新年楼市松绑真相');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `age` int(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`password`,`age`) values (24,'小鬼','123',22),(25,'夏明','123',23),(28,'夏天','123',22),(37,'123','123',22),(41,'王小二','123',22),(42,'小鬼111','123',22),(43,'小鬼1111','123',12),(44,'123','346543',12),(45,'å¼ ä¸‰','123456',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
