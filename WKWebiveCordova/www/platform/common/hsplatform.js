//使用版本号
var hsplf_cordova_ver = '1.1.7';

window.onload = function () {
    onHsReady();
}

function onHsReady() {
    console.log("Run version: " + hsplf_cordova_ver + ", URL: " + window.location.href);
}

/**
 *获取url ?后key里的value
 *
 * @param {*} name
 * @returns name对应value值
 */
function getParamString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/**
 * 判断是否HsApp
 * @returns  true-HsApp内部，false-非HsApp
 */
function isHsApp(){
    var u = navigator.userAgent;
    return u.indexOf("_hsApp_") != -1;
}

/**
 * 获取APP对应的scheme
 * @returns  scheme
 */
function getAppScheme(){
    var u = navigator.userAgent;
    return "xxxx";
}
