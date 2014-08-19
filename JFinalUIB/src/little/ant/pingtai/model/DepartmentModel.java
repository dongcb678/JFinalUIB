package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_department")
public class DepartmentModel extends BaseModel<DepartmentModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(DepartmentModel.class);
	
	public static final DepartmentModel dao = new DepartmentModel();

}
