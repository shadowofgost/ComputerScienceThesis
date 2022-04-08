# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/Views/account.py
# @LastTime         : 2022-04-08 15:24:01
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
    data = request.get_data()
    j_data = json.loads(data)
    user = db.session.query(Admin).filter_by(admin=j_data["admin"]).first()
    if user is not None:
        if user.status == 0:
            return r({}, 1, "账号已锁定")
        local_salt = app.config.get("SALT")
        db_salt = user.salt
        temp = j_data["pwd"] + local_salt + db_salt
        jmd5 = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
        if jmd5 == user.password:
            session["uid"] = user.id
            session["name"] = user.name
            session["level"] = user.level
            session["logged_in"] = True
            return r({"is_login": 0}, 0, "欢迎登录：" + (user.name))
    return r({}, 1, "账号密码错误")


# 首页
@account.route("/index", methods=["GET"])
def index():
    data = {}
    return render_template("index.html", **data)


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
