package com.weixin.mvc.keyword;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_keyword")
public class Keyword extends BaseModel<Keyword> {
	
	private static final long serialVersionUID = 7513950057125407026L;

	private static Logger log = Logger.getLogger(Keyword.class);
	
	public static final Keyword dao = new Keyword();

	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：问题 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_question = "question";
	
	/**
	 * 字段描述：问题关键字 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_questionkey = "questionkey";
	
	/**
	 * 字段描述：答案 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_answer = "answer";
	
	
	/**
	 * sqlId : weixin.keyword.splitPage
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage = "weixin.keyword.splitPage";

	private String ids;
	private String question;
	private String questionkey;
	private String answer;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setQuestion(String question){
		set(column_question, question);
	}
	public String getQuestion() {
		return get(column_question);
	}
	public void setQuestionkey(String questionkey){
		set(column_questionkey, questionkey);
	}
	public String getQuestionkey() {
		return get(column_questionkey);
	}
	public void setAnswer(String answer){
		set(column_answer, answer);
	}
	public String getAnswer() {
		return get(column_answer);
	}
	
}
