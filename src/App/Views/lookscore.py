# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-05-01 17:50:58
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/lookscore.py
# @LastTime         : 2022-05-07 14:19:11
# @LastAuthor       : Please set LastEditors
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Blueprint, render_template, request, json, session
import time
from .public import insert_validation_login, update_validation_login
from ..Models import Class, Type, db, Teacher, Score, Student
from ..Utils import public_return as r, format_time

lookscore = Blueprint("lookscore", __name__)


@lookscore.route("/lookscore")
def index():
    return render_template("/lookscore.html")


## 获取
@lookscore.route("/lookscorelist", methods=["GET"])
def get_score():
    level = session.get("level")
    user_id = session.get("uid")
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    k_time = request.values.get("k_time")
    class_name = request.values.get("class_name")
    stu_search = {}
    stu_search["name"] = request.values.get("student_name")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    db_tc = db.session.query(Score)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Score.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Score, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Score.id >= 0]
    if k_time:
        temptime = k_time.split(",")
        where.append(Class.begintime >= temptime[0])
        where.append(Class.begintime <= temptime[1])
    class_where = []
    if class_name:
        temp1 = getattr(Class, "name").like("%" + class_name + "%")
        class_where.append(temp1)
        sids = db.session.query(Class.id).filter(*class_where).all()
        tempsid = []
        for x in sids:
            tempsid.append(x[0])
            pass
        where.append(Score.class_id.in_(tempsid))
    ## 搜索了学生 start
    stu_where = []
    for k, v in stu_search.items():
        if v:
            temp1 = getattr(Student, k).like("%" + v + "%")
            stu_where.append(temp1)
    if len(stu_where) > 0:
        sids = db.session.query(Student.id).filter(*stu_where).all()
        tempsid = []
        for x in sids:
            tempsid.append(x[0])
            pass
        where.append(Score.student_id.in_(tempsid))
    ## 搜索了学生 end
    ## 不同用户不同的业务逻辑
    if level:
        if level == 1:
            pass
        elif level == 2:
            sids = db.session.query(Class.id).filter(Class.teacher_id == user_id).all()
            tempsid = []
            for x in sids:
                tempsid.append(x[0])
                pass
            where.append(Score.class_id.in_(tempsid))
        elif level == 3:
            where.append(Score.student_id == user_id)
        else:
            return r({}, 1, "添加失败，数据库异常")
    ##
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    count = db.session.query(Score).filter(*where).count()
    temp = [
        {
            "id": t.id,
            "student_id": t.student_id,
            "class_id": t.class_id,
            "score": t.score,
            "k_time": t.k_time,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@lookscore.route("/lookscoremany", methods=["GET"])
def get_many_score():
    tc = db.session.query(Score)
    count = db.session.query(Score).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "student_id": t.student_id,
            "class_id": t.class_id,
            "score": t.score,
            "k_time": t.k_time,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)
