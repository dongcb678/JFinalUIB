package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_module")
public class ModuleModel extends BaseModel<ModuleModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(ModuleModel.class);
	
	public static final ModuleModel dao = new ModuleModel();
	
}
