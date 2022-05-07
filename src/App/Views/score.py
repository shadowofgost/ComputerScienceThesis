# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 16:30:52
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/score.py
# @LastTime         : 2022-05-07 14:20:28
# @LastAuthor       : Please set LastEditors
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Blueprint, render_template, request, json, session
import time
from .public import insert_validation_login, update_validation_login
from ..Models import Class, Type, db, Teacher, Score, Student
from ..Utils import public_return as r, format_time

score = Blueprint("score", __name__)


@score.route("/score")
def index():
    return render_template("/score.html")


## 获取
@score.route("/scorelist", methods=["GET"])
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
    print(tc)
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
@score.route("/scoremany", methods=["GET"])
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


##增加
@score.route("/scorelist", methods=["POST"])
def add_score():
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    score = (
        db.session.query(Score)
        .filter(Score.student_id == j_data["student_id"])
        .filter(Score.class_id == j_data["class_id"])
        .first()
    )
    if score is not None:
        return r({}, 1, "成绩记录已存在")
    ##验证系统
    cl = Score(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@score.route("/scoremany", methods=["POST"])
def add_many_score():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "class_id": t["课程"],
                "student_id": t["学生"],
                "k_time": format_time(
                    t.get("考试时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "score": t["成绩"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加分数模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        score = (
            db.session.query(Score)
            .filter(Score.student_id == j_data["student_id"])
            .filter(Score.class_id == j_data["class_id"])
            .first()
        )
        if score is None:
            result_data.append(i)
        else:
            wrong_data.append(i["student_id"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(Score, result_data)
            db.session.commit()
            return r({}, 0, "批量添加成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量添加未进行，出现记录重复的问题，以下的课程名称不符合要求：" + msg)


## 修改
@score.route("/scorelist/<int:id>", methods=["PUT"])
def edit_score(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    score = (
        db.session.query(Score)
        .filter(Score.student_id == j_data["student_id"])
        .filter(Score.class_id == j_data["class_id"])
        .filter(Score.id != id)
        .first()
    )
    if score is not None:
        return r({}, 1, "课程名称已存在")
    try:
        db.session.query(Score).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "修改失败,部分id不存在")


##批量修改
@score.route("/scoremany", methods=["PUT"])
def edit_many_score():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["ID"],
                "class_id": t["课程"],
                "student_id": t["学生"],
                "k_time": format_time(
                    t.get("考试时间", time.strftime("%Y-%m-%d", time.localtime()))
                ),
                "score": t["成绩"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独修改分数模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        score = (
            db.session.query(Score)
            .filter(Score.student_id == i["student_id"])
            .filter(Score.class_id == i["class_id"])
            .filter(Score.id != i["id"])
            .first()
        )
        if score is None:
            result_data.append(i)
        else:
            wrong_data.append(i["student_id"])
    if wrong_data == []:
        try:
            for j in result_data:
                db.session.query(Score).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量修改成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量修改未进行，出现分数记录重复的问题，以下分数字段的学生不符合插入要求：" + msg)


## 删除
@score.route("/scorelist/<int:id>", methods=["DELETE"])
def delete_score(id):
    try:
        sql2 = db.session.query(Score).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@score.route("/scoremany/<ids>", methods=["DELETE"])
def delete_many_score(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Score).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "批量删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "批量删除失败,部分id不存在")


##其他数据接口
@score.route("/score/minlist", methods=["GET"])
def get_minlist():
    data = db.session.query(Class.id, Class.name).order_by(Class.id.desc()).all()
    re = [{"label": x[1], "value": x[0]} for x in data]
    data_stu = (
        db.session.query(Student.id, Student.name).order_by(Student.id.desc()).all()
    )
    re_stu = [{"label": x[1], "value": x[0]} for x in data_stu]
    return r({"classes": re, "students": re_stu})
