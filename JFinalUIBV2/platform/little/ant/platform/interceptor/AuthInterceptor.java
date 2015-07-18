package little.ant.platform.interceptor;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import little.ant.platform.constant.ConstantAuth;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.controller.BaseController;
import little.ant.platform.handler.GlobalHandler;
import little.ant.platform.model.Group;
import little.ant.platform.model.Operator;
import little.ant.platform.model.Role;
import little.ant.platform.model.Station;
import little.ant.platform.model.Syslog;
import little.ant.platform.model.User;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.tools.ToolSecurityIDEA;
import little.ant.platform.tools.ToolWeb;

/**
 * 权限认证拦截器
 * @author 董华健
 * 描述：
 * 1.处理权限验证
 * 2.处理权限相关的工具类
 */
public class AuthInterceptor implements Interceptor {

	private static Logger log = Logger.getLogger(AuthInterceptor.class);

	@Override
	public void intercept(Invocation invoc) {
		BaseController contro = (BaseController) invoc.getController();
		HttpServletRequest request = contro.getRequest();
		HttpServletResponse response = contro.getResponse();

		log.info("获取reqSysLog!");
		Syslog reqSysLog = contro.getAttr(GlobalHandler.reqSysLogKey);
		contro.setReqSysLog(reqSysLog);

		log.info("获取用户请求的URI，两种形式，参数传递和直接request获取");
		String uri = invoc.getActionKey(); // 默认就是ActionKey
		if (invoc.getMethodName().equals("toUrl")) {
			uri = ToolWeb.getParam(request, "toUrl"); // 否则就是toUrl的值
		}

		log.info("druid特殊处理");
		if (uri.startsWith("/platform/druid")) {
			uri = "/platform/druid/iframe.html"; // 所有的druid授权都绑定到一个iframe.html授权
		}

		log.info("获取当前用户!");
		boolean userAgentVali = true; // 是否验证userAgent，默认是
		if (uri.equals("/jf/platform/ueditor") || uri.equals("/jf/platform/upload")) { // 针对ueditor特殊处理
			userAgentVali = false;
		}
		User user = getCurrentUser(request, response, userAgentVali);// 当前登录用户
		if (null != user) {
			reqSysLog.set("userids", user.getPKValue());
			contro.setAttr("cUser", user);
			contro.setAttr("cUserIds", user.getPKValue());
		}

		log.info("获取URI对象!");
		Object operatorObj = Operator.dao.cacheGet(uri);

		log.info("判断URI是否存在!");
		if (null == operatorObj) {
			log.info("URI不存在!");

			log.info("访问失败时保存日志!");
			reqSysLog.set("status", "0");// 失败
			reqSysLog.set("description", "URL不存在");
			reqSysLog.set("cause", "1");// URL不存在

			log.info("返回失败提示页面!");
			toInfoJsp(contro, ConstantAuth.auth_no_url, "权限认证过滤器检测：URI不存在");
			return;
		}

		log.info("URI存在!");
		Operator operator = (Operator) operatorObj;
		reqSysLog.set("operatorids", operator.getPKValue());

		if (operator.get("privilegess").equals("1")) {// 是否需要权限验证
			log.info("需要权限验证!");
			if (user == null) {
				log.info("权限认证过滤器检测:未登录!");

				reqSysLog.set("status", "0");// 失败
				reqSysLog.set("description", "未登录");
				reqSysLog.set("cause", "2");// 2 未登录

				toInfoJsp(contro, ConstantAuth.auth_no_login, "权限认证过滤器检测：未登录");
				return;
			}

			if (!hasPrivilegeUrl(user.getPKValue(), uri)) {// 权限验证
				log.info("权限验证失败，没有权限!");

				reqSysLog.set("status", "0");// 失败
				reqSysLog.set("description", "没有权限!");
				reqSysLog.set("cause", "0");// 没有权限

				log.info("返回失败提示页面!");
				toInfoJsp(contro, ConstantAuth.auth_no_permissions, "权限验证失败，您没有操作权限");
				return;
			}
		}

		log.info("不需要权限验证、权限认证成功!!!继续处理请求...");

		log.info("是否需要表单重复提交验证!");
		if (operator.getStr("formtoken").equals("1")) {
			String tokenRequest = ToolWeb.getParam(request, "formToken");
			String tokenCookie = ToolWeb.getCookieValueByName(request, "token");
			if (null == tokenRequest || tokenRequest.equals("")) {
				log.info("tokenRequest为空，无需表单验证!");

			} else if (null == tokenCookie || tokenCookie.equals("") || !tokenCookie.equals(tokenRequest)) {
				log.info("tokenCookie为空，或者两个值不相等，把tokenRequest放入cookie!");
				ToolWeb.addCookie(response, "", "/", true, "token", tokenRequest, 0);

			} else if (tokenCookie.equals(tokenRequest)) {
				log.info("表单重复提交!");
				toInfoJsp(contro, ConstantAuth.auth_form, "请不要重复提交表单");
				return;

			} else {
				log.error("表单重复提交验证异常!!!");
			}
		}

		log.info("权限认真成功更新日志对象属性!");
		reqSysLog.set("status", "1");// 成功
		Date actionStartDate = ToolDateTime.getDate();// action开始时间
		reqSysLog.set("actionstartdate", ToolDateTime.getSqlTimestamp(actionStartDate));
		reqSysLog.set("actionstarttime", actionStartDate.getTime());

		try {
			invoc.invoke();
		} catch (Exception e) {
			log.error("业务逻辑代码遇到异常时保存日志!");
			reqSysLog.set("status", "0");// 失败
			reqSysLog.set("description", e.getMessage());
			reqSysLog.set("cause", "3");// 业务代码异常

			log.error("返回失败提示页面!Exception = " + e.getMessage());
			ByteArrayOutputStream buf = new ByteArrayOutputStream();
			e.printStackTrace(new PrintWriter(buf, true));
			String expMessage = buf.toString();
			toInfoJsp(contro, ConstantAuth.auth_exception, "业务逻辑代码遇到异常Exception = " + expMessage);

		} finally {

		}
	}

