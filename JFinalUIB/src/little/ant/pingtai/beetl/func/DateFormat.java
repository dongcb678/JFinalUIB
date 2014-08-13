package little.ant.pingtai.beetl.func;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import oracle.sql.TIMESTAMP;

import org.beetl.core.Format;

/**
 * 日期格式化函数，如 ${date,dateFormat='yyyy-Mm-dd'}，如果没有patten，则使用local
 * 
 * @author joelli
 * 
 */
public class DateFormat implements Format {

	public Object format(Object data, String pattern) {
		if (data == null)
			return null;
		if (Date.class.isAssignableFrom(data.getClass())) {
			SimpleDateFormat sdf = null;
			if (pattern == null) {
				sdf = new SimpleDateFormat();
			} else {
				sdf = new SimpleDateFormat(pattern);
			}
			return sdf.format((Date) data);

		} else if (TIMESTAMP.class.isAssignableFrom(data.getClass())) { // 针对Oracle JDBC特殊处理
			SimpleDateFormat sdf = null;
			if (pattern == null) {
				sdf = new SimpleDateFormat();
			} else {
				sdf = new SimpleDateFormat(pattern);
			}
			TIMESTAMP ts = (TIMESTAMP) data;
			Date date = null;
			try {
				date = ts.timestampValue();
			} catch (SQLException e) {
				return "";
			}
			
			return sdf.format(date);

		} else if (data.getClass() == Long.class) {
			// Date date = new Date((Long) data);
			SimpleDateFormat sdf = null;
			if (pattern == null) {
				sdf = new SimpleDateFormat();
			} else {
				sdf = new SimpleDateFormat(pattern);
			}
			return sdf.format((Date) data);

		} else {
			throw new RuntimeException("Arg Error:Type should be Date:" + data.getClass());
		}

	}

}