package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_group")
public class GroupModel extends BaseModel<GroupModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(GroupModel.class);
	
	public static final GroupModel dao = new GroupModel();
	
}
