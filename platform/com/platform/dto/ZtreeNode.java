package com.platform.dto;

import java.util.List;

/**
 * Ztree节点数据封装
 * @author 董华健
 */
public class ZtreeNode {
	
	/**
	 * 节点id
	 */
	private String id;

	/**
	 * 节点名称
	 */
	private String name;

	/**
	 * 是否上级节点
	 */
	private boolean isParent;

	/**
	 * 是否选中
	 */
	private boolean checked;

	/**
	 * 是否选中
	 */
	private boolean nocheck;
	
	/**
	 * 节点图标
	 */
	private String icon;
	
	/**
	 * 子节点数据
	 */
	private List<ZtreeNode> children;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<ZtreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<ZtreeNode> children) {
		this.children = children;
	}
	
}
