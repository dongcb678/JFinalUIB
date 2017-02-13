package com.platform.interceptor;

import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.constant.ConstantSplitPage;
import com.platform.constant.ConstantWebContext;
import com.platform.dto.SplitPage;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ServicePlugin;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolString;
import com.platform.tools.ToolTypeConverter;

/**
 * 参数封装拦截器
 * @author 董华健
 */
public class ParamPkgInterceptor implements Interceptor {
	
	private static final Log log = Log.getLog(ParamPkgInterceptor.class);
	
	@Override
	public void intercept(Invocation invoc) {
		if(log.isDebugEnabled()) log.debug("********* 封装参数值到 controller 全局变量  start *********");
		
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
			if(StrKit.notBlank(urlPara)){
				uri += "/" + urlPara;
				controller.setAttr("urlPara", urlPara + "/" + urlPara); // 设置urlPara到request
			}
			splitPage(controller, uri);
		}
		
		if(log.isDebugEnabled()) log.debug("********* 封装参数值到 controller 全局变量  end *********");
		
		invoc.invoke();
		
		if(log.isDebugEnabled()) log.debug("********* 设置全局变量值到 request start *********");

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
		
		if(log.isDebugEnabled()) log.debug("********* 设置全局变量值到 request end *********");
	}
	
	/**
	 * 分页参数处理
	 * @param controller
	 */
	private void splitPage(BaseController controller, String uri){
		SplitPage splitPage = null;
		
		// 缓存回退分页条件
		String backOff = controller.getPara();
		if((backOff != null && backOff.equals("backOff")) || controller.getParaToBoolean("backOff", false)){
			String userIds = controller.getReqSysLog().getUserids();
			if(StrKit.notBlank(userIds)){
				SplitPage splitPageCache = ToolCache.get(ConstantSplitPage.cacheStart_splitPage_backOff + userIds);
				if(splitPageCache != null && uri.startsWith(splitPageCache.getUri())){
					splitPage = splitPageCache;
				}
			}
		}
		
		if(splitPage == null){
			splitPage = new SplitPage();
		
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
				if (name.startsWith(ConstantWebContext.request_query) && StrKit.notBlank(value)) {
					if(log.isDebugEnabled()) log.debug("分页，查询参数：name = " + name + " value = " + value);
					key = name.substring(7);
					if(ToolString.regExpVali(ToolString.pattern_letter_6, key)){
						queryParam.put(key, value.trim());
					}else{
						if(log.isErrorEnabled()) log.error("分页，查询参数存在恶意提交字符：name = " + name + " value = " + value);
					}
				}
			}
			splitPage.setQueryParam(queryParam);
			
			// 排序条件
			String orderColunm = controller.getPara(ConstantWebContext.request_orderColunm);
			if(StrKit.notBlank(orderColunm)){
				if(log.isDebugEnabled()) log.debug("分页，排序条件：orderColunm = " + orderColunm);
				if(ToolString.regExpVali(ToolString.pattern_letter_6, orderColunm)){
					splitPage.setOrderColunm(orderColunm);
				}
			}
	
			// 排序方式
			String orderMode = controller.getPara(ConstantWebContext.request_orderMode);
			if(StrKit.notBlank(orderMode)){
				if(log.isDebugEnabled()) log.debug("分页，排序方式：orderMode = " + orderMode);
				if(ToolString.regExpVali(ToolString.pattern_letter_6, orderMode)){
					splitPage.setOrderMode(orderMode);
				}
			}
	
			// 第几页
			String pageNumber = controller.getPara(ConstantWebContext.request_pageNumber);
			if(StrKit.notBlank(pageNumber)){
				if(log.isDebugEnabled()) log.debug("分页，第几页：pageNumber = " + pageNumber);
				splitPage.setPageNumber(Integer.parseInt(pageNumber));
			}
			
			// 每页显示几多
			String pageSize = controller.getPara(ConstantWebContext.request_pageSize);
			if(StrKit.notBlank(pageSize)){
				if(log.isDebugEnabled()) log.debug("分页，每页显示几多：pageSize = " + pageSize);
				splitPage.setPageSize(Integer.parseInt(pageSize));
			}
		}

		// 缓存回退分页条件
		String userIds = controller.getReqSysLog().getUserids();
		if(StrKit.notBlank(userIds)){
			ToolCache.set(ConstantSplitPage.cacheStart_splitPage_backOff + userIds, splitPage);
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
			if(StrKit.isBlank(value)){
				return;
			}
			
			// 封装参数值到全局变量
			Object valueObj = ToolTypeConverter.dataParse(field.getType(), value); // 数据类型解析
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
					|| Log.class.isAssignableFrom(type)){
				return;
			}

			if(log.isDebugEnabled()) log.debug("设置全局变量到request：field name = " + name + " value = " + value);
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
