
-- ---------------
-- tbl_giftcode_public
-- ---------------
DROP TABLE IF EXISTS `tbl_giftcode_public`;
CREATE TABLE `tbl_giftcode_public` (
    `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '激活码',
    `channel` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '000000' COMMENT '渠道号',
    `used` int(10) unsigned NOT NULL default 0 COMMENT '是否使用过',
    `gift_id` int(10) unsigned NOT NULL default 0 COMMENT '礼包ID',
    `batch_id` int(10) unsigned NOT NULL default 0 COMMENT '批次ID',
    `start_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '开始时间',
    `end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '结束时间',
    PRIMARY KEY  (`CODE`)
) ENGINE=InnoDB;

-- ---------------
-- tbl_giftcode_unique
-- ---------------
DROP TABLE IF EXISTS `tbl_giftcode_unique`;
CREATE TABLE `tbl_giftcode_unique` (
    `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '激活码',
    `channel` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '000000' COMMENT '渠道号',
    `used` int(10) unsigned NOT NULL default 0 COMMENT '是否使用过',
    `gift_id` int(10) unsigned NOT NULL default 0 COMMENT '礼包ID',
    `batch_id` int(10) unsigned NOT NULL default 0 COMMENT '批次ID',
	`start_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '开始时间',
    `end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '' COMMENT '结束时间',
    PRIMARY KEY  (`CODE`)
) ENGINE=InnoDB;
