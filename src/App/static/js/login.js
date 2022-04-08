//登录按钮 经过鼠标变成手 边框消失 
var submit = document.querySelector('#submit');
console.log(submit);
submit.style.backgroundColor = "#5bb75b";
submit.style.color = "white";

submit.onmouseover = function() {
    console.log(1);
    submit.style.border = "none";
    submit.style.cursor = "pointer";
}
submit.onmouseout = function() {
    console.log(2);
    submit.style.border = "3px solid white";
}

//长度范围：1~30
//如果不符合要求 则消除input下面的margin-bottom 然后显示错误
document.getElementsByName('company')[0].onblur = checkCompany;
document.getElementsByName('user_id')[0].onblur = checkUserid;
document.getElementsByName('password')[0].onblur = checkPassword;

function checkCompany() {
    var check = true;
    obj = document.getElementsByName('company')[0];
    if (obj.value.length <= 30 && obj.value.length >= 1) {
        obj.nextElementSibling.style.display = "none";
        obj.style.marginBottom = "15px";
        check = true;
    } else if (obj.value.length == 0) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "不能为空";
        obj.style.marginBottom = "0";
        check = false;
    } else if (obj.value.length) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "长度不能超过30";
        obj.style.marginBottom = "0";
        check = false;
    }
    return check;
}

function checkUserid() {
    var check = true;
    obj = document.getElementsByName('user_id')[0];
    if (obj.value.length <= 30 && obj.value.length >= 1) {
        obj.nextElementSibling.style.display = "none";
        obj.style.marginBottom = "15px";
        check = true;
    } else if (obj.value.length == 0) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "不能为空";
        obj.style.marginBottom = "0";
        check = false;
    } else if (obj.value.length) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "长度不能超过30";
        obj.style.marginBottom = "0";
        check = false;
    }
    return check;
}

function checkPassword() {
    var check = true;
    obj = document.getElementsByName('password')[0];
    if (obj.value.length <= 30 && obj.value.length >= 1) {
        obj.nextElementSibling.style.display = "none";
        obj.style.marginBottom = "15px";
        check = true;
    } else if (obj.value.length == 0) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "不能为空";
        obj.style.marginBottom = "0";
        check = false;
    } else if (obj.value.length) {
        obj.nextElementSibling.style.display = "block";
        obj.nextElementSibling.innerHTML = "长度不能超过30";
        obj.style.marginBottom = "0";
        check = false;
    }
    return check;
}

function check() {
    checkCompany();
    checkUserid();
    checkPassword();
    return checkCompany() && checkUserid() && checkPassword();
}
