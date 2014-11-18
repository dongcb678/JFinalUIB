package little.ant.weixin.bo.menu;

/**
 * 复合类型的按钮
 * @author 董华健
 */
public class ResponseMenuButtonComplex extends ResponseMenuButton {
	
	private ResponseMenuButton[] sub_button;

	public ResponseMenuButton[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(ResponseMenuButton[] sub_button) {
		this.sub_button = sub_button;
	}
	
}
