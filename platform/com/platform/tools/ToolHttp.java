package com.platform.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.mail.internet.MimeUtility;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.jfinal.log.Log;

/**
 * HTTP请求相关
 * 
 * @author 董华健
 */
@SuppressWarnings("deprecation")
public abstract class ToolHttp {

	private static final Log log = Log.getLog(ToolHttp.class);

	/**
	 * HTTP请求方法GET
	 */
	public static final String http_method_get = "GET";

	/**
	 * HTTP请求方法POST
	 */
	public static final String http_method_post = "POST";

	/**
	 * 进行HttpClient get连接
	 * 
	 * @param isHttps
	 *            是否ssl链接
	 * @param url
	 * @return
	 */
	public static String get(boolean isHttps, String url) {
		CloseableHttpClient httpClient = null;
		try {
			if (!isHttps) {
				httpClient = HttpClients.createDefault();
			} else {
				httpClient = createSSLInsecureClient();
			}
			HttpGet httpget = new HttpGet(url);
			// httpget.addHeader(new BasicHeader("", ""));
			// httpget.addHeader("", "");
			CloseableHttpResponse response = httpClient.execute(httpget);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// 获取状态行
				// System.out.println(response.getStatusLine());
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					String out = EntityUtils.toString(entity, ToolString.encoding);
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
				if (null != httpClient) {
					httpClient.close();
				}
			} catch (IOException e) {
				if(log.isErrorEnabled()) log.error("httpClient.close()异常");
			}
		}
		return null;
	}

	/**
	 * 进行HttpClient post连接
	 * 
	 * @param isHttps
	 *            是否ssl链接
	 * @param url
	 * @param data
	 * @param contentType
	 * @return
	 */
	public static String post(boolean isHttps, String url, String data, String contentType) {
		CloseableHttpClient httpClient = null;
		try {
			if (!isHttps) {
				httpClient = HttpClients.createDefault();
			} else {
				httpClient = createSSLInsecureClient();
			}
			HttpPost httpPost = new HttpPost(url);
			// (name,
			// value);.addRequestHeader("Content-Type","text/html;charset=UTF-8");
			// httpPost.getParams().setParameter(HttpMethod.HTTP_CONTENT_CHARSET,
			// "UTF-8");

			if (null != data) {
				StringEntity stringEntity = new StringEntity(data, ToolString.encoding);
				stringEntity.setContentEncoding(ToolString.encoding);
				if (null != contentType) {
					stringEntity.setContentType(contentType);
				} else {
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
					String out = EntityUtils.toString(entity, ToolString.encoding);
					return out;
				}
			}
		} catch (UnsupportedEncodingException e) {
			if(log.isErrorEnabled()) log.error(e.getMessage());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
			if(log.isErrorEnabled()) log.error("连接超时：" + url);
		} catch (IOException e) {
			e.printStackTrace();
			if(log.isErrorEnabled()) log.error("IO异常:" + url);
		} finally {
			try {
				if (null != httpClient) {
					httpClient.close();
				}
			} catch (IOException e) {
				if(log.isErrorEnabled()) log.error("httpClient.close()异常");
			}
		}
		return null;
	}

	/**
	 * HTTPS访问对象，信任所有证书
	 * 
	 * @return
	 */
	public static CloseableHttpClient createSSLInsecureClient() {
		try {
			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
				// 信任所有
				public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					return true;
				}
			}).build();
			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext);
			return HttpClients.custom().setSSLSocketFactory(sslsf).build();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		return HttpClients.createDefault();
	}

	/**
	 * 原生方式请求
	 * 
	 * @param isHttps
	 *            是否https
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return
	 */
	public static String httpRequest(boolean isHttps, String requestUrl, String requestMethod, String outputStr) {
		HttpURLConnection conn = null;

		OutputStream outputStream = null;
		OutputStreamWriter outputStreamWriter = null;
		PrintWriter printWriter = null;

		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;

		try {
			URL url = new URL(requestUrl);
			conn = (HttpURLConnection) url.openConnection();
			if (isHttps) {
				HttpsURLConnection httpsConn = (HttpsURLConnection) conn;
				// 创建SSLContext对象，并使用我们指定的信任管理器初始化
				TrustManager[] tm = { new X509TrustManager() {
					@Override
					public void checkClientTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// 检查客户端证书
					}

					public void checkServerTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// 检查服务器端证书
					}

					public X509Certificate[] getAcceptedIssuers() {
						// 返回受信任的X509证书数组
						return null;
					}
				} };
				SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
				sslContext.init(null, tm, new java.security.SecureRandom());
				SSLSocketFactory ssf = sslContext.getSocketFactory();// 从上述SSLContext对象中得到SSLSocketFactory对象
				httpsConn.setSSLSocketFactory(ssf);
				conn = httpsConn;
			}

			// 超时设置，防止 网络异常的情况下，可能会导致程序僵死而不继续往下执行
			conn.setConnectTimeout(30000);
			conn.setReadTimeout(30000);

			// 设置是否向httpUrlConnection输出，因为这个是post请求，参数要放在
			// http正文内，因此需要设为true, 默认情况下是false;
			conn.setDoOutput(true);

			// 设置是否从httpUrlConnection读入，默认情况下是true;
			conn.setDoInput(true);

			// Post 请求不能使用缓存
			conn.setUseCaches(false);

			// 设定传送的内容类型是可序列化的java对象
			// (如果不设此项,在传送序列化对象时,当WEB服务默认的不是这种类型时可能抛java.io.EOFException)
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");

			// 设置请求方式（GET/POST），默认是GET
			conn.setRequestMethod(requestMethod);

			// 连接，上面对urlConn的所有配置必须要在connect之前完成，
			conn.connect();

			// 当outputStr不为null时向输出流写数据
			if (null != outputStr) {
				outputStream = conn.getOutputStream();
				outputStreamWriter = new OutputStreamWriter(outputStream, "UTF-8");
				printWriter = new PrintWriter(outputStreamWriter);
				printWriter.write(outputStr);
				printWriter.flush();
				printWriter.close();
			}

			// 从输入流读取返回内容
			inputStream = conn.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, ToolString.encoding);
			bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			StringBuilder buffer = new StringBuilder();
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str).append("\n");
			}

			return buffer.toString();
		} catch (ConnectException ce) {
			if(log.isErrorEnabled()) log.error("连接超时：{}", ce);
			return null;

		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("https请求异常：{}", e);
			return null;

		} finally { // 释放资源
			if (null != outputStream) {
				try {
					outputStream.close();
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("outputStream.close()异常", e);
				}
				outputStream = null;
			}

			if (null != outputStreamWriter) {
				try {
					outputStreamWriter.close();
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("outputStreamWriter.close()异常", e);
				}
				outputStreamWriter = null;
			}

			if (null != printWriter) {
				printWriter.close();
				printWriter = null;
			}

			if (null != bufferedReader) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("bufferedReader.close()异常", e);
				}
				bufferedReader = null;
			}

			if (null != inputStreamReader) {
				try {
					inputStreamReader.close();
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("inputStreamReader.close()异常", e);
				}
				inputStreamReader = null;
			}

			if (null != inputStream) {
				try {
					inputStream.close();
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("inputStream.close()异常", e);
				}
				inputStream = null;
			}

			if (null != conn) {
				conn.disconnect();
				conn = null;
			}
		}
	}

	/**
	 * 模拟登陆，返回的client对象可以保存cookie和session信息， 然后按权限继续进行其他URL请求， 切记：使用完关闭对象try
	 * catch finally client.close();
	 * 
	 * @param loginUrl
	 * @param loginParam
	 * @return
	 */
	public static CloseableHttpClient mocklogin(String loginUrl, Map<String, String> loginParam) {
		CloseableHttpClient client = null;
		try {
			// 直接创建client
			client = HttpClients.createDefault();

			// 执行post登陆请求
			HttpPost loginHP = new HttpPost(loginUrl);
			UrlEncodedFormEntity loginEntity = new UrlEncodedFormEntity(getParam(loginParam), "UTF-8");
			loginHP.setEntity(loginEntity);
			HttpResponse loginHR = client.execute(loginHP);
			HttpEntity loginHE = loginHR.getEntity();
			String loginReturn = EntityUtils.toString(loginHE);
			if (!loginReturn.equals("success")) {
				if(log.isErrorEnabled()) log.error("登录失败");
				return null;
			}

			return client;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 使用登陆成功的client对象继续其他post请求
	 * 
	 * @param client
	 * @param dataUrl
	 * @param dataParam
	 * @return
	 */
	public static String mockPostByClient(CloseableHttpClient client, String dataUrl, Map<String, String> dataParam) {
		String dataReturn = null;
		try {
			// 使用post方式请求URL数据
			HttpPost dataHP = new HttpPost(dataUrl);
			UrlEncodedFormEntity dataEntity = new UrlEncodedFormEntity(getParam(dataParam), "UTF-8");
			dataHP.setEntity(dataEntity);
			HttpResponse dataHR = client.execute(dataHP);
			HttpEntity dataHE = dataHR.getEntity();
			dataReturn = EntityUtils.toString(dataHE);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dataReturn;
	}

	/**
	 * 使用登陆成功的client对象继续其他get请求
	 * 
	 * @param client
	 * @param dataUrl
	 * @param dataParam
	 * @return
	 */
	public static String mockGetByClient(CloseableHttpClient client, String dataUrl, Map<String, String> dataParam) {
		String dataReturn = null;
		try {
			// 使用get方式请求URL数据
			HttpGet dataHG = new HttpGet(dataUrl);
			HttpResponse dataHR = client.execute(dataHG);
			HttpEntity dataHE = dataHR.getEntity();
			dataReturn = EntityUtils.toString(dataHE);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dataReturn;
	}

	/**
	 * 模拟登陆，并取出登陆验证cookie，然后构造自己的通用cookie对象
	 * 
	 * @param loginUrl
	 * @param loginParam
	 * @return
	 */
	public static CookieStore mockCookie(String loginUrl, Map<String, String> loginParam) {
		CloseableHttpClient client = null;
		CookieStore cookieStore = null;
		try {
			// 直接创建client
			client = HttpClients.createDefault();

			// 执行post登陆请求
			HttpPost loginHP = new HttpPost(loginUrl);
			UrlEncodedFormEntity loginEntity = new UrlEncodedFormEntity(getParam(loginParam), "UTF-8");
			loginHP.setEntity(loginEntity);
			HttpResponse loginHR = client.execute(loginHP);
			HttpEntity loginHE = loginHR.getEntity();
			String loginReturn = EntityUtils.toString(loginHE);
			if (!loginReturn.equals("success")) {
				if(log.isErrorEnabled()) log.error("登录失败");
				return null;
			}

			cookieStore = new BasicCookieStore();
			Header[] headers = loginHR.getHeaders("Set-Cookie");
			String authmark = null;
			for (Header header : headers) {
				authmark = header.getValue();
				if (authmark.indexOf("authmark=") != -1) {
					authmark = authmark.replace("authmark=", "");
					authmark = authmark.substring(0, authmark.indexOf(";"));
					break;
				}
			}

			// 新建一个Cookie
			BasicClientCookie cookie = new BasicClientCookie("authmark", authmark);
			cookie.setVersion(0);
			cookie.setDomain("127.0.0.1");
			cookie.setPath("/");
			// cookie.setAttribute(ClientCookie.VERSION_ATTR, "0");
			// cookie.setAttribute(ClientCookie.DOMAIN_ATTR, "127.0.0.1");
			// cookie.setAttribute(ClientCookie.PORT_ATTR, "89");
			// cookie.setAttribute(ClientCookie.PATH_ATTR, "/");
			cookieStore.addCookie(cookie);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return cookieStore;
	}

	/**
	 * 使用登陆成功的Cookie对象继续其他post请求
	 * 
	 * @param cookie
	 * @param dataUrl
	 * @param dataParam
	 * @return
	 */
	public static String mockPostByCookie(CookieStore cookie, String dataUrl, Map<String, String> dataParam) {
		CloseableHttpClient client = null;
		String dataReturn = null;
		try {
			client = HttpClients.custom().setDefaultCookieStore(cookie).build();
			// 使用post方式请求URL数据
			HttpPost dataHP = new HttpPost(dataUrl);
			UrlEncodedFormEntity dataEntity = new UrlEncodedFormEntity(getParam(dataParam), "UTF-8");
			dataHP.setEntity(dataEntity);
			HttpResponse dataHR = client.execute(dataHP);
			HttpEntity dataHE = dataHR.getEntity();
			dataReturn = EntityUtils.toString(dataHE);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return dataReturn;
	}

	/**
	 * 使用登陆成功的Cookie对象继续其他get请求
	 * 
	 * @param cookie
	 * @param dataUrl
	 * @param dataParam
	 * @return
	 */
	public static String mockGetByCookie(CookieStore cookie, String dataUrl, Map<String, String> dataParam) {
		CloseableHttpClient client = null;
		String dataReturn = null;
		try {
			client = HttpClients.custom().setDefaultCookieStore(cookie).build();
			// 使用get方式请求URL数据
			HttpGet dataHG = new HttpGet(dataUrl);
			HttpResponse dataHR = client.execute(dataHG);
			HttpEntity dataHE = dataHR.getEntity();
			dataReturn = EntityUtils.toString(dataHE);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return dataReturn;
	}

	/**
	 * 模拟登陆，并取出登陆验证标示，然后构造在header中使用
	 * 
	 * @param loginUrl
	 * @param loginParam
	 * @return
	 */
	public static String mockHeader(String loginUrl, Map<String, String> loginParam) {
		CloseableHttpClient client = null;
		String authmark = null;
		try {
			// 直接创建client
			client = HttpClients.createDefault();

			// 执行post登陆请求
			HttpPost loginHP = new HttpPost(loginUrl);
			UrlEncodedFormEntity loginEntity = new UrlEncodedFormEntity(getParam(loginParam), "UTF-8");
			loginHP.setEntity(loginEntity);
			HttpResponse loginHR = client.execute(loginHP);
			HttpEntity loginHE = loginHR.getEntity();
			String loginReturn = EntityUtils.toString(loginHE);
			if (!loginReturn.equals("success")) {
				if(log.isErrorEnabled()) log.error("登录失败");
				return null;
			}

			Header[] headers = loginHR.getHeaders("Set-Cookie");
			for (Header header : headers) {
				authmark = header.getValue();
				if (authmark.indexOf("authmark=") != -1) {
					authmark = authmark.replace("authmark=", "");
					authmark = authmark.substring(0, authmark.indexOf(";"));
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return authmark;
	}

	/**
	 * 使用登陆成功的Cookie对象继续其他post请求
	 * 
	 * @param cookie
	 * @param dataUrl
	 * @param dataParam
	 * @return
	 */
	public static String mockPostByHeader(String authmark, String dataUrl, Map<String, String> dataParam) {
		CloseableHttpClient client = null;
		String dataReturn = null;
		try {
			client = HttpClients.createDefault();
			// 使用post方式请求URL数据
			HttpPost dataHP = new HttpPost(dataUrl);
			UrlEncodedFormEntity dataEntity = new UrlEncodedFormEntity(getParam(dataParam), "UTF-8");
			dataHP.setEntity(dataEntity);
			dataHP.addHeader("authmark", authmark);
			HttpResponse dataHR = client.execute(dataHP);
			HttpEntity dataHE = dataHR.getEntity();
			dataReturn = EntityUtils.toString(dataHE);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return dataReturn;
	}

	/**
	 * map参数转list
	 * 
	 * @param parameterMap
	 * @return
	 */
	public static List<NameValuePair> getParam(Map<String, String> parameterMap) {
		List<NameValuePair> param = new ArrayList<NameValuePair>();
		Iterator<Entry<String, String>> it = parameterMap.entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, String> parmEntry = (Entry<String, String>) it.next();
			param.add(new BasicNameValuePair(parmEntry.getKey(), parmEntry.getValue()));
		}
		return param;
	}

	/**
	 * 文件下载文件名编码
	 * @param request
	 * @param fileName
	 * @return
	 */
	public static void downloadSaveFileName(HttpServletRequest request, HttpServletResponse response, String fileName) {
		String userAgent = request.getHeader("User-Agent");
		String retFileName = null;
		try {
			String newFileName = URLEncoder.encode(fileName, "UTF-8");
			// 如果没有UA，则默认使用IE的方式进行编码，因为毕竟IE还是占多数的
			retFileName = "filename=\"" + newFileName + "\"";
			if (userAgent != null) {
				userAgent = userAgent.toLowerCase();
				
				if (userAgent.indexOf("msie") != -1) { // IE浏览器，只能采用URLEncoder编码
					retFileName = "filename=\"" + newFileName + "\"";
					
				} else if (userAgent.indexOf("opera") != -1) { // Opera浏览器只能采用filename*
					retFileName = "filename*=UTF-8''" + newFileName;
					
				} else if (userAgent.indexOf("safari") != -1) { // Safari浏览器，只能采用ISO编码的中文输出
					retFileName = "filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO8859-1") + "\"";
					
				} else if (userAgent.indexOf("applewebkit") != -1) { // Chrome浏览器，只能采用MimeUtility编码或ISO编码的中文输出
					newFileName = MimeUtility.encodeText(fileName, "UTF8", "B");
					retFileName = "filename=\"" + newFileName + "\"";
					
				} else if (userAgent.indexOf("mozilla") != -1) { // FireFox浏览器，可以使用MimeUtility或filename*或ISO编码的中文输出
					retFileName = "filename*=UTF-8''" + newFileName;
				}
			}
		} catch (UnsupportedEncodingException e) {
			if(log.isErrorEnabled()) log.error(e.getMessage());
		}
		
		response.setHeader("Content-disposition", "attachment; " + retFileName);
	}

	public static void main(String[] args) {
		// System.out.println(get("http://127.0.0.1:89/platform/login"));
		// System.out.println(post("http://127.0.0.1:89/platform/login", null,
		// null));

		// System.out.println(get("http://littleant.duapp.com/msg"));

		/*
		 * String returnMsg = "<xml>"; returnMsg +=
		 * "<ToUserName><![CDATA[dongcb678]]></ToUserName>"; returnMsg +=
		 * "<FromUserName><![CDATA[jiu_guang]]></FromUserName>"; returnMsg +=
		 * "<CreateTime>"+ToolDateTime.getDateByTime()+"</CreateTime>";
		 * returnMsg += "<MsgType><![CDATA[text]]></MsgType>"; returnMsg +=
		 * "<Content><![CDATA[你好]]></Content>"; returnMsg += "</xml>";
		 */

		/*
		 * String returnMsg = "<xml>"; returnMsg +=
		 * " <ToUserName><![CDATA[jiu_guang]]></ToUserName>"; returnMsg +=
		 * " <FromUserName><![CDATA[dongcb678]]></FromUserName> "; returnMsg +=
		 * " <CreateTime>1348831860</CreateTime>"; returnMsg +=
		 * " <MsgType><![CDATA[text]]></MsgType>"; returnMsg +=
		 * " <Content><![CDATA[this is a test]]></Content>"; returnMsg +=
		 * " <MsgId>1234567890123456</MsgId>"; returnMsg += " </xml>";
		 */

		// System.out.println(post("http://127.0.0.1:88/msg", returnMsg,
		// "application/xml"));
		// System.out.println(post("http://littleant.duapp.com/msg", returnMsg,
		// "application/xml"));

		// System.out.println(post(true,
		// "https://www.oschina.net/home/login?goto_page=http%3A%2F%2Fwww.oschina.net%2F",
		// null, "application/text"));
		// System.out.println(httpRequest(false,
		// "https://passport.csdn.net/account/login", "GET", null));
	}
}
