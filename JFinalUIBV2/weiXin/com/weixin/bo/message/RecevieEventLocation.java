package com.weixin.bo.message;

/**
 * 上报地理位置事件
 * @author 董华健
 */
public class RecevieEventLocation extends RecevieEventBase {
	
	private long Latitude;	 //地理位置纬度
	private long Longitude;	 //地理位置经度
	private long Precision;	 //地理位置精度
	
	public long getLatitude() {
		return Latitude;
	}
	public void setLatitude(long latitude) {
		Latitude = latitude;
	}
	public long getLongitude() {
		return Longitude;
	}
	public void setLongitude(long longitude) {
		Longitude = longitude;
	}
	public long getPrecision() {
		return Precision;
	}
	public void setPrecision(long precision) {
		Precision = precision;
	}
	
}
