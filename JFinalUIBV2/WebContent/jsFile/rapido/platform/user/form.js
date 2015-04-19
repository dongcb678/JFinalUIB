/**
 * 用户添加和编辑页面js
 */
var platform_user_form = function() {
	"use strict";
	
	/**
	 * 验证用户名是否存在
	 * @param userName
	 */
	var valiUserName = function(userName){
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiUserName", {"userName" : userName});
		return result;
	}
	
	/**
	 * 验证邮箱是否存在
	 * @param mailBox
	 */
	var valiMailBox = function(mailBox){
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiMailBox", {"mailBox" : mailBox});
		return result;
	}
	
	/**
	 * 验证身份证是否存在
	 * @param idcard
	 */
	var valiIdcard = function(idcard){
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiIdcard", {"idcard" : idcard});
		return result;
	}
	
	/**
	 *验证手机号是否存在
	 * @param mailBox
	 */
	var valiMobile = function(mobile){
		var result = common_ajax.ajaxFunc("/jf/platform/login/valiMobile", {"mobile" : mobile});
		return result;
	}
	
	var dataVali = function (form, isAdd){
		var usernameId = $("#usernameId").val();
		var mailboxId = $("#mailboxId").val();
		var idcardId = $("#idcardId").val();
		var mobileId = $("#mobileId").val();
		
		if(isAdd){ // 添加
			if(idcardId != "" && valiIdcard(idcardId) != "0"){
				toastr.warning("身份证号码重复！");
		 		return false;
			}
		
			if(usernameId != "" && valiUserName(usernameId) != "0"){
				toastr.warning("账号重复！");
		 		return false;
			}
		
			if(mailboxId != "" && valiMailBox(mailboxId) != "0"){
				toastr.warning("邮箱重复！");
		 		return false;
			}
	
			if(mobileId != "" && valiMobile(mobileId) != "0"){
				toastr.warning("手机号码重复！");
		 		return false;
			}
		
		}else{ // 更新
			if(idcardId != "" && valiIdcard(idcardId) != "0" && valiIdcard(idcardId) != "1"){
				toastr.warning("身份证号码重复！");
		 		return false;
			}
		
			if(usernameId != "" && valiUserName(usernameId) != "0" && valiUserName(usernameId) != "1"){
				toastr.warning("账号重复！");
		 		return false;
			}
		
			if(mailboxId != "" && valiMailBox(mailboxId) != "0" && valiMailBox(mailboxId) != "1"){
				toastr.warning("邮箱重复！");
		 		return false;
			}
	
			if(mobileId != "" && valiMobile(mobileId) != "0" && valiMobile(mobileId) != "1"){
				toastr.warning("手机号码重复！");
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
