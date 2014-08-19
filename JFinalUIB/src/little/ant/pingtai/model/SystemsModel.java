package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_systems")
public class SystemsModel extends BaseModel<SystemsModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(SystemsModel.class);
	
	public static final SystemsModel dao = new SystemsModel();
	
}
