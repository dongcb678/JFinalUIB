package little.ant.weixin.utils;

import com.alibaba.fastjson.JSON;

import little.ant.pingtai.utils.ToolHttpClient;
import little.ant.weixin.vo.Token;

public class ToolToken {

	/**
	 * 从微信得到accessToken的凭证
	 * @return
	 */
	public Token getAccessToken() {
		String url = ToolConstant.accessTokenURL
				+ "?grant_type=" + ToolConstant.grantType + "&appid=" + ToolConstant.appid + "&secret=" + ToolConstant.secret;
		String jsonStr = ToolHttpClient.get(url);
		Token weiXinVo = JSON.parseObject(jsonStr, Token.class);
		return weiXinVo;
	}

}
