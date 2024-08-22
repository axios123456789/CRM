/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 22/08/2024 17:11:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_activity
-- ----------------------------
DROP TABLE IF EXISTS `c_activity`;
CREATE TABLE `c_activity`  (
                               `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `startDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `endDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_activity
-- ----------------------------
INSERT INTO `c_activity` VALUES ('15c9e3690037476e8b9c6b32d541148d', 'c71f1f6f3aa24dfaa3816c34b4b4c263', '报刊宣传', '2024-11-01', '2024-11-30', '100000', '这是第二次的报刊推广产品。', '2023-11-22 21:58:14', '张三', '2023-12-25 22:25:08', '段程');
INSERT INTO `c_activity` VALUES ('1d52c197d9714c5f9dcbf166833b7baa', '7e737c0507174dfdbe6a208b96234c10', '发传单', '2024-02-10', '2024-02-29', '25000', '产品推销', '2024-02-10 19:49:25', '肖佳', '2024-02-10 20:41:07', '肖佳');
INSERT INTO `c_activity` VALUES ('34abf851c1c64c6c91c3b3ccb7c07443', '7e737c0507174dfdbe6a208b96234c10', '互联网推广', '2024-01-01', '2024-02-01', '5000000', '再一次在虚空终端宣传产品，让产品得到更好的推广。', '2023-11-22 21:50:00', '张三', '2023-12-11 14:15:42', '肖佳');
INSERT INTO `c_activity` VALUES ('3693c69f5e124d6e82dbe9c101e7cc7f', '7e737c0507174dfdbe6a208b96234c10', '幸运抽奖', '2023-10-02', '2023-10-10', '3000000', '这是一个抽奖活动，只需要将自己信息登录一下即可免费参与抽奖，这个活动目的是得到大量潜在客户信息，为以后产品卖出做铺垫。', '2023-11-22 21:42:16', '张三', '2023-12-11 14:29:53', '肖佳');
INSERT INTO `c_activity` VALUES ('4e1b14b678164c5781d4ae40d29a77cd', '7e737c0507174dfdbe6a208b96234c10', '发传单', '2023-11-07', '2023-12-06', '300000', '初次通过发传单宣传北国产品。', '2023-11-25 20:36:02', '张三', '2024-02-08 19:02:22', '肖佳');
INSERT INTO `c_activity` VALUES ('4eb50d882de04c999c7eae41979e7a88', 'fa99b7131050421b9cb2135fb9d0b119', '报刊宣传', '2024-02-01', '2024-02-29', '30000', '将我们北国产品登到蒸鸟日报上，让各地民众，各个大公司知晓我们的产品！', '2023-11-22 22:01:30', '张三', '2023-12-11 14:03:35', '肖佳');
INSERT INTO `c_activity` VALUES ('73d95d2f520140ba832b18255ac36ae3', '7e737c0507174dfdbe6a208b96234c10', '产品试用', '2023-09-01', '2023-09-02', '100000', '在大众面前招自愿者试用我们的产品，让大众感受我们产品的强大，对我们的产品产生兴趣。', '2023-11-22 21:55:39', '张三', '2023-12-11 14:07:39', '肖佳');
INSERT INTO `c_activity` VALUES ('75f99fe83c4d4f0880e4ea898be23d30', 'c71f1f6f3aa24dfaa3816c34b4b4c263', '直播宣传', '2024-11-09', '2024-11-10', '200000', '一次叫多个博主宣传产品。', '2023-11-22 21:38:50', '张三', '2023-12-25 22:25:23', '段程');
INSERT INTO `c_activity` VALUES ('a2570ae1918645b4890a312f3ab2afd6', 'fa99b7131050421b9cb2135fb9d0b119', '1233', '', '', '', '', '2024-05-12 13:19:44', '张三', NULL, NULL);
INSERT INTO `c_activity` VALUES ('a3589dd824e94ad0bc66b21d2567765d', '5357e6797c644c25944af050331be3aa', '报刊宣传', '2023-12-12', '2023-12-20', '200000', '', '2023-12-24 22:50:37', '肖佳', '2023-12-25 22:26:27', '段程');
INSERT INTO `c_activity` VALUES ('a65b6f2779c7421ba697f6da2b5a0f8f', '5357e6797c644c25944af050331be3aa', '推广会', '2024-05-22', '2024-05-31', '2000', '这是推广公司的产品的一个活动', '2024-05-04 17:26:41', '肖佳', NULL, NULL);
INSERT INTO `c_activity` VALUES ('cc492b0c78f3472faf41ac10b879865e', '5357e6797c644c25944af050331be3aa', '发传单', '2024-01-01', '2024-01-05', '10000', '这是一次将产品推销到各地的传单！', '2023-11-19 17:35:00', '张三', '2023-12-11 13:49:54', '肖佳');
INSERT INTO `c_activity` VALUES ('cf49a989e7c342b9b3a387520c57911b', 'fa99b7131050421b9cb2135fb9d0b119', '互联网推广', '2023-11-22', '2023-12-30', '20000000', '这是用巨大的代价换来的在虚空终端推广北国产品的机会，为了让所有公司知晓我们的产品，并且对我们的产品产生购买的兴趣。', '2023-11-22 21:53:09', '张三', '2023-12-11 14:13:29', '肖佳');
INSERT INTO `c_activity` VALUES ('e74c432c9bbf4a2d9de621f275519694', '7e737c0507174dfdbe6a208b96234c10', '发传单', '2023-12-01', '2023-12-10', '5000', '这是在璃月发行的传单，意在将北国产品宣传到璃月。', '2023-11-23 19:18:05', '肖佳', '2023-12-11 13:47:42', '肖佳');
INSERT INTO `c_activity` VALUES ('f116c15392d94154b73e86f0d61b3ecf', '5357e6797c644c25944af050331be3aa', '产品试用', '2024-05-01', '2024-05-02', '200000', '在产品得到优化的再一次试用。', '2023-11-22 21:47:47', '张三', '2023-12-11 14:21:22', '肖佳');
INSERT INTO `c_activity` VALUES ('f55723c0a6a142c0bdf8343450bce756', '5357e6797c644c25944af050331be3aa', '直播宣传', '2023-12-01', '2024-12-02', '10000', '叫某个知名博主宣传以下产品。', '2023-11-22 21:44:50', '张三', '2023-12-11 14:24:32', '肖佳');

-- ----------------------------
-- Table structure for c_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `c_activity_remark`;
CREATE TABLE `c_activity_remark`  (
                                      `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_activity_remark
-- ----------------------------
INSERT INTO `c_activity_remark` VALUES ('08351c6aca304a46ada7ff02608b3a5e', '123', '2024-05-12 13:19:51', '张三', NULL, NULL, '0', 'a2570ae1918645b4890a312f3ab2afd6');
INSERT INTO `c_activity_remark` VALUES ('0f9217002d434803b2de26fa17c897ad', '这个传单活动获得的市场回响很大', '2024-02-10 21:08:38', '肖佳', NULL, NULL, '0', '1d52c197d9714c5f9dcbf166833b7baa');
INSERT INTO `c_activity_remark` VALUES ('10e9006f227445a18cfd549d5d7651af', '此次宣传了两个产品！😊', '2023-12-25 22:30:34', '段程', NULL, NULL, '0', '15c9e3690037476e8b9c6b32d541148d');
INSERT INTO `c_activity_remark` VALUES ('40f0b7b1648c41c1933c27a1104e8d8b', '这个活动收集了很多线索。', '2024-05-04 17:27:17', '肖佳', '2024-05-04 17:27:23', '肖佳', '1', 'a65b6f2779c7421ba697f6da2b5a0f8f');
INSERT INTO `c_activity_remark` VALUES ('4137ef2a23a54448a5d1a1aff801d10c', '这个真滴好啊\n我就******\n你********\n这个是什么*****产品', '2023-11-22 16:39:40', '张三', '2023-11-22 16:40:21', '张三', '1', 'cc492b0c78f3472faf41ac10b879865e');
INSERT INTO `c_activity_remark` VALUES ('66c37b38364340c1b3608f772df8a685', '对啊', '2024-02-10 21:08:44', '肖佳', NULL, NULL, '0', '1d52c197d9714c5f9dcbf166833b7baa');
INSERT INTO `c_activity_remark` VALUES ('a6a3733544714926bcb59c444368399a', '这个宣传达到的意想不到的效果', '2024-04-23 21:30:36', '肖佳', NULL, NULL, '0', 'a3589dd824e94ad0bc66b21d2567765d');
INSERT INTO `c_activity_remark` VALUES ('b0cdb9f61e4c487cad115ae790352ff3', '发一手好传单', '2023-11-24 19:53:26', '张三', NULL, NULL, '0', 'e74c432c9bbf4a2d9de621f275519694');
INSERT INTO `c_activity_remark` VALUES ('cfdf5de23d7b4132ae7f2c0b46a6b2cd', '传单满天飞啊', '2023-12-06 21:00:17', '肖佳', '2023-12-06 21:00:24', '肖佳', '1', '4e1b14b678164c5781d4ae40d29a77cd');

-- ----------------------------
-- Table structure for c_clue
-- ----------------------------
DROP TABLE IF EXISTS `c_clue`;
CREATE TABLE `c_clue`  (
                           `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `salutation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `companyExtension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `companyWebsite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `clueStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `clueSource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `contactMinute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `detailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_clue
-- ----------------------------
INSERT INTO `c_clue` VALUES ('4e08b99475b54759942d98cfd1a4d725', '瓦格纳', '先生', 'fa99b7131050421b9cb2135fb9d0b119', '阿里巴巴', '技术总监', '2546988754@qq.com', '377-0597-0041', 'https://github.com/', '17870021234', '已联系', '员工介绍', '张三', '2023-11-19 20:09:59', '肖佳', '2023-12-11 14:57:30', '这个人对我们的产品好像有一点点的兴趣', '着重介绍我们的产品，让他产生购买意向', '2023-11-20', '江西省，吉安市，永丰县');
INSERT INTO `c_clue` VALUES ('5130b3e1a12749288e3dec10d7cf5009', '纳西达', '女士', '5357e6797c644c25944af050331be3aa', '百度', '老板', '2018304838@qq.com', '779-4598-7892', 'https://www.zhipin.com/nanchang/', '15717962834', '试图联系', '合作伙伴', '刘强', '2023-11-24 20:11:19', '肖佳', '2023-12-11 14:41:40', '这是一条重要的线索。', '联系的时候客气些，推销产品的时候口才好些。', '2024-11-30', '须弥，净膳宫');
INSERT INTO `c_clue` VALUES ('57acdc42e5784f8c9187eb141f42dfd4', '阿达而', '女士', '5357e6797c644c25944af050331be3aa', '广州电子科技', '老板', '2012457895@qq.com', '111-5555-9999', 'https://diiq.comn', '15478954512', '未联系', '合作伙伴', '肖佳', '2024-05-04 22:27:25', NULL, NULL, '', '', '2024-05-07', '北京');
INSERT INTO `c_clue` VALUES ('833949138e9749b696a9e5e33f5b080c', '尤拉', '女士', '5357e6797c644c25944af050331be3aa', '动力节点', '人事部部长', '0438438438@qq.com', '0000-7777-038', 'https://v3.bootcss.com', '13851380438', '已联系', '聊天', '张三', '2023-11-22 22:10:39', '肖佳', '2023-12-11 14:54:57', '这个人已经联系过了，似乎有购买意向。', '注意说话方式', '2099-12-31', '蒙德骑士团');
INSERT INTO `c_clue` VALUES ('a972fddf59e24e65bd2c171ced040727', '钟离', '先生', '5357e6797c644c25944af050331be3aa', '福寿园', '客卿', '8357529121@qq.com', '077-038-0024', 'https://gitclone.com/aiit/chat/', '78544567787', '未联系', '聊天', '张三', '2023-11-22 22:27:37', '肖佳', '2023-12-11 14:47:00', '这个人的知识渊博。', '可以多问一些产品的建议性问题，让他对产品提出一些建议。', '2099-12-31', '璃月，无处不在');
INSERT INTO `c_clue` VALUES ('e7ab99c8c91a4c6fb0d167e782afcb00', '胡桃', '女士', '7e737c0507174dfdbe6a208b96234c10', '福寿园', '老板', '2001120423@qq.com', '077-038-0024', 'https://gitclone.com/aiit/chat/', '13667961911', '试图联系', '合作伙伴研讨会', '张三', '2023-11-22 22:22:33', '肖佳', '2023-12-11 14:51:29', '可以和这个公司聊一下本产品。', '小心联系。', '2099-12-31', '璃月，往生堂');
INSERT INTO `c_clue` VALUES ('faecbfb69f12429fba0b4e16bbff8ef2', '老章', '先生', '7e737c0507174dfdbe6a208b96234c10', '阿里巴巴', '普通员工', '2001546875@qq.com', '124-7765-7145', 'https:tiejiangpu', '15412651245', '未联系', '推销电话', '刘强', '2023-11-30 19:29:50', '肖佳', '2023-12-11 14:37:10', '这个人只是公司的一个普通员工，没必要着重联系。', '问一些他的公司相关信息即可。', '', '璃月，铁匠铺');

-- ----------------------------
-- Table structure for c_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `c_clue_activity_relation`;
CREATE TABLE `c_clue_activity_relation`  (
                                             `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                             `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_clue_activity_relation
-- ----------------------------
INSERT INTO `c_clue_activity_relation` VALUES ('022544158a204e529ee594a06c889a19', 'e7ab99c8c91a4c6fb0d167e782afcb00', '75f99fe83c4d4f0880e4ea898be23d30');
INSERT INTO `c_clue_activity_relation` VALUES ('17e1f08c050c4c43905da6dcc16de51d', 'e7ab99c8c91a4c6fb0d167e782afcb00', 'f55723c0a6a142c0bdf8343450bce756');
INSERT INTO `c_clue_activity_relation` VALUES ('210bd8c6b1c74ae0aeaa8b38241b15e7', '5130b3e1a12749288e3dec10d7cf5009', 'f116c15392d94154b73e86f0d61b3ecf');
INSERT INTO `c_clue_activity_relation` VALUES ('4f5d31f7b604478ab4b8b03da9afb8fb', 'faecbfb69f12429fba0b4e16bbff8ef2', 'a3589dd824e94ad0bc66b21d2567765d');
INSERT INTO `c_clue_activity_relation` VALUES ('5577f2404b2c44cc931f5370f892b558', 'faecbfb69f12429fba0b4e16bbff8ef2', '4e1b14b678164c5781d4ae40d29a77cd');
INSERT INTO `c_clue_activity_relation` VALUES ('60ef6a665f93494881a330fff9cb92d7', 'a972fddf59e24e65bd2c171ced040727', 'e74c432c9bbf4a2d9de621f275519694');
INSERT INTO `c_clue_activity_relation` VALUES ('64ce2fde524448c9b65c197da21ab36b', '5130b3e1a12749288e3dec10d7cf5009', '34abf851c1c64c6c91c3b3ccb7c07443');
INSERT INTO `c_clue_activity_relation` VALUES ('6701d15ef3324a32a70ddcd83ad97c50', 'faecbfb69f12429fba0b4e16bbff8ef2', '34abf851c1c64c6c91c3b3ccb7c07443');
INSERT INTO `c_clue_activity_relation` VALUES ('6b5fde881eb84feb8228c442d4b3bf1d', 'e7ab99c8c91a4c6fb0d167e782afcb00', 'e74c432c9bbf4a2d9de621f275519694');
INSERT INTO `c_clue_activity_relation` VALUES ('84ae73d9a9cc4b038d349689fed6f4a4', '833949138e9749b696a9e5e33f5b080c', 'e74c432c9bbf4a2d9de621f275519694');
INSERT INTO `c_clue_activity_relation` VALUES ('9412cdde494e4277ad120d56e00380da', '4e08b99475b54759942d98cfd1a4d725', 'e74c432c9bbf4a2d9de621f275519694');
INSERT INTO `c_clue_activity_relation` VALUES ('948a1a6869794a46b5c9db4f58888d69', '5130b3e1a12749288e3dec10d7cf5009', '3693c69f5e124d6e82dbe9c101e7cc7f');
INSERT INTO `c_clue_activity_relation` VALUES ('a8bf19fe02aa439db797ce43d133bee8', 'a972fddf59e24e65bd2c171ced040727', '75f99fe83c4d4f0880e4ea898be23d30');
INSERT INTO `c_clue_activity_relation` VALUES ('aa9aee2bf4a6449a933e503b0dcebb19', 'a972fddf59e24e65bd2c171ced040727', '73d95d2f520140ba832b18255ac36ae3');
INSERT INTO `c_clue_activity_relation` VALUES ('afa2bdc35ddc4f44b002e228e2790b05', 'e7ab99c8c91a4c6fb0d167e782afcb00', 'cf49a989e7c342b9b3a387520c57911b');
INSERT INTO `c_clue_activity_relation` VALUES ('b4dbe8d8320142ddabc89c4bc7d2cce8', '4e08b99475b54759942d98cfd1a4d725', 'f116c15392d94154b73e86f0d61b3ecf');
INSERT INTO `c_clue_activity_relation` VALUES ('ba478791eba64142a60b9f08548ccc9e', 'faecbfb69f12429fba0b4e16bbff8ef2', 'f116c15392d94154b73e86f0d61b3ecf');
INSERT INTO `c_clue_activity_relation` VALUES ('d408b63f276343dc94faf9fc8fb9fbee', 'e7ab99c8c91a4c6fb0d167e782afcb00', 'cc492b0c78f3472faf41ac10b879865e');
INSERT INTO `c_clue_activity_relation` VALUES ('d70bef8480814b569ea05c4a89151c7a', 'faecbfb69f12429fba0b4e16bbff8ef2', '4eb50d882de04c999c7eae41979e7a88');
INSERT INTO `c_clue_activity_relation` VALUES ('ed367ebe3fb44aabb23ef4443b1f5b13', '833949138e9749b696a9e5e33f5b080c', 'cc492b0c78f3472faf41ac10b879865e');
INSERT INTO `c_clue_activity_relation` VALUES ('fed1a3f8c782491cba95233edf9f05c6', 'e7ab99c8c91a4c6fb0d167e782afcb00', 'f116c15392d94154b73e86f0d61b3ecf');

-- ----------------------------
-- Table structure for c_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `c_clue_remark`;
CREATE TABLE `c_clue_remark`  (
                                  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_clue_remark
-- ----------------------------
INSERT INTO `c_clue_remark` VALUES ('02e4bc3a7d47429a9dd49b91a876f47d', '一个比较好说话的存在', '肖佳', '2023-12-13 13:05:20', NULL, NULL, '0', '5130b3e1a12749288e3dec10d7cf5009');
INSERT INTO `c_clue_remark` VALUES ('1dda3835cd8640ada1303ec96fe9f4e0', '这个人在这个公司有着很大的话语权。', '肖佳', '2023-12-13 13:06:21', '肖佳', '2024-05-04 16:34:21', '1', '5130b3e1a12749288e3dec10d7cf5009');
INSERT INTO `c_clue_remark` VALUES ('223ab8499a0d483fbd5147ec03c183de', '这个改溜子', '肖佳', '2023-11-23 18:34:00', NULL, NULL, '0', 'a972fddf59e24e65bd2c171ced040727');
INSERT INTO `c_clue_remark` VALUES ('339ec1fae25741ad9256df57161bb8b0', '486', '肖佳', '2023-11-24 13:04:58', NULL, NULL, '0', '4e08b99475b54759942d98cfd1a4d725');
INSERT INTO `c_clue_remark` VALUES ('4e08b99475b54759942d98cfd1a4d722', '好好好，这样是吧，呵呵呵........', '张三', '2023-11-22', '肖佳', '2023-11-23 18:34:29', '1', '4e08b99475b54759942d98cfd1a4d725');
INSERT INTO `c_clue_remark` VALUES ('690b2e63a17c41549f12113b714d27df', '买棺材的人来咯', '刘强', '2023-11-24 19:08:34', NULL, NULL, '0', 'e7ab99c8c91a4c6fb0d167e782afcb00');
INSERT INTO `c_clue_remark` VALUES ('731bc9e3db114f5fbcce1ddda467c967', '对的，就是这样。', '张三', '2023-11-22 18:52:40', '张三', '2023-11-23 14:04:25', '1', '4e08b99475b54759942d98cfd1a4d725');

-- ----------------------------
-- Table structure for c_contact
-- ----------------------------
DROP TABLE IF EXISTS `c_contact`;
CREATE TABLE `c_contact`  (
                              `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                              `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `salutation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `birthday` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `contactMinute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `detailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `name_uq_index`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_contact
-- ----------------------------
INSERT INTO `c_contact` VALUES ('24f5bfd9a95644d48e2cf35b965eb361', '7e737c0507174dfdbe6a208b96234c10', 'web调研', '罗莎琳', '女士', '5458793115@qq.com', '13821962911', '管理员', '1986-12-19', '张三', '2023-12-18 20:06:57', NULL, NULL, '', '', '2023-12-21', '', '66b49e0b237847609153d8a4052b608e');
INSERT INTO `c_contact` VALUES ('339ec1fae25741ad9256df57162568b0', 'fa99b7131050421b9cb2135fb9d0b119', '交易会', '丽莎', '女士', '5458795124@qq.com', '13667961911', '管理员', '1987-03-12', NULL, NULL, '肖佳', '2023-12-04 15:58:54', '在世车神，顶级图书管理员', '别被她的车从脸上开过去', '2030-03-12', '蒙德，大教堂。', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_contact` VALUES ('47ab0854ee08418faace4d1af4f107f9', '5357e6797c644c25944af050331be3aa', '推销电话', '张翔', '先生', '2015487545@qq.com', '15478954521', '员工', NULL, '肖佳', '2024-02-06 19:57:15', NULL, NULL, '', '', '', '', 'd07cfd8430e54e49825a06875eb2180e');
INSERT INTO `c_contact` VALUES ('88d30661a8d54094877ecd73e8308700', '5357e6797c644c25944af050331be3aa', '员工介绍', '多托雷', '博士', '1458792324@qq.com', '13837962911', '博士', '2001-12-04', '肖佳', '2023-12-03 22:12:55', '肖佳', '2023-12-04 21:24:28', '132', '1', '2030-12-04', '1', 'abf1667f7c4c4cb7ad91be7d9b0a799d');
INSERT INTO `c_contact` VALUES ('8db80faccc324e08b3533e6323997ced', '5357e6797c644c25944af050331be3aa', '员工介绍', '王二', '女士', '2012457895@qq.com', '15478954512', '员工', NULL, '肖佳', '2024-05-04 17:30:28', NULL, NULL, '', '', '2024-05-22', '广州', '0e5e04ebe96b4582aca9638e60c43478');
INSERT INTO `c_contact` VALUES ('ab1968063685481a99b717fbe94f74f2', 'fa99b7131050421b9cb2135fb9d0b119', '聊天', '诺艾尔', '女士', '2020754232@qq.com', '14578954213', '女仆', NULL, '张三', '2023-12-16 13:05:45', NULL, NULL, '一条有用的线索', '询问什么都可以', '2024-12-30', '北京', '66b49e0b237847609153d8a4052b608e');
INSERT INTO `c_contact` VALUES ('b3adf9eb04c44a41a4ba14126a533080', '5357e6797c644c25944af050331be3aa', '公开媒介', '艾尔海森', '教授', '4458723324@qq.com', '13667660011', '大学者', '2023-12-20', '肖佳', '2023-12-11 15:01:43', '张三', '2023-12-12 13:51:53', '这个人很是冷静聪明', '别跟他玩心眼哦', '2026-12-11', '须弥，大教堂', 'abf1667f7c4c4cb7ad91be7d9b0a799d');
INSERT INTO `c_contact` VALUES ('ddb2536f8f884b76b6af2ed6ece7bcd1', '5357e6797c644c25944af050331be3aa', '销售邮件', '云锦', '女士', '1258722324@qq.com', '13487461240', '经理', '1987-02-16', '张三', '2023-12-18 20:05:16', NULL, NULL, '', '', '2023-12-30', '璃月', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_contact` VALUES ('e8f5a3a50bc94ec99dfbddb4d280f839', '5357e6797c644c25944af050331be3aa', '合作伙伴研讨会', '刘蓝', '女士', '2457895412@qq.com', '45745565478', '员工', NULL, '肖佳', '2024-05-04 16:08:02', NULL, NULL, '一条不重要的线索', '随时联系', '2024-05-22', '北京，上海，广州', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_contact` VALUES ('ead760b758674fbb8a7d0406967ac511', 'fa99b7131050421b9cb2135fb9d0b119', '销售邮件', '凌人', '博士', '200112047832@qq.com', '14572245478', '普工', '2023-12-28', '张三', '2023-12-19 16:45:58', '肖佳', '2023-12-25 14:43:21', '这是一个荣明行业的普通员工', '多联系', '2023-12-09', '江西，南昌', '5e7b1009f0ae4d2d82d02a0b2df47949');
INSERT INTO `c_contact` VALUES ('f6cfa20bb711441999b6830f665c85b7', '7e737c0507174dfdbe6a208b96234c10', '合作伙伴研讨会', '菲谢尔', '女士', '5427725184@qq.com', '13487461944', '技术总监', '2007-12-19', '张三', '2023-12-18 20:03:25', NULL, NULL, '关于产品技术方面的事情可以找她聊聊', '', '2023-12-28', '蒙德', 'baabe1772bfd41859d392a76f9b291d0');

-- ----------------------------
-- Table structure for c_contact_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `c_contact_activity_relation`;
CREATE TABLE `c_contact_activity_relation`  (
                                                `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                                `contactId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                                `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_contact_activity_relation
-- ----------------------------
INSERT INTO `c_contact_activity_relation` VALUES ('167178b0a99d41f181bdfbee0c895f4b', 'ead760b758674fbb8a7d0406967ac511', '4eb50d882de04c999c7eae41979e7a88');
INSERT INTO `c_contact_activity_relation` VALUES ('1baeb0daa4a74079b52566f876d2364c', '8db80faccc324e08b3533e6323997ced', 'a65b6f2779c7421ba697f6da2b5a0f8f');
INSERT INTO `c_contact_activity_relation` VALUES ('33586c236248494d9e50ef473b54994a', 'ead760b758674fbb8a7d0406967ac511', '4eb50d882de04c999c7eae41979e7a88');
INSERT INTO `c_contact_activity_relation` VALUES ('3561326cc4a84487846cf89da431106c', 'ab1968063685481a99b717fbe94f74f2', '73d95d2f520140ba832b18255ac36ae3');
INSERT INTO `c_contact_activity_relation` VALUES ('53396a593d4546e3aa0707a63ef2709c', 'e8f5a3a50bc94ec99dfbddb4d280f839', '1d52c197d9714c5f9dcbf166833b7baa');
INSERT INTO `c_contact_activity_relation` VALUES ('9061b030c43643ccb99f16b6759ddd90', 'ead760b758674fbb8a7d0406967ac511', '4e1b14b678164c5781d4ae40d29a77cd');
INSERT INTO `c_contact_activity_relation` VALUES ('e739e70f81d7488bbcd7b9189f5905ce', 'ab1968063685481a99b717fbe94f74f2', '4e1b14b678164c5781d4ae40d29a77cd');
INSERT INTO `c_contact_activity_relation` VALUES ('f7756ce2a16540bfbdf82805505b82ee', 'ead760b758674fbb8a7d0406967ac511', '4e1b14b678164c5781d4ae40d29a77cd');

-- ----------------------------
-- Table structure for c_contact_remark
-- ----------------------------
DROP TABLE IF EXISTS `c_contact_remark`;
CREATE TABLE `c_contact_remark`  (
                                     `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                     `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     `contactId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_contact_remark
-- ----------------------------
INSERT INTO `c_contact_remark` VALUES ('01bf02b952f44169982b7d087c6cc9d7', '这是一个车神联系人吗', '肖佳', '2023-12-04 21:17:37', NULL, NULL, '0', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_contact_remark` VALUES ('1dd6f191e11049449d0c5083e3c8f83d', '一个广州的线索', '肖佳', '2024-05-04 17:29:56', NULL, NULL, '0', '8db80faccc324e08b3533e6323997ced');
INSERT INTO `c_contact_remark` VALUES ('5b63daf1820c45a9be0ac542697a52e4', '这个人有特殊爱好', '肖佳', '2023-12-04 21:18:05', NULL, NULL, '0', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_contact_remark` VALUES ('72eb605e06c94fdd9ce1ea234b93c0fe', '这个人好毒啊', '肖佳', '2023-12-04 21:16:47', '肖佳', '2023-12-04 21:16:55', '1', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_contact_remark` VALUES ('91c69c215f6046c88930ee63fa50cffe', '这条线索可以转换了', '肖佳', '2024-05-04 16:07:08', NULL, NULL, '0', 'e8f5a3a50bc94ec99dfbddb4d280f839');
INSERT INTO `c_contact_remark` VALUES ('9eab3929a1204bed8d77bb021469c5ac', '我很赞同🤞', '张三', '2023-12-16 13:04:49', NULL, NULL, '0', 'ab1968063685481a99b717fbe94f74f2');
INSERT INTO `c_contact_remark` VALUES ('b05bd328a9fd45249fce4ad8fd9a1a6e', '很好说话的一个人\n', '张三', '2023-12-16 13:03:33', NULL, NULL, '0', 'ab1968063685481a99b717fbe94f74f2');
INSERT INTO `c_contact_remark` VALUES ('bd500803c45948d3afcb196fdff01fd3', 'good', '肖佳', '2023-12-25 14:41:36', NULL, NULL, '0', 'ead760b758674fbb8a7d0406967ac511');
INSERT INTO `c_contact_remark` VALUES ('ea490abff7bf49d6b99218d2f3283e97', '你好！', '张三', '2023-12-10 19:51:02', '张三', '2023-12-10 20:52:34', '1', '88d30661a8d54094877ecd73e8308700');

-- ----------------------------
-- Table structure for c_customer
-- ----------------------------
DROP TABLE IF EXISTS `c_customer`;
CREATE TABLE `c_customer`  (
                               `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `companyWebsite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `companyExtension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `contactMinute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `detailAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE INDEX `name_unique_index`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_customer
-- ----------------------------
INSERT INTO `c_customer` VALUES ('0e5e04ebe96b4582aca9638e60c43478', '5357e6797c644c25944af050331be3aa', '广州电子科技', 'https://diiq.comn', '111-5555-9999', '肖佳', '2024-05-04 17:30:28', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `c_customer` VALUES ('1d916cb8dbae48c0b9db287151456c34', 'fa99b7131050421b9cb2135fb9d0b119', '子初科技', 'https://www.com', '123-4458-5457', '张三', '2023-12-19 16:45:58', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `c_customer` VALUES ('5e7b1009f0ae4d2d82d02a0b2df47949', '5357e6797c644c25944af050331be3aa', '江西荣工', 'https://www.com', '124-5547-6235', '肖佳', '2023-12-25 14:42:23', '肖佳', '2023-12-25 14:46:09', '', '', '', '北京，清华');
INSERT INTO `c_customer` VALUES ('66b49e0b237847609153d8a4052b608e', 'fa99b7131050421b9cb2135fb9d0b119', '千峰集团', 'https://com.ithima', '124-9984-2546', '张三', '2023-12-16 13:05:45', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `c_customer` VALUES ('abf1667f7c4c4cb7ad91be7d9b0a799d', '7e737c0507174dfdbe6a208b96234c10', '动力节点', 'https:huswei.com', '038-6664-4555', '张三', '2023-11-27 22:04:07', '肖佳', '2023-12-24 21:35:29', '联系时客气点，别得罪人', '2023-11-27', '是一个中国大厂', '北京，上海');
INSERT INTO `c_customer` VALUES ('baabe1772bfd41859d392a76f9b291d0', '5357e6797c644c25944af050331be3aa', '阿里巴巴', '', '', NULL, NULL, '肖佳', '2023-12-11 14:58:09', '', '', '', '');
INSERT INTO `c_customer` VALUES ('d07cfd8430e54e49825a06875eb2180e', '5357e6797c644c25944af050331be3aa', '强盛集团', 'https://', '124-4457-7841', '肖佳', '2024-02-06 19:57:15', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `c_customer` VALUES ('e7ab99c8c91a4c6fb0d167e782afcf03', 'fa99b7131050421b9cb2135fb9d0b119', '百度', 'https://baidu.com', '457-4457-9875', '张三', '2023-12-10 12:12:11', '肖佳', '2024-05-04 16:08:02', '联系时要客气点哈', '2023-11-29', '现如今最热的使用软件的公司', '北京，上海，广州...等等等。');

-- ----------------------------
-- Table structure for c_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `c_customer_remark`;
CREATE TABLE `c_customer_remark`  (
                                      `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_customer_remark
-- ----------------------------
INSERT INTO `c_customer_remark` VALUES ('08b656d4b6b3441fbf645097c4f5d8e0', '月好', '刘强', '2023-11-30 19:05:41', '刘强', '2023-11-30 19:05:47', '1', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_customer_remark` VALUES ('1c257d9a275a43c9b565cdfe74943a65', 'good', '肖佳', '2023-12-25 14:41:36', NULL, NULL, '0', '5e7b1009f0ae4d2d82d02a0b2df47949');
INSERT INTO `c_customer_remark` VALUES ('229a7ba73c3145ffbc14fc4a3b687ed1', '对对对', '肖佳', '2023-12-14 21:59:03', NULL, NULL, '0', 'aceaa207958543898dc1ee51c5311c98');
INSERT INTO `c_customer_remark` VALUES ('6727c2dd46024dd9b08e65323805a65c', '年号', '刘强', '2023-11-30 19:05:36', '肖佳', '2023-12-25 14:25:51', '1', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_customer_remark` VALUES ('799b414644894c63aa6d521c27c5cd2b', '很好说话的一个人\n', '张三', '2023-12-16 13:03:33', NULL, NULL, '0', '66b49e0b237847609153d8a4052b608e');
INSERT INTO `c_customer_remark` VALUES ('974a5d88bc3e4555891b118af93dcf56', '这条线索可以转换了', '肖佳', '2024-05-04 16:07:08', NULL, NULL, '0', 'e7ab99c8c91a4c6fb0d167e782afcf03');
INSERT INTO `c_customer_remark` VALUES ('ae2dca3629114a60a8362d3a238bd6ab', '一个广州的线索', '肖佳', '2024-05-04 17:29:56', NULL, NULL, '0', '0e5e04ebe96b4582aca9638e60c43478');
INSERT INTO `c_customer_remark` VALUES ('c06a65a679834e3fb43a0965849b3014', '我很赞同🤞', '张三', '2023-12-16 13:04:49', NULL, NULL, '0', '66b49e0b237847609153d8a4052b608e');
INSERT INTO `c_customer_remark` VALUES ('fae8377e09654ced930c3200d95dc8be', '可以忽悠一下', '肖佳', '2023-12-14 21:58:56', NULL, NULL, '0', 'aceaa207958543898dc1ee51c5311c98');
INSERT INTO `c_customer_remark` VALUES ('fc60f11d2fe34e95aa3524eaaa3c2bf6', '这个公司有钱', '肖佳', '2023-12-11 15:05:06', NULL, NULL, '0', 'abf1667f7c4c4cb7ad91be7d9b0a799d');

-- ----------------------------
-- Table structure for c_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `c_dic_type`;
CREATE TABLE `c_dic_type`  (
                               `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_dic_type
-- ----------------------------
INSERT INTO `c_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `c_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `c_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `c_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `c_dic_type` VALUES ('source', '来源', '');
INSERT INTO `c_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `c_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for c_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `c_dic_value`;
CREATE TABLE `c_dic_value`  (
                                `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `orderNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `typeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_dic_value
-- ----------------------------
INSERT INTO `c_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `c_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `c_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `c_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `c_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `c_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `c_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `c_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `c_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '成交', '成交', '7', 'stage');
INSERT INTO `c_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `c_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `c_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '资质审查', '资质审查', '1', 'stage');
INSERT INTO `c_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '丢失的线索', '丢失的线索', '8', 'stage');
INSERT INTO `c_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `c_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `c_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `c_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `c_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `c_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `c_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `c_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '因竞争丢失关闭', '因竞争丢失关闭', '9', 'stage');
INSERT INTO `c_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `c_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `c_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `c_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `c_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `c_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `c_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `c_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `c_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `c_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `c_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `c_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '需求分析', '需求分析', '2', 'stage');
INSERT INTO `c_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `c_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `c_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `c_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '提案/报价', '提案/报价', '5', 'stage');
INSERT INTO `c_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `c_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '价值建议', '价值建议', '3', 'stage');
INSERT INTO `c_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `c_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `c_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '确定决策者', '确定决策者', '4', 'stage');
INSERT INTO `c_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `c_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '谈判/复审', '谈判/复审', '6', 'stage');
INSERT INTO `c_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `c_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `c_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for c_trade
-- ----------------------------
DROP TABLE IF EXISTS `c_trade`;
CREATE TABLE `c_trade`  (
                            `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `expectedTradeDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `contactMinute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `contactId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_trade
-- ----------------------------
INSERT INTO `c_trade` VALUES ('06f3bfd3dbff45889930ad408aff771d', '5357e6797c644c25944af050331be3aa', '200200', '千峰集团-诺埃尔', '2024-12-31', '成交', '新业务', '公开媒介', '张三', '2023-12-16 13:05:45', '肖佳', '2023-12-25 18:56:53', '', '', '', '66b49e0b237847609153d8a4052b608e', '4e1b14b678164c5781d4ae40d29a77cd', 'ab1968063685481a99b717fbe94f74f2');
INSERT INTO `c_trade` VALUES ('084a7db9ab7f4a62a3d58501046f8281', '5357e6797c644c25944af050331be3aa', '50000', '百度-与刘蓝的一笔交易', '2024-05-31', '资质审查', '新业务', '合作伙伴研讨会', '肖佳', '2024-05-04 16:08:02', NULL, NULL, NULL, NULL, NULL, 'e7ab99c8c91a4c6fb0d167e782afcf03', '1d52c197d9714c5f9dcbf166833b7baa', 'e8f5a3a50bc94ec99dfbddb4d280f839');
INSERT INTO `c_trade` VALUES ('0fe33840c6d84bf78df55d49b169b824', '5357e6797c644c25944af050331be3aa', '100000', '动力节点-小交易', '2023-12-04', '成交', '新业务', 'web调研', NULL, NULL, '张三', '2023-12-16 22:13:32', '1请求', '12都', '', 'abf1667f7c4c4cb7ad91be7d9b0a799d', '15c9e3690037476e8b9c6b32d541148d', '88d30661a8d54094877ecd73e8308700');
INSERT INTO `c_trade` VALUES ('3be8f6141dc44c82acd4d71dd44e7bc9', 'fa99b7131050421b9cb2135fb9d0b119', '122222', '子初科技-凌人', '2023-12-21', '资质审查', '新业务', '推销电话', '张三', '2023-12-19 16:45:58', NULL, NULL, NULL, NULL, NULL, '1d916cb8dbae48c0b9db287151456c34', '4eb50d882de04c999c7eae41979e7a88', 'ead760b758674fbb8a7d0406967ac511');
INSERT INTO `c_trade` VALUES ('54ee9455fc7145e0a440e831a4bab67d', '5357e6797c644c25944af050331be3aa', '20000', '动力节点-百万交易', '2023-12-30', '需求分析', '已有业务', 'web调研', '肖佳', '2023-12-09 19:28:25', '张三', '2023-12-13 15:15:09', '初步阶段交易', '别搞黄了', '2024-12-10', 'abf1667f7c4c4cb7ad91be7d9b0a799d', 'e74c432c9bbf4a2d9de621f275519694', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_trade` VALUES ('a91987c15ef74bf3bf89637e8c626e60', '5357e6797c644c25944af050331be3aa', '1000100', '江西荣工-与凌人的交易', '2023-12-13', '因竞争丢失关闭', '新业务', '销售邮件', '肖佳', '2023-12-25 14:42:23', '肖佳', '2024-02-12 15:07:45', '', '', '', '5e7b1009f0ae4d2d82d02a0b2df47949', '4e1b14b678164c5781d4ae40d29a77cd', 'ead760b758674fbb8a7d0406967ac511');
INSERT INTO `c_trade` VALUES ('bed6a6fd3e05433097ecfb1dbca840e8', '5357e6797c644c25944af050331be3aa', '200000', '千峰集团-与多托雷的一笔交易', '2023-12-19', '成交', '新业务', '外部介绍', '张三', '2023-12-16 22:09:48', '段程', '2023-12-25 22:33:08', '', '', '2024-12-24', '66b49e0b237847609153d8a4052b608e', '73d95d2f520140ba832b18255ac36ae3', '88d30661a8d54094877ecd73e8308700');
INSERT INTO `c_trade` VALUES ('dcbdf0a8037342e89fa6d92c30de00cf', 'fa99b7131050421b9cb2135fb9d0b119', '251000', '动力节点-与丽莎的交易', '2023-12-16', '需求分析', '已有业务', '外部介绍', '张三', '2023-12-16 13:10:07', '张三', '2023-12-16 22:12:03', '', '', '2023-12-27', 'abf1667f7c4c4cb7ad91be7d9b0a799d', 'e74c432c9bbf4a2d9de621f275519694', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_trade` VALUES ('ee8adc1fdb0e4ebb855251ff493cb38c', '5357e6797c644c25944af050331be3aa', '30000', '阿里巴巴-首次交易', '2023-12-09', '价值建议', '新业务', 'web下载', '肖佳', '2023-12-09 21:14:24', '张三', '2023-12-18 20:54:57', '好好好', '错错错', '2023-12-26', 'e7ab99c8c91a4c6fb0d167e782afcf03', '4e1b14b678164c5781d4ae40d29a77cd', '339ec1fae25741ad9256df57162568b0');
INSERT INTO `c_trade` VALUES ('fef5cddc07534ea597882b9bb87653d0', '5357e6797c644c25944af050331be3aa', '2530000', '百度-与诺艾尔的交易', '2024-01-01', '确定决策者', '新业务', '交易会', '张三', '2023-12-16 22:08:36', '张三', '2023-12-16 22:13:42', '', '', '2024-12-16', 'e7ab99c8c91a4c6fb0d167e782afcf03', 'f55723c0a6a142c0bdf8343450bce756', 'ab1968063685481a99b717fbe94f74f2');

-- ----------------------------
-- Table structure for c_trade_history
-- ----------------------------
DROP TABLE IF EXISTS `c_trade_history`;
CREATE TABLE `c_trade_history`  (
                                    `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `expectedTradeDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `tradeId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_trade_history
-- ----------------------------
INSERT INTO `c_trade_history` VALUES ('003b0ea189e2466c9ce52f0a80026cf2', '需求分析', '200200', '2024-12-31', '2023-12-16 13:06:36', '张三', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('1365a953766f4fd2a423270705791a97', '确定决策者', '200200', '2024-12-31', '2023-12-25 18:56:25', '肖佳', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('21f9ec206ec04e7eb98f51d1e71b0b52', '需求分析', '30000', '2023-12-09', '2023-12-15 22:31:51', '张三', 'ee8adc1fdb0e4ebb855251ff493cb38c');
INSERT INTO `c_trade_history` VALUES ('276a9f18be2449b1ace50b06e4c4ab72', '谈判/复审', '100000', '2023-12-04', '2023-12-16 22:13:19', '张三', '0fe33840c6d84bf78df55d49b169b824');
INSERT INTO `c_trade_history` VALUES ('38e6d92cdf954a8495227d9b38a4d47f', '需求分析', '251000', '2023-12-16', '2023-12-16 22:13:02', '张三', 'dcbdf0a8037342e89fa6d92c30de00cf');
INSERT INTO `c_trade_history` VALUES ('4355cf59ff2a48478bd1ec0650d90cdc', '提案/报价', '200000', '2023-12-19', '2023-12-16 22:12:22', '张三', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('46dfcc30feda46c2ac57503192ec963a', '需求分析', '200000', '2023-12-19', '2023-12-16 22:10:10', '张三', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('4f3ce1edc1c34bf2b21bb6d441e14568', '资质审查', '50000', '2024-05-31', '2024-05-04 16:08:36', '肖佳', '084a7db9ab7f4a62a3d58501046f8281');
INSERT INTO `c_trade_history` VALUES ('5a7ae0476f4547a39d5393d23ce4dddf', '提案/报价', '200200', '2024-12-31', '2023-12-25 18:56:34', '肖佳', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('6940eb6412dc4a0db440d3f857f63ca8', '成交', '100000', '2023-12-04', '2023-12-18 16:21:20', '张三', '0fe33840c6d84bf78df55d49b169b824');
INSERT INTO `c_trade_history` VALUES ('74eff2577cfb468b9308f9497ce8ba81', '资质审查', '122222', '2023-12-21', '2023-12-19 16:46:16', '张三', '3be8f6141dc44c82acd4d71dd44e7bc9');
INSERT INTO `c_trade_history` VALUES ('7b46df5156da4198b5197c3e6c523eaa', '需求分析', '2530000', '2024-01-01', '2023-12-16 22:10:34', '张三', 'fef5cddc07534ea597882b9bb87653d0');
INSERT INTO `c_trade_history` VALUES ('7c2aa7637f524a31837d9cc33432e64a', '需求分析', '1000100', '2023-12-13', '2024-02-12 15:07:05', '肖佳', 'a91987c15ef74bf3bf89637e8c626e60');
INSERT INTO `c_trade_history` VALUES ('852e768d7e27405299902d13a1bd9b65', '价值建议', '200200', '2024-12-31', '2023-12-25 18:56:11', '肖佳', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('88665d9c91e14052a976e9ca910e9c45', '资质审查', '2530000', '2024-01-01', '2023-12-16 22:10:28', '张三', 'fef5cddc07534ea597882b9bb87653d0');
INSERT INTO `c_trade_history` VALUES ('8c2de3e40d6f40fa994a138e795ba6f5', '资质审查', '200000', '2023-12-19', '2023-12-16 22:09:57', '张三', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('8c5f4dfbb1b14e07b26810b764bb8a6a', '确定决策者', '200000', '2023-12-19', '2023-12-16 22:10:23', '张三', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('905cb5bce4a24697a67d64f50990f0fa', '价值建议', '200000', '2023-12-19', '2023-12-16 22:10:18', '张三', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('9e3b15157a5941d8927c2237d66f438d', '资质审查', '', '', '2023-12-16 14:08:48', '张三', 'dcbdf0a8037342e89fa6d92c30de00cf');
INSERT INTO `c_trade_history` VALUES ('a83788f0f95f448d83647230c8e3d77c', '确定决策者', '2530000', '2024-01-01', '2023-12-16 22:13:48', '张三', 'fef5cddc07534ea597882b9bb87653d0');
INSERT INTO `c_trade_history` VALUES ('af157586c46d4ad2b70fa467f87d9635', '谈判/复审', '200200', '2024-12-31', '2023-12-25 18:56:44', '肖佳', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('c3bee8fdc5a64219bb554151b13dd946', '需求分析', '20000', '2023-12-30', '2023-12-16 22:13:15', '张三', '54ee9455fc7145e0a440e831a4bab67d');
INSERT INTO `c_trade_history` VALUES ('c7f602e66119432e8c56a2e31422f491', '价值建议', '2530000', '2024-01-01', '2023-12-16 22:12:57', '张三', 'fef5cddc07534ea597882b9bb87653d0');
INSERT INTO `c_trade_history` VALUES ('c98163eff33143929b844bddf1d5f525', '成交', '200200', '2024-12-31', '2023-12-25 18:57:00', '肖佳', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('d2dca3d8ddf840288bde3b634d6f5080', '', '', '', '2023-12-16 13:10:26', '张三', 'dcbdf0a8037342e89fa6d92c30de00cf');
INSERT INTO `c_trade_history` VALUES ('da406558d32d433aa81d3e7b6efbfe9e', '资质审查', '1000100', '2023-12-13', '2023-12-25 14:42:53', '肖佳', 'a91987c15ef74bf3bf89637e8c626e60');
INSERT INTO `c_trade_history` VALUES ('e1a981bbfb59451e8b75a8aa505d24be', '价值建议', '30000', '2023-12-09', '2023-12-15 22:34:07', '张三', 'ee8adc1fdb0e4ebb855251ff493cb38c');
INSERT INTO `c_trade_history` VALUES ('e9c11afe1de64e5eae01fcae5a3f1de3', '资质审查', '200200', '2024-12-31', '2023-12-16 13:06:17', '张三', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_history` VALUES ('f10073f29b1c420ea79aa9e811d897e1', '因竞争丢失关闭', '1000100', '2023-12-13', '2024-02-12 15:07:46', '肖佳', 'a91987c15ef74bf3bf89637e8c626e60');
INSERT INTO `c_trade_history` VALUES ('f6a4b69b02b74de083829edc5b01233d', '成交', '200000', '2023-12-19', '2023-12-25 22:33:11', '段程', 'bed6a6fd3e05433097ecfb1dbca840e8');
INSERT INTO `c_trade_history` VALUES ('fbb1061cac09471982af582db1a576e0', '谈判/复审', '200000', '2023-12-19', '2023-12-25 22:33:04', '段程', 'bed6a6fd3e05433097ecfb1dbca840e8');

-- ----------------------------
-- Table structure for c_trade_remark
-- ----------------------------
DROP TABLE IF EXISTS `c_trade_remark`;
CREATE TABLE `c_trade_remark`  (
                                   `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `tradeId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_trade_remark
-- ----------------------------
INSERT INTO `c_trade_remark` VALUES ('0288a1f72ea04b1285d9d6ec864634d7', 'good', '肖佳', '2023-12-25 14:41:36', NULL, NULL, '0', 'a91987c15ef74bf3bf89637e8c626e60');
INSERT INTO `c_trade_remark` VALUES ('1a7e8fc1c2fc45c897caade300511123', '年后啥', '肖佳', '2023-12-10 21:13:27', NULL, NULL, '0', 'ee8adc1fdb0e4ebb855251ff493cb38c');
INSERT INTO `c_trade_remark` VALUES ('4853191317f740889d0aa6d9256aa05f', '很好说话的一个人\n', '张三', '2023-12-16 13:03:33', NULL, NULL, '0', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_remark` VALUES ('6aaccac4eb294bf4a902cfaca49badc3', '啊啊啊', '张三', '2023-12-10 21:21:52', NULL, NULL, '0', '54ee9455fc7145e0a440e831a4bab67d');
INSERT INTO `c_trade_remark` VALUES ('7858e3c081454fb8a042e6020db310dd', '你还高', '肖佳', '2023-12-10 21:13:22', '肖佳', '2023-12-10 21:13:34', '1', 'ee8adc1fdb0e4ebb855251ff493cb38c');
INSERT INTO `c_trade_remark` VALUES ('7eeb8ed6762c4498b03e37a55a02a228', '我很赞同🤞', '张三', '2023-12-16 13:04:49', NULL, NULL, '0', '06f3bfd3dbff45889930ad408aff771d');
INSERT INTO `c_trade_remark` VALUES ('8e54800d318c4496b3ad403b20021265', '1', '张三', '2023-12-16 13:10:32', NULL, NULL, '0', 'dcbdf0a8037342e89fa6d92c30de00cf');
INSERT INTO `c_trade_remark` VALUES ('a772effaa87447ad961a892435ba60d7', '这条线索可以转换了', '肖佳', '2024-05-04 16:07:08', NULL, NULL, '0', '084a7db9ab7f4a62a3d58501046f8281');

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user`  (
                           `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           `loginAct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `loginPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `expireTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `lockState` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `deptno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `allowIps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('5357e6797c644c25944af050331be3aa', 'xk123456789', '肖佳', '388ec3e3fa4983032b4f3e7d8fcb65ad', '2018306893@qq.com', '2099-11-30 23:59:59', '2', 'C022', '127.0.0.1,0.0.0.0.0', '2023-11-22', '肖佳', '2024-05-05 19:43:06', '肖佳');
INSERT INTO `c_user` VALUES ('5e6ab0a42b984387b1cc0cf87fc8d40f', '2222', '', 'b6d767d2f8ed5d21a44b0e5886680cb9', '', '', '1', '', '', '2024-05-12 13:19:07', '肖佳', NULL, NULL);
INSERT INTO `c_user` VALUES ('7e737c0507174dfdbe6a208b96234c10', 'a7798121a', '刘强', 'd5ee2eedfcf7adc285db4967bd86910d', '2617987854@qq.com', '2024-12-31 19:42:07', '0', 'B002', '127.0.0.1,136.0.0.2,198.0.0.5', '2023-11-9', '刘强', NULL, NULL);
INSERT INTO `c_user` VALUES ('c1ab72a66f6c488180b165714fd9f7e5', 'xiaoxiao123', '肖小平', 'e10adc3949ba59abbe56e057f20f883e', '2422120472@qq.com', '2028-02-24 00:00:00', '1', 'A002', '127.0.0.1,0.0.0.0', '2024-02-24 19:23:35', '肖佳', NULL, NULL);
INSERT INTO `c_user` VALUES ('c71f1f6f3aa24dfaa3816c34b4b4c263', '2020754232', '段程', '00d5b7c400eb6b4a5a110b84590f752c', '2456871248@qq.com', '2030-12-25 23:59:59', '2', 'A001', '127.0.0.1,0.0.0.0', '2023-12-25 22:22:08', '肖佳', NULL, NULL);
INSERT INTO `c_user` VALUES ('fa99b7131050421b9cb2135fb9d0b119', 'axios123456789', '张三', 'fcea920f7412b5da7be0cf42b8c93759', '2018304838@qq.com', '2025-11-30 12:59:59', '1', 'A008', '127.0.0.1,127.0.0.2', '2023-10-11', '张三', '2023-12-21 21:13:12', '张三');

SET FOREIGN_KEY_CHECKS = 1;
