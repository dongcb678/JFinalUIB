package little.ant.pingtai.beetl;

import little.ant.pingtai.common.ContextBase;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

/**
 * 页面按钮权限验证函数
 * @author 董华健
 */
public class HasPrivilegeUrl implements Function {

	private static Logger log = Logger.getLogger(HasPrivilegeUrl.class);
			
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length != 2 || null == arg[0] || null == arg[1]){
			return false;
		}
		String url = null;
		String userIds = null;
		try {
			url = (String) arg[0]; 
			userIds = (String) arg[1]; 
		} catch (Exception e) {
			return false;
		}
		
		boolean bool = ContextBase.hasPrivilegeUrl(url, userIds);
		
		log.debug("beetl HasPrivilegeUrl 验证：" + bool);
		
		return bool;
	}

}
