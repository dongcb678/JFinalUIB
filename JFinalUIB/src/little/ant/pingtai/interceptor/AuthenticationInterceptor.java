package little.ant.pingtai.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import little.ant.pingtai.common.ContextBase;
import little.ant.pingtai.common.EhcacheFactory;
import little.ant.pingtai.common.ParamInit;
import little.ant.pingtai.controller.BaseController;
import little.ant.pingtai.handler.GlobalHandler;
import little.ant.pingtai.model.Operator;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.model.User;
import little.ant.pingtai.utils.ToolWeb;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

/**
 * 参数封装拦截器：param packaging interceptor
 * @author 董华健
 */
public class AuthenticationInterceptor implements Interceptor {
	
	private static Logger log = Logger.getLogger(AuthenticationInterceptor.class);
	
	@Override
	public void intercept(ActionInvocation ai) {
		BaseController contro = (BaseController) ai.getController();
		HttpServletRequest request = contro.getRequest();
		HttpServletResponse response = contro.getResponse();
		
		log.info("获取reqSysLog!");
		Syslog reqSysLog = contro.getAttr(GlobalHandler.reqSysLogKey);
		contro.setReqSysLog(reqSysLog);
		
		log.info("获取用户请求的URI，两种形式，参数传递和直接request获取");
		String uri = ContextBase.getParam(request, "toUrl");
		if (null == uri || uri.equals("")) {
			uri = request.getServletPath();
			
			int index = uri.lastIndexOf("/");
			String deleteUri = uri.substring(index);
			if(deleteUri.length() == 33){
				log.debug("例如：jf/user/view/8a40c0353fa828a6013fa898d4ac0020 需要去除 /8a40c0353fa828a6013fa898d4ac0020");
				log.info("去除最后的/ids：" + uri);
				uri = uri.substring(0, index);
			}
		}

		log.info("druid特殊处理");
		if(uri.startsWith("/druid/")){
			uri = "/pingtai/druid/iframe.html";
		}
		
		log.info("获取URI对象!");
		Object operatorObj = EhcacheFactory.getInstance().get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_operator + uri);

		log.info("判断URI是否存在!");
		if(null != operatorObj){
			log.info("URI存在!");
			
			Operator operator = (Operator) operatorObj;
			reqSysLog.set("operatorids", operator.get("ids"));
			
			if(operator.get("privilege").equals("1")){// 是否需要权限验证
				log.info("需要权限验证!");
				User user = ContextBase.getCurrentUser(request);// 当前登录用户
				if (user == null) {
					log.info("权限认证过滤器检测:未登录!");
					
					log.info("访问失败时保存日志!");
					reqSysLog.set("status", "0");//失败
					reqSysLog.set("description", "未登录");
					reqSysLog.set("cause", "2");//2 未登录
					
					toInfoJsp(contro, 1);
					return;
				}
				
				reqSysLog.set("userids", user.get("ids"));
				if(!ContextBase.hasPrivilegeOperator(operator, user)){// 权限验证
					log.info("权限验证失败，没有权限!");
					
					log.info("访问失败时保存日志!");
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
				String tokenRequest = ContextBase.getParam(request, "formToken");
				String tokenCookie = ToolWeb.getCookieValueByName(request, "token");
				if(null == tokenRequest || tokenRequest.equals("")){
					log.info("tokenRequest为空，无需表单验证!");
				
				}else if(null == tokenCookie || tokenCookie.equals("") || !tokenCookie.equals(tokenRequest)){
					log.info("tokenCookie为空，或者两个值不相等，把tokenRequest放入cookie!");
					ToolWeb.addCookie(response, "token", tokenRequest, 0);
					
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
			Date actionStartDate = new Date();//action开始时间
			reqSysLog.set("actionstartdate", new java.sql.Timestamp(actionStartDate.getTime()));
			reqSysLog.set("actionstarttime", actionStartDate.getTime());

			try {
				ai.invoke();
			} catch (Exception e) {
				log.info("业务逻辑代码遇到异常时保存日志!");
				reqSysLog.set("status", "0");//失败
				reqSysLog.set("description", "URL不存在");
				reqSysLog.set("cause", "3");//业务代码异常
				
				log.info("返回失败提示页面!");
				toInfoJsp(contro, 5);
				
			} finally {
				
			}
			
		}else{
			log.info("URI不存在!");
			
			log.info("访问失败时保存日志!");
			reqSysLog.set("status", "0");//失败
			reqSysLog.set("description", "URL不存在");
			reqSysLog.set("cause", "1");//URL不存在
			
			log.info("返回失败提示页面!");
			toInfoJsp(contro, 2);
			return;
		}
	}
	
	/**
	 * 提示信息展示页
	 * @param contro
	 * @param type
	 */
	private void toInfoJsp(BaseController contro, int type) {
		if(type == 1){// 未登录处理
			contro.render("/login/logout");
			return ;
		}

		String referer = contro.getRequest().getHeader("Referer"); 
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
