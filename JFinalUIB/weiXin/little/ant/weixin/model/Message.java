package little.ant.weixin.model;

import org.apache.log4j.Logger;

import little.ant.pingtai.annotation.TableBind;
import little.ant.pingtai.model.BaseModel;

@TableBind(tableName="wx_message")
public class Message extends BaseModel<Message> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Message.class);
	
	public static final Message dao = new Message();
	
}
