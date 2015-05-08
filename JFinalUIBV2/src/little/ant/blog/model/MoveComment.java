package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 动弹评论 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_movecomment")
public class MoveComment extends BaseModel<MoveComment> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(MoveComment.class);
	
	public static final MoveComment dao = new MoveComment();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 评论内容
	*/
	public static final String colunm_content = "content";
	
	/**
	* 评论人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 评论时间
	*/
	public static final String colunm_createdate = "createdate";
	
	/**
	* 最后修改人
	*/
	public static final String colunm_updateuser = "updateuser";
	
	/**
	* 最后修改时间
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
	* 点赞次数
	*/
	public static final String colunm_praisecount = "praisecount";
	
	/**
	* 踩次数
	*/
	public static final String colunm_tramplecount = "tramplecount";
	
	/**
	* 上级评论
	*/
	public static final String colunm_pids = "pids";
	
	/**
	* 主键
	*/
	public static final String colunm_moveids = "moveids";
	
	
}
