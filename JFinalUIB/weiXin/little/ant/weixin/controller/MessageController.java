package little.ant.weixin.controller;

import little.ant.pingtai.controller.BaseController;
import little.ant.pingtai.tools.ToolContext;
import little.ant.weixin.service.MessageService;
import little.ant.weixin.tools.ToolOAuth2;
import little.ant.weixin.tools.ToolSignature;
import little.ant.weixin.validator.KeywordValidator;
import little.ant.weixin.vo.oauth.RecevieOauth2Token;
import little.ant.weixin.vo.oauth.RecevieSNSUserInfo;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 接收微信消息
 * @author 董华健
 */
public class MessageController extends BaseController {

	private static Logger log = Logger.getLogger(MessageController.class);
	
	private MessageService messageService = new MessageService();
	
	/**
	 * 1.在开发者首次提交验证申请时，微信服务器将发送GET请求到填写的URL上，并且带上四个参数（signature、timestamp、nonce、echostr），
	 * 开发者通过对签名（即signature）的效验，来判断此条消息的真实性。
	 * 
	 * 2.此后，每次开发者接收用户消息的时候，微信也都会带上前面三个参数（signature、timestamp、nonce）访问开发者设置的URL，
	 * 开发者依然通过对签名的效验判断此条消息的真实性。效验方式与首次提交验证申请一致。 
	 */
	@Before(KeywordValidator.class)
	public void index(){
		String echostr  = getPara("echostr");	//随机字符串
		String timestamp = getPara("timestamp");//时间戳
		String signature = getPara("signature");//微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数
		String nonce = getPara("nonce");
		boolean flag = ToolSignature.checkSignature(signature, timestamp, nonce);
		if(echostr != null && !echostr.isEmpty()){ // 验证URL有效性
			log.info("开发者验证");
			if(flag){
				renderText(echostr);
				return;
			}
		}else{
			if(flag){
				String accountId = getPara("accountId");// 公众账号标识
				String recverMsg = ToolContext.requestStream(getRequest());
				log.info("接收微信发送过来的消息" + recverMsg);
				String responseMsg = messageService.messageProcess(accountId, recverMsg);
				log.info("返回消息" + responseMsg);
				renderText(responseMsg);
				return;
			}
		}
		renderText("");
	}
	
	/**
	 * 授权后的回调请求处理
	 */
	@Before(KeywordValidator.class)
	public void oauth2(){
		String code = getPara("code");// 用户同意授权后，能获取到code
		String timestamp = getPara("timestamp");//时间戳
		String signature = getPara("signature");//微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数
		String nonce = getPara("nonce");
		boolean flag = ToolSignature.checkSignature(signature, timestamp, nonce);
		if(!"authdeny".equals(code) && flag){
			// 获取网页授权access_token
			RecevieOauth2Token weixinOauth2Token = ToolOAuth2.getOauth2AccessToken("APPID", "APPSECRET", code);
			// 网页授权接口访问凭证
			String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			// 获取用户信息
			RecevieSNSUserInfo snsUserInfo = ToolOAuth2.getSNSUserInfo(accessToken, openId);

			// 设置要传递的参数
			setAttr("snsUserInfo", snsUserInfo);
		}
		render("/index.html");
	}
	
}
