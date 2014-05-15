package little.ant.pingtai.beetl;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class StringEquals implements Function {

	private static Logger log = Logger.getLogger(StringEquals.class);
			
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length != 2 || null == arg[0] || null == arg[1]){
			return false;
		}
		String str1 = null;
		String str2 = null;
		try {
			str1 = (String) arg[0]; 
			str2 = (String) arg[1]; 
		} catch (Exception e) {
			return false;
		}

		log.debug("beetl StringEquals 验证：arg[0] " + str1 + " arg[1]" + str2);
		
		if(str1.equals(str2)){
			return true;
		}
		
		return false;
	}

}
