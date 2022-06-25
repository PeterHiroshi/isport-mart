DROP DATABASE IF EXISTS `sports`;
CREATE DATABASE IF NOT EXISTS `sports`;
USE `sports`;
SET FOREIGN_KEY_CHECKS=0;
set sql_mode=(select replace(@@sql_mode,'NO_ZERO_IN_DATE,NO_ZERO_DATE',''));

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`
(
    `productId`    int(11) NOT NULL AUTO_INCREMENT,
    `productCount` int(11) NOT NULL,
    `userName`     varchar(20) NOT NULL,
    `productPrice` double(20, 2) NOT NULL,
    `subTotal` double(255,2) NOT NULL,
    PRIMARY KEY (`productId`),
    KEY `PK2` (`userName`),
    CONSTRAINT `PK2` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('4', '1', 'xxxx@163.com', '165.00', '165.00');
INSERT INTO `cart` VALUES ('18', '1', 'yyy@163.com', '48.00', '48.00');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT,
    `className` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '零食');
INSERT INTO `classify` VALUES ('2', '水杯');
INSERT INTO `classify` VALUES ('3', '水果');
INSERT INTO `classify` VALUES ('4', '水龙头');
INSERT INTO `classify` VALUES ('5', '包');
INSERT INTO `classify` VALUES ('6', '水果刀');
INSERT INTO `classify` VALUES ('7', '电子产品');

-- ----------------------------
-- Table structure for hobb
-- ----------------------------
DROP TABLE IF EXISTS `hobby`;
CREATE TABLE `hobby`
(
    `id`        int(10) NOT NULL AUTO_INCREMENT,
    `username`  varchar(255) NOT NULL,
    `className` varchar(255) NOT NULL,
    `viewCount` int(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hobby
-- ----------------------------
INSERT INTO `hobby` VALUES ('23', 'winnie_ent@163.com', '零食', '13');
INSERT INTO `hobby` VALUES ('24', 'winnie_ent@163.com', '包', '12');
INSERT INTO `hobby` VALUES ('25', 'winnie_ent@163.com', '电子产品', '8');
INSERT INTO `hobby` VALUES ('26', 'combo_ent@163.com', '包', '3');
INSERT INTO `hobby` VALUES ('27', 'combo_ent@163.com', '零食', '5');
INSERT INTO `hobby` VALUES ('28', 'combo_ent@163.com', '电子产品', '6');
INSERT INTO `hobby` VALUES ('29', 'combo_ent@163.com', '水杯', '1');
INSERT INTO `hobby` VALUES ('30', 'winnie_ent@163.com', '水果', '1');
INSERT INTO `hobby` VALUES ('31', 'winnie_ent@163.com', '水果刀', '2');
INSERT INTO `hobby` VALUES ('32', 'winnie_ent@163.com', '水龙头', '1');
INSERT INTO `hobby` VALUES ('33', 'winnie_ent@163.com', '水杯', '5');
INSERT INTO `hobby` VALUES ('34', '656113322@126.com', '水杯', '1');
INSERT INTO `hobby` VALUES ('35', '656113322@126.com', '零食', '1');
INSERT INTO `hobby` VALUES ('36', '656113322@126.com', '包', '1');
INSERT INTO `hobby` VALUES ('37', '656113322@126.com', '水果', '1');
INSERT INTO `hobby` VALUES ('38', '656113322@126.com', '电子产品', '1');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`
(
    `id`       int(10) NOT NULL AUTO_INCREMENT,
    `proTotal` double(20, 0) NOT NULL,
    `orderId` int(10) NOT NULL,
    `proId` int(10) NOT NULL,
    `proNum` int(10) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `order_pk` (`orderId`),
    KEY `pro_pk` (`proId`),
    CONSTRAINT `order_pk` FOREIGN KEY (`orderId`) REFERENCES `uorder` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `pro_pk` FOREIGN KEY (`proId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product`
VALUES ('34', '15', '56', '14', '1');
INSERT INTO `order_product`
VALUES ('35', '25', '57', '15', '1');
INSERT INTO `order_product`
VALUES ('36', '19', '58', '3', '2');
INSERT INTO `order_product`
VALUES ('37', '11', '58', '2', '2');
INSERT INTO `order_product`
VALUES ('38', '10', '59', '19', '1');
INSERT INTO `order_product`
VALUES ('39', '19', '59', '3', '1');
INSERT INTO `order_product`
VALUES ('40', '450', '59', '17', '1');
INSERT INTO `order_product`
VALUES ('41', '26', '59', '5', '1');
INSERT INTO `order_product`
VALUES ('42', '15', '59', '14', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `productName`  varchar(255) NOT NULL,
    `productPrice` double(20, 1) NOT NULL,
    `count` int(11) NOT NULL,
    `productLogo` varchar(255) NOT NULL,
    `productCity` varchar(255) NOT NULL,
    `classId` int(11) NOT NULL,
    `viewCount` int(255) NOT NULL,
    PRIMARY KEY (`id`,`classId`),
    KEY `FK1` (`classId`),
    CONSTRAINT `FK1` FOREIGN KEY (`classId`) REFERENCES `classify` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '雀巢脆脆鲨巧克力味夹心威化24+8条休闲饼干新老包装随机发2倍购', '26.0', '12', 'lingshi1.png', '北京', '1', '346');
INSERT INTO `product` VALUES ('2', '【三只松鼠_小团圆月饼160g】传统特产中秋台式月饼小礼盒2只装\r\n中秋新潮礼 300款零食 限1件', '11.0', '325', 'sanzhi.jpg', '芜湖', '1', '276');
INSERT INTO `product` VALUES ('3', '印尼进口零食richeese丽芝士奶酪威化饼干nabati纳宝帝玉米棒', '19.0', '263', 'lingshi2.png', '北京', '1', '129');
INSERT INTO `product` VALUES ('4', '2017新款链条包时尚迷你小包包女包百搭韩版潮牛皮单肩斜挎小方包\r\n牛皮打造口碑产品配两种肩带链条+皮质', '165.0', '600', 'bao1.png', '云南', '5', '41');
INSERT INTO `product` VALUES ('5', '海南红心木瓜 水果 新鲜 包邮 三亚特产夏威夷现摘冰糖牛奶8斤', '26.0', '3920', 'mugua.png', '广西', '3', '1255');
INSERT INTO `product` VALUES ('6', '百汉BH-6521S全铜卫浴龙头单孔面盆水龙头冷热台盆水龙头旋转龙头', '385.0', '1031', 'tou.jpg', '北京', '4', '1094');
INSERT INTO `product` VALUES ('7', '新款菜篮子包真皮女包拼色荔枝纹单肩手提包头层牛皮水桶包子母包', '158.0', '2353', 'bao.png', '广州', '5', '1085');
INSERT INTO `product` VALUES ('8', '贝瑟斯陶瓷刀水果削皮刀削皮器3件套新老包装随机', '909.0', '6321', 'guo.png', '山东', '6', '1040');
INSERT INTO `product` VALUES ('9', '正宗临海涌泉蜜桔橘子水果桔子新鲜早熟宫川无核黄岩蜜橘现摘现发', '52.0', '1882', 'miju.png', '浙江', '3', '1101');
INSERT INTO `product` VALUES ('10', '潜水艇洗衣池水龙头冷热水洗衣台洗衣槽洗衣柜厨房洗菜盆水槽龙头', '1000.0', '1102', 'long.jpg', '福州', '4', '1293');
INSERT INTO `product` VALUES ('11', '水忆寒削苹果神器手摇多功能削苹果机苹果削皮器水果削皮器削皮刀', '20.0', '5540', 'dao.jpg', '义乌', '6', '355682');
INSERT INTO `product` VALUES ('12', '苹果6/7/8/x贴纸数据线保护套绳ipad充电器保护线贴纸耳机绕线器', '18.0', '320', 'pinguo1.png', '广州', '7', '231');
INSERT INTO `product` VALUES ('13', '倍思苹果6数据线绕线器磁吸固定器桌面理线器安卓充电线收纳集线\r\n拒绝杂乱 告别弯腰 底座循环使用', '21.0', '200', 'pinguo2.png', '杭州', '7', '1002');
INSERT INTO `product` VALUES ('14', '奥瑞朗iphone6钢化玻璃膜苹果6s钢化膜7防指纹6plus手机膜8抗蓝光\r\n高清抗蓝光防爆防刮防指纹送贴膜器', '15.0', '100', 'pinguo3.png', '北京', '7','2305');
INSERT INTO `product` VALUES ('15', '苹果7plus手机壳iphone7壳女款硅胶防摔保护套挂绳全包软壳8萌韩\r\n复古风浮雕彩绘+时尚长短挂绳', '25.0', '300', 'pinguo4.png', '杭州', '7', '208');
INSERT INTO `product` VALUES ('16', 'anello双肩包日本代购妈咪包女防盗手提背包离家出走包学生书包男', '256.0', '10', 'bao2.png', '香港', '5', '63014');
INSERT INTO `product` VALUES ('17', '正品瑞典北极狐/fjallraven双肩包kanken背包classic书包mini现货', '450.0', '1203', 'bao3.png', '杭州', '5', '364');
INSERT INTO `product` VALUES ('18', '富光玻璃杯 双层便携水杯创意带盖过滤办公杯子 男女耐热车载茶杯', '48.0', '362', 'bei1.png', '厦门', '2', '965');
INSERT INTO `product` VALUES ('19', '创意陶瓷杯子大容量水杯马克杯简约情侣杯带盖勺咖啡杯牛奶杯定制\r\n配件升级 当天发货 破损补发 送杯垫', '10.0', '102', 'bei2.png', '上海', '2', '36');
INSERT INTO `product` VALUES ('20', '杯子陶瓷马克杯带盖复古水杯办公室创意茶缸定制怀旧经典仿搪瓷杯', '15.0', '23', 'bei3.png', '广州', '2', '101');

-- ----------------------------
-- Table structure for uorder
-- ----------------------------
DROP TABLE IF EXISTS `uorder`;
CREATE TABLE `uorder`
(
    `orderId`    int(10) NOT NULL AUTO_INCREMENT,
    `orderNum`   int(50) NOT NULL,
    `orderDate`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
    `orderTotal` double(20, 3) NOT NULL,
    `userName` varchar(20) NOT NULL,
    `orderStatus` int(10) DEFAULT '1',
    PRIMARY KEY (`orderId`),
    KEY `user_order` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uorder
-- ----------------------------
INSERT INTO `uorder` VALUES ('56', '1', '2017-12-11 16:59:34', '15.000', 'combo_ent@163.com', '1');
INSERT INTO `uorder` VALUES ('57', '1', '2017-12-11 17:00:49', '25.000', 'combo_ent@163.com', '1');
INSERT INTO `uorder` VALUES ('58', '2', '2017-12-11 17:02:54', '60.000', 'winnie_ent@163.com', '1');
INSERT INTO `uorder` VALUES ('59', '5', '2017-12-11 17:29:17', '520.000', '656113322@126.com', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `userId`     int(10) NOT NULL AUTO_INCREMENT,
    `userName`   varchar(20) NOT NULL,
    `pwd`        varchar(10) NOT NULL,
    `status`     varchar(10) NOT NULL,
    `qq`         varchar(11) NOT NULL,
    `registerTime` datetime  NOT NULL DEFAULT NOW(),
    PRIMARY KEY (`userId`),
    UNIQUE KEY `uniq_userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('1254562@qq.com', '1', '2', '9238893', '2017-08-16 14:22:49');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('2364856@qq.com', '9090', '2', '556232', '2017-11-30 14:22:39');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('36523@163.com', '345', '2', '9822112', '2017-10-31 14:22:43');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('656113322@126.com', '8989', '2', '4123341', '2017-12-04 14:22:34');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('combo_bus@163.com', '1234', '2', '299346', '2017-12-08 16:57:14');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('combo_ent@163.com', '123456', '2', '340018901', '2017-12-08 15:25:35');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('winnie_bus@163.com', 'admin', '2', '456213332', '2017-08-16 09:32:32');
INSERT INTO `user`(`userName`, `pwd`, `status`, `qq`, `registerTime`) VALUES ('winnie_ent@163.com', '1', '2', '128390201', '2017-11-07 09:32:08');
