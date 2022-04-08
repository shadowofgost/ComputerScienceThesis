# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/Views/student.py
# @LastTime         : 2022-04-08 15:21:25
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
from ..Models import Admin, Teacher, Student, Class, Score, db
from ..Utils import public_return as r

student = Blueprint("student", __name__)


@student.route("/student")
def index():
    return render_template("/student.html")


@student.route("/student", methods=["POST"])
def add_class():
    data = request.get_data()
    j_data = json.loads(data)
    user = db.session.query(Student).filter_by(cid=j_data["cid"]).first()
    if user is not None:
        return r({}, 0, "", {"cid": "身份证已经存在"})
    j_data.setdefault("l2_name", "")
    j_data.setdefault("l2_phone", "")
    j_data.setdefault("add", "")
    j_data.setdefault("code", "")
    j_data.setdefault("info", "")
    cl = Student(
        j_data["class_id"],
        j_data["name"],
        j_data["code"],
        j_data["cid"],
        j_data["in_time"],
        0,
        j_data["info"],
        j_data["l_name"],
        j_data["l_phone"],
        j_data["l2_name"],
        j_data["l2_phone"],
        j_data["add"],
    )
    db.session.add(cl)
    db.session.commit()
    set_class_count(j_data["class_id"])
    return r({}, 0, "添加成功")


# 获取用户
@student.route("/studentlist", methods=["GET"])
def get_student():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    in_time = request.values.get("in_time")
    search = {}
    search["name"] = request.values.get("name")
    search["t_id"] = request.values.get("t_id")
    search["code"] = request.values.get("code")
    search["cid"] = request.values.get("cid")
    search["l_name"] = request.values.get("l_name")
    search["l_phone"] = request.values.get("l_phone")
    search["l2_name"] = request.values.get("l2_name")
    search["l2_phone"] = request.values.get("l2_phone")
    search["add"] = request.values.get("add")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")

    count = db.session.query(Student).count()
    db_tc = db.session.query(Student)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Student.id.desc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Student, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Student.id > 0]
    for k, v in search.items():
        if v:
            temp1 = getattr(Student, k).like("%" + v + "%")
            where.append(temp1)

    if in_time:
        temptime = in_time.split(",")
        where.append(Student.in_time >= temptime[0])
        where.append(Student.in_time <= temptime[1])
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    print(tc)
    for t in tc:
        temp.append(
            {
                "id": t.id,
                "class_id": t.class_id,
                "name": t.name,
                "code": t.code,
                "cid": t.cid,
                "in_time": t.in_time,
                "out_time": t.out_time,
                "info": t.info,
                "l_name": t.l_name,
                "l_phone": t.l_phone,
                "l2_name": t.l2_name,
                "l2_phone": t.l2_phone,
                "add": t.add,
            }
        )

    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)
    pass


# 删除
@student.route("/studentlist/<int:cid>", methods=["DELETE"])
def delete_user(cid):
    tc = db.session.query(Student).filter_by(id=cid).first()
    sql2 = db.session.query(Student).filter_by(id=cid).delete()
    db.session.commit()
    set_class_count(tc.class_id)
    return r({}, 0, "删除成功")


# 修改
@student.route("/studentlist/<int:cid>", methods=["PUT"])
def edit_user(cid):
    data = request.get_data()
    j_data = json.loads(data)
    user = (
        db.session.query(Student)
        .filter_by(cid=j_data["cid"])
        .filter(Student.id != cid)
        .first()
    )
    if user is not None:
        return r({}, 0, "", {"cid": "身份证已经存在"})
    tc = db.session.query(Student).filter_by(id=cid).first()
    old_class_id = 0
    flag = False
    if tc.class_id != j_data["class_id"]:
        old_class_id = tc.class_id
        flag = True
        pass
    tc.name = (j_data["name"],)
    tc.class_id = (j_data["class_id"],)
    tc.code = (j_data["code"],)
    tc.cid = (j_data["cid"],)
    tc.in_time = (j_data["in_time"],)
    tc.out_time = (j_data["out_time"],)
    tc.l_name = (j_data["l_name"],)
    tc.l_phone = (j_data["l_phone"],)
    tc.l2_name = (j_data["l2_name"],)
    tc.l2_phone = (j_data["l2_phone"],)
    tc.add = (j_data["add"],)
    tc.info = (j_data["info"],)
    db.session.commit()
    if flag:
        set_class_count(j_data["class_id"])
        if old_class_id > 0:
            set_class_count(old_class_id)
    return r({}, 0, "修改成功")


def set_class_count(class_id):
    if class_id > 0:
        count = db.session.query(Student).filter_by(class_id=class_id).count()
        tc = db.session.query(Class).filter_by(id=class_id).first()
        tc.user_count = count
        db.session.commit()
    return True
