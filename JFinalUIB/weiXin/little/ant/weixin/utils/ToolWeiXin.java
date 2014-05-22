package little.ant.weixin.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import little.ant.pingtai.utils.ToolHttpClient;
import little.ant.weixin.vo.RecevieEventLocation;
import little.ant.weixin.vo.RecevieEventMenu;
import little.ant.weixin.vo.RecevieEventQRCode;
import little.ant.weixin.vo.RecevieEventSubscribe;
import little.ant.weixin.vo.RecevieMsgImage;
import little.ant.weixin.vo.RecevieMsgLink;
import little.ant.weixin.vo.RecevieMsgLocation;
import little.ant.weixin.vo.RecevieMsgText;
import little.ant.weixin.vo.RecevieMsgVideo;
import little.ant.weixin.vo.RecevieMsgVoice;
import little.ant.weixin.vo.RecevieToken;

import com.alibaba.fastjson.JSON;

/**
 * 微信工具类
 * @author 董华健
 */
public class ToolWeiXin {
	
	/**
	 * 通讯常量
	 */
	public static String weixin_appID;
	public static String weixin_appSecret;
	public static String weixin_tokenUrl;
	public static String weixin_mediaUploadUrl;
	public static String weixin_mediaGetUrl;

	/**
	 * 事件类型
	 */
	public static final String recevie_event = "event";
	public static final String recevie_event_subscribe = "subscribe";
	public static final String recevie_event_unsubscribe = "unsubscribe";
	public static final String recevie_event_scan = "SCAN";
	public static final String recevie_event_location = "LOCATION";
	public static final String recevie_event_click = "CLICK";
	public static final String recevie_event_view = "VIEW";
	
	/**
	 * 消息类型
	 */
	public static final String recevie_msg_text = "text";
	public static final String recevie_msg_image = "image";
	public static final String recevie_msg_voice = "voice";
	public static final String recevie_msg_video = "video";
	public static final String recevie_msg_location = "location";
	public static final String recevie_msg_link = "link";
	
	/**
	 * 开发者的Token
	 */
	public static final String token = "weixinchat" ;
	
	/**
	 * 错误码Map
	 */
	private static Map<String, String> errCode = new HashMap<String , String>();
	
	/**
	 * 返回正确的响应信息
	 * @param code
	 * @return
	 */
	public static String getMessage(String code){
		return errCode.get(code);
	}
	
	/**
	 * 从微信得到accessToken的凭证
	 * @return
	 */
	public static RecevieToken getAccessToken() {
		StringBuffer sb = new StringBuffer();
		sb.append(weixin_tokenUrl).append("?").append("grant_type=client_credential");
		sb.append("&appid=").append(weixin_appID);
		sb.append("&secret=").append(weixin_appSecret);
		String jsonStr = ToolHttpClient.get(sb.toString());
		RecevieToken weiXinVo = JSON.parseObject(jsonStr, RecevieToken.class);
		return weiXinVo;
	}

