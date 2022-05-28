// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-09 21:01:45
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/class.js
 * @LastTime         : 2022-04-13 17:27:45
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function class_crud() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "text",
                "name": "name",
                "placeholder": "课程名称"
            },
            {
                "type": "datetime-range",
                "name": "begintime",
                "placeholder": "课程开始时间"
            },
            {
                "type": "text",
                "name": "teacher_name",
                "placeholder": "授课老师姓名"
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
    }
    // 添加按钮
    var manyadd_label = "批量新增课程";
    var manyadd_api = "post:/myclassmany";
    var manyedit_label = "批量修改课程";
    var manyedit_api = "put:/myclassmany"
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
                "api": "post:/myclassmany",
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
                "api": "put:/myclassmany",
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
    // 添加按钮
    var addjson = {
        "label": "新增课程",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        // "className": "m-b-sm",
        "dialog": {
            "title": "新增课程",
            "size": 'md',
            "body": {
                "type": "form",
                "api": "post:/myclasslist",
                "reload": "window",
                "controls": [{
                        "type": "text",
                        "name": "name",
                        "label": "课程名称",
                        "required": 1,
                        "validations": {
                            "maxLength": 128,
                        },
                    },
                    {
                        "type": "select",
                        "name": "teacher_id",
                        "value": "",
                        "label": "授课教师",
                        "source": "${teachers}",
                        "searchable": true,
                        "required": 1,

                    },
                    {
                        "type": "date",
                        "name": "in_time",
                        "label": "课程开始时间",
                        "required": 1,
                    },
                    {
                        "type": "date",
                        "name": "in_time",
                        "label": "课程结束时间",
                        "required": 1,
                    },
                ]
            }
        }
    }
    var editbutton = {
        "tooltip": "修改",
        //"icon": "fa fa-pencil text-info",
        "type": "button",
        "actionType": "dialog",
        "label": "修改",
        "dialog": {
            "title": "修改课程",
            "size": "md",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "put:/myclasslist/${id}",
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
        "api": "delete:/myclasslist/${id}"
    };

    var main = {
        type: "page",
        title: "课程列表",
        initApi: "/myclass/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        body: [{
                "type": "page",
                "body": {
                    "type": "crud",
                    "syncLocation": false,
                    "api": "/myclasslist",
                    "quickSaveItemApi": "put:/myclasslist/${id}",
                    "saveImmediately": true,
                    "checkOnItemClick ": true,
                    "name": "userList",
                    "filterTogglable": true,
                    "bulkActions": [{
                        "type": "button",
                        "label": "批量删除",
                        "actionType": "ajax",
                        "api": "delete:/myclassmany/${ids|raw}",
                        "confirmText": "确定要批量删除?"
                    }, ],
                    "headerToolbar": [
                        "bulkActions",
                        "export-excel",
                        addjson,
                        manyadd,
                        manyedit, {
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
                            "label": "课程名称",
                            //"width": 50
                            "quickEdit": {
                                "type": "text",
                                "validations": {
                                    "maxLength": 128
                                }
                            },
                        },
                        {
                            "name": "teacher_id",
                            "label": "授课教师",
                            "sortable": true,
                            "quickEdit": {
                                "mode": "inline",
                                "type": "select",
                                "searchable": true,
                                "source": "${teachers}",
                            },
                        },
                        {
                            "name": "begintime",
                            "type": "date",
                            "sortable": true,
                            "label": "课程开始时间"
                        },
                        {
                            "name": "endtime",
                            "type": "date",
                            "sortable": true,
                            "label": "课程结束时间"
                        },
                    ]
                }
            }

        ]
    }
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};

function lookclass() {
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
    var manyadd_label = "批量新增学生";
    var manyadd_api = "post:/studentmany";
    var manyedit_label = "批量修改学生";
    var manyedit_api = "put:/studentmany"
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
                "api": "post:/studentmany",
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
                "api": "post:/studentmany",
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
        "label": "新增学生",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "修改学生",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "post:/studentlist/${id}",
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
                            "maxLength": 16
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
                            "isLength": 11
                        }
                    },
                    {
                        "type": "text",
                        "name": "email",
                        "label": "邮箱地址",
                        "required": 1,
                        "validations": {
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
                        "type": "text",
                        "name": "l_name",
                        "label": "联系人",
                        "required": 1,
                        "validations": {
                            "maxLength": 20
                        }
                    },
                    {
                        "type": "text",
                        "name": "l_phone",
                        "label": "联系手机",
                        "required": 1,
                        "validations": {
                            "isLength": 11
                        }
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
                        "type": "text",
                        "name": "add",
                        "label": "住址",
                        "validations": {
                            "maxLength": 200
                        }
                    }, {
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
            "title": "修改学生",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "post:/studentlist/${id}",
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
        "api": "delete:/studentlist/${id}"
    };
    var main = {
        "type": "page",
        "title": "学生列表",
        "initApi": "/student/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/studentlist",
                "quickSaveItemApi": "put:/studentlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/studentmany/${ids|raw}",
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
                        "searchable": true,
                        "fixed": "left",
                        //"width": 100,
                        "label": "姓名",
                    },
                    {
                        "name": "login",
                        "label": "登录名",
                        "searchable": true,
                        "width": 100,
                    },
                    {
                        "name": "password",
                        "label": "密码(16位)",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLengt": 16
                            }
                        },
                        "width": 100,
                    },
                    {
                        "name": "department_id",
                        "label": "所在部门/专业",
                        "width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${departments}"
                        }
                    },
                    {
                        "name": "code",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "maxLength": 10
                            }
                        },
                        "width": 100,
                        "label": "学号"
                    },
                    {
                        "name": "cid",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 18
                            }
                        },
                        "width": 160,
                        "label": "身份证"
                    },
                    {
                        "name": "phone",
                        "label": "电话号码",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 11
                            }
                        },
                        "width": 160,
                    },
                    {
                        "name": "email",
                        "label": "邮箱地址",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isLength": 128
                            }
                        },
                        "width": 160,
                    },
                    {
                        "name": "in_time",
                        "type": "date",
                        "sortable": true,
                        "searchable": {
                            "type": "datetime-range"
                        },
                        "width": 80,
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
                        "width": 80,
                        "label": "离校时间",
                        "quickEdit": {
                            "type": "date"
                        }
                    },
                    {
                        "name": "l_name",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 20
                            }
                        },
                        "width": 100,
                        "label": "联系人"
                    },
                    {
                        "name": "l_phone",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 11
                            }
                        },
                        "width": 100,
                        "label": "联系人手机"
                    },

                    {
                        "name": "add",
                        "searchable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 85
                            }
                        },
                        "width": 200,
                        "toggled": false,
                        "label": "  住址"
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
                        "width": 150,
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
                        "width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_3",
                        "label": "订阅分类3",
                        "width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_4",
                        "label": "订阅分类4",
                        "width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    }, {
                        "name": "subscribe_5",
                        "label": "订阅分类5",
                        "width": 150,
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
