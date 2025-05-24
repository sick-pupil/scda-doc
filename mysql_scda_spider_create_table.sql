/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : scda-spider

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 01/05/2025 00:30:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for spider_instance
-- ----------------------------
DROP TABLE IF EXISTS `spider_instance`;
CREATE TABLE `spider_instance`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sample_id` bigint NOT NULL COMMENT '样本id',
  `run_status` tinyint NOT NULL COMMENT '运行状态',
  `init_start_time` timestamp NULL DEFAULT NULL COMMENT '初始化开始时间',
  `init_end_time` timestamp NULL DEFAULT NULL COMMENT '初始化结束时间',
  `run_start_time` timestamp NULL DEFAULT NULL COMMENT '运行开始时间',
  `run_end_time` timestamp NULL DEFAULT NULL COMMENT '运行结束时间',
  `destroy_start_time` timestamp NULL DEFAULT NULL COMMENT '销毁开始时间',
  `destroy_end_time` timestamp NULL DEFAULT NULL COMMENT '销毁结束时间',
  `init_cost_time` bigint NULL DEFAULT NULL COMMENT '初始化消耗时间，毫秒',
  `run_cost_time` bigint NULL DEFAULT NULL COMMENT '运行消耗时间，毫秒',
  `destroy_cost_time` bigint NULL DEFAULT NULL COMMENT '销毁消耗时间，毫秒',
  `total_cost_time` bigint NULL DEFAULT NULL COMMENT '总运行消耗时间，毫秒',
  `retry_time` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `success_time` int NOT NULL DEFAULT 0 COMMENT '成功次数',
  `fail_time` int NOT NULL DEFAULT 0 COMMENT '失败次数',
  `success_percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '成功率',
  `fail_percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '失败率',
  `run_result` tinyint NOT NULL DEFAULT 1 COMMENT '运行结果',
  `exception_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常消息',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抓取实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_ip_agent
-- ----------------------------
DROP TABLE IF EXISTS `spider_ip_agent`;
CREATE TABLE `spider_ip_agent`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `access_ip_agent_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '获取代理ip池的请求地址',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '获取代理ip的用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '获取代理ip的密码',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ip代理池' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_ip_agent_log
-- ----------------------------
DROP TABLE IF EXISTS `spider_ip_agent_log`;
CREATE TABLE `spider_ip_agent_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `step_id` bigint NOT NULL COMMENT '步骤id',
  `agent_ip_id` bigint NOT NULL COMMENT 'ip代理池id',
  `agent_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '代理ip',
  `access_result` tinyint NOT NULL COMMENT '获取代理结果',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抓取使用代理池获取日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_sample
-- ----------------------------
DROP TABLE IF EXISTS `spider_sample`;
CREATE TABLE `spider_sample`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '样本类名',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '样本名称',
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `md5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '样本文件md5',
  `init_logic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '初始化逻辑',
  `run_logic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '运行逻辑',
  `destroy_logic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '销毁逻辑',
  `effect_status` tinyint NOT NULL DEFAULT 1 COMMENT '是否生效',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抓取样本' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_step
-- ----------------------------
DROP TABLE IF EXISTS `spider_step`;
CREATE TABLE `spider_step`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` bigint NOT NULL COMMENT '实例id',
  `req_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地址',
  `req_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `req_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求头',
  `req_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求体',
  `resp_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应头',
  `resp_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应体',
  `resp_status_code` int NULL DEFAULT NULL COMMENT '响应码',
  `build_req_start_time` timestamp NULL DEFAULT NULL COMMENT '构建请求开始时间',
  `build_req_end_time` timestamp NULL DEFAULT NULL COMMENT '构建请求结束时间',
  `req_start_time` timestamp NULL DEFAULT NULL COMMENT '请求开始时间',
  `req_end_time` timestamp NULL DEFAULT NULL COMMENT '请求结束时间',
  `resp_process_start_time` timestamp NULL DEFAULT NULL COMMENT '处理响应开始时间',
  `resp_process_end_time` timestamp NULL DEFAULT NULL COMMENT '处理响应结束时间',
  `build_req_cost_time` bigint NULL DEFAULT NULL COMMENT '构建请求花费时间，毫秒',
  `req_cost_time` bigint NULL DEFAULT NULL COMMENT '请求花费时间，毫秒',
  `resp_process_cost_time` bigint NULL DEFAULT NULL COMMENT '处理响应花费时间，毫秒',
  `total_cost_time` bigint NULL DEFAULT NULL COMMENT '总花费时间，毫秒',
  `retry_time` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `success_time` int NOT NULL DEFAULT 0 COMMENT '成功次数',
  `fail_time` int NOT NULL DEFAULT 0 COMMENT '失败次数',
  `success_percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '成功率',
  `fail_percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '失败率',
  `run_result` tinyint NOT NULL DEFAULT 1 COMMENT '运行结果',
  `exception_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常消息',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抓取步骤' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `spider_user_agent`;
CREATE TABLE `spider_user_agent`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'user-agent',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'user-agent代理池' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spider_user_agent_log
-- ----------------------------
DROP TABLE IF EXISTS `spider_user_agent_log`;
CREATE TABLE `spider_user_agent_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `step_id` bigint NOT NULL COMMENT '步骤id',
  `user_agent_id` bigint NOT NULL COMMENT 'user-agent-id',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否被删除',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `updator` bigint NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL COMMENT '更新时间',
  `deletor` bigint NOT NULL COMMENT '删除者',
  `delete_time` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抓取使用user-agent代理池获取日志' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
