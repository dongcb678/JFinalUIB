package com.platform.interceptor;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.platform.constant.ConstantWebContext;
import com.platform.dto.SplitPage;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ServicePlugin;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolString;

/**
 * 参数封装拦截器
 * @author 董华健
 */
public class ParamPkgInterceptor implements Interceptor {
	
	private static Logger log = Logger.getLogger(ParamPkgInterceptor.class);
	
	@Override
	public void intercept(Invocation invoc) {
		log.debug("********* 封装参数值到 controller 全局变量  start *********");
		
		// 获取Controller
		BaseController controller = (BaseController) invoc.getController();
		
		// 封装controller变量值
		Class<?> controllerClass = controller.getClass();
		Field[] fields = controllerClass.getDeclaredFields();
		for (Field field : fields) {
			setControllerFieldValue(controller, field);
		}

		// 封装Controller父类至BaseController变量值
		Class<?> superControllerClass = controllerClass.getSuperclass(); // 获取父类
		while (true) {
			if(superControllerClass == BaseController.class){ // 父类是否为BaseController
				Field[] parentFields = superControllerClass.getDeclaredFields();
				for (Field field : parentFields) {
					setControllerFieldValue(controller, field);
				}
				break;
			}
			
			superControllerClass = superControllerClass.getSuperclass(); // 继续获取父类
			Field[] parentFields = superControllerClass.getDeclaredFields();
			for (Field field : parentFields) {
				setControllerFieldValue(controller, field);
			}
		}
		
//		 判断请求是否文件上传类型
//		boolean isMultipart = ServletFileUpload.isMultipartContent(controller.getRequest()); 
//		if(isMultipart){
//			controller.getFile();
//		}
		
		// 是否需要分页
		String operatorIds = controller.getReqSysLog().getStr(Syslog.column_operatorids);
		String splitpage = Operator.dao.cacheGet(operatorIds).getStr(Operator.column_splitpage);
		if(splitpage.equals("1")){
			String uri = invoc.getActionKey(); // 默认就是ActionKey
			String urlPara = controller.getUrlPara();
			if(urlPara != null && !urlPara.isEmpty()){
				uri += "/" + urlPara;
				controller.setAttr("urlPara", urlPara + "/" + urlPara); // 设置urlPara到request
			}
			splitPage(controller, uri);
		}
		
		log.debug("********* 封装参数值到 controller 全局变量  end *********");
		
		invoc.invoke();
		
		log.debug("********* 设置全局变量值到 request start *********");

		// 封装controller变量值
		for (Field field : fields) {
			setRequestValue(controller, field);
		}
		
		// 封装Controller父类至baseController变量值
		while (true) {
			if(superControllerClass == BaseController.class){
				Field[] parentFields = superControllerClass.getDeclaredFields();
				for (Field field : parentFields) {
					setRequestValue(controller, field);
				}
				break;
			}
			superControllerClass = controllerClass.getSuperclass();
			Field[] parentFields = superControllerClass.getDeclaredFields();
			for (Field field : parentFields) {
				setRequestValue(controller, field);
			}
		}
		
		log.debug("********* 设置全局变量值到 request end *********");
	}
	
