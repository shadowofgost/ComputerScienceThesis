# cython: language_level=3
#!./env python
# -*- coding: utf-8 -*-
"""
# @Author           : Albert Wang
# @Time             : 2022-03-28 22:56:23
# @Description      :
# @Email            : shadowofgost@outlook.com
# @FilePath         : /ComputerScienceThesis/src/Api/views.py
# @LastTime         : 2022-03-28 23:54:25
# @LastAuthor       : Albert Wang
# @Software         : Vscode
# @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
"""
# -*- coding: utf-8 -*-
import os
import uuid
import datetime
from flask import render_template, send_from_directory, session, redirect, url_for
from flask_login import login_user, logout_user, current_user, login_required
from flask import Markup, request
from app import app
from forms import SchoolForm, PageInfo, InstitutionForm, BulletinForm, AccountForm
from DataBase import orm
from Utils import Util
import restful, logic


@app.route("/bd/web/<path:path>")
def rootDir_web(path):
    index_key = path.rfind("py")
    if index_key > (len(path) - 4):
        return redirect(url_for("view_schools"))
    return send_from_directory(os.path.join(app.root_path, "."), path)


UPLOAD_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files/")


@app.route("/")
def rootDir():
    return redirect(url_for("view_schools"))


@app.route("/bd/view_school", methods=["GET", "POST"])
def view_school():
    school_id = request.args.get("id")
    q = request.args.get("q")
    if q is not None:
        return redirect(url_for("view_schools", page=1, q=q))
    form = SchoolForm(request.form)
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
        form.school = school
        if form.school:
            form.schoolimages = form.school.schoolimages

    return render_template("view_school.html", form=form)


@app.route("/bd/view_schools", methods=["GET", "POST"])
def view_schools():
    page = request.args.get("page", 1)
    q = request.args.get("q")
    schools = restful.GetSchools(int(page), q)
    if restful.ITEM_OBJECTS not in schools:
        return redirect(url_for("view_schools"))

    schoolforms = [
        logic.GetSchoolFormById(x[restful.ITEM_ID])
        for x in schools[restful.ITEM_OBJECTS]
    ]
    while None in schoolforms:
        schoolforms.remove(None)

    #    form.message = form.data
    if request.method == "POST":
        form = SchoolForm(request.form)
        if "delete" in request.form:
            for x in orm.Schoolimage.query.filter_by(school_id=int(form.id.data)).all():
                pathfile_server = os.path.join(UPLOAD_PATH, x.file)
                if os.path.exists(pathfile_server):
                    os.remove(pathfile_server)
            orm.db.session.delete(orm.School.query.get(int(form.id.data)))
            orm.db.session.commit()
            return redirect(url_for("view_schools", page=page, q=q))

    form = PageInfo()
    logic.LoadBasePageInfo("所有学校", "查看", form)

    return render_template(
        "view_schools.html",
        forms=schoolforms,
        form=form,
        paging=restful.GetPagingFromResult(schools),
    )


@app.route("/bd/delete_image", methods=["GET", "POST"])
def delete_image():
    backurl = request.args.get("backurl", "/")
    print("backurl......", backurl)
    file = request.args.get("file")
    if file:
        for x in orm.Schoolimage.query.filter_by(file=file).all():
            orm.db.session.delete(x)
        for x in orm.Institutionimage.query.filter_by(file=file).all():
            orm.db.session.delete(x)
        for x in orm.Bulletinimage.query.filter_by(file=file).all():
            orm.db.session.delete(x)
        pathfile_server = os.path.join(UPLOAD_PATH, file)
        if os.path.exists(pathfile_server):
            os.remove(pathfile_server)
        orm.db.session.commit()
    return redirect(backurl)


