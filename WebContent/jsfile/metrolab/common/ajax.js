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
	var ajaxFunc = function(url, data, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		// 所有请求加上当前语言标示环境
//		if(!data){
//			data = {"localePram" : localePram};
//		}else{
//			data.localePram = localePram;
//		}
		
		var result = "";
		$.ajax({
			type : "post",
			url : encodeURI(encodeURI(cxt + url)),
			headers : {"localePram" : localePram}, // 所有请求加上当前语言标示环境
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
	};

	/**
	 * ajax请求，执行前进行确认
	 */
	var ajaxFuncConfirm = function(url, data, dataType, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxFunc(url, data, dataType, callback);
			}
		});
	};
	
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
	};
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxDivConfirm = function(divId, url, data, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxDiv(divId, url, data, callback);
			}
		});
	};
	
	/**
	 * ajax请求url替换主面板内容
	 * @param url 请求地址
	 * @param data 参数
	 * @param callback 回调
	 */
	var ajaxMainPanel = function(url, data, callback){
		var result = ajaxFunc(url, data, callback);
		$("#main-content").html(result);
	};
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxMainPanelConfirm = function(url, data, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxMainPanel(url, data, callback);
			}
		});
	};
	
	/**
	 * ajax提交form求并返回结果
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxForm = function(formId, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}

		var result = "";
		$("#" + formId).ajaxSubmit({
			dataType : dataType,
			async: false,
			cache: false,
			headers : {"localePram" : localePram}, // 所有请求加上当前语言标示环境
			//data: {"localePram" : localePram}, // 所有请求加上当前语言标示环境
		    success:  function (data) {
		    	result = data;
		    	
				//扩展回调函数
				if( callback != null ){
					callback();
				}
		    }
		});
		return result;
	};
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxFormConfirm = function(formId, dataType, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxForm(formId, dataType, callback);
			}
		});
	};
	
	/**
	 * ajax提交form替换指定div
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxFormDiv = function(divId, formId, callback){
		var result = ajaxForm(formId, callback);
		$("#" + divId).html(result);
	};
	
	/**
	 * ajaxFormDiv请求，执行前进行确认
	 */
	var ajaxFormDivConfirm = function(divId, formId, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxFormDiv(divId, formId, callback);
			}
		});
	};
	
	/**
	 * ajax提交form替换指定主面板
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxFormMainPanel = function(formId, callback){
		var result = ajaxForm(formId, callback);
		$("#main-content").html(result);
	};

	/**
	 * ajaxFormMainPanel请求，执行前进行确认
	 */
	var ajaxFormMainPanelConfirm = function(formId, callback) {
		bootbox.confirm("确定要这样操作吗？", function(result) {
			if(result){
				ajaxFormMainPanel(formId, callback);
			}
		});
	};
	
	return {
		ajaxFunc : ajaxFunc,
		ajaxFuncConfirm : ajaxFuncConfirm,
		
		ajaxDiv : ajaxDiv,
		ajaxDivConfirm : ajaxDivConfirm,
		
		ajaxMainPanel : ajaxMainPanel,
		ajaxMainPanelConfirm : ajaxMainPanelConfirm,
		
		ajaxForm : ajaxForm,
		ajaxFormConfirm : ajaxFormConfirm,
		
		ajaxFormDiv : ajaxFormDiv,
		ajaxFormDivConfirm : ajaxFormDivConfirm,
		
		ajaxFormMainPanel : ajaxFormMainPanel,
		ajaxFormMainPanelConfirm : ajaxFormMainPanelConfirm
	};
	
}();
