// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-05-07 14:41:23
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/main.js
 * @LastTime         : 2022-05-07 14:41:26
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function adminaccount() {
    var main = {
        "type": "page",
        "title": "用户",
        "body": {
            "type": "form",
            "initApi": "/account/info",
            "api": "put:/adminlist/${id}",
            "title": "信息表单",
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
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};

function teacheraccount() {
    var main = {
        "type": "page",
        "title": "用户",
        "body": {
            "type": "form",
            "initApi": "/account/info",
            "api": "put:/adminlist/${id}",
            "title": "信息表单",
            "controls": [{
                    "type": "select",
                    "name": "department_id",
                    "value": "",
                    "label": "所在部门/专业",
                    "source": "${departments}",
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
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};

function studentaccount() {
    var main = {
        "type": "page",
        "title": "用户",
        "body": {
            "type": "form",
            "initApi": "/account/info",
            "api": "put:/adminlist/${id}",
            "title": "信息表单",
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
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};

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
function announcement() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "datetime-range",
                "name": "add_time",
                "placeholder": "添加时间"
            },
            {
                "type": "text",
                "name": "name",
                "placeholder": "公告的主题"
            },
            {
                "type": "select",
                "name": "department_id",
                "value": "",
                "label": "所在部门/专业",
                "source": "${departments}",
            },
            {
                "type": "select",
                "name": "type_id",
                "value": "",
                "label": "公告所属类别",
                "source": "${types}",
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
    var addjson = {
        "label": "新增公告",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "新增公告",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "post:/announcementlist",
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
                        "type": "select",
                        "name": "type_id",
                        "value": "",
                        "label": "公告所属类别",
                        "source": "${types}",
                        "searchable": true,
                        "required": 1
                    },
                    {
                        "type": "text",
                        "name": "name",
                        "label": "公告的标题名称",
                        "required": 1,
                        "validations": {
                            "maxLength": 128
                        }
                    },
                    {
                        "type": "input-rich-text",
                        "name": "rich",
                        "label": "富文本编辑器"
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
            "title": "修改学生",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "put:/studentlist/${id}",
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
    var lookbutton = {
        "tooltip": "查看",
        //"icon": "fa fa-pencil text-info",
        "type": "button",
        "actionType": "dialog",
        "label": "查看",
        "dialog": {
            "title": "查看公告的具体信息",
            "size": "lg",
            "body": {
                "type": "html",
                "html": "<div>${filedir}</div>"
            }
        }
    };
    var main = {
        "type": "page",
        "title": "公告列表",
        "initApi": "/announcement/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/announcementlist",
                "quickSaveItemApi": "put:/announcementlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/announcementmany/${ids|raw}",
                    "confirmText": "确定要批量删除?"
                }, ],
                "headerToolbar": [
                    "bulkActions",
                    "export-excel",
                    addjson,
                    {
                        "type": "export-csv",
                        "label": "全量导出 CSV",
                        "api": "/announcementmany"
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
                            editbutton,
                            lookbutton
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
                        "label": "公告主题",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 128
                            }
                        },
                    },
                    {
                        "name": "department_id",
                        "label": "所在部门/专业",
                        "sortable": true,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${departments}"
                        }
                    }, {
                        "name": "type_id",
                        "label": "所属的公告类别",
                        "sortable": true,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${types}"
                        }
                    },
                    {
                        "name": "add_time",
                        "type": "date",
                        "sortable": true,
                        //"width": 80,
                        "label": "添加时间",
                    }
                ]
            }
        }]
    };
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};

