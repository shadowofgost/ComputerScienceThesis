# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 11:17:23
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/App/Utils/public.py
# @LastTime         : 2022-04-12 22:05:34
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
import json
import decimal
from flask import current_app as app
import hashlib
from time import mktime, strptime


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        super(DecimalEncoder, self).default(o)


# 公共接口返回
def public_return(data, status=0, msg="", errors={}):
    if status == 0 and msg == "":
        msg = "请求成功"
    elif status == 1 and msg == "":
        msg = "请求失败"
    t = {}
    t["status"] = status
    t["msg"] = msg
    t["data"] = data
    if errors:
        # 表单验证
        t["errors"] = errors
        t["status"] = 422
        t["msg"] = "验证错误"
        pass
    return json.dumps(t, ensure_ascii=False, cls=DecimalEncoder)


def password_encode(password: str):
    local_salt = app.config.get("SECRET_KEY")
    temp = password + local_salt
    jmd5 = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
    return jmd5


def format_time(time: str):
    tmp = strptime(time, "%Y-%m-%d")
    time_result = int(mktime(tmp))
    return time_result
