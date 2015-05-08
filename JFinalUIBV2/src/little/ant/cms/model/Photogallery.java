package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 图片库 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_photogallery")
public class Photogallery extends BaseModel<Photogallery> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Photogallery.class);
	
	public static final Photogallery dao = new Photogallery();
	
	/**
	* 主键
	*/
	public static final String colunm_ids = "ids";
	
	/**
	* 作者
	*/
	public static final String colunm_author = "author";
	
	/**
	* 来源
	*/
	public static final String colunm_source = "source";
	
	/**
	* 来源url
	*/
	public static final String colunm_url = "url";
	
	/**
	* 标题图
	*/
	public static final String colunm_titlepicture = "titlepicture";
	
	/**
	* 标题图路径
	*/
	public static final String colunm_titlepicturepath = "titlepicturepath";
	
	/**
	* 内容主键
	*/
	public static final String colunm_contentids = "contentids";
	
	
}
