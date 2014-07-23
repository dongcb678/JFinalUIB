package little.ant.pingtai.model;

import little.ant.pingtai.annotation.TableBind;

import org.apache.log4j.Logger;

@TableBind(tableName="pt_syslog")
public class Syslog extends BaseModel<Syslog> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Syslog.class);
	
	public static final Syslog dao = new Syslog();
	
}
