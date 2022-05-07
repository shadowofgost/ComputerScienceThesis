# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-12 23:38:28
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/type.py
# @LastTime         : 2022-05-07 14:21:48
# @LastAuthor       : Please set LastEditors
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import (
    Blueprint,
    render_template,
    request,
    json,
)
from ..Models import Department, Type, db
from ..Utils import public_return as r

type_crud = Blueprint("type_crud", __name__)


@type_crud.route("/type_crud")
def index():
    return render_template("/type_crud.html")


## 获取
@type_crud.route("/type_crudlist", methods=["GET"])
def get_type_crud():
    perPage = int(request.values.get("perPage"))
    page = int(request.values.get("page"))
    search = {}
    search["name"] = request.values.get("name")
    orderBy = request.values.get("orderBy")
    orderDir = request.values.get("orderDir")
    print(search)
    db_tc = db.session.query(Type)
    offset = (page - 1) * perPage
    rt = {}
    ids = []
    temp = []
    order = Type.id.asc()
    if orderBy and orderDir:  # 排序
        temp1 = getattr(Type, orderBy)
        order = getattr(temp1, orderDir)()
    where = [Type.id > 0]
    for k, v in search.items():
        if v is None:
            continue
        temp1 = getattr(Type, k).like("%" + v + "%")
        where.append(temp1)
    tc = db_tc.order_by(order).filter(*where).limit(perPage).offset(offset)  # .all()
    count = db.session.query(Type).filter(*where).count()
    temp = [
        {
            "id": t.id,
            "name": t.name,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##导出所有
@type_crud.route("/type_crudmany", methods=["GET"])
def get_many_type_crud():
    tc = db.session.query(Type)
    count = db.session.query(Type).count()
    rt = {}
    temp = [
        {
            "id": t.id,
            "name": t.name,
        }
        for t in tc
    ]
    rt["count"] = count
    rt["rows"] = temp
    # rt['hasNext']=1
    return r(rt)


##增加
@type_crud.route("/type_crudlist", methods=["POST"])
def add_type_crud():
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    type_crud = db.session.query(Type).filter(Type.name == j_data["name"]).first()
    if type_crud is not None:
        return r({}, 1, "名称已存在")
    ##验证系统
    cl = Type(**j_data)
    try:
        db.session.add(cl)
        db.session.commit()
    except:
        db.session.rollback()
        return r({}, 0, "添加失败，数据库异常")
    return r({}, 0, "添加成功")


##批量增加
@type_crud.route("/type_crudmany", methods=["POST"])
def add_many_type_crud():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "name": t["公告类别名称"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独添加分类类别模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        type_crud = db.session.query(Type).filter(Type.name == i["name"]).first()
        if type_crud is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            db.session.bulk_insert_mappings(Type, result_data)
            db.session.commit()
            return r({}, 0, "批量添加成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量添加未进行，出现分类类别名称重复的问题，以下的分类类别名称不符合要求：" + msg)


## 修改
@type_crud.route("/type_crudlist/<int:id>", methods=["PUT"])
def edit_type_crud(id):
    data = request.get_data()
    j_data = json.loads(data)
    ##验证系统
    type_crud = db.session.query(Type).filter(Type.name == j_data["name"]).filter(Type.id != id).first()
    if type_crud is not None:
        return r({}, 1, "login名称已存在")
    try:
        db.session.query(Type).filter_by(id=id).update(j_data)
        db.session.commit()
        return r({}, 0, "修改成功")
    except:
        db.session.rollback()
        return r({}, 1, "修改失败，数据库异常")


##批量修改
@type_crud.route("/type_crudmany", methods=["PUT"])
def edit_many_type_crud():
    data = request.get_data()
    j_data = json.loads(data)
    excel_data = j_data["excel"]
    try:
        insert_data = [
            {
                "id": t["ID"],
                "name": t["公告类别名称"],
            }
            for t in excel_data
        ]
    except:
        return r({}, 1, "请参考单独修改分类类别模板补充字段数据或者进行修正")
    result_data = []
    wrong_data = []
    for i in insert_data:
        type_crud = db.session.query(Type).filter(Type.name == i["name"]).filter(Type.id!=i["id"]).first()
        if type_crud is None:
            result_data.append(i)
        else:
            wrong_data.append(i["name"])
    if wrong_data == []:
        try:
            for j in result_data:
                db.session.query(Type).filter_by(id=j["id"]).update(j)
            db.session.commit()
            return r({}, 0, "批量修改成功")
        except:
            db.session.rollback()
            return r({}, 1, "数据库执行异常")
    else:
        msg = ",".join(wrong_data)
        return r({}, 1, "批量修改未进行，出现分类类别名重复的问题，以下分类类别的教师不符合插入要求：" + msg)


## 删除
@type_crud.route("/type_crudlist/<int:id>", methods=["DELETE"])
def delete_type_crud(id):
    try:
        sql2 = db.session.query(Type).filter_by(id=id).delete()
        db.session.commit()
        return r({}, 0, "删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "删除失败,部分id不存在")


##批量删除
@type_crud.route("/type_crudmany/<ids>", methods=["DELETE"])
def delete_many_type_crud(ids):
    id_list = ids.split(",")
    try:
        for i in id_list:
            sql2 = db.session.query(Type).filter_by(id=int(i)).delete()
        db.session.commit()
        return r({}, 0, "批量删除成功")
    except:
        db.session.rollback()
        return r({}, 1, "批量删除失败,数据库异常")


##其他数据接口
@type_crud.route("/type_crud/minlist", methods=["GET"])
def get_minlist():
    return r({}, 0, "调用成功")
