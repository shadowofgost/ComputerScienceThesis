# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-10 22:50:37
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Views/public.py
# @LastTime         : 2022-04-13 10:41:16
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""

from ..Models import Admin, Teacher, Student, Class, Department, Type, db
from ..Utils import public_return as r, password_encode, format_time


def insert_validation_login(j_data):
    student = db.session.query(Student).filter_by(login=j_data["login"]).first()
    admin = db.session.query(Admin).filter_by(login=j_data["login"]).first()
    teacher = db.session.query(Teacher).filter_by(login=j_data["login"]).first()
    if student is not None or admin is not None or teacher is not None:
        return True
    return False


def update_validation_login(j_data, id):
    student = (
        db.session.query(Student)
        .filter_by(login=j_data["login"])
        .filter(Student.id != id)
        .first()
    )
    admin = (
        db.session.query(Admin)
        .filter_by(login=j_data["login"])
        .filter(Admin.id != id)
        .first()
    )
    teacher = (
        db.session.query(Teacher)
        .filter_by(login=j_data["login"])
        .filter(Teacher.id != id)
        .first()
    )
    print(student, admin, teacher)
    if student is not None or admin is not None or teacher is not None:
        return True
    return False
