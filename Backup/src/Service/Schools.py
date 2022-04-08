# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-03-29 16:09:56
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/Service/Schools.py
# @LastTime         : 2022-03-29 17:11:04
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
from .forms import SchoolForm
from DataBase import orm
def school_detail(school_id: int, q: int, form: SchoolForm):
    form.area_id.choices = logic.g_choices_area
    form.schooltype_id.choices = logic.g_choices_schooltype
    form.feature_ids.choices = logic.g_choices_feature
    #    form.message = form.data
    if request.method == "POST" and form.validate():
        print("longitude:", form.longitude.data)
        if form.id.data:
            school = orm.School.query.get(int(form.id.data))
            school.name = form.name.data
            school.area_id = form.area_id.data
            school.teachdesc = form.teachdesc.data
            school.address = form.address.data
            school.schooltype_id = form.schooltype_id.data
            school.website = form.website.data
            school.distinguish = form.distinguish.data
            school.leisure = form.leisure.data
            school.threashold = form.threashold.data
            school.partner = form.partner.data
            school.artsource = form.artsource.data
            school.feedesc = form.feedesc.data
            school.longitude = form.longitude.data
            school.latitude = form.latitude.data
            orm.db.session.commit()
        else:
            school = orm.School(
                form.name.data,
                form.area_id.data,
                form.teachdesc.data,
                form.address.data,
                form.schooltype_id.data,
                form.website.data,
                form.distinguish.data,
                form.leisure.data,
                form.threashold.data,
                form.partner.data,
                form.artsource.data,
                form.feedesc.data,
                form.longitude.data,
                form.latitude.data,
            )
            orm.db.session.add(school)
            orm.db.session.commit()
            form.id.data = school.id

        logic.SetSchoolFeatures(int(form.id.data), form.feature_ids.data)

        if "upload" in request.form:
            file = request.files["image"]
            if file:
                file_server = str(uuid.uuid1()) + Util.file_extension(file.filename)
                pathfile_server = os.path.join(UPLOAD_PATH, file_server)
                file.save(pathfile_server)
                if os.stat(pathfile_server).st_size < 1 * 1024 * 1024:
                    schoolimage = orm.Schoolimage(school.id, file_server)
                    orm.db.session.merge(schoolimage)
                    orm.db.session.commit()
                else:
                    os.remove(pathfile_server)
        else:
            return redirect(url_for("view_school"))
    elif request.method == "GET" and school_id:
        form = logic.GetSchoolFormById(school_id)
        logic.LoadBasePageInfo("修改学校", "输入并确定", form)
    else:
        logic.LoadBasePageInfo("新建学校", "输入并确定", form)

    if form.id.data:
        school = orm.School.query.get(int(form.id.data))
        if school:
            form.schoolimages = school.schoolimages
