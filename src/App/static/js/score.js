// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-10 14:42:01
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/score.js
 * @LastTime         : 2022-05-02 00:32:39
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function score() {
    // 添加按钮
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "text",
                "name": "class_name",
                "placeholder": "课程名称"
            },
            {
                "type": "datetime-range",
                "name": "k_time",
                "placeholder": "考试时间时间"
            },
            {
                "type": "text",
                "name": "student_name",
                "placeholder": "学生姓名"
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
            },
        ]
    }
    // 添加按钮
    var manyadd_label = "批量新增成绩";
    var manyadd_api = "post:/scoremany";
    var manyedit_label = "批量修改课程";
    var manyedit_api = "put:/scoremany"
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
                "api": "post:/scoremany",
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
                "api": "put:/scoremany",
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
        "label": "新增成绩数据",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        // "className": "m-b-sm",
        "dialog": {
            "title": "新增成绩数据",
            "size": 'md',
            "body": {
                "type": "form",
                "data": {},
                "api": "post:/scorelist",
                "reload": "window",
                "controls": [{
                        "type": "date",
                        "name": "k_time",
                        "label": "考试时间",
                    },

                    {
                        "type": "select",
                        "name": "class_id",
                        "value": "",
                        "label": "课程名称",
                        "source": "${classes}",
                        "searchable": true,
                        "required": 1,
                    },
                    {
                        "type": "select",
                        "name": "student_id",
                        "value": "",
                        "label": "学生姓名",
                        "source": "${students}",
                        "searchable": true,
                        "required": 1,
                    },
                    {
                        "name": "score",
                        "type": "number",
                        "label": "成绩",
                        "required": 1,
                        "validations": {
                            "isFloat": true
                        },
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
            "title": "修改成绩",
            "size": "md",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "put:/scorelist/${id}",
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
        "api": "delete:/scorelist/${id}"
    };
    var main = {
        type: "page",
        title: "分数情况",
        initApi: "/score/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        body: [{
                "type": "page",
                "body": {
                    "type": "crud",
                    "syncLocation": false,
                    "api": "/scorelist",
                    "quickSaveItemApi": "put:/scorelist/${id}",
                    "saveImmediately": true,
                    "checkOnItemClick ": true,
                    "saveImmediately": true,
                    "name": "userList",
                    "filterTogglable": true,
                    "bulkActions": [{
                        "type": "button",
                        "label": "批量删除",
                        "actionType": "ajax",
                        "api": "delete:/scoremany/${ids|raw}",
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
                            "name": "student_id",
                            "label": "学生",
                            "sortable": true,
                            "quickEdit": {
                                "mode": "inline",
                                "type": "select",
                                "searchable": true,
                                "source": "${students}",
                            },
                        },
                        {
                            "name": "class_id",
                            "label": "课程",
                            "sortable": true,
                            "quickEdit": {
                                "mode": "inline",
                                "type": "select",
                                "searchable": true,
                                "source": "${classes}",
                            },
                        },
                        {
                            "name": "k_time",
                            "type": "date",
                            "sortable": true,
                            "searchable": {
                                "type": "datetime-range",
                            },
                            "width": 80,
                            "label": "考试时间",
                        },
                        {
                            "name": "score",
                            "width": 100,
                            "sortable": true,
                            "label": "成绩",
                            "searchable": {
                                "type": "range",
                                "label": "分数范围",
                                "multiple": true,
                            },
                            "quickEdit": {
                                "type": "number",
                                "validations": {
                                    "isFloat": true
                                },
                            },
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

function lookscore() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "text",
                "name": "class_name",
                "placeholder": "课程名称"
            },
            {
                "type": "datetime-range",
                "name": "k_time",
                "placeholder": "考试时间时间"
            },
            {
                "type": "text",
                "name": "student_name",
                "placeholder": "学生姓名"
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
            },
        ]
    }
    var main = {
        type: "page",
        title: "分数情况",
        initApi: "/score/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        body: [{
                "type": "page",
                "body": {
                    "type": "crud",
                    "syncLocation": false,
                    "api": "/lookscorelist",
                    "saveImmediately": true,
                    "checkOnItemClick ": true,
                    "saveImmediately": true,
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
                            "name": "student_id",
                            "label": "学生",
                            "sortable": true,
                            "type": "select",
                            "searchable": true,
                            "source": "${students}",
                        },
                        {
                            "name": "class_id",
                            "label": "课程",
                            "sortable": true,
                            "type": "select",
                            "searchable": true,
                            "source": "${classes}",
                        },
                        {
                            "name": "k_time",
                            "type": "date",
                            "sortable": true,
                            "searchable": {
                                "type": "datetime-range",
                            },
                            "width": 80,
                            "label": "考试时间",
                        },
                        {
                            "name": "score",
                            "width": 100,
                            "sortable": true,
                            "label": "成绩",
                            "searchable": {
                                "type": "range",
                                "label": "分数范围",
                                "multiple": true,
                            },
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
