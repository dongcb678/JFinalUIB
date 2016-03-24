package com.platform.mvc.base;

import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.platform.constant.ConstantRender;
import com.platform.tools.ToolRandoms;
import com.platform.tools.ToolSqlXml;

import oracle.sql.TIMESTAMP;

/**
 * Model基础类
 * 
 * @author 董华健
 * @param <M>
 * 
 * 抽取公共方法，并重写save、update、getDate方法
 */
public abstract class BaseModel<M extends Model<M>> extends Model<M> {

	private static final long serialVersionUID = -900378319414539856L;

	private static Logger log = Logger.getLogger(BaseModel.class);

	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";

	/**
	 * sqlId : platform.baseModel.select
	 * 描述：通用查询
	 */
	public static final String sqlId_select = "platform.baseModel.select";

	/**
	 * sqlId : platform.baseModel.update
	 * 描述：通用更新
	 */
	public static final String sqlId_update = "platform.baseModel.update";

	/**
	 * sqlId : platform.baseModel.delete
	 * 描述：通用删除
	 */
	public static final String sqlId_delete = "platform.baseModel.delete";

	/**
	 * sqlId : platform.baseModel.deleteIn
	 * 描述：通用删除
	 */
	public static final String sqlId_deleteIn = "platform.baseModel.deleteIn";

	/**
	 * sqlId : platform.baseModel.deleteOr
	 * 描述：通用删除
	 */
	public static final String sqlId_deleteOr = "platform.baseModel.deleteOr";

	/**
	 * sqlId : platform.baseModel.splitPageSelect
	 * 描述：通用select *
	 */
	public static final String sqlId_splitPageSelect = "platform.baseModel.splitPageSelect";

	/**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
	protected String getSql(String sqlId){
		return ToolSqlXml.getSql(sqlId);
	}
	
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_beetl);
    }
    
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_beetl, list);
    }

    /**
     * 获取SQL，动态SQL，使用FreeMarker解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByFreeMarker(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_freeMarker);
    }
    
    /**
     * 获取SQL，动态SQL，使用FreeMarker解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByFreeMarker(String sqlId, Map<String, Object> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_freeMarker, list);
    }

    /**
     * 获取SQL，动态SQL，使用Velocity解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByVelocity(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_velocity);
    }
    
    /**
     * 获取SQL，动态SQL，使用Velocity解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByVelocity(String sqlId, Map<String, Object> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_velocity, list);
    }
	
	/**
	 * 获取表映射对象
	 * 
	 * @return
	 */
	protected Table getTable() {
		return TableMapping.me().getTable(getClass());
	}

	/**
	 * 获取表名称
	 * 
	 * @return
	 */
	protected String getTableName() {
		return getTable().getName();
	}

	/**
	 * 获取主键名称
	 * @return
	 */
	public String[] getPKNameArr(){
		return getTable().getPrimaryKey();
	}

	/**
	 * 获取主键名称
	 * @return
	 */
	public String getPKNameStr(){
		String[] pkArr = getPKNameArr();
		if(pkArr.length == 1){
			return pkArr[0];
		}else{
			String pk = "";
			for (String pkName : pkArr) {
				pk += pkName + ",";
			}
			return pk;
		}
		
	}

	/**
	 * 获取主键值：非复合主键
	 * @return
	 */
	public String getPKValue(){
		String[] pkNameArr = getTable().getPrimaryKey();
		if(pkNameArr.length == 1){
			return this.getStr(pkNameArr[0]);
		}else{
			String pk = "";
			for (String pkName : pkNameArr) {
				pk += this.get(pkName) + ",";
			}
			return pk;
		}
	}

	/**
	 * 获取主键值：复合主键
	 * @return
	 */
	public List<Object> getPKValueList(){
		String[] pkNameArr = getTable().getPrimaryKey();
		
		List<Object> pkValueList = new ArrayList<Object>();
		for (String pkName : pkNameArr) {
			pkValueList.add(this.get(pkName));
		}
		
		return pkValueList;
	}

	/**
	 * 重写save方法
	 */
	public boolean save() {
		String[] pkArr = getTable().getPrimaryKey();
		for (String pk : pkArr) {
			this.set(pk, ToolRandoms.getUuid(true)); // 设置主键值
		}
		
		if(getTable().hasColumnLabel(column_version)){ // 是否需要乐观锁控制
			this.set(column_version, Long.valueOf(0)); // 初始化乐观锁版本号
		}
		
		return super.save();
	}

	/**
	 * 重写save方法
	 */
	public boolean save(Map<String, Object> pkMap) {
		Set<String> pkSet = pkMap.keySet();
		for (String pk : pkSet) {
			this.set(pk, pkMap.get(pk)); // 设置主键值
		}
		
		if(getTable().hasColumnLabel(column_version)){ // 是否需要乐观锁控制
			this.set(column_version, Long.valueOf(0)); // 初始化乐观锁版本号
		}
		
		return super.save();
	}

	/**
	 * 重写update方法
	 */
	@SuppressWarnings("unchecked")
	public boolean update() {
		Table table = getTable();
		boolean hasVersion = table.hasColumnLabel(column_version);
		
		if(hasVersion){// 是否需要乐观锁控制，表是否有version字段
			Set<String> modifyFlag = null;
			try {
				Field field = null;
				if(this.getClass().getSuperclass().getName().endsWith("BaseModelCache")){
					field = this.getClass().getSuperclass().getSuperclass().getSuperclass().getDeclaredField("modifyFlag");
				}else{
					field = this.getClass().getSuperclass().getSuperclass().getDeclaredField("modifyFlag");
				}
				field.setAccessible(true);
				Object object = field.get(this);
				if(null != object){
					modifyFlag = (Set<String>) object;
				}
				field.setAccessible(false);
			} catch (NoSuchFieldException | SecurityException e) {
				log.error("业务Model类必须继承BaseModel");
				e.printStackTrace();
				throw new RuntimeException("业务Model类必须继承BaseModel");
			} catch (IllegalArgumentException | IllegalAccessException e) {
				log.error("BaseModel访问modifyFlag异常");
				e.printStackTrace();
				throw new RuntimeException("BaseModel访问modifyFlag异常");
			}
			boolean versionModify = modifyFlag.contains(column_version); // 表单是否包含version字段
			if(versionModify){
				Long newVersion = getNumber(column_version).longValue() + 1; // 表单中的版本号+1
				this.set(column_version, newVersion); // 保存新版本号
			}
		}
		
		return super.update();
	}

	/**
	 * 针对Oracle做特殊处理
	 * @param attr
	 * @return
	 */
	@Override
	public Date getDate(String attr) {
		Object obj = this.get(attr);
		if(null == obj){
			return null;
		}
		
		if (TIMESTAMP.class.isAssignableFrom(obj.getClass())){
			TIMESTAMP ts = (TIMESTAMP) obj;
			
			Date date = null;
			try {
				date = ts.timestampValue();
			} catch (SQLException e) {
				return null;
			}
			
			return date;
		}
		
		return (Date) obj;
	}
	
}
