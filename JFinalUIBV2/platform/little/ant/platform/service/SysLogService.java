package little.ant.platform.service;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.model.Syslog;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
	public static final SysLogService service = Enhancer.enhance(SysLogService.class, Tx.class);
	
	public Syslog view(String ids){
		String sql = getSql(Syslog.sqlId_view);
		return Syslog.dao.findFirst(sql, ids);
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Syslog.sqlId_splitPage_select, Syslog.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String logIds : idsArr) {
			Syslog.dao.deleteById(logIds);
		}
	}
	
}
