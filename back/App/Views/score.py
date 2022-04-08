# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/Views/score.py
# @LastTime         : 2022-04-08 15:21:20
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
    Response,
)
import hashlib, time
from ..Models import Admin, Teacher, Student, Class, Score, db
from ..Utils import public_return as r

# import csv
score = Blueprint("score", __name__)


@score.route("/score")
def index():
    return render_template("/score.html")


# 下载打分模板
@score.route("/scorelist/download/<int:cid>")
def download(cid):
    data = db.session.query(Student).filter_by(class_id=cid).all()
    csv = "ID,姓名,身份证,学号,分数\n"
    for x in data:
        id_S = str(x.id)
        csv = csv + id_S + "," + x.name + "," + x.cid + "\t," + x.code + "\t,0\n"
    return Response(
        csv,
        mimetype="text/csv",
        headers={"Content-disposition": "attachment; filename=student.csv"},
    )


@score.route("/score", methods=["POST"])
def add_class():
    class_id = request.values.get("class_id")
    kskc = request.values.get("kskc")
    k_time = request.values.get("k_time")
    file = request.files["file"]
    if not file:
        return r({}, 1, "没有上传文件")
    file_contents = file.stream.read().decode("utf-8", "ignore")
    li = file_contents.split("\n")
    del li[0]
    for x in li:
        data = x.split(",")
        if isinstance(data, list) and is_number(data[0]) and len(data) == 5:
            uid = int(data[0])
            sc = float(data[4])
            db.session.add(Score(uid, sc, k_time, kskc))
    db.session.commit()
    return r({}, 0, "成功")


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        pass

    try:
        import unicodedata

        unicodedata.numeric(s)
        return True
    except (TypeError, ValueError):
        pass
    return False


# 获取用户
@score.route("/scorelist", methods=["GET"])
def get_score():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    k_time = request.values.get("k_time")
    score = request.values.get("score")
    stu_search = {}
    stu_search["name"] = request.values.get("name")
    stu_search["code"] = request.values.get("code")
    stu_search["c_id"] = request.values.get("c_id")
    sco_search = {}
    sco_search["kskc"] = request.values.get("kskc")
    class_id = request.values.get("class_id")

    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")

    count = db.session.query(Score).count()
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Score.id.desc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Score, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Score.id > 0]
    for k, v in sco_search.items():
        if v:
            temp1 = getattr(Score, k).like("%" + v + "%")
            where.append(temp1)
    # 搜索了学生 start
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
        where.append(Score.uid.in_(tempsid))
    # 搜索了学生 end
    # 搜索了班级 start
    if class_id:
        sids = db.session.query(Student.id).filter(Student.class_id == class_id).all()
        tempsid = []
        for x in sids:
            tempsid.append(x[0])
            pass
        where.append(Score.uid.in_(tempsid))
        pass
    # 搜索了班级 end

    db_tc = db.session.query(Score)
    if k_time:
        temptime = k_time.split(",")
        where.append(Score.k_time >= temptime[0])
        where.append(Score.k_time <= temptime[1])
    if score:
        temptime = score.split(",")
        where.append(Score.score >= temptime[0])
        where.append(Score.score <= temptime[1])
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset).all()
    ids = []
    for t in tc:
        ids.append(t.uid)
    stu = db.session.query(Student).filter(Student.id.in_(ids)).all()

    data = db.session.query(Class.id, Class.name).order_by(Class.id.desc()).all()
    re = {}
    for x in data:
        re[x[0]] = x[1]

    for t in tc:
        for u in stu:
            if u.id == t.uid:
                temp.append(
                    {
                        "id": t.id,
                        "uid": t.uid,
                        "k_time": t.k_time,
                        "score": t.score,
                        "kskc": t.kskc,
                        "name": u.name,
                        "cid": u.cid,
                        "code": u.code,
                        "class_id": re[u.class_id],
                    }
                )
    rt["count"] = count
    rt["rows"] = temp
    # print(rt)
    return r(rt, 0, "删除成功")


# 删除
@score.route("/scorelist/<int:cid>", methods=["DELETE"])
def delete_user(cid):
    sql2 = db.session.query(Score).filter_by(id=cid).delete()
    db.session.commit()
    return r({}, 0, "删除成功")


# 修改
@score.route("/scorelist/<int:cid>", methods=["PUT"])
def edit_user(cid):
    data = request.get_data()
    j_data = json.loads(data)
    tc = db.session.query(Score).filter_by(id=cid).first()
    tc.score = (j_data["score"],)
    db.session.commit()
    return r({}, 0, "修改成功")
