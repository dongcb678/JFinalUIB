/**
 * 函数方法
 */
var utils = {
	goTop : function() {
		document.documentElement.scrollTop = document.body.scrollTop = 0;
	},

	top_userselect_ul_on : function() {
		var node = $("#top_userselect_ul");
		if (node.css("display") == "none") {
			node.css("display", "block");
		} else {
			node.css("display", "none");
		}
	},

	emojifySelect : function() {
		var node = $(".emojifySelect");
		if (node.css("display") == "none") {
			node.css("display", "block");
		} else {
			node.css("display", "none");
		}
	},

	/**
	 * 获取浏览器类型
	 */
	getBrowserInfo : function() {
		var agent = navigator.userAgent.toLowerCase();
		
		var regStr_ie = /msie [\d.]+;/gi;
		var regStr_ff = /firefox\/[\d.]+/gi
		var regStr_chrome = /chrome\/[\d.]+/gi;
		var regStr_saf = /safari\/[\d.]+/gi;
		
		// IE
		if (agent.indexOf("msie") > 0) {
			return agent.match(regStr_ie);
		}

		// firefox
		if (agent.indexOf("firefox") > 0) {
			return agent.match(regStr_ff);
		}

		// Safari
		if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
			return agent.match(regStr_saf);
		}

		// Chrome
		if (agent.indexOf("chrome") > 0) {
			return agent.match(regStr_chrome);
		}
	}, 
	
	/**
	 * 获取浏览器版本
	 */
	getBrowserVersion : function() {
		var bi = getBrowserInfo();
		var version = (bi + "").replace(/[^0-9.]/ig,""); 
		return version;
	},

	/**
	 * 验证email
	 */
	email : function(str){
		var partten = /^[\w.+-]+@(?:[-a-z0-9]+\.)+[a-z]{2,4}$/i;//正则/\b[^\s\@]+\@(?:[a-z\d-]+\.)+(?:com|net|org|info|cn|jp|gov|aero)\b/;
		if(partten.test(str)){
			return true;
		}else {
			return false;
		}
	},
	
	/**
	 * 验证手机号码
	 */
	mobile : function(str){
		var partten = /^0?(13[0-9]|15[012356789]|18[01236789]|14[57])[0-9]{8}$/; ///^1[3,5]\d{9}$/;
		if(partten.test(str)){
			return true;
		}else{
			return false;
		}
	},

	/**
	 * 验证字母数字
	 */
	letterNumber : function(str){
		var partten = /^[A-Za-z0-9]+$/;
		if(partten.test(str)){
			return true;
		}else {
			return false;
		}
	},
	
	/**
	 * 中文_字母_数字
	 */
	chinaLetterNumber : function(str){
		var pattern = /^[0-9a-zA-Z\u4e00-\u9fa5]+$/i; 
		if (pattern.test(str)){ 
			return true;
		}else{ 
			return false;
		} 
	},
	
	/**
	 * 验证URL
	 */
	url : function(str){
		var re = new RegExp("^[a-zA-z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$"); 
		if(re.test(str)){
	    	return true;
	    }else{
	    	return false;
	    }
	},
	
	/**
	 * ajax提交form求并返回结果
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	ajaxForm : function(formId, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		var result = "";
		$("#" + formId).ajaxSubmit({
			dataType : dataType,
			async: false,
			cache: false,
		    success:  function (data) {
		    	result = data;
		    	
				//扩展回调函数
				if( callback != null ){
					callback();
				}
		    }
		});
		return result;
	},
	
	/**
	 * ajax请求并返回结果
	 * @param url
	 * @param data
	 * @param callback
	 * @returns {String}
	 */
	ajaxFunc : function(url, data, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		var result = "";
		$.ajax({
			type : "post",
			url : encodeURI(encodeURI(cxt + url)),
			data : data,
			dataType : dataType,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			async: false,
			cache: false,
			success:function(response){
				result = response;
				//扩展回调函数
				if( callback != null ){
					callback();
				}
			}
		});
		return result;
	}
	
};

/**
 * 初始化加载
 */
jQuery(document).ready(function() {

	$(document).scroll(function() {
			var top = document.documentElement.scrollTop != 0 || document.body.scrollTop != 0;
			if (top) {
				$("#goTop").css("display", "block");
			} else {
				$("#goTop").css("display", "none");
			}
	});

	$(document).click(function(e) {

	});

});