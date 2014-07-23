package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@Table(tableName="pt_module")
public class Module extends BaseModel<Module> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Module.class);
	
	public static final Module dao = new Module();
	
}
