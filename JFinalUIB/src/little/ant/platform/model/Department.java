package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 部门model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_department")
public class Department extends BaseModel<Department> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Department.class);
	
	public static final Department dao = new Department();

}
