document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
    console.log("准备");
}

// 获取当前位置
function currentPosition() {
    console.log("该功能只能在APP内部使用");
    var argument = JSON.stringify({
        'relocation': 'false'
    });
    Cordova.exec(successCurrentPosition, errorCurrentPosition, "MyPlugin", "currentPosition", [argument]);
}

//获取地理位置成功
function successCurrentPosition(position) {
    console.log("success==" + position);
}

function errorCurrentPosition(position) {
    console.log("error==" + position);
}
