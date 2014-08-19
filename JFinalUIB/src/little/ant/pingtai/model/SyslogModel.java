package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_syslog")
public class SyslogModel extends BaseModel<SyslogModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(SyslogModel.class);
	
	public static final SyslogModel dao = new SyslogModel();
	
}
