# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:23
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/Database.py
# @LastTime         : 2022-05-09 02:57:17
# @LastAuthor       : Please set LastEditors
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from secrets import choice
from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from faker import Faker
import hashlib, time
from random import randint

from isort import code

app = Flask(__name__)
app.config.from_object("App.Config.Dev")
db = SQLAlchemy(app)


class Department(db.Model):
    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        nullable=False,
        index=True,
        comment="id序列",
        doc="这是部门的id序列主键",
    )
    id_parent = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="id序列",
        doc="这是上级部门的id序列",
    )
    name = db.Column(
        db.String(64),
        nullable=False,
        index=True,
        comment="名称",
        doc="部门的名称",
    )

    def __init__(self, id, id_parent, name):
        self.id = id
        self.id_parent = id_parent
        self.name = name

    def __repr__(self):
        return "<department id %r>" % self.id


class Type(db.Model):
    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是分类的id序列主键",
    )
    name = db.Column(
        db.String(60),
        nullable=False,
        index=True,
        comment="分类名称",
        doc="分类名称",
    )

    def __init__(self, id, name):
        self.id = id
        self.name = name

    def __repr__(self):
        return "<Type id %r>" % self.id


class Admin(db.Model):
    """用户表"""

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是管理员的id序列主键",
    )
    login = db.Column(
        db.String(20),
        unique=True,
        nullable=False,
        index=True,
        comment="管理员的登录名称",
        doc="这是管理员的登录名称",
    )
    password = db.Column(
        db.String(32),
        nullable=False,
        index=True,
        comment="密码",
        doc="这是管理员的密码",
    )
    name = db.Column(
        db.String(60),
        nullable=False,
        index=True,
        comment="管理员姓名",
        doc="这是管理员的姓名",
    )
    status = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="id序列",
        doc="这是管理员的状态,0为弃用,1为启用",
    )

    def __init__(self, id, login, password, name, status):
        self.id = id
        self.login = login
        self.password = password
        self.name = name
        self.status = status

    def __repr__(self):
        return "<id %r>" % self.id


class Teacher(db.Model):
    """
    教师
    """

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是管理员的id序列主键",
    )
    ##TODO:Warning:这里有一个外键序列
    department_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="外键序列",
        doc="注意这是部门的外键序列",
    )
    login = db.Column(
        db.String(20),
        unique=True,
        nullable=False,
        index=True,
        comment="老师的登录名称",
        doc="这是老师的登录名称",
    )
    password = db.Column(
        db.String(32),
        nullable=False,
        index=True,
        comment="密码",
        doc="这是管理员的密码",
    )
    code = db.Column(
        db.String(10),
        nullable=False,
        unique=True,
        index=True,
        comment="学号",
        doc="这是老师对应的号码",
    )
    name = db.Column(
        db.String(60),
        nullable=False,
        index=True,
        comment="管理员姓名",
        doc="这是管理员的姓名",
    )
    cid = db.Column(
        db.String(18),
        index=True,
        unique=True,
        comment="身份证",
        doc="身份证号",
    )
    phone = db.Column(
        db.String(11), unique=True, nullable=False, index=True, comment="手机号", doc="手机号"
    )
    email = db.Column(
        db.String(128),
        unique=True,
        nullable=False,
        index=True,
        comment="邮箱地址",
        doc="邮箱地址",
    )
    in_time = db.Column(
        db.Integer, nullable=False, index=True, comment="入职时间", doc="入职时间"
    )
    out_time = db.Column(db.Integer, index=True, comment="离开职时间", doc="离开时间")
    info = db.Column(
        db.Text,
        comment="个人介绍",
        doc="个人介绍",
    )
    subscribe_1 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_2 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_3 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_4 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_5 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )

    def __init__(
        self,
        id,
        department_id,
        login,
        password,
        code,
        name,
        cid,
        phone,
        email,
        in_time,
        out_time,
        info,
        subscribe_1,
        subscribe_2,
        subscribe_3,
        subscribe_4,
        subscribe_5,
    ):
        self.id = id
        self.department_id = department_id
        self.login = login
        self.password = password
        self.code = code
        self.name = name
        self.cid = cid
        self.email = email
        self.phone = phone
        self.in_time = in_time
        self.out_time = out_time
        self.info = info
        self.subscribe_1 = subscribe_1
        self.subscribe_2 = subscribe_2
        self.subscribe_3 = subscribe_3
        self.subscribe_4 = subscribe_4
        self.subscribe_5 = subscribe_5

    def __repr__(self):
        return "<Teacher id %r>" % self.id


