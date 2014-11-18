package little.ant.weixin.bo.menu;

/**
 * click类型的按钮
 * @author 董华健
 */
public class ResponseMenuButtonClick extends ResponseMenuButton {
	
	private String type;
	private String key;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
}
