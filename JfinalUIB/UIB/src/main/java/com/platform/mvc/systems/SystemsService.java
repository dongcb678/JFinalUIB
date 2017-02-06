package com.platform.mvc.systems;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.menu.Menu;
import com.platform.mvc.module.Module;

@Service(name = SystemsService.serviceName)
public class SystemsService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SystemsService.class);

	public static final String serviceName = "systemsService";

	/**
	 * 保存
	 * @param systems
	 */
	@Before(Tx.class)
	public void save(Systems systems){
		// 保存系统
		systems.save();
		
		// 初始化模块根节点
		Module module = new Module();
		module.set(Module.column_systemsids, systems.getPKValue());
		module.set(Module.column_isparent, "true");
		module.set(Module.column_images, "3.png");
		module.set(Module.column_orderids, 1);
		module.set(Module.column_names, "根节点");
		module.save();
		
		// 初始化菜单根节点
		Menu menu = new Menu();
		menu.set(Menu.column_systemsids, systems.getPKValue());
		menu.set(Menu.column_isparent, "true");
		menu.set(Menu.column_images, "3.png");
		menu.set(Menu.column_orderids, 1);
		menu.set(Menu.column_names_zhcn, "根节点");
		menu.save();
	}

	/**
	 * 删除
	 * @param ids
	 */
	@Before(Tx.class)
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String systemsIds : idsArr) {
			//删除系统
			Systems.dao.deleteById(systemsIds);
			
			//删除关联模块
			String moduleSql = getSqlMy("platform.module.deleteBySystemsId");
			Db.update(moduleSql, systemsIds);
			
			//删除关联菜单
			String menuSql = getSqlMy("platform.menu.deleteBySystemsId");
			Db.update(menuSql, systemsIds);
			
			//删除关联日志
			String sysLogSql = getSqlMy("platform.sysLog.deleteBySystemsId");
			Db.update(sysLogSql, systemsIds);
		}
	}
	
}
