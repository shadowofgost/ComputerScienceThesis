# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/myclass.py
# @LastTime         : 2022-05-01 18:03:50
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Blueprint, render_template, request, json, session
import time
from ..Models import Class, Type, db, Teacher, Score
from ..Utils import public_return as r, format_time

myclass = Blueprint("myclass", __name__)


@myclass.route("/myclass")
def index():
    return render_template("/myclass.html")


## 获取
@myclass.route("/myclasslist", methods=["GET"])
def get_myclass():
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
        temp1 = getattr(myclass, k).like("%" + v + "%")
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
@myclass.route("/myclassmany", methods=["GET"])
def get_many_myclass():
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


##增加
@myclass.route("/myclasslist", methods=["POST"])
def add_myclass():
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    myclass = db.session.query(Class).filter(Class.name == j_data["name"]).first()
    if myclass is not None:
        return r({}, 1, "课程已存在")
    ##验证系统
    cl = Class(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 1, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@myclass.route("/myclassmany", methods=["POST"])
def add_many_myclass():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "teacher_id": t["授课教师"],
                "name": t["课程名称"],
                "begintime": format_time(
                    t.get("课程开始时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "endtime": format_time(
                    t.get("课程结束时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加课程模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        myclass = db.session.query(Class).filter(Class.name == i["name"]).first()
        if myclass is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(Class, result_data)
            db.session.commit()
            return r({}, 0, "批量添加成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量添加未进行，出现课程名称重复的问题，以下的课程名称不符合要求：" + msg)


## 修改
@myclass.route("/myclasslist/<int:id>", methods=["PUT"])
def edit_myclass(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    myclass = (
        db.session.query(Class)
        .filter(Class.name == j_data["name"])
        .filter(Class.id != id)
        .first()
    )
    if myclass is not None:
        return r({}, 1, "课程名称已存在")
    try:
        db.session.query(myclass).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "修改失败,数据库异常")


##批量修改
@myclass.route("/myclassmany", methods=["PUT"])
def edit_many_myclass():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["ID"],
                "teacher_id": t["教师"],
                "name": t["课程名称"],
                "begintime": format_time(
                    t.get("课程开始时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "endtime": format_time(
                    t.get("课程结束时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独修改课程模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        myclass = (
            db.session.query(Class)
            .filter(Class.name == i["name"])
            .filter(Class.id != i["id"])
            .first()
        )
        if myclass is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            for j in result_data:
                db.session.query(Class).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量修改成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量更新未进行，出现课程名称重复的问题，以下部门名称不符合插入要求：" + msg)


## 删除
@myclass.route("/myclasslist/<int:id>", methods=["DELETE"])
def delete_myclass(id):
    try:
        sql2 = db.session.query(Class).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@myclass.route("/myclassmany/<ids>", methods=["DELETE"])
def delete_many_myclass(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Class).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "批量删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "批量删除失败,部分id不存在")


##其他数据接口
@myclass.route("/myclass/minlist", methods=["GET"])
def get_minlist():
    data = db.session.query(Teacher.id, Teacher.name).order_by(Teacher.id.desc()).all()
    re = [{"label": x[1], "value": x[0]} for x in data]
    return r({"teachers": re})
