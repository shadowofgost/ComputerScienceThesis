# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
# @Time             : 2022-03-25 15:44:54
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/Code/xuemc_win/web/app.py
# @LastAuthor       : Albert Wang
# @LastTime         : 2022-03-26 01:56:09
# @Software         : Vscode
"""
import sys
import os

sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__))))
sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))

from flask import Flask, request
from flask_restful import Resource, Api
app = Flask(__name__)
api = Api(app)
app.debug = True

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://xuemc:123456@101.132.135.180/DataBase'
app.config['WTF_CSRF_ENABLED'] = True
app.config['SECRET_KEY'] = 'you-will-never-..guess'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
