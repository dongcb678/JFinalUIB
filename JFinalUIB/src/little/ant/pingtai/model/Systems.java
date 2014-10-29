package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.common.DictKeys;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_systems")
public class Systems extends BaseModel<Systems> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Systems.class);
	
	public static final Systems dao = new Systems();
	
}
