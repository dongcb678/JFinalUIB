package little.ant.pingtai.model;

import org.apache.log4j.Logger;

public class Department extends BaseModel<Department> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Department.class);
	
	public static final Department dao = new Department();

}
