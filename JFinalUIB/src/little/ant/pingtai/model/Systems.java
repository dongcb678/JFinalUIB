package little.ant.pingtai.model;

import little.ant.pingtai.annotation.TableBind;

import org.apache.log4j.Logger;

@TableBind(tableName="pt_systems")
public class Systems extends BaseModel<Systems> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Systems.class);
	
	public static final Systems dao = new Systems();
	
}
