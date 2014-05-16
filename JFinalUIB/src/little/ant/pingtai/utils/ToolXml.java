package little.ant.pingtai.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Iterator;

import little.ant.weixin.vo.RecevieMsgText;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.wutka.jox.JOXBeanInputStream;
import com.wutka.jox.JOXBeanOutputStream;

public class ToolXml {

	/**
	 * 获取xml一级节点文本值，不区分元素名称大小写
	 * @param xml
	 * @param element
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String getStairText(String xml, String elementName){
		elementName = elementName.toLowerCase();
		String result = null;
		try {
			Document doc = DocumentHelper.parseText(xml);
			Element root = doc.getRootElement();
			for(Iterator iterTemp = root.elementIterator(); iterTemp.hasNext();) {	
				Element element = (Element) iterTemp.next();	
				if(element.getName().toLowerCase().equals(elementName)){
					result = element.getText();
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 把xml转bean对象
	 * @param xml
	 * @param className
	 * @return
	 */
	public static Object xmlToBean(String xml, Class<?> className) {
		ByteArrayInputStream xmlData = new ByteArrayInputStream(xml.getBytes());
		JOXBeanInputStream joxIn = new JOXBeanInputStream(xmlData);
		try {
			return (Object) joxIn.readObject(className);
		} catch (IOException exc) {
			exc.printStackTrace();
			return null;
		} finally {
			try {
				xmlData.close();
				joxIn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * bean对象转xml
	 * @param bean
	 * @return
	 */
	public static String beanToXML(Object bean) {
		ByteArrayOutputStream xmlData = new ByteArrayOutputStream();
		JOXBeanOutputStream joxOut = new JOXBeanOutputStream(xmlData);
		try {
			joxOut.writeObject(beanName(bean), bean);
			return xmlData.toString();
		} catch (IOException exc) {
			exc.printStackTrace();
			return null;
		} finally {
			try {
				xmlData.close();
				joxOut.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 获取bean名称
	 * @param bean
	 * @return
	 */
	private static String beanName(Object bean) {
		String fullClassName = bean.getClass().getName();
		String classNameTemp = fullClassName.substring(fullClassName.lastIndexOf(".") + 1, fullClassName.length());
		return classNameTemp.substring(0, 1) + classNameTemp.substring(1);
	}

	public static void main(String[] args) {
		String xml = "<xml>";
		xml += "<URL><![CDATA[http://littleant.duapp.com/msg]]></URL>";
		xml += "<ToUserName><![CDATA[jiu_guang]]></ToUserName>";
		xml += "<FromUserName><![CDATA[dongcb678]]></FromUserName>";
		xml += "<CreateTime>11</CreateTime>";
		xml += "<MsgType><![CDATA[text]]></MsgType>";
		xml += "<Content><![CDATA[wentest]]></Content>";
		xml += "<MsgId>11</MsgId>";
		xml += "</xml>";

		RecevieMsgText recevie = (RecevieMsgText) xmlToBean(xml, RecevieMsgText.class);
		System.out.println(recevie.getToUserName());
		System.out.println(recevie.getFromUserName());
		
		System.out.println(getStairText(xml, "msgId"));
	}

}