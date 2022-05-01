# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-04-08 21:55:05
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/test.py
# @LastTime         : 2022-05-01 16:41:15
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from unittest import result


with open("test.txt", "r") as f:
    test = f.readlines()
result = [str(i.strip()) for i in test]
print(list(set(result)))
result = [
    "酒店管理信息系统",
    "CAD/CAM",
    "CAD/CAM综合实训",
    "C语言程序设计",
    "Excel在财务中的应用",
    "Excel数据处理与分析",
    "JAVA程序设计",
    "MATLAB的工程应用",
    "三维计算机辅助设计",
    "专业模拟实习",
    "中级财务",
    "会计学",
    "信息安全技术",
    "制造执行系统技术应用",
    "商业图形图像处理",
    "商业文案处理",
    "国际贸易实务",
    "审计学",
    "工程机械制图",
    "心理实验编程",
    "数据处理实用技术",
    "数据库原理与设计",
    "数据库原理综合实训",
    "数据挖掘",
    "数据结构",
    "数控加工工艺与编程",
    "服装CAD",
    "电子CAD",
    "电子商务案例分析",
    "电气工程CAD制图",
    "电气设计",
    "社会科学统计软件应用",
    "移动应用开发",
    "程序设计基础",
    "程序设计综合实训",
    "网络媒体设计",
    "网络程序设计及应用",
    "虚拟仪器设计",
    "计算机基础",
    "计算机辅助服装设计应用",
    "计算机辅助设计",
    "跨境电商实务",
    "软件测试与质量保证",
    "面向对象程序设计",
]
print(len(result))
