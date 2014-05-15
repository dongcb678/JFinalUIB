package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 接收获取access token消息
 * @author 董华健
 */
public class RecevieToken extends Model<RecevieToken> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final RecevieToken dao = new RecevieToken();
	
	private String access_token;//获取到的凭证
	private String expires_in;	//凭证有效时间，单位：秒 
	private String errcode;		//错误码
	private String errmsg;		//错误提示

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String accessToken) {
		access_token = accessToken;
	}

	public String getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(String expiresIn) {
		expires_in = expiresIn;
	}

	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	
}
