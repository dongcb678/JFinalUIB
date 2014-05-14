package little.ant.pingtai.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

public class ToolHttpClient {

	private static Logger log = Logger.getLogger(ToolHttpClient.class);

	/**
	 * 进行HttpClient get连接
	 * @param url
	 * @return
	 */
	public static String get(String url) {
		CloseableHttpClient httpClient = null;
		try {
			httpClient = HttpClients.createDefault();
			HttpGet httpget = new HttpGet(url);
			//httpget.addHeader(new BasicHeader("", ""));
			//httpget.addHeader("", "");
			CloseableHttpResponse response = httpClient.execute(httpget);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// 获取状态行
				//System.out.println(response.getStatusLine());
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					String out = EntityUtils.toString(entity, "UTF-8");
					return out;
				}
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				log.error("httpClient.close()异常");
			}
		}
		return null;
	}

	/**
	 * 进行HttpClient post连接
	 * @param url
	 * @param data
	 * @param contentType
	 * @return
	 */
	public static String post(String url, String data, String contentType) {
		if (null == contentType) {
			contentType = "application/json";
		}
		CloseableHttpClient httpClient = null;
		try {
			httpClient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost(url);

			StringEntity stringEntity = new StringEntity(data);
			stringEntity.setContentEncoding("UTF-8");
			stringEntity.setContentType(contentType);
			httpPost.setEntity(stringEntity);

			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(2000).setConnectTimeout(2000).build();// 设置请求和传输超时时间
			httpPost.setConfig(requestConfig);

			HttpResponse response = httpClient.execute(httpPost);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					String out = EntityUtils.toString(entity, "UTF-8");
					return out;
				}
			}
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			log.error("连接超时：" + url);
		} catch (IOException e) {
			e.printStackTrace();
			log.error("IO异常:" + url);
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				log.error("httpClient.close()异常");
			}
		}
		return null;
	}

}
