package com.jfinal.plugin.activerecord.dialect;


public class MsSqlDialect2005 extends com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect {

	@Override
	public void forPaginate(StringBuilder sql, int pageNumber, int pageSize, String select, String sqlExceptSelect) {
		StringBuilder sb = new StringBuilder(sqlExceptSelect.trim().toLowerCase());  
       
		int orderByIndex = sb.indexOf("order by");  
        CharSequence orderby = ((CharSequence) (orderByIndex <= 0 ? "ORDER BY CURRENT_TIMESTAMP" : sb.subSequence(orderByIndex, sb.length())));  
        
        if(orderByIndex > 0) {
        	sqlExceptSelect = sqlExceptSelect.substring(0, orderByIndex-1);
        }
        
		int start = (pageNumber - 1) * pageSize + 1;
		int end = pageNumber * pageSize;
		sql.append("select * from ( ").append(select).append(", ROW_NUMBER() OVER ("+orderby.toString()+") rownum_ ").append(sqlExceptSelect);
		sql.append(" ) row_ where rownum_ >=").append(start).append(" and rownum_ <= ").append(end);
	}
	
	public boolean isTakeOverModelPaginate() {
		return false;
	}
}
