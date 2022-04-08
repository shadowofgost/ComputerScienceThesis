# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/back/App/config.py
# @LastTime         : 2022-04-08 15:14:38
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""


class Base(object):
    SQLALCHEMY_DATABASE_URI = (
        "mysql+pymysql://web:123456@101.132.135.180:3306/ComputerScienceThsis?charset=utf8"
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_RECORD_QUERIES = True
    SQLALCHEMY_POOL_SIZE = 1024
    SQLALCHEMY_POOL_TIMEOUT = 90
    SQLALCHEMY_POOL_RECYCLE = 3
    SQLALCHEMY_MAX_OVERFLOW = 1024
    SALT = "IloveYou"  # 加密盐
    SECRET_KEY = "b1bb9c4fe0d5984d26e13d4a091199b2"


class Dev(Base):
    DEBUG = True


class Pro(Base):
    DEBUG = False
