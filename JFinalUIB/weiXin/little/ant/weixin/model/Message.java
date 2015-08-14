package little.ant.weixin.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName= "wx_message")
public class Message extends BaseModel<Message> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Message.class);
	
	public static final Message dao = new Message();
	
}
