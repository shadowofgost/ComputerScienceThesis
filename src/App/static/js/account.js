// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-05-07 10:25:01
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/account.js
 * @LastTime         : 2022-05-07 10:25:07
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
function adminaccount() {
    var main={
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
