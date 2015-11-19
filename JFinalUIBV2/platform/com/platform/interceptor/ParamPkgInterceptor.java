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
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;
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
		log.debug("********* 反射获取 controller 全局变量  start *********");
		
		BaseController controller = (BaseController) invoc.getController();
		
		Class<?> controllerClass = controller.getClass();
		Class<?> superControllerClass = controllerClass.getSuperclass();
		
		Field[] fields = controllerClass.getDeclaredFields();
		Field[] parentFields = superControllerClass.getDeclaredFields();
		
		log.debug("********* 反射获取 controller 全局变量  end *********");
		
		log.debug("********* 封装参数值到 controller 全局变量  start *********");
//		boolean isMultipart = ServletFileUpload.isMultipartContent(controller.getRequest()); // 判断是否文件上传类型
//		if(isMultipart){
//			controller.getFile();
//		}
		// 是否需要分页
		Syslog reqSysLog = controller.getReqSysLog();
		String operatorids = reqSysLog.getStr(Syslog.column_operatorids);
		Operator operator = Operator.dao.cacheGet(operatorids);
		String splitpage = operator.getStr(Operator.column_splitpage);
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

		log.debug("********* 封装参数值到 controller 全局变量  end *********");
		
		invoc.invoke();
		
		log.debug("********* 设置全局变量值到 request start *********");

		// 封装controller变量值
		for (Field field : fields) {
			setRequestValue(controller, field);
		}
		
		// 封装baseController变量值
		for (Field field : parentFields) {
			setRequestValue(controller, field);
		}
		
		log.debug("********* 设置全局变量值到 request end *********");
	}
	
	/**
	 * 分页参数处理
	 * @param controller
	 * @param superControllerClass
	 */
	private void splitPage(BaseController controller, Class<?> superControllerClass){
		SplitPage splitPage = new SplitPage();
		// 分页查询参数分拣
		Map<String, Object> queryParam = new HashMap<String, Object>();
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
			String value = controller.getPara(name);
			if(null == value || value.trim().isEmpty()){// 参数值为空直接结束
				log.debug("封装参数值到全局变量：field name = " + name + " value = 空");
				return;
			}
			log.debug("封装参数值到全局变量：field name = " + name + " value = " + value);
			
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
	private void setRequestValue(BaseController controller, Field field){
		try {
			field.setAccessible(true);
			String name = field.getName();
			Object value = field.get(controller);
			if(null == value 
					|| (value instanceof String && ((String)value).isEmpty() 
					|| value instanceof Logger)
					){// 参数值为空直接结束
				log.debug("设置全局变量到request：field name = " + name + " value = 空");
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
