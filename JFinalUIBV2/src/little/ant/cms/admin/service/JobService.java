package little.ant.cms.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.cms.model.Job;

public class JobService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobService.class);
	
	public static final JobService service = MyTxProxy.newProxy(JobService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.job.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Job.dao.deleteById(id);
		}
	}
	
}
