package little.ant.weixin.tools;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.model.Param;
import little.ant.platform.plugin.ParamInitPlugin;
import little.ant.platform.tools.ToolHttp;
import little.ant.weixin.bo.message.RecevieToken;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 微信工具类
 * @author 董华健
 */
public class ToolWeiXin {

	private static Logger log = Logger.getLogger(ToolWeiXin.class);
	
	/**
	 * 通讯常量
	 */
	public static String weixin_token_key = "weixinToken";//开发者的Token，必须和开发者配置保持一致weixinchat
	
	public static String weixin_appID_key = "weixinAppID";
	public static String weixin_appSecret_key = "weixinAppSecret";
	
	public static String weixin_access_token = "weixin_access_token";//access_token缓存key
	
	// 获取token地址
	public static String weixin_token_url = "https://api.weixin.qq.com/cgi-bin/token";
	
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
		// 取缓存
		RecevieToken recevieToken = (RecevieToken) CacheKit.get(ConstantPlatform.cache_name_system, weixin_access_token);
		if(null != recevieToken){
			// 判断是否有效
			long interval = (new Date().getTime() - recevieToken.getDate().getTime()) / 1000; // 存在时间，秒
			long expires_in = Long.parseLong(recevieToken.getExpires_in()) - 200; //凭证有效时间，单位：秒 ，默认有效期为7200秒
			if(interval > expires_in){
				recevieToken = getAccessTokenCommon();
			}
		}else{
			recevieToken = getAccessTokenCommon();
		}
		
		return recevieToken;
	}
	
	/**
	 * 从微信得到accessToken的凭证公共代码块
	 * @return
	 */
	private static RecevieToken getAccessTokenCommon(){
		// 参数配置的 appID
		Param paramAppId = (Param) CacheKit.get(ConstantPlatform.cache_name_system, ParamInitPlugin.cacheStart_param + weixin_appID_key);
		String weixin_appID = paramAppId.getStr("val");
		
		// 参数配置的 appSecret
		Param paramAppSecret = (Param) CacheKit.get(ConstantPlatform.cache_name_system, ParamInitPlugin.cacheStart_param + weixin_appSecret_key);
		String weixin_appSecret = paramAppSecret.getStr("val");
		
		// 获取地址和参数
		StringBuilder sb = new StringBuilder();
		sb.append(weixin_token_url).append("?").append("grant_type=client_credential");
		sb.append("&appid=").append(weixin_appID);
		sb.append("&secret=").append(weixin_appSecret);
		
		try {
			// 获取
			String jsonStr = ToolHttp.get(true, sb.toString());
			RecevieToken recevieToken = JSON.parseObject(jsonStr, RecevieToken.class);
			if(recevieToken.getAccess_token() != null && !recevieToken.getAccess_token().isEmpty()){
				recevieToken.setDate(new Date());// 设置获取时间
				// 放入缓存
				CacheKit.put(ConstantPlatform.cache_name_system, weixin_access_token, recevieToken);
				log.info("获取AccessToken：" + jsonStr);
				return recevieToken;
			}
			return null;
		} catch (Exception e) {
			log.error("ToolWeiXin.getAccessToken从微信得到accessToken的凭证异常");
			return null;
		}
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
