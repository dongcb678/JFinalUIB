package little.ant.weixin.model;

import little.ant.pingtai.annotation.TableBind;
import little.ant.pingtai.model.BaseModel;

import org.apache.log4j.Logger;

@TableBind(tableName="wx_article")
public class Article extends BaseModel<Article> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Article.class);
	
	public static final Article dao = new Article();
	
}
