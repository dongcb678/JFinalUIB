package com.platform.mvc.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.JsonRender;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantWebContext;
import com.platform.dto.SplitPage;
import com.platform.interceptor.AuthInterceptor;
import com.platform.mvc.syslog.Syslog;
import com.platform.mvc.user.User;
import com.platform.plugin.I18NPlugin;
import com.platform.tools.ToolModelInjector;
import com.platform.tools.ToolWeb;

/**
 * 公共Controller
 * @author 董华健
 */
public abstract class BaseController extends Controller {

	private static Logger log = Logger.getLogger(BaseController.class);

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
	protected Syslog reqSysLog;			// 访问日志
	
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
		getResponse().reset(); 
		super.renderFile(file);
	}

	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @return
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass){
		return ToolModelInjector.injectModels(getRequest(), modelClass);
	}
	
	/**
	 * 表单数组映射List<Model>
	 * @param modelClass
	 * @param prefix
	 * @return
	 */
	public <T extends BaseModel<T>> List<T> getModels(Class<? extends T> modelClass, String prefix){
		return ToolModelInjector.injectModels(getRequest(), modelClass, prefix);
	}

	/**
	 * 表单数组映射Record
	 * @param modelClass
	 * @return
	 */
	public <T extends BaseModel<T>> Record getRecord(Class<? extends T> modelClass){
		return getModel(modelClass).toRecord();
	}
	
	/**
	 * 表单数组映射Record
	 * @param modelClass
	 * @param modelName
	 * @return
	 */
	public <T extends BaseModel<T>> Record getRecord(Class<? extends T> modelClass, String modelName){
		return getModel(modelClass, modelName).toRecord();
	}
	
	/**
	 * 表单数组映射List<Record>
	 * @param modelClass
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public <T extends BaseModel<T>> List<Record> getRecords(Class<? extends T> modelClass){
		List<T> models = ToolModelInjector.injectModels(getRequest(), modelClass);
		List<Record> records = new ArrayList<Record>(models.size());
		for (BaseModel model : models) {
			records.add(model.toRecord());
		}
		return records;
	}
	
	/**
	 * 表单数组映射List<Record>
	 * @param modelClass
	 * @param prefix
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public <T extends BaseModel<T>> List<Record> getRecords(Class<? extends T> modelClass, String prefix){
		List<T> models = ToolModelInjector.injectModels(getRequest(), modelClass, prefix);
		List<Record> records = new ArrayList<Record>(models.size());
		for (BaseModel model : models) {
			records.add(model.toRecord());
		}
		return records;
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
		String authCodeCookie = AuthInterceptor.getAuthCode(getRequest());
		if (null != authCodePram && null != authCodeCookie) {
			authCodePram = authCodePram.toLowerCase();// 统一小写
			authCodeCookie = authCodeCookie.toLowerCase();// 统一小写
			if (authCodePram.equals(authCodeCookie)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 效验Referer有效性
	 * 
	 * @author 董华健 2012-10-30 上午10:26:04
	 * @return
	 */
	protected boolean authReferer() {
		String referer = getRequest().getHeader("Referer");
		if (null != referer && !referer.trim().equals("")) {
			referer = referer.toLowerCase();
			String domainStr = PropKit.get(ConstantInit.config_domain_key);
			String[] domainArr = domainStr.split(",");
			for (String domain : domainArr) {
				if (referer.indexOf(domain.trim()) != -1) {
					return true;
				}
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
		if(null != createids && !createids.isEmpty()){
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
			if (name.startsWith(ConstantWebContext.request_query) && null != value && !value.trim().isEmpty()) {// 查询参数分拣
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
		if(null == splitPage.getOrderColunm() || splitPage.getOrderColunm().isEmpty()){
			splitPage.setOrderColunm(colunm);
			splitPage.setOrderMode(mode);
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
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param sqlId
	 */
	protected void paging(String dataSource, SplitPage splitPage, String selectSqlId, String fromSqlId){
		baseService.paging(dataSource, splitPage, selectSqlId, fromSqlId);
	}

	/**
	 * Distinct分页
	 * @param dataSource 		数据源
	 * @param splitPage			分页对象
	 * @param sqlId				完整的分页sql语句
	 * @param distinctSqlId		分页查询distinct语句，不包含from之后
	 */
	protected void pagingDistinct(String dataSource, SplitPage splitPage, String selectSqlId, String distinctSqlId, String fromSqlId){
		baseService.pagingDistinct(dataSource, splitPage, selectSqlId, distinctSqlId, fromSqlId);
	}

	/**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
	protected String getSql(String sqlId){
		return baseService.getSql(sqlId);
	}

    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param){
    	return baseService.getSqlByBeetl(sqlId, param);
    }
    
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param, LinkedList<Object> list){
    	return baseService.getSqlByBeetl(sqlId, param, list);
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
