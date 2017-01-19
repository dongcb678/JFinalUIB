package com.platform.mvc.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.render.JsonRender;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantRender;
import com.platform.constant.ConstantWebContext;
import com.platform.dto.RenderBean;
import com.platform.dto.SplitPage;
import com.platform.interceptor.AuthInterceptor;
import com.platform.mvc.syslog.Syslog;
import com.platform.mvc.user.User;
import com.platform.plugin.I18NPlugin;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolString;
import com.platform.tools.ToolWeb;

/**
 * 公共Controller
 * @author 董华健
 */
public abstract class BaseController extends Controller {

	private static final Log log = Log.getLog(BaseController.class);

	/**
	 * 全局Service
	 */
	protected BaseService baseService;		// Service
	
	/**
	 * 全局变量
	 */
	protected String ids;				// 主键
	protected SplitPage splitPage;		// 分页封装
	protected List<?> list;				// 公共list
	protected Syslog reqSysLog;			// 当前访问日志
	
	/**
	 * 请求/WEB-INF/下的视图文件
	 */
	public void toUrl() {
		String toUrl = getPara(ConstantWebContext.request_toUrl);
		render(toUrl);
	}

	/**
	 * 设置日志描述
	 * @param description
	 */
	protected void setLogDesc(String description){
		log.debug("设置日志描述：" + description);
		reqSysLog.set(Syslog.column_description, description);
	}

	/**
	 * 获取当前国际化标示
	 * @return
	 */
	protected String getI18nLocalePram() {
		return getAttr(ConstantWebContext.request_localePram);
	}

	/**
	 * 获取当前国际化资源Map
	 * @return
	 */
	protected Map<String, String> getI18nMap() {
		String localePram = getAttr(ConstantWebContext.request_localePram);
		return I18NPlugin.get(localePram);
	}

	/**
	 * 获取当前国际化资源值
	 * @return
	 */
	protected String getI18nVal(String key) {
		Map<String, String> i18nMap = getI18nMap();
		return i18nMap.get(key);
	}

	/**
	 * 根据当前国际化查询字段扩展名
	 * @param i18n
	 * @return
	 */
	protected String geti18nColumnSuffix(){
		String localePram = getAttr(ConstantWebContext.request_localePram);
		return I18NPlugin.columnSuffix(localePram);
	}
	
	/**
	 * 获取项目请求根路径
	 * @return
	 */
	protected String getCxt() {
		return getAttr(ConstantWebContext.request_cxt);
	}

	/**
	 * 获取当前用户id
	 * @return
	 */
	protected String getCUserIds(){
		return getAttr(ConstantWebContext.request_cUserIds);
	}

	/**
	 * 获取当前用户
	 * @return
	 */
	protected User getCUser(){
		return getAttr(ConstantWebContext.request_cUser);
	}

	/**
	 * 获取ParamMap
	 * @return
	 */
	protected Map<String, String> getParamMap(){
		return getAttr(ConstantWebContext.request_paramMap);
	}

	/**
	 * 添加值到ParamMap
	 * @return
	 */
	protected void addToParamMap(String key, String value){
		Map<String, String> map = getAttr(ConstantWebContext.request_paramMap);
		map.put(key, value);
	}

	/**
	 * request流转字符串
	 * @return
	 */
	protected String getRequestContent(){
		return ToolWeb.requestStream(getRequest());
	}
	
	/**
	 * 重写getPara，进行二次decode解码
	 */
	@Override
	public String getPara(String name) {
		if ("GET".equalsIgnoreCase(getRequest().getMethod().toUpperCase())){
			return ToolWeb.getParam(getRequest(), name);
		}
		return super.getPara(name);
	}
	
	/**
	 * 重写renderJson，避免出现IE8下出现下载弹出框
	 */
	@Override
	public void renderJson(Object object) {
		String userAgent = getRequest().getHeader("User-Agent");
		if(userAgent.toLowerCase().indexOf("msie") != -1){
			render(new JsonRender(object).forIE());
		}else{
			super.renderJson(object);
		}
	}
	
	/**
	 * 解决IE8下下载失败的问题
	 */
	@Override
	public void renderFile(File file) {
		String userAgent = getRequest().getHeader("User-Agent");
		if(userAgent.toLowerCase().indexOf("msie") != -1){
			getResponse().reset(); 
		}
		super.renderFile(file);
	}

	/**
	 * 解决IE8下下载失败的问题
	 */
	@Override
	public void renderFile(File file, String downloadSaveFileName) {
		String userAgent = getRequest().getHeader("User-Agent");
		if(userAgent.toLowerCase().indexOf("msie") != -1){
			getResponse().reset(); 
		}
		super.renderFile(file, downloadSaveFileName);
	}

