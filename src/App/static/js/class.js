// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-16 14:32:36
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/class.js
 * @LastTime         : 2022-05-01 22:30:08
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
                    "api": "/lookclasslist",
                    "saveImmediately": true,
                    "checkOnItemClick ": true,
                    "name": "userList",
                    "filterTogglable": true,
                    "headerToolbar": [],
                    "footerToolbar": [
                        "statistics",
                        "switch-per-page",
                        "pagination"
                    ],
                    "filter": topsertch,
                    "columns": [{
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
                        },
                        {
                            "name": "teacher_id",
                            "label": "授课教师",
                            "sortable": true,
                            "type": "select",
                            "source": "${teachers}",
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
