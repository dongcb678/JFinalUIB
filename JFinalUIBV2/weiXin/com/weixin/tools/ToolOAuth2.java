package com.weixin.tools;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.platform.tools.ToolHttp;
import com.weixin.dto.oauth.RecevieOauth2Token;
import com.weixin.dto.oauth.RecevieSNSUserInfo;

public class ToolOAuth2 {

	private static Logger log = Logger.getLogger(ToolOAuth2.class);
	
	/**
	 * 获取网页授权凭证
	 * 
	 * @param appId 公众账号的唯一标识
	 * @param appSecret 公众账号的密钥
	 * @param code
	 * @return WeixinAouth2Token
	 */
	public static RecevieOauth2Token getOauth2AccessToken(String appId, String appSecret, String code) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("SECRET", appSecret);
		requestUrl = requestUrl.replace("CODE", code);
		// 获取网页授权凭证
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			RecevieOauth2Token wat = JSON.parseObject(jsonStr, RecevieOauth2Token.class);
			return wat;
		} catch (Exception e) {
			log.error("ToolOAuth.getOauth2AccessToken获取网页授权凭证异常，appId：" + appId + " appSecret：" + appSecret + " code：" + code);
			return null;
		}
	}

	/**
	 * 刷新网页授权凭证
	 * 
	 * @param appId 公众账号的唯一标识
	 * @param refreshToken
	 * @return WeixinAouth2Token
	 */
	public static RecevieOauth2Token refreshOauth2AccessToken(String appId, String refreshToken) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("REFRESH_TOKEN", refreshToken);
		// 刷新网页授权凭证
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			RecevieOauth2Token wat = JSON.parseObject(jsonStr, RecevieOauth2Token.class);
			return wat;
		} catch (Exception e) {
			log.error("ToolOAuth.refreshOauth2AccessToken刷新网页授权凭证异常，appId：" + appId + " refreshToken：" + refreshToken);
			return null;
		}
	}
	
	/**
	 * 通过网页授权获取用户信息
	 * 
	 * @param accessToken 网页授权接口调用凭证
	 * @param openId 用户标识
	 * @return SNSUserInfo
	 */
	public static RecevieSNSUserInfo getSNSUserInfo(String accessToken, String openId) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// 通过网页授权获取用户信息
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			RecevieSNSUserInfo snsUserInfo = JSON.parseObject(jsonStr, RecevieSNSUserInfo.class);
			return snsUserInfo;
		} catch (Exception e) {
			log.error("ToolOAuth.getSNSUserInfo通过网页授权获取用户信息异常，accessToken：" + accessToken + " openId：" + openId);
			return null;
		}
	}


}
