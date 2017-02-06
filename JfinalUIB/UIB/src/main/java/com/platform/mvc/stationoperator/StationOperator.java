package com.platform.mvc.stationoperator;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 岗位功能 model
 * @author 董华健  dongcb678@163.com
 */
@SuppressWarnings("unused")
@Table(tableName = StationOperator.table_name)
public class StationOperator extends BaseModel<StationOperator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(StationOperator.class);
	
	public static final StationOperator dao = new StationOperator().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_stationoperator";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：岗位ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_stationids = "stationids";
	
	/**
	 * 字段描述：功能ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * sqlId : platform.stationOperator.splitPageSelect
	 * 描述：通用select *
	 */
	public static final String sqlId_splitPageSelect = "platform.stationOperator.splitPageSelect";

	/**
	 * sqlId : platform.stationOperator.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.stationOperator.splitPageFrom";

	private String ids;
	private String stationids;
	private String operatorids;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setStationids(String stationids){
		set(column_stationids, stationids);
	}
	public String getStationids() {
		return get(column_stationids);
	}
	public void setOperatorids(String operatorids){
		set(column_operatorids, operatorids);
	}
	public String getOperatorids() {
		return get(column_operatorids);
	}
	
}
