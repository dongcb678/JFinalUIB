package little.ant.platform.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import little.ant.platform.controller.BaseController;
import little.ant.platform.handler.GlobalHandler;
import little.ant.platform.model.Operator;
import little.ant.platform.model.Syslog;
import little.ant.platform.model.User;
import little.ant.platform.tools.ToolContext;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.tools.ToolWeb;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 权限认证拦截器
 * @author 董华健
 */
public class AuthenticationInterceptor implements Interceptor {
	
	private static Logger log = Logger.getLogger(AuthenticationInterceptor.class);
	
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
		if(invoc.getMethodName().equals("toUrl")){
			uri = ToolContext.getParam(request, "toUrl"); // 否则就是toUrl的值
		}
		
		log.info("druid特殊处理");
		if(uri.startsWith("/platform/druid")){
			uri = "/platform/druid/iframe.html"; // 所有的druid授权都绑定到一个iframe.html授权
		}
		
		log.info("获取当前用户!");
		boolean userAgentVali = true; // 是否验证userAgent，默认是
		if(uri.equals("/jf/platform/ueditor") || uri.equals("/jf/platform/upload")){ // 针对ueditor特殊处理
			userAgentVali = false;
		}
		User user = ToolContext.getCurrentUser(request, userAgentVali);// 当前登录用户
		if(null != user){
			reqSysLog.set("userids", user.getPKValue());
			contro.setAttr("cUser", user);
			contro.setAttr("cUserIds", user.getPKValue());
		}
		
		log.info("获取URI对象!");
		Object operatorObj = Operator.dao.cacheGet(uri);

		log.info("判断URI是否存在!");
		if(null == operatorObj){
			log.info("URI不存在!");
			
			log.info("访问失败时保存日志!");
			reqSysLog.set("status", "0");//失败
			reqSysLog.set("description", "URL不存在");
			reqSysLog.set("cause", "1");//URL不存在
			
			log.info("返回失败提示页面!");
			toInfoJsp(contro, 2);
			return;
		}
		
		log.info("URI存在!");
		Operator operator = (Operator) operatorObj;
		reqSysLog.set("operatorids", operator.getPKValue());
		
		if(operator.get("privilegess").equals("1")){// 是否需要权限验证
			log.info("需要权限验证!");
			if (user == null) {
				log.info("权限认证过滤器检测:未登录!");
				
				reqSysLog.set("status", "0");//失败
				reqSysLog.set("description", "未登录");
				reqSysLog.set("cause", "2");//2 未登录
				
				toInfoJsp(contro, 1);
				return;
			}
			
			if(!ToolContext.hasPrivilegeOperator(operator, user)){// 权限验证
				log.info("权限验证失败，没有权限!");
				
				reqSysLog.set("status", "0");//失败
				reqSysLog.set("description", "没有权限!");
				reqSysLog.set("cause", "0");//没有权限
				
				log.info("返回失败提示页面!");
				toInfoJsp(contro, 2);
				return;
			}
		}
		
		log.info("不需要权限验证、权限认证成功!!!继续处理请求...");
		
		log.info("是否需要表单重复提交验证!");
		if(operator.getStr("formtoken").equals("1")){
			String tokenRequest = ToolContext.getParam(request, "formToken");
			String tokenCookie = ToolWeb.getCookieValueByName(request, "token");
			if(null == tokenRequest || tokenRequest.equals("")){
				log.info("tokenRequest为空，无需表单验证!");
			
			}else if(null == tokenCookie || tokenCookie.equals("") || !tokenCookie.equals(tokenRequest)){
				log.info("tokenCookie为空，或者两个值不相等，把tokenRequest放入cookie!");
				ToolWeb.addCookie(response,  "", "/", true, "token", tokenRequest, 0);
				
			}else if(tokenCookie.equals(tokenRequest)){
				log.info("表单重复提交!");
				toInfoJsp(contro, 4);
				return;
				
			}else{
				log.error("表单重复提交验证异常!!!");
			}
		}
		
		log.info("权限认真成功更新日志对象属性!");
		reqSysLog.set("status", "1");//成功
		Date actionStartDate = ToolDateTime.getDate();//action开始时间
		reqSysLog.set("actionstartdate", ToolDateTime.getSqlTimestamp(actionStartDate));
		reqSysLog.set("actionstarttime", actionStartDate.getTime());

		try {
			invoc.invoke();
		} catch (Exception e) {
			e.printStackTrace();
			
			log.info("业务逻辑代码遇到异常时保存日志!");
			reqSysLog.set("status", "0");//失败
			reqSysLog.set("description", e.getMessage());
			reqSysLog.set("cause", "3");//业务代码异常
			
			log.info("返回失败提示页面!");
			toInfoJsp(contro, 5);
			
		} finally {
			
		}
	}
	
	/**
	 * 提示信息展示页
	 * @param contro
	 * @param type
	 */
	private void toInfoJsp(BaseController contro, int type) {
		if(type == 1){// 未登录处理
			contro.redirect("/jf/platform/login");
			return ;
		}

		String referer = contro.getRequest().getHeader("X-Requested-With"); 
		String toPage = "/common/msgAjax.html";
		if(null == referer || referer.isEmpty()){
			toPage = "/common/msg.html";
		}
		
		String msg = null;
		if(type == 2){// 权限验证失败处理
			msg = "权限验证失败!";
			
		}else if(type == 3){// IP验证失败
			msg = "IP验证失败!";
			
		}else if(type == 4){// 表单验证失败
			msg = "请不要重复提交表单数据!";
			
		}else if(type == 5){// 业务代码异常
			msg = "业务代码异常!";
		}
		
		contro.setAttr("referer", referer);
		contro.setAttr("msg", msg);
		contro.render(toPage);
	}
	
}
