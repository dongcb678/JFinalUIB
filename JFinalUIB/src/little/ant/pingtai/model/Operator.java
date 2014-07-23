package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@Table(tableName="pt_operator")
public class Operator extends BaseModel<Operator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Operator.class);
	
	public static final Operator dao = new Operator();
	
}
