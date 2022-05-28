create table bulletin
(
    id      integer        default nextval('bulletin_id_seq'::regclass) not null
        primary key,
    dt      timestamp with time zone,
    title   varchar(200)   default NULL::character varying,
    content varchar(10000) default NULL::character varying,
    valid   integer        default 1,
    source  varchar(70),
    author  varchar(70)
);

alter table bulletin
    owner to postgres;

INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (1, '2015-06-24 13:31:28.000000 +00:00', '2015年全区优秀学生、“三好学生”、优秀学生干部、先进班集体名单公示的通知', '各市教育局，各高等学校，中等职业学校：', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (2, '2015-06-25 13:31:28.000000 +00:00', '国土资源部拟聘请的第四届国家特邀国土资源监察专员公示通知', 'v234', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (3, '2015-06-25 13:31:28.000000 +00:00', '关于征求对《国土资源“十三五”科学和技术发展规划》（征求意见稿）意见的函', 'dfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (4, '2015-06-25 13:31:28.000000 +00:00', '“拍客日记”国土资源公益微视频网络征集活动启事', '234', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (5, '2015-06-25 13:31:28.000000 +00:00', '国土资源部办公厅关于推荐“十二五”科技与国际合作先进集体、先进个人的通知', 'fg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (6, '2015-06-25 13:31:28.000000 +00:00', '关于2015年公开选择矿业权评估机构的函', 'sdf', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (7, '2015-06-25 13:31:28.000000 +00:00', '“像保护大熊猫一样保护耕地”主题散文大赛征稿启事', '234', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (8, '2015-06-25 13:31:28.000000 +00:00', '中国矿业权评估师协会关于公开招聘工作人员的启事', 'sdfsd', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (9, '2015-06-25 13:31:28.000000 +00:00', '	2015年度国土资源科学技术奖申报项目公示', 'sdfsdf', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (10, '2015-06-25 13:31:28.000000 +00:00', '(NULL)国土资源部关于发布《水文地质调查规范（1：50000）》等4项行业标准的公告', 'sdfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (11, '2015-06-25 13:31:28.000000 +00:00', '2015年度国土资源标准制修订工作计划公示', 'dfgfdg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (12, '2015-06-25 13:31:28.000000 +00:00', '国土资源部关于取消国家地质公园规划审批等事项的公告', 'dfgdfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (13, '2015-06-25 13:31:28.000000 +00:00', '国土资源部关于发布《重力调查技术规范（1：50000）》等4项行业标准的公告', 'dfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (14, '2015-06-25 13:31:28.000000 +00:00', '2015年度航空物探调查项目飞行任务承担人竞争性谈判优选结果公告', 'dfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (15, '2015-06-25 13:31:28.000000 +00:00', '人力资源社会保障部 国土资源部关于评选全国国土资源管理系统先进集体和先进工作者的', 'dfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (16, '2015-06-25 13:31:28.000000 +00:00', '《晋城蓝焰煤业股份有限公司凤凰山矿矿山地质环境保护与恢复治理方案》等18个“方案”通过审查的公告', 'dfg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (17, '2015-06-25 13:31:28.000000 +00:00', '	2014年度国土资源政务信息网上公开执行情况检查结果', 'hg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (18, '2015-06-25 13:31:28.000000 +00:00', '国土资源部办公厅关于开展第25个全国“土地日”主题宣传周活动的通知', 'fdg', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (19, '2015-06-25 13:31:28.000000 +00:00', '中华人民共和国国土资源部令', 'dgf', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (20, '2015-06-25 13:31:28.000000 +00:00', '2015年1季度国土资源部评审备案矿产资源储量成果信息情况', 'sdf', 1, null, null);
INSERT INTO public.bulletin (id, dt, title, content, valid, source, author) VALUES (21, '2015-06-25 13:31:28.000000 +00:00', '国土资源部办公厅关于实行规范性文件 “三统一”制度的通知', 'sdf', 1, null, null);
