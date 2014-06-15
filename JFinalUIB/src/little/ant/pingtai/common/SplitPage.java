package little.ant.pingtai.common;

import java.io.Serializable;
import java.util.Map;

import com.jfinal.plugin.activerecord.Page;

/**
 * 分页封装
 * @author 董华健
 */
public class SplitPage implements Serializable {

	private static final long serialVersionUID = -7914983945613661637L;
	
	// 分页相关
	protected Page<?> page;
	protected Map<String, String> queryParam;// 查询条件
	protected String orderColunm;// 排序条件
	protected String orderMode;// 排序方式
	protected int pageNumber = 1;// 第几页
	protected int pageSize = 20;// 每页显示几多
	
	public Page<?> getPage() {
		return page;
	}
	public void setPage(Page<?> page) {
		this.page = page;
	}
	public Map<String, String> getQueryParam() {
		return queryParam;
	}
	public void setQueryParam(Map<String, String> queryParam) {
		this.queryParam = queryParam;
	}
	public String getOrderColunm() {
		return orderColunm;
	}
	public void setOrderColunm(String orderColunm) {
		this.orderColunm = orderColunm;
	}
	public String getOrderMode() {
		return orderMode;
	}
	public void setOrderMode(String orderMode) {
		this.orderMode = orderMode;
	}
	public int getPageNumber() {
		if(pageNumber == 0){
			pageNumber = 1;
		}
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
