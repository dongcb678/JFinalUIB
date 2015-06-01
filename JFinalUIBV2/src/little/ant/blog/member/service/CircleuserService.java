package little.ant.blog.member.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.constant.ConstantInit;
import little.ant.blog.model.Circleuser;

public class CircleuserService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleuserService.class);
	
	public static final CircleuserService service = MyTxProxy.newProxy(CircleuserService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.circleuser.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Circleuser.dao.deleteById(id);
		}
	}
	
}
