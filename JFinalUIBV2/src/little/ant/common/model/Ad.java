package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_ad")
public class Ad extends BaseModel<Ad> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Ad.class);
	
	public static final Ad dao = new Ad();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_version = "version";
	public static final String colunm_createuser = "createuser";
	public static final String colunm_createdate = "createdate";
	public static final String colunm_updateuser = "updateuser";
	public static final String colunm_updatedate = "updatedate";
	public static final String colunm_isdelete = "isdelete";
	public static final String colunm_deleteuser = "deleteuser";
	public static final String colunm_deletedate = "deletedate";
	public static final String colunm_viewcount = "viewcount";
	public static final String colunm_clickcount = "clickcount";
	public static final String colunm_name = "name";
	public static final String colunm_type = "type";
	public static final String colunm_imagepath = "imagepath";
	public static final String colunm_imageids = "imageids";
	public static final String colunm_startdate = "startdate";
	public static final String colunm_enddate = "enddate";
	public static final String colunm_sort = "sort";
	public static final String colunm_status = "status";
	public static final String colunm_locationids = "locationids";
	
}
