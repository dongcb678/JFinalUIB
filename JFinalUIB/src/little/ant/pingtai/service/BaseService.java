package little.ant.pingtai.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

public abstract class BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BaseService.class);
	
	/**
	 * 把11,22,33...转成'11','22','33'...
	 * @param ids
	 * @return
	 */
	protected String toSql(String ids){
		if(null == ids || ids.isEmpty()){
			return "";
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
	 * 分页
	 * @param splitPage
	 * @param select
	 * @return
	 */
	protected void splitPageBase(SplitPage splitPage, String select){
		// 接收返回值对象
		StringBuilder formSqlSb = new StringBuilder();
		List<Object> paramValue = new LinkedList<Object>();
		
		// 调用生成from sql，并构造paramValue
		makeFilter(splitPage.getQueryParam(), formSqlSb, paramValue);

		// 行级：过滤
		rowFilter(formSqlSb);
		
		// 排序
		String orderColunm = splitPage.getOrderColunm();
		String orderMode = splitPage.getOrderMode();
		if(null != orderColunm && !orderColunm.isEmpty() && null != orderMode && !orderMode.isEmpty()){
			formSqlSb.append(" order by ").append(orderColunm).append(" ").append(orderMode);
		}
		
		String formSql = formSqlSb.toString();

		Page<?> page = Db.paginate(splitPage.getPageNumber(), splitPage.getPageSize(), select, formSql, paramValue.toArray());
		splitPage.setPage(page);
	}
	
	/**
	 * 行级：过滤
	 * @return
	 */
	protected void rowFilter(StringBuilder formSqlSb){
		
	}

	/**
	 * 查询条件过滤
	 * @return
	 */
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue){
		
	}
}
