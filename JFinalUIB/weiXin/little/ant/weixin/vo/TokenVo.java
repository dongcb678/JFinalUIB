package little.ant.weixin.vo;

/**
 * access token
 * @author 董华健
 */
public class TokenVo {

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
