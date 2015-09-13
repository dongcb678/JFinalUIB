package com.weixin.tools;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.platform.tools.ToolHttp;
import com.platform.tools.ToolString;
import com.weixin.bo.qrcode.RecevieQRCode;

public class ToolQRCode {

	private static Logger log = Logger.getLogger(ToolQRCode.class);
	
	/**
	 * 创建临时带参二维码
	 * 
	 * @param accessToken 接口访问凭证
	 * @param expireSeconds 二维码有效时间，单位为秒，最大不超过1800
	 * @param sceneId 场景ID
	 * @return WeixinQRCode
	 */
	public static RecevieQRCode createTemporaryQRCode(String accessToken, int expireSeconds, int sceneId) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg = "{\"expire_seconds\": %d, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// 创建临时带参二维码
		try {
			String jsonStr = ToolHttp.post(true, requestUrl, String.format(jsonMsg, expireSeconds, sceneId), "application/json");
			RecevieQRCode weixinQRCode = JSON.parseObject(jsonStr, RecevieQRCode.class);
			return weixinQRCode;
		} catch (Exception e) {
			log.error("ToolQRCode.createTemporaryQRCode创建临时带参二维码异常，accessToken：" + accessToken + " expireSeconds：" + expireSeconds + " sceneId：" + sceneId);
			return null;
		}
	}

	/**
	 * 创建永久带参二维码
	 * 
	 * @param accessToken 接口访问凭证
	 * @param sceneId 场景ID
	 * @return ticket
	 */
	public static String createPermanentQRCode(String accessToken, int sceneId) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// 创建永久带参二维码
		try {
			String jsonStr = ToolHttp.post(true, requestUrl, String.format(jsonMsg, sceneId), "application/json");
			RecevieQRCode weixinQRCode = JSON.parseObject(jsonStr, RecevieQRCode.class);
			String ticket = weixinQRCode.getTicket();
			return ticket;
		} catch (Exception e) {
			log.error("ToolQRCode.createPermanentQRCode创建永久带参二维码异常，accessToken：" + accessToken + " sceneId：" + sceneId);
			return null;
		}
	}

	/**
	 * 根据ticket换取二维码
	 * 
	 * @param ticket 二维码ticket
	 * @param savePath 保存路径
	 */
	public static String getQRCode(String ticket, String savePath) {
		String filePath = null;
		// 拼接请求地址
		String requestUrl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";
		requestUrl = requestUrl.replace("TICKET", ToolString.urlEncode(ticket));
		try {
			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");

			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 将ticket作为文件名
			filePath = savePath + ticket + ".jpg";

			// 将微信服务器返回的输入流写入文件
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("根据ticket换取二维码成功，filePath=" + filePath);
		} catch (Exception e) {
			filePath = null;
			log.error("根据ticket换取二维码失败：{}", e);
		}
		return filePath;
	}

	public static void main(String args[]) {
		// 获取接口访问凭证
		String accessToken = ToolWeiXin.getAccessToken().getAccess_token();

		/**
		 * 创建临时二维码
		 */
		RecevieQRCode weixinQRCode = createTemporaryQRCode(accessToken, 900, 111111);
		// 临时二维码的ticket
		System.out.println(weixinQRCode.getTicket());
		// 临时二维码的有效时间
		System.out.println(weixinQRCode.getExpireSeconds());

		/**
		 * 根据ticket换取二维码
		 */
		String ticket = "gQEg7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2lIVVJ3VmJsTzFsQ0ZuQ0Y1bG5WAAIEW35+UgMEAAAAAA==";
		String savePath = "G:/download";
		// 根据ticket换取二维码
		getQRCode(ticket, savePath);
	}
}
