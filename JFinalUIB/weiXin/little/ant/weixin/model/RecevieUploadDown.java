package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 接收上传下载多媒体文件消息
 * @author 董华健
 */
public class RecevieUploadDown extends Model<RecevieUploadDown> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final RecevieUploadDown dao = new RecevieUploadDown();
	
	public String type;
	public String media_id;
	public String created_at;
	public String errcode;
	public String errmsg;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
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
	
}
