# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-05-01 14:52:31
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/image.py
# @LastTime         : 2022-05-01 15:07:28
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
import time
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
from ..Models import Admin, Teacher, Student, Class, Department, Type, db, Announcement
from ..Utils import public_return as r, password_encode, format_time
from .public import insert_validation_login, update_validation_login
from os import path

basedir = path.abspath(path.dirname(path.dirname(__file__)))

image = Blueprint("image", __name__)


@image.route("/api/upload/image", methods=["GET"])
def get_image():
    pass


@image.route("/api/upload/image", methods=["POST"])
def post_image():
    img = request.files.get("file")
    path = basedir + "/static/images/"
    file_path = path + img.filename
    img.save(file_path)
    return r({}, 0, "添加成功")
