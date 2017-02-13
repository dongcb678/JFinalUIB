package com.platform.beetl.format;

import java.sql.SQLException;
import java.util.Date;

import org.beetl.core.Format;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.tools.ToolDateTime;

import oracle.sql.DATE;
import oracle.sql.TIMESTAMP;

/**
 * beetl页面日期格式化，重写是为了处理Oracle的TIMESTAMP
 * @author 董华健
 */
public class DateFormat implements Format {

	private static final Log log = Log.getLog(DateFormat.class);
	
	/**
	 * 实现格式化处理方法
	 */
	public Object format(Object data, String pattern) {
		if (data == null){
			return null;
		}
		
		if (StrKit.isBlank(pattern)){
			throw new RuntimeException("DateFormat 参数错误 : pattern不能为空");
		}
		
		if (Date.class.isAssignableFrom(data.getClass())) {
			return ToolDateTime.format((Date) data, pattern);

		} else if (TIMESTAMP.class.isAssignableFrom(data.getClass())) { // 针对Oracle JDBC TIMESTAMP特殊处理
			TIMESTAMP ts = (TIMESTAMP) data;
			Date date = null;
			try {
				date = ts.timestampValue();
			} catch (SQLException e) {
				if(log.isErrorEnabled()) log.error("DateFormat中针对Oracle的TIMESTAMP类型转Date出现异常");
				return "";
			}
			return ToolDateTime.format(date, pattern);

		} else if (DATE.class.isAssignableFrom(data.getClass())) { // 针对Oracle JDBC DATE特殊处理
			DATE ts = (DATE) data;
			Date date = ts.dateValue();
			return ToolDateTime.format(date, pattern);

		}  else if (data.getClass() == Long.class) {
			Date date = new Date((Long) data);
			return ToolDateTime.format(date, pattern);

		} else {
			throw new RuntimeException("DateFormat 参数错误 : data数据类型错误" + data.getClass());
		}
	}

}