@app.route("/bd/view_institution", methods=["GET", "POST"])
def view_institution():
    institution_id = request.args.get("id")
    q = request.args.get("q")
    if q is not None:
        return redirect(url_for("view_institutions", page=1, q=q))
    form = InstitutionForm(request.form)
    form.area_id.choices = logic.g_choices_area
    form.feature_ids.choices = logic.g_choices_feature
    form.agespan_id.choices = logic.g_choices_agespan
    form.feetype_id.choices = logic.g_choices_feetype
    form.timeopen.data = datetime.time(8, 30)
    form.timeclose.data = datetime.time(22, 00)
    #    form.message = form.data
    if request.method == "POST" and form.validate():
        if form.id.data:
            institution = orm.Institution.query.get(int(form.id.data))
            institution.name = form.name.data
            institution.agespan_id = form.agespan_id.data
            institution.area_id = form.area_id.data
            institution.address = form.address.data
            institution.location = form.location.data
            institution.website = form.website.data
            institution.telephone = form.telephone.data
            institution.feedesc = form.feedesc.data
            institution.timeopen = form.timeopen.data
            institution.timeclose = form.timeclose.data
            institution.feetype_id = form.feetype_id.data
            institution.longitude = form.longitude.data
            institution.latitude = form.latitude.data
            orm.db.session.commit()
        else:
            institution = orm.Institution(
                form.name.data,
                form.agespan_id.data,
                form.area_id.data,
                form.address.data,
                form.location.data,
                form.website.data,
                form.telephone.data,
                form.feedesc.data,
                form.timeopen.data,
                form.timeclose.data,
                form.feetype_id.data,
                form.longitude.data,
                form.latitude.data,
                None,
            )
            orm.db.session.add(institution)
            orm.db.session.commit()
            form.id.data = institution.id

        logic.SetInstitutionFeatures(int(form.id.data), form.feature_ids.data)

        if "upload" in request.form:
            file = request.files["image"]
            if file:
                file_server = str(uuid.uuid1()) + Util.file_extension(file.filename)
                pathfile_server = os.path.join(UPLOAD_PATH, file_server)
                file.save(pathfile_server)
                if os.stat(pathfile_server).st_size < 1 * 1024 * 1024:
                    institutionimage = orm.Institutionimage(institution.id, file_server)
                    orm.db.session.merge(institutionimage)
                    orm.db.session.commit()
                else:
                    os.remove(pathfile_server)
        else:
            return redirect(url_for("view_institution"))
    elif request.method == "GET" and institution_id:
        form = logic.GetInstitutionFormById(institution_id)
        logic.LoadBasePageInfo("修改培训机构", "输入并确定", form)
    else:
        logic.LoadBasePageInfo("新建培训机构", "输入并确定", form)

    if form.id.data:
        institution = orm.Institution.query.get(int(form.id.data))
        form.institution = institution
        if form.institution:
            form.institutionimages = form.institution.institutionimages

    return render_template("view_institution.html", form=form)


@app.route("/bd/view_institutions", methods=["GET", "POST"])
def view_institutions():
    page = request.args.get("page", 1)
    q = request.args.get("q")
    institutions = restful.GetInstitutions(int(page), q)
    if restful.ITEM_OBJECTS not in institutions:
        return redirect(url_for("view_institutions"))

    institutionforms = [
        logic.GetInstitutionFormById(x[restful.ITEM_ID])
        for x in institutions[restful.ITEM_OBJECTS]
    ]
    while None in institutionforms:
        institutionforms.remove(None)

    #    form.message = form.data
    if request.method == "POST":
        form = InstitutionForm(request.form)
        if "delete" in request.form:
            for x in orm.Institutionimage.query.filter_by(
                institution_id=int(form.id.data)
            ).all():
                pathfile_server = os.path.join(UPLOAD_PATH, x.file)
                if os.path.exists(pathfile_server):
                    os.remove(pathfile_server)
            orm.db.session.delete(orm.Institution.query.get(int(form.id.data)))
            orm.db.session.commit()
            return redirect(url_for("view_institutions", page=page, q=q))

    form = PageInfo()
    logic.LoadBasePageInfo("所有培训机构", "查看", form)

    return render_template(
        "view_institutions.html",
        forms=institutionforms,
        form=form,
        paging=restful.GetPagingFromResult(institutions),
    )


@app.route("/bd/view_bulletin", methods=["GET", "POST"])
def view_bulletin():
    bulletin_id = request.args.get("id")
    q = request.args.get("q")
    if q is not None:
        return redirect(url_for("view_bulletins", page=1, q=q))

    form = BulletinForm(request.form)

    if request.method == "POST" and form.validate():
        if form.id.data:
            bulletin = orm.Bulletin.query.get(int(form.id.data))
            bulletin.dt = form.dt.data
            bulletin.title = form.title.data
            bulletin.content = form.content.data
            bulletin.source = form.source.data
            bulletin.author = form.author.data
            orm.db.session.commit()
        else:
            bulletin = orm.Bulletin(
                form.dt.data,
                form.title.data,
                form.content.data,
                form.source.data,
                form.author.data,
            )
            orm.db.session.add(bulletin)
            orm.db.session.commit()
            form.id.data = bulletin.id

        if "upload" in request.form:
            file = request.files["image"]
            if file:
                file_server = str(uuid.uuid1()) + Util.file_extension(file.filename)
                pathfile_server = os.path.join(UPLOAD_PATH, file_server)
                file.save(pathfile_server)
                if os.stat(pathfile_server).st_size < 1 * 1024 * 1024:
                    bulletinimage = orm.Bulletinimage(bulletin.id, file_server)
                    orm.db.session.merge(bulletinimage)
                    orm.db.session.commit()
                else:
                    os.remove(pathfile_server)
        else:
            return redirect(url_for("view_bulletin"))
    elif request.method == "GET" and bulletin_id:
        form = logic.GetBulletinFormById(bulletin_id)
        logic.LoadBasePageInfo("修改公告", "输入并确定", form)
    else:
        form.dt.data = datetime.datetime.now()
        logic.LoadBasePageInfo("新建公告", "输入并确定", form)

    if form.id.data:
        bulletin = orm.Bulletin.query.get(int(form.id.data))
        form.bulletin = bulletin
        if form.bulletin:
            form.bulletinimages = form.bulletin.bulletinimages

    return render_template("view_bulletin.html", form=form)