class Student(db.Model):
    """
    学生
    """

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是学生的id序列主键",
    )
    ##TODO:Warning:这里有一个外键序列
    department_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="外键序列",
        doc="注意这是部门的外键序列",
    )
    login = db.Column(
        db.String(20),
        unique=True,
        nullable=False,
        index=True,
        comment="学生的登录名称",
        doc="这是学生的登录名称",
    )
    password = db.Column(
        db.String(32),
        nullable=False,
        index=True,
        comment="密码",
        doc="这是管理员的密码",
    )
    code = db.Column(
        db.String(10),
        nullable=False,
        unique=True,
        index=True,
        comment="学号",
        doc="这是学生对应的号码",
    )
    name = db.Column(
        db.String(60),
        nullable=False,
        index=True,
        comment="管理员姓名",
        doc="这是管理员的姓名",
    )
    cid = db.Column(
        db.String(18),
        index=True,
        unique=True,
        comment="身份证",
        doc="身份证号",
    )
    phone = db.Column(
        db.String(11), unique=True, nullable=False, index=True, comment="手机号", doc="手机号"
    )
    email = db.Column(
        db.String(128),
        nullable=False,
        unique=True,
        index=True,
        comment="邮箱地址",
        doc="邮箱地址",
    )
    in_time = db.Column(
        db.Integer, nullable=False, index=True, comment="入职时间", doc="入职时间"
    )
    out_time = db.Column(db.Integer, index=True, comment="离开职时间", doc="离开时间")
    info = db.Column(
        db.Text,
        comment="个人介绍",
        doc="个人介绍",
    )
    subscribe_1 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_2 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_3 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_4 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    subscribe_5 = db.Column(
        db.Integer,
        index=True,
        comment="外键序列",
        doc="注意这是订阅类别的外键序列",
    )
    l_name = db.Column(db.String(60), index=True, comment="联系人姓名", doc="联系人电话")
    l_phone = db.Column(db.String(11), index=True, comment="联系人电话", doc="联系人电话")
    add = db.Column(db.String(255), index=True, comment="家庭住址", doc="家庭住址")

    def __init__(
        self,
        id,
        department_id,
        login,
        password,
        code,
        name,
        cid,
        phone,
        email,
        in_time,
        out_time,
        info,
        l_name,
        l_phone,
        add,
        subscribe_1,
        subscribe_2,
        subscribe_3,
        subscribe_4,
        subscribe_5,
    ):
        self.id = id
        self.department_id = department_id
        self.login = login
        self.password = password
        self.code = code
        self.name = name
        self.cid = cid
        self.email = email
        self.phone = phone
        self.in_time = in_time
        self.out_time = out_time
        self.info = info
        self.l_name = l_name
        self.l_phone = l_phone
        self.add = add
        self.subscribe_1 = subscribe_1
        self.subscribe_2 = subscribe_2
        self.subscribe_3 = subscribe_3
        self.subscribe_4 = subscribe_4
        self.subscribe_5 = subscribe_5

    def __repr__(self):
        return "<Student id %r>" % self.id


class Class(db.Model):
    """
    课程
    """

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是课程的id序列主键",
    )
    name = db.Column(
        db.String(60),
        nullable=False,
        index=True,
        comment="课程姓名",
        doc="这是课程的姓名",
    )
    teacher_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="外键序列",
        doc="注意这是老师的外键序列",
    )
    begintime = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="开始时间",
        doc="具体的开始时间",
    )
    endtime = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="结束时间",
        doc="课程的结束时间",
    )
    user_count = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="课程总人数",
        doc="课程总人数",
    )

    def __init__(self, id, name, teacher_id, begintime, endtime, user_count):
        self.id = id
        self.name = name
        self.teacher_id = teacher_id
        self.begintime = begintime
        self.endtime = endtime
        self.user_count = user_count

    def __repr__(self):
        return "<Class id %r>" % self.id


