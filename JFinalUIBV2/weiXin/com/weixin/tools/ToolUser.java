package com.weixin.tools;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.platform.tools.ToolHttp;
import com.weixin.dto.user.RecevieUserInfo;
import com.weixin.dto.user.RecevieUserList;

public class ToolUser {

	private static Logger log = Logger.getLogger(ToolUser.class);
	
	/**
	 * 获取用户信息
	 * 
	 * @param accessToken 接口访问凭证
	 * @param openId 用户标识
	 * @return WeixinUserInfo
	 */
	public static RecevieUserInfo getUserInfo(String accessToken, String openId) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// 获取用户信息
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			RecevieUserInfo weixinUserInfo = JSONObject.parseObject(jsonStr, RecevieUserInfo.class);
			return weixinUserInfo;
		} catch (Exception e) {
			log.error("ToolUser.getUserInfo获取用户信息异常，accessToken：" + accessToken + " openId：" + openId);
			return null;
		}
	}

	/**
	 * 获取关注者列表
	 * 
	 * @param accessToken 调用接口凭证
	 * @param nextOpenId 第一个拉取的openId，不填默认从头开始拉取
	 * @return WeixinUserList
	 */
	public static RecevieUserList getUserList(String accessToken, String nextOpenId) {
		if (null == nextOpenId){
			nextOpenId = "";
		}
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("NEXT_OPENID", nextOpenId);
		// 获取关注者列表
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			RecevieUserList weixinUserList = JSONObject.parseObject(jsonStr, RecevieUserList.class);
			return weixinUserList;
		} catch (Exception e) {
			log.error("ToolUser.getUserInfo获取用户信息异常，accessToken：" + accessToken + " nextOpenId：" + nextOpenId);
			return null;
		}
	}

	public static void main(String args[]) {
		// 获取接口访问凭证
		String accessToken = ToolWeiXin.getAccessToken().getAccess_token();
		
		/**
		 * 获取用户信息
		 */
		RecevieUserInfo user = getUserInfo(accessToken, "oEdzejiHCDqafJbz4WNJtWTMbDcE");
		System.out.println("OpenID：" + user.getOpenId());
		System.out.println("关注状态：" + user.getSubscribe());
		System.out.println("关注时间：" + user.getSubscribeTime());
		System.out.println("昵称：" + user.getNickname());
		System.out.println("性别：" + user.getSex());
		System.out.println("国家：" + user.getCountry());
		System.out.println("省份：" + user.getProvince());
		System.out.println("城市：" + user.getCity());
		System.out.println("语言：" + user.getLanguage());
		System.out.println("头像：" + user.getHeadImgUrl());
		
		/**
		 * 获取关注者列表
		 */
		RecevieUserList weixinUserList = getUserList(accessToken, "");
		System.out.println("总关注用户数：" + weixinUserList.getTotal());
		System.out.println("本次获取用户数：" + weixinUserList.getCount());
		System.out.println("OpenID列表：" + weixinUserList.getOpenIdList().toString());
		System.out.println("next_openid：" + weixinUserList.getNextOpenId());
	}
}
