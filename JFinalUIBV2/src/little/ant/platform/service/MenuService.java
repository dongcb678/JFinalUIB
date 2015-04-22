package little.ant.platform.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.ZtreeNode;
import little.ant.platform.model.Menu;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class MenuService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MenuService.class);

	public static final MenuService service = new MenuService();
	
	/**
	 * 获取子节点数据
	 * @param systemsIds
	 * @param parentIds
	 * @param i18n
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String systemsIds, String parentIds, String i18n){
		String names = "names" + i18n(i18n) + " as names";

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("names", names);
		
		List<Menu> list = null;
		if(null != parentIds){
			String sql = getSqlByBeetl("platform.menu.child", param);
			list = Menu.dao.find(sql, parentIds);
			
		}else{
			String sql = getSqlByBeetl("platform.menu.root", param);
			list = Menu.dao.find(sql, systemsIds);
		}
		
		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Menu menu : list) {
			node = new ZtreeNode();
			node.setId(menu.getPKValue());
			node.setName(menu.getStr("names"));
			node.setIsParent(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + menu.getStr("images"));
			nodeList.add(node);
		}
		
		return nodeList;
	}
	
	/**
	 * 保存
	 * @param pIds
	 * @param names
	 * @param orderIds
	 * @param i18n
	 * @return
	 */
	public String save(String pIds, String names, int orderIds, String i18n){
		String namesColunm = "names" + i18n(i18n);
		
		Menu pMenu = Menu.dao.findById(pIds);
		pMenu.set("isparent", "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}

		Menu menu = new Menu();
		menu.set("isparent", "false");
		menu.set("parentmenuids", pIds);
		menu.set("orderids", orderIds);
		menu.set(namesColunm, names);
		menu.set("images", images);
		menu.set("systemsids", pMenu.getStr("systemsids"));
		menu.save();
		
		return menu.getPKValue();
	}
	
	/**
	 * 更新
	 * @param ids
	 * @param pIds
	 * @param names
	 * @param principalIds
	 */
	public void update(String ids, String pIds, String names, String i18n){
		String namesColunm = "names" + i18n(i18n);
		
		Menu menu = Menu.dao.findById(ids);
		if(null != names && !names.isEmpty()){
			//更新模块名称
			menu.set(namesColunm, names).update();
			
		}else if(null != pIds && !pIds.isEmpty()){
			//更新上级模块
			menu.set("parentmenuids", pIds).update();
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String ids) {
		Menu menu = Menu.dao.findById(ids);
		
		// 是否存在子节点
		if(menu.getStr("isparent").equals("true")){
			return false; //存在子节点，不能直接删除
		}
		
		// 修改上级节点的isparent
    	Menu pMenu = Menu.dao.findById(menu.getStr("parentmenuids"));
		String sql = getSql("platform.menu.childCount");
		Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pMenu.getPKValue());
		Long counts = record.getNumber("counts").longValue();
	    if(counts == 1){
	    	pMenu.set("isparent", "false");
	    	pMenu.update();
	    }
	    
		// 删除
	    Menu.dao.deleteById(ids);
	    
	    return true;
	}
	
	/**
	 * 设置菜单功能
	 * @param roleIds
	 * @param moduleIds
	 * @param operatorIds
	 */
	public void setOperator(String menuIds, String operatorIds){
		Menu menu = Menu.dao.findById(menuIds);
		menu.set("operatorids", operatorIds).update();
	}
	
}
