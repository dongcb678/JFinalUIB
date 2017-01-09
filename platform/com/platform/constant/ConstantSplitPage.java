package com.platform.constant;

/**
 * 分页参数初始化值
 * @author 董华健
 */
public interface ConstantSplitPage {

	/**
	 * 分页信息缓存，处理回退
	 */
	public static final String cacheStart_splitPage_backOff = "splitPage_backOff_";
	
	/**
	 * 分页参数初始化值：默认显示第几页
	 */
	public static final int default_pageNumber = 1;
	
	/**
	 * 分页参数初始化值：默认每页显示几多
	 */
	public static final int default_pageSize = 20;

	/**
	 * 分页参数初始化值：最多显示多少条数据
	 */
	public static final int default_maxSize = 200;

	/**
	 * 分页参数初始化值：导出，最多显示多少条数据
	 */
	public static final int default_export_maxSize = 10 * 10000;
	
}
