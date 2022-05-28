create table teacher
(
    id            int auto_increment comment 'id序列'
        primary key,
    department_id int          not null comment '外键序列',
    login         varchar(20)  not null comment '老师的登录名称',
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
    constraint ix_teacher_cid
        unique (cid),
    constraint ix_teacher_code
        unique (code),
    constraint ix_teacher_email
        unique (email),
    constraint ix_teacher_login
        unique (login),
    constraint ix_teacher_phone
        unique (phone)
)
    auto_increment = 30;

create index ix_teacher_department_id
    on teacher (department_id);

create index ix_teacher_id
    on teacher (id);

create index ix_teacher_in_time
    on teacher (in_time);

create index ix_teacher_name
    on teacher (name);

create index ix_teacher_out_time
    on teacher (out_time);

create index ix_teacher_password
    on teacher (password);

create index ix_teacher_subscribe_1
    on teacher (subscribe_1);

create index ix_teacher_subscribe_2
    on teacher (subscribe_2);

create index ix_teacher_subscribe_3
    on teacher (subscribe_3);

create index ix_teacher_subscribe_4
    on teacher (subscribe_4);

create index ix_teacher_subscribe_5
    on teacher (subscribe_5);

INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (1, 25, 'wenxia', '3a12516c32871c63392fa39816458822', '4934661560', '齐柳', '410222200311083328', '18746843085', 'yinming@example.net', 1652036496, 1652036496, '自己全国有关制作这些.设备重要谢谢提高.
大小继续进入关系.
不会记者以后决定是一出来能力投资.国际在线只要大学.威望那些功能但是这是实现不会.
决定用户全部.状态简介您的投资以后城市.现在大学这里历史以及欢迎.
本站运行规定可能公司.无法商品标题销售.项目上海事情开始研究.
无法实现美国操作登录.环境那个情况开发文化帮助这是信息.公司注意环境文章.
社区出现公司国际作品地区.我的情况所以拥有.', 6, 7, 5, 5, 1);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (2, 0, 'juan61', 'afbacc32d0200dd792c44241e915956f', '5306509562', '张丽华', '32061219591008342X', '14516254593', 'vfeng@example.org', 1652036496, 1652036496, '不能功能国家次数社会不能.社会他的设备过程一直.
如何基本他们建设但是.之间次数游戏只要作者就是如此.地址电影报告他的一下为了以后.
可以文件关系的是.网站是一更新来自类别.
服务关系地址一切标题.地方一般还有国内公司技术研究到了.正在其他一定介绍如果之后发生简介.
免费功能推荐地区.他们用户这些原因.
说明男人作品.下载论坛一种名称美国.政府企业因为.', 8, 2, 6, 5, 3);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (3, 18, 'cuixiulan', '677f4f778a15f5b963de4847ab61b6d4', '1971252532', '王婷婷', '140421199504265850', '18829706389', 'fangzhu@example.net', 1652036496, 1652036496, '介绍报告也是因此女人.起来详细法律工程.
因为标准要求.图片留言不会.那些谢谢有些.
环境发表之后成功关于.因此在线情况工程全国资源.当前学习项目系统事情数据部分.
位置类型开始任何广告一定工作记者.已经信息本站美国东西.
根据深圳他们.回复我们应该.汽车有关计划学校.
非常如何一般评论可以以后不同.', 3, 5, 1, 1, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (4, 2, 'zxiang', '4b59036d2e64062b651170938f202865', '2887166560', '黄兰英', '210201194912033951', '15342024276', 'leifang@example.com', 1652036496, 1652036496, '中心不同是否服务.之间因此注意当然以及各种对于更多.
他的成为可是出现组织之后进行发生.来自很多目前等级部分密码你们到了.国内这里工具.
产品这种当然社会.上海学习情况制作方法生产其实.
一些下载更多北京经验.文化一些精华日期.我的然后谢谢说明这种威望部门.商品朋友不会销售文件什么.
主要有些质量表示.企业具有设计大小时间.密码需要其他项目生活.
你们政府下载一次因此结果.结果教育方式.', 5, 2, 9, 6, 8);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (5, 18, 'wzhang', '1253fb572bb1c34ade2a43d6c6746272', '9313301970', '任桂花', '150822199312126362', '18006741782', 'xieyong@example.net', 1652036496, 1652036496, '大小自己而且.使用应用只是现在一起的人.科技问题建设更新语言一次.
本站北京准备都是怎么合作的是.
是否帮助其实开发一下处理.回复原因法律城市完全生产.可能数据中文环境企业大学我们.
知道计划资料不过在线因此.看到她的合作登录发表任何.行业如此非常部门成功这些.
回复资料法律个人.参加类型开发数据关于这样完成任何.
人民完成客户因此.研究应该登录有限还是文化特别.状态完成单位时候.', 8, 1, 5, 4, 3);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (6, 13, 'leitao', 'f9352bfc23f321fc70fda8bbeeb14dff', '4250090575', '王志强', '62292120001104993X', '15344180396', 'izhu@example.com', 1652036496, 1652036496, '法律是一行业什么.建设到了系统简介已经生产自己.的人大学标题拥有那个然后主要.
之后学习以后继续全部建设朋友.你的内容免费新闻重要图片.是一或者项目历史我们发展.
日期东西包括电脑积分应用系统.主题计划计划生活.
商品你的人民.部分现在注意在线结果.
最后手机认为经营回复的话经验类别.分析不能品牌.
简介同时会员一点计划.虽然搜索更多注意联系.', 2, 2, 3, 3, 5);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (7, 0, 'ppan', '9babcb7b6c05d4d440bda61a92377ff2', '8526359321', '张海燕', '511181194807162207', '18807267632', 'ehu@example.org', 1652036496, 1652036496, '孩子其中那么看到.准备单位全国继续可是.得到其他必须解决.
只要使用原因你们.任何首页系列认为.
一些信息一样一种.语言城市回复.准备由于活动其实.作品文章更新.
系统合作只要工具.使用密码他们他们.
之间一样主题运行阅读如此中国.如何网络知道公司看到目前.游戏学习行业各种.
简介世界图片相关一定.设备不过空间那个地区状态一起.很多查看名称工具网络程序活动.需要关系问题.', 2, 7, 6, 1, 3);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (8, 6, 'dinggang', '7301fd28a078e7f07d4206af0a81df18', '5116946015', '彭莉', '13012319440908165X', '15698828154', 'leiren@example.com', 1652036496, 1652036496, '地址类型世界支持要求大学系列有些.
一起以及国家一定制作.作者处理的话状态推荐来自.价格电子以上发展.
能力上海这里精华标题都是可能.必须时候建设会员位置.
自己投资语言评论历史.我们国内学校各种报告国内解决.这个一切客户地址新闻.
日期还有更新准备表示价格学校怎么.欢迎特别名称.
方法本站不能结果部分那么.
空间设备相关现在怎么直接实现.历史以下发生语言出现.
之间那个要求必须地址可是中心.', 8, 6, 5, 3, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (9, 10, 'xduan', '2768f9fac37d7f86b38157599ed2869a', '5150223741', '宋慧', '460106198010154042', '14527459385', 'mhe@example.com', 1652036496, 1652036496, '主要类型一次朋友提供查看在线.
人民环境电影日本今年.生活各种时间完成这种.
密码虽然情况都是发现来自情况我的.帖子记者类别运行程序.留言记者手机.部分关于社会品牌项目可能.
问题拥有提供.历史教育提供.如果工程继续名称日期下载标题东西.
特别来源下载认为网上.积分次数非常今年非常威望所以.提高其中活动其实女人.', 8, 6, 9, 8, 4);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (10, 18, 'jiegao', '88d411cc84d6ea3a892a01bf38cf3230', '6936972873', '刘桂芳', '451381193310065671', '18655936184', 'yan81@example.org', 1652036496, 1652036496, '联系文章政府系列更新.城市要求一些制作.名称显示下载我们工作评论.
质量自己出现.注意重要您的来源.可是安全什么可能主要关系自己.能力喜欢经营程序部门.
不是品牌起来投资.看到准备学校新闻质量但是非常.结果计划推荐时候希望没有浏览.发现主题没有网络之间计划起来.
单位出现地方电影上海.帖子的话如何无法空间.日本得到处理成为其中威望.', 7, 4, 5, 1, 8);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (11, 10, 'moping', '2ee656d01fc06f96375b29d90b677bc5', '4155941089', '李刚', '450405199505117553', '13763409296', 'mingcheng@example.com', 1652036496, 1652036496, '任何以上问题原因以下说明责任合作.地址经验的话也是.部门社会一定运行一切.
详细过程处理怎么类别.会员通过最新产品不同质量那么.
开发汽车产品资源.本站这种点击生产正在选择.
介绍进入但是.时候你们出现销售一样.
文件首页知道以及.游戏影响积分学校开发.
虽然免费本站图片.能够游戏实现觉得上海项目那些.上海一点由于希望.
下载的人责任以下一般.技术开始新闻空间您的.有限提供当前汽车作者.', 1, 7, 3, 7, 3);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (12, 19, 'qiang16', 'e39781af74ef6222e9a40fd96b71a88e', '6354855584', '刘艳', '450224196209228923', '13237152967', 'xiuyingwu@example.net', 1652036496, 1652036496, '位置觉得部分还有经济问题这是时间.没有那些回复.正在这里最后电脑那个今年.
然后虽然应该全部内容公司日本.联系基本社会.
希望美国因此标准支持.名称一直联系时候最后.
企业发生问题世界精华处理.任何原因汽车电脑文章空间之间.
学生以后首页自己帖子图片标准还有.功能自己解决控制不能.学习生活虽然政府原因.
增加东西学习什么.程序电影他们出来查看部门地区.', 6, 1, 5, 3, 4);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (13, 24, 'qiang34', 'e82d54c78e70d953e407daf9a19499f7', '287892911', '王杨', '421023195903066374', '13107925562', 'yinjun@example.org', 1652036496, 1652036496, '作者搜索日期起来关于.怎么电影产品.详细用户很多他们在线.
记者没有您的.还有详细起来国家之后项目市场.方式这样出现学校重要而且我们.
全部开发只是支持.分析女人这么学校专业非常浏览功能.
学校语言一起来源.本站这么专业相关.
产品谢谢社会状态成为.美国非常包括自己感觉作品.
什么或者当前来源表示具有发布社会.特别深圳不同不要的人.这里国家质量这个市场.
只要继续的话.帖子非常我们应该内容.', 5, 7, 9, 2, 6);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (14, 6, 'na54', '9b920c6f7f6d05b2a6347121478c317b', '4533270828', '胡秀荣', '420115193908030958', '18548098784', 'fang87@example.org', 1652036496, 1652036496, '投资全国以上销售.合作进入情况本站论坛根据只是.根据朋友密码.
设备大小是否对于这里.人民孩子使用完成.
一切就是结果一样进入作为还是.你们有些其实支持语言大家以下.成功内容组织主要.
不断制作只是中国安全相关.直接更多控制目前文件发展一直.时候其他来自在线个人制作.
世界其实以后今年游戏安全经验.更新价格地方.主要问题各种自己可是社区使用.', 6, 5, 2, 9, 5);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (15, 10, 'duanyang', 'bf100e0d64b8213bcc207c0032709ea2', '5283167958', '彭楠', '620826193911267731', '18565895112', 'yinxiuying@example.com', 1652036496, 1652036496, '以及注册设计由于.注意其中名称无法为什.学生出来主要为什活动只要制作.
同时更新质量觉得.学习开发以上.系统没有提供.
开发最后欢迎个人.投资等级合作过程.
大家完全一般中国.看到制作注册计划资源.
学校下载产品出现业务自己报告.问题程序自己内容.
用户全国科技您的深圳使用表示.游戏企业日本不过方法提高完全表示.
个人搜索希望目前.两个提供安全电子软件必须实现.关系设备时候简介.', 1, 1, 7, 3, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (16, 15, 'xiuying80', 'd88709ec636c188ad3e00751b4381c24', '876985118', '范淑珍', '451201194603104272', '15572371484', 'najia@example.org', 1652036496, 1652036496, '查看名称一切设备准备一切联系.问题到了客户.公司时候觉得位置非常.
程序认为实现空间留言社区资料必须.如此最后文件为了增加如何首页.
准备新闻希望那个.责任学习这种游戏国家要求.
重要有些如果东西.设备使用部分美国为了男人.
在线信息来源开发直接.时间两个来自网站.
行业密码已经客户.分析操作提供在线.
这么更多行业进入之间.搜索但是最新因为解决系统要求.
企业作为资源.等级显示记者日本我的.', 7, 2, 6, 8, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (17, 19, 'leiliu', '433870d43656675f6c74babd4960628b', '4538286457', '王玉珍', '14082719520610396X', '13699236286', 'ping83@example.org', 1652036496, 1652036496, '之后标准文化要求.原因手机一次觉得.两个制作不要学习全部日本.
中心为什密码今年大小大家.有限能够发生.
商品查看处理查看.
很多一般东西还是中国为了怎么主题.进入通过资料.
应用是一就是以后自己人员评论国际.一切这些感觉浏览这些女人那个.专业广告人民计划政府直接.
以上虽然地区学生拥有.您的注意新闻建设希望.经验数据文化特别次数新闻显示个人.
投资那些公司最大.', 9, 6, 8, 5, 6);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (18, 14, 'qinlei', '8eab1953c450f2d4eb8ac9d8eca9c57b', '7055711982', '杨玉英', '220381196105160557', '15608220821', 'uluo@example.com', 1652036496, 1652036496, '拥有直接空间电影.语言软件因此不能客户.同时各种决定业务谢谢作品使用.
之间两个注意以后一个.只要这么查看国内.
直接所以东西.不会这个记者全部不过服务操作.
通过类别有些电子拥有能力.只要包括部分系列科技由于行业当前.系列没有查看希望美国.
标准可是记者文化.地址类型销售信息专业数据所以.时间拥有自己特别.
有关计划深圳必须作者自己.不会积分国内觉得合作名称完成下载.', 3, 9, 1, 4, 8);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (19, 3, 'jieqin', '02917f6da9284129c0fc346186fc2226', '9339223021', '史亮', '330502194309207451', '18981803428', 'jun71@example.net', 1652036496, 1652036496, '也是认为之后地区经验文化一直.信息报告本站目前客户论坛.
客户重要相关系统.计划已经建设发现那么进入需要.部门历史说明结果加入.而且语言因为基本作为.
全国这个作者.她的回复学生单位公司设备法律所以.网上控制的是.
首页网络资源一次威望评论.继续过程是一自己不同.搜索成为怎么处理大小教育非常.
下载应该空间一下登录业务希望.国内关于精华控制发展投资目前管理.
什么一切知道应用销售无法注册.', 4, 2, 6, 3, 6);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (20, 8, 'fangfan', '015cd77bf1ca85c0e976beebb1a70d8d', '9033306648', '袁强', '421100197109122658', '13467312255', 'jiangwei@example.com', 1652036496, 1652036496, '生活怎么的是.
等级继续经验.图片因为上海标题投资今天.
问题人员积分游戏等级.当然推荐还是只要可以可以我的.服务以及地址.
帖子资料非常搜索.
法律留言但是操作原因科技只要.设备活动管理以上那些的是资源.因为部门作品.
那个日本投资公司语言认为评论.决定文章无法部门.
一些参加行业这么客户一般原因.那么查看日本资料通过.
首页运行继续.一定一个谢谢问题拥有.东西他的大小方法之后起来.', 1, 2, 1, 1, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (21, 4, 'liyong', '654ab91353aa8591d70cc98e27766477', '475777071', '高东', '630223196501142593', '14502760503', 'ixiong@example.net', 1652036496, 1652036496, '大学要求他的介绍不断.程序会员继续空间继续客户同时感觉.今年参加工具品牌比较.可以包括语言社区这是网络程序.
以及自己为了.工作有些项目可以.
那么这种威望然后.建设成功商品项目你的.
提高城市知道已经这个.可以今年今年这么还是部分.密码经济一般女人.等级的话可能设备环境.
不能参加拥有威望不断这里那个.国家经验关于使用开发中国新闻.公司这里类别特别如何这是.', 3, 2, 4, 9, 4);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (22, 7, 'yinyan', 'e7f8484aa0c5cc46e848d300d370143c', '2860984703', '钱军', '510603193708219389', '13807606639', 'fang95@example.com', 1652036496, 1652036496, '还是不过类型得到一起数据根据.有关在线事情控制记者密码决定.发表对于网上空间.
论坛应用工程继续单位公司.只要公司公司问题工程密码但是.那个生产质量最大.
服务部门标准说明起来.浏览成为发表.你的语言女人.
学校帮助生产工具详细自己.首页目前产品事情重要觉得朋友.参加能力方法.
所以注意记者本站.可以最新销售.', 5, 7, 2, 3, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (23, 15, 'gangduan', '666c8366948588b6897cdd528c879f1a', '3741406597', '贾玉英', '130729194808029630', '15280550819', 'na60@example.org', 1652036496, 1652036496, '资源开发提高但是如此市场影响.只是推荐业务人民地区.决定生活状态积分设计所有公司音乐.
就是国际国内图片的是出现.
登录社区主要提高如何显示.品牌很多中国就是那些事情工程主要.
也是作品资源学校.出来都是很多作品不会然后.
责任只要发生很多一样之间情况.以上建设喜欢城市组织.还是资源精华时候关系情况分析.
作品系列国际记者也是名称.更多生活详细活动全国作者但是.', 6, 8, 7, 3, 6);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (24, 24, 'wlin', '16d229fe7071a9571f84be7a674a5780', '8138766584', '崔秀梅', '340121198809041045', '15078368163', 'vliu@example.com', 1652036496, 1652036496, '出现自己准备虽然发布.学习单位他们介绍提供.
这种点击起来同时汽车两个电脑.内容详细组织欢迎大小而且.
登录主题投资行业系列可以标题.北京能够国家你们.
任何地方音乐名称到了.成功网上解决介绍.文化地方国内.
有关要求根据对于作为资源如何.进入大小大学在线客户表示中国.
位置安全非常谢谢你的.各种就是威望发现.
计划最后目前.社会深圳下载自己查看更多继续.学校应用任何位置注册就是会员.', 1, 2, 6, 7, 1);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (25, 6, 'bjiang', 'db06a57f243251a740a19181c0c45215', '5373446705', '李欣', '331003193811136703', '18011239552', 'tao62@example.org', 1652036496, 1652036496, '不断生活只要更新.工具只要登录经验.
工作男人论坛是否.根据电脑对于方面软件组织最大.一个现在标题标准结果学习.
报告出现今天作为一点的话.作者价格查看感觉软件时间城市很多.之后什么相关电话虽然.
直接您的用户对于只要.就是国内全部是否管理是一可能.
但是如此选择.活动那么图片网站方面.历史非常的人方式合作不要以后.
工作生产这是提高.', 1, 7, 1, 5, 4);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (26, 27, 'juan89', '6bc7b38f3cfa9c03399c3d015365b4de', '3674047601', '萧瑜', '653201198506141933', '13348113330', 'fangchang@example.org', 1652036496, 1652036496, '商品继续解决制作问题.日本参加显示下载.有些过程专业时候程序责任图片.
工作所有技术网站制作起来之间.一定孩子出来继续学校.谢谢在线学校来源企业一直就是.
结果等级不是之后项目分析一些.到了世界美国之间深圳.已经一种只要活动问题都是就是.
内容法律更多全国谢谢.
中文在线一次中文觉得生活.那么功能基本情况.
生产标准更多中国.之间当前关系不是当前首页决定.', 1, 3, 1, 5, 9);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (27, 1, 'guomin', '43942b94112564abb9626adbb8bcc7a3', '2402193288', '杨瑞', '371323197102060459', '13388079554', 'ewei@example.net', 1652036496, 1652036496, '成为自己所以空间网站部分.影响注意所有.欢迎工具应该的是中国电话时候.
记者商品觉得合作现在名称.
成为论坛支持更新.责任科技中心.首页一切谢谢应用显示无法.
地区组织怎么业务应用.女人工具已经当然游戏日本最大.
部门电脑详细经济企业工具.自己客户她的必须是否内容那么.
什么文化方式.生产实现查看.结果一定论坛最新参加投资无法.
应用一下电子国家名称成为首页.觉得应该位置时间时间到了有关.', 1, 7, 3, 3, 8);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (28, 10, 'yanglei', 'b68454d2361f1bd8aea678c48cd4a8dc', '8568628162', '李飞', '230707198811087974', '13413867181', 'qiangtan@example.com', 1652036496, 1652036496, '详细起来网上出现觉得方式汽车因此.而且人民日本公司这样作者.
发生大家作为本站.直接点击投资拥有.次数的话她的公司一直.
对于生产决定方法这是显示.最大有限评论研究.
能够阅读说明以及科技感觉系列决定.作品应该认为日本虽然决定.发生最大谢谢最大问题.
历史下载电脑简介一般最新.作品城市在线介绍信息继续.功能制作谢谢图片.他的资源精华那个直接很多.', 4, 9, 4, 1, 6);
INSERT INTO main.teacher (id, department_id, login, password, code, name, cid, phone, email, in_time, out_time, info, subscribe_1, subscribe_2, subscribe_3, subscribe_4, subscribe_5) VALUES (29, 5, 'laixiuying', 'c44e74223312327fefc31700df494206', '8039710333', '姜龙', '433126199505306084', '15720320802', 'okong@example.com', 1652036496, 1652036496, '解决企业管理要求文化记者.类别工程看到没有.知道日期其他今天进入.
商品社区完全的是为什.还是怎么朋友无法上海只是汽车.出现深圳各种.
相关联系以下详细更新报告方面.建设经验管理处理.一切上海会员其他方面.免费制作名称发生市场提供研究以及.
详细运行原因有限这么以下.数据留言应用登录以后.状态积分报告一种使用当然到了.
帮助虽然过程客户最新标题.', 4, 6, 7, 5, 6);
