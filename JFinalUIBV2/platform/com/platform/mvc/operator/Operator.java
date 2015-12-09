package com.platform.mvc.operator;

import org.apache.log4j.Logger;

import com.platform.mvc.base.BaseModelCache;
import com.platform.plugin.ParamInitPlugin;
import com.platform.tools.ToolCache;

/**
 * 系统功能model
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Table(tableName = "pt_operator")
public class Operator extends BaseModelCache<Operator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Operator.class);
	
	public static final Operator dao = new Operator();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：url数量 : 一个还是多个url，多个用逗号隔开 
	 * 字段类型 ：character 
	 */
	public static final String column_onemany = "onemany";
	
	/**
	 * 字段描述：返回参数keys 
	 * 字段类型 ：character varying 
	 */
	public static final String column_returnparamkeys = "returnparamkeys";
	
	/**
	 * 字段描述：返回url 
	 * 字段类型 ：character varying 
	 */
	public static final String column_returnurl = "returnurl";
	
	/**
	 * 字段描述：是否行级过滤 
	 * 字段类型 ：character 
	 */
	public static final String column_rowfilter = "rowfilter";
	
	/**
	 * 字段描述：url 
	 * 字段类型 ：character varying 
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：模块ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_moduleids = "moduleids";
	
	/**
	 * 字段描述：是否分页 
	 * 字段类型 ：character 
	 */
	public static final String column_splitpage = "splitpage";
	
	/**
	 * 字段描述：是否重复提交验证 
	 * 字段类型 ：character 
	 */
	public static final String column_formtoken = "formtoken";
	
	/**
	 * 字段描述：ip黑名单过滤 
	 * 字段类型 ：character 
	 */
	public static final String column_ipblack = "ipblack";
	
	/**
	 * 字段描述：是否需要权限验证 
	 * 字段类型 ：character 
	 */
	public static final String column_privilegess = "privilegess";
	
	/**
	 * 字段描述：是否记录PV 
	 * 字段类型 ：character 
	 */
	public static final String column_ispv = "ispv";
	
	/**
	 * 字段描述：pv类型 
	 * 字段类型 ：character 
	 */
	public static final String column_pvtype = "pvtype";
	
	/**
	 * 字段描述：模块names 
	 * 字段类型 ：character varying 
	 */
	public static final String column_modulenames = "modulenames";

	/**
	 * sqlId : platform.operator.paging
	 * 描述：查询所有功能
	 */
	public static final String sqlId_paging = "platform.operator.paging";

	/**
	 * sqlId : platform.operator.rootModule
	 * 描述：获取模块根节点
	 */
	public static final String sqlId_rootModule = "platform.operator.rootModule";

	/**
	 * sqlId : platform.operator.childModule
	 * 描述：获取模块子节点
	 */
	public static final String sqlId_childModule = "platform.operator.childModule";

	/**
	 * sqlId : platform.operator.byModuleIds
	 * 描述：获取模块下面的功能
	 */
	public static final String sqlId_byModuleIds = "platform.operator.byModuleIds";

	/**
	 * sqlId : platform.operator.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.operator.splitPageSelect";

	/**
	 * sqlId : platform.operator.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.operator.splitPageFrom";

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public String getNames() {
		return get(column_names);
	}
	public void setOnemany(String onemany){
		set(column_onemany, onemany);
	}
	public String getOnemany() {
		return get(column_onemany);
	}
	public void setReturnparamkeys(String returnparamkeys){
		set(column_returnparamkeys, returnparamkeys);
	}
	public String getReturnparamkeys() {
		return get(column_returnparamkeys);
	}
	public void setReturnurl(String returnurl){
		set(column_returnurl, returnurl);
	}
	public String getReturnurl() {
		return get(column_returnurl);
	}
	public void setRowfilter(String rowfilter){
		set(column_rowfilter, rowfilter);
	}
	public String getRowfilter() {
		return get(column_rowfilter);
	}
	public void setUrl(String url){
		set(column_url, url);
	}
	public String getUrl() {
		return get(column_url);
	}
	public void setModuleids(String moduleids){
		set(column_moduleids, moduleids);
	}
	public String getModuleids() {
		return get(column_moduleids);
	}
	public void setSplitpage(String splitpage){
		set(column_splitpage, splitpage);
	}
	public String getSplitpage() {
		return get(column_splitpage);
	}
	public void setFormtoken(String formtoken){
		set(column_formtoken, formtoken);
	}
	public String getFormtoken() {
		return get(column_formtoken);
	}
	public void setIpblack(String ipblack){
		set(column_ipblack, ipblack);
	}
	public String getIpblack() {
		return get(column_ipblack);
	}
	public void setPrivilegess(String privilegess){
		set(column_privilegess, privilegess);
	}
	public String getPrivilegess() {
		return get(column_privilegess);
	}
	public void setIspv(String ispv){
		set(column_ispv, ispv);
	}
	public String getIspv() {
		return get(column_ispv);
	}
	public void setPvtype(String pvtype){
		set(column_pvtype, pvtype);
	}
	public String getPvtype() {
		return get(column_pvtype);
	}
	public void setModulenames(String modulenames){
		set(column_modulenames, modulenames);
	}
	public String getModulenames() {
		return get(column_modulenames);
	}
	
	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		Operator operator = Operator.dao.findById(ids);
		ToolCache.set(ParamInitPlugin.cacheStart_operator + ids, operator);
		ToolCache.set(ParamInitPlugin.cacheStart_operator + operator.getStr(column_url), operator);
	}

	/**
	 * 删除缓存
	 * @param ids
	 */
	public void cacheRemove(String ids){
		Operator operator = Operator.dao.findById(ids);
		ToolCache.remove(ParamInitPlugin.cacheStart_operator + ids);
		ToolCache.remove(ParamInitPlugin.cacheStart_operator + operator.getStr(column_url));
	}

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public Operator cacheGet(String key){
		Operator operator = ToolCache.get(ParamInitPlugin.cacheStart_operator + key);
		return operator;
	}
	
}
