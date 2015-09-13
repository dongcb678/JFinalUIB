package com.platform.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.platform.constant.ConstantInit;

/**
 * Model注解
 * 说明：标注Model对应的数据源名称、表名称、主键列名称
 * @author 董华健
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE })
public @interface Table {
	
	/**
	 * Model对应的数据库
     * 描述：默认是主数据源
	 * @return
	 */
    String dataSourceName() default ConstantInit.db_dataSource_main;
    
    /**
     * Model对应的表
     * @return
     */
    String tableName();

    /**
     * Model的主键列名称
     * 描述：默认ids，如果用其他列名称，必须用pkName="xxx"注明
     * @return
     */
    String pkName() default "ids";
    
}
