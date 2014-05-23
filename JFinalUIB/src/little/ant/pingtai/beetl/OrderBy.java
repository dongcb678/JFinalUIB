package little.ant.pingtai.beetl;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

/**
 * 分页列表排序
 * @author 董华健
 */
public class OrderBy implements Function {

	private static Logger log = Logger.getLogger(OrderBy.class);
			
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length != 3 || null == arg[0] || null == arg[1] || null == arg[2]){
			return "";
		}
		String orderLaber = null;// 排序表示
		String orderColunm = null;// 排序条件
		String orderMode = null;// 排序方式
		try {
			orderLaber = (String) arg[0];
			orderColunm = (String) arg[1];
			orderMode = (String) arg[2];
		} catch (Exception e) {
			return "";
		}

		log.debug("排序图标显示处理");
		
		if(orderLaber.equals(orderColunm)){
			if(orderMode.equals("asc")){
				return "<img src='/files/images/pingtai/order/asc.gif' />";
			}else if(orderMode.equals("desc")){
				return "<img src='/files/images/pingtai/order/desc.gif' />";
			}
		}
		
		return "";
	}

}
