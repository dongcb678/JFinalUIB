package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

public class Message extends Model<Message> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final Message dao = new Message();
	
}
