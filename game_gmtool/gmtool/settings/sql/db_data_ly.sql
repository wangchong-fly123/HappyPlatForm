set names utf8;

truncate table `tbl_pay_product`;
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(1, 25, '月卡25元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(2, 6, '充值包6元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(3, 30, '充值包30元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(4, 60, '充值包60元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(5, 98, '充值包98元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(6, 168, '充值包168元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(7, 328, '充值包328元');
replace into `tbl_pay_product`(`id`, `amount`, `desc`) values(8, 648, '充值包648元');

truncate table `tbl_platform`;
replace into `tbl_platform`(`id`, `desc`) values(41, '安卓联运');
replace into `tbl_platform`(`id`, `desc`) values(47, '越狱联运');

truncate table `tbl_channel`;
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000009', '应用汇',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000065', '沃商店',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000123', '安卓pptv',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000243', '七匣子',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000310', '悠悠村',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('000798', '搜狗游戏中心',            41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('111323', '猎宝网',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('111248', '越狱pptv',                47);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160116', '好盟',                    41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160140', '乐游(魔格)',              41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160147', '93PK',                    41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160198', '小7手游(安卓)',           41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160227', '怪猫',                    41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160232', '仙侠网络',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160211', '爱应用',                  47);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160240', '西柚网络',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160268', '游戏多',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160281', '骑士助手',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160285', '游戏Fan',                 41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160287', '凤凰网',                  41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160305', '游聚',                    41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160326', '冰穹互娱',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('160336', '72G渠道',                 41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('400202', '小鸡手柄',                41);
replace into `tbl_channel`(`id`, `desc`, `platform_id`) values('800008', 'TapTap',                  41);