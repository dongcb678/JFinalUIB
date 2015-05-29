package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

/**
 * 图片库 model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "cms_photogallery")
public class Photogallery extends BaseModel<Photogallery> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Photogallery.class);
	
	public static final Photogallery dao = new Photogallery();
	
	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：作者 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_author = "author";
	
	/**
	 * 字段描述：来源 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_source = "source";
	
	/**
	 * 字段描述：来源url 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 字段描述：标题图 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_titlepicture = "titlepicture";
	
	/**
	 * 字段描述：标题图路径 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_titlepicturepath = "titlepicturepath";
	
	/**
	 * 字段描述：内容主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_contentids = "contentids";
	
	
}
