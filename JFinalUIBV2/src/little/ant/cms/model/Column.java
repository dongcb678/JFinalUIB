package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 栏目 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_column")
public class Column extends BaseModel<Column> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Column.class);
	
	public static final Column dao = new Column();
	
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
	* 栏目名称
	*/
	public static final String colunm_name = "name";
	
	/**
	* 栏目排序
	*/
	public static final String colunm_sort = "sort";
	
	/**
	* 栏目地址
	*/
	public static final String colunm_url = "url";
	
	/**
	* 上级栏目ids : 0否，1是
	*/
	public static final String colunm_pids = "pids";
	
	/**
	* 栏目等级
	*/
	public static final String colunm_level = "level";
	
	/**
	* 是否父节点
	*/
	public static final String colunm_isparent = "isparent";
	
	
}
