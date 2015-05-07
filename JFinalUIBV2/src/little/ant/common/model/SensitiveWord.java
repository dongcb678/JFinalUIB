package little.ant.common.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "common_sensitiveword")
public class SensitiveWord extends BaseModel<SensitiveWord> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(SensitiveWord.class);
	
	public static final SensitiveWord dao = new SensitiveWord();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_version = "version";
	public static final String colunm_sensitiveword = "sensitiveword";
	public static final String colunm_level = "level";
	public static final String colunm_replaceword = "replaceword";
	public static final String colunm_sort = "sort";
	public static final String colunm_createuser = "createuser";
	public static final String colunm_createdate = "createdate";
	public static final String colunm_updateuser = "updateuser";
	public static final String colunm_updatedate = "updatedate";
	public static final String colunm_isdelete = "isdelete";
	public static final String colunm_deleteuser = "deleteuser";
	public static final String colunm_deletedate = "deletedate";
	
}
