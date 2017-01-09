/**
 * 表单校验
 */
var platform_cookies = function() {
	"use strict";
	
	/**
	 * 写cookies
	 * @param name
	 * @param value
	 * @param day	保存天数
	 */
	var addCookies = function(name, value, day){
		var exp  = new Date();
	    exp.setTime(exp.getTime() + day*24*60*60*1000);
	    document.cookie = name + "="+ escape(value) + ";expires=" + exp.toGMTString();
	};
	
	/**
	 * 取cookies
	 * @param name
	 * @returns
	 */
	var getCookies = function(name){
		var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	    if(arr != null) {
			return unescape(arr[2]); 
		}
		return null;
	};
	
	/**
	 * 删除cookie
	 * @param name
	 */
	var deleteCookies =  function(name){
		var exp = new Date();
	    exp.setTime(exp.getTime() - 1);
	    var cval = utils_getCookie(name);
	    if(cval != null) {
			document.cookie= name + "="+cval+";expires="+exp.toGMTString();
		}
	};
	
	/**
	 * 是否支持Cookie
	 * @returns {Boolean}
	 */
	var enableCookies = function(){
		var result=false;
	    if(navigator.cookiesEnabled){
	    	return true;
	    }
	    document.cookie = "testcookie=yes;";
	    var cookieSet = document.cookie;
	    if (cookieSet.indexOf("testcookie=yes") > -1){
	    	result=true;
	    }
	    document.cookie = "";
	    return result;
	};
	
	return {
		addCookies : addCookies,
		getCookies : getCookies,
		deleteCookies : deleteCookies,
		enableCookies : enableCookies
	};
	
}();