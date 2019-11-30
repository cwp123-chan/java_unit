CREATE DATABASE IF NOT EXISTS erp_4s_dev;
USE erp_4s_dev;

DROP TABLE IF EXISTS `crm_lead`;
CREATE TABLE IF NOT EXISTS `crm_lead` (
    `id` int unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `company_id` int unsigned NOT NULL DEFAULT 0 COMMENT '公司',

    `source_id` int unsigned NOT NULL DEFAULT 0 COMMENT '来源', /* 1:来电登记 2:到店登记 3:外部购买 4:集团下发 5:个人专属 */
    `channel_id` int unsigned NOT NULL DEFAULT 0 COMMENT '渠道', /* 电视广告、百度广告 */

    `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
    `sex` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '性别',
    `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
    `phone2` varchar(50) NOT NULL DEFAULT '' COMMENT '备用电话',

    `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    `product_id` int unsigned NOT NULL DEFAULT 0 COMMENT '关注产品',

    `extra` JSON COMMENT '扩展数据', 
     -- `call_start` datetime DEFAUlT NULL COMMENT '来电时间',
     -- `call_length` varchar(50) NOT NULL DEFAULT '' COMMENT '通话时长',
    
    `sale_id` int unsigned NOT NULL DEFAULT 0 COMMENT '销售顾问',

    `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要',
    `status` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '状态', /* 1待处理 2有效 3无效 4重复*/
    `created_by` int unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记',  -- 0未删除 1已删除
    KEY ind_created_by(company_id, created_by),
    KEY ind_phone(company_id, phone)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='线索';

DROP TABLE IF EXISTS `crm_task`;
CREATE TABLE IF NOT EXISTS `crm_task` (
    `id` int unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `company_id` int unsigned NOT NULL DEFAULT 0 COMMENT '公司',
    `lead_id` int unsigned NOT NULL DEFAULT 0 COMMENT '线索',

    `level_id` int unsigned NOT NULL DEFAULT 0 COMMENT '等级',

    `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
    `sex` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '性别',
    `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
    `phone2` varchar(50) NOT NULL DEFAULT '' COMMENT '备用电话',

    `province_id` INT unsigned NOT NULL DEFAULT 0 COMMENT '省',
    `city_id` INT unsigned NOT NULL DEFAULT 0 COMMENT '市',
    `district_id` INT unsigned NOT NULL DEFAULT 0 COMMENT '区',
    `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',

    `product_id` int unsigned NOT NULL DEFAULT 0 COMMENT '关注产品',
    `comparison` varchar(255) NOT NULL DEFAULT '' COMMENT '对比产品',

    `wechat` varchar(50) NOT NULL DEFAULT '' COMMENT '微信',
    `qq` varchar(50) NOT NULL DEFAULT '' COMMENT 'QQ',
    `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
    `id_card` char(18) NOT NULL DEFAULT '' COMMENT '身份证',  /* 同一公司，1跟进中的数据，身份证唯一 */
    `work` varchar(255) NOT NULL DEFAULT '' COMMENT '工作单位',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',

    `sale_id` int unsigned NOT NULL DEFAULT 0 COMMENT '销售顾问',

	`status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态', /* 1跟进中 2成交 3战败 */

    `created_by` int unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记',  -- 0未删除 1已删除
    KEY ind_sale(company_id, sale_id),
    KEY ind_phone(company_id, phone),
    KEY ind_id_card(company_id, id_card)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='任务';

/* 跟进记录 */
DROP TABLE IF EXISTS `crm_note`;
CREATE TABLE IF NOT EXISTS `crm_note` (
    `id` int unsigned PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    `company_id` int unsigned NOT NULL DEFAULT 0 COMMENT '公司',
    `task_id` int unsigned NOT NULL DEFAULT 0 COMMENT '任务',
    `method_id` int unsigned NOT NULL DEFAULT 0 COMMENT '沟通方式',
    `content` varchar(255) NOT NULL DEFAULT '' COMMENT '沟通内容',

    `next_time` datetime NOT NULL DEFAULT '1979-01-01' COMMENT '下次沟通时间',
    `next_content` varchar(255) NOT NULL DEFAULT '' COMMENT '待沟通内容',

    `created_by` int unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记',  -- 0未删除 1已删除
    KEY ind_task_id(company_id, task_id)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='记录';


/* 建议  领导批注 */
DROP TABLE IF EXISTS `crm_proposal`;
CREATE TABLE IF NOT EXISTS `crm_proposal` (
    `id` int unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `company_id` int unsigned NOT NULL DEFAULT 0 COMMENT '公司',
    `task_id` int unsigned NOT NULL DEFAULT 0 COMMENT '任务',
    `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',

    `created_by` int unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记',  -- 0未删除 1已删除
    KEY ind_task_id(company_id, task_id)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='批注';