function lookannouncement() {
    var topsertch = {
        "title": "搜索",
        "controls": [{
                "type": "datetime-range",
                "name": "add_time",
                "placeholder": "添加时间"
            },
            {
                "type": "text",
                "name": "name",
                "placeholder": "公告的主题"
            },
            {
                "type": "select",
                "name": "department_id",
                "value": "",
                "label": "所在部门/专业",
                "source": "${departments}",
            },
            {
                "type": "select",
                "name": "type_id",
                "value": "",
                "label": "公告所属类别",
                "source": "${types}",
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
    var lookbutton = {
        "tooltip": "查看",
        //"icon": "fa fa-pencil text-info",
        "type": "button",
        "actionType": "dialog",
        "label": "查看",
        "dialog": {
            "title": "查看公告的具体信息",
            "size": "lg",
            "body": {
                "type": "html",
                "html": "<div>${filedir}</div>"
            }
        }
    };
    var main = {
        "type": "page",
        "title": "公告列表",
        "initApi": "/announcement/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/lookannouncementlist",
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
                        "type": "operation",
                        "label": "操作",
                        "width": 60,
                        "buttons": [
                            lookbutton
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
                        "label": "公告主题",
                    },
                    {
                        "name": "department_id",
                        "label": "所在部门/专业",
                        "sortable": true,
                        "type": "select",
                        "searchable": true,
                        "source": "${departments}"
                    }, {
                        "name": "type_id",
                        "label": "所属的公告类别",
                        "sortable": true,
                        "type": "select",
                        "searchable": true,
                        "source": "${types}"
                    },
                    {
                        "name": "add_time",
                        "type": "date",
                        "sortable": true,
                        //"width": 80,
                        "label": "添加时间",
                    }
                ]
            }
        }]
    };
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};
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
function department() {
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
    var manyadd_label = "批量新增部门";
    var manyadd_api = "post:/departmentmany";
    var manyedit_label = "批量修改部门";
    var manyedit_api = "put:/departmentmany"
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
                "api": "post:/departmentmany",
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
                "api": "put:/departmentmany",
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
        "label": "新增部门",
        "type": "button",
        "actionType": "dialog",
        "level": "success",
        "dialog": {
            "title": "新增部门",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "post:/departmentlist/",
                "reload": "window",
                "controls": [{
                        "type": "select",
                        "name": "id_parent",
                        "value": "",
                        "label": "上级部门",
                        "source": "${departments}",
                        "searchable": true,
                        "required": 1
                    },
                    {
                        "type": "text",
                        "name": "name",
                        "label": "部门名称",
                        "required": 1,
                        "validations": {
                            "maxLength": 64
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
            "title": "修改部门",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "api": "put:/departmentlist/${id}",
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
        "api": "delete:/departmentlist/${id}"
    };
    var main = {
        "type": "page",
        "title": "部门列表",
        "initApi": "/department/minlist",
        // subTitle: "展示一些常规的表单，包括验证、提示等等",
        "body": [{
            "type": "page",
            "body": {
                "type": "crud",
                "syncLocation": true,
                "api": "/departmentlist",
                "quickSaveItemApi": "put:/departmentlist/${id}",
                "saveImmediately": true,
                "checkOnItemClick ": true,
                "name": "userList",
                "filterTogglable": true,
                "bulkActions": [{
                    "type": "button",
                    "label": "批量删除",
                    "actionType": "ajax",
                    "api": "delete:/departmentmany/${ids|raw}",
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
                        "label": "部门名称",
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 64
                            }
                        },
                    },
                    {
                        "name": "id_parent",
                        "sortable": true,
                        "label": "上级部门",
                        "width": 150,
                        "quickEdit": {
                            "mode": "inline",
                            "type": "select",
                            "searchable": true,
                            "source": "${departments}"
                        }
                    },
                ]
            }
        }]
    };
    var amis = amisRequire("amis/embed");
    // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};
function lookindex() {
    var main = {
        type: "page",
        body: {
            type: "html",
            html: '<h1> 欢迎来到后台管理系统：session["name"]</h1>'
        }
    };
    var amis =
        amisRequire("amis/embed"); // 用 amis 的 sdk 渲染内容区
    amis.embed("#main", main);
};
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
function student() {
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
            {
                "type": "text",
                "name": "l_name",
                "placeholder": "联系人姓名"
            },
            {
                "type": "text",
                "name": "l_phone",
                "placeholder": "联系人手机号"
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
            "title": "新增学生",
            "size": "lg",
            "body": {
                "type": "form",
                "affixFooter": true,
                "columnCount": 3,
                "api": "post:/studentlist/",
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
                "api": "put:/studentlist/${id}",
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
                        "width": 100,
                    },
                    {
                        "name": "department_id",
                        "label": "所在部门/专业",
                        "width": 150,
                        "sortable": true,
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
                        //"width": 100,
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
                        //"width": 160,
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
                        //"width": 160,
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
                        //"width": 160,
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
                        "name": "l_name",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "maxLength": 20
                            }
                        },
                        //"width": 100,
                        "label": "联系人"
                    },
                    {
                        "name": "l_phone",
                        "sortable": true,
                        "quickEdit": {
                            "type": "text",
                            "validations": {
                                "isNumeric": true,
                                "isLength": 11
                            }
                        },
                        //"width": 100,
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
                        //"width": 200,
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

