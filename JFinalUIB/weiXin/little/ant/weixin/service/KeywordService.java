package little.ant.weixin.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;
import little.ant.weixin.lucene.DocKeyword;
import little.ant.weixin.model.Keyword;

import org.apache.log4j.Logger;

public class KeywordService extends BaseService {

	private static Logger log = Logger.getLogger(KeywordService.class);
	
	/**
	 * 保存
	 * @param keyword
	 * @return
	 */
	public String save(Keyword keyword){
		keyword.save();
		
		new DocKeyword().add(keyword); // 索引
		
		return keyword.getStr("ids");
	}

	/**
	 * 更新
	 * @param keyword
	 */
	public void update(Keyword keyword){
		keyword.update();
		new DocKeyword().update(keyword); // 索引
	}

	/**
	 * 删除
	 * @param keyword
	 */
	public void delete(String ids){
		Keyword.dao.deleteById(ids);
		new DocKeyword().delete(ids); // 索引
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信自动回复管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from wx_keyword where 1=1 ");
		
		if(null == queryParam){
			return;
		}

		String question = queryParam.get("question");//问题
		String questionkey = queryParam.get("questionkey");//问题关键字
		String answer = queryParam.get("answer");//答案

		if(null!=question && !question.equals("")){
			formSqlSb.append(" and question like ? ");
			paramValue.add("%" + question.trim() + "%");
		}
		
		if(null!=questionkey && !questionkey.equals("")){
			formSqlSb.append(" and questionkey like ? ");
			paramValue.add("%" + questionkey.trim() + "%");
		}
		
		if(null!=answer && !answer.equals("")){
			formSqlSb.append(" and answer like ? ");
			paramValue.add("%" + answer.trim() + "%");
		}
	}


}
