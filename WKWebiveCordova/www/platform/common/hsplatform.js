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
   //互生：
    if(u.indexOf("com.gy.amobile.person") != -1 || u.indexOf("com.hsxt.hsxt") != -1){
        return "hsxt_hsxtpersoniosPay";
    }
    //和睦社区：
    if(u.indexOf("com.hmsqw.customer") != -1){
        return "hmsq_hmsqwPay";
    }
    //农创品牌：
    if(u.indexOf("com.wncpp.customer") != -1){
        return "ncpp_wncppPay";
    }
    //正道品牌：
    if(u.indexOf("com.zhdpp.customer") != -1){
        return "zhdpp_zhdppPay";
    }
   //相通网络：
    if(u.indexOf("net.xt.android") != -1 || u.indexOf("net.xt.ios") != -1){
        return "xtnet_xtPay";
    }

    //互生活：
    if(u.indexOf("com.hslife.customer") != -1 || u.indexOf("cn.hslife.customer") != -1){
        return "hslife_hslifePay";
    }
}