class Score(db.Model):
    """
    学生
    """

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是课程的id序列主键",
    )
    student_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="外键序列",
        doc="注意这是学生的外键序列",
    )
    class_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="外键序列",
        doc="注意这是学生的外键序列",
    )
    score = db.Column(
        db.Float(3, 1),
        nullable=False,
        index=True,
        comment="课程成绩",
        doc="学生的课程成绩分数",
    )
    k_time = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="考试时间",
        doc="考试时间",
    )

    def __init__(self, id, student_id, class_id, score, k_time):
        self.id = id
        self.student_id = student_id
        self.class_id = class_id
        self.score = score
        self.score = score
        self.k_time = k_time

    def __repr__(self):
        return "<Student id %r>" % self.id


class Announcement(db.Model):
    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
        index=True,
        comment="id序列",
        doc="这是公告的id序列主键",
    )
    name = db.Column(
        db.String(128),
        nullable=False,
        index=True,
        comment="公告的名称和标题",
        doc="公告的名称和标题",
    )
    type_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="公告的分类类别",
        doc="公告的分类类别",
    )
    department_id = db.Column(
        db.Integer,
        nullable=False,
        index=True,
        comment="公告的发布部门",
        doc="公告的发布部门",
    )
    filedir = db.Column(
        db.Text,
        nullable=False,
        comment="公告的文件路径",
        doc="公告的文件路径",
    )
    add_time = db.Column(
        db.Integer, nullable=False, index=True, comment="添加时间", doc="添加时间"
    )

    def __init__(self, id, name, type_id, filedir, add_time, department_id):
        self.id = id
        self.name = name
        self.type_id = type_id
        self.filedir = filedir
        self.add_time = add_time
        self.department_id = department_id

    def __repr__(self):
        return "<Type id %r>" % self.id


def password_init(password):
    db_salt = "e625fb438d13f7f6defbbacb1f0a6d84"
    temp = password + db_salt
    jmd5 = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    return jmd5


