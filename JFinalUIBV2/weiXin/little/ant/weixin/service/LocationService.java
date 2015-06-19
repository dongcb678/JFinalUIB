package little.ant.weixin.service;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);

	public static final LocationService service = Enhancer.enhance(LocationService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户位置管理：分页处理");
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "weixin.location.splitPage");
	}
	
}
