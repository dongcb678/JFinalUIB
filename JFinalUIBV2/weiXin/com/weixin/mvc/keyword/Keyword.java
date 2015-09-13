package com.weixin.mvc.keyword;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_keyword")
public class Keyword extends BaseModel<Keyword> {
	
	private static final long serialVersionUID = 7513950057125407026L;

	private static Logger log = Logger.getLogger(Keyword.class);
	
	public static final Keyword dao = new Keyword();

	/**
	 * sqlId : weixin.keyword.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.keyword.splitPageFrom";

}
