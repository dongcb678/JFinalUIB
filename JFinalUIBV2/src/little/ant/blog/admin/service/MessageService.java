package little.ant.blog.admin.service;

import little.ant.blog.model.Message;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MessageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageService.class);
	
	public static final MessageService service = Enhancer.enhance(MessageService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Message.sqlId_splitPage_select, Message.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Message.dao.deleteById(id);
		}
	}
	
}
