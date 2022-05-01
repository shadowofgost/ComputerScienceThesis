# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-05-01 17:50:50
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/lookclass.py
# @LastTime         : 2022-05-01 18:03:18
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Blueprint, render_template, request, json, session
import time
from ..Models import Class, Type, db, Teacher, Score
from ..Utils import public_return as r, format_time

lookclass = Blueprint("lookclass", __name__)


@lookclass.route("/lookclass")
def index():
    return render_template("/lookclass.html")


## 获取
@lookclass.route("/lookclasslist", methods=["GET"])
def get_lookclass():
    level = session.get("level")
    user_id = session.get("uid")
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    begin_time = request.values.get("begintime")
    end_time = request.values.get("endtime")
    teacher_name = request.values.get("teacher_name")
    search = {}
    search["name"] = request.values.get("name")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    count = db.session.query(Class).count()
    db_tc = db.session.query(Class)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Class.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Class, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Class.id >= 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(lookclass, k).like("%" + v + "%")
        where.append(temp1)
    if begin_time:
        temptime = begin_time.split(",")
        where.append(Class.begintime >= temptime[0])
        where.append(Class.begintime <= temptime[1])
    if end_time:
        temptime = end_time.split(",")
        where.append(Class.endtime >= temptime[0])
        where.append(Class.endtime <= temptime[1])
    if teacher_name:
        teacher_where = []
        temp1 = getattr(Teacher, "name").like("%" + teacher_name + "%")
        teacher_where.append(temp1)
        sids = db.session.query(Teacher.id).filter(*teacher_where).all()
        tempsid = []
        for x in sids:
            tempsid.append(x[0])
            pass
        where.append(Class.teacher_id.in_(tempsid))
    ##对不同的用户配置不同的逻辑
    if level:
        if level == 1:
            pass
        elif level == 2:
            where.append(Class.teacher_id == user_id)
        elif level == 3:
            sids = (
                db.session.query(Score.class_id)
                .filter(Score.student_id == user_id)
                .all()
            )
            tempsid = []
            for x in sids:
                tempsid.append(x[0])
                pass
            where.append(Class.id.in_(tempsid))
        else:
            return r({}, 1, "添加失败，数据库异常")
    ##
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    print(tc)
    temp = [
        {
            "id": t.id,
            "teacher_id": t.teacher_id,
            "name": t.name,
            "begintime": t.begintime,
            "endtime": t.endtime,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@lookclass.route("/lookclassmany", methods=["GET"])
def get_many_lookclass():
    tc = db.session.query(Class)
    count = db.session.query(Class).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "teacher_id": t.teacher_id,
            "name": t.name,
            "begintime": t.begintime,
            "endtime": t.endtime,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)
