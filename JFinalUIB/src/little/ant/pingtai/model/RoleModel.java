package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_role")
public class RoleModel extends BaseModel<RoleModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(RoleModel.class);
	
	public static final RoleModel dao = new RoleModel();
	
}
