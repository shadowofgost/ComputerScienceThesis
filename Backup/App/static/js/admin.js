// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-09 21:01:30
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/admin.js
 * @LastTime         : 2022-04-13 10:09:36
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */

function admin() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "text",
                "name": "name",
                "placeholder": "用户姓名"
            },
            {
                "type": "text",
                "name": "login",
                "placeholder": "登录名"
            },
        ],
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
    var manyadd_label = "批量新增管理员";
    var manyadd_api = "post:/adminmany";
    var manyedit_label = "批量修改管理员";
    var manyedit_api = "put:/adminmany"
    var manyadd = {
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
                "api": "post:/adminmany",
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
                "api": "put:/adminmany",
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
        "label": "新增管理员",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "新增管理员",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "post:/adminlist/${id}",
                "reload": "window",
                "controls": [{
                        "type": "text",
                        "name": "login",
                        "label": "登录名",
                        "required": 1,
                        "validations": {
                            "maxLength": 20
                        }
                    },
                    {
                        "type": "text",
                        "name": "password",
                        "label": "密码(16位)",
                        "required": 1,
                        "validations": {
                            "maxLength": 32
                        }
                    },
                    {
                        "type": "text",
                        "name": "name",
                        "label": "姓名",
                        "required": 1,
                        "validations": {
                            "maxLength": 60
                        }
                    },
                    {
                        "label": "是否启用",
                        "type": "select",
                        "name": "status",
                        "options": [{
                                "label": "启用",
                                "value": 1
                            },
                            {
                                "label": "不启用",
                                "value": 0
                            }
                        ]
                    }
                ]
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
            "title": "修改管理员",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "put:/adminlist/${id}",
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
        "api": "delete:/adminlist/${id}"
    };
    var main = {
        "type": "page",
        "title": "学生列表",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/adminlist",
                "quickSaveItemApi": "put:/adminlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/adminmany/${ids|raw}",
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
                        "api": "/adminmany"
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
                        "width": 60,
                        "buttons": [
                            delbutton,
                            editbutton
                        ],
                        "fixed": "left",
                    },
                    {
                        "name": "id",
                        "sortable": true,
                        "label": "ID",
                        //"width": 50
                    },
                    {
                        "name": "name",
                        //"searchable": true,
                        "sortable": true,
                        "fixed": "left",
                        //"width": 100,
                        "label": "姓名",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 60
                            }
                        },
                    },
                    {
                        "name": "login",
                        "label": "登录名",
                        "sortable": true,
                        "width": 100,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 20
                            }
                        },
                    },
                    {
                        "name": "password",
                        "label": "密码(16位)",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 32
                            }
                        },
                        "width": 100,
                    },
                    {
                        "label": "是否启用",
                        "name": "status",
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "options": [{
                                    "label": "启用",
                                    "value": 1
                                },
                                {
                                    "label": "不启用",
                                    "value": 0
                                }
                            ],
                        }
                    }
                ]
            }
        }]
    };
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};
