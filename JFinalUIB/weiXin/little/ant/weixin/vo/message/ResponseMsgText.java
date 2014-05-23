package little.ant.weixin.vo.message;

/**
 * 响应文本消息
 * @author 董华健
 */
public class ResponseMsgText extends ResponseMsgBase{
	
	private String Content;	 //是	 回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示）

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
	
}
