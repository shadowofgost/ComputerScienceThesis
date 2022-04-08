# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 15:18:57
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/__init__.py
# @LastTime         : 2022-04-08 15:21:52
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Flask, session, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from .Views import account, users, myclass, student, score


def create_app():
    app = Flask(__name__)
    app.config.from_object("App.Config.Dev")
    db = SQLAlchemy(app)
    app.register_blueprint(account)
    app.register_blueprint(users)
    app.register_blueprint(myclass)
    app.register_blueprint(student)
    app.register_blueprint(score)

    @app.before_request
    def check_need_login():  # 判断登录
        # print(request.endpoint)
        if "logged_in" not in session and request.endpoint not in (
            "account.login",
            "static",
        ):
            return redirect("/login")

    return app
