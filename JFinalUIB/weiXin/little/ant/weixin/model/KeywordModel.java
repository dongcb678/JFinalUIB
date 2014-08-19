package little.ant.weixin.model;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.model.BaseModel;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="wx_keyword")
public class KeywordModel extends BaseModel<KeywordModel> {
	
	private static final long serialVersionUID = 7513950057125407026L;

	private static Logger log = Logger.getLogger(KeywordModel.class);
	
	public static final KeywordModel dao = new KeywordModel();
	
}
