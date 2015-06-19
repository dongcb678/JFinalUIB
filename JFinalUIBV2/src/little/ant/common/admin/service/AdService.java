package little.ant.common.admin.service;

import little.ant.common.model.Ad;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class AdService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdService.class);
	
	public static final AdService service = Enhancer.enhance(AdService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Ad.sqlId_splitPage_select, Ad.sqlId_splitPage_from);
	}

	/**
	 * 保存
	 * @param ad
	 * @param userIds
	 * @return
	 */
	public String save(Ad ad, String userIds){
		ad.set(Ad.column_createuser, userIds);
		ad.set(Ad.column_createdate, ToolDateTime.getSqlTimestamp(null));
		ad.set(Ad.column_isdelete, "0");
		ad.save();
		return ad.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Ad.dao.deleteById(id);
		}
	}
	
}
