package com.platform.config;

import java.util.Set;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;
import com.platform.tools.ToolClassSearch;

/**
 * 表自动注册注解扫描，绑定table和model
 * @author 董华健  dongcb678@163.com
 */
public class ModelScan {

	private static final Log log = Log.getLog(ModelScan.class);

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void scan(String configName, ActiveRecordPlugin arp) {
		// 查询所有BaseModel的子类
		Set<Class<?>> modelClasses = ToolClassSearch.searchByClassLoader(BaseModel.class);
		
		// 循环处理自动注册映射
		for (Class model : modelClasses) {
			// 获取注解对象
			Table tableBind = (Table) model.getAnnotation(Table.class);
			if (tableBind == null) {
				if(log.isWarnEnabled()) log.warn(model.getName() + "继承了BaseModel，但是没有注解绑定表名，请检查是否已经手动绑定 ！！！");
				throw new RuntimeException(model.getName() + "继承了BaseModel，但是没有注解绑定表名，请检查是否已经手动绑定 ！！！");
			}

			// 获取映射属性
			String dataSourceName = tableBind.dataSourceName().trim();
			String tableName = tableBind.tableName().trim();
			String pkName = tableBind.pkName().trim();
			if (dataSourceName.equals("") || tableName.equals("") || pkName.equals("")) {
				if(log.isErrorEnabled()) log.error(model.getName() + "注解错误，数据源、表名、主键名为空 ！！！");
				throw new RuntimeException(model.getName() + "注解错误，数据源、表名、主键名为空 ！！！");
			}

			// 映射注册
			if (configName == null) {
				if(log.isErrorEnabled()) log.error(model.getName() + "ActiveRecordPlugin configName不能为null ！！！");
				throw new RuntimeException(model.getName() + "ActiveRecordPlugin configName不能为null ！！！");
			}
			if (arp == null) {
				if(log.isErrorEnabled()) log.error(model.getName() + "ActiveRecordPlugin不能为null ！！！");
				throw new RuntimeException(model.getName() + "ActiveRecordPlugin不能为null ！！！");
			}
			
			if (dataSourceName.equals(configName)) {
				arp.addMapping(tableName, pkName, model);
				if(log.isDebugEnabled()) log.debug("Model注册： model = " + model + ", tableName = " + tableName + ", pkName: " + pkName);
			}
		}
	}

}
