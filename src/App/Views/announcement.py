# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-12 23:38:20
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/announcement.py
# @LastTime         : 2022-04-12 23:51:09
# @LastAuthor       : Albert Wang
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

announcement = Blueprint("announcement", __name__)


@announcement.route("/announcement")
def index():
    return render_template("/announcement.html")


## 获取老师
@announcement.route("/announcementlist", methods=["GET"])
def get_announcement():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    in_time = request.values.get("in_time")
    search = {}
    search["name"] = request.values.get("name")
    search["code"] = request.values.get("code")
    search["cid"] = request.values.get("cid")
    search["login"] = request.values.get("login")
    search["phone"] = request.values.get("phone")
    search["email"] = request.values.get("email")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    count = db.session.query(announcement).count()
    db_tc = db.session.query(announcement)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = announcement.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(announcement, orderBy)
        order = getattr(temp1, orderDir)()
    where = [announcement.id > 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(announcement, k).like("%" + v + "%")
        where.append(temp1)
    if in_time:
        temptime = in_time.split(",")
        where.append(announcement.in_time >= temptime[0])
        where.append(announcement.in_time <= temptime[1])
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    print(tc)
    temp = [
        {
            "id": t.id,
            "department_id": t.department_id,
            "login": t.login,
            "password": t.password,
            "name": t.name,
            "code": t.code,
            "cid": t.cid,
            "phone": t.phone,
            "email": t.email,
            "in_time": t.in_time,
            "out_time": t.out_time,
            "info": t.info,
            "subscribe_1": t.subscribe_1,
            "subscribe_2": t.subscribe_2,
            "subscribe_3": t.subscribe_3,
            "subscribe_4": t.subscribe_4,
            "subscribe_5": t.subscribe_5,
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
            "login": t.login,
            "password": t.password,
            "name": t.name,
            "code": t.code,
            "cid": t.cid,
            "phone": t.phone,
            "email": t.email,
            "in_time": t.in_time,
            "out_time": t.out_time,
            "info": t.info,
            "subscribe_1": t.subscribe_1,
            "subscribe_2": t.subscribe_2,
            "subscribe_3": t.subscribe_3,
            "subscribe_4": t.subscribe_4,
            "subscribe_5": t.subscribe_5,
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
    ##验证系统
    if update_validation_login(j_data, id):
        return r({}, 1, "login名称已存在")
    j_data["password"] = password_encode(j_data["password"])
    ##验证系统
    cl = announcement(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@announcement.route("/announcementmany", methods=["POST"])
def add_many_announcement():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "department_id": t["所在部门/专业"],
                "login": t["登录名"],
                "password": t["密码(16位)"],
                "name": t["姓名"],
                "code": t["学号"],
                "cid": t["身份证"],
                "phone": t["电话号码"],
                "email": t["邮箱地址"],
                "in_time": format_time(
                    t.get("入学时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "out_time": t.get("离校时间", time.time()),
                "info": t.get("住址", ""),
                "subscribe_1": t.get("订阅分类1", 1),
                "subscribe_2": t.get("订阅分类2", 1),
                "subscribe_3": t.get("订阅分类3", 1),
                "subscribe_4": t.get("订阅分类4", 1),
                "subscribe_5": t.get("订阅分类5", 1),
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加教师模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        if insert_validation_login(i) and len(i["password"]) <= 16:
            result_data.append(i)
        else:
            wrong_data.append(i["login"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(announcement, result_data)
            db.session.commit()
            return r({}, 0, "批量插入成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量插入未进行，出现登录名重复的问题，以下登录名的教师不符合插入要求：" + msg)


## 修改
@announcement.route("/announcementlist/<int:id>", methods=["PUT"])
def edit_announcement(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    if update_validation_login(j_data, id):
        return r({}, 1, "login名称已存在")
    user_current = db.session.query(announcement).filter_by(id=id).first()
    if user_current.password == j_data["password"]:
        pass
    else:
        j_data["password"] = password_encode(j_data["password"])
    ##验证系统
    try:
        db.session.query(announcement).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量修改
@announcement.route("/announcementmany", methods=["PUT"])
def edit_many_announcement():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["id"],
                "department_id": t["所在部门/专业"],
                "login": t["登录名"],
                "password": t["密码(16位)"],
                "name": t["姓名"],
                "code": t["学号"],
                "cid": t["身份证"],
                "phone": t["电话号码"],
                "email": t["邮箱地址"],
                "in_time": format_time(
                    t.get("入学时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "out_time": t.get("离校时间", time.time()),
                "info": t.get("住址", ""),
                "subscribe_1": t.get("订阅分类1", 1),
                "subscribe_2": t.get("订阅分类2", 1),
                "subscribe_3": t.get("订阅分类3", 1),
                "subscribe_4": t.get("订阅分类4", 1),
                "subscribe_5": t.get("订阅分类5", 1),
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加教师模板补充字段数据或者进行修正")
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
                db.session.query(announcement).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量插入成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量更新未进行，出现登录名重复的问题，以下登录名的教师不符合插入要求：" + msg)


## 删除
@announcement.route("/announcementlist/<int:id>", methods=["DELETE"])
def delete_announcement(id):
    try:
        sql2 = db.session.query(announcement).filter_by(id=id).delete()
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
            sql2 = db.session.query(announcement).filter_by(id=int(i)).delete()
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