	/**
	 * 提示信息展示页
	 * 
	 * @param contro
	 * @param type
	 */
	private void toInfoJsp(BaseController contro, String type, String msg) {
		if (type.equals(ConstantAuth.auth_no_login)) {// 未登录处理
			contro.redirect("/jf/platform/login");
			return;
		}

		String referer = contro.getRequest().getHeader("X-Requested-With");
		String toPage = "/common/msgAjax.html";
		if (null == referer || referer.isEmpty()) {
			toPage = "/common/msg.html";
		}

		contro.setAttr("referer", referer);
		contro.setAttr("msg", msg);
		contro.render(toPage);
	}

	/**
	 * 判断用户是否拥有某个url的操作权限
	 * 
	 * @param userIds
	 * @param url
	 * @return
	 */
	public static boolean hasPrivilegeUrl(String userIds, String url) {
		// 基于缓存查询operator
		Operator operator = Operator.dao.cacheGet(url);
		if (null == operator) {
			log.error("URL缓存不存在：" + url);
			return false;
		}

		// 基于缓存查询user
		Object userObj = User.dao.cacheGet(userIds);
		if (null == userObj) {
			log.error("用户缓存不存在：" + userIds);
			return false;
		}
		User user = (User) userObj;

		// 权限验证对象
		String operatorIds = operator.getPKValue() + ",";
		String groupIds = user.getStr("groupids");
		String stationIds = user.getStr("stationids");

		// 根据分组查询权限
		if (null != groupIds) {
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = Group.dao.cacheGet(groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				if (null == roleIdsStr || roleIdsStr.equals("")) {
					continue;
				}
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = Role.dao.cacheGet(roleIdsTemp);
					String operatorIdsStr = role.getStr("operatorids");
					if (operatorIdsStr.indexOf(operatorIds) != -1) {
						return true;
					}
				}
			}
		}

