package little.ant.pingtai.utils;

import java.io.Writer;

import little.ant.weixin.model.RecevieOrdinary;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class ToolXml {
	
	protected static String PREFIX_CDATA = "<![CDATA[";
	protected static String SUFFIX_CDATA = "]]>";

	public static XStream getXStream() {
		XStream xstream = new XStream(new XppDriver() {
			public HierarchicalStreamWriter createWriter(Writer out) {
				return new PrettyPrintWriter(out) {
					protected void writeText(QuickWriter writer, String text) {
						if (text.startsWith(PREFIX_CDATA) && text.endsWith(SUFFIX_CDATA)) {
							writer.write(text);
						} else {
							super.writeText(writer, text);
						}
					}
				};
			};
		});
		return xstream;
	}

	public static void main(String[] args) {
		//XStream xStream = getXStream();
		XStream xStream = new XStream(new DomDriver());
		xStream.alias("xml", RecevieOrdinary.class);

		String xml = "<xml>";
		xml += "<ToUserName><![CDATA[toUser]]></ToUserName>";
		xml += "<FromUserName><![CDATA[fromUser]]></FromUserName>";
		xml += "<CreateTime>1348831860</CreateTime>";
		xml += "<MsgType><![CDATA[text]]></MsgType>";
		xml += "<Content><![CDATA[this is a test]]></Content>";
		xml += "<MsgId>1234567890123456</MsgId>";
		xml += "</xml>";

		RecevieOrdinary recevie = (RecevieOrdinary) xStream.fromXML(xml);
		System.out.println(recevie.getToUserName());
		System.out.println(recevie.getFromUserName());
	}

}