	/**
	 * 自定义render
	 * @param code 状态码
	 * @param data 返回数据
	 * @param description 描述
	 * 描述：公共render，所有的renderJson都必须返回RenderObject，包含处理状态、返回数据、失败下的状态码、失败描述
	 */
	public void renderSuccess(String code, Object data, String description) {
		RenderBean renderBean = new RenderBean();
		renderBean.setStatus(ConstantRender.render_success);
		renderBean.setData(data);
		renderBean.setDescription(description);
		renderJson(renderBean);
	}

	/**
	 * 自定义render失败
	 * @param code 状态码
	 * @param data 返回数据
	 * @param description 描述
	 * 描述：公共render，所有的renderJson都必须返回RenderObject，包含处理状态、返回数据、失败下的状态码、失败描述
	 */
	public void renderError(String code, Object data, String description) {
		RenderBean renderBean = new RenderBean();
		renderBean.setStatus(ConstantRender.render_error);
		renderBean.setCode(code);
		renderBean.setDescription(description);
		renderJson(renderBean);
	}

	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @return
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass){
		String modelName = modelClass.getSimpleName();
		String prefix = StrKit.firstCharToLowerCase(modelName) + "List";
		return getModels(modelClass, prefix, false);
	}

	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param skipConvertError
	 * @return
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass, boolean skipConvertError){
		String modelName = modelClass.getSimpleName();
		String prefix = StrKit.firstCharToLowerCase(modelName) + "List";
		return getModels(modelClass, prefix, skipConvertError);
	}
	
	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param prefix
	 * @return
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass, String prefix){
		return getModels(modelClass, prefix, false);
	}
	
	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param prefix
	 * 
	 * 描述：
	 * 		
	 * 		表单	
	 *		<input type="hidden" name="groupList[0].ids" value="111"/>
	 *		<input type="text" name="groupList[0].names" value="222"/>
	 *		
	 *		<input type="hidden" name="groupList[1].ids" value="333"/>
	 *		<input type="text" name="groupList[1].names" value="444"/>
	 *		
	 *		<input type="hidden" name="groupList[3].ids" value="555"/>
	 *		<input type="text" name="groupList[3].names" value="666"/>
	 * 
	 * 		调用方法 
	 * 		List<Group> groupList = ToolModelInjector.injectModels(getRequest(), Group.class, "groupList");
	 * 		
	 * 		// 默认的prefix是Model类的首字母小写加上List
	 * 		List<Group> groupList = ToolModelInjector.injectModels(getRequest(), Group.class); 
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass, String prefix, boolean skipConvertError){
		int maxIndex = 0;	// 最大的数组索引
		boolean zeroIndex = false; // 是否存在0索引
		
		String arrayPrefix = prefix + "[";
		String key = null;
		Enumeration<String> names = getRequest().getParameterNames();
		while (names.hasMoreElements()) {
			key = names.nextElement();
			if (key.startsWith(arrayPrefix) && key.indexOf("]") != -1) {
				int indexTemp = Integer.parseInt(key.substring(key.indexOf("[") + 1, key.indexOf("]")));
				
				if(indexTemp == 0){
					zeroIndex = true; // 是否存在0索引
				} 
				
				if(indexTemp > maxIndex){
					maxIndex = indexTemp; // 找到最大的数组索引
				}
			}
		}
		
		List<T> modelList = new ArrayList<T>();
		for (int i = 0; i <= maxIndex; i++) {
			if((i == 0 && zeroIndex) || i != 0){ // 避免表单空值时调用产生一个无用的值
				T baseModel = (T) getModel(modelClass, prefix + "[" + i + "]", skipConvertError);
				modelList.add(baseModel);
			}
		}
		
		return modelList;
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @return
	 */
	public <T> List<T> getBeans(Class<T> beanClass){
		String modelName = beanClass.getSimpleName();
		String prefix = StrKit.firstCharToLowerCase(modelName) + "List";
		return getBeans(beanClass, prefix, false);
	}

	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param skipConvertError
	 * @return
	 */
	public <T> List<T> getBeans(Class<T> beanClass, boolean skipConvertError){
		String modelName = beanClass.getSimpleName();
		String prefix = StrKit.firstCharToLowerCase(modelName) + "List";
		return getBeans(beanClass, prefix, skipConvertError);
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param prefix
	 * @return
	 */
	public <T> List<T> getBeans(Class<T> beanClass, String prefix){
		return getBeans(beanClass, prefix, false);
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param prefix
	 */
	public <T> List<T> getBeans(Class<T> beanClass, String prefix, boolean skipConvertError){
		int maxIndex = 0;	// 最大的数组索引
		boolean zeroIndex = false; // 是否存在0索引
		
		String arrayPrefix = prefix + "[";
		String key = null;
		Enumeration<String> names = getRequest().getParameterNames();
		while (names.hasMoreElements()) {
			key = names.nextElement();
			if (key.startsWith(arrayPrefix) && key.indexOf("]") != -1) {
				int indexTemp = Integer.parseInt(key.substring(key.indexOf("[") + 1, key.indexOf("]")));
				
				if(indexTemp == 0){
					zeroIndex = true; // 是否存在0索引
				} 
				
				if(indexTemp > maxIndex){
					maxIndex = indexTemp; // 找到最大的数组索引
				}
			}
		}
		
		List<T> beanList = new ArrayList<T>();
		for (int i = 0; i <= maxIndex; i++) {
			if((i == 0 && zeroIndex) || i != 0){ // 避免表单空值时调用产生一个无用的值
				T baseModel = (T) getBean(beanClass, prefix + "[" + i + "]", skipConvertError);
				beanList.add(baseModel);
			}
		}
		
		return beanList;
	}

	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @return
	 */
	public <T extends BaseModel<T>> Controller keepModels(Class<? extends T> modelClass) {
		String modelName = StrKit.firstCharToLowerCase(modelClass.getSimpleName());
		return keepModels(modelClass, modelName, false);
	}
	
	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param skipConvertError
	 * @return
	 */
	public <T extends BaseModel<T>> Controller keepModels(Class<? extends T> modelClass, boolean skipConvertError){
		String modelName = StrKit.firstCharToLowerCase(modelClass.getSimpleName());
		return keepModels(modelClass, modelName, skipConvertError);
	}

	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param modelName
	 * @return
	 */
	public <T extends BaseModel<T>> Controller keepModels(Class<? extends T> modelClass, String modelName) {
		return keepModels(modelClass, modelName, false);
	}
	
	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param modelName
	 * @param skipConvertError
	 * @return
	 */
	public <T extends BaseModel<T>> Controller keepModels(Class<? extends T> modelClass, String modelName, boolean skipConvertError) {
		if (StrKit.notBlank(modelName)) {
			List<T> model = getModels(modelClass, modelName, skipConvertError);
			setAttr(modelName, model);
		} else {
			keepPara();
		}
		return this;
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @return
	 */
	public <T> Controller keepBeans(Class<T> beanClass) {
		String modelName = StrKit.firstCharToLowerCase(beanClass.getSimpleName());
		return keepBeans(beanClass, modelName, false);
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param skipConvertError
	 * @return
	 */
	public <T> Controller keepBeans(Class<T> beanClass, boolean skipConvertError){
		String modelName = StrKit.firstCharToLowerCase(beanClass.getSimpleName());
		return keepBeans(beanClass, modelName, skipConvertError);
	}

	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param beanName
	 * @return
	 */
	public <T> Controller keepBeans(Class<T> beanClass, String beanName) {
		return keepBeans(beanClass, beanName, false);
	}
	
	/**
	 * 表单数组映射List<Bean>
	 * @param beanClass
	 * @param beanName
	 * @param skipConvertError
	 * @return
	 */
	public <T> Controller keepBeans(Class<T> beanClass, String beanName, boolean skipConvertError) {
		if (StrKit.notBlank(beanName)) {
			List<T> model = getBeans(beanClass, beanName, skipConvertError);
			setAttr(beanName, model);
		} else {
			keepPara();
		}
		return this;
	}
	
	/**
	 * 获取checkbox值，数组
	 * @param name
	 * @return
	 */
	protected String[] getParas(String name) {
		return getRequest().getParameterValues(name);
	}
	
	/**
	 * 判断验证码是否正确
	 * 
	 * @author 董华健 2012-10-30 上午10:26:04
	 * @return
	 */
	protected boolean authCode() {
		String authCodePram = getPara(ConstantWebContext.request_authCode);
		String authCodeCookie = AuthInterceptor.getAuthCode(getRequest(), getResponse());
		if (null != authCodePram && null != authCodeCookie) {
			authCodePram = authCodePram.toLowerCase();// 统一小写
			authCodeCookie = authCodeCookie.toLowerCase();// 统一小写
			try {
				String[] cookies = authCodeCookie.split(".#.");
				String authCode = cookies[0];
				long time = Long.valueOf(cookies[1]);
				long interval = (ToolDateTime.getDateByTime() - time) / 1000 / 60; // 间隔分钟

				int session = PropKit.getInt(ConstantInit.config_session_key);
				if (authCodePram.equals(authCode) && interval <= session) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				log.error("验证码处理异常，使用了已失效的cookie验证码");
				return false;
			}
		}
		return false;
	}

	/**
	 * 判断请求者和数据创建者是否一致
	 * @param entity
	 * @param user
	 * @return
	 */
	protected <T extends BaseModel<?>>  boolean authCreate(T model){
		String createids = model.getStr("createids");
		if(StrKit.notBlank(createids)){
			String cUserIds = getCUserIds();
			if(createids.equals(cUserIds)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 获取查询参数
	 * 说明：和分页分拣一样，但是应用场景不一样，主要是给查询导出的之类的功能使用
	 * @return
	 */
	protected Map<String, String> getQueryParam(){
		Map<String, String> queryParam = new HashMap<String, String>();
		Enumeration<String> paramNames = getParaNames();
		while (paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = getPara(name);
			if (name.startsWith(ConstantWebContext.request_query) && StrKit.notBlank(value)) {// 查询参数分拣
				String key = name.substring(7);
				queryParam.put(key, value.trim());
			}
		}
		
		return queryParam;
	}

	/**
	 * 设置默认排序
	 * @param colunm
	 * @param mode
	 */
	protected void defaultOrder(String colunm, String mode){
		if(StrKit.isBlank(splitPage.getOrderColunm())){
			if(ToolString.regExpVali(colunm, ToolString.regExp_letter_6)){
				splitPage.setOrderColunm(colunm);
			}
			if(ToolString.regExpVali(mode, ToolString.regExp_letter_6)){
				splitPage.setOrderMode(mode);
			}
		}
	}
	
	/**
	 * 排序条件
	 * 说明：和分页分拣一样，但是应用场景不一样，主要是给查询导出的之类的功能使用
	 * @return
	 */
	protected String getOrderColunm(){
		String orderColunm = getPara(ConstantWebContext.request_orderColunm);
		return orderColunm;
	}

	/**
	 * 排序方式
	 * 说明：和分页分拣一样，但是应用场景不一样，主要是给查询导出的之类的功能使用
	 * @return
	 */
	protected String getOrderMode(){
		String orderMode = getPara(ConstantWebContext.request_orderMode);
		return orderMode;
	}

	/**
	 * 分页
	 * @param splitPage		分页对象
	 * @param selectSqlId	select之后，from之前
	 * @param fromSqlId		from之后
	 */
	protected void paging(SplitPage splitPage, String selectSqlId, String fromSqlId){
		paging(ConstantInit.db_dataSource_main, splitPage, selectSqlId, fromSqlId);
	}
	
	/**
	 * 分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param sqlId
	 */
	protected void paging(String dataSource, SplitPage splitPage, String selectSqlId, String fromSqlId){
		BaseService.paging(dataSource, splitPage, selectSqlId, fromSqlId);
	}

	/**
	 * Distinct分页
	 * @param splitPage			分页对象
	 * @param sqlId				完整的分页sql语句
	 * @param distinctSqlId		分页查询distinct语句，不包含from之后
	 */
	protected void pagingDistinct(SplitPage splitPage, String selectSqlId, String distinctSqlId, String fromSqlId){
		BaseService.pagingDistinct(ConstantInit.db_dataSource_main, splitPage, selectSqlId, distinctSqlId, fromSqlId);
	}

	/**
	 * Distinct分页
	 * @param dataSource 		数据源
	 * @param splitPage			分页对象
	 * @param sqlId				完整的分页sql语句
	 * @param distinctSqlId		分页查询distinct语句，不包含from之后
	 */
	protected void pagingDistinct(String dataSource, SplitPage splitPage, String selectSqlId, String distinctSqlId, String fromSqlId){
		BaseService.pagingDistinct(dataSource, splitPage, selectSqlId, distinctSqlId, fromSqlId);
	}

	/**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
	protected String getSql(String sqlId){
		return BaseService.getSql(sqlId);
	}

    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param){
    	return BaseService.getSqlByBeetl(sqlId, param);
    }
    
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param, LinkedList<Object> list){
    	return BaseService.getSqlByBeetl(sqlId, param, list);
    }

	/************************************		get 	set 	方法		************************************************/

	public Syslog getReqSysLog() {
		return reqSysLog;
	}

	public void setReqSysLog(Syslog reqSysLog) {
		this.reqSysLog = reqSysLog;
	}

	public void setSplitPage(SplitPage splitPage) {
		this.splitPage = splitPage;
	}

}
