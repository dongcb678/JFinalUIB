package com.weixin.dto.message;

/**
 * 接收视频消息
 * @author 董华健
 */
public class RecevieMsgVideo extends RecevieMsgBase {
	
	private String MediaId;	 //视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
	private String ThumbMediaId; //视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
	
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	
	
}
