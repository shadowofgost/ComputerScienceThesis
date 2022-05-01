# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:25
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/run.py
# @LastTime         : 2022-05-01 16:05:39
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from App import create_app

# app = create_app()

if __name__ == "__main__":
    app = create_app("App.Config.Dev")
    app.run(host="127.0.0.1", port=8080)
