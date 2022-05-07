// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-05-06 16:48:01
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/index.js
 * @LastTime         : 2022-05-07 15:48:01
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
// -*- coding: utf-8 -*-
/**
 * @Author           : Albert Wang
 * @Time             : 2022-05-06 16:48:01
 * @Description      :
 * @Email            : shadowofgost@outlook.com
 * @FilePath         : /ComputerScienceThesis/src/App/static/js/index.js
 * @LastTime         : 2022-05-06 16:50:41
 * @LastAuthor       : Albert Wang
 * @Software         : Vscode
 * @Copyright Notice : Copyright (c) 2022 Albert Wang 王子睿, All Rights Reserved.
 */
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
}
