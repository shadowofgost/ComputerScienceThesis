# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-03-29 16:22:07
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/Api/Image.py
# @LastTime         : 2022-03-29 16:22:08
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
import restful
def SetDefaultImage(obj):
    if restful.ITEM_BULLETINIMAGES in obj:
        listimage = obj.get(restful.ITEM_BULLETINIMAGES, [])
        if len(listimage) <= 0:
            listimage.append(
                {restful.ITEM_ID: 0, restful.ITEM_FILE: "default_bulletinimage.jpg"}
            )

    if restful.ITEM_INSTITUTIONIMAGES in obj:
        listimage = obj.get(restful.ITEM_INSTITUTIONIMAGES, [])
        if len(listimage) <= 0:
            listimage.append(
                {restful.ITEM_ID: 0, restful.ITEM_FILE: "default_institutionimage.jpg"}
            )

    if restful.ITEM_SCHOOLIMAGES in obj:
        listimage = obj.get(restful.ITEM_SCHOOLIMAGES, [])
        if len(listimage) <= 0:
            listimage.append(
                {restful.ITEM_ID: 0, restful.ITEM_FILE: "default_schoolimage.jpg"}
            )
