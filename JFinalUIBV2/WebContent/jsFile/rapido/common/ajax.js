/**
 * Ajax请求方法二次封装
 */
var common_ajax = function() {
	
	/**
	 * ajax请求并返回结果
	 * @param url
	 * @param data
	 * @param callback
	 * @returns {String}
	 */
	var ajaxFunc = function(url, data, callback){
		var result = "";
		$.ajax({
			type : "post",
			url : encodeURI(encodeURI(cxt + url)),
			data : data,
			dataType : "html",
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

	/**
	 * ajax提交form求并返回结果
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxForm = function(formId, callback){
		var result = "";
		$("#" + formId).ajaxSubmit({
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
	}
	
	/**
	 * ajax请求url替换指定div
	 * @param divId 返回替换div
	 * @param url 请求地址
	 * @param data 参数
	 * @param callback 回调
	 */
	var ajaxDiv = function(divId, url, data, callback){
		var result = ajaxFunc(url, data, callback);
		$("#" + divId).html(result);
	}
	
	/**
	 * ajax提交form替换指定div
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxFormDiv = function(divId, formId, callback){
		var result = ajaxForm(formId, callback);
		$("#" + divId).html(result);
	}
	
	return {
		ajaxFunc : ajaxFunc,
		ajaxForm : ajaxForm,
		ajaxDiv : ajaxDiv,
		ajaxFormDiv : ajaxFormDiv
	};
	
}();
