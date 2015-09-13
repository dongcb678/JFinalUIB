package com.weixin.mvc.location;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_location")
public class Location extends BaseModel<Location> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Location.class);
	
	public static final Location dao = new Location();

	/**
	 * sqlId : weixin.location.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.location.splitPageFrom";

}
