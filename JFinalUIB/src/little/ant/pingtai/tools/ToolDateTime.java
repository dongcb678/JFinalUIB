package little.ant.pingtai.tools;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * 日期时间相关
 * 
 * @author 董华健 2012-9-7 下午1:58:46
 */
public class ToolDateTime {

	private static Logger log = Logger.getLogger(ToolDateTime.class);
	
	public static final String pattern_date = "yyyy-MM-dd";
	public static final String pattern_datetime = "yyyy-MM-dd HH:mm:ss";
	public static final String pattern_datetimeMillisecond = "yyyy-MM-dd HH:mm:ss:SSS";
	
	/**
	 * 格式化
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String format(Date date, String pattern) {
		DateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}
	
	/**
	 * 解析
	 * @param date
	 * @param pattern
	 * @return
	 * @throws ParseException
	 */
	public static Date parse(String date, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		try {
			return format.parse(date);
		} catch (ParseException e) {
			log.error("ToolDateTime.parse异常：date值" + date + "，pattern值" + pattern);
			return null;
		}
	}
	
	/**
	 * 两个日期的时间差，返回"X天X小时X分X秒"
	 * 
	 * @param begin
	 * @param end
	 * @return
	 */
	public static String getBetween(Date begin, Date end) {
		long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
		long day = between / (24 * 3600);
		long hour = between % (24 * 3600) / 3600;
		long minute = between % 3600 / 60;
		long second = between % 60 / 60;

		StringBuffer sb = new StringBuffer();
		sb.append(day);
		sb.append("天");
		sb.append(hour);
		sb.append("小时");
		sb.append(minute);
		sb.append("分");
		sb.append(second);
		sb.append("秒");

		return sb.toString();
	}
	
	/**
	 * 返回两个日期之间隔了多少小时
	 * 
	 * @param date1
	 * @param end
	 * @return
	 */
	public static int getDateHourSpace(Date start, Date end) {
		int hour = (int) ((start.getTime() - end.getTime()) / 3600 / 1000);
		return hour;
	}
	
	/**
	 * 返回两个日期之间隔了多少天
	 * 
	 * @param date1
	 * @param end
	 * @return
	 */
	public static int getDateDaySpace(Date start, Date end) {
		int day = (int) (getDateHourSpace(start, end) / 24);
		return day;
	}
	
	/**
	 * 得到某一天是星期几
	 * 
	 * @param strDate
	 *            日期字符串
	 * @return int 星期几（-1异常）
	 */
	@SuppressWarnings("static-access")
	public static int getDateInWeek(String date) {
		DateFormat format = DateFormat.getDateInstance();
		try {
			format.parse(date);
			java.util.Calendar c = format.getCalendar();
			int day = c.get(c.DAY_OF_WEEK) - c.SUNDAY;
			return day;
		} catch (ParseException e) {
			return -1;
		}
	}
	
	/**
	 * 日期减去多少个小时
	 * @param date
	 * @param hourCount	多少个小时
	 * @return
	 */
	public static Date getDateReduceHour(Date date, long hourCount){
		long time = date.getTime() - 3600 * 1000 * hourCount;
		Date dateTemp = new Date();
		dateTemp.setTime(time);
		return dateTemp;
	}
	
	/**
	 * 日期区间分割
	 * @param start
	 * @param end
	 * @param splitCount
	 * @return
	 */
	public static List<Date> getDateSplit(Date start, Date end, long splitCount){
		long startTime = start.getTime();
		long endTime = end.getTime();
		long between = endTime - startTime;

		long count = splitCount - 1l;
		long section = between / count;
		
		List<Date> list = new ArrayList<Date>();
		list.add(start);
		
		for (long i = 1l ; i < count; i++) {
			long time = startTime + section * i;
			Date date = new Date();
			date.setTime(time);
			list.add(date);
		}
		
		list.add(end);
		
		return list;
	}
	
	public static void main(String[] args) throws ParseException{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start = formatter.parse("2013-07-01 01:00:00");
		Date end = formatter.parse("2013-07-01 12:00:00");
		long splitCount = 12l;
		List<Date> list = getDateSplit(start, end, splitCount);
		for (Date date : list) {
			System.out.println(formatter.format(date));
		}
	}

}
