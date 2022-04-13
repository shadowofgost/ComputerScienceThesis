# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 21:55:05
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/test.py
# @LastTime         : 2022-04-13 09:58:42
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
import hashlib, time
from faker import Faker

password = ""
print(len(password))
db_salt = "e625fb438d13f7f6defbbacb1f0a6d84"
temp = password + db_salt
print(len(temp))
jmd5 = hashlib.md5(temp.encode(encoding="UTF-8")).hexdigest()
print(jmd5)
print(len(jmd5))
