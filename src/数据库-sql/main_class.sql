create table class
(
    id         int auto_increment comment 'id序列'
        primary key,
    name       varchar(60) not null comment '课程姓名',
    teacher_id int         not null comment '外键序列',
    begintime  int         not null comment '开始时间',
    endtime    int         not null comment '结束时间',
    user_count int         not null comment '课程总人数'
)
    auto_increment = 40;

create index ix_class_begintime
    on class (begintime);

create index ix_class_endtime
    on class (endtime);

create index ix_class_id
    on class (id);

create index ix_class_name
    on class (name);

create index ix_class_teacher_id
    on class (teacher_id);

create index ix_class_user_count
    on class (user_count);

INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (1, 'CAD/CAM', 11, 1652036496, 1652036496, 30);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (2, 'CAD/CAM综合实训', 28, 1652036496, 1652036496, 34);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (3, 'C语言程序设计', 11, 1652036496, 1652036496, 36);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (4, 'Excel在财务中的应用', 12, 1652036496, 1652036496, 99);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (5, 'Excel数据处理与分析', 3, 1652036496, 1652036496, 16);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (6, 'JAVA程序设计', 9, 1652036496, 1652036496, 69);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (7, 'MATLAB的工程应用', 18, 1652036496, 1652036496, 52);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (8, '三维计算机辅助设计', 8, 1652036496, 1652036496, 49);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (9, '专业模拟实习', 1, 1652036496, 1652036496, 43);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (10, '中级财务', 22, 1652036496, 1652036496, 85);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (11, '会计学', 9, 1652036496, 1652036496, 23);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (12, '信息安全技术', 2, 1652036496, 1652036496, 88);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (13, '制造执行系统技术应用', 5, 1652036496, 1652036496, 68);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (14, '商业图形图像处理', 6, 1652036496, 1652036496, 33);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (15, '商业文案处理', 19, 1652036496, 1652036496, 55);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (16, '国际贸易实务', 25, 1652036496, 1652036496, 28);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (17, '审计学', 2, 1652036496, 1652036496, 98);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (18, '工程机械制图', 14, 1652036496, 1652036496, 96);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (19, '心理实验编程', 23, 1652036496, 1652036496, 26);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (20, '数据处理实用技术', 13, 1652036496, 1652036496, 20);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (21, '数据库原理与设计', 11, 1652036496, 1652036496, 68);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (22, '数据库原理综合实训', 27, 1652036496, 1652036496, 65);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (23, '数据挖掘', 16, 1652036496, 1652036496, 71);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (24, '数据结构', 12, 1652036496, 1652036496, 46);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (25, '数控加工工艺与编程', 8, 1652036496, 1652036496, 24);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (26, '服装CAD', 8, 1652036496, 1652036496, 73);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (27, '电子CAD', 4, 1652036496, 1652036496, 25);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (28, '电子商务案例分析', 17, 1652036496, 1652036496, 25);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (29, '电气工程CAD制图', 24, 1652036496, 1652036496, 55);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (30, '电气设计', 29, 1652036496, 1652036496, 26);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (31, '社会科学统计软件应用', 24, 1652036496, 1652036496, 51);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (32, '移动应用开发', 14, 1652036496, 1652036496, 15);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (33, '程序设计基础', 23, 1652036496, 1652036496, 57);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (34, '程序设计综合实训', 11, 1652036496, 1652036496, 42);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (35, '网络媒体设计', 28, 1652036496, 1652036496, 99);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (36, '网络程序设计及应用', 15, 1652036496, 1652036496, 50);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (37, '虚拟仪器设计', 26, 1652036496, 1652036496, 72);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (38, '计算机基础', 14, 1652036496, 1652036496, 16);
INSERT INTO main.class (id, name, teacher_id, begintime, endtime, user_count) VALUES (39, '计算机辅助服装设计应用', 20, 1652036496, 1652036496, 24);
