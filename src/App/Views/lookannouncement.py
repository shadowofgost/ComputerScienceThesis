# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-05-01 17:51:09
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/lookannouncement.py
# @LastTime         : 2022-05-07 15:42:49
# @LastAuthor       : Please set LastEditors
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
import time
from flask import (
    Blueprint,
    render_template,
    Flask,
    request,
    redirect,
    session,
    json,
    current_app as app,
)
from ..Models import Admin, Teacher, Student, Class, Department, Type, db, Announcement
from ..Utils import public_return as r, password_encode, format_time
from .public import insert_validation_login, update_validation_login

lookannouncement = Blueprint("lookannouncement", __name__)


@lookannouncement.route("/lookannouncement")
def index():
    return render_template("/lookannouncement.html")


## 获取公告
@lookannouncement.route("/lookannouncementlist", methods=["GET"])
def get_announcement():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    add_time = request.values.get("add_time")
    search = {}
    search["name"] = request.values.get("name")
    department_id = request.values.get("department_id")
    type_id = request.values.get("type_id")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    count = db.session.query(Announcement).count()
    db_tc = db.session.query(Announcement)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Announcement.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Announcement, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Announcement.id > 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(Announcement, k).like("%" + v + "%")
        where.append(temp1)
    if add_time:
        temptime = add_time.split(",")
        where.append(Announcement.add_time >= temptime[0])
        where.append(Announcement.add_time <= temptime[1])
    if department_id:
        where.append(Announcement.department_id == department_id)
    if type_id:
        where.append(Announcement.type_id == type_id)
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    count = db.session.query(Announcement).filter(*where).count()
    temp = [
        {
            "id": t.id,
            "department_id": t.department_id,
            "type_id": t.type_id,
            "name": t.name,
            "add_time": t.add_time,
            "filedir": t.filedir,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@lookannouncement.route("/lookannouncementmany", methods=["GET"])
def get_many_announcement():
    db_tc = db.session.query(Announcement)
    count = db.session.query(Announcement).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "department_id": t.department_id,
            "type_id": t.type_id,
            "name": t.name,
            "add_time": t.add_time,
            "filedir": t.filedir,
        }
        for t in db_tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)
