/**
 * 用户添加和编辑页面js
 */
var platform_user_form = function() {
	"use strict";
	
	/**
	 * 验证用户名是否存在
	 * @param userName
	 */
	var valiUserName = function(userName, userIds){
		var param = {"userName" : userName, "userIds" : userIds};
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiUserName", param);
		return result;
	}
	
	/**
	 * 验证邮箱是否存在
	 * @param mailBox
	 */
	var valiMailBox = function(mailBox, userInfoIds){
		var param = {"mailBox" : mailBox, "userInfoIds" : userInfoIds};
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiMailBox", param);
		return result;
	}
	
	/**
	 * 验证身份证是否存在
	 * @param idcard
	 */
	var valiIdcard = function(idcard, userInfoIds){
		var param = {"idcard" : idcard, "userInfoIds" : userInfoIds};
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiIdcard", param);
		return result;
	}
	
	/**
	 *验证手机号是否存在
	 * @param mailBox
	 */
	var valiMobile = function(mobile, userInfoIds){
		var param = {"mobile" : mobile, "userInfoIds" : userInfoIds};
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiMobile", param);
		return result;
	}
	
	var dataVali = function (form, isAdd){
		var usernameId = $("#usernameId").val();
		var mailboxId = $("#mailboxId").val();
		var idcardId = $("#idcardId").val();
		var mobileId = $("#mobileId").val();
		
		if(isAdd){ // 添加
			if(idcardId != "" && valiIdcard(idcardId) != "true"){
				toastr.warning("身份证号码不可用！");
		 		return false;
			}
		
			if(usernameId != "" && valiUserName(usernameId) != "true"){
				toastr.warning("账号不可用！");
		 		return false;
			}
		
			if(mailboxId != "" && valiMailBox(mailboxId) != "true"){
				toastr.warning("邮箱不可用！");
		 		return false;
			}
	
			if(mobileId != "" && valiMobile(mobileId) != "true"){
				toastr.warning("手机号码不可用！");
		 		return false;
			}
		
		}else{ // 更新
			
			var userIds = $("#userIds").val();
			var userInfoIds = $("#userInfoIds").val();
			
			if(idcardId != "" && valiIdcard(idcardId, userInfoIds) != "true"){
				toastr.warning("身份证号码不可用！");
		 		return false;
			}
		
			if(usernameId != "" && valiUserName(usernameId, userIds) != "true"){
				toastr.warning("账号不可用！");
		 		return false;
			}
		
			if(mailboxId != "" && valiMailBox(mailboxId, userInfoIds) != "true"){
				toastr.warning("邮箱不可用！");
		 		return false;
			}
	
			if(mobileId != "" && valiMobile(mobileId, userInfoIds) != "true"){
				toastr.warning("手机号码不可用！");
		 		return false;
			}
		}
		
		var pass1Id = $("#pass1Id").val();
		var pass2Id = $("#pass2Id").val();
		if(pass1Id != pass2Id){
			toastr.warning("两次输入密码不一致，请从新输入！");
	 		return false;
		}
		
		var errorCount = platform_verify.formVali(form);
		if(errorCount != 0){
			toastr.warning("有" + errorCount + "处错误，请修正！");
	 		return false;
		}
		
		common_ajax.ajaxFormMainPanel("editForm");
	}

	return {
		submitValiFunc: dataVali
	};
	
}();