@app.route("/bd/view_bulletins", methods=["GET", "POST"])
def view_bulletins():
    page = request.args.get("page", 1)
    q = request.args.get("q")
    bulletins = restful.GetBulletins(int(page), q)
    if restful.ITEM_OBJECTS not in bulletins:
        return redirect(url_for("view_bulletins"))

    bulletinforms = [
        logic.GetBulletinFormById(x[restful.ITEM_ID])
        for x in bulletins[restful.ITEM_OBJECTS]
    ]
    while None in bulletinforms:
        bulletinforms.remove(None)

    if request.method == "POST":
        form = BulletinForm(request.form)
        if "delete" in request.form:
            for x in orm.Bulletinimage.query.filter_by(
                bulletin_id=int(form.id.data)
            ).all():
                pathfile_server = os.path.join(UPLOAD_PATH, x.file)
                if os.path.exists(pathfile_server):
                    os.remove(pathfile_server)
            orm.db.session.delete(orm.Bulletin.query.get(int(form.id.data)))
            orm.db.session.commit()
            return redirect(url_for("view_bulletins", page=page, q=q))

    form = PageInfo()
    logic.LoadBasePageInfo("所有公告", "查看", form)

    return render_template(
        "view_bulletins.html",
        forms=bulletinforms,
        form=form,
        paging=restful.GetPagingFromResult(bulletins),
    )


@app.route("/bd/view_account", methods=["GET", "POST"])
def view_account():
    account_id = request.args.get("id")
    q = request.args.get("q")
    if q is not None:
        return redirect(url_for("view_accounts", page=1, q=q))

    form = AccountForm(request.form)

    if request.method == "POST" and form.validate():
        if form.id.data:
            account = orm.Account.query.get(int(form.id.data))
            account.username = form.telephone.data
            account.name = form.telephone.data
            account.telephone = form.telephone.data
            account.role = 0
            account.flag_telephone = 1 if form.flag_telephone.data else 0
            account.checkcode = form.checkcode.data
            account.source = form.source.data
            account.dtcreate = form.dtcreate.data
            orm.db.session.commit()
        else:
            account = orm.Account(
                form.telephone.data,
                "1234",
                form.telephone.data,
                form.telephone.data,
                0,
                1 if form.flag_telephone.data else 0,
                "1234",
                form.source.data,
                form.dtcreate.data,
            )
            orm.db.session.add(account)
            orm.db.session.commit()
            form.id.data = account.id

        return redirect(url_for("view_account"))
    elif request.method == "GET" and account_id:
        form = logic.GetAccountFormById(account_id)
        logic.LoadBasePageInfo("修改用户", "输入并确定", form)
    else:
        logic.LoadBasePageInfo("新建用户", "输入并确定", form)

    if form.id.data:
        account = orm.Account.query.get(int(form.id.data))
        form.account = account

    return render_template("view_account.html", form=form)


@app.route("/bd/view_accounts", methods=["GET", "POST"])
def view_accounts():
    page = request.args.get("page", 1)
    q = request.args.get("q")
    accounts = restful.GetAccounts(int(page), q)
    if restful.ITEM_OBJECTS not in accounts:
        return redirect(url_for("view_accounts"))

    accountforms = [
        logic.GetAccountFormById(x[restful.ITEM_ID])
        for x in accounts[restful.ITEM_OBJECTS]
    ]
    while None in accountforms:
        accountforms.remove(None)

    if request.method == "POST":
        form = AccountForm(request.form)
        if "delete" in request.form:
            orm.db.session.delete(orm.Account.query.get(int(form.id.data)))
            orm.db.session.commit()
            return redirect(url_for("view_accounts", page=page, q=q))

    form = PageInfo()
    logic.LoadBasePageInfo("所有用户", "查看", form)

    return render_template(
        "view_accounts.html",
        forms=accountforms,
        form=form,
        paging=restful.GetPagingFromResult(accounts),
    )
