package com.platform.mvc.test;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.syslog.Syslog;

/**
 * 功能测试
 * @author 董华健
 * 描述：比如首页登陆进去显示的数据处理
 */
@Controller("/platform/test")
public class TestController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(TestController.class);

	/**
	 * 功能查询显示
	 */
	public void operator() {
		paging(splitPage, Operator.sqlId_splitPageSelect, Operator.sqlId_splitPageFrom);
		render("/platform/test/operator.html");
	}

	/**
	 * 日志查询显示
	 */
	public void sysLog() {
		defaultOrder(Syslog.column_startdate, "desc");
		paging(splitPage, Syslog.sqlId_splitPageSelect, Syslog.sqlId_splitPageFrom);
		render("/platform/test/sysLog.html");
	}
	
	/**
	 * 自动补全后台返回数据
	 */
	public void autoComplete(){
		String keyword = getPara("keyword");
		String size = "10";//getPara("size");
		if(StrKit.isBlank(keyword)){
			renderText("[]");
			
		}else{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("url", keyword);
			param.put("size", size);
			
			LinkedList<Object> paramValue = new LinkedList<Object>();
			String sql = getSqlByBeetl("platform.test.autoComplete", param, paramValue);
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


