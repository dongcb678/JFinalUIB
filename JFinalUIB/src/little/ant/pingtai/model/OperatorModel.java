package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_operator")
public class OperatorModel extends BaseModel<OperatorModel> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(OperatorModel.class);
	
	public static final OperatorModel dao = new OperatorModel();
	
}
