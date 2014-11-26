package little.ant.platform.plugin;

import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.Table;
import little.ant.platform.model.BaseModel;
import little.ant.platform.tools.ToolClassSearcher;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * 扫描model上的注解，绑定model和table
 * @author 董华健
 */
public class TablePlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());
    
    private Map<String, ActiveRecordPlugin> arpMap;

	public TablePlugin(Map<String, ActiveRecordPlugin> arpMap){
		this.arpMap = arpMap;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public boolean start() {
		List<Class<? extends BaseModel>> modelClasses = ToolClassSearcher.of(BaseModel.class).search();// 查询所有继承BaseModel的类
//		List<String> jars = new ArrayList<>();
//		jars.add("littleant.jar");
//		ToolClassSearcher.of(BaseController.class).includeAllJarsInLib(true).injars(jars).search();// 可以指定查找jar包，jar名称固定，避免扫描所有文件
		// 循环处理自动注册映射
		for (Class model : modelClasses) {
			// 获取注解对象
			Table tableBind = (Table) model.getAnnotation(Table.class);
			if (tableBind == null) {
				log.error(model.getName() + "继承了BaseModel，但是没有注解绑定表名 ！！！");
				break;
			}

			// 获取映射属性
			String dataSourceName = tableBind.dataSourceName().trim();
			String tableName = tableBind.tableName().trim();
			String pkName = tableBind.pkName().trim();
			if(dataSourceName.equals("") || tableName.equals("") || pkName.equals("")){
				log.error(model.getName() + "注解错误，数据源、表名、主键名为空 ！！！");
				break;
			}
			
			// 映射注册
			ActiveRecordPlugin arp = arpMap.get(dataSourceName);
			if(arp == null){
				log.error(model.getName() + "ActiveRecordPlugin不能为null ！！！");
				break;
			}
			arp.addMapping(tableName, pkName, model);
		}
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

}
