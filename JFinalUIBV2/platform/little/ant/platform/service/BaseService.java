package little.ant.platform.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.constant.ConstantRender;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.plugin.I18NPlugin;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolMail;
import little.ant.platform.tools.ToolSqlXml;
import little.ant.platform.tools.ToolString;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

/**
 * 公共方法
 * @author 董华健
 */
public abstract class BaseService {

	private static Logger log = Logger.getLogger(BaseService.class);

	/**
	 * 分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param selectContent
	 * @param fromSqlId
	 */
	public void splitPageBase(String dataSource, SplitPage splitPage, String selectContent, String fromSqlId){
		// 接收返回值对象
		StringBuilder formSqlSb = new StringBuilder();
		LinkedList<Object> paramValue = new LinkedList<Object>();
		
		// 调用生成from sql，并构造paramValue
		String sql = ToolSqlXml.getSql(fromSqlId, splitPage.getQueryParam(), ConstantRender.sql_renderType_beetl, paramValue);
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
		Page<?> page = Db.use(dataSource).paginate(splitPage.getPageNumber(), splitPage.getPageSize(), selectContent, formSql, paramValue.toArray());
		splitPage.setTotalPage(page.getTotalPage());
		splitPage.setTotalRow(page.getTotalRow());
		splitPage.setList(page.getList());
		splitPage.compute();
	}

	/**
	 * 分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param selectSqlId
	 * @param fromSqlId
	 */
	public void splitPageBySqlId(String dataSource, SplitPage splitPage, String selectSqlId, String fromSqlId){
		String selectSql = getSql(selectSqlId);
		splitPageBase(dataSource, splitPage, selectSql, fromSqlId);
	}

	/**
	 * Distinct分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param selectContent
	 * @param selectCount
	 * @param fromSqlId
	 */
	public void splitPageDistinctBase(String dataSource, SplitPage splitPage, String selectContent, String selectCount, String fromSqlId){
		// 接收返回值对象
		StringBuilder formSqlSb = new StringBuilder();
		LinkedList<Object> paramValue = new LinkedList<Object>();
		
		// 调用生成from sql，并构造paramValue
		String sql = ToolSqlXml.getSql(fromSqlId, splitPage.getQueryParam(), ConstantRender.sql_renderType_beetl, paramValue);
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
		Page<?> page = Db.use(dataSource).paginateDistinct(splitPage.getPageNumber(), splitPage.getPageSize(), selectContent, selectCount, formSql, paramValue.toArray());
		splitPage.setTotalPage(page.getTotalPage());
		splitPage.setTotalRow(page.getTotalRow());
		splitPage.setList(page.getList());
		splitPage.compute();
	}

	/**
	 * Distinct分页
	 * @param dataSource 数据源
	 * @param splitPage
	 * @param selectSqlId
	 * @param selectCountId
	 * @param fromSqlId
	 */
	public void splitPageDistinctBySqlId(String dataSource, SplitPage splitPage, String selectSqlId, String selectCountId, String fromSqlId){
		String selectSql = getSql(selectSqlId);
		String selectCount = getSql(selectCountId);
		splitPageDistinctBase(dataSource, splitPage, selectSql, selectCount, fromSqlId);
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
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_beetl);
    }
    
    /**
     * 获取SQL，动态SQL，使用Beetl解析
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
	protected String getSqlByBeetl(String sqlId, Map<String, String> param, LinkedList<Object> list){
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
	protected String getSqlByFreeMarker(String sqlId, Map<String, String> param, LinkedList<Object> list){
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
	protected String getSqlByVelocity(String sqlId, Map<String, String> param, LinkedList<Object> list){
    	return ToolSqlXml.getSql(sqlId, param, ConstantRender.sql_renderType_velocity, list);
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
		for (String id : idsArr) {
			if(!ToolString.regExpVali(id, ToolString.regExp_letter_5)){
				log.error("字符安全验证失败：" + id);
				throw new RuntimeException("字符安全验证失败：" + id);
			}
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
	 * 把数组转成'11','22','33'...
	 * @param ids
	 * @return
	 */
	public String toSql(String[] idsArr){
		if(idsArr == null || idsArr.length == 0){
			return null;
		}
		
		for (String id : idsArr) {
			if(!ToolString.regExpVali(id, ToolString.regExp_letter_5)){
				log.error("字符安全验证失败：" + id);
				throw new RuntimeException("字符安全验证失败：" + id);
			}
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
		
		for (String id : idsArr) {
			if(!ToolString.regExpVali(id, ToolString.regExp_letter_5)){
				log.error("字符安全验证失败：" + id);
				throw new RuntimeException("字符安全验证失败：" + id);
			}
		}
		
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
	 * @param sendType 发送邮件的类型：text 、html
	 * @param to	接收者
	 * @param subject 邮件标题
	 * @param content 邮件的文本内容
	 * @param attachFileNames 附件
	 */
	protected void sendTextMail(String sendType, List<String> to, String subject, String content, String[] attachFileNames){
		ToolMail mail = new ToolMail();
		mail.setHost((String)PropertiesPlugin.getParamMapValue(ConstantInit.config_mail_host));
		mail.setPort((String)PropertiesPlugin.getParamMapValue(ConstantInit.config_mail_port));
		mail.setValidate(true);
		mail.setUserName((String)PropertiesPlugin.getParamMapValue(ConstantInit.config_mail_userName));
		mail.setPassword((String)PropertiesPlugin.getParamMapValue(ConstantInit.config_mail_password));
		mail.setFrom((String)PropertiesPlugin.getParamMapValue(ConstantInit.config_mail_from));
		
		mail.setSendType(sendType);
		
		mail.setTo(to);
		mail.setSubject(subject);
		mail.setContent(content);
		mail.setAttachFileNames(attachFileNames);
		
		mail.start();
	}
	
}
