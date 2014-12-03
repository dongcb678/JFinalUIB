package little.ant.platform.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Menu;
import little.ant.platform.model.Module;
import little.ant.platform.model.Systems;

import org.apache.log4j.Logger;

public class SystemsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsService.class);

	public static final SystemsService service = new SystemsService();
	
	/**
	 * 保存
	 * @param systems
	 */
	public void save(Systems systems){
		// 保存系统
		systems.save();
		
		// 初始化模块根节点
		Module module = new Module();
		module.set("systemsids", systems.getStr("ids"));
		module.set("isparent", "true");
		module.set("images", "3.png");
		module.set("orderids", 1);
		module.set("names", "根节点");
		module.save();
		
		// 初始化菜单根节点
		Menu menu = new Menu();
		menu.set("systemsids", systems.getStr("ids"));
		menu.set("isparent", "true");
		menu.set("images", "3.png");
		menu.set("orderids", 1);
		menu.set("names_zhcn", "根节点");
		menu.save();
	}

	/**
	 * 删除
	 * @param systemsIds
	 */
	public void delete(String systemsIds){
		//删除系统
		Systems.dao.deleteById(systemsIds);
		//删除关联模块
		
		//删除关联菜单
		
		//删除关联日志
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "platform.systems.splitPage");
	}
	
}
