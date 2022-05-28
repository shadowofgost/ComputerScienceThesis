# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 15:18:57
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/__init__.py
# @LastTime         : 2022-04-13 15:37:30
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from flask import Flask, session, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from .Views import (
    account,
    myclass,
    student,
    score,
    teacher,
    admin,
    department,
    type_crud,
    announcement,
)


def create_app(config: str = "App.Config.Pro"):
    app = Flask(__name__)
    app.config.from_object(config)
    db = SQLAlchemy(app)
    app.register_blueprint(account)
    app.register_blueprint(myclass)
    app.register_blueprint(student)
    app.register_blueprint(score)
    app.register_blueprint(teacher)
    app.register_blueprint(admin)
    app.register_blueprint(department)
    app.register_blueprint(type_crud)
    app.register_blueprint(announcement)

    @app.before_request
    def check_need_login():  # 判断登录
        # print(request.endpoint)
        if "logged_in" not in session and request.endpoint not in (
            "account.login",
            "static",
        ):
            return redirect("/login")

    return app
