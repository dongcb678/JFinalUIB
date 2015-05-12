package little.ant.common.service;

import little.ant.common.model.IpBlacklist;
import little.ant.common.model.SensitiveWord;
import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class SensitiveWordService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SensitiveWordService.class);
	
	public static final SensitiveWordService service = new SensitiveWordService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "common.sensitiveWord.splitPage");
	}

	/**
	 * 保存
	 * @param sensitiveWord
	 * @param userIds
	 * @return
	 */
	public String save(SensitiveWord sensitiveWord, String userIds){
		sensitiveWord.set(IpBlacklist.colunm_createuser, userIds);
		sensitiveWord.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		sensitiveWord.set(IpBlacklist.colunm_isdelete, "0");
		sensitiveWord.save();
		return sensitiveWord.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			SensitiveWord.dao.deleteById(id);
		}
	}
	
}
