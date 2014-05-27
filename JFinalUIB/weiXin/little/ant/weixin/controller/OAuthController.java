package little.ant.weixin.controller;

import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.OAuthService;
import little.ant.weixin.utils.ToolSignature;
import little.ant.weixin.utils.ToolWeiXinAdvanced;
import little.ant.weixin.vo.oauth.RecevieOauth2Token;
import little.ant.weixin.vo.oauth.RecevieSNSUserInfo;

import org.apache.log4j.Logger;

/**
 * 授权后的回调请求处理
 * @author 董华健
 */
public class OAuthController extends BaseController {

	private static Logger log = Logger.getLogger(OAuthController.class);
	
	private OAuthService oAuthService = new OAuthService();
	
	public void index(){
		String code = getPara("code");// 用户同意授权后，能获取到code
		String timestamp = getPara("timestamp");//时间戳
		String signature = getPara("signature");//微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数
		String nonce = getPara("nonce");
		boolean flag = ToolSignature.checkSignature(signature, timestamp, nonce);
		if(!"authdeny".equals(code) && flag){
			// 获取网页授权access_token
			RecevieOauth2Token weixinOauth2Token = ToolWeiXinAdvanced.getOauth2AccessToken("APPID", "APPSECRET", code);
			// 网页授权接口访问凭证
			String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			// 获取用户信息
			RecevieSNSUserInfo snsUserInfo = ToolWeiXinAdvanced.getSNSUserInfo(accessToken, openId);

			// 设置要传递的参数
			setAttr("snsUserInfo", snsUserInfo);
		}
		render("/index.html");
	}
	
}
