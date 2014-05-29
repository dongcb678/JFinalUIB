package little.ant.weixin.vo.cservice;

import java.util.List;

/**
 * 关注用户列表
 */
public class RecevieUserList {
	
	// 公众账号的总关注用户数
	private int total;
	
	// 获取的OpenID个数
	private int count;
	
	// OpenID列表
	private List<String> openIdList;
	
	// 拉取列表的后一个用户的OPENID
	private String nextOpenId;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<String> getOpenIdList() {
		return openIdList;
	}

	public void setOpenIdList(List<String> openIdList) {
		this.openIdList = openIdList;
	}

	public String getNextOpenId() {
		return nextOpenId;
	}

	public void setNextOpenId(String nextOpenId) {
		this.nextOpenId = nextOpenId;
	}
}
