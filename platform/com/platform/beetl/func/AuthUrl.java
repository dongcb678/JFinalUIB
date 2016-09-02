package com.platform.beetl.func;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

import com.platform.constant.ConstantWebContext;
import com.platform.interceptor.AuthInterceptor;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;

/**
 * 页面按钮权限验证函数
 * @author 董华健
 */
public class AuthUrl implements Function {

	private static Logger log = Logger.getLogger(AuthUrl.class);
	
	/**
	 * 页面按钮权限验证
	 */
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length != 1 || null == arg[0]){
			log.error("权限标签验证，参数不正确");
			return false;
		}
		
		String url = null;
		String operatorIds = null;
		String userIds = null;
		
		try {
			url = (String) arg[0]; 
			Operator operator = Operator.cacheGet(url);
			if (null == operator) {
				log.error("URI不存在!");
			}
			operatorIds = operator.getPKValue();
			
			Syslog reqSysLog = (Syslog) context.getGlobal(ConstantWebContext.reqSysLogKey);
			userIds = reqSysLog.getStr(Syslog.column_userids);
		} catch (Exception e) {
			log.error("权限标签验证，获取参数异常：" + e.getMessage());
			return false;
		}
		
		boolean bool = AuthInterceptor.hasPrivilegeUrl(operatorIds, userIds);
		
		//log.debug("beetl HasPrivilegeUrl 权限标签验证：userIds=" + userIds + "，url=" + url + "，验证结果" + bool);
		
		return bool;
	}

}
