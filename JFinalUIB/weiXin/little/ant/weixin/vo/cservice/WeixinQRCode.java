package little.ant.weixin.vo.cservice;

/**
 * 临时二维码信息
 */
public class WeixinQRCode {
	
	// 获取的二维码ticket
	private String ticket;
	
	// 二维码的有效时间，单位为秒，最大不超过1800
	private int expireSeconds;

	private String errcode; // 错误码
	private String errmsg; // 错误提示

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

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public int getExpireSeconds() {
		return expireSeconds;
	}

	public void setExpireSeconds(int expireSeconds) {
		this.expireSeconds = expireSeconds;
	}
}
