package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

public class Article extends Model<Article> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final Article dao = new Article();
	
}
