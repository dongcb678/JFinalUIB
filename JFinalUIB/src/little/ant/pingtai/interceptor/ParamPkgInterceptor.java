package little.ant.pingtai.interceptor;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.controller.BaseController;
import little.ant.pingtai.model.Operator;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.tools.ToolDateTime;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

/**
 * 参数封装拦截器
 * @author 董华健
 */
public class ParamPkgInterceptor implements Interceptor {
	
	private static Logger log = Logger.getLogger(ParamPkgInterceptor.class);
	
	@Override
	public void intercept(ActionInvocation ai) {
		BaseController controller = (BaseController) ai.getController();
		
		Class<?> controllerClass = controller.getClass();
		Class<?> superControllerClass = controllerClass.getSuperclass();
		
		Field[] fields = controllerClass.getDeclaredFields();
		Field[] parentFields = superControllerClass.getDeclaredFields();
		
		log.debug("*********************** 封装参数值到 controller 全局变量  start ***********************");
		
		// 是否需要分页
		Syslog reqSysLog = controller.getReqSysLog();
		String operatorids = reqSysLog.getStr("operatorids");
		Operator operator = Operator.dao.cacheGet(operatorids);
		String splitpage = operator.getStr("splitpage");
		if(splitpage.equals("1")){
			splitPage(controller, superControllerClass);
		}
		
		// 封装controller变量值
		for (Field field : fields) {
			setControllerFieldValue(controller, field);
		}
		
		// 封装baseController变量值
		for (Field field : parentFields) {
			setControllerFieldValue(controller, field);
		}

		log.debug("*********************** 封装参数值到 controller 全局变量  end ***********************");
		
		ai.invoke();
		
		log.debug("*********************** 设置全局变量值到 request start ***********************");

		// 封装controller变量值
		for (Field field : fields) {
			setRequestValue(controller, field);
		}
		
		// 封装baseController变量值
		for (Field field : parentFields) {
			setRequestValue(controller, field);
		}
		
		log.debug("*********************** 设置全局变量值到 request end ***********************");
	}
	
	/**
	 * 分页参数处理
	 * @param controller
	 * @param superControllerClass
	 */
	public void splitPage(BaseController controller, Class<?> superControllerClass){
		SplitPage splitPage = new SplitPage();
		// 分页查询参数分拣
		Map<String, String> queryParam = new HashMap<String, String>();
		Enumeration<String> paramNames = controller.getParaNames();
		while (paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			if (name.startsWith("_query.")) {
				String value = controller.getPara(name);
				if(null != value){
					value = value.trim();
					if(!value.isEmpty()){
						String key = name.substring(7);
						queryParam.put(key, value);
					}
				}
			}
		}
		splitPage.setQueryParam(queryParam);
		
		String orderColunm = controller.getPara("orderColunm");// 排序条件
		if(null != orderColunm && !orderColunm.isEmpty()){
			splitPage.setOrderColunm(orderColunm);
		}

		String orderMode = controller.getPara("orderMode");// 排序方式
		if(null != orderMode && !orderMode.isEmpty()){
			splitPage.setOrderMode(orderMode);
		}

		String pageNumber = controller.getPara("pageNumber");// 第几页
		if(null != pageNumber && !pageNumber.isEmpty()){
			splitPage.setPageNumber(Integer.parseInt(pageNumber));
		}
		
		String pageSize = controller.getPara("pageSize");// 每页显示几多
		if(null != pageSize && !pageSize.isEmpty()){
			splitPage.setPageSize(Integer.parseInt(pageSize));
		}
		
		controller.setSplitPage(splitPage);
	}
	
	/**
	 * 反射set值到全局变量
	 * @param controller
	 * @param field
	 */
	public void setControllerFieldValue(BaseController controller, Field field){
		try {
			field.setAccessible(true);
			String name = field.getName();
			String value = controller.getPara(name);
			if(null == value || value.isEmpty()){// 参数值为空直接结束
				log.debug("参数值为空");
				return;
			}
			String fieldType = field.getType().getSimpleName();
			if(fieldType.equals("String")){
				field.set(controller, value);
			
			}else if(fieldType.equals("int")){
				field.set(controller, Integer.parseInt(value));
				
			}else if(fieldType.equals("Date")){
				int dateLength = value.length();
				if(dateLength == ToolDateTime.pattern_ymd.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd));
				
				}else if(dateLength == ToolDateTime.pattern_ymd_hms.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms));
				
				}else if(dateLength == ToolDateTime.pattern_ymd_hms_s.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms_s));
				}
				
			}else if(fieldType.equals("BigDecimal")){
				BigDecimal bdValue = new BigDecimal(value);
				field.set(controller, bdValue);
				
			}else{
				log.debug("没有解析到有效字段类型");
			}
		} catch (IllegalArgumentException e1) {
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} finally {
			field.setAccessible(false);
		}
	}

	/**
	 * 反射全局变量值到request
	 * @param controller
	 * @param field
	 */
	public void setRequestValue(BaseController controller, Field field){
		try {
			field.setAccessible(true);
			Object value = field.get(controller);
			if(null == value){// 参数值为空直接结束
				log.debug("参数值为空");
				return;
			}
			String name = field.getName();
			controller.setAttr(name, value);
		} catch (IllegalArgumentException e1) {
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} finally {
			field.setAccessible(false);
		}
	}
}
