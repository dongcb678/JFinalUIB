package com.platform.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Service注解
 * 说明：标注Service实例name
 * @author 董华健
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE })
public @interface Service {
	
	/**
	 * Service注解名称，必填
	 * @return
	 */
    String name();
    
    /**
     * 是否开启事务，选填，默认false
     * @return
     */
    boolean tx() default false;
    
}