	/**
	 * 订阅
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_subscribe(RecevieEventSubscribe subscribe){
		StringBuffer sb = new StringBuffer();
		String toUserName = subscribe.getToUserName();// 开发者
		String fromUserName = subscribe.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[订阅]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 订阅：扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_subscribe_scan(RecevieEventQRCode qrCode){
		StringBuffer sb = new StringBuffer();
		String toUserName = qrCode.getToUserName();// 开发者
		String fromUserName = qrCode.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件1]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 取消订阅
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_unsubscribe(RecevieEventSubscribe subscribe){
		StringBuffer sb = new StringBuffer();
		String toUserName = subscribe.getToUserName();// 开发者
		String fromUserName = subscribe.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[取消订阅]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
	 * @param qrCode
	 * @return
	 */
	public static String recevie_event_scan(RecevieEventQRCode qrCode){
		StringBuffer sb = new StringBuffer();
		String toUserName = qrCode.getToUserName();// 开发者
		String fromUserName = qrCode.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 上报地理位置事件
	 * @param location
	 * @return
	 */
	public static String recevie_event_location(RecevieEventLocation location){
		StringBuffer sb = new StringBuffer();
		String toUserName = location.getToUserName();// 开发者
		String fromUserName = location.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 点击菜单拉取消息时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_click(RecevieEventMenu menu){
		StringBuffer sb = new StringBuffer();
		String toUserName = menu.getToUserName();// 开发者
		String fromUserName = menu.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[点击菜单拉取消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 点击菜单跳转链接时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_view(RecevieEventMenu menu){
		StringBuffer sb = new StringBuffer();
		String toUserName = menu.getToUserName();// 开发者
		String fromUserName = menu.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[点击菜单跳转链接]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 文本消息
	 * @param text
	 * @return
	 */
	public static String recevie_msg_text(RecevieMsgText text){
		StringBuffer sb = new StringBuffer();
		String toUserName = text.getToUserName();//开发者
		String fromUserName = text.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[文本消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 图片消息
	 * @param image
	 * @return
	 */
	public static String recevie_msg_image(RecevieMsgImage image){
		StringBuffer sb = new StringBuffer();
		String toUserName = image.getToUserName();//开发者
		String fromUserName = image.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[图片消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 语音消息
	 * @param voice
	 * @return
	 */
	public static String recevie_msg_voice(RecevieMsgVoice voice){
		StringBuffer sb = new StringBuffer();
		String toUserName = voice.getToUserName();//开发者
		String fromUserName = voice.getFromUserName();//发送者
		String recognition = voice.getRecognition();// 语音识别结果
		if(null != recognition){//接收语音识别结果
			
		}else{
			
		}
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[语音消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 视频消息
	 * @param video
	 * @return
	 */
	public static String recevie_msg_video(RecevieMsgVideo video){
		StringBuffer sb = new StringBuffer();
		String toUserName = video.getToUserName();//开发者
		String fromUserName = video.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[视频消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 地理位置消息
	 * @param location
	 * @return
	 */
	public static String recevie_msg_location(RecevieMsgLocation location){
		StringBuffer sb = new StringBuffer();
		String toUserName = location.getToUserName();//开发者
		String fromUserName = location.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[地理位置消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 链接消息
	 * @param link
	 * @return
	 */
	public static String recevie_msg_link(RecevieMsgLink link){
		StringBuffer sb = new StringBuffer();
		String toUserName = link.getToUserName();//开发者
		String fromUserName = link.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[链接消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	static {
		errCode.put("-1", "系统繁忙");
		errCode.put("0", "请求成功");
		errCode.put("40001", "获取access_token时AppSecret错误，或者access_token无效");
		errCode.put("40002", "不合法的凭证类型");
		errCode.put("40003", "不合法的OpenID");
		errCode.put("40004", "不合法的媒体文件类型");
		errCode.put("40005", "不合法的文件类型");
		errCode.put("40006", "不合法的文件大小");
		errCode.put("40007", "不合法的媒体文件id");
		errCode.put("40008", "不合法的消息类型");
		errCode.put("40009", "不合法的图片文件大小");
		errCode.put("40010", "不合法的语音文件大小");
		errCode.put("40011", "不合法的视频文件大小");
		errCode.put("40012", "不合法的缩略图文件大小");
		errCode.put("40013", "不合法的APPID");
		errCode.put("40014", "不合法的access_token");
		errCode.put("40015", "不合法的菜单类型");
		errCode.put("40016", "不合法的按钮个数");
		errCode.put("40017", "不合法的按钮个数");
		errCode.put("40018", "不合法的按钮名字长度");
		errCode.put("40019", "不合法的按钮KEY长度");
		errCode.put("40020", "不合法的按钮URL长度");
		errCode.put("40021", "不合法的菜单版本号");
		errCode.put("40022", "不合法的子菜单级数");
		errCode.put("40023", "不合法的子菜单按钮个数");
		errCode.put("40024", "不合法的子菜单按钮类型");
		errCode.put("40025", "不合法的子菜单按钮名字长度");
		errCode.put("40026", "不合法的子菜单按钮KEY长度");
		errCode.put("40027", "不合法的子菜单按钮URL长度");
		errCode.put("40028", "不合法的自定义菜单使用用户");
		errCode.put("40029", "不合法的oauth_code");
		errCode.put("40030", "不合法的refresh_token");
		errCode.put("40031", "不合法的openid列表");
		errCode.put("40032", "不合法的openid列表长度");
		errCode.put("40033", "不合法的请求字符，不能包含\\uxxxx格式的字符");
		errCode.put("40035", "不合法的参数");
		errCode.put("40038", "不合法的请求格式");
		errCode.put("40039", "不合法的URL长度");
		errCode.put("40050", "不合法的分组id");
		errCode.put("40051", "分组名字不合法");
		errCode.put("41001", "缺少access_token参数");
		errCode.put("41002", "缺少appid参数");
		errCode.put("41003", "缺少refresh_token参数");
		errCode.put("41004", "缺少secret参数");
		errCode.put("41005", "缺少多媒体文件数据");
		errCode.put("41006", "缺少media_id参数");
		errCode.put("41007", "缺少子菜单数据");
		errCode.put("41008", "缺少oauth code");
		errCode.put("41009", "缺少openid");
		errCode.put("42001", "access_token超时");
		errCode.put("42002", "refresh_token超时");
		errCode.put("42003", "oauth_code超时");
		errCode.put("43001", "需要GET请求");
		errCode.put("43002", "需要POST请求");
		errCode.put("43003", "需要HTTPS请求");
		errCode.put("43004", "需要接收者关注");
		errCode.put("43005", "需要好友关系");
		errCode.put("44001", "多媒体文件为空");
		errCode.put("44002", "POST的数据包为空");
		errCode.put("44003", "图文消息内容为空");
		errCode.put("44004", "文本消息内容为空");
		errCode.put("45001", "多媒体文件大小超过限制");
		errCode.put("45002", "消息内容超过限制");
		errCode.put("45003", "标题字段超过限制");
		errCode.put("45004", "描述字段超过限制");
		errCode.put("45005", "链接字段超过限制");
		errCode.put("45006", "图片链接字段超过限制");
		errCode.put("45007", "语音播放时间超过限制");
		errCode.put("45008", "图文消息超过限制");
		errCode.put("45009", "接口调用超过限制");
		errCode.put("45010", "创建菜单个数超过限制");
		errCode.put("45015", "回复时间超过限制");
		errCode.put("45016", "系统分组，不允许修改");
		errCode.put("45017", "分组名字过长");
		errCode.put("45018", "分组数量超过上限");
		errCode.put("46001", "不存在媒体数据");
		errCode.put("46002", "不存在的菜单版本");
		errCode.put("46003", "不存在的菜单数据");
		errCode.put("46004", "不存在的用户");
		errCode.put("47001", "解析JSON/XML内容错误");
		errCode.put("48001", "api功能未授权");
		errCode.put("50001", "用户未授权该api");
	}

}
