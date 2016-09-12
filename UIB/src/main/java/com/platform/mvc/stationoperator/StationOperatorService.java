package com.platform.mvc.stationoperator;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.constant.ConstantInit;
import com.platform.dto.SplitPage;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.station.Station;
import com.platform.plugin.ParamInitPlugin;
import com.platform.tools.ToolCache;

@Service(name = StationOperatorService.serviceName)
public class StationOperatorService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationOperatorService.class);
	
	public static final String serviceName = "stationOperatorService";

	/**
	 * 获取岗位拥有的功能
	 * @param stationIds
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void paging(SplitPage splitPage){
		paging(ConstantInit.db_dataSource_main, splitPage, StationOperator.sqlId_splitPageSelect, StationOperator.sqlId_splitPageFrom);
		
		String stationIds = (String) splitPage.getQueryParam().get("stationIds");
		
		Station station = Station.dao.findById(stationIds);
		splitPage.setExtData(station);
		
		String sql = getSql("platform.stationOperator.findByStationIds");
		
		List<Record> smList = (List<Record>) splitPage.getList();
		for (Record sm : smList) {
			String mids = sm.getStr("mids");
			List<Record> olist = Db.find(sql, stationIds, mids);
			if(olist != null && olist.size() != 0){
				sm.set("list", olist);
			}else{
				smList.remove(sm);
			}
		}
	}

	/**
	 * 设置岗位拥有的功能
	 * @param stationIds
	 * @param operatorIds
	 * @return
	 */
	public String add(String stationIds, String operatorIds){
		StationOperator ro = new StationOperator();
		ro.setStationids(stationIds);
		ro.setOperatorids(operatorIds);
		ro.save();
		
		// 缓存
		cacheAdd(stationIds);
		
		return ro.getPKValue();
	}
	
	/**
	 * 删除
	 * @param stationOperatorIds
	 */
	public void del(String stationOperatorIds){
		StationOperator ro = StationOperator.dao.findById(stationOperatorIds);
		String stationIds = ro.getStationids();
		ro.delete();
		
		// 缓存
		cacheRemove(stationIds);
	}

	/**
	 * 添加或者更新缓存
	 * 描述：岗位拥有的功能
	 */
	public static void cacheAdd(String stationIds){
		String sql = getSql("platform.stationOperator.findOperatorByStationIds");
		List<Operator> olist = Operator.dao.find(sql, stationIds);
		ToolCache.set(ParamInitPlugin.cacheStart_station_operator + stationIds, olist);
	}

	/**
	 * 删除缓存
	 * 描述：岗位拥有的功能
	 */
	public static void cacheRemove(String stationIds){
		ToolCache.remove(ParamInitPlugin.cacheStart_station_operator + stationIds);
	}

	/**
	 * 获取缓存
	 * 描述：岗位拥有的功能
	 * @param ids
	 * @return
	 */
	public static List<Operator> cacheGet(String stationIds){
		List<Operator> olist = ToolCache.get(ParamInitPlugin.cacheStart_station_operator + stationIds);
		if(olist == null){
			String sql = getSql("platform.stationOperator.findOperatorByStationIds");
			olist = Operator.dao.find(sql, stationIds);
		}
		return olist;
	}
	
}
