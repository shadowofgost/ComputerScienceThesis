# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
# @Time             : 2022-03-25 21:50:45
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/Code/xuemc_win/main.py
# @LastAuthor       : Albert Wang
# @LastTime         : 2022-03-26 11:09:58
# @Software         : Vscode
"""
from run import app
import uvicorn

if __name__ == "__main__":
    uvicorn.run(
        app="main:app",
        host="127.0.0.1",
        port=5010,
        reload=True,
        access_log=True,
    )
