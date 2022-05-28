create table admin
(
    id       int auto_increment comment 'id序列'
        primary key,
    login    varchar(20) not null comment '管理员的登录名称',
    password varchar(32) not null comment '密码',
    name     varchar(60) not null comment '管理员姓名',
    status   int         not null comment 'id序列',
    constraint ix_admin_login
        unique (login)
)
    auto_increment = 20;

create index ix_admin_id
    on admin (id);

create index ix_admin_name
    on admin (name);

create index ix_admin_password
    on admin (password);

create index ix_admin_status
    on admin (status);

INSERT INTO main.admin (id, login, password, name, status) VALUES (1, 'xpeng', '84a99538a811d1710b7383d00c464674', '陈敏', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (2, 'liqiao', '86b266983e5333761d88a498390084f0', '赵丽娟', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (3, 'dongli', 'd92087c53c0c179b69291e6602532e5f', '郑东', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (4, 'yanqiao', '6d24030b4988609d4d72d770648b5ef1', '陈婷', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (5, 'jie81', 'd5b71335d3a9f41264db7ee4ea15fb2a', '毕畅', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (6, 'tao20', 'f0fc419ce8cfecdec839fb518e956bae', '曹桂花', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (7, 'jiayong', '789100ca48878f2da8cf0793fa72a885', '郭洁', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (8, 'jie44', '443cb1c701fcb814d8af3975e2944d22', '胡雪梅', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (9, 'jiefan', 'f3af9963470ec45bb3e134b342c439eb', '苏晨', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (10, 'xhan', '05a68334019072deade1a07db627c984', '黄强', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (11, 'mingmeng', '905185c552f3e7d64b50011c49707e9d', '杨云', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (12, 'zhengtao', 'd5f3ecd21963b81ce12aaa850481cf3f', '王斌', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (13, 'mingyang', '34215dd9856f94b7f0e6c4b21785d4f3', '林杨', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (14, 'weipan', 'a2b486829d3a26bc51eb914accf3a2cc', '王建', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (15, 'funa', 'ed0b1b5e0b223e1501e00348c9a590de', '王桂花', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (16, 'wjin', '0483fab46cc2921a0988745720e7a4cf', '李淑兰', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (17, 'wei78', '183aecae8627aea36aed87a8b479195f', '吴敏', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (18, 'ming30', '3015a44753b72c6267f42721575aa7fd', '芦玉珍', 1);
INSERT INTO main.admin (id, login, password, name, status) VALUES (19, 'luotao', 'bacf008916500b11c71b3856773d2f4c', '马玉兰', 1);
