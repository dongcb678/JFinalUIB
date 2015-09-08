/**
 * 表单校验
 */
var platform_verify = function() {
	"use strict";
	
	/****************************************************************************************************************/
	/******************************************* 1. 通用方法 **************************************************/
	/****************************************************************************************************************/
	
	/**
	 * 验证长短
	 * @param str
	 * @param minLength
	 * @param maxLength
	 * @returns
	 */
	var minMax = function(str, minLength, maxLength){
		var objectLength = str.length;//.getBytes();//length;
		if(objectLength == 0 && minLength == 0){
			return {"result" : true, "message" : ""};
		}
		if(objectLength==0){
			return {"result" : false, "message" : i18n_utils_msg_notNull};
		}
		if(null != minLength && null != maxLength && minLength==maxLength && objectLength < minLength){
			return {"result" : false, "message" : i18n_utils_msg_lengthMustBe + minLength + i18n_utils_msg_bit};
		}
		if((null != minLength && objectLength < minLength) || (null != maxLength && objectLength > maxLength)){
			return {"result" : false, "message" : i18n_utils_msg_atLeast + minLength + i18n_utils_msg_bit};
		}else{
			return {"result" : true, "message" : ""};
		}
	}
	
	/**
	 * 整数
	 * @param str
	 * @returns
	 */
	var number = function(str){
		var result = str.match(/^(-|\+)?\d+$/);
	    if(result == null){
	    	return {"result" : false, "message" : i18n_utils_msg_integer};
	    }else{
	    	return {"result" : true, "message" : ""};
	    }
	}
	
	/**
	 * 正整数
	 * @param str
	 * @returns
	 */
	var numberZ = function(str){
		var result = str.match(/^[0-9]*[1-9][0-9]*$/);
	    if(result == null){
	    	return {"result" : false, "message" : i18n_utils_msg_positiveInteger};
	    }else{
	    	return {"result" : true, "message" : ""};
	    }
	}
	
	/**
	 * 正浮点数，可验证>=0 && <=99999999.99 的数字
	 * @param str
	 * @returns
	 */
	var floatZ = function(str){
		var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	    if(exp.test(num)){
	    	return {"result" : true, "message" : ""};
	    }else{
	    	return {"result" : false, "message" : i18n_utils_msg_positiveInteger};
	    }
	}
	
	/**
	 * 中文_字母_数字
	 * @param str
	 * @returns
	var chinaLetterNumber = function(str){
		var pattern = /^[0-9a-zA-Z\u4e00-\u9fa5]+$/i; 
		if (pattern.test(str)){ 
			return {"result" : true, "message" : ""};
		}else{ 
			return {"result" : false, "message" : "只能包含中文、字母、数字！"};
		} 
	}
	 */
		
	/**
	 * 字母_数字
	 * @param str
	 * @returns
	 */
	var letterNumber = function(str){
		var letterNumber=/^[A-Za-z0-9]+$/;
		if(letterNumber.test(str)){
			return {"result" : true, "message" : ""};
		}else {
			showMessage = "";
			return {"result" : false, "message" : i18n_utils_msg_lettersNumbers};
		}
	}
	
	/**
	 * 验证邮箱
	 * @param str
	 * @returns
	 */
	var email = function(str){
		var email = /^[\w.+-]+@(?:[-a-z0-9]+\.)+[a-z]{2,4}$/i;//正则/\b[^\s\@]+\@(?:[a-z\d-]+\.)+(?:com|net|org|info|cn|jp|gov|aero)\b/;
		if(email.test(str)){
			return {"result" : true, "message" : ""};
		}else {
			return {"result" : false, "message" : i18n_utils_msg_format};
		}
	}
	
	/**
	 * 匹配固定电话或小灵通，例如：031185907468或02185907468格式
	 * @param str
	 * @returns
	 */
	var tell = function(str){
		var partten = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
		if(partten.test(str)){
			return {"result" : true, "message" : ""};
		}else{
			return {"result" : false, "message" : i18n_utils_msg_format};
		}
	}
	
	/**
	 * 手机
	 * @param str
	 * @returns
	 */
	var phone = function(str){
		var partten = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/; ///^1[3,5]\d{9}$/;
		if(partten.test(str)){
			return {"result" : true, "message" : ""};
		}else{
			return {"result" : false, "message" : i18n_utils_msg_format};
		}
	}
	
	/**
	 * 邮编
	 * @param str
	 * @returns
	 */
	var postboy = function(str){
		var partten = /^[a-zA-Z0-9 ]{3,12}$/;
		if(partten.test(str)){
			return {"result" : true, "message" : ""};
		}else{
			return {"result" : false, "message" : i18n_utils_msg_format};
		}
	}
	
	/**
	 * 身份证号15-18位
	 * @param str
	 * @returns
	 */
	var idCard =  function(str){
		var result=str.match(/\d{15}|\d{18}/);
	    if(result == null){
			return {"result" : false, "message" : i18n_utils_msg_format};
	    }else{
	    	return {"result" : true, "message" : ""};
	    }
	}
	
	/**
	 * qq
	 * @param str
	 * @returns
	 */
	var qq =  function(str){
		var result = str.match(/^(-|\+)?\d+$/);
	    if(result == null){
			return {"result" : false, "message" : i18n_utils_msg_format};
	    }else{
	    	return {"result" : true, "message" : ""};
	    }
	}
	
	/**
	 * URL 网址
	 * @param str
	 * @returns
	 */
	var url =  function(str){
		var result = null;//str.match(/^[0-9a-zA-Z_-.:?&=\/%@]+$/);
	    if(result == null){
	    	return {"result" : false, "message" : i18n_utils_msg_format};
	    }else{
	    	return {"result" : true, "message" : ""};
	    }
	}
	
	/**
	 * 	IP 地址
	 * @param str
	 * @returns
	 */
	var ip =  function(str){
		var val = /([0-9]{1,3}\.{1}){3}[0-9]{1,3}/;
	    var vald = val.exec(str);
	    if (vald == null) {
	    	return {"result" : false, "message" : i18n_utils_msg_format};
	    }
	    if (vald != '') {
	        if (vald[0] != str) {
	        	return {"result" : false, "message" : i18n_utils_msg_format};
	        }
	    }
	    return {"result" : true, "message" : ""};
	}
	
	/**
	 * 身高
	 * @param str
	 * @returns
	 */
	var stature = function(str){
		var result = str.match(/^(-|\+)?\d+$/);
	    if(result == null){
	    	return {"result" : false, "message" : i18n_utils_msg_format};
	    }else{
	    	if(parseInt(str) < 25 || parseInt(str) > 250){
	    		return {"result" : false, "message" : i18n_utils_msg_start + 25 + "-" + 250 + "cm" + i18n_utils_msg_end};
			}
	    	return {"result" : true, "message" : ""};
	    }
	}
		
	/**
	 * 体重
	 * @param str
	 * @returns
	 */
	var avoirdupoi = function(str){
		var result = str.match(/^(-|\+)?\d+$/);
	    if(result == null){
	    	return {"result" : false, "message" : i18n_utils_msg_format};
	    }else{
	    	if(parseInt(str) < 2 || parseInt(str) > 500){
	    		return {"result" : false, "message" : "应该在" + 2 + "-" + 500 + "kg" + i18n_utils_msg_end};
			}
	    	return {"result" : true, "message" : ""};
	    }
	}
		
	/**
	 * 判断文件上传类型
	 * @param valuePath
	 * @returns
	 */
	var valiFile = function(valuePath){
		var imageGeShi = valuePath.substr(valuePath.lastIndexOf(".")+1);
		var geShi = ["jpg", "jpeg", "png"];
		var imageResult = false;
		for(var i in geShi){
			if(imageGeShi == geShi[i]){
				imageResult =  true;
			}
		}
		if(imageResult == false){
			return {"result" : false, "message" : i18n_utils_msg_format};
		}else{
			return {"result" : true, "message" : ""};
		}
	}

	/****************************************************************************************************************/
	/******************************************* 2. 针对UI进行绑定处理 **************************************************/
	/****************************************************************************************************************/
	
	/**
	 * 批量去空格
	 * @param formId
	 */
	var formInputTrim = function(formId){
		var formNode = document.getElementById(formId);
		var length = formNode.length;
		for ( var i = 0; i < length; i++) {
			var node = formNode.elements[i];
			if(node.type == "text" && node.disabled == false){// || node.type == "hidden" || node.type == "password"
				node.value = node.value.trim();
			}
		}
	}

	/**
	 * 显示输入框验证提示
	 * @param inputNode
	 */
	var showInputColor = function(inputNode, type){
		var controlGroupDiv = inputNode.parent().parent();
		if(type == "error"){
			controlGroupDiv.addClass("has-error");
		}else if(type == "success"){
			controlGroupDiv.addClass("has-success");
		}else if(type == "warning"){
			controlGroupDiv.addClass("has-warning");
		}
	}
	
	/**
	 * 隐藏输入框提示
	 * @param inputNode
	 */
	var hiddenInputColor = function (inputNode){
		var controlGroupDiv = inputNode.parent().parent();
		controlGroupDiv.removeClass("has-error");
		controlGroupDiv.removeClass("has-success");
		controlGroupDiv.removeClass("has-warning");
	}

	/**
	 * 输入框数据验证
	 * @param nodeId
	 * @returns {Boolean}
	 */
	var inputDataVali = function (inputNode){
		var type = inputNode.attr("type");
		var vType = inputNode.attr("vType");
		if(null != vType && (type == "text" || type == "password")){
			var value = inputNode.val();
			value = $.trim(value);
			inputNode.val(value);
			 
			var minLength = inputNode.attr("vMin");
			var maxLength = inputNode.attr("maxlength");
	
			var resultArr = {"result" : false, "message" : ""};
			
			//1.验证长度
			resultArr = minMax(value, minLength, maxLength);
			var result = resultArr["result"];// true or false
			var message = resultArr["message"];
			
			if(result != true){
				hiddenInputColor(inputNode);
				showInputColor(inputNode, "error");
				return false;
			}else if(vType == "length"){//如果只验证长度
				hiddenInputColor(inputNode);
				showInputColor(inputNode, "success");
				return true;
				
			}else if(value.length == 0){
				hiddenInputColor(inputNode);
				showInputColor(inputNode, "success");
			}
			
			//2.验证格式
			if(value.length != 0){
				if(vType == "email"){//邮箱
					resultArr = email(value);
					
				}else if(vType == "number"){//整数
					resultArr = number(value);
					
				}else if(vType == "numberZ"){//正整数floatZ
					resultArr = numberZ(value);
					
				}else if(vType == "floatZ"){//正浮点数：金额
					resultArr = floatZ(value);
					
				}else if(vType == "chinaLetterNumber"){//中文字母数字
					resultArr = chinaLetterNumber(value);
					
				}else if(vType == "string"){//普通验证
					resultArr = stature(value);
					
				}else if(vType == "letterNumber"){//字母数字
					resultArr = letterNumber(value);
					
				}else if(vType == "tell"){//电话,如02788888888,注意没有横杠(-)
					resultArr = tell(value);
					
				}else if(vType == "phone"){//手机
					resultArr = phone(value);
					
				}else if(vType == "postboy"){//邮编
					resultArr = postboy(value);
					
				}else if(vType == "idCard"){//身份证号15-18位
					resultArr = idCard(value);
					
				}else if(vType == "qq"){//QQ
					resultArr = qq(value);
					
				}else if(vType == "url"){//网址
					resultArr = url(value);
					
				}else if(vType == "stature"){//身高
					resultArr = stature(value);
					
				}else if(vType == "ip"){//IP
					resultArr = ip(value);
					
				}else if(vType == "avoirdupoi"){//体重
					resultArr = avoirdupoi(value);
					
				}
				
				result = resultArr["result"];// true or false
				message = resultArr["message"];
				
				if(result != true){
					hiddenInputColor(inputNode);
					showInputColor(inputNode, "error");
					return false;
				}else{
					hiddenInputColor(inputNode);
					showInputColor(inputNode, "success");
				}
			}
		}
		return true;
	}	
	
	/**
	 * 失去焦点时验证
	 * @param inputNode
	 * @returns {Boolean}
	 */
	var onblurVali = function(inputNode){
		inputNode = $(inputNode);
		inputDataVali(inputNode);
	}
	
	/**
	 * 整个form一次验证
	 * @param formNode
	 * @returns {Number}
	 */
	var formVali = function(formNode){
		var length = formNode.length;
		var errorCount = 0;
		for ( var i = 0; i < length; i++) {
			var node = formNode.elements[i];
			node = $(node);
			var result = inputDataVali(node);
			if(result == false){
				errorCount += 1;
			}
		}
		return errorCount;
	}
	
	/**
	 * 整个form一次验证并提交
	 * @param formNode
	 * @returns {Number}
	 */
	var formValiSubmit = function(formNode){
		var errorCount = formVali(formNode);
		if(errorCount != 0){
			toastr.warning('有'+errorCount+'处错误，请修正！');
		}else{
			common_ajax.ajaxFormMainPanel(formNode.id);
		}
	}
	
	return {
		onblurVali : onblurVali,
		formVali : formVali,
		formValiSubmit : formValiSubmit
	};
	
}();
