create table announcement
(
    id            int auto_increment comment 'id序列'
        primary key,
    name          varchar(128) not null comment '公告的名称和标题',
    type_id       int          not null comment '公告的分类类别',
    department_id int          not null comment '公告的发布部门',
    filedir       text         not null comment '公告的文件路径',
    add_time      int          not null comment '添加时间'
)
    auto_increment = 30;

create index ix_announcement_add_time
    on announcement (add_time);

create index ix_announcement_department_id
    on announcement (department_id);

create index ix_announcement_id
    on announcement (id);

create index ix_announcement_name
    on announcement (name);

create index ix_announcement_type_id
    on announcement (type_id);

INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (1, '东西投资语言全国处理.', 8, 24, '/我的/全部.mov', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (2, '他们评论为什查看.', 3, 6, '/分析/报告.html', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (3, '应用文章还是制作国家一起.', 2, 21, '/安全/有些.avi', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (4, '的话可是表示详细发生关于数据.', 5, 28, '/结果/留言.txt', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (5, '一点人员部分决定以后.', 5, 23, '/控制/一样.gif', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (6, '报告但是浏览正在生活使用目前.', 7, 8, '/要求/没有.js', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (7, '选择以上科技很多使用.', 2, 10, '/加入/什么.mp3', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (8, '他的已经特别他的文化朋友一种.', 8, 19, '/由于/电脑.html', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (9, '一切发现目前说明计划.', 8, 1, '/准备/他的.mp4', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (10, '专业类型环境北京使用东西.', 2, 15, '/一样/知道.css', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (11, '内容欢迎起来在线不要留言参加文化.', 3, 20, '/威望/一个.csv', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (12, '威望环境为了以上主题.', 2, 7, '/电影/女人.jpeg', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (13, '结果学校市场人民发布语言可是.', 8, 20, '/加入/都是.flac', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (14, '全部没有资源标题是否.', 8, 20, '/注册/有限.gif', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (15, '质量要求地区工作能够.', 4, 14, '/主题/广告.numbers', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (16, '而且很多就是因为.', 5, 18, '/这种/电话.csv', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (17, '客户特别不能文化社会.', 3, 3, '/虽然/如此.key', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (18, '一些他们日期不断产品质量影响.', 4, 10, '/制作/部分.flac', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (19, '谢谢特别同时学生网上上海没有.', 8, 18, '/你们/不同.pdf', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (20, '资源图片能力你们应用一定系统您的.', 3, 7, '/方面/国际.jpg', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (21, '最大知道各种.', 8, 9, '/怎么/建设.jpg', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (22, '结果管理但是语言.', 7, 5, '/应该/注册.mov', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (23, '记者单位网站.', 4, 27, '/以后/特别.bmp', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (24, '经营因为不同.', 5, 2, '/完全/管理.wav', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (25, '正在作为通过没有支持查看显示.', 7, 25, '/市场/拥有.avi', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (26, '什么一点成为工作孩子社会.', 3, 26, '/完全/项目.mp3', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (27, '男人北京之间成为以上具有以上投资.', 4, 24, '/主要/状态.txt', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (28, '北京部分用户.', 9, 19, '/服务/关于.jpeg', 1652036496);
INSERT INTO main.announcement (id, name, type_id, department_id, filedir, add_time) VALUES (29, '用户详细能力如此.', 3, 15, '/是一/行业.webm', 1652036496);
