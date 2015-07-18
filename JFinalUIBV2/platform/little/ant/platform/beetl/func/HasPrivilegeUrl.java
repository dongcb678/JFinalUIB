package little.ant.platform.beetl.func;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

import little.ant.platform.interceptor.AuthInterceptor;
import little.ant.platform.model.Syslog;

/**
 * 页面按钮权限验证函数
 * @author 董华健
 */
public class HasPrivilegeUrl implements Function {

	private static Logger log = Logger.getLogger(HasPrivilegeUrl.class);
	
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
		String userIds = null;
		try {
			url = (String) arg[0]; 
			Syslog reqSysLog = (Syslog) context.getGlobal("reqSysLog");
			userIds = reqSysLog.getStr("userids");
		} catch (Exception e) {
			log.error("权限标签验证，获取参数异常：" + e.getMessage());
			return false;
		}
		
		boolean bool = AuthInterceptor.hasPrivilegeUrl(userIds, url);
		
		log.debug("beetl HasPrivilegeUrl 权限标签验证：userIds=" + userIds + "，url=" + url + "，验证结果" + bool);
		
		return bool;
	}

}
