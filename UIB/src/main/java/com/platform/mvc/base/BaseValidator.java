package com.platform.mvc.base;

import com.jfinal.validate.Validator;
import com.platform.tools.ToolString;

/**
 * 扩展验证方法
 * @author 董华健  dongcb678@163.com
 */
public abstract class BaseValidator extends Validator {

	/**
	 * 验证手机号
	 */
	protected void validateMobile(String field, String errorKey, String errorMessage) {
		validateRegex(field, ToolString.regExp_mobile, false, errorKey, errorMessage);
	}

	/**
	 * 验证邮编
	 */
	protected void validatePostbody(String field, String errorKey, String errorMessage) {
		validateRegex(field, ToolString.regExp_postbody, false, errorKey, errorMessage);
	}

	/**
	 * 验证身份证
	 */
	protected void validateIdCard(String field, String errorKey, String errorMessage) {
		validateRegex(field, ToolString.regExp_idCard, false, errorKey, errorMessage);
	}
	
}
