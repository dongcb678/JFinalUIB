package little.ant.pingtai.plugin;

import java.util.List;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.model.BaseModel;
import little.ant.pingtai.tools.ToolClassSearcher;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * 扫描model上的注解，绑定model和table
 * @author 董华健
 */
public class TablePlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());
    
    private ActiveRecordPlugin arp;

	public TablePlugin(ActiveRecordPlugin arp){
		this.arp = arp;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public boolean start() {
		List<Class<? extends BaseModel>> modelClasses = ToolClassSearcher.of(BaseModel.class).search();// 查询所有继承BaseModel的类
		// 循环处理自动注册映射
		for (Class model : modelClasses) {
			// 获取注解对象
			Table tableBind = (Table) model.getAnnotation(Table.class);
			if (tableBind == null) {
				log.error(model.getName() + "继承了BaseModel，但是没有注解绑定表名");
				continue;
			}

			// 获取映射表
			String tableName = tableBind.tableName().trim();
			String pkName = tableBind.pkName().trim();
			if(tableName.equals("") || pkName.equals("")){
				log.error(model.getName() + "注解错误，表名或者主键名为空");
				continue;
			}
			
			// 映射注册
			arp.addMapping(tableName, pkName, model);
		}
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

}
