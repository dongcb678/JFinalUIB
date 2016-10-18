package com.platform.mvc.base;

import java.lang.reflect.Field;

import com.jfinal.aop.Invocation;
import com.jfinal.validate.Validator;
import com.platform.plugin.ServicePlugin;
import com.platform.tools.ToolString;

/**
 * 扩展验证方法
 * @author 董华健  dongcb678@163.com
 */
public abstract class BaseValidator extends Validator {
	
	protected BaseService baseService;		// Service
	
	@Override
	public void intercept(Invocation invocation) {
		instance();
		
		Field[] parentFields = getClass().getDeclaredFields();
		for (Field field : parentFields) {
			try {
				field.setAccessible(true);
				String name = field.getName();
				// 是否service类型成员变量
				if(BaseService.class.isAssignableFrom(field.getType())){
					// 获取目标Service实例
					BaseService targetService = ServicePlugin.getService(name); 
					// 注入目标service实例
					field.set(validator, targetService);
				}
			} catch (IllegalArgumentException e1) {
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				e1.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			} finally {
				field.setAccessible(false);
			}
		}
		
		super.intercept(invocation);
	}

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
