# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:23
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Models/models.py
# @LastTime         : 2022-05-01 17:24:12
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


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

    def __init__(self, id_parent, name):
        self.id_parent = id_parent
        self.name = name

    def __repr__(self):
        return "<department id %r>" % self.id


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

    def __init__(self, login, password, name, status):
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
        index=True,
        comment="学号",
        doc="这是老师对应的号码",
    )
    name = db.Column(
        db.String(60),
        index=True,
        comment="管理员姓名",
        doc="这是管理员的姓名",
    )
    cid = db.Column(
        db.String(18),
        index=True,
        comment="身份证",
        doc="身份证号",
    )
    phone = db.Column(db.String(11), index=True, comment="手机号", doc="手机号")
    email = db.Column(
        db.String(128),
        index=True,
        comment="邮箱地址",
        doc="邮箱地址",
    )
    in_time = db.Column(db.Integer, index=True, comment="入职时间", doc="入职时间")
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
        index=True,
        comment="学号",
        doc="这是学生对应的号码",
    )
    name = db.Column(
        db.String(60),
        index=True,
        comment="管理员姓名",
        doc="这是管理员的姓名",
    )
    cid = db.Column(
        db.String(18),
        index=True,
        comment="身份证",
        doc="身份证号",
    )
    phone = db.Column(db.String(11), index=True, comment="手机号", doc="手机号")
    email = db.Column(
        db.String(128),
        index=True,
        comment="邮箱地址",
        doc="邮箱地址",
    )
    in_time = db.Column(db.Integer, index=True, comment="入职时间", doc="入职时间")
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
        self.l_name = (l_name,)
        self.l_phone = (l_phone,)
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
        db.String(128),
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

    def __init__(self, name, teacher_id, begintime, endtime):
        self.name = name
        self.teacher_id = teacher_id
        self.begintime = begintime
        self.endtime = endtime

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

    def __init__(self, student_id, class_id, score, k_time):
        self.student_id = student_id
        self.class_id = class_id
        self.score = score
        self.score = score
        self.k_time = k_time

    def __repr__(self):
        return "<Student id %r>" % self.id


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

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return "<Type id %r>" % self.id


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

    def __init__(self, id,name, type_id, filedir, add_time,department_id ):
        self.id = id
        self.name = name
        self.type_id = type_id
        self.filedir = filedir
        self.add_time = add_time
        self.department_id = department_id

    def __repr__(self):
        return "<Type id %r>" % self.id
