# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/account.py
# @LastTime         : 2022-05-07 13:58:36
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
import hashlib, time
from ..Models import Admin, Teacher, Student, Class, Score, db,Type,Department
from ..Utils import public_return as r

account = Blueprint("account", __name__)


@account.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "GET":
        data = {}
        return render_template("login.html", **data)
    username = request.form["username"]
    password = request.form["password"]
    local_salt = app.config.get("SECRET_KEY")
    temp = password + local_salt
    jmd5 = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    admin = db.session.query(Admin).filter_by(login=username).first()
    teacher = db.session.query(Teacher).filter_by(login=username).first()
    student = db.session.query(Student).filter_by(login=username).first()
    if student:
        level = 3
        user = student
    elif teacher:
        level = 2
        user = teacher
    elif admin:
        if admin.status == 0:
            return r({}, 1, "账号已锁定")
        level = 1
        user = admin
    else:
        return r({}, 1, "账号不存在")
    if jmd5 == user.password:
        session["uid"] = user.id
        session["name"] = user.name
        session["level"] = level
        session["logged_in"] = True
        session["login"] = user.login
        return redirect("/index")
        # return r({"is_login": 0}, 0, "欢迎登录：" + (user.name))
    else:
        return r({}, 1, "账号密码错误")


# 首页
@account.route("/index", methods=["GET"])
def index():
    data = {}
    return render_template("index.html", **data)


# 转到登录页
@account.route("/", methods=["GET"])
def init():
    return redirect("/login")


# 修改密码
@account.route("/account/editpwd", methods=["GET", "POST"])
def editpwd():
    if request.method == "GET":
        return render_template("/account/editpwd.html")
    data = request.get_data()
    j_data = json.loads(data)
    if j_data["pwd"] != j_data["pwd2"]:
        return r({}, 1, "两次输入的密码不一致")
    local_salt = app.config.get("SALT")
    salt = hashlib.md5(str(time.time()).encode(encoding="UTF-8")).hexdigest()
    temp = j_data["pwd"] + local_salt + salt
    pwd = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    db.session.query(Admin).filter(Admin.id == session["uid"]).update(
        {"salt": salt, "password": pwd}
    )
    status = db.session.commit()
    return r({"salt": salt, "status": status}, 0)


# 退出登录
@account.route("/account/logout", methods=["GET"])
def logout():
    session.clear()  # 删除所有
    return redirect("/login")


@account.route("/account")
def test():
    return render_template("/account.html")


## 获取账户信息
@account.route("/account/info", methods=["GET"])
def get_account():
    login = session.get("login")
    level = session.get("level")
    if not login or not level:
        return redirect("/login")
    if level == 1:
        t = db.session.query(Admin).filter_by(login=login).first()
        rt = {
            "id": t.id,
            "login": t.login,
            "password": t.password,
            "name": t.name,
            "status": t.status,
        }
    elif level == 2:
        t = db.session.query(Teacher).filter_by(login=login).first()
        data = (
        db.session.query(Department.id, Department.name)
        .order_by(Department.id.desc())
        .all()
    )
        re = [{"label": x[1], "value": x[0]} for x in data]
        data = db.session.query(Type.id, Type.name).order_by(Type.id.desc()).all()
        test = [{"label": x[1], "value": x[0]} for x in data]
        rt = {
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
            "departments": re,
            "types": test
        }
    elif level == 3:
        t = db.session.query(Student).filter_by(login=login).first()
        data = (
        db.session.query(Department.id, Department.name)
        .order_by(Department.id.desc())
        .all()
    )
        re = [{"label": x[1], "value": x[0]} for x in data]
        data = db.session.query(Type.id, Type.name).order_by(Type.id.desc()).all()
        test = [{"label": x[1], "value": x[0]} for x in data]
        rt = {
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
            "l_name": t.l_name,
            "l_phone": t.l_phone,
            "add": t.add,
            "subscribe_1": t.subscribe_1,
            "subscribe_2": t.subscribe_2,
            "subscribe_3": t.subscribe_3,
            "subscribe_4": t.subscribe_4,
            "subscribe_5": t.subscribe_5,
            "departments": re,
            "types": test
        }
    else:
        return r({}, 1, "请重新登录")
    return r(rt)
