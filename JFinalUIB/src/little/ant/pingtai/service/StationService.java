package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.model.Station;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolEhcacheFactory;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class StationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationService.class);

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		String sql = null;
		List<Station> list = null;
		if(null != parentIds){
			sql = " select ids, names, isparent, images from pt_station where parentStationIds = ? order by orderIds asc ";
			list = Station.dao.find(sql, parentIds);
			
		}else{
			sql = " select ids, names, isparent, images from pt_station where parentStationIds is null order by orderIds asc ";
			list = Station.dao.find(sql);
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		
		int size = list.size() - 1;
		for (Station station : list) {
			sb.append(" { ");
			sb.append(" id : '").append(station.getStr("ids")).append("', ");
			sb.append(" name : '").append(station.getStr("names")).append("', ");
			sb.append(" isParent : true, ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '").append("/jsFile/zTree/css/zTreeStyle/img/diy/").append(station.getStr("images")).append("' ");
			sb.append(" }");
			if(list.indexOf(station) < size){
				sb.append(", ");
			}
		}
		
		sb.append("]");
		
		return sb.toString();
	}
	
	/**
	 * 保存
	 * @param pIds
	 * @param names
	 * @param orderIds
	 * @return
	 */
	public String save(String pIds, String names, int orderIds) {
		Station pStation = Station.dao.findById(pIds);
		pStation.set("isparent", "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}
		
		Station station = new Station();
		station.set("isparent", "false");
		station.set("parentstationids", pIds);
		station.set("orderids", orderIds);
		station.set("names", names);
		station.set("images", images);
		station.save();
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_station + station.getStr("ids"), station);
		
		return station.getStr("ids");
	}
	
	/**
	 * 更新
	 * @param ids
	 * @param pIds
	 * @param names
	 */
	public void update(String ids, String pIds, String names) {
		Station station = Station.dao.findById(ids);
		if(null != names && !names.isEmpty()){
			//更新模块名称
			station.set("names", names).update();
			
		}else if(null != pIds && !pIds.isEmpty()){
			//更新上级模块
			station.set("parentstationids", pIds).update();
		}

		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_station + station.getStr("ids"), station);
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String ids) {
		Record record = Db.findFirst("select count(*) as counts from pt_station where parentstationids=?", ids);
		Long counts = record.getLong("counts");
	    if(counts > 1){
	    	return false;
	    }
	    
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_station + ids);
		
		// 删除
	    Station.dao.deleteById(ids);
	    return true;
	}
	
	/**
	 * 设置岗位功能
	 * @param roleIds
	 * @param moduleIds
	 * @param operatorIds
	 */
	public void setOperator(String stationIds, String moduleIds, String operatorIds){
		Station station = Station.dao.findById(stationIds);
		station.set("moduleids", moduleIds).set("operatorids", operatorIds).update();
		
		// 缓存
		ToolEhcacheFactory.getInstance().update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_station + stationIds, station);
	}
	
	
}
