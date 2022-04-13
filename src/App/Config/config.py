# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:24
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Config/config.py
# @LastTime         : 2022-04-10 18:15:02
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""


class Base(object):
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_RECORD_QUERIES = True
    # SQLALCHEMY_POOL_SIZE = 1024
    # SQLALCHEMY_POOL_TIMEOUT = 90
    # SQLALCHEMY_POOL_RECYCLE = 3
    # SQLALCHEMY_MAX_OVERFLOW = 1024
    SECRET_KEY = "e625fb438d13f7f6defbbacb1f0a6d84"


class Dev(Base):
    SQLALCHEMY_DATABASE_URI = (
        "mysql+pymysql://web:123456@101.132.135.180:3306/main?charset=utf8"
    )
    DEBUG = True


class Pro(Base):
    SQLALCHEMY_DATABASE_URI = (
        "mysql+pymysql://web:123456@101.132.135.180:3306/main?charset=utf8"
    )
    DEBUG = False
