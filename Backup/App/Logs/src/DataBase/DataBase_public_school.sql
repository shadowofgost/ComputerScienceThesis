create table school
(
    id            integer       default nextval('school_id_seq'::regclass) not null
        primary key,
    name          varchar(200)  default NULL::character varying,
    area_id       integer
        constraint school_ibfk_2
            references area
            on update cascade
            deferrable initially deferred,
    teachdesc     varchar(4000) default NULL::character varying,
    address       varchar(200)  default NULL::character varying,
    schooltype_id integer
        constraint school_ibfk_1
            references schooltype
            on update cascade
            deferrable initially deferred,
    website       varchar(200)  default NULL::character varying,
    leisure       varchar(2000) default NULL::character varying,
    threashold    varchar(2000) default NULL::character varying,
    partner       varchar(200)  default NULL::character varying,
    artsource     varchar(2000) default NULL::character varying,
    feedesc       varchar(200)  default NULL::character varying,
    distinguish   varchar(2000) default NULL::character varying,
    longitude     real,
    latitude      real,
    feature_id    integer
        constraint school_ibfk_3
            references feature
            on update cascade
            deferrable initially deferred
);

alter table school
    owner to postgres;

create index school_area_id_idx
    on school (area_id);

create index school_feature_id_idx
    on school (feature_id);

create index school_schooltype_id_idx
    on school (schooltype_id);

INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (14, '上海市黄浦区卢湾区中心小学', 3, '校长姓名：陈瑾
教职工119人，其中教师104人，高、中级职称教师占在岗教师的57.1%，大专及以上学历的教师占86.7%，大本占15.3%，区命名的校级以上骨干教师占38.8%，其中区学科带头人一名，区青年学科带头人2名，区级骨干教师13人。', '茂名南路175号/皋兰路20号', 2, 'http://www2.ezx.lwwdu.sh.cn/', '我以青春铸党旗、读《中国反贪调查》有感、时刻敲响安全警钟、走进书法天地、增加阅读兴趣、体验读书快乐、增加阅读兴趣、体验读书快乐。', '茂名、香山、思南、水嘉、瑞雪、建德', '上海市启秀实验中学', '', '公费', '', 121.46891, 31.220451, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (15, '上海市黄浦区回民小学', 3, '校长姓名：倪玉琴
专职教师42人', '聚奎街50号', 2, '', '新艺队', '龙潭、光启、四新', '', '', '公费', '', 121.50323, 31.229692, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (16, '上海市黄浦区卢湾—中心小学', 3, '校长姓名：程华
中学高级教师3人，小学高级教师75人，占教师总数61.4%，从教师学历层次看：进修研究生课程的有1人；大专本科学历（含在读）共有25人；35岁以下青年教师全部达到大专学历', '淡水路450号', 2, 'http://www.yzx.lwedu.sh.cn/', '尊敬长辈 微笑重阳、加强安全意识 做到未雨绸缪、我爱我校 创意无限、家校携手行 幸福暖人心。', '建二、建四、建五、建六、复三、顺六、建三', '兴业中学', '', '公费', '', 121.48055, 31.217865, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (17, '上海市实验小学', 3, '校长姓名：杨荣
现有120多名教职工，400多名退休教师。其中现职中学高级教师12名，先后有7名教师列入全国、上海市的名师培养对象。', '人民路706号', 2, 'http://shy.hpe.cn', '真爱生命，消防安全、迷梦，助梦，圆梦、漂流角，倡文明、学分享、绿色军营 难忘之旅。', '露香、大境、淮海、阜春、长生、同庆', '上海市敬业初级中学', '', '公费', '', 121.49179, 31.234146, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (21, '上海市实验小学', 3, '校长姓名：杨荣
现有120多名教职工，400多名退休教师。其中现职中学高级教师12名，先后有7名教师列入全国、上海市的名师培养对象。', '人民路706号', 2, 'http://shy.hpe.cn', '真爱生命，消防安全、迷梦，助梦，圆梦、漂流角，倡文明、学分享、绿色军营 难忘之旅。', '露香、大境、淮海、阜春、长生、同庆', '上海市敬业初级中学', '', '公费', '', 121.4879, 31.249163, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (18, '上海市北京东路小学', 3, '"校长姓名：张烨 
特级教师、市区级骨干教师十多人，小内有首席教师3人，学科带头人6人，具有小学高级教师职称的占一线教师总数的80%，在职45岁以下教师大专及大专以上学历达到100%。"', '北京东路261号', 2, 'http://bj.hpe.sh.cn/', '敢于梦想，敢于追梦、在中华历史文化中遨游、大作家与小读者见面会，小荷才露尖尖角，有朝一日定绽放、泳池戏水忙，家长乐开怀', '无锡、虎丘、北京、中北、龙泉、牛庄、云中、厦门、贵州', '上海市浦光中学', '', '公费', '', 121.4914, 31.246141, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (22, '上海市北京东路小学', 3, '校长姓名：张烨 
特级教师、市区级骨干教师十多人，小内有首席教师3人，学科带头人6人，具有小学高级教师职称的占一线教师总数的80%，在职45岁以下教师大专及大专以上学历达到100%。', '北京东路261号', 2, 'http://bj.hpe.sh.cn/', '敢于梦想，敢于追梦、在中华历史文化中遨游、大作家与小读者见面会，小荷才露尖尖角，有朝一日定绽放、泳池戏水忙，家长乐开怀', '无锡、虎丘、北京、中北、龙泉、牛庄、云中、厦门、贵州', '上海市浦光中学', '', '公费', '', 121.4914, 31.24615, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (20, '上海市黄浦区重庆北路小学', 3, '学校拥有一批素质好、能力强、业务精、善思考、肯奉献的教师，其中中学高级教师3人，小学高级教师28人，区、校级骨干教师6人，中国共产党员7人。', '大沽路262号', 2, 'http://chongb.hpe.cn/', '墨香溢校园、在创造的道路上前行', '均乐、振兴、江阴、顺天村', '上海市储能中学', '', '公费', '', 121.47566, 31.231981, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (19, '上海市黄浦区卢湾三中心小学', 3, '教师队伍，100%大专学历，本科学历64.4%，研究生5%，70%以上的教师具有中、高级职称。', '嵩山路69号', 2, 'http://www.szx.lwedu.sh.cn/', '习惯第一 轻松过关、我眼中的幸福家庭、改善学习方式、以互助促共同进步、科学思维方式在自然学科中扎根', '浏河、新华、大华、志成、星平、景安、瑞华', '比乐中学', '', '公费', '', 121.48221, 31.229105, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (23, '上海市黄浦区四川南路小学', 3, '"校长姓名：楼丽霞
学校教职员工共74人，其中小学高级教师37人，占总人数的50%，小学一级教师27人，占36%，小学二级教师2人，占3%，还有7人为职员及工勤人员。"', '四川南路36号', 2, 'http://sinan.hpe.cn/', '让环保走进我们的生活、我与淘宝手牵手，快乐阅读齐分享、我们在快乐地前行', '永胜、盛泽、中山、宝兴、永安、云南、福南、金陵、汉口', '', '', '公费', '', 121.49726, 31.236504, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (24, '上海师范专科学校附属小学', 3, '"校长姓名：韩新文
学校有一支年富力强的教师，在职教师平均年龄34岁，硕士学历6.7%，本科学历70.1%，高级职称占3.3%，中级职称占67.3%。目前教师队伍中区青年学科带头人、区骨干教师占15%、校级骨干教师13%。优秀的教师队伍增强了学校可持续发展的综合实力。2006年学年度，学校共有30名教师参加各级各类教育、教学比赛获奖，占教师总比54%。"', '局门路478号', 2, 'http://www.szfx.lwedu.sh.cn/MPS/Default.aspx', '沐科普阳光 启科技梦想、创意画单词，创意吴极限、排球之星，明日之光、“考场”成舞台“学生”变主角、切磋球艺、展现自我', '丽园、桑城、中二、桥一、桥二', '', '', '公费', '', 121.488846, 31.208002, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (25, '上海市黄浦区蓬莱路第二小学', 3, '校长姓名：季萍
学校在编在岗教师82名，其中中学高级7名，市级名师培养对象3名，区学科带头人2名，区骨干教师4名。', '蓬莱路225号', 2, 'http://www.xxpengl.com.cn/', '故事情境中学语文 学习准备期多欢乐、暑假足球夏令营、蓬二学生绘制团扇送清凉、“伴我聪慧成长”演讲比赛，开展“邮递明信片·分享幸福行”活动', '文庙、净土、小桃园、艾家弄', '上海市第十中学', '', '公费', '', 121.496666, 31.223457, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (27, '上海市黄浦区新凌小学', 3, '在岗教师58人，其中小学高级教师46人，青年教师占教师总数的72.41%，青年教师44.2%获得大专学历，30.2%获得大本学历，23.3%教师大本在读。学校有6位教师是区学科中心组成员，区骨干教师1位。', '西凌家宅路90弄33号', 2, 'http://xinling.cn.class.uschoolnet.com/', '雏鹰在飞翔、荣誉之花', '黄浦新苑、民立、保屯、瞿二、瞿四、制造、徽宁、三门、西一、西二、西三', '', '', '公费', '', 121.49313, 31.210318, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (28, '上海黄浦区裘锦实验学校', 3, '校长姓名：沈位冈
在校任职的教师100%达到大专以上学历，历届被推荐评选为区学科带头和市区级骨干教师10名；参加区名师工作室学习培训7人；近两年20余名教师荣获全国、市、区先进荣誉称号：15名教师荣获课堂教育教学评比一、二、三等奖。', '新桥路55号', 2, 'http://www.qjq.hpe.cn/', '探寻奇妙“海”世界，绿色天使秋游行、老少重阳，别样对日、零起点研讨，全方位实践、参观四大会址，铭记党的历史', '新桥、三德、承兴、福海、福瑞', '', '', '公费', '', 121.472084, 31.245897, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (13, '上海市黄浦区徽宁路第三小学', 3, '校长姓名：朱惠芳
在岗教职工100余名。', '徽宁路216号', 2, 'http://huining.hpe.cn/', '“活力徽三凝聚欢乐”第三届师生运动会、丰富业余生活提高艺术修养。在春游活动中培养爱国情怀、徜徉艺术的殿堂，启迪艺术素养', '明日星城、陆迎、中福一、中福二、海西、车中、新村、益元、迎助、普益', '上海市市南中学', '', '公费', '', 121.49919, 31.217, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (29, '上外·黄浦外国语小学', 3, '在发展外语特色的进程中，学校不断优化师资，引进人才。逐步建构起一支理念新，素质高，专业精神的教师队伍。其中本科学历及在读本科的教师占一线教师总人数的80%。', '半淞园路609号', 2, 'hettp://flps.hpe.sh.cn', '小小农家了之冬瓜、南瓜大丰收、幸福耕耘 梦想成真、观看木偶剧，感受传统文化、学习西餐礼仪，体验西餐文化、人人参与 玩转篮球', '高雄、市民、耀江花园', '', '', '公费', '', 121.500465, 31.205254, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (30, '上海市黄浦区卢湾海华小学', 3, '校教职工共57人，其中有多名区青年学科带头人及骨干教师，中高级及高级教师占全校74%，在历年全国、市区等教学比赛中，一批中青年教师脱颖而出，获一、二、三等奖。', '瑞金南路85号', 2, 'http://www.haihua.lwedu.sh.cn/', '生命科技节、阳光英语节、活力体育节、成长读书节、多彩艺术节', '大同、锦海、南塘、瑞楠、斜土、打浦、海悦', '卢湾中学', '', '公费', '', 106.72283, 26.571074, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (31, '上海市黄浦区巨鹿路第一小学', 3, '校长姓名：楼海凤
教师学历96%大专学历，65%本科学历。中学高级教师12%，区级以上骨干教师数36%，校级以上骨干占教师数60%。', '南昌路366号', 2, 'http://www.jy.lwedu.sh.cn/newsite', '英语节、走进经典，感受艺术之美、阳光 体育，健康成长、垃圾分类大家说', '南昌、延中、巨鹿、锦江
', '', '', '公费', '', 121.466736, 31.22166, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (32, '上海市黄浦区瞿溪路小学', 3, '学校现有在编教职工50名，在岗教职工38人，其中中学高级教师1人，占教书数2.7%，小学高级27人，占教师数73%，大学学历27人，占73%。', '瞿溪路1117号', 2, 'http://www.quxi.lwedu.sh.cn/', '“唱响新童谣，快乐伴我行”八荣八耻特别行动；“六心”小天带着微笑送出礼仪之花、“文明交通在我脚下”倡议书、“新春爱心行动”红领巾“手拉手”结对互助送温暖、“一份小礼物、一颗大爱心”“六一”大型义卖筹款、“送上一颗爱心”慰问孤老活动、红领巾文明寻访团活动“发现靓丽卢湾”小小摄像师活动、“中国人过中国节”民族活动、“骄傲啊，中国人”读书活动', '瞿西、瞿中、瞿南
', '卢湾区教师进修学院附属中山学校', '', '公费', '', 121.47999, 31.204815, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (26, '上海市黄浦区七色花小学', 3, '学校注重打造一支具有较高师德修养与专业素养的复合型教师队伍。其中100%的教师具有大专及大学本科学历，校级、区级骨干教师占30%，上海市名师培养工程教师1名。学校有多位教师在全国、市、区各类教育教学比赛中获得殊荣。', '雁荡路56弄46号', 2, 'http://www.qsh.lwedu.sh.cn/', '艺术节、科技节、英语奥斯卡、七彩舞台、“小小地球村”艺术人文展示活动、为支援贫困地区的义演义卖活动、亲子迎新运动会', '雁荡、长乐、淮中、瑞成', '', '', '公费', '', 121.47575, 31.226109, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (33, '上海黄浦区瑞金二路小学', 3, '"校长姓名：王平
30多名教职员工，其中小学高级教师16名，一级教师13名，区骨干教师2名，校骨干教师4名"
', '瑞金二路215号', 2, 'http://www.ruier.lwedu.sh.cn/', '单词接龙比比看，英语学习真有趣、啄木鸟在行动、阳光体育，文武并行、人人都是小画家、灌篮高手
', '建中、泰康、陕建、肇东
', '', '', '公费', '', 121.47335, 31.214321, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (38, '上海市长宁区北三幼儿园', 6, '园长：朱芸             具有一批经验丰富、教学理念先进的骨干教师，全园教师本科及大专毕业达100%，形成了以教学经验丰富的高素质、高学历、充满活力的教师队伍', '上海市长宁区新泾一村135号', 1, 'http://3101050168.age06.com/310105/527/', '课余活动室', '"1.天山路:88弄                        2.长宁路:3229弄   
3.哈密路:100弄                       4.蒲淞北路                          5.天山西路:80弄、350弄  
6.北大街:31弄                       7.北渔路:28弄                        8.金钟路:255弄、340弄
9.新泾一村                           10.剑河路:60弄、200-260号             11.平塘路:222弄   
12.北翟路:75弄、105弄、163弄        13.清池路:110弄"	', '', '', '幼管费：175元/月                        伙食费：9元/人/天               点心费：4元/人/天', '', 121.37607, 31.223337, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (36, '上海市黄浦区复兴东路第三小学', 3, '校长：胡爱珠
全校共有教职员工67名，其中管理人员3名，教师62名，工人2名。他们都在各自的教育、教学领域中发挥着不小的作用，67名教职员工中，硕士研究生1名，占教职员工的1%，本科学历39名，占教职员工的58%，大专学历22名，占教职员工的33%,中专及以下学历5名，占教职员工的8%。40岁以下教师56名，占全校教职工84%，高级职称3名，中级职称41名，初级职称23名，全校教职员工中，区级骨干教师2名，校级骨干教师6名，约有82%获区级以上荣誉称号，论文在区级以上杂志发表，或在课堂教学评比中获区级以上等地奖。', '复兴东路949号（复兴东路庄家街）', 2, 'http://www.fxdl.hpe.cn/', '校徽设计我做主，一起来跑步章，让幸福诗情画意，到手牵小手，绿从心开始，主任为乐小雷锋', '肇方、会稽、泰瑞、方西、太阳都市', '李惠利中学', '', '公费', '', 121.49358, 31.226519, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (45, '上海市长宁区哈密路幼儿园', 4, '园长：孙宝娣           在编教职工35名，另有1名派遣制教师、4名派遣制保育员、11名临时工，分别担任保育员、营养员、夜班门卫等职;以及保安公司委派的保安人员4名，共计51人。', '哈密路2016、2024号/迎宾三路128号', 1, 'http://3101050174.age06.com/310105/530/', '幼管费：225元/月；外籍：1300月/月；伙食费：9元/人/天；点心费：4元/人/天', '总园： 
1.龙溪路:1-219 号
2.虹桥路:2121-2419 号
3.程桥一村、程桥二村
4.程家桥路:1-150 号
5.虹井路:800-1000 号
6.剑河路:2001 弄
7.哈密路（单）:1713-2079 号 哈密路（双）:1800-2054 号 
机场分园: 
1.机场新村、上航新村
2.沪青平公路:18 弄
3.虹桥路:2538 弄 ', '', '', '', '', 121.3767, 31.19724, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (44, '上海市长宁区威宁路幼儿园', 6, '园长：刘颖                  幼儿园共有教职工22名，其中教师15人，大专学历100%，本科学历9人，占60%，高级教师9名，占60%。', '茅台路715弄18号', 1, 'http://3101050173.age06.com/310105/529/', '大班中日幼儿混班户外活动  经常性运动活动  ', '1.茅台路:575-830弄
2.安龙路:698-960弄
3.仙霞路(单号):577-737弄
4.威宁路:276弄、358弄
5.新渔东路:200号、289-358弄
6.水城路(单号):445-511弄的适龄儿童', '', '', '幼管费：175元/月；外籍：1300月/月；伙食费：9元/人/天；点心费：4元/人/天', '', 121.39237, 31.214739, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (46, '上海市长宁区新实验幼儿园', 6, '园长：周剑', '双流路380号', 1, 'http://3101050305.age06.com/310105/14972/', '', '电脑派位
登记范围：
幼儿户籍在威宁路511弄、天山路202弄的适龄儿童', '', '', '幼管费：175元/月；伙食费：9元/人/天；点心费：4元/人/天', '', 121.38778, 31.22438, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (37, '上海市长宁区仙一幼儿园', 6, '园长：金莹             教职工人数36人，园长1名，保教主任1名，教师25名，其他教职工5人，除回聘后勤外，其他学历都已大专以上，13名教师已获本科学历，其他5位教师本科在读。青年教师占教师55%，中年教师占45%，幼儿高级教师13名', '上海市长宁区仙霞路435弄7号', 1, 'http://3101050163.age06.com/310105/522/', '03早教活动                 经常性开放活动              民族文化的艺术活动', '"1.仙霞路：410弄—500弄                        2.茅台路：455弄
3.芙蓉江路：62弄—150弄 （双弄）     4.水城路：90号—500弄（双号、弄）
5.虹古路：208弄、270弄
6.荣华居委一期：①伦敦广场（古北路1000号）；   ②马赛花园（荣华东道79、80、102弄）；
③巴黎花园、巴黎经典（荣华东道119弄）；            ④维也纳花园（荣华东道106、108、110、112号）；
⑤维多利亚大厦（荣华东道96、98、116、128号）；                           ⑥88大厦（荣华东道88号）
7.荣华居委三期：                     ①古北新苑（古北路1398弄）；         ②黄金豪园（黄金城道770、777号）；
③四季晶园（水城南路16弄）；         ④罗马花园（荣华东道8弄）；
⑤鹿特丹花园（荣华东道19弄）；       ⑥里昂花园（荣华东道59、60弄）；
⑦雅典花园（荣华东道46、48、50号）"	', '', '', '幼管费：225元/月     外籍：1300月/月          伙食费：9元/人/天               点心费：4元/人/天', '', 121.4, 31.21, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (39, '上海市长宁区实验幼儿园', 6, '"园长：周剑
常务副园长兼长宁实验幼儿园联合党支部书记：郑慧敏
副园长兼副书记：张建红
副园长：奚珏
工会主席：杨蓓蕾
园长助理：刘燕琳        幼儿园围绕课程改革和创新开展了一系列的教育科研，孵化出一支优秀的教师团队，在课程的研究与开发方面有着自己独特的见解。曾连续两次被评为上海市教育科研先进集体。“幼儿园活动区教育模式的研究”、“幼儿园互动式主题活动的理性思考与实践探索”、“2—3婴幼儿情境化活动环境的实践与研究”等课题均在市级教育科研成果评比中获等第奖，其研究成果汇编成《活动区活动教师手册》和《嫣红姹紫开遍­——幼儿园综合性主题教育新创版》出版"', '上海市长宁区云雾山路135号', 1, 'http://cnsyyey.age06.com/310105/67/', '', '电脑派位', '实验小学', '', '幼管费：700元/月     外籍：1300月/月          伙食费：9元/人/天               点心费：4元/人/天', '', 121.41, 31.22, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (48, '上海市长宁区武夷路幼儿园', 6, '园长：张洁', '武夷路95弄19号', 1, 'http://3101050147.age06.com/310105/507/', '', '1.  延安西路(单号):485-1395号；延安西路(双号):902-1146号、1350号                     
2. 江苏路(单号):507-835号；江苏路(双号):470-878号 
3. 武夷路:17-373号
4. 利西路:2-307号
5. 昭化路:12-357号
6. 昭化东路:52-209号              
7. 宣化路(单号):1-317号
8. 定西路(双号):906-1328号  
9. 曹家堰路、张家宅、西诸安浜路
10.华山路:800-1136弄
11.安西路:397-676号
12.安化路:1-360号
13.镇宁路(单号):9-99号', '', '', '幼管费：175元/月；伙食费：9元/人/天；点心费：4元/人/天', '', 121.435776, 31.220667, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (42, '上海市黄浦区报童小学', 3, '校长：余敏
学校已拥有一流的师资力量，教师学历都达到大专以上，中学高级教师、区学科带头人、小学高级教师占92%。', '山西南路35号', 2, 'http://baotong.hpe.cn/info/frame_index.asp?info_class_id=182&height=600&width=800', '', '新建、山西、昭通、北海、瑞福、小花园、平望', '上海市应昌期围棋学校', '', '公费', '', 121.489746, 31.240791, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (49, '上海黄浦区曹光彪小学', 3, '校长姓名：金建中
在编教职工86名，其中教师79名，91%的教师具有大专以上的学历，80%的教师具有中、高级专业技术职称。', '长沙路1号（长沙路牯岭路）', 2, 'http://cgb.hpe.cn', '阳光、微笑、成长、彩虹桥、学科学、动手玩 全家一起“秀”、让童年更有意义、放慢戒指重习惯 扎实起步教书写', '长江、定兴、新昌', '格致初中', '', '公费', '', 121.479, 31.241604, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (41, '上海市长宁区北二幼儿园', 6, '园长：杨剑华', '上海市长宁区新泾三村45号', 1, 'http://3101050167.age06.com/310105/526/', '“我阅读我快乐”故事会活动03早教活动', '"1.新泾二村；2.新泾三村；3.北渔路:82弄、115-135弄 ；4.北虹路:1-1185号；5.哈密路:273号、277号、398弄、342号、482弄；6.剑河路（双）:404-414弄    泉口路128弄；7.天山西路（单）:1-95号     天山西路:199-211弄"	
', '', '', '幼管费：225元/；外籍：1300月/月；伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.38, 31.22, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (43, '上海市长宁区基金会幼儿园', 6, '园长：许梅；全园在编教职工49名，其中专任教师38人，幼儿园高级教师18人，占教师总数的47.4%，一级教师20人，占教师总数的52.6%；教师中硕士研究生1人、本科生33人、大专生4人（2人在读本科），大专学历达标率为100%。幼儿园设园长1人，党支部书记（兼副园长）1人，其中1人中学高级职称。幼儿园还配备了专职保健老师4人，营养员2人，保育员3人，出纳、财产保管员各1人。
', '上海市长宁区松江路685弄3号', 1, 'http://3101050178.age06.com/310105/534/', '美术节微标评选活动
', '"1.淞虹路:650弄、685弄；2.甘溪路:368弄； 3.泉口路:225弄 ；4.协和路:68弄；5.福泉路:255弄、385弄、435弄、495弄；6.仙霞西路:700弄、715弄、885弄、888弄"	
', '', '', '幼管费：225元/月；外籍：1300月/月；伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.39, 31.21, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (47, '上海市长宁区贝尔幼稚园', 6, '', '上海市长宁区虹桥路2192号', 1, 'http://www.beyzy.com/', '“爱心义卖”活动；教研活动；亲子活动； 双语活动
', '全年招生。1.5-6岁的中、外籍小朋友（不限户籍，国籍，随时入园）	
', '', '', '双语班：4200元/月/人  国标班：6000元/月/人    伙食费：9元/月/人      点心费：4元/月/人     校车接送：600元/月/人   半日班（中籍）：2100元/月/人                半日班（外籍）：3000元/月/人', '', 121.39, 31.2, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (40, '上海市长宁区紫一幼儿园', 6, '园长：陶晓艳           教职工26名。
幼儿园有一支经验丰富的教职工队伍。100℅的教师具有大专学历，高级职称的老师占90℅', '上海市长宁区娄山关路462号', 1, 'http://3101050152.age06.com/310105/512/', '', '1.天山二村:1-150号                  2.天山路(单):751-989号
3.娄山关路:425-480弄                4.仙霞路:133-297弄
5.紫云西路:28弄、50弄、89弄          6.茅台路:200弄1-17号
7.古北路:439-503号、555弄、585弄   8.兴义路:48号、85-99号
9.万山路:1-60号                     10.云雾山路
11.遵义路(单):429-585号          
12.玉屏南路(单):309号、329号、345-499弄
玉屏南路(双):340-490弄', '', '', '幼管费：175元/月                        伙食费：9元/人/天               点心费：4元/人/天', '', 121.41, 31.21, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (51, '上海市长宁区愚园路第一幼儿园(遵义路分园)', 4, '园长：高雯彬            拥有一支专业素养较高、充满朝气的教师队伍，他们在教学上敢于突破创新，致力于教育叙事的研究，部分青年教师已经脱颖而出，先后在近几年的“长教杯”、“希望杯”、“育英杯”、“黄浦杯”、“创新运用大擂台”等比赛中屡屡获奖。', '遵义路800弄28号', 1, 'http://3101050096.age06.com/310105/457/', '', '1.长宁路:1488-1898 弄、1447-1661 弄
2.遵义路:757 弄、797 弄、800 弄、820 号
3.中山西路:340-380 号 
4.娄山关路:999 弄
5.万航渡路:2505 弄 万航渡路（双）:2486-2590 号 ', '', '', '幼管费：175元/月；外籍：1300月/月；伙食费：9元/人/天；点心费：4元/人/天', '', 121.41627, 31.222065, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (53, '上海市黄浦区梅溪小学', 3, '校长姓名：吴建国
教职工55名，其中小学高级教师15人。', '永宁街20号', 2, 'http://www.meixi.hpe.cn/', '浦江游、伙伴情、放飞蝴蝶，放飞心愿、学先烈，祭英雄，促成长、为爱找一个支点。', '大兴、乔家栅、小西门、龙门村、牌楼、陆兴、曹家街、学宫、也是园', '', '', '公费', '', 121.49577, 31.221401, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (54, '上海市黄浦区光明小学', 3, '光明小学师资力量强，教师学历100%合格（大专、大本学历达到85%），小学高级教师达90%，一批充满活力，具有奉献、创新精神的中青年教师活跃在教学第一线。', '傅家街40号（傅家街盛家街）', 2, 'http://gmxx.hpe.cn/', '搞脑子，金点子，拿牌子、“小小航天迷”遇上“飞天大英雄”', '果育、侯家、丹马、学院、广福、宝带、古城', '', '', '公费', '', 121.500084, 31.229399, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (55, '上海市黄浦区董家渡路第二小学', 3, '在职教师59人，其中29人获小学高级职称，11人已达到学本科、大专学历26人正在攻读大专学历，师资质量稳步上升。', '西姚家弄48号', 2, 'http://school.ci123.com/firms/84552/infos-show', '', '中华、西姚', '尚文中学', '', '公费', '', 121.50293, 31.22834, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (56, '上海市黄浦区淮海中路小学', 3, '校长姓名：张敏', '淡水路93号（近太仓路）', 2, 'http://www.huaixiao.lwedu.sh.cn/', '我是安全小护士、我设计、我创造、我快乐、学中华古诗文，做文明号少年和小树一起成长', '孝和、西成、瑞兴、新天地', '', '', '公费', '', 121.47921, 31.22699, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (52, '上海市黄浦区第一中心小学', 3, '校长姓名：张烨
学校专职老师人数73人，其中中级以上老师比例79%，现有中学教师7人，区学科带头人以及区、校级骨干教师16人，中国共产党党员22人。', '董家渡路165号（近白渡路）', 2, 'http://yzx.hpe.sh.cn/', '体育类 科技类 艺术类 游戏足间，晨间飞扬、快乐暑假DV游、童心向党、书香满校园、奇妙深海之旅、同心向领巾', '白渡、新码、多稼、阳光、桑园、王码、万裕', '上海市储能中学', '', '公费', '', 121.51, 31.23, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (57, '上海市长宁区金钟路幼儿园', 6, '园长：毕一军', '上海市长宁区金钟路333弄87号（近福泉路）', 1, 'http://3101050176.age06.com/310105/532/', '经常性展开室内运动研讨活动', '1.天山西路:450弄；2.金钟路:333弄、428弄；3.平塘路:100弄、155弄、165弄、175弄、185弄；4.淞虹路:128弄；5.西淘浜路:28弄；6.北翟路:980弄；7.双泾村、努力村、北翟地区（剑河路以西）；8.清池路:102号、200弄；', '', '', '幼管费：175元/月；外籍：1300月/月；伙食费：9元/人/天 ；点心费：4元/人/天；', '', 121.369286, 31.224998, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (35, '上海市长宁区古一幼儿园', 6, '园长：王玉琴  ；拥有一支以青年为主的教师队伍，教师100%达到大专学历，其中75%的教师达到大学本科学历。
', '上海市长宁区天山路700弄4号', 1, 'http://3101050162.age06.com/310105/521/', '', '"1.芙蓉江路:177 弄、555 弄；2.锦屏路 ；3.古北路（单）:69-373 弄 ；4.古北路:108弄、124 号、136 弄 古北路（双）:368-452 号；5.天山四村；6.天山五村:1-147 号；7.茅台路（双）:216-382 号 ；8. 天山支路 ； 9. 天山路:651-681 号、600-680 弄 天山路；（双）：700-938 弄；10.玉屏南路（单）:505-731 弄 玉屏南路（双）:496-560 弄 ；11.娄山关路（单）:815-969 弄 娄山关路（双）:758-888 号 "	
', '', '', '幼管费：175元/月 ； 伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.41, 31.22, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (58, '上海市长宁区南新幼儿园', 6, '园长：李玲君', '上海市长宁区新渔东路630号', 1, 'http://3101050181.age06.com/310105/536/', '南新幼儿园课题组活动；03早教活动（03散居儿童早教指导宣传活动、03双休日亲子班活动、03贝贝班活动、入托体验活动）；主题活动、数活动、艺术活动、生活体验活动、等）', '1.天山路:177 弄、198 号、209 弄、288 弄；2.双流路:54 弄、188 弄；3.威宁路:291 弄、339 弄；4.新渔东路:455 弄、456 弄、550 弄；5.青溪路:555 弄、601 弄；6.仙霞路:1118 弄、1225 弄、1316 弄、1388 弄；7.淮阴路:575 弄、599 弄；8.茅台路:900 弄；', '', '', '幼管费：225元/月；外籍：1300元/月；伙食费：9元/人/天；点心费：4元/人/天；', '', 121.38795, 31.219324, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (60, '上海市长宁区虹桥路第二幼儿园', 6, '园长：车佳平', '上海市长宁区虹桥路996弄26号', 1, 'http://3101050156.age06.com/310105/516/', '03早教活动', '1.虹桥路（双）:996-1038 弄 虹桥路;1060 号、1168 弄 虹桥路（单）:953-971 弄；2.中山西路:1221-1251 号 中山西路:1265-1432 弄；', '', '', '幼管费：225元/月；外籍：1300元/月；伙食费：9元/人/天；点心费：4元/人/天；', '', 121.42638, 31.200848, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (76, '上海市长宁区长宁路小学', 6, '校长：陆勤；学校的教师也正通过不断的努力，提高自身教育教学的素养。
', '上海市长宁区长宁路1600弄15号', 2, '', '', '万航渡路：2032 弄-2616 弄 ；长宁路：1120 弄、1135-2197 ；中山西路：85-187（单号）、189 弄、340-450（双号）、483 号 ；遵义路：555-820 号 ；玉屏南路：110-476（双号）； 天山三村：全部 ；云雾山路：2-27 号 	
', '新古北中学；姚连生中学；长宁中学；娄山中学。', '', '外籍：1300元/人/学期；课外教育活动费：100元/人/学期；校服费：不超过300/人/套；餐费：不超过12元/人/餐', '', 121.41, 31.22, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (34, '上海市长宁区海贝幼儿园', 6, '园长：卢碧滢   现拥有52名专职教师，其中本科学历35人占74.5%；本科在读11人；5年以上教龄教师39名，其中区级骨干教师12人，校级骨干教师15人。                 拥有一支团结向上、充满活力的教工队伍。其中有全国优秀教师，多名幼儿园高级教师，区级骨干教师、区级“园丁奖”称号的教师。', '总园：上海市长宁区定西路710弄37号                        分园：法华镇路751弄45号', 1, 'http://haibei.age06.com/310105/517/', '“我HAPPY，我最棒”系列活动;“幼儿结构游戏”活动', '1.番禺路（单）:1号-207弄、
209弄1号-23支弄（弄内单号）
番禺路（双）:2-220弄、
222弄1-51号（弄内单号）
2.幸福路:211-441弄
3.平武路（单）:7-131弄
平武路（双）:8-168弄
4.定西路（单）:591-825号
定西路（双）：710-798号
5.新华路（双）:506-728号
6.法华镇路（单）:633-915号
法华镇路（双）:660-930号
7.种德桥2号
8.延安西路（双）:1152-1696号（1350弄除外）
9.凯旋路（双）:1010-1068号
10.杨宅路（单）:1-97号
杨宅路（双）:2-86号
11.华山路1220弄（集体户口除外）', '', '', '幼管费：225元/月;外籍：1300月/月;伙食费：9元/人/天;点心费：4元/人/天', '', 121.43, 31.21, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (63, '上海市长宁区长华幼儿园', 6, '园长：陆慧琴；教工21人；专任教师11人，100%具有大专学历、85%具有本科学历；专任教师中幼儿园高级教师有10人，占91%。', '上海市长宁区长宁路491弄14号', 1, 'http://changhua.age06.com/310105/514/', '上海教育出版社与幼儿学互动活动', '1.长宁路:57-518弄
2.愚园路:1210弄、1240弄
3.长宁支路
4.万航渡路1424弄及以前
5.江苏北路
6.华阳路
7.江苏路（双）：46-82弄
8.安西路:23弄
9.万航渡路后路:77弄、85号、87号', '', '', '幼管费：175元/月;伙食费：9元/人/天; 点心费：4元/人/天', '', 121.43352, 31.227785, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (50, '上海市长宁区新华路幼儿园', 6, '园长：苏艳红', '上海市长宁区新华路294弄11号', 1, 'http://3101050149.age06.com/310105/509/', '', '"1.番禺路（单）:211号及以后、209 弄（弄内双号） 番禺路（双）:224弄及以后、222弄（弄内双号） ；2.法华镇路（单）:1-631 号 法华镇路（双）:2-632 号；3.新华路（单）:1-483 号 新华路（双）:2-468 号；4.幸福路（单）:1-139 号 幸福路:195 号 幸福路（双）:2-200 号；5.华山路:1389 弄、1461 弄、1520 号及以后；6.定西路（双）:2-708 号；7.淮海中路:1950 弄、1978 号及以后；8.兴国路（双）； 9.香花桥路 ；10.淮海西路（双）；11.云阳路；12.泰安路； 13.湖南路"	
', '', '', '幼管费：175元/月；外籍：1300月/月；伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.43, 31.21, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (70, '上海市长宁区虹古路第三幼儿园', 6, '园长：张薇；全院在编人员21人。拥有一支师德良好，整体结构比较合理的师资队伍。在现有的17位教师中，全部具有大专学历，其中12位教师具有本科学历，占70%，一名研究生在读。', '上海市长宁区仙霞路700弄43号', 1, 'http://3101050166.age06.com/310105/525/', '故事周活动', '1.仙霞路: 1001 弄 仙霞路（双）: 620-1088 弄                             
2.清溪路: 770 弄 25 号             
 3.北虹路: 77 弄、555 弄、579 弄 
4.虹古路:380-829 弄                 
5.安龙路:465 弄                       
6.威宁路:8 弄、123 弄 ', '', '', '幼管费：175元/月     外籍：1300元/月 ；伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.392784, 31.211, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (59, '上海市长宁区愚园路第五幼儿园', 6, '园长：徐芸；教师队伍学历全部达到大专学历。其中80%教师已达到本科学历。教师的年龄层次均衡，且具有一定的教学经验。60%教师持有幼儿园高级教师职称。', '上海市长宁区愚园路865弄4号', 1, 'http://3101050146.age06.com/310105/506/', '“科技大篷车”进校园活动', '1、愚园路：(双)684—1088弄、1112弄、1136弄(单)669弄—1249弄；2、江苏路：(双)114—320弄（单）5号—501号；3、武定西路：（单）1201-1371弄、1375号；4、镇宁路：（单）111号、233弄—545弄；5、延安西路：（双）548弄—746弄；6、宣化路：（双）42—72弄、248弄；7、东诸安浜路：55弄—231弄；', '', '', '幼管费：175元/月；外籍：1300元/月；伙食费：9元/人/天；点心费：4元/人/天；', '', 121.44, 31.23, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (62, '上海市长宁区兆丰幼儿园', 6, '园长：郑卫权', '上海市长宁区长宁路712弄151号', 1, 'http://3101050143.age06.com/310105/503/', '早期阅读特色活动；公园野趣活动；特色专业活动室   ', '1.长宁路（双）:582-1318 弄        
2.凯旋路:10 弄、14 号、88-138 号      
3.汇川路:300 弄、400 弄  
4.中山西路:85 弄、189 弄            
 5.万航渡路: 1425 号                  
万航渡路（单）:1455 号-1589 号                        
万航渡路（双）:1450-2088 弄 ', '长宁路小学;江五小学;', '', '幼管费：225元/月； 外籍：1300元/月；伙食牛奶费：13元/人/天', '', 121.42874, 31.228449, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (66, '上海市长宁区愚一幼儿园', 6, '园长：张蕙', '总院：上海市长宁区愚园路1280弄18号;分院：上海市长宁区安化路20号       ', 1, 'http://3101050144.age06.com/310105/504/', '', '1.汇川路:10 弄、88 弄                
2.长宁路:833 弄、969 号、1027 弄、1033 弄、 1277 弄                         
3.安西路:10-380 号  
4.定西路:1277 号、1279 号、1507 号、1564 号                             
 5.宣化路:268 弄                       
6.愚园路:1264-1396 号、1277-1423 弄 
7.安化路:394 号、396 号、400 号、470 号 ', '', '', '幼管费：700元/月     外籍：1300元/月; 伙食费：9元/人/天 ;点心费：4元/人/天', '', 121.43132, 31.22567, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (67, '上海市长宁区新剑幼儿园', 6, '园长：姚红梅；共计60名教职员公，其中教师34人。教师的人员结构合理，教师持证上岗，100%的教师参加学历培训和职务培训，其中大学本科及本科在读的教师达81%，大专毕业达19%，教师学历层次较高。', '上海市长宁区剑河路459号', 1, 'http://3101050177.age06.com/310105/533/', '', '1.平塘路:456 弄                       
2.甘溪路:100 弄、205 号、207 号          
3.剑河路:599 弄、602 弄、688 弄、711 弄                                   
 4.哈密路:500 弄                      
5.泉口路:109 弄、185 弄 
6.仙霞路:1281 弄、1331 弄             
7.仙霞西路:77 弄、300 弄、500 弄、501 弄 621 弄、630 弄、635 弄            
8.淞虹路:715 弄、735 弄               
9.福泉路:258 弄', '', '', '幼管费：175元/月     外籍：1300元/月; 伙食费：9元/人/天 ; 点心费：4元/人/天', '', 121.374825, 31.217379, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (68, '上海市长宁区安顺路幼儿园', 6, '园长：宗艳 ;工会主席：刘晨  ;保教主任：胥梦超', '上海市长宁区安顺路193号', 1, 'http://3101050155.age06.com/310105/515/', '', '1.长顺路                             
2.安顺路                           
 3.虹桥路:885 弄、977 弄              
 4.新华路（单）:519 号-699 弄 新华路:755 弄 
5.杨宅路:181 弄、266 弄             
6.中山西路（单）:945-1039 弄         
7.延安西路（双）:1740-1930 弄        
8.凯旋路:1188 号、1222 弄、1500 弄   
9.定西路（单）:399-439 弄', '', '', '幼管费：175元/月     外籍：1300元/月;伙食费：9元/人/天； 点心费：4元/人/天', '', 121.42691, 31.208584, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (69, '上海市长宁区虹桥幼儿园', 6, '园长：胡宏', '上海市长宁区张虹路92号', 1, 'http://3101050193.age06.com/310105/541/', '', '1. 古北圣美邸（宋园路 69 弄）        
2. 张虹路 90 弄                     
3. 虹桥城市花园（黄金城道 99 弄）    
4. 古北中央花园（伊犁南路 500 号）  
 5. 古北国际广场（富贵东道 229 弄）   
6. 伊犁路:110-146 弄 
7.潘家塔（1-40 号）                
 8.姚虹路 619 弄                     
9.虹桥路（单）:1017-1167 弄        
10.古北嘉年华庭（黄金城道 258/259 号） 
11.中山西路 1030 弄                
12.宋园路:28-62 弄', '', '', '幼管费：225元/月； 外籍：1300元/月; 伙食费：9元/人/天 ；点心费：4元/人/天', '', 121.41898, 31.198591, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (61, '上海市长宁区民办东展幼儿园', 6, '园长：范怡；首席顾问：赵赫；依据公司“投资机制、投资人才，报务社会、争创品牌”的投资理念，幼儿园师资队伍结构合理，拥有一批在市、区有一定影响力的、高素质的中青年教师队伍，目前有市、区级骨干教师7人。教师们富有爱心、服务意识强，专业水准高。几年来，教师们在各级各类业务专业比赛中有2项24人次获全国奖项，7项10人获上海市奖项。', '上海市长宁区安龙路828号', 1, 'http://www.dongzhan-dzy.com.cn/', '户外幼儿混龄大活动；活动区活动课程；幼儿生活课程——‘我会做’幼儿音乐；园本化的皮亚杰幼儿思维课程；', '2015招生对象：我园招收身体健康（无慢性传染病）、智力正常、可正常参加集体活动的适龄儿童。具体年龄段：2012 年 9 月 1 日至 2013 年 8 月 31 日；2011 年 9 月 1 日至 2012 年 8 月 31 日（仅收部分插班生）。暂无具体地段信息。', '', '', '幼管费：3500元/月；外籍：4300元/月；伙食费：11元/人/天；点心费：5元/人/天；', '', 121.394226, 31.214552, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (64, '上海市长宁区长三幼儿园', 6, '园长：徐英', '上海市长宁区武夷路709弄28号', 1, 'http://3101050161.age06.com/310105/520/', '', '1.武夷路（单）:411-727 号 武夷路（双）:416-800 号                    
2.延安西路（单）:1431-1667 弄        
3.长宁路:1135 弄                     
4.定西路:1211 弄、1235 弄、1327 号    
5.天山路（双）:1650-1820 弄           
6.玉屏南路:1-227 号                   
7.凯旋路:750 弄 
8.中山西路（单）:333-753 号 中山西路：424 弄、430 号、440 号、450 号         
9.安化路（单）:395-535 号           
10.昭化路（单）:501-615 号 昭化路（双）:488-518 弄                    
11.遵义路:友谊新村 1-7号、390-412 弄、534弄、 690 号、700 号、720 号、740 号、780 弄                             
12.天山三村:1-49 号 ', '', '', '幼管费：175元/月; 伙食费：9元/人/天;点心费：4元/人/天', '', 121.423096, 31.220041, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (65, '上海市长宁区虹古路幼儿园', 6, '园长：黄瑛；全院在编人员21人。现有的17位教师中，全部具有大专学历，其中12位教师具有本科学历，占70%，一名研究生在读。', '上海市长宁区虹古路379号', 1, 'http://3101050165.age06.com/310105/524/', '', '1.虹古路（单）:11-377 弄              
2.水城路:2-79 号                     
3.虹桥路:1704 号-1980 弄              
4.虹许路:815 弄-1109 弄  
5.虹梅路:1918-3918 弄                
6.延安西路:2633 号—2932 弄             
7.水城南路:25 号-348 弄              
 8.荣华西道:19-128 号 ', '', '', '幼管费：175元/月；外籍：1300元/月;伙食费：9元/人/天; 点心费：4元/人/天', '', 121.39554, 31.208769, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (77, '上海市长宁区古北路小学', 6, '校长：周明星；教职工53人，其中中学高级教师2人，小学高级教师25人，大学本科学历28人占在岗教师65.1%，大专14人，2人完成了研究生课程学习，在职在岗教师学历合格率达100%。
', '上海市长宁区古北路211弄24号', 2, 'http://www.gubeischool.com/index.html', '“机器人”、“咕咕儿童诗社”、“乒乓球”“儿童画”“生活德育”“民俗与礼仪”。
', '天山路：680 弄、700 弄、750 弄-840 弄 （双号）；古北路：4-186 号（双号）、8 弄、62 弄、69 弄、76 弄、108 弄、181 弄、124 弄、136 弄、211 弄-250 弄、371 弄-373 弄； 娄山关路：811 弄-827 号（单号）、850 弄、969 弄、999 弄； 云雾山路：221 弄、551 弄 ；玉屏南路：496 弄、498 弄、510 弄-618 弄、537-731 弄； 天山四村全部 ；锦屏路全部； 天山支路全部 ；芙蓉江路 555 弄（新天地河滨花园） ', '新古北中学；姚连生中学；长宁中学；娄山中学。', '', '外籍：1300元/人/学期；课外教育活动费：100元/人/学期；校服费：不超过300/人/套；餐费：不超过12元/人/餐', '', 121.401215, 31.213676, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (78, '长宁区玉屏南路小学', 6, '校长：乐涟；在岗教职员公47名，其中教师42名。', '上海市长宁路玉屏南路371号', 2, 'http://wl1977.30edu.com/', '环保组、机械及其人族、科普绘画组、摄影组、玉屏诗社等。', '遵义路：390 弄-412 弄、435 弄、533 号、543 号； 友谊新村：1-7 号 ；玉屏南路：1-207 号（单号）、41 弄、113 弄、345 弄、375 号、309 号、 329 号、377 号、379 号； 天山路：1726 弄 1-11 号、938 弄、1878 弄-1922 弄 ；中山西路：640 号（双号）-652 弄 3 号、669 弄-753 号 ；娄山关路：764 弄、810 弄 武夷路：651-741（单号）、656-790（双号） 	
', '新古北中学；姚连生中学；长宁中学；娄山中学。', '', '外籍：1300元/人/学期；课外教育活动费：100元/人/学期；校服费：不超过300/人/套；餐费：不超过12元/人/餐', '', 121.406784, 31.213017, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (75, '上海市长宁区安顺路小学', 6, '校长：陶永仪；全校有104名教职工，组成了一支有责任心、和谐、进取的团队。其中小学高级教师67名，小学一级教师26名，教职工中共产党员21名，共青团员8名。
', '上海市长宁区安顺路215号', 2, 'http://www.aslxx.edu.sh.cn/info/FRAME_INDEX.asp?info_class_id=182&height=768&width=1024', '《小篮球》；《航天知识》；《DV制作》等拓展课程。
', '虹桥路：885 号-1392 号； 延安西路：1740 弄-1930 弄（双号）； 宋园路：1-108 ；伊犁路：2 号-110 弄、134 弄、146 弄、190 弄； 黄金城道：99 弄、潘家塔、姚虹路虹四村 ；中山西路：934-1432（双号）、945-1251（单号）； 中山西路何家角全部；中山西路中华新村全部；中山西路长顺路全部 安顺路：134-358（双号）；158-389 号（单号） 纺大教工宿舍（延安西路 1882 号；延安西路 1930 弄；杨宅路 181 弄）； 凯旋路：1383 号  	
', '沪定中学；长宁中学；娄山中学；', '', '外籍：1300元/人/学期；课外教育活动费：100元/人/学期；校服费：不超过300/人/套；餐费：不超过12元/人/餐', '', 121.416435, 31.200447, null);
INSERT INTO public.school (id, name, area_id, teachdesc, address, schooltype_id, website, leisure, threashold, partner, artsource, feedesc, distinguish, longitude, latitude, feature_id) VALUES (79, '上海市长宁区新世纪小学', 6, '校长：杨毅蓉；拥有一支资力深，职称高，教学经验丰富，老中青结构优良的师资队伍。现有教师30名，具有中学高级教师职称4名，小学高级教师职称14名。教师中曾荣获全国及市级以上“园丁奖”称号有12人次，荣获区级以上“园丁奖”称号有30人次', '上海市长宁区新锅炉374弄2号', 2, 'http://www.mbxsjxx.com/', '洋乐器；合唱队；儿童画创作等。；信息技术、国防视野、外教阅读、机器人、模型制作、创意设计、纸藤花艺、彩陶、管乐吹奏、芭蕾舞、工笔画、书法、民间工艺、小足球等近30门课。
', '自主招生', '', '', '学费：15000元/人/学期；课外教育活动费：100元/人/学期；校服：不超过400元/人/套；餐费：14元/人/餐；校车费：890元/人/月。', '', 121.4222, 31.218122, null);
