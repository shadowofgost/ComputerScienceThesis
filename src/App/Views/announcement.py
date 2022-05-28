# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-12 23:38:20
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/announcement.py
# @LastTime         : 2022-05-08 21:20:38
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
from copy import deepcopy
from ..Models import Admin, Teacher, Student, Class, Department, Type, db, Announcement
from ..Utils import public_return as r

announcement = Blueprint("announcement", __name__)


@announcement.route("/announcement")
def index():
    return render_template("/announcement.html")


## 获取公告
@announcement.route("/announcementlist", methods=["GET"])
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
@announcement.route("/announcementmany", methods=["GET"])
def get_many_announcement():
    db_tc = db.session.query(announcement)
    count = db.session.query(announcement).count()
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


##增加
@announcement.route("/announcementlist", methods=["POST"])
def add_announcement():
    data = request.get_data()
    j_data = json.loads(data)
    j_data["add_time"] = time.time()
    j_data["filedir"] = deepcopy(j_data["rich"])
    del j_data["rich"]
    cl = Announcement(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


## 修改
@announcement.route("/announcementlist/<int:id>", methods=["PUT"])
def edit_announcement(id):
    data = request.get_data()
    j_data = json.loads(data)
    j_data["add_time"] = time.time()
    j_data["filedir"] = deepcopy(j_data["rich"])
    del j_data["rich"]
    try:
        db.session.query(Announcement).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


## 删除
@announcement.route("/announcementlist/<int:id>", methods=["DELETE"])
def delete_announcement(id):
    try:
        sql2 = db.session.query(Announcement).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@announcement.route("/announcementmany/<ids>", methods=["DELETE"])
def delete_many_announcement(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Announcement).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##其他数据接口
@announcement.route("/announcement/minlist", methods=["GET"])
def get_minlist():
    data = (
        db.session.query(Department.id, Department.name)
        .order_by(Department.id.desc())
        .all()
    )
    re = [{"label": x[1], "value": x[0]} for x in data]
    data = db.session.query(Type.id, Type.name).order_by(Type.id.desc()).all()
    test = [{"label": x[1], "value": x[0]} for x in data]
    return r({"departments": re, "types": test})
