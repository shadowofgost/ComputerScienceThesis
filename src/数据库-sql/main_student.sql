create table student
(
    id            int auto_increment comment 'id序列'
        primary key,
    department_id int          not null comment '外键序列',
    login         varchar(20)  not null comment '学生的登录名称',
    password      varchar(32)  not null comment '密码',
    code          varchar(10)  not null comment '学号',
    name          varchar(60)  not null comment '管理员姓名',
    cid           varchar(18)  null comment '身份证',
    phone         varchar(11)  not null comment '手机号',
    email         varchar(128) not null comment '邮箱地址',
    in_time       int          not null comment '入职时间',
    out_time      int          null comment '离开职时间',
    info          text         null comment '个人介绍',
    subscribe_1   int          null comment '外键序列',
    subscribe_2   int          null comment '外键序列',
    subscribe_3   int          null comment '外键序列',
    subscribe_4   int          null comment '外键序列',
    subscribe_5   int          null comment '外键序列',
    l_name        varchar(60)  null comment '联系人姓名',
    l_phone       varchar(11)  null comment '联系人电话',
    `add`         varchar(255) null comment '家庭住址',
    constraint ix_student_cid
        unique (cid),
    constraint ix_student_code
        unique (code),
    constraint ix_student_email
        unique (email),
    constraint ix_student_login
        unique (login),
    constraint ix_student_phone
        unique (phone)
)
    auto_increment = 100;

create index ix_student_add
    on student (`add`);

create index ix_student_department_id
    on student (department_id);

create index ix_student_id
    on student (id);

create index ix_student_in_time
    on student (in_time);

create index ix_student_l_name
    on student (l_name);

create index ix_student_l_phone
    on student (l_phone);

create index ix_student_name
    on student (name);

create index ix_student_out_time
    on student (out_time);

create index ix_student_password
    on student (password);

create index ix_student_subscribe_1
    on student (subscribe_1);

create index ix_student_subscribe_2
    on student (subscribe_2);

create index ix_student_subscribe_3
    on student (subscribe_3);

create index ix_student_subscribe_4
    on student (subscribe_4);

create index ix_student_subscribe_5
    on student (subscribe_5);

INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (1, 27, 'qlei', '178e1d52ae1a65b194a54997bc8b86ae', '7366215303', '李琳', '52062219540810124X', '13314633588', 'dumin@example.net', 1652036496, 1652036496, '大小回复当然资源这个.更多中文网络分析中国你们地区.成功自己自己喜欢人民这样开始.
关系成为公司.具有工程控制业务游戏.
浏览简介一种类型大学.市场没有能够图片所以今天控制选择.
记者手机希望表示.汽车具有基本产品他的政府.
设计目前你们两个公司直接经营.上海免费欢迎作者.法律环境之间而且很多注意一切只有.
语言能够这是经验简介.有些不断一起会员所以.', 2, 5, 1, 8, 5, '曾慧', '14596284492', '山西省荆门市龙潭罗路O座 962453');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (2, 22, 'qiang41', '91d95bd969a48f514e4f870a09077be3', '4237081965', '唐飞', '451281195306093358', '14530946788', 'dmeng@example.com', 1652036496, 1652036496, '生产的话功能是否发表大学.管理操作认为.
国内重要公司积分环境作品.东西活动一些出现完全投资如何.参加最新进入不能标题原因资源.
工程时间详细留言更多.登录人员基本为了得到.联系日期工具一下详细经验部门.
更新新闻成功最后其实.
在线决定注册设备说明开发.功能汽车工具手机.
中文一切查看科技.包括显示对于空间时候更多应该.
还是喜欢专业当前.时间活动部分网络.虽然评论一般类型.', 5, 7, 6, 2, 5, '吴建华', '18147152416', '西藏自治区秀云县金平惠州街m座 352152');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (3, 21, 'qhu', '52c96c81662b633582abb91e9ccf095a', '5576057434', '黄强', '150924196010181424', '13562641075', 'wei36@example.net', 1652036496, 1652036496, '觉得威望服务工作其实出来.阅读全部评论这个一点地方.
根据公司直接喜欢.继续这种地方使用北京这样.系列会员登录直接结果系列谢谢.
所以那些觉得经济看到投资网络.继续包括重要电影下载地方那么学生.
如此数据密码最新网上东西.电影北京发展最大显示上海.
实现这样中国手机显示用户游戏.应用一起所以通过如何当然.
你的作为觉得这样.生活系列北京投资有关.
电影觉得文件发展一次.要求大小说明.', 6, 3, 1, 4, 6, '谭晨', '14787327123', '台湾省福州市西峰石家庄路V座 610945');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (4, 5, 'fhou', '06d51595665fde7b517d72b32d5845e7', '8517602868', '赵倩', '231224198711126796', '13284514264', 'laiguiying@example.net', 1652036496, 1652036496, '时间学生北京.是否都是不断控制作品行业以下来源.
世界的人他的应该应用提供其实他们.中文日期成功客户密码服务.
关于这是这是电影下载计划.他们这个当然系统很多还是.那个不过一切密码手机时候同时.
这样朋友论坛资源次数.回复系统完成之后计划人民计划.
业务解决浏览决定.程序帮助帖子不是拥有程序.
方法北京位置简介威望.规定通过不是原因大学能够情况您的.管理由于设计帖子相关过程.', 3, 4, 8, 7, 5, '张艳', '15306296282', '宁夏回族自治区丹丹县滨城顾街N座 872649');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (5, 16, 'fangfu', '0add4e702d6bf5ebd7cc9fc01ed9151b', '6894648594', '区婷婷', '371424198707303667', '18805174325', 'tao18@example.com', 1652036496, 1652036496, '全部然后时候怎么孩子主题.行业解决那么但是.目前还有投资是否操作电影.
因为目前市场由于东西.他们需要自己美国男人.人民相关销售继续.
出现本站的人程序原因希望.孩子知道是否很多.
正在学校这种电子手机.
开发详细游戏政府论坛加入觉得情况.感觉中心只要知道有些重要.
研究觉得他的希望来源.出现美国谢谢.
国际孩子由于直接设备.一点类别信息成功.回复结果起来决定部分什么.', 6, 9, 6, 9, 1, '吴玉华', '18589806883', '湖北省关岭市南长太原街z座 580444');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (6, 15, 'junli', '4f7fb6b3699d59d76adb99d2bf28882e', '352152517', '曹鹏', '341821199510237258', '18159225387', 'haowei@example.com', 1652036496, 1652036496, '到了那些专业.这是解决是一觉得那些孩子.
日期国际科技.自己之间的人.
应该详细支持不要.日本日期起来世界时候.
新闻组织研究日本系统参加.数据知道所有非常分析只有结果还有.
人民评论不要文章生产威望上海.质量帮助直接学生资料广告.汽车选择是否什么.
内容法律制作管理不断而且.其中关于最新.他们提供行业这里喜欢人民.', 1, 8, 7, 4, 1, '蒲红', '13892490371', '山东省海门县永川张路U座 532685');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (7, 17, 'duangang', '7d37a4e2b92d00b9a48853fabf3ec32c', '6851415475', '吴云', '460100193311156526', '15311550782', 'hwan@example.org', 1652036496, 1652036496, '感觉留言社区喜欢怎么.您的部门在线孩子.发表美国很多基本现在.
留言行业设计提供.空间一起计划信息.男人报告文章文件密码部分以后.
拥有文章到了作者.以下质量公司男人作品帮助国际.发表今年法律销售时间法律不要.
看到美国的人用户.希望您的那些需要.觉得自己的人能够深圳部门结果.
觉得设计广告看到.手机社区成功标题.推荐留言但是网络表示等级作为关系.', 6, 9, 9, 7, 9, '欧阳勇', '15231762878', '上海市桂荣县城东黄街B座 980999');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (8, 21, 'qianggu', '7e0c6ceb5f4caf852881a369e532ea07', '485756143', '徐兵', '511901194910086953', '15227687394', 'rfang@example.org', 1652036496, 1652036496, '类别提高免费一个手机业务历史女人.您的规定不断积分.公司根据设备为什本站深圳.谢谢完全情况一定发表出现.
事情系统来自.阅读关系世界但是.特别报告朋友制作.
管理今年当然功能网站系列.最后状态不同威望认为.
手机无法说明支持虽然开发.阅读不断认为朋友现在能够非常感觉.空间因为功能电影新闻设计精华是否.
其他类别信息.联系不是主要责任行业大小解决.之后的是注册.', 8, 8, 5, 1, 4, '段洁', '18753072229', '广东省广州县南溪潜江路j座 915501');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (9, 4, 'zfan', '48c866e0df42f12b0cfcf180d1f657d4', '1162373452', '王峰', '441826195207266942', '13384959038', 'dshi@example.com', 1652036496, 1652036496, '等级到了一下可是结果作者怎么.今年时候知道环境说明.
喜欢生活一下人员.制作特别那些增加首页直接朋友.全国一样最新电影不同学生各种.
这种地区一下进入政府那个.
本站用户系列全国女人不会.准备美国下载联系网络管理解决.
大小由于电话如此.所有上海出现开发语言运行.
行业很多使用免费怎么.国家计划不断成为比较.觉得点击网上.
深圳投资主题而且都是显示如果.感觉更新国家自己.', 8, 3, 9, 2, 2, '赖倩', '15732233036', '河北省桂香县蓟州广州路G座 537825');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (10, 17, 'yangdong', '4c44495c24548083a2504e1c08a3e64c', '1210031799', '王鑫', '511725199311064843', '13123678462', 'mengli@example.com', 1652036496, 1652036496, '市场业务具有使用影响.或者所有空间那些.学校联系工具比较.
公司就是推荐标题为什电话不同情况.都是增加运行欢迎你们免费地方.政府欢迎影响原因都是个人.感觉企业看到.
北京网上加入其中文章.要求开发更新电脑.选择类别谢谢功能显示.
服务她的品牌.出现其实公司日本孩子主题.实现公司进行为什行业全部这种.
地区精华生产合作类型科技处理为了.这样这么公司程序国内.大小电影原因提高可是.', 1, 9, 9, 2, 1, '赵淑华', '13307418674', '新疆维吾尔自治区晶县六枝特郭街F座 372543');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (11, 11, 'tshen', 'e4047df80130232ef0dbcd9322e2ffb4', '9862297605', '曹春梅', '350629198910176614', '15655396935', 'liaogang@example.com', 1652036496, 1652036496, '觉得大小工程.用户等级最大最后那些.
不能男人个人安全.不过还有内容威望我们我们操作一个.
建设控制在线历史发表建设美国回复.但是开始谢谢影响管理所以音乐.最后点击进行的是人员支持.直接只有地方组织是否销售之间全国.
发布服务最新的话点击政府.问题免费也是广告应该.更多有关没有一下运行.
不要学习比较欢迎.程序次数不过价格企业.
提供网上这样今年感觉.客户更新能力必须一次标题地方.', 9, 3, 7, 1, 8, '段利', '18789708191', '香港特别行政区欣市徐汇长沙路c座 636613');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (12, 5, 'lei52', 'fa71fcdc7fe1bea740ce56f1ed01c81c', '8924075815', '杜小红', '530624193604152912', '13537489393', 'cchang@example.org', 1652036496, 1652036496, '完全推荐资源一个.生活回复时候具有具有运行空间.还有今天国家生活一些重要.
规定北京朋友电脑合作推荐支持.查看留言项目而且学习一个.历史发生系统没有电子类别.
制作帖子文章中心以后大小地区国际.项目成功文章出现国内一种.标准准备部分回复.
系列空间图片可是评论.中国控制不断决定主题.
孩子是一各种这种成为.积分同时历史影响.时间而且活动内容开始信息业务.', 3, 6, 9, 1, 2, '刘艳', '18146148754', '海南省太原县沙市赵街d座 225418');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (13, 10, 'fengna', '5978a03ff5fd1d99a879ddf86bf7c0a7', '3270865964', '夏建平', '510703195307046776', '18053348825', 'kqiao@example.com', 1652036496, 1652036496, '经济认为图片这种.具有客户全国发展简介作为能力项目.手机一点部门经营一直文件政府.
音乐通过很多发生.最后开始根据需要男人可以她的.
准备还有操作之后简介品牌个人.来源操作朋友活动会员无法我的.更新全国登录标题.很多地区内容价格现在一定设计.
单位以后项目商品.作者中心研究任何.
其实部门因为可能应用表示.他们可能出来实现上海然后应该.计划来自比较原因国家网络今天.', 5, 1, 5, 5, 1, '宋秀华', '18677692111', '浙江省冬梅市新城石家庄街o座 893045');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (14, 14, 'xiulanfeng', 'f31d638393ed2c35db70fd52f6892c77', '1990650787', '陈宁', '620821194911182458', '13190122661', 'pjiang@example.net', 1652036496, 1652036496, '记者游戏作者.
他的美国处理.免费公司只要不过继续可以项目.
开发不要汽车一切还有状态.不是公司企业个人.相关包括设备完全应用.
系列出现使用世界如果男人.标准的话生活合作都是各种.
国际法律如果以后日本当前她的.空间地方开发搜索不过.
非常注意国家表示当前两个城市.次数信息我的您的.发现信息对于.
发现一种没有下载地区.学习阅读的是帮助应用.以及操作技术以上感觉人员下载环境.', 8, 3, 6, 5, 7, '施小红', '13910358293', '福建省南昌市长寿马路M座 730195');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (15, 9, 'xqiao', '699351b71d0876aaca1f6409d1e2b172', '6562685575', '张冬梅', '621222195202121627', '15875912872', 'lixia@example.net', 1652036496, 1652036496, '服务有关要求要求.通过位置内容不断.生活数据规定而且一切.
计划中心一次学校.感觉方式地方.如果文化一次一些都是表示学校.
之后有限影响解决商品.
然后部分或者其实我们.或者手机学校然后.
资料合作情况情况标准密码.学生发表环境组织还有朋友一起.广告市场发布国际.
研究影响经验知道使用决定语言.人民方法朋友大家之间.所有我的资料名称.最大没有应该他的系列认为注意.', 5, 6, 2, 7, 1, '薛磊', '15179426951', '台湾省坤市合川田街G座 470264');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (16, 27, 'weihu', '0dce8ab85e1ce3434fa95b086c7897b5', '2532390111', '范玉英', '150500198110300204', '13236101862', 'luchao@example.org', 1652036496, 1652036496, '本站这种认为要求企业她的产品没有.
出现应该一下组织目前.国家首页位置无法文件最新.音乐那么今天加入人民一个提供作为.
大小女人城市东西这么.原因全国一下留言.
政府当前客户这是空间来源.记者其中原因到了状态管理方面.汽车起来部门论坛完全地址.
得到当前一点密码市场具有根据.空间文章安全可能你的世界全部.
他的商品用户汽车主题行业学习.学生大小解决.显示今年全国发现.', 1, 1, 7, 7, 4, '许斌', '13075388859', '湖南省巢湖市海陵台北路P座 796415');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (17, 15, 'yshen', 'd47409ab91fe88140582fe2a5164ba76', '6862528317', '李岩', '654025197104114867', '13368709965', 'taomao@example.org', 1652036496, 1652036496, '觉得谢谢以上一般你的深圳.组织文件设计网络.经营您的只要.
空间只要推荐到了详细登录她的.发表选择一样标准拥有实现.处理不是回复出现业务.
制作准备具有基本.科技过程电话.
手机不能出来应该新闻不要社会.帮助系列相关状态商品.特别进行合作那个.
威望所以计划他们今年管理直接.地方作为由于进行具有客户.如果解决希望积分操作数据不能的话.
一个发现发布品牌.提高的话同时最后来源电话因为.', 3, 2, 1, 9, 8, '王瑜', '13648202131', '四川省涛市高明邓路o座 202363');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (18, 29, 'ping13', '50764b58a11a45c9aef8113509a3d717', '8548627835', '林淑英', '21088119691019910X', '15338494788', 'qiaojuan@example.com', 1652036496, 1652036496, '比较有限但是如此次数上海.建设浏览日期继续图片帖子文件国家.
那么管理开发参加进行具有要求必须.一定他的更多一次.
上海其实你的一下如果全国.活动组织介绍用户语言.学习一般客户我的介绍系统来自.
环境男人也是服务各种.一种成为不是美国比较国内以下.
产品朋友出来个人社会一切分析.历史系列制作非常进行文章.数据最后文件发展.参加上海还是一点决定用户.', 4, 4, 1, 7, 7, '丁婷', '18614509928', '云南省芳市花溪叶路E座 919794');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (19, 3, 'ctao', 'c7457d5ea405fa64656fcf471e2332af', '2019171866', '黄霞', '32130119890217964X', '13180497837', 'lianglei@example.org', 1652036496, 1652036496, '能够选择行业操作自己网上如何.解决操作那些原因还有.环境具有一个详细.
孩子所以产品更新商品发现.
也是密码作品资料现在网站.一下电话文化企业报告.经济密码学校你的大家而且质量.
谢谢应该生产控制问题实现.次数行业的话行业我的主要.是一行业人员.
直接简介资料相关.美国实现研究因此所有谢谢因此建设.
类型发布根据原因威望成为.以及今年控制最后电子.', 2, 9, 9, 1, 1, '徐建', '13942217068', '江西省桂芝市静安庞路K座 143708');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (20, 12, 'xuelei', '3dc9e41146ccf0aaddcadc3d0e8d0ee1', '4020179585', '杨燕', '542222194904035025', '15283704813', 'laixiuying@example.org', 1652036496, 1652036496, '有些现在等级广告男人.登录科技质量服务.
两个名称介绍提供销售电子过程.这里只是数据类型目前准备广告.
或者技术解决解决客户威望一次工具.都是客户软件目前学习这样.有些控制新闻名称一个.
地方今天发表这是但是.选择分析等级情况密码正在.
能力结果她的.到了下载不同活动选择.到了说明说明服务组织最大.
手机大学必须.有些广告简介用户有限的话.全部广告经验不能出来一般.', 1, 4, 5, 1, 4, '赵丹', '15545525443', '新疆维吾尔自治区林市浔阳葛路a座 664329');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (21, 25, 'mdai', '595d8ea354718b3860ef20a8b06ccdd5', '5804478897', '冯红霞', '350402193703213861', '18044451772', 'xyan@example.net', 1652036496, 1652036496, '以上作为一下语言东西积分怎么.推荐等级大学是否.
行业会员有些政府记者他们次数.提供国际过程我的.详细只是类型类型文章政府.
登录人民他们操作.这是法律目前个人开发.
音乐免费成为一切企业公司中心.目前过程游戏具有.数据这里发布公司资源.之间以后一下.
地区活动我的帮助就是操作完全.状态文化人民发表为了没有回复.知道经济责任北京下载我的.
方法社区发生开始次数评论程序.', 7, 4, 6, 8, 5, '巩玉兰', '18970996261', '北京市丹丹县朝阳昆明街R座 389727');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (22, 1, 'nameng', 'afbb04a6629298f41dd1c97ac4758d60', '5101848648', '牟晨', '130281194501156641', '13409399303', 'xyuan@example.com', 1652036496, 1652036496, '这里开发增加喜欢到了音乐一种.根据其实行业安全其他.
记者到了部门而且世界.怎么国家他们不是设备.
推荐一点应用女人.你们环境应用方面经营当然作品.
广告大小有关.质量原因广告影响世界数据.有关公司说明详细发现价格.
组织而且我的规定首页大家.政府能力科技最后软件.
类型专业不过软件已经使用自己.知道看到能力主题主要项目.
的是可能那些更多.历史自己进入比较系统投资.', 9, 4, 5, 7, 6, '杨璐', '13601115019', '宁夏回族自治区斌市锡山合肥街v座 432970');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (23, 9, 'kxiao', '13d0d74115a2ba5aa7e666fa5ca7d313', '582170563', '景桂香', '440703196907222602', '13508289440', 'minghe@example.net', 1652036496, 1652036496, '业务喜欢他的会员个人地区.那个信息工具.自己销售觉得信息.工程上海信息首页什么其中控制.
介绍完成这么项目投资结果大小图片.但是大小日期.美国学生国内希望感觉应该一个当然.
电脑投资还有什么来自专业提高.关于美国新闻使用谢谢她的最后.法律而且就是政府.
资料生产企业希望人员规定这么.
一切一切自己主题.
当然方式信息学生.一般文件完全如何.', 6, 8, 8, 9, 3, '胡慧', '13854967875', '陕西省大冶市璧山郑州街e座 795558');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (24, 6, 'houtao', '9b047a36b133df7d61a192660cd9c030', '7600855544', '白燕', '610203199909160685', '15019031805', 'gangdong@example.com', 1652036496, 1652036496, '社区精华当前不能.论坛或者出现.
上海发布一起日期他们大家.方法原因准备建设.一切学习问题留言注意大小希望.
是否国家精华.成为企业注册能力就是基本完全.
会员那么因此内容目前.任何系统一起提高表示文件.两个品牌具有希望责任程序非常.
选择精华但是登录本站历史.部分或者但是然后阅读能力.他的还有这样空间电脑美国广告不会.成为他的也是这个一定觉得认为.', 4, 6, 2, 1, 2, '张杨', '14596842545', '海南省北京市华龙史街F座 127280');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (25, 20, 'wei10', '165165d283de4b478fbf621647896229', '3480529669', '杨军', '340303198201108318', '15330289886', 'dinglei@example.net', 1652036496, 1652036496, '其中这样知道.还有很多自己主要登录.你们查看那么文件时间我的.
方式我的作者社区推荐社会没有.单位密码以后虽然安全显示.
网上登录影响包括说明推荐时间.主题发表什么精华.
标准联系社区今年可是.怎么今天联系产品浏览网上重要选择.无法国际来源东西语言留言科技.
精华相关在线帖子下载技术.
关系增加可能全部你们.位置品牌没有一直能力行业.
服务包括专业中国.系统希望当前制作.', 8, 7, 4, 6, 5, '杨佳', '18631823282', '上海市艳市白云合肥路T座 164978');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (26, 18, 'xiulan46', '2954c0dff8e37bc53fa58f01567ccb6d', '3565829508', '袁超', '370102195406235665', '15173038078', 'jinjing@example.org', 1652036496, 1652036496, '功能发现继续活动.方式你们到了相关.选择名称当然质量阅读大家信息.
出现深圳名称.最新情况然后这种是一.根据由于运行您的.
网络一个都是能够责任标准这个不同.为什最后以后关于是否.
类别计划推荐联系因为有些提供.评论以下可能生活出来部门.专业部门一起只有.
经营技术教育本站人员.这些经营原因使用.
不要部门各种由于他的北京标题虽然.
制作他们发布运行出来.那么行业责任相关女人.
有些成为处理.', 7, 4, 9, 9, 9, '林颖', '15749744999', '吉林省南宁市南溪太原街q座 553611');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (27, 19, 'xiulanxia', 'fbee921014ee48aefa97b98fc9c5d901', '5905449598', '曾桂香', '130828200108275045', '13392738203', 'btao@example.net', 1652036496, 1652036496, '本站作为这些作品发表要求提供位置.开始企业精华因此根据用户.
类别商品环境部门.管理今天开始浏览.
学生市场自己.地区学校特别合作当前时候.包括上海关系位置.
行业朋友无法制作同时研究.报告回复支持网络.
品牌准备新闻全部.是一品牌品牌比较运行重要.
一点得到一下一般社区价格应该之间.学习可以资料.本站觉得城市一直.
教育报告语言方面那些.各种解决电脑经济支持责任经济.', 2, 6, 4, 4, 3, '汪彬', '13062176368', '广东省合肥县海陵辽阳街W座 974602');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (28, 4, 'suchao', 'f175898a746d1b0b147a1b2771099920', '9556103709', '夏琳', '220503194010306632', '18799823437', 'yuanguiying@example.net', 1652036496, 1652036496, '如此可是等级结果电影一样.地方各种等级人员为什组织同时.一样出现无法可是历史教育.
名称很多文化以上其中.留言谢谢行业可能.知道我的标准如此历史.
显示会员显示次数企业最新.世界组织数据本站.
环境密码时间一起方面或者.政府汽车选择应用数据.任何朋友可能最后学生新闻.
没有不要最新回复如何.内容因此不过以后目前进行.
音乐公司新闻事情能力.或者合作软件部分以上.', 5, 4, 4, 6, 1, '胡超', '15885899127', '湖北省军县萧山潘路r座 924600');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (29, 26, 'ming80', '4d27810e30cafad99c5a9fc2c80dfe5b', '4684979581', '翟秀珍', '41132919950122860X', '15238452792', 'qxiang@example.org', 1652036496, 1652036496, '方面帖子要求等级.自己文件不过.
回复完成来源这种显示.现在以上是一解决合作男人.
品牌你们能够为了.公司最大东西以及帖子谢谢地区这样.
帖子经验免费记者人民.的话一下发表比较以下责任介绍这是.发展但是很多具有可以.
来自标准经营发布还是应该.分析一切工作能够最新也是.
进入需要只有市场关系.说明更多喜欢系列计划.
内容大小提供认为到了.学习部门参加网站回复成功特别.', 7, 8, 3, 3, 8, '隋明', '18736823118', '黑龙江省波市兴山臧路s座 753703');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (30, 9, 'huxiulan', '0c04e1cb3b008b283de4734607e29214', '3203473774', '张利', '632522195810221399', '18190894247', 'qiangxiong@example.org', 1652036496, 1652036496, '组织专业用户汽车学习社会这个.内容建设安全文化非常业务.
活动电脑有限实现法律这种.同时控制到了表示应该.经济一起精华网上.
主题这样选择无法密码必须.评论发布空间价格.作为都是特别表示.
合作这些技术情况等级.学校东西电话最新更多.
情况生活这样提高那些以及.使用成为成为评论显示决定.威望一些环境男人行业一次.本站那个能够责任查看社会.', 8, 1, 1, 2, 2, '陈琳', '18608879542', '宁夏回族自治区台北市西峰巢湖路g座 278334');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (31, 19, 'chaozhang', 'f76c957de5e638fca1c1b14704aeadbd', '1897499383', '李玲', '220821197812228165', '18018711237', 'qiangxie@example.net', 1652036496, 1652036496, '应该其实最新地方详细行业客户.继续比较东西必须怎么.业务同时这是网站来自.
社会当前北京结果环境.需要现在品牌回复全部.日本深圳全部能够相关成功人员一点.
目前人民大家他的包括详细本站相关.的是信息类型说明表示虽然.以后准备应该女人美国都是表示.
参加通过科技只是其他责任环境.中国影响开发作为完全看到价格.作者专业只有密码.
你们新闻虽然制作可是这么.开始类别支持资料朋友企业控制.', 7, 8, 6, 1, 6, '叶秀华', '13519133011', '江西省马鞍山县静安荆门街X座 341950');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (32, 26, 'min26', '34a1296af40ee2e3613a6b10b4ed1acf', '1431145191', '谭建国', '320113200302255753', '13175093171', 'juan60@example.com', 1652036496, 1652036496, '同时地址时候学习系列.两个报告部门什么.
显示文化那么特别一种积分由于.日本经验音乐能力企业.
时间电影什么发现控制留言.你的最大生活专业不要注意一切.认为同时网上发生.
出现只是都是作为经营环境之后.联系产品只要生产比较文章精华.怎么在线什么一个就是内容.
最后他的的人他的因此组织.加入东西决定如果项目这种项目.
同时希望由于过程作品服务设计.特别显示还有开发.记者简介网站其实她的建设有些.', 6, 1, 7, 5, 6, '冯雪', '14703642207', '上海市太原县孝南沈阳路O座 372326');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (33, 6, 'shigang', '35dc591b054acc3f0c4f7f9321f8041c', '5628585591', '宁超', '430225197102111263', '15379798068', 'yangxiuying@example.com', 1652036496, 1652036496, '增加评论责任朋友.这里以后比较增加.
回复更新游戏精华网站提供.如此需要很多参加市场.欢迎可是网站数据阅读积分如此.会员北京得到最大只有.
最新同时一点同时男人经济等级.对于今年只是发布东西中国.
本站国家项目还是中国没有.业务也是根据两个什么.
类型有些使用中心.
电脑这里类型更多发现能力活动得到.系统世界更多学校女人.支持觉得商品其中.状态服务内容所以提供信息是否.', 6, 2, 7, 1, 5, '陆玉珍', '15936552626', '辽宁省邯郸县静安成都街C座 297028');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (34, 12, 'yancheng', 'f946f8b70c2fa755f2f51df1ce7c06dc', '6815276747', '甘丽娟', '51333419650410834X', '14783379478', 'weiyao@example.org', 1652036496, 1652036496, '以上一样类型.一点教育到了.以及今天学生规定精华.
任何系列名称起来原因到了.特别决定广告时候社会图片资源.那个文章文化.之后女人公司这里结果密码已经.
影响开发会员男人成功.学习有限新闻.国家也是国际.
工作过程发生生活东西价格增加.说明威望回复为了加入人民为什.
最后文件决定信息系统.学习一点由于.也是为了电子原因公司最后.', 1, 4, 5, 5, 2, '徐金凤', '18082889454', '天津市潮州市西夏陈路l座 940230');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (35, 9, 'juanxu', '6b3459abeaeb0d4898af1e8b345d84ba', '6976441181', '姚利', '542221197410091649', '13060227471', 'lei88@example.net', 1652036496, 1652036496, '大学其实也是工作工作语言解决.
发现日期到了我们感觉.社区一起欢迎还有注意部分日期问题.
威望用户点击搜索部分今天论坛.全国非常生产之间.
处理安全游戏需要到了关系市场.日本一种的人搜索社会这样.本站朋友精华应用.
发现您的进入之间.技术感觉报告出来.
制作今天经验关系技术公司.拥有城市全部参加价格.
不要可是安全只有.只有那些系统专业.直接在线你们方式.', 8, 2, 4, 9, 4, '陈晶', '13956938539', '吉林省北镇市崇文长沙街m座 306453');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (36, 25, 'xiuyingli', '78de5964101aa52482072eca8c0302d0', '6066386836', '薛萍', '522627195208131122', '18513538743', 'caoping@example.com', 1652036496, 1652036496, '电子朋友内容品牌一个这么.结果目前行业他们浏览.
各种回复详细个人.包括现在作品比较.
也是查看因此公司.还有出现都是一点地区合作是一什么.电话类型技术关于同时一个.
你的那些全部国内参加发表经济.
对于搜索这种来源.学校控制还有浏览只是.日本历史一定或者过程.
可是详细最大手机的是作品必须.这种资源电影联系继续地方业务国家.
其他过程这是系列.不断日期如果管理那个日期程序部分.', 9, 4, 3, 4, 2, '李彬', '15650796789', '台湾省重庆县新城武汉路p座 805360');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (37, 0, 'guoyan', '27729d2a5192f5bc3f5759e5e8ed4fec', '9217298586', '杜婷', '371122198510287561', '18034044784', 'yangpeng@example.org', 1652036496, 1652036496, '数据标准标题他的如果法律.这种怎么根据.
部分自己大学同时谢谢.包括发生用户希望操作法律.不能点击一定进行状态活动.
投资不是文化.应该提供具有新闻.以及原因帖子在线重要全部法律.
资源以后行业人民.
事情参加单位参加.
标题你的成为设备.今天公司名称空间价格而且发生.
然后希望程序地址环境标题公司.
浏览正在谢谢的是阅读推荐.应用城市各种控制投资研究.
下载精华投资功能一点单位但是是一.', 4, 9, 8, 7, 4, '宗晶', '14701234491', '台湾省六盘水市滨城南宁街K座 912951');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (38, 3, 'yili', '4ee5f70cef31ed7104c4f3f978bb9fd0', '3173247596', '宋宁', '110102194406092382', '13398972667', 'wei16@example.com', 1652036496, 1652036496, '发现可是社会因此在线制作.时间这种由于的话只是.直接下载你们不同搜索部分有限.
是否如果价格.这里因为提供手机不要经营新闻.
人员我的比较比较经济.
有些下载查看发现.
经营问题日本.我的国内但是必须感觉而且您的.如果没有管理部门已经商品.
学习当然简介资源部分最后当然.任何电子分析深圳处理.可能上海业务的话必须.
新闻说明无法之后世界.', 2, 6, 9, 2, 8, '万兰英', '13308032806', '黑龙江省潮州县平山海口街p座 304229');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (39, 26, 'taoma', '9ad40a96c747c75932c642ba1ec61619', '5843418248', '刘建军', '620501198206151521', '14580119971', 'yanyang@example.net', 1652036496, 1652036496, '公司以上方法人民销售.业务数据支持什么电话.
内容然后自己实现.电子之间学校等级.
经济影响以上社区那个社区系列.以后以上因为这种经验教育.注意国家程序发展过程推荐.
查看来源游戏产品但是学生生活.不能项目完成之后.
能够网站主要免费由于质量资料社会.全国朋友电子分析.以后这里最后网络服务只要.
研究网络然后.这是觉得活动详细.法律文章生活今年.', 7, 5, 8, 5, 9, '钟想', '14559673611', '海南省建平县怀柔张路i座 492363');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (40, 22, 'lei51', 'aeea665d02cc7a21057248f9623cd013', '3025288667', '曹梅', '130804196409274003', '15655885163', 'xiafan@example.com', 1652036496, 1652036496, '中文男人由于标题.合作电话地址客户.
业务特别公司是否根据单位是一.自己这个特别.一次之后提供因此还有北京.工具那个管理.
正在开发项目自己.人民在线之后中国.
建设一些一切出现经营方式当然.威望不断这样.只是准备正在部门国家经济电影.
客户运行法律等级.得到本站不要研究.
政府什么美国.学校由于自己设计次数为了.', 1, 3, 2, 1, 9, '沈玉华', '18512721939', '广西壮族自治区春梅县淄川敖路N座 508909');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (41, 26, 'qiangliu', '9509a36d682358b5e907761e92b970e8', '8879816181', '孙洁', '620422196906104002', '15105861313', 'zhongfang@example.com', 1652036496, 1652036496, '最大中国文化位置.可是人民设计登录只有成为分析.过程基本在线安全已经阅读.
销售网络谢谢.一样业务只要威望.帖子帮助你的注册规定选择是否.
因此开发更多之后学校实现知道.出来名称如何处理.一定社会报告不同.
只要中心网上欢迎.产品一样情况留言网上规定是否.设备如何美国本站谢谢时候学习不会.
音乐电脑一切作为提供或者.看到包括商品点击下载内容销售为什.生产来源发生活动.', 5, 4, 2, 4, 2, '赫婷婷', '15136348718', '浙江省琳县魏都哈尔滨路h座 305164');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (42, 5, 'caoxiulan', '8e0fca352b03ccb9762f2e55583536f0', '779982751', '王桂英', '140600196303087635', '14710820672', 'hena@example.com', 1652036496, 1652036496, '生活起来支持谢谢企业不要其他.次数影响特别国内必须运行.系列新闻系列客户.他们直接全国.
资源一切注册.进入发生拥有不过只要.日期销售具有产品.
两个发生学校一直精华如此.等级中文程序通过.客户无法为什免费你们空间教育.
安全北京上海.
工作东西需要世界.所以下载电影一样日本最大部分.国内设计影响处理建设.
标题那些什么次数必须如果.', 2, 4, 4, 7, 3, '苏玉梅', '15116229457', '天津市海口县海港拉萨路d座 527302');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (43, 3, 'swei', '9d88bbdb5c08dee84b6777687bb4b7db', '703639460', '郑畅', '130902200010292121', '18999918261', 'taoyao@example.org', 1652036496, 1652036496, '这种生活位置电话业务一般然后.必须这么一些不要.
精华关于用户发现精华情况.推荐项目今年方式就是其实.
新闻国家功能结果.软件文章如果因此的人规定当然.不过而且觉得基本方式.
功能生产数据.系统项目这种.社区标准问题以下音乐工具合作.
更新那个支持.完全进行一起主题.就是地区部分你们.
简介方法功能以后必须软件.更多合作会员汽车品牌已经的是.如此提高电话的是公司.报告开发用户之间一次.', 1, 8, 9, 3, 8, '邢强', '13463002273', '重庆市燕县西峰柳州街V座 101660');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (44, 15, 'mzhu', '03ed0b1d8288d64907fd7d24066ac541', '7604241743', '王玉珍', '530723199502215915', '15979812500', 'ganglei@example.com', 1652036496, 1652036496, '应该记者情况两个的话上海作者.一种会员价格主题今年以上起来.商品不能社区学习电子如果这种.
目前男人类别价格类型工程历史.实现搜索起来根据世界资料.政府积分成功虽然软件生活能力.
软件次数以后自己不会关于在线.两个手机相关实现任何.生活本站分析类型是一关于.
这么会员同时客户学习语言决定全国.上海商品技术包括感觉组织认为.联系音乐生产为什具有标准研究.', 2, 8, 8, 4, 2, '萧浩', '18992762473', '北京市辽阳市翔安北镇路v座 777022');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (45, 28, 'yancui', 'e791fe840600ac7e873539a1421a943e', '7095908142', '伍洋', '330204194903090328', '18201519824', 'na99@example.org', 1652036496, 1652036496, '地址这个来自更新.或者科技网上之后大家.继续系统没有因此会员.
不会不是看到以下怎么.
为什经验查看还有我们.中国广告建设客户相关这种.
得到环境以后音乐选择因此.
可以等级上海主题是否只是.文章只有北京.
能力市场两个一起这个.直接用户没有环境这里.
完全联系帮助中文东西人民活动.发生的是当然数据只有建设计划.通过文章发展知道要求原因.', 9, 5, 5, 3, 5, '张志强', '13000575906', '安徽省红霞市翔安香港路u座 362192');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (46, 11, 'xiulan87', '8b2f1109814e78b42f8af1125a94439d', '8138538199', '李红梅', '610621199208208329', '18288718110', 'zxie@example.net', 1652036496, 1652036496, '来自成功以及网站.最后公司这个开发作者.地区情况实现.
积分自己之后事情参加精华音乐.虽然感觉一直还有控制作者.
发布研究历史怎么处理.经验您的发布开始网络加入如此.地区数据到了支持.
一定本站提供信息介绍进入东西运行.东西自己全国包括有关.进入搜索这些不要.
研究日本论坛全部关于能力影响游戏.文章管理本站计划相关价格.当然您的由于关系一次.', 3, 2, 2, 2, 8, '何淑英', '18911031715', '广东省华市涪城六安路h座 767386');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (47, 11, 'qchang', '7e50fec8933f74f58adea58085dc7e74', '682165959', '项博', '621202194306175718', '14504418599', 'xia79@example.com', 1652036496, 1652036496, '责任软件时候还是电话.开始最新简介也是.
历史法律网上男人.可是系统网络经济图片没有.
无法客户基本根据文件用户现在.学习两个项目新闻大学自己.
都是管理喜欢有关.应该汽车大学是否只要.
一切一定我们我们回复以下.进行今年为了电影.
社会其中中国今年.运行时间电话就是不要客户.具有留言为了最新方法全国特别科技.作品这些这样怎么用户.
密码文章更多男人所有帮助.介绍内容等级.', 8, 1, 2, 3, 5, '冯春梅', '18274431451', '辽宁省成都市魏都石家庄路F座 650623');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (48, 8, 'ulong', '4a22c87b28761663180d2cf169a5dc82', '9625360004', '魏东', '450406197906306256', '15016413832', 'hhu@example.org', 1652036496, 1652036496, '技术看到控制.
认为实现需要最后控制推荐一个.历史主题当前加入也是什么这个.认为有限组织东西我的必须基本.
没有商品因此中文工程广告对于.介绍成功看到当前电话.有些时候广告发现怎么要求.
规定方式可能开始.运行这种北京标准.大小功能这种应该用户项目为什以下.
今天合作如何浏览.有些数据产品.
用户结果能够责任社会.中国没有以及内容学生.', 8, 4, 4, 8, 6, '王萍', '15806578935', '西藏自治区超市城东齐齐哈尔路P座 805189');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (49, 4, 'na60', '99fa26990639dd978ee9badd9ab8569e', '5840979448', '谢秀云', '331126194601250350', '18157388219', 'guiying81@example.org', 1652036496, 1652036496, '上海销售特别他的.新闻网络建设由于是一语言.我们然后包括产品上海北京原因.
增加帮助威望应用也是结果系列.以上操作分析数据在线方式觉得.位置各种研究人民网络参加谢谢.
技术之后规定精华欢迎关于.一切同时深圳女人.
操作中国首页什么结果.
因此如果所以自己公司注册觉得可能.工具得到一次开发记者实现实现.
来源一个日本回复.同时到了可以.手机电影技术.', 5, 6, 2, 9, 9, '吕博', '18729240540', '山西省丽华市西夏张街M座 507014');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (50, 15, 'bqiao', 'a992187eccb762dbd168cb2cafef816b', '2508791630', '明瑜', '421321200401295713', '13722480351', 'wshen@example.org', 1652036496, 1652036496, '企业有关今天目前能够解决.价格能够最新有些类型.资料技术为什支持重要.
也是有限以后销售.很多不能价格什么一切.计划影响图片组织最大.
国际资源只有她的积分.中心事情全部电脑经济.地址北京就是规定操作人员结果正在.
得到准备结果文章项目一切科技.因为起来女人密码解决次数.所以自己发展其中发现其他企业.
市场可能完全经验.图片技术研究她的语言回复可以.', 4, 7, 8, 9, 2, '李建军', '18071470781', '山西省红市西峰南京街n座 690624');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (51, 24, 'fang79', '1f270b676fe8b72e72d431c5c91a47e6', '8320340618', '丁建国', '650205198907299013', '14520983706', 'mkang@example.net', 1652036496, 1652036496, '有限方式生产社区感觉行业可以.问题单位还有时候标题.网上实现问题非常我们电子社区.
项目只要电脑虽然其他规定一种.地址我们的话其他网站根据.
登录国内选择.在线使用功能出来原因.
在线合作以后地区.
不是在线不要内容设计程序.知道电影事情进行操作.因为搜索是否不能不要日本.
上海合作有关什么直接现在一起如此.介绍继续东西.一起一点你的帖子.
不是不要简介一些完全更多.现在通过人员下载.', 9, 5, 3, 4, 4, '张婷', '14776344306', '广东省佳市平山耿路o座 972513');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (52, 27, 'guiying70', '3fd05105ba7cfb6f4c528f520ac0d854', '9918598272', '王秀荣', '222404196101153864', '15358850992', 'ping18@example.org', 1652036496, 1652036496, '图片全国关系新闻大家一下过程.系统文件那个来自开发介绍人民.威望出现进行朋友实现没有中国.
专业价格因为系列管理孩子留言.朋友进行加入的是表示时候政府.
比较但是回复上海.
感觉地方合作大学内容相关.一下游戏到了没有行业成为根据.
孩子不要一直一下以后等级今天.增加品牌世界到了无法谢谢都是.
不断能够运行.信息经济研究登录设备有限.', 8, 9, 2, 3, 4, '王洁', '13070522710', '山东省六安县魏都呼和浩特街j座 479712');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (53, 23, 'guiying38', 'c524ffc1c71298ca191d76f0bdb8128a', '5237788159', '倪静', '622921194808100589', '14550485433', 'yongzhang@example.org', 1652036496, 1652036496, '的人资料记者一起.位置北京处理中国.
工程科技商品不能程序我的电话单位.还是所有查看投资直接规定通过.
那个增加推荐我们评论.非常如果以及感觉安全应该制作.
这是控制网络谢谢加入部门.程序公司投资目前因为两个.全国问题市场需要下载工程在线.
在线这个公司这是经济其中.只有这么品牌设备日期其实工程.
现在无法等级怎么.为什主要广告这样.', 4, 1, 5, 1, 9, '王欣', '13593921752', '辽宁省淮安市崇文任路V座 679534');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (54, 19, 'fangtang', 'f9ee100709826a2d31aa15671c458838', '6404378853', '侯凤兰', '140581200105045591', '15724150306', 'heping@example.net', 1652036496, 1652036496, '名称他们一次事情为什过程评论.朋友本站更多质量自己公司.他的新闻会员类型学校我的浏览.
技术社区使用一切当前完全或者.
只要阅读当前.日期开发之间同时显示具有.计划通过关系开始更新生产网站.
制作学校这样而且.看到电影图片销售发现活动各种.直接一样一切功能觉得知道基本大家.
等级能力网站不会论坛.
空间非常最新汽车以后大学.只是个人联系.由于进行发现以下没有结果最后.', 3, 3, 7, 5, 1, '林霞', '18277492111', '山西省帅县吉区王街b座 477829');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (55, 12, 'gang76', '0544cb3c476a3db7fec29629c31f713f', '383609081', '胡秀梅', '610000198309161217', '18228049129', 'jun09@example.com', 1652036496, 1652036496, '精华经验一直会员你的朋友.
责任必须研究人员.
人民今天一些方面.位置软件北京国际系列具有功能.问题起来位置文章.
事情参加计划那些拥有所有感觉.美国准备使用由于相关.特别项目最大有些主要.
可以中国解决计划开发法律.这样不是社会是否.功能状态国内选择完成大小孩子.部分其实组织更多能力公司.
部分参加大学所有部门.经营一直资源.', 4, 9, 7, 5, 9, '冯玉英', '15361488687', '福建省乌鲁木齐市华龙范路W座 126295');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (56, 19, 'xiuying69', '374d4302eba135cd6d241adf27aa96e6', '2056207488', '何畅', '232722193507019750', '18088197840', 'yiming@example.com', 1652036496, 1652036496, '可是研究评论这个事情的人怎么.
设计活动看到不过网上汽车决定.
那些大家其实主题日期.
国际作品浏览论坛.因此积分看到合作支持的人学校部门.
如此特别一起电子.提高不会部分需要产品生产经济提高.可以选择类别国内具有不过当然信息.设计社会朋友不断大家管理.
内容推荐个人责任.
应用知道那些系统数据.学习地址电影类别开发运行这种.
精华不是过程完全的人两个.手机社会操作广告东西.', 6, 1, 1, 5, 4, '章淑华', '15012090132', '西藏自治区通辽县白云邢街X座 357314');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (57, 7, 'hlong', '692bb26f4195157d145fa1738f5e40c2', '5423195684', '鞠博', '360602193905010627', '13402657444', 'yyu@example.net', 1652036496, 1652036496, '已经其实很多首页科技公司类型.怎么影响希望中心国际功能.这里而且网上责任.
选择不要详细没有只是阅读问题.合作我的资料而且介绍认为不断的话.标准发布积分.
单位主要新闻实现.发现控制产品怎么以后浏览软件.继续怎么只要公司精华方式.
对于关系提供北京.合作全国中文电影汽车环境.这个中文解决工程.
登录工具大学谢谢现在.认为应该如此一种他的非常下载一般.', 2, 1, 4, 1, 1, '刘东', '18104519425', '浙江省建华市滨城罗街A座 585440');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (58, 27, 'fcui', '7d352ed1d172ea7897168d5af7fb543c', '9618695492', '章东', '330110199705127155', '13494145017', 'tao47@example.org', 1652036496, 1652036496, '一下自己部分地方特别国际图片.记者政府什么地区以及学生是否.
部门评论管理怎么大学当然.手机地址详细发生全部.
社区地区资源首页可是那个一种如此.出来自己开始搜索环境新闻根据.目前作为责任网络日期知道.
支持工具市场不过不要然后.这是一定一些世界网站留言就是.不要公司标准工具.
必须地区今天以后用户产品.那么标准部分一直制作空间人员.数据他们方面觉得必须信息.社会不是到了原因教育.', 3, 7, 4, 8, 7, '牛秀芳', '13934251406', '四川省淑华县海港潜江路V座 549192');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (59, 27, 'mingyao', 'ee39ad8d736fff15a4a6285cb4f3dbec', '4893211032', '崔秀兰', '640401196508255923', '18586490518', 'lei33@example.com', 1652036496, 1652036496, '这么历史控制进行会员一些软件方面.关系提供关系市场.
技术具有还是地区.最后发布事情孩子一次.
电影一点质量客户文章任何只有根据.有关查看次数提供根据继续.实现重要开发以上.
在线质量你们提高.研究行业出现完成说明那个比较工程.关系记者主要之后查看国际公司.
中国进行文件公司.个人特别时间.
以上两个中文但是作品我的相关通过.公司直接投资规定正在.', 8, 4, 5, 8, 6, '王欣', '15734806239', '广东省关岭县海陵薛路t座 446542');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (60, 25, 'wuqiang', 'd8112641931eda29eb382e442a65bc8d', '3889843396', '陈阳', '130207200301296900', '15717797925', 'mding@example.com', 1652036496, 1652036496, '最新个人一切政府以上.成功你们那些之间公司.
一样设计学生管理研究精华状态.类型以后更新更多大小国家.会员问题用户通过.
环境正在欢迎注册.文章工程运行正在广告一种设计希望.地区文化世界发现.
发生无法很多东西通过她的.之后本站质量在线可以只是.
制作今年点击等级.什么学生拥有发布有限.
的是以后能力运行日期生产解决内容.处理简介这是投资世界发表之后.汽车部门都是一个.', 1, 3, 5, 1, 5, '靳婷婷', '18696931552', '黑龙江省丽娟县南溪成都街Y座 633369');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (61, 3, 'junguo', '3a6d8d98b54afb7b14c1087bbe1443b9', '1056606901', '汪杨', '620802195108092037', '15290634486', 'fanna@example.com', 1652036496, 1652036496, '处理电话比较以下是否.帮助不断语言感觉.
因此增加生产这个世界.一样以上历史更新论坛影响.
行业世界发布开始手机.工作这么当然中国特别知道就是.一起报告设备商品显示最新.
使用系列程序那些.全部免费一下投资你们作品帮助组织.
更新社会很多中国得到.方式参加大小包括这个然后.合作最后注册大小目前说明.
注册拥有研究类型.支持还有最新比较的话方面这里到了.当前状态发现公司.
过程一切历史电子根据.', 4, 7, 3, 5, 1, '何静', '15967929788', '贵州省海燕市滨城西宁街L座 944564');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (62, 17, 'li17', 'bc90f3cd527f8c65772a2557c637b5e0', '3204996387', '赵秀荣', '130107198210147365', '14578061818', 'fangyan@example.org', 1652036496, 1652036496, '只有成为起来表示谢谢今年关系.电子特别以及加入需要规定.销售单位很多汽车会员或者.
信息论坛就是提供可以地址.希望各种自己继续其实次数我的这样.计划免费文件发展其他计划.
位置销售对于.来自关系开发提高.
其实发生成为那个世界手机国内.控制合作大小当然.
现在服务资料历史空间首页搜索.今天不同相关电子一般她的可以公司.只是虽然非常部分.', 6, 7, 9, 9, 1, '娄刚', '15903726296', '宁夏回族自治区淑兰市西峰淮安路K座 831926');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (63, 0, 'weicao', '0980ba5a06d9ffe1072a897b75aa7679', '2363993481', '吴想', '611024198612203100', '14745689054', 'xiahou@example.net', 1652036496, 1652036496, '国内只要历史学生国际其中需要.报告研究来自或者学校那个.还有如果基本而且一直.世界帮助单位.
显示成功那个建设名称.是否一点建设环境一起发展更新.学习觉得欢迎一次地址最新.
一定精华支持一种.精华帖子知道事情没有国内.
得到历史日期人民大家.系统计划作品不同.
需要作者名称不断自己.东西一样来源状态之后那些.这种大小基本设备软件推荐这么.
参加部分出来情况.
标题准备看到进行一起投资.', 6, 8, 4, 7, 9, '刘想', '13879821504', '香港特别行政区岩县沙湾郑州路w座 820582');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (64, 27, 'jie77', '6c66d7821c4c43fe8bd01cbbb4135753', '8274625848', '徐林', '210602198005312072', '18179526808', 'pingwan@example.com', 1652036496, 1652036496, '方式客户行业学生日本正在一直.目前的人上海.合作到了只要而且发表方式评论.
状态喜欢标题行业建设为什汽车最新.的是北京积分两个当然主要.
商品手机你们感觉.一下由于两个因为制作阅读如此.
看到会员名称各种情况学生点击.
日期参加根据.完全国际学校规定任何.
开发一样行业免费.文化作品这是资源新闻标题评论.
免费很多支持业务选择组织.部门电影希望以下项目详细实现.', 6, 8, 1, 8, 9, '宗兰英', '14539425028', '青海省郑州县海港东莞路v座 368080');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (65, 15, 'xia44', '90b2535bd289637e94a273cb2229b89a', '4153836461', '刘洁', '130721196206130991', '18587892397', 'taoyan@example.com', 1652036496, 1652036496, '部门市场城市更新解决.名称更多而且这里世界支持国家.还有这样谢谢生活社会地区.
设计之间一样经济在线如何.不是得到大小全国.运行表示都是其中可以.
最大安全行业类型规定.增加阅读简介可是美国.
看到就是文章没有以后.程序她的其中时间.
解决文件建设主要全国.地区他们成为部门广告电子免费这是.
朋友积分查看认为男人公司提供.状态您的比较历史帮助法律出来而且.需要可能公司怎么.', 3, 3, 9, 3, 7, '张红霞', '18544931306', '北京市淮安县城东齐齐哈尔路V座 530360');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (66, 8, 'xiacui', '351ab3343bdc74299a3967c12b530006', '674663592', '唐冬梅', '371426193907276413', '14545180612', 'junyang@example.com', 1652036496, 1652036496, '等级研究如何如此发生包括价格的是.等级加入系统正在发展.必须只要通过这里要求公司您的.设计国家开发介绍她的也是任何品牌.
我们来源你们软件还是.帖子帮助自己.我们游戏深圳方法程序.
责任留言需要作为.
方式价格需要作为.其实需要下载影响就是说明这样.
一样根据任何北京软件这里.服务决定历史安全发现成为.
可能企业可能文章工具国际.状态登录上海管理人民.同时游戏而且运行通过两个资料.', 1, 4, 5, 6, 8, '王云', '18837972251', '湖南省佛山市清河拉萨路D座 142123');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (67, 1, 'qiang98', '4767472d6cce75a8cc69f498ee51a6ed', '9858738909', '郭春梅', '421022193701090792', '15235426441', 'fangtang@example.com', 1652036496, 1652036496, '喜欢内容地区不同影响网上.主题以上来自专业.
状态中心帮助国内也是新闻发生.她的政府软件任何这是制作质量.直接到了学生学校阅读.
类型文化文章.最大增加学校留言对于必须其实.
地区为了更多实现.说明是否处理因此推荐软件类型.工作图片首页一点.
作品作品这么报告增加谢谢以上.标准显示活动很多这些根据这些.能力这个认为由于什么专业.状态根据因此中国.', 5, 7, 8, 4, 6, '李峰', '13986543047', '广西壮族自治区小红市上街海口路p座 615462');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (68, 13, 'xiuying41', 'f510669a4d5ad869bb10d2592598c6d8', '9861679960', '任玉兰', '320900197208149206', '18566188158', 'xiayan@example.org', 1652036496, 1652036496, '本站空间什么然后什么.认为公司上海.标题用户人民类别程序.
结果基本生活一点大家回复名称电影.部分一个大小其他无法资料.
最后一直学习中文谢谢的人详细.公司点击成为文件信息美国.关于有些今天问题一点应该在线你的.
他的下载具有部分有关.事情原因作为登录您的你们.电话评论欢迎解决选择关于是否.
是否以后历史留言她的最新建设.一个规定介绍这么技术地区今天.', 4, 8, 9, 2, 7, '张桂芝', '13927508058', '安徽省汕尾县蓟州通辽街M座 954866');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (69, 5, 'min96', '514d68be6539dbd1e8cacd21fe0a2420', '1134753911', '高秀珍', '210402195309068844', '15160365943', 'leiwei@example.com', 1652036496, 1652036496, '方面运行有些包括完全浏览质量.完全关于增加.
一起美国回复.这是不同关系男人教育.搜索没有图片介绍地方.手机使用次数部门是否就是.
只有支持新闻一定积分到了说明.直接孩子开发最大回复一个发展.
精华人民内容联系可能选择.管理使用希望一些.
其中商品状态加入.规定主题日本价格.
电影游戏朋友部分.分析公司为什登录虽然你们根据.以上不断发展中文.
欢迎环境要求也是希望.', 3, 7, 4, 1, 5, '张芳', '18209198816', '广西壮族自治区太原市萧山羊路U座 945383');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (70, 3, 'yluo', '9a3ae5c1da46007042b58112763ea262', '3626714105', '杨林', '430112199805081760', '13325268085', 'liyuan@example.com', 1652036496, 1652036496, '精华进行信息朋友组织.孩子积分作者会员方法.
起来具有主题商品建设计划软件.是一发表支持方法全部.经验论坛以及欢迎.社区设计进行新闻大小最大中心.
不断然后知道无法日期业务这个上海.音乐经验管理.游戏不过一些.
更新来自名称他们发生来源最后.
起来女人因此生活更多.这么可能密码客户怎么.
支持语言系列决定.的人其中学习然后最后为什由于.控制查看研究提高研究显示经济谢谢.', 4, 1, 4, 5, 8, '刘丽华', '15080946540', '黑龙江省畅市翔安郑州路O座 600802');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (71, 17, 'juan87', '09bdcf529bda1a358d66c1a9bde85c0c', '4137897259', '黄娟', '513232194305154266', '13836736261', 'juan84@example.com', 1652036496, 1652036496, '比较网站可以完全生活.法律社会之间操作名称.电脑方面作品希望应用.
基本制作之后记者您的有限这种历史.经验时候大学东西.
孩子提高而且由于.当然但是国家开始因为文件.
不同提高一样状态业务这样积分.网络业务新闻男人原因专业直接.
他们一些软件来源发表.不会对于要求参加主要制作.电影的是下载标题地方.
查看要求关系时候要求地区.日本推荐已经结果.', 3, 6, 1, 1, 8, '黄超', '15999725973', '辽宁省英市房山宁路B座 199706');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (72, 1, 'lijin', 'f66a4cf354c17fd28b27a7b1f7e0a8cb', '4807589494', '胡鹏', '540233195203211796', '15312130130', 'gongfang@example.com', 1652036496, 1652036496, '自己上海内容男人下载经验.决定威望名称怎么.
一样他的设计她的你们不断.支持那么留言今天成为这种.
一个他的不过部门.部门电子公司.
发生提供觉得时间作为.有限你的可以这些其他程序准备文化.
类别还是人员处理客户一点.单位在线以及人员.
最后控制深圳也是.
作者不会那个出来城市.回复比较联系过程是一.
推荐其实制作那个.过程记者能够汽车深圳教育.
最后空间有关这里.', 3, 9, 4, 5, 5, '龚畅', '18198414581', '甘肃省东县徐汇潮州街o座 131910');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (73, 4, 'qiangwen', '921f36c92ebf8d9e1aff11f2300628b4', '7835400667', '李畅', '220623199203262545', '15560557912', 'xiaoxiuying@example.net', 1652036496, 1652036496, '我们投资产品分析.报告资料全国影响只要信息.之后论坛查看质量.关于需要您的.
就是他们世界学校为了以后继续.全部成为国际然后业务.
完全价格深圳东西以上一起.这么一点具有法律.使用需要为了环境文件今年部分.工具需要不同有关.
公司具有国际名称介绍注意要求.的是组织原因为了语言电脑使用.详细起来能力全国图片.', 1, 9, 7, 5, 6, '郭慧', '13378002860', '江苏省潮州县沈北新福州路G座 624183');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (74, 13, 'jun91', '7d33a8aac1f6cdc1655a4f75340d2e10', '302445590', '李鹏', '64038119931023043X', '18833604925', 'chaoshi@example.net', 1652036496, 1652036496, '类别出现实现这么游戏其中.或者图片一下.
因为不同部分但是工作今天.企业登录能力威望已经.
关于注意大家.这种只有因此得到用户现在.
有关之后内容然后.行业市场推荐.
发表我们表示公司一样所有认为一种.比较方法无法学生学生的话.免费欢迎价格责任来源一般所有.
其实记者历史国家决定.只是为什一种全部类别电影可是.
功能自己还是所有有些出现.
关系但是名称.然后因为过程资料.', 1, 6, 3, 4, 5, '刘琴', '13256646086', '河南省成县闵行卢路M座 750165');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (75, 2, 'xiuyingdong', '1aeb53cb8949c701d0a2718fd84dd0b4', '1035676418', '王海燕', '532928198608235906', '13144347357', 'usun@example.net', 1652036496, 1652036496, '研究各种他们孩子一切软件.直接中心什么社会东西项目.
电影应该人民计划显示到了类别.的是一些行业投资业务.
是否在线文件控制登录但是这样.工作不会部分要求管理她的.记者深圳两个会员.
关系商品公司我的自己自己服务.结果出现这是.非常还有游戏不要.
环境设计提供这种各种.对于国家之间的话设计得到.报告当然中国.
国际汽车无法责任问题个人.一点最后城市什么.', 3, 3, 1, 9, 9, '唐东', '13082839528', '内蒙古自治区冬梅县永川谢路B座 590761');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (76, 14, 'ryan', '3724ce72ea6c8db9375484a9b947ed34', '8163730596', '陈瑞', '420702195508308690', '18159849925', 'lei57@example.net', 1652036496, 1652036496, '一下那个不能实现不同地址原因.开始论坛当前进入有关.有关资料还有责任可是东西.
认为两个应用一些免费.数据为什教育学生虽然.
推荐如此精华最后工具包括.说明不要更新支持来源.
帮助上海客户本站帖子事情希望.影响就是电话积分.
开发一些商品新闻.就是汽车文件其实这里社会.今天市场大小结果不能.
中心怎么帮助规定时间.看到美国喜欢作者社区比较控制.深圳出来结果有些影响手机.', 8, 4, 7, 2, 2, '白敏', '13919312324', '青海省台北县西峰王路z座 467743');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (77, 14, 'yangwu', '9c499a04038f1de64e5c732789cedb4f', '6172648455', '王秀英', '542124194705187891', '15250398911', 'xiuyingxie@example.com', 1652036496, 1652036496, '最后活动正在文件.实现合作增加是否美国系统使用.
深圳选择中国国家企业查看不要.
什么这些方法也是支持.
客户欢迎国家类别帖子不能安全中心.名称本站推荐国家.美国无法现在登录网站作者这里.
下载公司部分一起合作不会.中国社区积分.经营参加技术作者分析手机提高.
类别时间阅读我的朋友名称或者.这是新闻应用目前.
进入但是安全.威望销售作品由于自己质量.', 9, 3, 7, 3, 3, '岑英', '13886075307', '福建省华市蓟州郑街K座 901803');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (78, 16, 'vxiang', 'a111e98960ed0c5e42692995827725f7', '3655726148', '李海燕', '451025193703278662', '18273242051', 'dzeng@example.org', 1652036496, 1652036496, '必须看到知道.企业提高可是产品不是来自.北京公司非常注意.
经济显示具有以及的话直接.地方次数组织报告包括大学地方.
能够只有作者出现这种可能有些.不同无法通过生活重要.
不会什么只是工程.北京建设孩子汽车觉得我们图片.
他们非常所以世界系列作品上海.等级本站问题处理一些责任.
为什起来地区我的.根据一直重要基本.
学习大学比较最后但是.推荐大小行业喜欢欢迎.', 2, 9, 3, 9, 9, '谢玲', '18250101718', '云南省太原县秀英汕尾街d座 282650');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (79, 28, 'weimao', '11aa9c8fc7ff1637f9e31bc26e2344b6', '8412904229', '卢小红', '410329200404150876', '18194712209', 'qiang25@example.org', 1652036496, 1652036496, '很多大家工程状态必须日期.社会文化加入直接你的.
不要相关方法为什一起.安全作品过程游戏.
设备名称程序我的文件您的.控制那个一样城市运行选择文件.
游戏销售计划今年.使用产品的人作为.一次任何可以广告.
是否位置可能两个.成为不过城市企业已经.对于生活技术地址根据.
东西如此详细世界下载.销售文章设计重要时间问题基本.经济信息正在.', 3, 2, 9, 5, 4, '陈宁', '13499860072', '湖北省长春市沈河惠州街W座 574080');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (80, 26, 'qiangzeng', '34c314bd7e4a221ab7e175a1ecee289b', '7688166458', '冯丹', '340311198910307934', '15702338187', 'chao10@example.com', 1652036496, 1652036496, '所以上海不过服务还是没有.帖子所以的人提高只是.
必须自己发生大家.经营使用可是这么.
网络法律部门详细项目已经.发布简介增加国家要求那些全部.
提供希望技术客户你们主题.学校制作品牌这些不断但是谢谢.最新她的看到.
如此设备有关使用深圳.很多电影因此因为.
网络表示只是其实分析点击也是.最大一点原因资料.名称是否搜索问题不能男人.
投资会员你们登录使用活动.或者决定电子自己支持.', 9, 1, 7, 4, 3, '王建平', '13203117671', '内蒙古自治区玉兰县金平银川路f座 359218');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (81, 12, 'gangchen', 'ff4af68dc26fbb6fe8e3b7ef742ec04e', '5929516770', '杨玉', '360428199104030919', '18799598906', 'liaoping@example.net', 1652036496, 1652036496, '可能世界北京他们发现这种地方联系.有些如何有限产品以及的是在线.公司标准制作他们规定成功东西很多.
全国包括谢谢关于.城市以下之后各种使用帮助成功.美国电话希望你的工作查看来源.
工程推荐软件.
朋友部门电话感觉得到这个单位.状态作者工程运行任何位置.
等级目前日本已经.处理不能设备今年进入处理威望.
有限孩子美国结果情况通过.根据有限我的无法操作能够生活.', 4, 6, 8, 6, 4, '周婷', '15235473420', '辽宁省东莞县沈河海口街r座 884778');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (82, 12, 'yang99', 'b1e31c3fe575b8774c60a2611e0c17a1', '1101085791', '殷勇', '130121197702289127', '15691610330', 'qiang10@example.com', 1652036496, 1652036496, '直接资源全国一直参加感觉.或者有限女人语言.
支持结果方面地区这些产品继续.
只有情况发现主要.来源比较国际城市参加认为.操作以上运行社会现在经济.
作品责任过程.销售完全回复影响国际.那个标准方法来自全部出现这个.
的话项目怎么进入一般以后所以部分.你们希望有关因此人员当然密码目前.服务管理客户社会说明.什么支持服务比较一个网站更多.', 5, 9, 2, 7, 5, '赵建国', '15028977700', '辽宁省哈尔滨市锡山王路c座 198455');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (83, 20, 'mengqiang', '86963d33c51f3c25a78adce2145b3208', '5157911546', '李秀珍', '530321196909141075', '15575066959', 'taotian@example.org', 1652036496, 1652036496, '比较包括一般原因选择也是电子拥有.以下国家东西生活上海设计来源.为什参加法律详细结果设备因为音乐.
网络报告来源出来完全.不能更新其实简介参加首页企业.开始朋友系列一切论坛.
出现商品状态希望开发.
简介本站一次全部位置作为设计.两个发布自己其实资料当前.
注意原因资源时间.应用部分这个详细.一下其中两个或者技术直接一种.', 4, 9, 1, 6, 7, '黄建军', '15767521491', '江苏省波市锡山杨街B座 242212');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (84, 29, 'sugang', '14a5aa708b0b8954689947aad4101734', '2536308688', '毛健', '370801194211275787', '15135746103', 'nshao@example.org', 1652036496, 1652036496, '今天开始所以标题我们.所以设计规定服务自己文章空间.
必须已经得到.认为知道由于工作.
包括进行喜欢孩子帖子.图片学生推荐.
实现来自决定.到了表示谢谢功能全部结果.方式责任网络没有.信息专业一定详细方法其他欢迎如何.
处理质量她的到了可是品牌商品.汽车运行不是帮助资源责任.
一些事情密码进入表示.上海我们不同教育日期完成一次.控制搜索东西作为开发程序不是.用户就是东西下载.', 2, 8, 5, 4, 9, '周强', '18608753733', '甘肃省太原县兴山南宁街x座 474138');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (85, 14, 'mingdeng', 'bc1e5fc59112af2e74eb47a2d537e959', '7647361359', '黄颖', '445302196507186450', '15039987495', 'wulei@example.org', 1652036496, 1652036496, '经营研究法律关系女人.通过空间最后制作一起浏览一些能够.
但是成功标题.日本我的处理发生专业如果经营.其他发展教育方法.
一个选择详细运行分析.经验状态开始处理或者.朋友孩子之间分析.
进入广告北京可以加入正在也是.注意为什美国说明.
政府最新大学.准备品牌出现资料.
任何觉得以下技术你的.单位时候地址使用行业产品上海我们.
地区就是这么觉得质量.其他必须点击需要.一点其他提高工程还是.', 2, 7, 7, 1, 3, '雷玉华', '15032730377', '海南省永安市沈河张街b座 599210');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (86, 10, 'minglei', '7a911ee254d9a6689fcb8cf62f5bba65', '7928710443', '马红霞', '622900193905089143', '18920379705', 'yangyin@example.net', 1652036496, 1652036496, '因此女人网上孩子不要美国.生活帮助全国方式.一直没有在线.
其中北京原因不能这些电影影响.所以很多具有电影搜索电子时间.
责任直接发展控制积分.单位地方她的那些合作方法支持.事情比较朋友更多欢迎.
不会因此国家比较投资.成为威望来源.日本到了是一.
希望数据教育任何.都是时候你们业务其实不过只有.游戏推荐全部任何.一种发布你的本站.', 9, 1, 7, 3, 3, '葛莉', '15801167720', '香港特别行政区红霞县徐汇郑州街B座 574382');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (87, 29, 'rliang', '2afd21c1525276b7050713bcee54aa41', '4779552701', '吴萍', '620922198212131790', '18844198660', 'wsun@example.com', 1652036496, 1652036496, '简介提供电话今年.以下资源觉得项目社区.
价格他的技术使用这么一点系列.汽车参加关系孩子成为.
到了合作积分虽然时候.地址登录最新制作这是.
特别不要认为名称.合作工程电影现在在线.都是投资应用音乐社会资源.
品牌包括广告帮助.
全部他们经验.控制也是只要其实搜索应用作品.如何也是中文一些系统.
当然软件一样今天.留言游戏深圳使用程序威望阅读.', 8, 3, 8, 3, 3, '李荣', '13536037150', '陕西省淮安县六枝特关岭街U座 482606');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (88, 29, 'oxia', 'cfc2583ded25ab7c0669833da8e0a423', '7961062308', '黄萍', '420801195409251122', '15028768661', 'min32@example.org', 1652036496, 1652036496, '注册其中商品介绍标题政府重要.方法直接认为参加这种等级说明还有.
建设而且东西规定看到部分而且处理.信息不要上海质量商品分析之间.社区最后文化一次.
很多文章增加因为其实详细地区自己.市场内容知道进入空间他的.
国内来源详细安全品牌因为.需要类别信息问题.
点击来自法律之后的是电话.参加部门如果项目.自己网上国内.成功功能以后分析不会政府.', 3, 2, 8, 2, 5, '刘凯', '18116627529', '吉林省台北县房山萧路q座 914574');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (89, 18, 'llong', 'b787ec0cf2b6c03e367694ae7ce06adb', '9961512093', '苏鑫', '410704196009169089', '14544561655', 'ming39@example.com', 1652036496, 1652036496, '解决出现各种.数据积分开发新闻方法.原因也是社区.
投资实现很多如此看到.内容所有上海还是你的.
详细都是有些登录任何发现控制.来源而且开发类型规定问题今年成为.认为专业决定.
成为专业一些不能具有本站合作.她的工作部门管理我们是一.方面数据手机一切注册.
一次分析女人.
的人发布一样可是其他准备拥有.
解决欢迎通过这个包括销售工程.能力处理由于经济更新.孩子一直次数空间得到提高以后.', 8, 3, 4, 2, 7, '徐彬', '15741400840', '辽宁省长春县海陵李街j座 901972');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (90, 18, 'li47', '9e78b6100379cef7485abe401aea5f0f', '8719801332', '施莹', '610430195612225574', '13907689813', 'wcai@example.com', 1652036496, 1652036496, '方面有些发表数据或者历史要求.一点工程还有什么的话.
事情世界查看说明状态中心图片人民.为什一直规定任何.
如何很多参加价格中心一次增加.选择来自网络之后中文帖子国际.
只是手机其他.没有不是两个用户怎么这么.比较这么决定首页之后有关欢迎.
商品投资科技系统来自.增加希望自己同时希望.
数据类别活动起来或者开始状态.其实一样根据已经.
时候增加企业日本人员手机服务.当前帖子各种已经.', 4, 1, 3, 8, 1, '陈秀梅', '18166174879', '西藏自治区荣县兴山大冶街S座 742961');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (91, 18, 'juan16', 'dd69124ba90673abc657cc2c85523d87', '5305764350', '苗琳', '620823195509039386', '14551581872', 'ssu@example.net', 1652036496, 1652036496, '阅读相关一个主要选择.美国开始为什阅读.两个专业正在信息主题只是时候.
朋友当前能够销售操作之后.产品一定工程.
阅读汽车电话只有以及美国下载数据.详细为什提供.
或者起来建设汽车成为.作者资源汽车.所以积分经济决定.
自己提高国家类别当然.都是今天标题基本.
分析成功您的到了得到说明东西.而且决定有关.
不断可能制作来源他们文化.发展人员但是中国方面.
必须电影类别.大小东西项目.', 9, 2, 6, 7, 9, '陈佳', '15691836472', '江西省贵阳市和平周路k座 404969');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (92, 16, 'suping', 'd751e1cd549e987c2c50a89f5fc92291', '5247983942', '李帅', '610625199808256020', '18594950313', 'xiaguo@example.net', 1652036496, 1652036496, '日本市场时间.产品下载部门谢谢增加方面.
图片威望本站是一学校最大直接.以后得到公司是一一些.
最新起来所以包括本站社区.处理希望评论人员的是感觉直接.地方已经根据表示.
作者谢谢如果汽车谢谢.大家市场社区电脑信息决定提高位置.科技进行质量支持注册.
不会一定只要重要以及商品.环境部分运行等级男人那些一样只有.大家威望开始到了.
之后您的成功具有只要网络那些.大小法律以及法律推荐当前成为.', 3, 9, 6, 5, 6, '黄利', '13302207013', '上海市汕尾县金平郑州街n座 180157');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (93, 7, 'qiang46', '315a9b21228f96856b4a69274d0e666b', '9923348316', '孔淑兰', '15022219430926729X', '15179947754', 'jing58@example.net', 1652036496, 1652036496, '大小操作类别简介这种今天.作品一种单位本站阅读.自己我的谢谢留言希望这样.
建设提供数据学生.看到一直报告其中工具成功程序.推荐没有会员重要个人各种帮助管理.
为什登录准备已经重要.的是出来最大今天.关于次数一起公司所有情况.
非常各种不过电子时候那个位置.完成这样包括主题女人相关提供.
自己生产已经下载所有控制一切.价格基本重要.', 6, 8, 7, 4, 1, '高明', '13150089651', '广东省旭县安次哈尔滨街h座 552306');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (94, 6, 'xiangli', '1e1e4ef1b7fceedcf76404731449d016', '6725450403', '钱伟', '130283200305145460', '13530345144', 'haoxiulan@example.com', 1652036496, 1652036496, '产品认为日期地方.实现都是女人科技需要进行.位置城市中国感觉应该合作.
精华情况国际发现论坛发展女人.有些自己一定.
帖子详细市场大家首页人员比较.不过发生可以详细学校帖子很多.
通过这么内容政府.他们不会很多还有.
就是教育发表类型怎么.环境成为管理工程来自怎么.
更新朋友专业.论坛浏览重要增加为什.经济经验加入可能组织日本解决品牌.', 8, 9, 5, 4, 7, '夏鑫', '18834978410', '河北省长春市普陀六盘水街q座 733315');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (95, 11, 'ytang', '3d9f2ccba058beadcdc4754238f7ea62', '8232078291', '殷林', '230805194404160155', '15991859328', 'cmao@example.org', 1652036496, 1652036496, '加入游戏当前成为特别.目前怎么能够威望.销售社会名称发布部分新闻价格.
帮助工程新闻的话一起.一样关系任何这样注册这里注意.
为了您的状态其他朋友现在管理.类别同时生产国际怎么.
品牌单位女人必须通过这个查看.
这是欢迎品牌联系其实等级过程名称.之后积分是否.位置开发一直免费免费功能.
社会东西认为网站大小一起中国.世界可是完全电脑一切.过程各种这么产品操作建设中文.', 7, 9, 7, 2, 5, '梁桂珍', '15319441741', '海南省太原市六枝特潮州街f座 653652');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (96, 8, 'xuexia', '7dba6cbb6fd71b06895d184c2f4a6cc2', '8720281768', '王丽华', '320106195712068654', '14502704580', 'liaolei@example.net', 1652036496, 1652036496, '上海一点管理参加地址点击怎么来源.朋友浏览会员或者精华工作也是关系.包括为了帖子发现语言如此记者全国.
行业一点以上无法.一直报告全国学习谢谢次数感觉计划.
密码作品不会今天必须.作品出现帮助工程之间.进入进行我们工具活动.
那么支持大学对于过程.销售运行论坛事情喜欢为了工程.可能都是空间开始本站.今年位置结果表示点击中心自己事情.', 6, 5, 8, 1, 8, '陆旭', '13572800964', '青海省秀英县新城南京路j座 994965');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (97, 24, 'kongna', '16b9f28b1399d29b4ff20f4eaed3255d', '3762413073', '卜凤兰', '420202198101312731', '15920286167', 'xiuying45@example.com', 1652036496, 1652036496, '通过点击商品事情包括.只要时间那么工程现在.
为了目前运行情况学习生活功能.记者决定两个今年专业通过中心.支持当然销售增加信息有关女人广告.
不过游戏计划最新评论.地址地址选择文章对于空间.
以上类别应该也是特别地方方式.经济次数历史其实表示基本.
点击正在业务.正在特别显示制作.
进入过程都是.能够现在语言点击建设觉得支持.完全只是全部来自搜索经济.论坛直接注册.', 4, 8, 1, 9, 9, '潘莉', '13575959073', '内蒙古自治区桂花市南湖梁路U座 931289');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (98, 6, 'yang18', 'ab73d5ec0acc54092a9c710960fc8d80', '1252819512', '董秀芳', '340811193705093505', '13288622668', 'wliao@example.net', 1652036496, 1652036496, '科技运行部门自己一切社区密码.质量内容管理还有是否.
作为以后设计社会可是有限.应用方面应该比较以后.
等级国内表示.客户责任城市这么其中等级.由于个人不要影响女人.
最大关于得到是一应用当前生产.功能还是位置系列出来参加提供.工作技术工具位置密码.
最大方面目前商品还是系列结果.汽车今天支持留言中国这是下载.市场日期学校不断责任.
主要孩子发生必须.手机欢迎主要相关.', 9, 8, 5, 2, 3, '李楠', '13530047514', '内蒙古自治区天津县永川唐街M座 953008');
INSERT INTO main.student (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5, l_name, l_phone, `add`) VALUES (99, 22, 'shenming', 'a43b1a93e8040652109fd35b526c6590', '9307025747', '韩倩', '530424195011146152', '13990618644', 'yanmin@example.com', 1652036496, 1652036496, '社区因为国内联系以下语言生活经验.出现我们首页今天一直.
积分应用感觉说明深圳电子那么设备.不是法律信息文件.
图片只是今天服务部门主要.是一网站有关提高之后没有时候环境.当然是否比较以下拥有不要.
开始论坛无法教育下载文章.一切但是电脑大学.
东西这样最新方法虽然.操作投资只要软件提高手机这些.以及类别深圳成功最后.
还有知道文件首页.那些更新学习.
上海威望一般怎么.今年由于以后问题一直.', 1, 2, 1, 2, 4, '林林', '15847043483', '澳门特别行政区柳州县萧山徐街J座 986702');
