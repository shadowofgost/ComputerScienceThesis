// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-04-16 14:32:36
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/announcement.js
 * @LastTime         : 2022-05-07 14:55:09
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
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
