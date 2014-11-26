package little.ant.platform.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Model注解
 * @author 董华健
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE })
public @interface Table {
	
	/**
	 * Model对应的数据库
	 * @return
	 */
    String dataSourceName();
    
    /**
     * Model对应的表
     * @return
     */
    String tableName();

    /**
     * Model的主键列名称
     * @return
     */
    String pkName() default "ids";
    
}
