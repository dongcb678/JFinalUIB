package little.ant.blog.member.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.constant.ConstantInit;
import little.ant.blog.model.Message;

public class MessageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageService.class);
	
	public static final MessageService service = MyTxProxy.newProxy(MessageService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.message.splitPage");
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
