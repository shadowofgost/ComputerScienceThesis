# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/account.py
# @LastTime         : 2022-04-12 23:55:37
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
