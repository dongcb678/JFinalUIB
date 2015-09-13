package com.platform.mvc.test;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantRender;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;
import com.platform.tools.ToolSqlXml;
import com.weixin.lucene.DocKeyword;

/**
 * 功能测试
 * @author 董华健
 * 描述：比如首页登陆进去显示的数据处理
 */
//@Controller(controllerKey = "/jf/platform/test")
public class TestController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TestController.class);

	/**
	 * 功能查询显示
	 */
	public void operator() {
		paging(ConstantInit.db_dataSource_main, splitPage, Operator.sqlId_splitPage_select, Operator.sqlId_splitPage_from);
		render("/platform/test/operator.html");
	}

	/**
	 * 日志查询显示
	 */
	public void sysLog() {
		defaultOrder(Syslog.column_startdate, "desc");
		paging(ConstantInit.db_dataSource_main, splitPage, Syslog.sqlId_splitPage_select, Syslog.sqlId_splitPage_from);
		render("/platform/test/sysLog.html");
	}
	
	/**
	 * lucene查询显示
	 */
	public void lucene() {
		new DocKeyword().search(splitPage);
		render("/platform/test/lucene.html");
	}
	
	/**
	 * 自动补全后台返回数据
	 */
	public void autoComplete(){
		String keyword = getPara("keyword");
		String size = "10";//getPara("size");
		if(null == keyword || keyword.isEmpty()){
			renderText("[]");
			
		}else{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("url", keyword);
			param.put("size", size);
			
			LinkedList<Object> paramValue = new LinkedList<Object>();
			String sql = ToolSqlXml.getSql("platform.test.autoComplete", param, ConstantRender.sql_renderType_beetl, paramValue);
			List<Record> list = Db.use(ConstantInit.db_dataSource_main).find(sql, paramValue.toArray());
			StringBuilder sb = new StringBuilder();
			sb.append("[");
			for (Record record : list) {
				sb.append("\"").append(record.getStr("url")).append("\"");
				if(list.indexOf(record) != (list.size() - 1)){
					sb.append(", ");
				}
			}
			sb.append("]");
			
			renderText(sb.toString());
		}
	}
	
}