	/**
	 * 分页参数处理
	 * @param controller
	 */
	private void splitPage(BaseController controller, String uri){
		SplitPage splitPage = new SplitPage();
		splitPage.setUri(uri);
		// 分页查询参数分拣
		Map<String, Object> queryParam = new HashMap<String, Object>();
		String localePram = controller.getAttr(ConstantWebContext.request_localePram);
		queryParam.put(ConstantWebContext.request_localePram, localePram); // 设置国际化当前语言环境
		queryParam.put(ConstantWebContext.request_i18nColumnSuffix, I18NPlugin.columnSuffix(localePram)); // 设置国际化动态列后缀
		Enumeration<String> paramNames = controller.getParaNames();
		String name = null;
		String value = null;
		String key = null;
		while (paramNames.hasMoreElements()) {
			name = paramNames.nextElement();
			value = controller.getPara(name);
			if (name.startsWith(ConstantWebContext.request_query) && null != value && !value.trim().isEmpty()) {// 查询参数分拣
				log.debug("分页，查询参数：name = " + name + " value = " + value);
				key = name.substring(7);
				if(ToolString.regExpVali(key, ToolString.regExp_letter_5)){
					queryParam.put(key, value.trim());
				}else{
					log.error("分页，查询参数存在恶意提交字符：name = " + name + " value = " + value);
				}
			}
		}
		splitPage.setQueryParam(queryParam);
		
		String orderColunm = controller.getPara(ConstantWebContext.request_orderColunm);// 排序条件
		if(null != orderColunm && !orderColunm.isEmpty()){
			log.debug("分页，排序条件：orderColunm = " + orderColunm);
			splitPage.setOrderColunm(orderColunm);
		}

		String orderMode = controller.getPara(ConstantWebContext.request_orderMode);// 排序方式
		if(null != orderMode && !orderMode.isEmpty()){
			log.debug("分页，排序方式：orderMode = " + orderMode);
			splitPage.setOrderMode(orderMode);
		}

		String pageNumber = controller.getPara(ConstantWebContext.request_pageNumber);// 第几页
		if(null != pageNumber && !pageNumber.isEmpty()){
			log.debug("分页，第几页：pageNumber = " + pageNumber);
			splitPage.setPageNumber(Integer.parseInt(pageNumber));
		}
		
		String pageSize = controller.getPara(ConstantWebContext.request_pageSize);// 每页显示几多
		if(null != pageSize && !pageSize.isEmpty()){
			log.debug("分页，每页显示几多：pageSize = " + pageSize);
			splitPage.setPageSize(Integer.parseInt(pageSize));
		}
		
		controller.setSplitPage(splitPage);
	}
	
	/**
	 * 反射set值到全局变量
	 * @param controller
	 * @param field
	 */
	private void setControllerFieldValue(BaseController controller, Field field){
		try {
			field.setAccessible(true);
			String name = field.getName();
			
			// service对象实例填充
			if(BaseService.class.isAssignableFrom(field.getType())){
				BaseService service = ServicePlugin.getService(name); 
				field.set(controller, service);
				return;
			}
			
			// 参数值为空直接结束
			String value = controller.getPara(name);
			if(null == value || value.trim().isEmpty()){
				return;
			}
			
			// 封装参数值到全局变量
			String type = field.getType().getSimpleName();
			if(type.equals("String")){
				field.set(controller, value);
			
			}else if(type.equals("int")){
				field.set(controller, Integer.parseInt(value));
				
			}else if(type.equals("Date")){
				int dateLength = value.length();
				if(dateLength == ToolDateTime.pattern_ym.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ym));
				
				}else if(dateLength == ToolDateTime.pattern_ymd.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd));
				
				}else if(dateLength == ToolDateTime.pattern_ymd_hm.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hm));
				
				}else if(dateLength == ToolDateTime.pattern_ymd_hms.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms));
				
				}else if(dateLength == ToolDateTime.pattern_ymd_hms_s.length()){
					field.set(controller, ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms_s));
				}
				
			}else if(type.equals("BigDecimal")){
				BigDecimal bdValue = new BigDecimal(value);
				field.set(controller, bdValue);
				
			}else{
				log.debug("没有解析到有效字段类型");
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

	/**
	 * 反射全局变量值到request
	 * @param controller
	 * @param field
	 */
	private void setRequestValue(BaseController controller, Field field){
		try {
			field.setAccessible(true);
			Class<?> type = field.getType();
			String name = field.getName();
			Object value = field.get(controller);
			
			// 越过空值、和指定的实例变量
			if(null == value
					|| BaseService.class.isAssignableFrom(type)
					|| (String.class.isAssignableFrom(type) && ((String)value).isEmpty())
					|| Logger.class.isAssignableFrom(type)){
				log.debug("参数值为空，获取类型不符，直接结束");
				return;
			}

			log.debug("设置全局变量到request：field name = " + name + " value = " + value);
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
