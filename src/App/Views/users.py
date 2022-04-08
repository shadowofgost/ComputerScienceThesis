# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/Views/users.py
# @LastTime         : 2022-04-08 15:21:31
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

users = Blueprint("users", __name__)


@users.route("/users")
def index():
    return render_template("/account/users.html")


# 获取用户
@users.route("/userdata", methods=["GET"])
def userdata():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    name = request.values.get("name")
    cid = request.values.get("cid")

    in_time = request.values.get("in_time")
    oa_time = request.values.get("oa_time")

    count = db.session.query(Teacher).count()
    db_tc = db.session.query(Teacher)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Teacher.id.desc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Teacher, orderBy)
        order = getattr(temp1, orderDir)()
    db_tc.order_by(order)
    where = [Teacher.id > 0]
    if name:
        where.append(Teacher.name.like("%" + name + "%"))
    if cid:
        where.append(Teacher.cid.like("%" + cid + "%"))
    if in_time:
        temptime = in_time.split(",")
        where.append(Teacher.in_time >= temptime[0])
        where.append(Teacher.in_time <= temptime[1])
    if oa_time:
        temptime = oa_time.split(",")
        where.append(Teacher.oa_time >= temptime[0])
        where.append(Teacher.oa_time <= temptime[1])
    tc = db_tc.filter(*where).limit(perPage).offset(offset).all()
    # print(tc)
    for t in tc:
        ids.append(t.a_id)
    user = db.session.query(Admin).filter(Admin.id.in_(ids)).all()

    for t in tc:
        for u in user:
            if u.id == t.a_id:
                temp.append(
                    {
                        "id": u.id,
                        "name": u.name,
                        "admin": u.admin,
                        "level": u.level,
                        "status": u.status,
                        "cid": t.cid,
                        "in_time": t.in_time,
                        "out_time": t.out_time,
                        "oa_time": t.oa_time,
                        "info": t.info,
                    }
                )

    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


# 删除用户
@users.route("/userdata/<int:uid>", methods=["DELETE"])
def delete_user(uid):
    sql = db.session.query(Admin).filter_by(id=uid).filter(Admin.level != 1).delete()
    sql2 = db.session.query(Teacher).filter_by(a_id=uid).delete()
    db.session.commit()
    return r({}, 0, "删除成功")


# 重置密码为123456
@users.route("/userdata/repwd/<int:uid>", methods=["PUT"])
def repwd_user(uid):
    # 重置密码为123456
    user = db.session.query(Admin).filter_by(id=uid).first()
    local_salt = app.config.get("SALT")
    salt = hashlib.md5(str(time.time()).encode(encoding="UTF-8")).hexdigest()
    temp = "123456" + local_salt + salt
    pwd = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    user.password = pwd
    user.salt = salt
    db.session.commit()
    return r({}, 0, "重置成功")


# 添加用户
@users.route("/userdata", methods=["POST"])
def add_user():
    data = request.get_data()
    j_data = json.loads(data)
    user = db.session.query(Admin).filter_by(admin=j_data["admin"]).first()
    if user is not None:
        return r({}, 0, "", {"admin": "账号已存在"})
    # admin, password,salt,level,name,status
    local_salt = app.config.get("SALT")
    salt = hashlib.md5(str(time.time()).encode(encoding="UTF-8")).hexdigest()
    temp = j_data["password"] + local_salt + salt
    pwd = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    admin = Admin(j_data["admin"], pwd, salt, 2, j_data["name"], 1)
    db.session.add(admin)
    db.session.flush()
    j_data.setdefault("in_time", 0)
    j_data.setdefault("oa_time", 0)
    j_data.setdefault("out_time", 0)
    j_data.setdefault("info", "")
    tc = Teacher(
        admin.id,
        j_data["name"],
        j_data["cid"],
        j_data["in_time"],
        j_data["out_time"],
        j_data["oa_time"],
        j_data["info"],
    )
    db.session.add(tc)
    db.session.commit()
    return r({}, 0, "添加成功")


# 修改用户
@users.route("/userdata/<int:uid>", methods=["PUT"])
def edit_user(uid):
    data = request.get_data()
    j_data = json.loads(data)
    user = (
        db.session.query(Admin)
        .filter_by(admin=j_data["admin"])
        .filter(Admin.id != uid)
        .first()
    )
    if user is not None:
        return r({}, 0, "", {"admin": "账号已存在"})
    # 修改账号表
    user = db.session.query(Admin).filter_by(id=uid).first()
    user.name = j_data["name"]
    if "status" in j_data:
        if j_data["status"]:
            user.status = 1
        else:
            user.status = 0
    if "password" in j_data and j_data["password"] != "":  # 提交了修改密码
        local_salt = app.config.get("SALT")
        salt = hashlib.md5(str(time.time()).encode(encoding="UTF-8")).hexdigest()
        temp = j_data["password"] + local_salt + salt
        user.password = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
        user.salt = salt
    # 修改教师表
    tc = db.session.query(Teacher).filter_by(a_id=uid).first()
    tc.name = j_data["name"]
    tc.cid = j_data["cid"]
    tc.in_time = j_data["in_time"]
    tc.out_time = j_data["out_time"]
    tc.oa_time = j_data["oa_time"]
    tc.info = j_data["info"]
    db.session.commit()
    return r({}, 0, "修改成功")


# 获取id名字，用于前端选择
@users.route("/userdata/minlist", methods=["GET"])
def get_minlist():
    data = db.session.query(Teacher.id, Teacher.name).order_by(Teacher.id.desc()).all()
    re = []
    for x in data:
        re.append({"label": x[1], "value": x[0]})
    return r({"options": re})
