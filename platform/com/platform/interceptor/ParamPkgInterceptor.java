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
		
		// 封装Controller至父类BaseController变量值
		Class<?> controllerClass = controller.getClass();
		while (true) {
			Field[] fields = controllerClass.getDeclaredFields();
			
			for (Field field : fields) {
				setControllerFieldValue(controller, field);
			}

			if(controllerClass == BaseController.class){ // 父类是否为BaseController
				break;
			}
			
			controllerClass = controllerClass.getSuperclass(); // 继续获取父类
		}
		
//		 判断请求是否文件上传类型
//		boolean isMultipart = ServletFileUpload.isMultipartContent(controller.getRequest()); 
//		if(isMultipart){
//			controller.getFile();
//		}
		
		// 是否需要分页
		String operatorIds = controller.getReqSysLog().getStr(Syslog.column_operatorids);
		String splitpage = Operator.cacheGet(operatorIds).getStr(Operator.column_splitpage);
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

		// 封装Controller至父类baseController变量值request
		controllerClass = controller.getClass();
		while (true) {
			Field[] fields = controllerClass.getDeclaredFields();
			
			for (Field field : fields) {
				setRequestValue(controller, field);
			}
			
			if(controllerClass == BaseController.class){
				break;
			}
			
			controllerClass = controllerClass.getSuperclass();
		}
		
		log.debug("********* 设置全局变量值到 request end *********");
	}
	
	/**
	 * 分页参数处理
	 * @param controller
	 */
	private void splitPage(BaseController controller, String uri){
		SplitPage splitPage = new SplitPage();
		
		// 设置分页请求uri
		splitPage.setUri(uri);
		
		// 存储分页查询参数
		Map<String, Object> queryParam = new HashMap<String, Object>();
		
		// 国际化相关参数
		String localePram = controller.getAttr(ConstantWebContext.request_localePram);
		queryParam.put(ConstantWebContext.request_localePram, localePram); // 设置国际化当前语言环境
		queryParam.put(ConstantWebContext.request_i18nColumnSuffix, I18NPlugin.columnSuffix(localePram)); // 设置国际化动态列后缀
		
		// 分拣请求参数
		Enumeration<String> paramNames = controller.getParaNames();
		String name = null;
		String value = null;
		String key = null;
		while (paramNames.hasMoreElements()) {
			name = paramNames.nextElement();
			value = controller.getPara(name);
			// 是否以_query.开头
			if (name.startsWith(ConstantWebContext.request_query) && null != value && !value.trim().isEmpty()) {
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
		
		// 排序条件
		String orderColunm = controller.getPara(ConstantWebContext.request_orderColunm);
		if(null != orderColunm && !orderColunm.isEmpty()){
			log.debug("分页，排序条件：orderColunm = " + orderColunm);
			
//			if(ToolSqlXml.keywordVali(orderColunm)){
//				log.error("排序列包含不安全字符：" + orderColunm);
//				throw new RuntimeException("排序列包含不安全字符：" + orderColunm);
//			}
			
			splitPage.setOrderColunm(orderColunm);
		}

		// 排序方式
		String orderMode = controller.getPara(ConstantWebContext.request_orderMode);
		if(null != orderMode && !orderMode.isEmpty()){
			log.debug("分页，排序方式：orderMode = " + orderMode);

//			if(ToolSqlXml.keywordVali(orderMode)){
//				log.error("排序方式包含不安全字符：" + orderMode);
//				throw new RuntimeException("排序方式包含不安全字符：" + orderMode);
//			}
			
			splitPage.setOrderMode(orderMode);
		}

		// 第几页
		String pageNumber = controller.getPara(ConstantWebContext.request_pageNumber);
		if(null != pageNumber && !pageNumber.isEmpty()){
			log.debug("分页，第几页：pageNumber = " + pageNumber);
			splitPage.setPageNumber(Integer.parseInt(pageNumber));
		}
		
		// 每页显示几多
		String pageSize = controller.getPara(ConstantWebContext.request_pageSize);
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
			Object valueObj = dataParse(type, value); // 数据类型解析
			field.set(controller, valueObj);
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
	
	/**
	 * 数据类型解析
	 * @param type
	 * @param value
	 * @return
	 */
	private Object dataParse(String type, String value){
		switch (type) {
		case "String":
			return value;

		case "int":
			return Integer.parseInt(value);

		case "Integer":
			return Integer.valueOf(value);

		case "long":
			return Long.parseLong(value);

		case "Long":
			return Long.valueOf(value);

		case "double":
			return Double.parseDouble(value);

		case "Double":
			return Double.valueOf(value);

		case "float":
			return Float.parseFloat(value);

		case "Float":
			return Float.valueOf(value);

		case "short":
			return Short.parseShort(value);
			
		case "Short":
			return Short.valueOf(value);
			
		case "BigDecimal":
			BigDecimal bdValue = new BigDecimal(value);
			return bdValue;
			
		case "boolean":
			return Boolean.getBoolean(value);

		case "Boolean":
			return Boolean.valueOf(value);

		case "char":
			return value.toCharArray()[0];

		case "Character":
			return Character.valueOf(value.toCharArray()[0]);

		case "Date":
			int dateLength = value.length();
			switch (dateLength) {
			case ToolDateTime.pattern_ym_length:
				return ToolDateTime.parse(value, ToolDateTime.pattern_ym);

			case ToolDateTime.pattern_ymd_length:
				return ToolDateTime.parse(value, ToolDateTime.pattern_ymd);

			case ToolDateTime.pattern_ymd_hm_length:
				return ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hm);

			case ToolDateTime.pattern_ymd_hms_length:
				return ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms);

			case ToolDateTime.pattern_ymd_hms_s_length:
				return ToolDateTime.parse(value, ToolDateTime.pattern_ymd_hms_s);

			default:
				log.debug("没有解析到有效字段日期长度类型");
				return null;
			}
			
		default:
			log.debug("没有解析到有效字段类型");
			return null;
		}
	}
	
}
