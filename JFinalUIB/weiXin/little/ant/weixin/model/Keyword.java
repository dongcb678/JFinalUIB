package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

public class Keyword extends Model<Keyword> {
	
	private static final long serialVersionUID = 7513950057125407026L;
	
	public static final Keyword dao = new Keyword();
	
	/**
	 * 获取表映射对象
	 * @return
	 */
	public Table getTable() {
		return TableMapping.me().getTable(getClass());
	}
	
}
