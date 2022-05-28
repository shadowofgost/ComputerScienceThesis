create table type
(
    id   int auto_increment comment 'id序列'
        primary key,
    name varchar(60) not null comment '分类名称'
)
    auto_increment = 10;

create index ix_type_id
    on type (id);

create index ix_type_name
    on type (name);

INSERT INTO main.type (id, name) VALUES (1, '处分通告');
INSERT INTO main.type (id, name) VALUES (4, '学生工作');
INSERT INTO main.type (id, name) VALUES (8, '宣传通告');
INSERT INTO main.type (id, name) VALUES (6, '日常管理');
INSERT INTO main.type (id, name) VALUES (2, '科研通告');
INSERT INTO main.type (id, name) VALUES (3, '竞赛通告');
INSERT INTO main.type (id, name) VALUES (7, '紧急通告');
INSERT INTO main.type (id, name) VALUES (5, '组织活动');
INSERT INTO main.type (id, name) VALUES (9, '贯彻精神');
