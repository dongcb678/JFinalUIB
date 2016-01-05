package com.weixin.mvc.group;

import java.math.BigDecimal;

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
	 * sqlId : weixin.group.splitPage
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage = "weixin.group.splitPage";

	private String ids;
	private String id;
	private String name;
	private String count;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setId(String id){
		set(column_id, id);
	}
	public String getId() {
		return get(column_id);
	}
	public void setName(String name){
		set(column_name, name);
	}
	public String getName() {
		return get(column_name);
	}
	public void setCount(BigDecimal count){
		set(column_count, count);
	}
	public BigDecimal getCount() {
		return get(column_count);
	}
	
}