db.create_all()
fake = Faker("zh_CN")
department_list = [
    Department(id=0, id_parent=0, name="苏州大学"),
    Department(id=1, id_parent=0, name="苏州大学继续教育学院"),
    Department(id=2, id_parent=0, name="苏州大学本科生"),
    Department(id=3, id_parent=0, name="苏州大学研究生"),
]
department_names = ["文学院","传媒学院","社会学院","政治与公共管理学院","马克思主义学院","外国语学院","东吴商学院（财经学院）","王健法学院","教育学院","艺术学院","音乐学院","体育学院","金螳螂建筑学院","数学科学学院","物理科学与技术学院","光电科学与工程学院","能源学院","材料与化学化工学部","纳米科学技术学院","计算机科学与技术学院(软件学院)","电子信息学院","机电工程学院","沙钢钢铁学院","纺织与服装工程学院","轨道交通学院","巴斯德学院","基础医学与生物科学学院","放射医学与防护学院","公共卫生学院","药学院","护理学院","儿科临床医学院"]
department_list_extend = [
    Department(id=i, id_parent=randint(0, 3), name=department_names[i]) for i in range(4, 30)
]
department_list.extend(department_list_extend)
type_names=["人事任免","处分通告","科研通告","竞赛通告","学生工作","组织活动","日常管理","紧急通告","宣传通告","贯彻精神"]
type_list = [Type(id=i, name=type_names[i]) for i in range(1, 10)]
admin_name = [fake.user_name() for i in range(20)]
admin_list = [
    Admin(
        id=i,
        login=admin_name[i - 1],
        name=fake.name(),
        password=password_init(admin_name[i - 1]),
        status=1,
    )
    for i in range(1, 20)
]
teacher_name = [fake.user_name() for i in range(30)]
teacher_list = [
    Teacher(
        id=i,
        department_id=randint(0, 29),
        login=teacher_name[i - 1],
        password=password_init(teacher_name[i - 1]),
        code=str(fake.random_number(10)),
        name=fake.name(),
        cid=fake.ssn(),
        phone=fake.phone_number(),
        email=fake.email(),
        in_time=time.time(),
        out_time=time.time(),
        info=fake.text(),
        subscribe_1=randint(1, 9),
        subscribe_2=randint(1, 9),
        subscribe_3=randint(1, 9),
        subscribe_4=randint(1, 9),
        subscribe_5=randint(1, 9),
    )
    for i in range(1, 30)
]
student_name = [fake.user_name() for i in range(100)]
student_list = [
    Student(
        id=i,
        department_id=randint(0, 29),
        login=student_name[i - 1],
        password=password_init(student_name[i - 1]),
        code=str(fake.random_number(10)),
        name=fake.name(),
        cid=fake.ssn(),
        phone=fake.phone_number(),
        email=fake.email(),
        in_time=time.time(),
        out_time=time.time(),
        info=fake.text(),
        subscribe_1=randint(1, 9),
        subscribe_2=randint(1, 9),
        subscribe_3=randint(1, 9),
        subscribe_4=randint(1, 9),
        subscribe_5=randint(1, 9),
        l_name=fake.name(),
        l_phone=fake.phone_number(),
        add=fake.address(),
    )
    for i in range(1, 100)
]
class_names=[
    "酒店管理信息系统",
    "CAD/CAM",
    "CAD/CAM综合实训",
    "C语言程序设计",
    "Excel在财务中的应用",
    "Excel数据处理与分析",
    "JAVA程序设计",
    "MATLAB的工程应用",
    "三维计算机辅助设计",
    "专业模拟实习",
    "中级财务",
    "会计学",
    "信息安全技术",
    "制造执行系统技术应用",
    "商业图形图像处理",
    "商业文案处理",
    "国际贸易实务",
    "审计学",
    "工程机械制图",
    "心理实验编程",
    "数据处理实用技术",
    "数据库原理与设计",
    "数据库原理综合实训",
    "数据挖掘",
    "数据结构",
    "数控加工工艺与编程",
    "服装CAD",
    "电子CAD",
    "电子商务案例分析",
    "电气工程CAD制图",
    "电气设计",
    "社会科学统计软件应用",
    "移动应用开发",
    "程序设计基础",
    "程序设计综合实训",
    "网络媒体设计",
    "网络程序设计及应用",
    "虚拟仪器设计",
    "计算机基础",
    "计算机辅助服装设计应用",
    "计算机辅助设计",
    "跨境电商实务",
    "软件测试与质量保证",
    "面向对象程序设计",
]
class_list = [
    Class(
        id=i,
        name=class_names[i],
        teacher_id=randint(1, 29),
        begintime=time.time(),
        endtime=time.time(),
        user_count=randint(15, 100),
    )
    for i in range(1, 40)
]

score_list = [
    Score(
        id=i,
        student_id=randint(1, 99),
        class_id=randint(1, 39),
        score=fake.pyfloat(left_digits=2, right_digits=2, positive=True),
        k_time=time.time(),
    )
    for i in range(1, 200)
]
announcement_list = [
    Announcement(
        id=i,
        name=fake.sentence(),
        type_id=randint(1, 9),
        department_id=randint(1, 29),
        filedir=fake.file_path(),
        add_time=time.time(),
    )
    for i in range(1, 30)
]

db.session.bulk_save_objects(department_list)
db.session.bulk_save_objects(type_list)
db.session.bulk_save_objects(admin_list)
db.session.bulk_save_objects(teacher_list)
db.session.bulk_save_objects(student_list)
db.session.bulk_save_objects(class_list)
db.session.bulk_save_objects(score_list)
db.session.bulk_save_objects(announcement_list)
db.session.commit()
print("测试用数据库初始化完成")
