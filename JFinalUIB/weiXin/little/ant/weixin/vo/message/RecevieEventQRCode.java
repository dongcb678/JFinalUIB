package little.ant.weixin.vo.message;

/**
 * 扫描二维码事件：
 * 1.如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
 * 2.如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
 * @author 董华健
 */
public class RecevieEventQRCode extends RecevieEventBase {
	
	private String EventKey;	 //事件KEY值，qrscene_为前缀，后面为二维码的参数值
	private String Ticket;	 //二维码的ticket，可用来换取二维码图片
	
	public String getEventKey() {
		return EventKey;
	}
	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}
	public String getTicket() {
		return Ticket;
	}
	public void setTicket(String ticket) {
		Ticket = ticket;
	}
	
}
