package little.ant.weixin.vo.media;

/**
 * 下载失败
 * @author 董华健
 */
public class RecevieMediaDownError  {
	
	private String errcode;		//错误码
	private String errmsg;		//错误提示
	
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
