package little.ant.blog.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 举报 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "blog_inform")
public class Inform extends BaseModel<Inform> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Inform.class);
	
	public static final Inform dao = new Inform();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 乐观锁
	*/
	public static final String colunm_version = "version";
	
	/**
	* 创建人
	*/
	public static final String colunm_createuser = "createuser";
	
	/**
	* 创建时间
	*/
	public static final String colunm_createdate = "createdate";
	
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
	* 分类
	*/
	public static final String colunm_type = "type";
	
	/**
	* 目标ids
	*/
	public static final String colunm_targetids = "targetids";
	
	/**
	* 举报说明
	*/
	public static final String colunm_explain = "explain";
	
	/**
	* 处理状态 : 0提交举报,1举报成功,2举报失败
	*/
	public static final String colunm_status = "status";
	
	/**
	* 结果说明
	*/
	public static final String colunm_result = "result";
	
	
}
