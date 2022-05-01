// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-09 21:01:23
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/teacher.js
 * @LastTime         : 2022-05-01 15:24:23
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function teacher() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "datetime-range",
                "name": "in_time",
                "placeholder": "入学时间范围查询"
            },
            {
                "type": "text",
                "name": "name",
                "placeholder": "用户姓名"
            },
            {
                "type": "text",
                "name": "login",
                "placeholder": "登录名"
            },
            {
                "type": "text",
                "name": "code",
                "placeholder": "学号"
            },
            {
                "type": "text",
                "name": "cid",
                "placeholder": "身份证号"
            },
            {
                "type": "text",
                "name": "phone",
                "placeholder": "手机号"
            },
            {
                "type": "text",
                "name": "email",
                "placeholder": "邮箱"
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
    var manyadd_label = "批量新增教师";
    var manyadd_api = "post:/teachermany";
    var manyedit_label = "批量修改教师";
    var manyedit_api = "put:/teachermany"
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
                "api": "post:/teachermany",
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
                "api": "put:/teachermany",
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
        "label": "新增教师",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "新增教师",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "post:/teacherlist/",
                "reload": "window",
                "controls": [{
                        "type": "select",
                        "name": "department_id",
                        "value": "",
                        "label": "所在部门/专业",
                        "source": "${departments}",
                        "searchable": true,
                        "required": 1
                    },
                    {
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
                        "name": "code",
                        "label": "学号",
                        "required": 1,
                        "validations": {
                            "maxLength": 10
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
                        "type": "text",
                        "name": "cid",
                        "label": "身份证",
                        "required": 1,
                        "validations": {
                            "isLength": 18
                        }
                    },
                    {
                        "type": "text",
                        "name": "phone",
                        "label": "电话号码",
                        "required": 1,
                        "validations": {
                            "isNumeric": true,
                            "isPhoneNumber": true,
                            "isLength": 11
                        }
                    },
                    {
                        "type": "text",
                        "name": "email",
                        "label": "邮箱地址",
                        "required": 1,
                        "validations": {
                            "isEmail": true,
                            "maxLength": 128
                        }
                    },
                    {
                        "type": "date",
                        "name": "in_time",
                        "label": "入校时间",
                        "required": 1,
                    },
                    {
                        "type": "date",
                        "name": "out_time",
                        "label": "离校时间",
                    },
                    {
                        "type": "select",
                        "name": "subscribe_1",
                        "value": "",
                        "label": "订阅分类1",
                        "source": "${types}",
                        "searchable": true,
                    },
                    {
                        "type": "select",
                        "name": "subscribe_2",
                        "value": "",
                        "label": "订阅分类2",
                        "source": "${types}",
                    },
                    {
                        "type": "select",
                        "name": "subscribe_3",
                        "value": "",
                        "label": "订阅分类3",
                        "source": "${types}",
                    },
                    {
                        "type": "select",
                        "name": "subscribe_4",
                        "value": "",
                        "label": "订阅分类4",
                        "source": "${types}",
                        "searchable": true,
                    },
                    {
                        "type": "select",
                        "name": "subscribe_5",
                        "value": "",
                        "label": "订阅分类5",
                        "source": "${types}",
                        "searchable": true,
                    },
                    {
                        "type": "textarea",
                        "name": "info",
                        "label": "简介",
                        "validations": {
                            "maxLength": 200
                        }
                    },
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
            "title": "修改教师",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "put:/teacherlist/${id}",
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
        "api": "delete:/teacherlist/${id}"
    };
    var main = {
        "type": "page",
        "title": "教师列表",
        "initApi": "/teacher/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/teacherlist",
                "quickSaveItemApi": "put:/teacherlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/teachermany/${ids|raw}",
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
                        "api": "/teachermany"
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
                        //"width": 100,
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
                        //"width": 100,
                    },
                    {
                        "name": "department_id",
                        "label": "所在部门/专业",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${departments}"
                        }
                    },
                    {
                        "name": "code",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "maxLength": 10
                            }
                        },
                        "label": "学号"
                    },
                    {
                        "name": "cid",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 18
                            }
                        },
                        "label": "身份证"
                    },
                    {
                        "name": "phone",
                        "label": "电话号码",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isPhoneNumber": true,
                                "isLength": 11
                            }
                        },
                    },
                    {
                        "name": "email",
                        "label": "邮箱地址",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isEmail": true,
                                "maxLength": 128
                            }
                        },
                    },
                    {
                        "name": "in_time",
                        "type": "date",
                        "sortable": true,
                        "searchable": {
                            "type": "datetime-range"
                        },
                        //"width": 80,
                        "label": "入学时间",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 18
                            }
                        }
                    },
                    {
                        "name": "out_time",
                        "type": "date",
                        "sortable": true,
                        //"width": 80,
                        "label": "离校时间",
                        "quickEdit": {
                            "type": "date"
                        }
                    },
                    {
                        "type": "tpl",
                        "name": "info",
                        "label": "简介",
                        "tpl": "${info|truncate:10}",
                        "width": 200,
                        "toggled": false,
                        "popOver": {
                            "body": {
                                "type": "tpl",
                                "tpl": "${info}"
                            }
                        }
                    },
                    {
                        "name": "subscribe_1",
                        "label": "订阅分类1",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    },
                    {
                        "name": "subscribe_2",
                        "label": "订阅分类2",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_3",
                        "label": "订阅分类3",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_4",
                        "label": "订阅分类4",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_5",
                        "label": "订阅分类5",
                        "sortable": true,
                        //"width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
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
