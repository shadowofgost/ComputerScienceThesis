# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/admin.py
# @LastTime         : 2022-05-07 14:17:20
# @LastAuthor       : Please set LastEditors
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
from ..Models import Admin, Teacher, Student, Class, Department, Type, db
from ..Utils import public_return as r, password_encode, format_time
from .public import insert_validation_login, update_validation_login

admin = Blueprint("admin", __name__)


@admin.route("/admin")
def index():
    return render_template("/admin.html")


## 获取
@admin.route("/adminlist", methods=["GET"])
def get_admin():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    search = {}
    search["name"] = request.values.get("name")
    search["login"] = request.values.get("login")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    db_tc = db.session.query(Admin)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Admin.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Admin, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Admin.id > 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(Admin, k).like("%" + v + "%")
        where.append(temp1)
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    count = db.session.query(Admin).filter(*where).count()
    temp = [
        {
            "id": t.id,
            "login": t.login,
            "password": t.password,
            "name": t.name,
            "status": t.status,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@admin.route("/adminmany", methods=["GET"])
def get_many_admin():
    tc = db.session.query(Admin)
    count = db.session.query(Admin).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "login": t.login,
            "password": t.password,
            "name": t.name,
            "status": t.status,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##增加
@admin.route("/adminlist", methods=["POST"])
def add_admin():
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    if update_validation_login(j_data, id):
        return r({}, 1, "login名称已存在")
    if len(j_data["password"]) > 16:
        return r({}, 1, "password长度不能超过16")
    j_data["password"] = password_encode(j_data["password"])
    ##验证系统
    cl = Admin(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@admin.route("/adminmany", methods=["POST"])
def add_many_admin():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "login": t["登录名"],
                "password": t["密码(16位)"],
                "name": t["姓名"],
                "status": t["状态"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加管理员模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        if insert_validation_login(i) and len(i["password"]) <= 16:
            result_data.append(i)
        else:
            wrong_data.append(i["login"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(Admin, result_data)
            db.session.commit()
            return r({}, 0, "批量添加成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量添加未进行，出现登录名重复或者密码长度超过16位的问题，以下登录名的管理员不符合插入要求：" + msg)


## 修改
@admin.route("/adminlist/<int:id>", methods=["PUT"])
def edit_admin(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    if update_validation_login(j_data, id):
        return r({}, 1, "login名称已存在")
    user_current = db.session.query(Admin).filter_by(id=id).first()
    if user_current.password == j_data["password"]:
        pass
    elif len(j_data["password"]) <= 16:
        j_data["password"] = password_encode(j_data["password"])
    else:
        return r({}, 1, "密码长度超过16位")
    ##验证系统
    try:
        db.session.query(Admin).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "修改失败,数据库执行异常")


##批量修改
@admin.route("/adminmany", methods=["PUT"])
def edit_many_admin():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["id"],
                "login": t["登录名"],
                "password": t["密码(16位)"],
                "name": t["姓名"],
                "status": t["状态"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独修改管理员模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        if insert_validation_login(i) and len(i["password"]) <= 16:
            result_data.append(i)
        else:
            wrong_data.append(i["login"])
    if wrong_data == []:
        try:
            for j in result_data:
                db.session.query(Admin).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量更新成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量更新未进行，出现登录名重复或者密码长度超过16位的问题，以下登录名的管理员不符合插入要求：" + msg)


## 删除
@admin.route("/adminlist/<int:id>", methods=["DELETE"])
def delete_admin(id):
    try:
        sql2 = db.session.query(Admin).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@admin.route("/adminmany/<ids>", methods=["DELETE"])
def delete_many_admin(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Admin).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "批量删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "批量删除失败,部分id不存在，数据库异常")


##其他数据接口
@admin.route("/admin/minlist", methods=["GET"])
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
