package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 图片库图片 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_photogalleryitem")
public class PhotogalleryItem extends BaseModel<PhotogalleryItem> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(PhotogalleryItem.class);
	
	public static final PhotogalleryItem dao = new PhotogalleryItem();
	
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
	* 上传ids
	*/
	public static final String colunm_uploadids = "uploadids";
	
	/**
	* 上传路径
	*/
	public static final String colunm_uploadpath = "uploadpath";
	
	/**
	* 主键
	*/
	public static final String colunm_photogalleryids = "photogalleryids";
	
	
}
