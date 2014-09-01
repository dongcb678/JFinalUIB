package little.ant.weixin.tools;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import little.ant.pingtai.tools.ToolString;
import little.ant.weixin.vo.map.RecevieBaiduPlace;
import little.ant.weixin.vo.map.RecevieUserLocation;
import little.ant.weixin.vo.message.ResponseMsgArticle;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONObject;

/**
 * 百度地图操作类
 * @author 董华健
 */
public class ToolBaiduMap {
	
	/**
	 * 圆形区域检索
	 * 
	 * @param query 检索关键词
	 * @param lng 经度
	 * @param lat 纬度
	 * @return List<BaiduPlace>
	 * @throws UnsupportedEncodingException
	 */
	public static List<RecevieBaiduPlace> searchPlace(String query, String lng, String lat) {
		// 拼装请求地址
		String requestUrl = "http://api.map.baidu.com/place/v2/search?&query=QUERY&location=LAT,LNG&radius=2000&output=xml&scope=2&page_size=10&page_num=0&ak=CA21bdecc75efc1664af5a195c30bb4e";
		requestUrl = requestUrl.replace("QUERY", ToolString.urlEncode(query));
		requestUrl = requestUrl.replace("LAT", lat);
		requestUrl = requestUrl.replace("LNG", lng);
		// 调用Place API圆形区域检索
		String respXml = httpRequest(requestUrl);
		// 解析返回的xml
		List<RecevieBaiduPlace> placeList = parsePlaceXml(respXml);
		return placeList;
	}

	/**
	 * 发送http请求
	 * 
	 * @param requestUrl 请求地址
	 * @return String
	 */
	public static String httpRequest(String requestUrl) {
		StringBuilder buffer = new StringBuilder();
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			httpUrlConn.setDoInput(true);
			httpUrlConn.setRequestMethod("GET");
			httpUrlConn.connect();

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, ToolString.encoding);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

	/**
	 * 根据百度地图返回的流解析出地址信息
	 * 
	 * @param inputStream 输入流
	 * @return List<BaiduPlace>
	 */
	@SuppressWarnings("unchecked")
	private static List<RecevieBaiduPlace> parsePlaceXml(String xml) {
		List<RecevieBaiduPlace> placeList = null;
		try {
			Document document = DocumentHelper.parseText(xml);
			// 得到xml根元素
			Element root = document.getRootElement();
			// 从根元素获取<results>
			Element resultsElement = root.element("results");
			// 从<results>中获取<result>集合
			List<Element> resultElementList = resultsElement.elements("result");
			// 判断<result>集合的大小
			if (resultElementList.size() > 0) {
				placeList = new ArrayList<RecevieBaiduPlace>();
				// POI名称
				Element nameElement = null;
				// POI地址信息
				Element addressElement = null;
				// POI经纬度坐标
				Element locationElement = null;
				// POI电话信息
				Element telephoneElement = null;
				// POI扩展信息
				Element detailInfoElement = null;
				// 距离中心点的距离
				Element distanceElement = null;
				// 遍历<result>集合
				for (Element resultElement : resultElementList) {
					nameElement = resultElement.element("name");
					addressElement = resultElement.element("address");
					locationElement = resultElement.element("location");
					telephoneElement = resultElement.element("telephone");
					detailInfoElement = resultElement.element("detail_info");

					RecevieBaiduPlace place = new RecevieBaiduPlace();
					place.setName(nameElement.getText());
					place.setAddress(addressElement.getText());
					place.setLng(locationElement.element("lng").getText());
					place.setLat(locationElement.element("lat").getText());
					// 当<telephone>元素存在时获取电话号码
					if (null != telephoneElement)
						place.setTelephone(telephoneElement.getText());
					// 当<detail_info>元素存在时获取<distance>
					if (null != detailInfoElement) {
						distanceElement = detailInfoElement.element("distance");
						if (null != distanceElement)
							place.setDistance(Integer.parseInt(distanceElement.getText()));
					}
					placeList.add(place);
				}
				// 按距离由近及远排序
				Collections.sort(placeList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placeList;
	}

	/**
	 * 根据Place组装图文列表
	 * 
	 * @param placeList
	 * @param bd09Lng 经度
	 * @param bd09Lat 纬度
	 * @return List<Article>
	 */
	public static List<ResponseMsgArticle> makeArticleList(List<RecevieBaiduPlace> placeList, String bd09Lng, String bd09Lat) {
		// 项目的根路径
		String basePath = "http://0.weixinmptest.duapp.com/";
		List<ResponseMsgArticle> list = new ArrayList<ResponseMsgArticle>();
		RecevieBaiduPlace place = null;
		for (int i = 0; i < placeList.size(); i++) {
			place = placeList.get(i);
			ResponseMsgArticle article = new ResponseMsgArticle();
			article.setTitle(place.getName() + "\n距离约" + place.getDistance() + "米");
			// P1表示用户发送的位置（坐标转换后），p2表示当前POI所在位置
			article.setUrl(String.format(basePath + "route.jsp?p1=%s,%s&p2=%s,%s", bd09Lng, bd09Lat, place.getLng(), place.getLat()));
			// 将首条图文的图片设置为大图
			if (i == 0)
				article.setPicUrl(basePath + "images/poisearch.png");
			else
				article.setPicUrl(basePath + "images/navi.png");
			list.add(article);
		}
		return list;
	}

	/**
	 * 将微信定位的坐标转换成百度坐标（GCJ-02 -> Baidu）
	 * 
	 * @param lng 经度
	 * @param lat 纬度
	 * @return UserLocation
	 */
	public static RecevieUserLocation convertCoord(String lng, String lat) {
		// 百度坐标转换接口
		String convertUrl = "http://api.map.baidu.com/ag/coord/convert?from=2&to=4&x={x}&y={y}";
		convertUrl = convertUrl.replace("{x}", lng);
		convertUrl = convertUrl.replace("{y}", lat);

		RecevieUserLocation location = new RecevieUserLocation();
		try {
			String jsonCoord = httpRequest(convertUrl);
			JSONObject jsonObject = JSONObject.parseObject(jsonCoord);
			// 对转换后的坐标进行Base64解码
			location.setBd09Lng(ToolString.decode(jsonObject.getString("x")));
			location.setBd09Lat(ToolString.decode(jsonObject.getString("y")));
		} catch (Exception e) {
			location = null;
			e.printStackTrace();
		}
		return location;
	}
}
