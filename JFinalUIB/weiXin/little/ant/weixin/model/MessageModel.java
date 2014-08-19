package little.ant.weixin.model;

import org.apache.log4j.Logger;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.model.BaseModel;

@SuppressWarnings("unused")
@Table(tableName="wx_message")
public class MessageModel extends BaseModel<MessageModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(MessageModel.class);
	
	public static final MessageModel dao = new MessageModel();
	
}
