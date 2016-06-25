function alixPayCallBack(json) {
    var obj = JSON.parse(json);
    alert(obj.status);
}

function winxinPayCallBack(json) {
    var obj = JSON.parse(json);
    alert(obj.status);
}


function shareCallBack(json) {
    var obj = JSON.parse(json);
    alert(obj.status);
}

function loginCallBack(json) {
    var obj = JSON.parse(json);
    alert(obj.status);
}

function rankCallBack(json) {
    var obj = JSON.parse(json);
    var grade = obj["rank"];
    alert(grade);
}

function provinceCallBack(json) {
    var obj = JSON.parse(json);
    var provinceName = obj["pvcid"];//pvcname
    alert(provinceName);
}
function loadpageCallBack(json) {
    var obj = JSON.parse(json);
    alert(obj);
}

function callAlixPay() {
    window.WebViewJavascriptBridge.callHandler('ali_pay', '{}', 'alixPayCallBack');
}

function callWexinPay() {
    window.WebViewJavascriptBridge.callHandler('weixin_pay', '{}', 'winxinPayCallBack');
}

function share() {
    window.WebViewJavascriptBridge.callHandler('openShareDialog', '{"out_url":"http://www.tuan800.com", "content":"这是分享内容", "title":"标题", "pic_url":"http://a2.att.hudong.com/60/44/20300001282389131130447572857.jpg"}', 'shareCallBack');
}

function userRank() {
    window.WebViewJavascriptBridge.callHandler('user_rank', '{}', 'rankCallBack');
}

function userAddress() {
    window.WebViewJavascriptBridge.callHandler('set_useraddress', '{"reload_url":"http://h5.m.xiongmaoz.com/h5/dealorder?id=364946&t1=34&t2=738&t3=1&t4=10&item_data=185-1013:184-1102&tit1=%E9%A2%9C%E8%89%B2%EF%BC%9A%E7%B2%89%E7%BA%A2%E8%89%B2&tit2=%E5%B0%BA%E7%A0%81%EF%BC%9AM","address_id":"2867438"}', 'rankCallBack');
}

function userProvince(){
    window.WebViewJavascriptBridge.callHandler('get_location', '{}', 'provinceCallBack');
}

function login() {
    window.WebViewJavascriptBridge.callHandler('login','{}','loginCallBack');
}

function loadpage() {
    window.WebViewJavascriptBridge.callHandler('loadpage','{\"clearhistory\":1, \"url\":\"http://www.tuan800.com\"}','loadpageCallBack');
}




