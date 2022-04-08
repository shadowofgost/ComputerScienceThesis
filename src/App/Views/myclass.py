# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/Views/myclass.py
# @LastTime         : 2022-04-08 15:11:47
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
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
import hashlib, time
from ..Models import Admin, Teacher, Student, Class, Score, db
from ..Utils import public_return as r

myclass = Blueprint("myclass", __name__)


@myclass.route("/myclass")
def index():
    return render_template("/myclass.html")


@myclass.route("/myclass", methods=["POST"])
def add_class():
    data = request.get_data()
    j_data = json.loads(data)
    user = db.session.query(Class).filter_by(name=j_data["name"]).first()
    if user is not None:
        return r({}, 0, "", {"admin": "名称已存在"})

    cl = Class(j_data["t_id"], j_data["name"], int(time.time()), 0)
    db.session.add(cl)
    db.session.commit()
    return r({}, 0, "添加成功")


# 获取用户
@myclass.route("/classlist", methods=["GET"])
def get_class():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    name = request.values.get("name")
    t_id = request.values.get("t_id")
    addtime = request.values.get("addtime")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")

    count = db.session.query(Class).count()
    db_tc = db.session.query(Class)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Class.id.desc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Class, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Class.id > 0]
    if name:
        where.append(Class.name.like("%" + name + "%"))
    if t_id:
        where.append(Class.t_id == t_id)
    if addtime:
        temptime = addtime.split(",")
        where.append(Class.addtime >= temptime[0])
        where.append(Class.addtime <= temptime[1])
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    print(tc)
    for t in tc:
        temp.append(
            {
                "id": t.id,
                "name": t.name,
                "addtime": t.addtime,
                "user_count": t.user_count,
                "t_id": t.t_id,
            }
        )

    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)
    pass


# 删除
@myclass.route("/classlist/<int:cid>", methods=["DELETE"])
def delete_class(cid):
    sql2 = db.session.query(Class).filter_by(id=cid).delete()
    db.session.commit()
    return r({}, 0, "删除成功")


# 修改
@myclass.route("/classlist/<int:cid>", methods=["PUT"])
def edit_class(cid):
    data = request.get_data()
    j_data = json.loads(data)
    cl = (
        db.session.query(Class)
        .filter_by(name=j_data["name"])
        .filter(Class.id != cid)
        .first()
    )
    if cl is not None:
        return r({}, 1, "班级已经存在")
    cl = db.session.query(Class).filter_by(id=cid).first()
    if "name" in j_data:
        cl.name = j_data["name"]
    if "t_id" in j_data:
        cl.t_id = j_data["t_id"]
    db.session.commit()
    return r({}, 0, "修改成功")


# 获取id名字，用于前端选择
@myclass.route("/classlist/minlist", methods=["GET"])
def get_minlist():
    data = db.session.query(Class.id, Class.name).order_by(Class.id.desc()).all()
    re = []
    for x in data:
        re.append({"label": x[1], "value": x[0]})
    return r({"options": re})
