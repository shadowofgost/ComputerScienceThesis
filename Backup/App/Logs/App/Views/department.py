# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-10 20:08:30
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/department.py
# @LastTime         : 2022-04-13 19:32:39
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import (
    Blueprint,
    render_template,
    request,
    json,
    current_app as app,
)
from ..Models import Department, Type, db
from ..Utils import public_return as r

department = Blueprint("department", __name__)


@department.route("/department")
def index():
    return render_template("/department.html")


## 获取
@department.route("/departmentlist", methods=["GET"])
def get_department():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    search = {}
    search["name"] = request.values.get("name")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    count = db.session.query(Department).count()
    db_tc = db.session.query(Department)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Department.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Department, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Department.id >= 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(Department, k).like("%" + v + "%")
        where.append(temp1)
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    print(tc)
    temp = [
        {
            "id": t.id,
            "id_parent": t.id_parent,
            "name": t.name,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@department.route("/departmentmany", methods=["GET"])
def get_many_department():
    tc = db.session.query(Department)
    count = db.session.query(Department).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "id_parent": t.id_parent,
            "name": t.name,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##增加
@department.route("/departmentlist", methods=["POST"])
def add_department():
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    department = (
        db.session.query(Department).filter(Department.name == j_data["name"]).first()
    )
    if department is not None:
        return r({}, 1, "名称已存在")
    ##验证系统
    cl = Department(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@department.route("/departmentmany", methods=["POST"])
def add_many_department():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id_parent": t["上级部门"],
                "name": t["部门名称"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加部门模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        department = (
            db.session.query(Department).filter(Department.name == i["name"]).first()
        )
        if department is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(Department, result_data)
            db.session.commit()
            return r({}, 0, "批量添加成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量添加未进行，出现部门名称重复的问题，以下的部门名称不符合要求：" + msg)


## 修改
@department.route("/departmentlist/<int:id>", methods=["PUT"])
def edit_department(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    department = (
        db.session.query(Department)
        .filter(Department.name == j_data["name"])
        .filter(Department.id != id)
        .first()
    )
    if department is not None:
        return r({}, 1, "名称已存在")
    try:
        db.session.query(department).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "修改失败,数据库异常")


##批量修改
@department.route("/departmentmany", methods=["PUT"])
def edit_many_department():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["ID"],
                "id_parent": t["上级部门"],
                "name": t["部门名称"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独修改部门模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        department = (
            db.session.query(Department)
            .filter(Department.name == i["name"])
            .filter(Department.id != i["id"])
            .first()
        )
        if department is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            for j in result_data:
                db.session.query(Department).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量修改成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量修改未进行，出现部门名称重复的问题，以下部门名称不符合插入要求：" + msg)


## 删除
@department.route("/departmentlist/<int:id>", methods=["DELETE"])
def delete_department(id):
    try:
        sql2 = db.session.query(Department).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@department.route("/departmentmany/<ids>", methods=["DELETE"])
def delete_many_department(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Department).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "批量删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "批量删除失败,部分id不存在")


##其他数据接口
@department.route("/department/minlist", methods=["GET"])
def get_minlist():
    data = (
        db.session.query(Department.id, Department.name)
        .order_by(Department.id.desc())
        .all()
    )
    re = [{"label": x[1], "value": x[0]} for x in data]
    return r({"departments": re})
