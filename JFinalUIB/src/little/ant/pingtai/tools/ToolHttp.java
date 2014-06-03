package little.ant.pingtai.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;

public class ToolHttp {

	private static Logger log = Logger.getLogger(ToolHttp.class);

	/**
	 * 进行HttpClient get连接
	 * @param isHttps 是否ssl链接
	 * @param url
	 * @return
	 */
	public static String get(boolean isHttps, String url) {
		CloseableHttpClient httpClient = null;
		try {
			if(!isHttps){
				httpClient = HttpClients.createDefault();
			}else{
				httpClient = createSSLInsecureClient();
			}
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
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(null != httpClient){
					httpClient.close();
				}
			} catch (IOException e) {
				log.error("httpClient.close()异常");
			}
		}
		return null;
	}

	/**
	 * 进行HttpClient post连接
	 * @param isHttps 是否ssl链接
	 * @param url
	 * @param data
	 * @param contentType
	 * @return
	 */
	public static String post(boolean isHttps, String url, String data, String contentType) {
		CloseableHttpClient httpClient = null;
		try {
			if(!isHttps){
				httpClient = HttpClients.createDefault();
			}else{
				httpClient = createSSLInsecureClient();
			}
			HttpPost httpPost = new HttpPost(url);
			
			if(null != data){
				StringEntity stringEntity = new StringEntity(data);
				stringEntity.setContentEncoding("UTF-8");
				if (null != contentType) {
					stringEntity.setContentType(contentType);
				}else{
					stringEntity.setContentType("application/json");
				}
				httpPost.setEntity(stringEntity);
			}
			
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
				if(null != httpClient){
					httpClient.close();
				}
			} catch (IOException e) {
				log.error("httpClient.close()异常");
			}
		}
		return null;
	}
	
	/**
	 * HTTPS访问对象，信任所有证书
	 * @return
	 */
	public static CloseableHttpClient createSSLInsecureClient() {
		try {
			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
				//信任所有
				public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					return true;
				}}).build();
			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext);
			return HttpClients.custom().setSSLSocketFactory(sslsf).build();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		return  HttpClients.createDefault();
	}
	
	/**
	 * 发送https请求
	 * 
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpsRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);
			
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			conn.setRequestMethod(requestMethod);

			// 当outputStr不为null时向输出流写数据
			if (null != outputStr) {
				OutputStream outputStream = conn.getOutputStream();
				// 注意编码格式
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 从输入流读取返回内容
			InputStream inputStream = conn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			StringBuffer buffer = new StringBuffer();
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}

			// 释放资源
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			inputStream = null;
			conn.disconnect();
			jsonObject = JSONObject.parseObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("连接超时：{}", ce);
		} catch (Exception e) {
			log.error("https请求异常：{}", e);
		}
		return jsonObject;
	}

	
	public static void main(String[] args){
		//System.out.println(get("http://127.0.0.1:89/jf/login"));
		//System.out.println(post("http://127.0.0.1:89/jf/login", null, null));
		
		//System.out.println(get("http://littleant.duapp.com/msg"));

		/*String returnMsg = "<xml>";
		returnMsg += "<ToUserName><![CDATA[dongcb678]]></ToUserName>";
		returnMsg += "<FromUserName><![CDATA[jiu_guang]]></FromUserName>";
		returnMsg += "<CreateTime>"+new Date().getTime()+"</CreateTime>";
		returnMsg += "<MsgType><![CDATA[text]]></MsgType>";
		returnMsg += "<Content><![CDATA[你好]]></Content>";
		returnMsg += "</xml>";*/
		
		/*String returnMsg = "<xml>";
		returnMsg += " <ToUserName><![CDATA[jiu_guang]]></ToUserName>";
		returnMsg += " <FromUserName><![CDATA[dongcb678]]></FromUserName> ";
		returnMsg += " <CreateTime>1348831860</CreateTime>";
		returnMsg += " <MsgType><![CDATA[text]]></MsgType>";
		returnMsg += " <Content><![CDATA[this is a test]]></Content>";
		returnMsg += " <MsgId>1234567890123456</MsgId>";
		returnMsg += " </xml>";*/
		
		//System.out.println(post("http://127.0.0.1:88/msg", returnMsg, "application/xml"));
		//System.out.println(post("http://littleant.duapp.com/msg", returnMsg, "application/xml"));
		
		System.out.println(post(true, "https://www.oschina.net/home/login?goto_page=http%3A%2F%2Fwww.oschina.net%2F", null, "application/text"));
	}
}

class MyX509TrustManager implements X509TrustManager {

	// 检查客户端证书
	public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}

	// 检查服务器端证书
	public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}

	// 返回受信任的X509证书数组
	public X509Certificate[] getAcceptedIssuers() {
		return null;
	}
}