		// 根据岗位查询权限
		if (null != stationIds) {
			String[] stationIdsArr = stationIds.split(",");
			for (String ids : stationIdsArr) {
				Station station = Station.dao.cacheGet(ids);
				String operatorIdsStr = station.getStr("operatorids");
				if (null == operatorIdsStr || operatorIdsStr.equals("")) {
					continue;
				}
				if (operatorIdsStr.indexOf(operatorIds) != -1) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * 获取当前登录用户
	 * @param request
	 * @param response
	 * @param userAgentVali 是否验证 User-Agent
	 * @return
	 */
	public static User getCurrentUser(HttpServletRequest request, HttpServletResponse response, boolean userAgentVali) {
		String loginCookie = ToolWeb.getCookieValueByName(request, "authmark");
		if (null != loginCookie && !loginCookie.equals("")) {
			// 1.解密数据
			String data = ToolSecurityIDEA.decrypt(loginCookie);
			String[] datas = data.split(".#.");	//arr[0]：时间戳，arr[1]：USERID，arr[2]：USER_IP， arr[3]：USER_AGENT
			
			// 2. 分解获取数据
			long loginDateTimes = Long.parseLong(datas[0]);// 时间戳
			String userIds = datas[1];// 用户id
			String ips = datas[2];// ip地址
			String userAgent = datas[3];// USER_AGENT
			boolean autoLogin = Boolean.valueOf(datas[4]);// autoLogin
			
			String newIp = ToolWeb.getIpAddr(request);
			String newUserAgent = request.getHeader("User-Agent");

			Date start = ToolDateTime.getDate();
			start.setTime(loginDateTimes);
			int day = ToolDateTime.getDateDaySpace(start, ToolDateTime.getDate());
			
			int maxAge = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_maxAge_key)).intValue();
			
			// 4. 验证数据有效性
			if (ips.equals(newIp) && (userAgentVali ? userAgent.equals(newUserAgent) : true) && day <= maxAge) {
				// 如果不记住密码，单次登陆有效时间验证
				if(!autoLogin){
					int minute = ToolDateTime.getDateMinuteSpace(start, new Date());
					int session = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_session_key)).intValue();
					if(minute > session){
						return null;
					}else{
						// 重新生成认证cookie，目的是更新时间戳
						long date = ToolDateTime.getDateByTime();
						StringBuilder token = new StringBuilder();// 时间戳.#.USERID.#.USER_IP.#.USER_AGENT.#.autoLogin
						token.append(date).append(".#.").append(userIds).append(".#.").append(ips).append(".#.").append(userAgent).append(".#.").append(autoLogin);
						String authmark = ToolSecurityIDEA.encrypt(token.toString());
						
						// 添加到Cookie
						int maxAgeTemp = -1; // 设置cookie有效时间
						ToolWeb.addCookie(response,  "", "/", true, "authmark", authmark, maxAgeTemp);
					}
				}
				
				// 返回用户数据
				Object userObj = User.dao.cacheGet(userIds);
				if (null != userObj) {
					User user = (User) userObj;
					return user;
				}
			}
		}

		return null;
	}

	/**
	 * 设置当前登录用户
	 * @param request
	 * @param response
	 * @param user
	 * @param autoLogin
	 */
	public static void setCurrentUser(HttpServletRequest request, HttpServletResponse response, User user, boolean autoLogin) {
		// 1.设置cookie有效时间
		int maxAgeTemp = -1;
		if (autoLogin) {
			maxAgeTemp = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_maxAge_key)).intValue();
		}

		// 2.设置用户名到cookie
		ToolWeb.addCookie(response, "", "/", true, "userName", user.getStr("username"), maxAgeTemp);

		// 3.生成登陆认证cookie
		String userIds = user.getPKValue();
		String ips = ToolWeb.getIpAddr(request);
		String userAgent = request.getHeader("User-Agent");
		long date = ToolDateTime.getDateByTime();
		
		StringBuilder token = new StringBuilder();// 时间戳.#.USERID.#.USER_IP.#.USER_AGENT.#.autoLogin
		token.append(date).append(".#.").append(userIds).append(".#.").append(ips).append(".#.").append(userAgent).append(".#.").append(autoLogin);
		String authmark = ToolSecurityIDEA.encrypt(token.toString());
		
		// 4. 添加到Cookie
		ToolWeb.addCookie(response,  "", "/", true, "authmark", authmark, maxAgeTemp);
	}
	
	/**
	 * 设置验证码
	 * @param response
	 * @param authCode
	 */
	public static void setAuthCode(HttpServletResponse response, String authCode){
		// 1.生成验证码加密cookie
		String authCodeCookie = ToolSecurityIDEA.encrypt(authCode);
		
		// 2.设置登陆验证码cookie
		int maxAgeTemp = -1;
		ToolWeb.addCookie(response,  "", "/", true, "authCode", authCodeCookie, maxAgeTemp);
	}

	/**
	 * 获取验证码
	 * @param request
	 * @return
	 */
	public static String getAuthCode(HttpServletRequest request){
		// 1.获取cookie加密数据
		String authCode = ToolWeb.getCookieValueByName(request, "authCode");
		if (null != authCode && !authCode.equals("")) {
			// 2.解密数据
			authCode = ToolSecurityIDEA.decrypt(authCode);
			return authCode;
		}
		return null;
	}

}
