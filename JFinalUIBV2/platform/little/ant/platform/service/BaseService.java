package little.ant.platform.service;

import java.util.LinkedList;
import java.util.Map;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.plugin.I18NPlugin;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolMail;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

/**
 * 公共方法
 * @author 董华健
 */
public abstract class BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BaseService.class);

	/**
	 * 分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param select
	 * @param sqlId
	 */
	public void splitPageBase(String dataSource, SplitPage splitPage, String select, String sqlId){
		// 接收返回值对象
		StringBuilder formSqlSb = new StringBuilder();
		LinkedList<Object> paramValue = new LinkedList<Object>();
		
		// 调用生成from sql，并构造paramValue
		String sql = ToolSqlXml.getSql(sqlId, splitPage.getQueryParam(), DictKeys.sql_renderType_beetl, paramValue);
		formSqlSb.append(sql);
		
		// 行级：过滤
		rowFilter(formSqlSb);
		
		// 排序
		String orderColunm = splitPage.getOrderColunm();
		String orderMode = splitPage.getOrderMode();
		if(null != orderColunm && !orderColunm.isEmpty() && null != orderMode && !orderMode.isEmpty()){
			formSqlSb.append(" order by ").append(orderColunm).append(" ").append(orderMode);
		}
		
		String formSql = formSqlSb.toString();
		
		// 分页封装
		Page<?> page = Db.use(dataSource).paginate(splitPage.getPageNumber(), splitPage.getPageSize(), select, formSql, paramValue.toArray());
		splitPage.setTotalPage(page.getTotalPage());
		splitPage.setTotalRow(page.getTotalRow());
		splitPage.setList(page.getList());
		splitPage.compute();
	}

	/**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
	public String getSql(String sqlId){
		return ToolSqlXml.getSql(sqlId);
	}

    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_beetl);
    }
    
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, String> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_beetl, list);
    }

    /**
     * 获取SQL，动态SQL，使用FreeMarker解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByFreeMarker(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_freeMarker);
    }
    
    /**
     * 获取SQL，动态SQL，使用FreeMarker解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByFreeMarker(String sqlId, Map<String, String> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_freeMarker, list);
    }

    /**
     * 获取SQL，动态SQL，使用Velocity解析
     * @param sqlId
     * @param param
     * @return
     */
	protected String getSqlByVelocity(String sqlId, Map<String, Object> param){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_velocity);
    }
    
    /**
     * 获取SQL，动态SQL，使用Velocity解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByVelocity(String sqlId, Map<String, String> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, DictKeys.sql_renderType_velocity, list);
    }
	
	/**
	 * 根据i18n参数查询获取哪个字段的值
	 * @param i18n
	 * @return
	 */
	public String i18n(String i18n){
		return I18NPlugin.i18n(i18n);
	}
	
	/**
	 * 把11,22,33...转成'11','22','33'...
	 * @param ids
	 * @return
	 */
	public String toSql(String ids){
		if(null == ids || ids.trim().isEmpty()){
			return null;
		}
		
		String[] idsArr = ids.split(",");
		StringBuilder sqlSb = new StringBuilder();
		int length = idsArr.length;
		for (int i = 0, size = length -1; i < size; i++) {
			sqlSb.append(" '").append(idsArr[i]).append("', ");
		}
		if(length != 0){
			sqlSb.append(" '").append(idsArr[length-1]).append("' ");
		}
		
		return sqlSb.toString();
	}

	/**
	 * 把数组转成'11','22','33'...
	 * @param ids
	 * @return
	 */
	public String toSql(String[] idsArr){
		if(idsArr == null || idsArr.length == 0){
			return null;
		}
		
		StringBuilder sqlSb = new StringBuilder();
		int length = idsArr.length;
		for (int i = 0, size = length -1; i < size; i++) {
			sqlSb.append(" '").append(idsArr[i]).append("', ");
		}
		if(length != 0){
			sqlSb.append(" '").append(idsArr[length-1]).append("' ");
		}
		
		return sqlSb.toString();
	}

	/**
	 * 把11,22,33...转成['11','22','33'...]
	 * @param ids
	 * @return
	 */
	public String[] splitByComma(String ids){
		if(null == ids || ids.trim().isEmpty()){
			return null;
		}
		
		String[] idsArr = ids.split(",");
		
		return idsArr;
	}

	/**
	 * 行级：过滤
	 * @return
	 */
	public void rowFilter(StringBuilder formSqlSb){
		
	}
	
	/**
	 * 发送邮件对象
	 */
	public ToolMail sendTextMail(){
		ToolMail mail = new ToolMail();
		mail.setHost((String)PropertiesPlugin.getParamMapValue(DictKeys.config_mail_host));
		mail.setPort((String)PropertiesPlugin.getParamMapValue(DictKeys.config_mail_port));
		mail.setValidate(true);
		mail.setUserName((String)PropertiesPlugin.getParamMapValue(DictKeys.config_mail_userName));
		mail.setPassword((String)PropertiesPlugin.getParamMapValue(DictKeys.config_mail_password));
		mail.setFrom((String)PropertiesPlugin.getParamMapValue(DictKeys.config_mail_from));
		return mail;
	}
	
}
