package little.ant.pingtai.service;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.MenuModel;
import little.ant.pingtai.model.ModuleModel;
import little.ant.pingtai.model.SystemsModel;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

public class SystemsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsService.class);
	
	/**
	 * 保存
	 * @param systems
	 */
	@Before(Tx.class)
	public void save(SystemsModel systems){
		// 保存系统
		systems.save();
		
		// 初始化模块根节点
		ModuleModel module = new ModuleModel();
		module.set("systemsids", systems.getStr("ids"));
		module.set("isparent", "true");
		module.set("images", "3.png");
		module.set("orderids", 1);
		module.set("names", "根节点");
		module.save();
		
		// 初始化菜单根节点
		MenuModel menu = new MenuModel();
		menu.set("systemsids", systems.getStr("ids"));
		menu.set("isparent", "true");
		menu.set("images", "3.png");
		menu.set("orderids", 1);
		menu.set("names", "根节点");
		menu.save();
	}

	/**
	 * 删除
	 * @param systemsIds
	 */
	@Before(Tx.class)
	public void delete(String systemsIds){
		//删除系统
		SystemsModel.dao.deleteById(systemsIds);
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
		splitPageBase(splitPage, select, "pingtai.systems.splitPage");
	}
	
}
