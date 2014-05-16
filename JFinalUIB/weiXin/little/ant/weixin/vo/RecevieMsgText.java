package little.ant.weixin.vo;

/**
 * 接收文本消息
 * @author 董华健
 */
public class RecevieMsgText extends RecevieMsgBase {

	private String Content;	 //文本消息内容

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
	
}
