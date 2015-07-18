package little.ant.platform.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.interceptor.AuthenticationInterceptor;
import little.ant.platform.model.BaseModel;
import little.ant.platform.model.Syslog;
import little.ant.platform.model.User;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolWeb;

/**
 * 公共Controller
 * @author 董华健
 */
public abstract class BaseController extends Controller {

	private static Logger log = Logger.getLogger(BaseController.class);
	
	/**
	 * 全局变量
	 */
	protected String ids;			// 主键
	protected SplitPage splitPage;	// 分页封装
	protected List<?> list;			// 公共list
	protected Syslog reqSysLog;		// 访问日志
	
	/**
	 * 请求/WEB-INF/下的视图文件
	 */
	public void toUrl() {
		String toUrl = getPara("toUrl");
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
	 * 获取当前请求国际化参数
	 * @return
	 */
	protected String getI18nPram() {
		return getAttr("localePram");
	}

	/**
	 * 获取当前国际化资源
	 * @return
	 */
	protected Map<String, String> getI18nMap() {
		return getAttr("i18nMap");
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
	 * 获取项目请求根路径
	 * @return
	 */
	protected String getCxt() {
		return getAttr("cxt");
	}

	/**
	 * 获取当前用户id
	 * @return
	 */
	protected String getCUserIds(){
		return getAttr("cUserIds");
	}

	/**
	 * 获取当前用户
	 * @return
	 */
	protected User getCUser(){
		return getAttr("cUser");
	}

	/**
	 * 获取ParamMap
	 * @return
	 */
	protected Map<String, String> getParamMap(){
		return getAttr("paramMap");
	}

	/**
	 * 添加值到ParamMap
	 * @return
	 */
	protected void addToParamMap(String key, String value){
		Map<String, String> map = getAttr("paramMap");
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
		String value = ToolWeb.getParam(getRequest(), name);
		return value;
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
		String authCodePram = getPara("authCode");
		String authCodeCookie = AuthenticationInterceptor.getAuthCode(getRequest());
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
			String domainStr = (String) PropertiesPlugin.getParamMapValue(ConstantInit.config_domain_key);
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
			if (name.startsWith("_query") && null != value && !value.trim().isEmpty()) {// 查询参数分拣
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
		String orderColunm = getPara("orderColunm");
		return orderColunm;
	}

	/**
	 * 排序方式
	 * 说明：和分页分拣一样，但是应用场景不一样，主要是给查询导出的之类的功能使用
	 * @return
	 */
	protected String getOrderMode(){
		String orderMode = getPara("orderMode");
		return orderMode;
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
