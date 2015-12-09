package com.weixin.mvc.group;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_group")
public class Group extends BaseModel<Group> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Group.class);
	
	public static final Group dao = new Group();

	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_id = "id";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_name = "name";
	
	/**
	 * 字段描述： 
	 * 字段类型：decimal(20,0)  长度：null
	 */
	public static final String column_count = "count";
	
	
	/**
	 * sqlId : weixin.group.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.group.splitPageFrom";

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public <T> T getIds() {
		return get(column_ids);
	}
	public void setId(String id){
		set(column_id, id);
	}
	public <T> T getId() {
		return get(column_id);
	}
	public void setName(String name){
		set(column_name, name);
	}
	public <T> T getName() {
		return get(column_name);
	}
	public void setCount(java.math.BigDecimal count){
		set(column_count, count);
	}
	public <T> T getCount() {
		return get(column_count);
	}
	
}
