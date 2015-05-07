package little.ant.cms.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "cms_vote")
public class Vote extends BaseModel<Vote> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Vote.class);
	
	public static final Vote dao = new Vote();
	
	public static final String colunm_ids = "ids";
	public static final String colunm_voterange = "voterange";
	public static final String colunm_contentids = "contentids";
	
}
