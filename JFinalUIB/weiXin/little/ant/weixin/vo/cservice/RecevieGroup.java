package little.ant.weixin.vo.cservice;

/**
 * 公众账号分组信息
 */
public class RecevieGroup {
	
	// 分组id
	private int id;
	
	// 分组名称
	private String name;
	
	// 分组内的用户数
	private int count;

	private String errcode; // 错误码
	private String errmsg; // 错误提示

	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
