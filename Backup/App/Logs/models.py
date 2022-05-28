# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-10 15:23:06
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/Backup/models.py
# @LastTime         : 2022-04-10 15:23:08
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:23
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Models/models.py
# @LastTime         : 2022-04-10 15:17:11
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from enum import auto
from operator import index
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
    level = db.Column(db.Integer)
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

    def __init__(self, login, password, level, name, status):
        self.admin = login
        self.password = password
        self.level = level
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
        comment="身份证",
        doc="身份证号",
    )
    in_time = db.Column(db.Integer)
    out_time = db.Column(db.Integer)
    oa_time = db.Column(db.Integer)
    info = db.Column(
        db.Text,
        comment="个人介绍",
        doc="个人介绍",
    )

    def __init__(self, a_id, name, cid, in_time, out_time, oa_time, info):
        self.a_id = a_id
        self.name = name
        self.cid = cid
        self.in_time = in_time
        self.out_time = out_time
        self.oa_time = oa_time
        self.info = info

    def __repr__(self):
        return "<Teacher id %r>" % self.id


class Class(db.Model):
    """
    教师
    """

    id = db.Column(db.Integer, primary_key=True)
    t_id = db.Column(db.Integer)
    name = db.Column(db.String(60), nullable=False)
    addtime = db.Column(db.Integer)
    user_count = db.Column(db.Integer)

    def __init__(self, t_id, name, addtime, user_count):
        self.t_id = t_id
        self.name = name
        self.addtime = addtime
        self.user_count = user_count

    def __repr__(self):
        return "<Class id %r>" % self.id


class Student(db.Model):
    """
    学生
    """

    id = db.Column(db.Integer, primary_key=True)
    class_id = db.Column(db.Integer)
    name = db.Column(db.String(60), nullable=False)
    code = db.Column(db.String(20), nullable=False)
    cid = db.Column(db.String(18), nullable=False)
    in_time = db.Column(db.Integer)
    out_time = db.Column(db.Integer)
    info = db.Column(db.Text, nullable=False)
    l_name = db.Column(db.String(60), nullable=False)
    l_phone = db.Column(db.String(11), nullable=False)
    l2_name = db.Column(db.String(60), nullable=False)
    l2_phone = db.Column(db.String(11), nullable=False)
    add = db.Column(db.String(255), nullable=False)

    def __init__(
        self,
        class_id,
        name,
        code,
        cid,
        in_time,
        out_time,
        info,
        l_name,
        l_phone,
        l2_name,
        l2_phone,
        add,
    ):
        self.class_id = class_id
        self.name = name
        self.code = code
        self.cid = cid
        self.in_time = in_time
        self.out_time = out_time
        self.info = info
        self.l_name = l_name
        self.l_phone = l_phone
        self.l2_name = l2_name
        self.l2_phone = l2_phone
        self.add = add

    def __repr__(self):
        return "<Student id %r>" % self.id


class Score(db.Model):
    """
    学生
    """

    id = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.Integer)
    score = db.Column(db.Float(3, 1), nullable=False)
    k_time = db.Column(db.Integer)
    kskc = db.Column(db.String(60), nullable=False)

    def __init__(self, uid, score, k_time, kskc):
        self.uid = uid
        self.score = score
        self.kskc = kskc
        self.k_time = k_time

    def __repr__(self):
        return "<Student id %r>" % self.id
