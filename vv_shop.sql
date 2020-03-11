CREATE DATABASE  IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `shop_ad`
--

DROP TABLE IF EXISTS `shop_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_ad` (
  `id` smallint(5) unsigned NOT NULL COMMENT '首页横幅图片id',
  `name` varchar(60) DEFAULT '' COMMENT '首页横幅图片名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `image_url` text,
  `enabled` tinyint(3) DEFAULT NULL COMMENT '是否将该图片放置首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页横幅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_ad`
--

LOCK TABLES `shop_ad` WRITE;
/*!40000 ALTER TABLE `shop_ad` DISABLE KEYS */;
INSERT INTO `shop_ad` VALUES (1,'a','/pages/auth/newuser/newuser','http://localhost:8080/img/banner/1.jpg',1),(2,'b','/pages/auth/newuser/newuser','http://localhost:8080/img/banner/2.jpg',1),(3,'c','/pages/auth/newuser/newuser','http://localhost:8080/img/banner/3.jpg',1);
/*!40000 ALTER TABLE `shop_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户真实姓名',
  `tel_number` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户电话号码',
  `detail_Info` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '用户地址详情',
  `region` text COLLATE utf8_bin COMMENT '用户所在地区',
  PRIMARY KEY (`id`),
  KEY `A_Ids` (`user_id`),
  CONSTRAINT `A_B_Ids` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`user_id`),
  CONSTRAINT `A_Ids` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
INSERT INTO `shop_address` VALUES (1,1,'uuu','15521419818','jjjjjjjjjjj','河北省,石家庄市,长安区'),(8,1,'hhjj','15521419818','trtthhhhhhhhhhhhhh','北京市,北京市,东城区'),(13,1,'asssasdas','15521419818','sddsds','内蒙古自治区,呼和浩特市,新城区'),(24,1,'xixjxsjcdd','15521419818','wewewe','北京市,北京市,东城区');
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_assess`
--

DROP TABLE IF EXISTS `shop_assess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_assess` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `text` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `score` int(3) NOT NULL COMMENT '评论分值',
  `create_time` datetime NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_assess`
--

LOCK TABLES `shop_assess` WRITE;
/*!40000 ALTER TABLE `shop_assess` DISABLE KEYS */;
INSERT INTO `shop_assess` VALUES (10,'200306025105508',1,'sddsdsdsd',3,'2020-03-07 11:49:05'),(11,'200308123359763',1,'我i是',2,'2020-03-08 04:36:13');
/*!40000 ALTER TABLE `shop_assess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_goods`
--

DROP TABLE IF EXISTS `shop_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_goods` (
  `goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `spec_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格',
  `deduct_stock_type` tinyint(3) unsigned NOT NULL DEFAULT '20' COMMENT '库存计算方式(10下单减库存 20付款减库存)',
  `content` longtext NOT NULL COMMENT '商品详情',
  `sales_actual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '商品排序(数字越小越靠前)',
  `goods_status` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '商品状态(10上架 20下架)',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `goods_img_url` text NOT NULL COMMENT '商品主要图片',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为热门商品',
  `counter_price` int(11) NOT NULL DEFAULT '0' COMMENT '商品价格',
  `stock_num` int(11) NOT NULL DEFAULT '100' COMMENT '商品库存',
  `is_new` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为新品',
  `c_img` longtext NOT NULL COMMENT '商品详情图片',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `counter_price_UNIQUE` (`counter_price`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商品详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_goods`
--

LOCK TABLES `shop_goods` WRITE;
/*!40000 ALTER TABLE `shop_goods` DISABLE KEYS */;
INSERT INTO `shop_goods` VALUES (1,'甘源年货零食',1,255,0,'甘源超值年货美味零食大礼包',500,1,10,0,'http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',1,40,1000,0,'http://localhost:8080/img/c_img/5f9ebe88cad970d5bdb73b34ccb8b39.jpg'),(2,'梁丰麦丽素巧克力',2,30,0,'梁丰麦丽素巧克力家常看电影必备零食',500,2,10,0,'http://localhost:8080/img/a_img/88f8c4fa12afd659d0960368b3e21e7.jpg',1,3,1000,0,'http://localhost:8080/img/c_img/e2ce8c243492668ed15c26cd6dd0eae.jpg'),(3,'卫龙大辣棒',3,78,0,'卫龙大辣条休闲网红小吃面筋辣条80怀旧儿时麻辣零食',500,3,10,0,'http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',1,5,1000,0,'http://localhost:8080/img/c_img/205893d9f8d7a349d165385f81e034a.jpg'),(4,'徐福记蛋黄沙琪玛',4,168,0,'徐福记蛋黄沙琪玛软糯早餐点心小零食下午茶',500,4,10,0,'http://localhost:8080/img/a_img/643ac42c5e9bc5f2f4a582f06dc3ac3.jpg',1,13,1000,1,'http://localhost:8080/img/c_img/b11cfcac2fe88d639763b36f265cd11.jpg'),(5,'三只松鼠混合坚果',1,175,0,'三只松鼠混合坚果健康宅家购美味',245,5,10,0,'\r http://localhost:8080/img/a_img/508213d34814f3cbc50d4f55e27d725.jpg',0,29,500,1,'http://localhost:8080/img/c_img/d6889fa5b73d28dbf337521130d69eb.jpg'),(6,'甘源蟹黄蚕豆',1,255,0,'甘源蟹黄蚕豆',524,6,10,0,'\nhttp://localhost:8080/img/a_img/c69c08c50867cfbd0c874806ab3b159.jpg\n',0,17,500,1,'http://localhost:8080/img/c_img/e7453f053a6f5cd349a5a3ecaae3086.jpg'),(7,'至梵核桃味瓜子',1,100,0,'至梵核桃味瓜子葵瓜子炒货干货零食香瓜子',77,7,10,0,'\nhttp://localhost:8080/img/a_img/92de718cdb9c2db0f8315bedbbbd513.jpg\n',0,1,500,1,'http://localhost:8080/img/c_img/687cc27055ad97df100c3d0dc3546f1.jpg'),(8,'百草味夏威夷果',1,100,0,'百草味夏威夷果零食特产坚果炒货每日干果仁奶油味休闲小吃',41,8,10,0,'\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',0,26,500,0,'http://localhost:8080/img/c_img/55fbc43d6c9e8c2ca2446a8e454d98e.jpg'),(9,'甘源原味青豆',1,255,0,'甘源原味青豆',85,9,10,0,'\nhttp://localhost:8080/img/a_img/73bf0f15abde727ce227619c5b4acc4.jpg\n',0,18,500,0,'http://localhost:8080/img/c_img/c41d9d420cf0e75b7cbc0f7d7487ebe.jpg'),(10,'良品铺子坚果大礼包',1,255,0,'良品铺子坚果大礼包每日干果混合过年零食礼盒春节礼品',92,10,10,0,'http://localhost:8080/img/a_img/4c9086194b574b98ec476e709fdcf31.jpg',0,98,500,0,'http://localhost:8080/img/c_img/910093f6cfa45412a31421b769b4d7e.jpg'),(11,'良品铺子水果软糖',2,50,0,'良品铺子爆浆果心果汁软糖糖果葡萄味橡皮糖接吻糖零食',41,11,10,0,'http://localhost:8080/img/a_img/f05e1c466072b5c231eb29e16a882d0.jpg',0,15,41,1,'http://localhost:8080/img/c_img/75e732cfebdd7be98d69fae67795a76.jpg'),(12,'徐福记酒心巧克力',2,255,0,'徐福记x雀巢奇欧比小巴巴联名款酒心巧克力宅家',4,12,10,0,'http://localhost:8080/img/a_img/c7136686eb52ab74a479a4e6b4b6246.jpg',0,24,12,1,'http://localhost:8080/img/c_img/14bc292516a1b9efba773283a7512d0.jpg'),(13,'良品铺子棒棒糖',2,35,0,'良品铺子棒棒糖',25,13,10,0,'http://localhost:8080/img/a_img/101b44f899adc1ab1c8dd22196507c0.jpg',0,14,52,1,'http://localhost:8080/img/c_img/87c617b036a1deb1eca928adb5b1b9c.jpg'),(14,'徐福记酸奶巧克力',2,255,0,'徐福记x雀巢奇欧比小巴巴联名款酸奶巧克力宅家',35,14,10,0,'http://localhost:8080/img/a_img/0217cc8b77e6469b7ae25312a3ebe22.jpg',0,25,52,0,'http://localhost:8080/img/c_img/14bc292516a1b9efba773283a7512d0.jpg'),(15,'冰淇淋味巧克力',2,41,0,'德芙朗姆樱桃冰淇淋巧克力新口味上市甜蜜情人节礼物',5,15,10,0,'http://localhost:8080/img/a_img/dec9252109c2c7bf2c76f1ec67e646c.jpg',0,9,52,0,'http://localhost:8080/img/c_img/ba08339eb7533a9b760d5598b4c5bd0.jpg'),(16,'士力架巧克力条',2,20,0,'士力架花生夹心巧克力休闲零食糖果散装小吃食品',97,16,10,0,'http://localhost:8080/img/a_img/cae4768890159264ec4136d68b513c2.jpg',0,8,52,0,'http://localhost:8080/img/c_img/3be204145028e21a09bb6a1405f7de7.jpg'),(17,'良品铺子芝麻夹心海苔',3,35,0,'良品铺子芝麻夹心海苔夹心脆片紫菜儿童即食休闲零食小吃',52,17,10,0,'http://localhost:8080/img/a_img/7b521a33e6d72c7c48896da3c3723e4.jpg',0,181,400,1,'http://localhost:8080/img/c_img/ed69a9dbecb4442716e48ff5b121df4.jpg'),(18,'南国榴莲糖特浓',3,82,0,'南国榴莲糖特浓海南特产水果软糖休闲网红糖果',74,18,10,0,'http://localhost:8080/img/a_img/756364a711fe7eeb90b3c22b5c1c6a1.jpg',0,45,400,1,'http://localhost:8080/img/c_img/e8d1ee36b79ca93fa3639e4ccfbe653.jpg'),(19,'三只松鼠素肉干',3,250,0,'三只松鼠素肉干',88,19,10,0,'http://localhost:8080/img/a_img/fc75d1d4165cc9f7b13c68c5880d82d.jpg',0,170,400,1,'http://localhost:8080/img/c_img/c5eab9d0956076156676b6596e85a34.jpg'),(20,'贤哥辣条大礼包',3,255,0,'贤哥辣条大礼包网红小吃豆干麻辣味面筋零食',41,20,10,0,'http://localhost:8080/img/a_img/7e96bbb540efeb3852d54df6b6a47e8.jpg',0,200,400,0,'http://localhost:8080/img/c_img/8f92c35bd7d00df267084d0fb96a1e3.jpg'),(21,'百草味多味凤爪大礼包',3,255,0,'百草味多味凤爪大礼包泡椒凤爪鸡肉休闲小吃麻辣味零食小礼包',44,21,10,0,'http://localhost:8080/img/a_img/3b025e55e7c5b7cdb5970ca8a0a60cb.jpg',0,400,100,0,'http://localhost:8080/img/c_img/ec68023ba7b6ef2bf47ea86d8a208e6.jpg'),(22,'卫龙臭豆腐',3,120,0,'卫龙臭豆腐',55,22,10,0,'http://localhost:8080/img/a_img/ebbaef25edb23b7bb9592e3fe3542b6.jpg',0,16,100,0,'http://localhost:8080/img/c_img/3a5ca01be6fac30a1abad8b2aa4a892.jpg'),(23,'百草味爆浆曲奇',4,180,0,'百草味爆浆曲奇',62,23,10,0,'http://localhost:8080/img/a_img/87034066b8f52dbabae73d52621b1a2.jpg',0,28,500,1,'http://localhost:8080/img/c_img/6b44dd2600e7040d4e99fcda9c03d9c.jpg');
/*!40000 ALTER TABLE `shop_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_goods_category`
--

DROP TABLE IF EXISTS `shop_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `category_name` varchar(90) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`),
  KEY `fk2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_goods_category`
--

LOCK TABLES `shop_goods_category` WRITE;
/*!40000 ALTER TABLE `shop_goods_category` DISABLE KEYS */;
INSERT INTO `shop_goods_category` VALUES (1,1,'坚果炒货'),(2,2,'糖果巧克力'),(3,3,'肉干鱼干'),(4,4,'面包蛋卷');
/*!40000 ALTER TABLE `shop_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_goods_image`
--

DROP TABLE IF EXISTS `shop_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_goods_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片id',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `b_img` text NOT NULL COMMENT '商品图片链接',
  PRIMARY KEY (`id`),
  KEY `fk1` (`goods_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`goods_id`) REFERENCES `shop_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='商品相关图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_goods_image`
--

LOCK TABLES `shop_goods_image` WRITE;
/*!40000 ALTER TABLE `shop_goods_image` DISABLE KEYS */;
INSERT INTO `shop_goods_image` VALUES (1,4,'http://localhost:8080/img/b_img/388ed1fe6e64fe818318785a27f8601.jpg'),(2,4,'http://localhost:8080/img/b_img/eb1f42e8ff15161deb08f64a63812c4.jpg'),(3,4,'http://localhost:8080/img/b_img/d99f54b4a18b0e214ba917b68cd53b5.jpg'),(4,4,'http://localhost:8080/img/b_img/c7fd075c4cb4c5c158c078ceddaa7c2.jpg'),(5,1,'http://localhost:8080/img/b_img/a2fa98d0c09703c2456a82ab51c3562.jpg'),(6,1,'http://localhost:8080/img/b_img/669074293c298f190307f31725aebc9.jpg'),(7,1,'http://localhost:8080/img/b_img/f9f48b36f297b282d32ba9f9775b7bb.jpg'),(8,1,'http://localhost:8080/img/b_img/0e20f5c50fc206189c1281677d9e5fa.jpg'),(9,2,'http://localhost:8080/img/b_img/ce4e1819995b5c8d2475f27083ffd07.jpg'),(10,2,'http://localhost:8080/img/b_img/ebf339198df177904143da4baae99a0.jpg'),(11,2,'http://localhost:8080/img/b_img/40eff239126dd1fa433eadf5ade9128.jpg'),(12,2,'http://localhost:8080/img/b_img/7f55f0358bccfa61cb94d493efb47c7.jpg'),(13,3,'http://localhost:8080/img/b_img/0ed3cba613ffb0cce8724800a0f072a.jpg'),(14,3,'http://localhost:8080/img/b_img/ae453adb7f605e510000fdb09a405f0.jpg'),(15,3,'http://localhost:8080/img/b_img/ca6916074a0431daef4d252603fd0ea.jpg'),(16,3,'http://localhost:8080/img/b_img/721748545f31def1829af20cd71dfbd.jpg'),(17,5,'http://localhost:8080/img/b_img/60b8343f08d37c7ec9cbd8e9d034a8e.jpg'),(18,5,'http://localhost:8080/img/b_img/3553018a33720f5cf655af536106b2f.jpg'),(19,5,'http://localhost:8080/img/b_img/7f16a6ca93317ba892139282a5e8447.jpg'),(20,5,'http://localhost:8080/img/b_img/bcaab57e892bea706b5a44070a6afa8.jpg'),(21,6,'http://localhost:8080/img/b_img/12c46249530e6ef83a49f51b045fac1.jpg'),(22,6,'http://localhost:8080/img/b_img/0780e859a5402b30f9761f294a47252.jpg'),(23,6,'http://localhost:8080/img/b_img/3f28dc3734238ed64eb172e5dbd7677.jpg'),(24,6,'http://localhost:8080/img/b_img/41ae3073615a055751399e6ddaac13b.jpg'),(25,7,'http://localhost:8080/img/b_img/ff0cf948865226e209ad5007cb73e1c.jpg'),(26,7,'http://localhost:8080/img/b_img/09d35eeffed50e54a460de0c0fdbf64.jpg'),(27,7,'http://localhost:8080/img/b_img/77356fee00251aa8b2a5ecf0ff62963.jpg'),(28,7,'http://localhost:8080/img/b_img/45ea1a269d865ad4839fa5140a0c5c4.jpg'),(29,8,'http://localhost:8080/img/b_img/a0797baa603a54c4ab31d028d4038ab.jpg'),(30,8,'http://localhost:8080/img/b_img/81f253c1f83c0682c70d8998940b02c.jpg'),(31,8,'http://localhost:8080/img/b_img/5125cedc08f709c44cb69247fcbe8c0.jpg'),(32,9,'http://localhost:8080/img/b_img/1141b168f1e7bebcc7088193a0dd063.jpg'),(33,9,'http://localhost:8080/img/b_img/3575026cc9126524e72d6c590da98b0.jpg'),(34,9,'http://localhost:8080/img/b_img/b615c36c2168fb7d882a1ea3f880c16.jpg'),(35,10,'http://localhost:8080/img/b_img/bda16806974adc998cec9e19377d2e4.jpg'),(36,10,'http://localhost:8080/img/b_img/37800a2f891418802acfc86e6da34b0.jpg'),(37,10,'http://localhost:8080/img/b_img/16773b2f2689eadceac86630c274ec7.jpg'),(38,11,'http://localhost:8080/img/b_img/aa4db10956964424126036fa69cd57b.jpg'),(39,11,'http://localhost:8080/img/b_img/498356540cc7fb78172e56c054c71b0.jpg'),(40,11,'http://localhost:8080/img/b_img/6d76e05ddfd11e2ef0667656ea406f8.jpg'),(41,12,'http://localhost:8080/img/b_img/bafbd2745dbf6438df4022c1b868253.jpg'),(42,12,'http://localhost:8080/img/b_img/cdaf57147b2e3405f77ea5005374606.jpg'),(43,12,'http://localhost:8080/img/b_img/36f2324a1e27864fbb0b2158093c4b8.jpg'),(44,13,'http://localhost:8080/img/b_img/ee3ad3de7052035e8d4284c0e5c784c.jpg'),(45,13,'http://localhost:8080/img/b_img/9ae0b50afaea1de3832e43943e90fd5.jpg'),(46,13,'http://localhost:8080/img/b_img/4497455c7f24becf83161466f5d835f.jpg'),(47,14,'http://localhost:8080/img/b_img/abfde9da64ddb242f23e3b314fc645a.jpg'),(48,14,'http://localhost:8080/img/b_img/80934eca58334d211a072850f8735ad.jpg'),(49,14,'http://localhost:8080/img/b_img/27d09a0b4a23b25ae74b99615ab35ef.jpg'),(50,15,'http://localhost:8080/img/b_img/d7654b25f0f386fcbda9c769f7335a8.jpg'),(51,15,'http://localhost:8080/img/b_img/a787f0f62fed64eb12ee35be032e6f8.jpg'),(52,15,'http://localhost:8080/img/b_img/3626e8e4dca1d987a3e37f6b4287748.jpg'),(53,16,'http://localhost:8080/img/b_img/cae4768890159264ec4136d68b513c2.jpg'),(54,16,'http://localhost:8080/img/b_img/aac29333fcf94f0219d06383d5c3c1e.jpg'),(55,16,'http://localhost:8080/img/b_img/142bbb8a880d1014076aaf0556a6fcd.jpg'),(56,16,'http://localhost:8080/img/b_img/122bd2e39b8092e54f5ca3ef84ad4d8.jpg'),(57,17,'http://localhost:8080/img/b_img/7b6292d452cbe688ab588907d31ffa9.jpg'),(58,17,'http://localhost:8080/img/b_img/673a246d695f0a5ddb96bfaa547d283.jpg'),(59,17,'http://localhost:8080/img/b_img/2e7990c8dfffc64b1dc610039284d71.jpg'),(60,18,'http://localhost:8080/img/b_img/f076dd2e6226d7ae853b50a0614261a.jpg'),(61,18,'http://localhost:8080/img/b_img/01919ae096b23c471e0c5217d0b61a9.jpg'),(62,18,'http://localhost:8080/img/b_img/58c6075de9b9beaa008bd990a53210f.jpg'),(63,19,'http://localhost:8080/img/b_img/ade8f2315c737518fefb671dbf85f56.jpg'),(64,19,'http://localhost:8080/img/b_img/624a7f90944ddbdc59e1b1cdecc592d'),(65,19,'http://localhost:8080/img/b_img/925548c1c89e413464c2eb420494c78.jpg'),(66,20,'http://localhost:8080/img/b_img/532edbe22b8ab7e23e1a800f167b64d.jpg'),(67,20,'http://localhost:8080/img/b_img/25f0fda1394e0d2be1b45a814a181ac.jpg'),(68,20,'http://localhost:8080/img/b_img/b9688a7da11c967e9f5537315182444.jpg'),(69,21,'http://localhost:8080/img/b_img/c02785cf4d4622682b3ed4340901c91.jpg'),(70,21,'http://localhost:8080/img/b_img/1244bb892b806052074788512bb90fe.jpg'),(71,21,'http://localhost:8080/img/b_img/b8fa8ab51a53f267023fc03f0faa661.jpg'),(72,22,'http://localhost:8080/img/b_img/ad6db4fc6915ce05a72a439006529d8.jpg'),(73,22,'http://localhost:8080/img/b_img/63eb0e51db4524397fba22f7c6b15bf.jpg'),(74,22,'http://localhost:8080/img/b_img/6dfb0913c31f3e929b23b76117e5c7c.jpg'),(75,23,'http://localhost:8080/img/b_img/035bb9e4e33330e9b7e1de60dafa316.jpg'),(76,23,'http://localhost:8080/img/b_img/500cf5562e68f694c70fe7cc26eee8b.jpg'),(77,23,'http://localhost:8080/img/b_img/186c4534982c9a968ea978a30306c4a.jpg');
/*!40000 ALTER TABLE `shop_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `total_price` decimal(10,2) NOT NULL COMMENT '总金额',
  `pay_status` tinyint(3) NOT NULL DEFAULT '10',
  `express_price` decimal(10,2) NOT NULL DEFAULT '10.00' COMMENT '运费',
  `assess_status` tinyint(3) NOT NULL DEFAULT '10' COMMENT '评论状态（10为未评论，20为已评论）',
  `order_status` tinyint(3) NOT NULL DEFAULT '10' COMMENT '订单状态（10为未付款，20为未发货，30为未确定收货，40为已完成订单）',
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户真实姓名',
  `detail_Info` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户地址详情',
  `tel_number` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户电话号码',
  `region` text COLLATE utf8_bin NOT NULL COMMENT '用户所在地区',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `transaction_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '微信支付id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (47,'200306090901478',1,420.00,10,10.00,10,20,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 01:09:01',NULL),(48,'200306091821428',1,420.00,10,10.00,10,20,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 01:18:21',NULL),(49,'200306092033901',1,420.00,10,10.00,10,20,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 01:20:33',NULL),(50,'200306094245785',1,420.00,10,10.00,20,40,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 01:42:45',NULL),(51,'200306025105508',1,420.00,10,10.00,20,40,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 06:51:06',NULL),(52,'200306025200181',1,420.00,10,10.00,10,40,'asssasdas','sddsds','15521419818','内蒙古自治区,呼和浩特市,新城区','2020-03-06 06:52:01',NULL),(53,'200306053823547',1,171.00,10,10.00,10,20,'hhjj','trtthhhhhhhhhhhhhh','15521419818','北京市,北京市,东城区','2020-03-06 09:38:24',NULL),(54,'200306060920183',1,5.00,10,10.00,10,20,'hhjj','trtthhhhhhhhhhhhhh','15521419818','北京市,北京市,东城区','2020-03-06 10:09:21',NULL),(55,'200306060935827',1,13.00,10,10.00,10,20,'hhjj','trtthhhhhhhhhhhhhh','15521419818','北京市,北京市,东城区','2020-03-06 10:09:36',NULL),(56,'200307093231617',1,52.00,10,10.00,10,20,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 01:32:31',NULL),(57,'200307074104979',1,171.00,10,10.00,10,10,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 11:41:05',NULL),(58,'200307074121767',1,275.00,10,10.00,10,20,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 11:41:22',NULL),(59,'200307075347646',1,275.00,10,10.00,10,10,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 11:53:48',NULL),(60,'200307075412706',1,275.00,10,10.00,10,10,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 11:54:13',NULL),(61,'200307080331772',1,285.00,10,10.00,10,10,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 12:03:31',NULL),(62,'200307080354544',1,37.00,10,10.00,10,10,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-07 12:03:54',NULL),(63,'200308123359763',1,13.00,10,10.00,20,40,'weee','weweedddddddddddddddddddd','15521419818','天津市,天津市,和平区','2020-03-08 04:34:00',NULL),(64,'200308115010324',1,40.00,10,10.00,10,10,'uuu','jjjjjjjjjjj','15521419818','河北省,石家庄市,长安区','2020-03-08 15:50:11',NULL),(65,'200308115049760',1,50.00,10,10.00,10,20,'uuu','jjjjjjjjjjj','15521419818','河北省,石家庄市,长安区','2020-03-08 15:50:50',NULL),(66,'200309094056786',1,5.00,10,10.00,10,10,'hhjj','trtthhhhhhhhhhhhhh','15521419818','北京市,北京市,东城区','2020-03-09 01:40:56',NULL),(67,'200309121558552',1,39.00,10,10.00,10,10,'hhjj','trtthhhhhhhhhhhhhh','15521419818','北京市,北京市,东城区','2020-03-09 04:15:58',NULL);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_detail`
--

DROP TABLE IF EXISTS `shop_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `goods_id` int(11) NOT NULL COMMENT '订单详情商品id',
  `order_no` varchar(45) NOT NULL COMMENT '订单号',
  `count` int(11) NOT NULL COMMENT '订单详情每件商品的数量',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_img_url` text NOT NULL COMMENT '商品主要图片',
  `counter_price` int(11) NOT NULL COMMENT '商品单价',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_detail`
--

LOCK TABLES `shop_order_detail` WRITE;
/*!40000 ALTER TABLE `shop_order_detail` DISABLE KEYS */;
INSERT INTO `shop_order_detail` VALUES (53,1,'200305075538930',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(54,3,'200305075538930',7,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(55,1,'200305075828688',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(56,3,'200305075828688',7,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(57,1,'200305080600508',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(58,3,'200305080600508',7,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(59,1,'200305104648100',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(60,3,'200305104648100',7,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(61,1,'200305104722505',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(62,3,'200305104722505',7,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(63,1,'200305114649598',7,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(64,3,'200305114649598',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(65,1,'200306120543371',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(66,3,'200306120543371',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(67,1,'200306013034913',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(68,3,'200306013034913',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(69,1,'200306013120581',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(70,3,'200306013120581',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(71,1,'200306013309616',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(72,3,'200306013309616',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(73,1,'200306013511748',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(74,3,'200306013511748',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(75,1,'200306085210832',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(76,3,'200306085210832',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(77,1,'200306085302949',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(78,3,'200306085302949',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(79,1,'200306090901478',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(80,3,'200306090901478',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(81,1,'200306091821428',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(82,3,'200306091821428',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(83,1,'200306092033901',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(84,3,'200306092033901',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(85,1,'200306094245785',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(86,3,'200306094245785',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(87,1,'200306025105508',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(88,3,'200306025105508',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(89,1,'200306025200181',9,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(90,3,'200306025200181',10,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(91,3,'200306053823547',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(92,8,'200306053823547',6,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(93,3,'200306060920183',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(94,4,'200306060935827',1,'徐福记蛋黄沙琪玛','http://localhost:8080/img/a_img/643ac42c5e9bc5f2f4a582f06dc3ac3.jpg',13,1),(95,4,'200307093231617',4,'徐福记蛋黄沙琪玛','http://localhost:8080/img/a_img/643ac42c5e9bc5f2f4a582f06dc3ac3.jpg',13,1),(96,3,'200307074104979',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(97,8,'200307074104979',6,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(98,3,'200307074121767',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(99,8,'200307074121767',10,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(100,3,'200307075347646',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(101,8,'200307075347646',10,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(102,3,'200307075412706',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(103,8,'200307075412706',10,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(104,3,'200307080331772',3,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(105,8,'200307080331772',10,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(106,7,'200307080354544',1,'至梵核桃味瓜子','\nhttp://localhost:8080/img/a_img/92de718cdb9c2db0f8315bedbbbd513.jpg\n',1,1),(107,8,'200307080354544',1,'百草味夏威夷果','\nhttp://localhost:8080/img/a_img/e73c51838f634ea209ad70ab8c259fc.jpg\n',26,1),(108,4,'200308123359763',1,'徐福记蛋黄沙琪玛','http://localhost:8080/img/a_img/643ac42c5e9bc5f2f4a582f06dc3ac3.jpg',13,1),(109,1,'200308115010324',1,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(110,1,'200308115049760',1,'甘源年货零食','http://localhost:8080/img/a_img/450f21789e529d057bfb51dae821d24.jpg',40,1),(111,3,'200309094056786',1,'卫龙大辣棒','http://localhost:8080/img/a_img/45e6003b321b1f19c434b3ecb620c49.jpg',5,1),(112,5,'200309121558552',1,'三只松鼠混合坚果','\r http://localhost:8080/img/a_img/508213d34814f3cbc50d4f55e27d725.jpg',29,1);
/*!40000 ALTER TABLE `shop_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'open_id',
  `nickName` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '昵称',
  `gender` tinyint(3) NOT NULL COMMENT '性别',
  `country` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '国家',
  `province` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '省份',
  `city` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '城市',
  `address_id` int(10) NOT NULL DEFAULT '0' COMMENT '默认地址id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user`
--

LOCK TABLES `shop_user` WRITE;
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` VALUES (1,'oIQhe5UFhr7xMWhwKSOobVZXrif8','Gum?',1,'中国','广东','广州',8);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shop'
--

--
-- Dumping routines for database 'shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-11  9:46:43
