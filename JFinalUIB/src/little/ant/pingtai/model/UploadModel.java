package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_upload")
public class UploadModel extends BaseModel<UploadModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(UploadModel.class);
	
	public static final UploadModel dao = new UploadModel();
	
}
