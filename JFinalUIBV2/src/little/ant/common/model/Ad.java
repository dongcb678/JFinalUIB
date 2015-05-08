package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 广告 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_ad")
public class Ad extends BaseModel<Ad> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Ad.class);
	
	public static final Ad dao = new Ad();
	
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
	* 浏览次数
	*/
	public static final String colunm_viewcount = "viewcount";
	
	/**
	* 点击次数
	*/
	public static final String colunm_clickcount = "clickcount";
	
	/**
	* 广告名称
	*/
	public static final String colunm_name = "name";
	
	/**
	* 广告类型
	*/
	public static final String colunm_type = "type";
	
	/**
	* 广告图片
	*/
	public static final String colunm_imagepath = "imagepath";
	
	/**
	* 图片上传Ids
	*/
	public static final String colunm_imageids = "imageids";
	
	/**
	* 启用时间
	*/
	public static final String colunm_startdate = "startdate";
	
	/**
	* 停用时间
	*/
	public static final String colunm_enddate = "enddate";
	
	/**
	* 排序
	*/
	public static final String colunm_sort = "sort";
	
	/**
	* 状态（是否启用） : 0否，1是
	*/
	public static final String colunm_status = "status";
	
	/**
	* 广告位主键
	*/
	public static final String colunm_locationids = "locationids";
	
	
}
