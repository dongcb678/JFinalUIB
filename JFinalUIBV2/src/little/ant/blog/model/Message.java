package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 站内消息 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_message")
public class Message extends BaseModel<Message> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Message.class);
	
	public static final Message dao = new Message();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 内容
	*/
	public static final String colunm_content = "content";
	
	/**
	* 创建人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 创建时间
	*/
	public static final String colunm_createdate = "createdate";
	
	/**
	* 最后更新人
	*/
	public static final String colunm_updateuser = "updateuser";
	
	/**
	* 最后更新时间
	*/
	public static final String colunm_updatedate = "updatedate";
	
	/**
	* 是否删除
	*/
	public static final String colunm_isdelete = "isdelete";
	
	/**
	* 删除人
	*/
	public static final String colunm_deleteuser = "deleteuser";
	
	/**
	* 删除时间
	*/
	public static final String colunm_deletedate = "deletedate";
	
	/**
	* 接收人
	*/
	public static final String colunm_receiveuser = "receiveuser";
	
	/**
	* 接收时间
	*/
	public static final String colunm_receivedate = "receivedate";
	
	
}
