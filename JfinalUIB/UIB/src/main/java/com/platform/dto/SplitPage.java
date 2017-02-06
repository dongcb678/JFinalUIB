package com.platform.dto;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.platform.constant.ConstantSplitPage;

/**
 * 分页封装
 * 
 * @author 董华健
 */
public class SplitPage implements Serializable, Cloneable {

	private static final long serialVersionUID = -7914983945613661637L;

	/**
	 * 分页查询参数
	 */
	private Map<String, Object> queryParam;// 查询条件
	private String orderColunm;// 排序条件
	private String orderMode;// 排序方式
	private int pageNumber = ConstantSplitPage.default_pageNumber;// 第几页
	private int pageSize = ConstantSplitPage.default_pageSize;// 每页显示几多

	/**
	 * 分页结果数据
	 */
	private List<?> list; // 当前页数据
	private int totalPage; // 总页数
	private int totalRow; // 总行数
	private Object extData; // 返回扩展数据

	/**
	 * 分页显示辅助属性
	 */
	private int currentPageCount = -1;// 当前页记录数量
	private int startRow; // 当前页面第一个元素在数据库中的行号
	private int endRow; // 当前页面最后一个元素在数据库中的行号
	
	private boolean isFirst = false;// 是否第一页
	private boolean isLast = false;// 是否最后一页
    private boolean hasPreviousPage = false;//是否有前一页
    private boolean hasNextPage = false;//是否有下一页
	
	private String uri;// 分页uri

	private boolean isExport = false; // 是否导出操作，如果是导出操作，不对每页显示多少条做限制
	
	/**
	 * 分页计算
	 */
	public void compute() {
		// 根据总记录数计算分页数
		if ((this.totalRow % this.pageSize) == 0) {
			this.totalPage = this.totalRow / this.pageSize;// 计算多少页
		} else {
			this.totalPage = this.totalRow / this.pageSize + 1;// 计算多少页
		}

		// 用户请求的分页页码不能大于总页数
		if (pageNumber > totalPage) {
			pageNumber = totalPage;
		}

		// 当前页记录数
		this.currentPageCount = (null != this.list ? this.list.size() : 0);

		// 是否第一页
		if (pageNumber == 1) {
			this.isFirst = true;
		} else {
			this.isFirst = false;
		}

		// 是否最后一页
		if (pageNumber == totalPage) {
			this.isLast = true;
		} else {
			this.isLast = false;
		}
		
		//是否有前一页
		if (pageNumber == 1 || totalPage == 0) {
			this.hasPreviousPage = false;
		}else{
			this.hasPreviousPage = true;
		}
		
		//是否有下一页
		if (pageNumber == totalPage || totalPage == 0) {
			this.hasNextPage = false;
		}else{
			this.hasNextPage = true;
		}

		// 起止行号
		startRow = 1;
		endRow = currentPageCount;
		if (pageNumber != 1) {
			startRow = (pageNumber - 1) * pageSize + 1;
			endRow = startRow + currentPageCount - 1;
		}
	}

	/**
	 * 用户请求的页码
	 * @return
	 */
	public int getPageNumber() {
		if (pageNumber <= 0) {
			pageNumber = ConstantSplitPage.default_pageNumber;
		}
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	/**
	 * 每页显示多少条数据
	 * @return
	 */
	public int getPageSize() {
		if (pageSize <= 0) {
			pageSize = ConstantSplitPage.default_pageSize;
		}
		if (!isExport && pageSize > ConstantSplitPage.default_maxSize) {
			pageSize = ConstantSplitPage.default_pageSize;
		}
		if (isExport && pageSize > ConstantSplitPage.default_export_maxSize) {
			pageSize = ConstantSplitPage.default_export_maxSize;
		}
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public Map<String, Object> getQueryParam() {
		return queryParam;
	}

	public void setQueryParam(Map<String, Object> queryParam) {
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

	public int getCurrentPageCount() {
		return currentPageCount;
	}

	public void setCurrentPageCount(int currentPageCount) {
		this.currentPageCount = currentPageCount;
	}

	public boolean isFirst() {
		return isFirst;
	}

	public void setFirst(boolean isFirst) {
		this.isFirst = isFirst;
	}

	public boolean isLast() {
		return isLast;
	}

	public void setLast(boolean isLast) {
		this.isLast = isLast;
	}

	public Object getExtData() {
		return extData;
	}

	public void setExtData(Object extData) {
		this.extData = extData;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public boolean isExport() {
		return isExport;
	}

	public void setExport(boolean isExport) {
		this.isExport = isExport;
	}

}
