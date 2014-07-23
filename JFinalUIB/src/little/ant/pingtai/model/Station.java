package little.ant.pingtai.model;

import little.ant.pingtai.annotation.TableBind;

import org.apache.log4j.Logger;

@TableBind(tableName="pt_station")
public class Station extends BaseModel<Station> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Station.class);
	
	public static final Station dao = new Station();
	
}
