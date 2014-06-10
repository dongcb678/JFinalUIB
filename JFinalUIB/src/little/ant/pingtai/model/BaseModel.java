package little.ant.pingtai.model;

import little.ant.pingtai.tools.ToolUtils;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

/**
 * Model基础类
 * 
 * @author 董华健
 * @param <M>
 */
public abstract class BaseModel<M extends Model<M>> extends Model<M> {

	private static final long serialVersionUID = -900378319414539856L;

	/**
	 * 获取表映射对象
	 * 
	 * @return
	 */
	public Table getTable() {
		return TableMapping.me().getTable(getClass());
	}

	/**
	 * 重写save方法，设置主键值
	 */
	public boolean save() {
		String ids = ToolUtils.getUuidByJdk(true);
		this.set(getTable().getPrimaryKey(), ids);
		return super.save();
	}
	
	/**
	 * 获取主键值
	 * @return
	 */
	public String getPrimaryKeyValue(){
		return this.getStr(getTable().getPrimaryKey());
	}

}
