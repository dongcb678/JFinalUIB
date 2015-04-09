package little.ant.weixin.bo.user;

/**
 * 微信用户的基本信息
 */
public class RecevieUserInfo {
	
	// 用户的标识
	private String openId;
	
	// 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
	private int subscribe;
	
	// 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
	private String subscribeTime;
	
	// 昵称
	private String nickname;
	
	// 用户的性别（1是男性，2是女性，0是未知）
	private int sex;
	
	// 用户所在国家
	private String country;
	
	// 用户所在省份
	private String province;
	
	// 用户所在城市
	private String city;
	
	// 用户的语言，简体中文为zh_CN
	private String language;
	
	// 用户头像
	private String headImgUrl;

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

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public int getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(int subscribe) {
		this.subscribe = subscribe;
	}

	public String getSubscribeTime() {
		return subscribeTime;
	}

	public void setSubscribeTime(String subscribeTime) {
		this.subscribeTime = subscribeTime;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
}