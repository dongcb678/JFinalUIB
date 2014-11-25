package little.ant.platform.tools;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

/**
 * 邮件发送
 * @author 董华健
 */
public class ToolMail {
	
	private static Logger log = Logger.getLogger(ToolMail.class);

	private String host;		// 发送邮件的服务器的IP
	private String port = "25";	// 发送邮件的服务器的端口
	
	private String from;		// 邮件发送者的地址
	private String userName;	// 登陆邮件发送服务器的用户名
	private String password;	// 登陆邮件发送服务器的密码
	
	private String to;			// 邮件接收者的地址
	
	private boolean validate = false;	// 是否需要身份验证
	
	private String subject;		// 邮件标题
	private String content;		// 邮件的文本内容
	private String[] attachFileNames;	// 邮件附件的文件名

	/**
	 * 获得邮件会话属性
	 */
	public Properties getProperties() {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", this.host);
		prop.put("mail.smtp.port", this.port);
		prop.put("mail.smtp.auth", validate ? "true" : "false");
		
		if(this.host.indexOf("smtp.gmail.com") >= 0){
			prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
			prop.setProperty("mail.smtp.socketFactory.fallback", "false"); 
			prop.setProperty("mail.smtp.port", "465"); 
			prop.setProperty("mail.smtp.socketFactory.port", "465"); 
		}
		
		return prop;
	}

	/**
	 * 以文本格式发送邮件
	 * @param mailInfo   待发送的邮件的信息
	 */
	public boolean sendTextMail() {
		// 判断是否需要身份认证
		MailAuthenticator authenticator = null;
		Properties pro = getProperties();
		if (isValidate()) {
			// 如果需要身份认证，则创建一个密码验证器
			authenticator = new MailAuthenticator(getUserName(), getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getInstance(pro, authenticator);// getDefaultInstance
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address from = new InternetAddress(getFrom());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(getTo());
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			// 设置邮件消息的主题
			mailMessage.setSubject(getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// 设置邮件消息的主要内容
			String mailContent = getContent();
			mailMessage.setText(mailContent);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			log.error("发送文本邮件异常：" + ex.getMessage());
			ex.printStackTrace();
			return false;
		}
	}

	/**
	 * 以HTML格式发送邮件
	 * 
	 * @param mailInfo
	 *            待发送的邮件信息
	 * @throws MessagingException 
	 */
	public boolean sendHtmlMail() throws MessagingException {
		// 判断是否需要身份认证
		MailAuthenticator authenticator = null;
		Properties pro = getProperties();
		// 如果需要身份认证，则创建一个密码验证器
		if (isValidate()) {
			authenticator = new MailAuthenticator(getUserName(), getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getInstance(pro, authenticator);// getDefaultInstance
		try {
			// 根据session创建一个邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address from = new InternetAddress(getFrom());
			// 设置邮件消息的发送者
			mailMessage.setFrom(from);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(getTo());
			// Message.RecipientType.TO属性表示接收者的类型为TO
			mailMessage.setRecipient(Message.RecipientType.TO, to);
			// 设置邮件消息的主题
			mailMessage.setSubject(getSubject());
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
			Multipart mainPart = new MimeMultipart();
			// 创建一个包含HTML内容的MimeBodyPart
			BodyPart html = new MimeBodyPart();
			// 设置HTML内容
			html.setContent(getContent(), "text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			// 将MiniMultipart对象设置为邮件内容
			mailMessage.setContent(mainPart);
			// 发送邮件
			Transport.send(mailMessage);
			return true;
		} catch (MessagingException ex) {
			log.error("发送html邮件异常：" + ex.getMessage());
			ex.printStackTrace();
			throw ex;
		}
	}

	public static void main(String[] args) throws MessagingException {
		ToolMail mailInfo = new ToolMail();
		mailInfo.setHost("smtp.163.com");
		mailInfo.setPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName("dongcb678@163.com");
		mailInfo.setPassword("123456");// 您的邮箱密码
		mailInfo.setFrom("dongcb678@163.com");
		mailInfo.setTo("150584428@qq.com");
		mailInfo.setSubject("标题test111");
		mailInfo.setContent("内容test111");
		mailInfo.sendTextMail();// 发送html格式
		mailInfo.sendHtmlMail();// 发送html格式
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String[] getAttachFileNames() {
		return attachFileNames;
	}

	public void setAttachFileNames(String[] attachFileNames) {
		this.attachFileNames = attachFileNames;
	}
}

class MailAuthenticator extends Authenticator {
	String userName = null;
	String password = null;

	public MailAuthenticator() {
	}

	public MailAuthenticator(String username, String password) {
		this.userName = username;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
}
