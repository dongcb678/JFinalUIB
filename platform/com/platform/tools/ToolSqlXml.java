package com.platform.tools;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.beetl.core.BeetlKit;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.constant.ConstantRender;
import com.platform.plugin.SqlXmlPlugin;

/**
 * 处理Sql Map
 * @author 董华健
 * 说明：加载sql map中的sql到map中，并提供动态长度sql处理
 */
public abstract class ToolSqlXml {

	private static final Log log = Log.getLog(ToolSqlXml.class);

    /**
     * 过滤掉的sql关键字
     */
    private static final List<String> badKeyWordList = new ArrayList<String>();
    
    /**
     * 加载关键字到List
     */
    static {
    	String badStr = "and|exec|execute|insert|select|delete|update|count|drop|chr|mid|master|truncate|" +
                "char|declare|sitename|net user|xp_cmdshell|like|like'|create|table|from|grant|use|group_concat|column_name|" +
                "information_schema.columns|table_schema|union|where|order|by|'|*|%|;|or|-|+|,|--|//|/|#";
    	badKeyWordList.addAll(Arrays.asList(badStr.split("\\|")));
    }
    
    /**
     * sql查询关键字过滤效验
     * @param queryStr
     * @return
     */
    public static boolean keywordVali(String queryStr) {
    	queryStr = queryStr.toLowerCase();//统一转为小写
        for (String badKeyWord : badKeyWordList) {
        	if (queryStr.indexOf(badKeyWord) >= 0) {
                return true;
            }
		}
        return false;
    }
    
    /**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
    public static String getSqlMy(String sqlId) {
    	String sql = ToolCache.get(SqlXmlPlugin.cacheStart_sql + sqlId);
    	
    	if(StrKit.isBlank(sql)){
			if(log.isErrorEnabled()) log.error("sql语句不存在：sql id是" + sqlId);
			return null;
    	}
    	
        return sql.replaceAll("[\\s]{2,}", " ");
    }

    /**
     * 获取SQL，动态SQL
     * @param sqlId	xml文件中的sql id
     * @param param	xml sql中的变量map
     * @param renderType 解析sql和param的类型，默认是beetl，还可以是Velocity、FreeMarker，还需其他请自行参考实现
     * @return
     */
    public static String getSqlMy(String sqlId, Map<String, Object> param, String renderType) {
    	String sqlTemplete = ToolCache.get(SqlXmlPlugin.cacheStart_sql + sqlId);
    	
    	if(StrKit.isBlank(sqlTemplete)){
			if(log.isErrorEnabled()) log.error("sql语句不存在：sql id是" + sqlId);
			return null;
    	}
    	
    	if(param == null){
    		param = new HashMap<String, Object>();
    	}
    	
    	String sql = null;
    	if(null == renderType || renderType.equals(ConstantRender.sql_renderType_beetl)){
    		if(log.isDebugEnabled()) log.debug("beetl解析sql");
    		sql = BeetlKit.render(sqlTemplete, param);
    		
    	} else if(renderType.equals(ConstantRender.sql_renderType_freeMarker)){
    		if(log.isDebugEnabled()) log.debug("FreeMarker解析sql");
    		sql = ToolFreeMarker.render(sqlTemplete, param);
    		
    	} else if(renderType.equals(ConstantRender.sql_renderType_velocity)){
    		if(log.isDebugEnabled()) log.debug("Velocity解析sql");
    		sql = ToolVelocity.render(sqlTemplete, param);
    	} 
		
		for (Map.Entry<String, Object> entry : param.entrySet()){
			Object paramValue = entry.getValue();
			if(paramValue == null){
				break;
			}
			if(paramValue instanceof String){
				String value = (String) paramValue;
				value = value.replace("'", "").replace(";", "").replace("--", "");
				sql = sql.replace("#" + entry.getKey() + "#", value);
			}
		}
		
        return sql.replaceAll("[\\s]{2,}", " ");
    }

	/**
	 * 匹配模式为 #'%$names$%'#
	 */
	private static final Pattern pattern = Pattern.compile("#[\\w\\d\\$\\'\\%\\_]+#");	//#[\\w\\d]+#    \\$
	
	/**
	 * 匹配模式为 $names$
	 */
	private static final Pattern pattern2 = Pattern.compile("\\$[\\w\\d\\_]+\\$");
	
    /**
     * 获取SQL，动态SQL
     * @param sqlId 
     * @param param 查询参数
     * @param renderType 解析sql和param的类型，默认是beetl，还可以是Velocity、FreeMarker，还需其他请自行参考实现
     * @param list 用于接收预处理的值
     * @return
     */
    public static String getSqlMy(String sqlId, Map<String, Object> param, String renderType, LinkedList<Object> list) {
    	String sqlTemplete = ToolCache.get(SqlXmlPlugin.cacheStart_sql + sqlId);
    	if(StrKit.isBlank(sqlTemplete)){
			if(log.isErrorEnabled()) log.error("sql语句不存在：sql id是" + sqlId);
			return null;
    	}
    	
    	String sql = null;
    	if(null == renderType || renderType.equals(ConstantRender.sql_renderType_beetl)){
    		if(log.isDebugEnabled()) log.debug("beetl解析sql");
    		sql = BeetlKit.render(sqlTemplete, param);
    		
    	} else if(renderType.equals(ConstantRender.sql_renderType_freeMarker)){
    		if(log.isDebugEnabled()) log.debug("FreeMarker解析sql");
    		sql = ToolFreeMarker.render(sqlTemplete, param);
    		
    	} else if(renderType.equals(ConstantRender.sql_renderType_velocity)){
    		if(log.isDebugEnabled()) log.debug("Velocity解析sql");
    		sql = ToolVelocity.render(sqlTemplete, param);
    	
    	}
		
		Matcher matcher = pattern.matcher(sql);
		
		while (matcher.find()) {
			String column = matcher.group(0); // 得到的结果形式：#'%$names$%'#
			
			Matcher matcher2 = pattern2.matcher(column);
			matcher2.find();
			String column2 = matcher2.group(0); // 得到的结果形式：$names$
			
			String column3 = StringUtils.replace(column2, "$", ""); // column2.replace("$", "");
			
			if(column.equals("#" + column2 + "#")){ // 数值型，可以对应处理int、long、bigdecimal、double等等
				String val = String.valueOf(param.get(column3));
				if (NumberUtils.isDigits(val)) {
					sql = sql.replace(column, val);
				}else{
					if(log.isErrorEnabled()) log.error("查询参数值错误，整型值传入了字符串，非法字符串是：" + val);
					return null;
				}
				
			}else{ // 字符串，主要是字符串模糊查询、日期比较的查询
				
				String val = (String) param.get(column3); // 预处理参数值
				
				if(column.indexOf("%") != -1){ 	// 判断是否like查询，like查询一般都含有%，然后处理最常见的占位符%和_
					if(val.indexOf("%") != -1){
						val = val.replace("%", "\\%");
					}
					if(val.indexOf("_") != -1){
						val = val.replace("_", "\\_");
					}
				}
				
				String column4 = column.replace("#", "").replace("'", "").replace(column2, val);
				list.add(column4); // 预处理值
				
				sql = sql.replace(column, "?");
			}
		}
		
        return sql.replaceAll("[\\s]{2,}", " ");
    }
    
}
