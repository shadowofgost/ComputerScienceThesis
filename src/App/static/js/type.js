// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-10 14:42:13
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/type.js
 * @LastTime         : 2022-05-01 15:24:44
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function type_crud() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
            "type": "text",
            "name": "name",
            "placeholder": "部门名称"
        }, ],
        "actions": [{
                "type": "reset",
                "label": "重置"
            },
            {
                "type": "submit",
                // className:"a-Button--primary",
                "level": "success",
                "label": "搜索"
            }
        ]
    };
    // 添加按钮
    var manyadd_label = "批量新增公告类别";
    var manyadd_api = "post:/type_crudmany";
    var manyedit_label = "批量修改公共类别";
    var manyedit_api = "put:/type_crudmany"
    var manyadd = {
        "label": "批量新增公告类别",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        // "className": "m-b-sm",
        "dialog": {
            "title": "批量新增公告类别",
            "size": "lg",
            "body": [{
                "type": "form",
                "api": "post:/type_crudmany",
                "body": [{
                    "name": "static",
                    "type": "static",
                    "label": "Excel的要求",
                    "value": "Excel的模板从“导出Excel按钮”获得，上传的Excel内容参照模板格式，请勿修改模板格式，否则会导致数据导入失败。"
                }, {
                    "type": "input-excel",
                    "name": "excel",
                    "label": "上传 Excel"
                }]
            }]
        }
    };
    manyadd["label"] = manyadd_label;
    manyadd["dialog"]["title"] = manyadd_label;
    manyadd["dialog"]["body"]["api"] = manyadd_api;
    var manyedit = {
        "label": "批量新增学生",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        // "className": "m-b-sm",
        "dialog": {
            "title": "批量新增学生",
            "size": "lg",
            "body": [{
                "type": "form",
                "api": "put:/type_crudmany",
                "body": [{
                    "name": "static",
                    "type": "static",
                    "label": "Excel的要求",
                    "value": "Excel的模板从“导出Excel按钮”获得，上传的Excel内容参照模板格式，请勿修改模板格式，否则会导致数据导入失败。"
                }, {
                    "type": "input-excel",
                    "name": "excel",
                    "label": "上传 Excel"
                }]
            }]
        }
    };
    manyedit["label"] = manyedit_label;
    manyedit["dialog"]["title"] = manyedit_label;
    manyedit["dialog"]["body"]["api"] = manyedit_api;
    var addjson = {
        "label": "新增公告类别",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "新增公告类别",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "post:/type_crudlist/",
                "reload": "window",
                "controls": [{
                    "type": "text",
                    "name": "name",
                    "label": "公告类别名称",
                    "required": 1,
                    "validations": {
                        "maxLength": 60
                    }
                }, ]
            }
        }
    };
    var editbutton = {
        "tooltip": "修改",
        //"icon": "fa fa-pencil text-info",
        "type": "button",
        "actionType": "dialog",
        "label": "修改",
        "dialog": {
            "title": "修改公告类别",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "put:/type_crudlist/${id}",
                "reload": "window",
                "controls": addjson["dialog"]["body"]["controls"],
            }
        }
    };

    var delbutton = {
        "tooltip": "删除",
        "type": "button",
        "label": "删除",
        //"icon": "fa fa-times text-danger",
        "actionType": "ajax",
        "level": "danger",
        "confirmText": "确认要删除？",
        "api": "delete:/type_crudlist/${id}"
    };
    var main = {
        "type": "page",
        "title": "公告类别列表",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/type_crudlist",
                "quickSaveItemApi": "put:/type_crudlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/type_crudmany/${ids|raw}",
                    "confirmText": "确定要批量删除?"
                }, ],
                "headerToolbar": [
                    "bulkActions",
                    "export-excel",
                    addjson,
                    manyadd,
                    manyedit,
                    {
                        "type": "export-csv",
                        "label": "全量导出 CSV",
                        "api": "/studentmany"
                    }
                ],
                "footerToolbar": [
                    "statistics",
                    "switch-per-page",
                    "pagination"
                ],
                "filter": topsertch,
                "columns": [{
                        "type": "operation",
                        "label": "操作",
                        "buttons": [
                            delbutton,
                            editbutton
                        ],
                        "fixed": "left",
                    }, {
                        "name": "id",
                        "sortable": true,
                        "label": "ID",
                        //"width": 50
                    },
                    {
                        "name": "name",
                        "sortable": true,
                        "fixed": "left",
                        //"width": 100,
                        "label": "公告类别名称",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 60
                            }
                        },
                    },
                ]
            }
        }]
    };
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};
