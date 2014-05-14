package little.ant.pingtai.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Syslog;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;

/**
 * 公共Controller
 * @author 董华健
 */
public abstract class BaseController extends Controller {

	private static Logger log = Logger.getLogger(BaseController.class);
	
	/**
	 * 全局变量
	 */
	protected String ids;// 主键
	protected SplitPage splitPage;// 分页封装
	protected List<?> list;// 公共list
	protected Syslog reqSysLog;// 访问日志
	
	/**
	 * 请求/WEB-INF/下的视图文件
	 */
	public void toUrl() {
		String toUrl = getPara("toUrl");
		render(toUrl);
	}
	
	/**
	 * 默认排序
	 * @param colunm
	 * @param mode
	 */
	public void defaultOrder(String colunm, String mode){
		splitPage.setOrderColunm(colunm);
		splitPage.setOrderMode(mode);
	}
	
	/**
	 * 重写getPara，进行二次decode解码
	 */
	@Override
	public String getPara(String name) {
		String value = getRequest().getParameter(name);
		if(null != value && !value.isEmpty()){
			try {
				value = URLDecoder.decode(value, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				log.error("decode异常："+value);
			}
		}
		return super.getPara(name);
	}
	
	/************************************		get 	set 	方法		************************************************/

	public Syslog getReqSysLog() {
		return reqSysLog;
	}

	public void setReqSysLog(Syslog reqSysLog) {
		this.reqSysLog = reqSysLog;
	}

	public void setSplitPage(SplitPage splitPage) {
		this.splitPage = splitPage;
	}

}
