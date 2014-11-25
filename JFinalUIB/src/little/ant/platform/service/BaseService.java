package little.ant.platform.service;

import java.util.LinkedList;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.BaseModel;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolMail;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

public abstract class BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BaseService.class);

	/**
	 * 根据i18n参数查询获取哪个字段的值
	 * @param i18n
	 * @return
	 */
	protected String i18n(String i18n){
		return BaseModel.i18n(i18n);
	}
	
	/**
	 * 把11,22,33...转成'11','22','33'...
	 * @param ids
	 * @return
	 */
	protected String toSql(String ids){
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
	protected String toSql(String[] idsArr){
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
	 * 分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param select
	 * @param sqlId
	 */
	protected void splitPageBase(String dataSource, SplitPage splitPage, String select, String sqlId){
		// 接收返回值对象
		StringBuilder formSqlSb = new StringBuilder();
		LinkedList<Object> paramValue = new LinkedList<Object>();
		
		// 调用生成from sql，并构造paramValue
		String sql = ToolSqlXml.getSql(sqlId, splitPage.getQueryParam(), paramValue);
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

		Page<?> page = Db.use(dataSource).paginate(splitPage.getPageNumber(), splitPage.getPageSize(), select, formSql, paramValue.toArray());
		splitPage.setPage(page);
	}
	
	/**
	 * 行级：过滤
	 * @return
	 */
	protected void rowFilter(StringBuilder formSqlSb){
		
	}
	
	/**
	 * 发送邮件对象
	 */
	protected ToolMail sendTextMail(){
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
