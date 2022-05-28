create table department
(
    id        int auto_increment comment 'id序列'
        primary key,
    id_parent int         not null comment 'id序列',
    name      varchar(64) not null comment '名称'
)
    auto_increment = 301;

create index ix_department_id
    on department (id);

create index ix_department_id_parent
    on department (id_parent);

create index ix_department_name
    on department (name);

INSERT INTO main.department (id, id_parent, name) VALUES (1, 0, '苏州大学继续教育学院');
INSERT INTO main.department (id, id_parent, name) VALUES (2, 0, '苏州大学本科生');
INSERT INTO main.department (id, id_parent, name) VALUES (3, 0, '苏州大学研究生');
INSERT INTO main.department (id, id_parent, name) VALUES (4, 3, '马克思主义学院');
INSERT INTO main.department (id, id_parent, name) VALUES (5, 0, '外国语学院');
INSERT INTO main.department (id, id_parent, name) VALUES (6, 2, '东吴商学院（财经学院）');
INSERT INTO main.department (id, id_parent, name) VALUES (7, 3, '王健法学院');
INSERT INTO main.department (id, id_parent, name) VALUES (8, 1, '教育学院');
INSERT INTO main.department (id, id_parent, name) VALUES (9, 3, '艺术学院');
INSERT INTO main.department (id, id_parent, name) VALUES (10, 0, '音乐学院');
INSERT INTO main.department (id, id_parent, name) VALUES (11, 0, '体育学院');
INSERT INTO main.department (id, id_parent, name) VALUES (12, 1, '金螳螂建筑学院');
INSERT INTO main.department (id, id_parent, name) VALUES (13, 3, '数学科学学院');
INSERT INTO main.department (id, id_parent, name) VALUES (14, 3, '物理科学与技术学院');
INSERT INTO main.department (id, id_parent, name) VALUES (15, 2, '光电科学与工程学院');
INSERT INTO main.department (id, id_parent, name) VALUES (16, 1, '能源学院');
INSERT INTO main.department (id, id_parent, name) VALUES (17, 0, '材料与化学化工学部');
INSERT INTO main.department (id, id_parent, name) VALUES (18, 3, '纳米科学技术学院');
INSERT INTO main.department (id, id_parent, name) VALUES (19, 3, '计算机科学与技术学院(软件学院)');
INSERT INTO main.department (id, id_parent, name) VALUES (20, 1, '电子信息学院');
INSERT INTO main.department (id, id_parent, name) VALUES (21, 1, '机电工程学院');
INSERT INTO main.department (id, id_parent, name) VALUES (22, 0, '沙钢钢铁学院');
INSERT INTO main.department (id, id_parent, name) VALUES (23, 1, '纺织与服装工程学院');
INSERT INTO main.department (id, id_parent, name) VALUES (24, 1, '轨道交通学院');
INSERT INTO main.department (id, id_parent, name) VALUES (25, 0, '巴斯德学院');
INSERT INTO main.department (id, id_parent, name) VALUES (26, 1, '基础医学与生物科学学院');
INSERT INTO main.department (id, id_parent, name) VALUES (27, 0, '放射医学与防护学院');
INSERT INTO main.department (id, id_parent, name) VALUES (28, 3, '公共卫生学院');
INSERT INTO main.department (id, id_parent, name) VALUES (29, 2, '药学院');
INSERT INTO main.department (id, id_parent, name) VALUES (271, 0, '苏州大学');
