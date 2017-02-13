package com.platform.tools;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.jfinal.log.Log;

/**
 * 序列化操作
 * @author 董华健  dongcb678@163.com
 */
public abstract class ToolSerialize {

	private static final Log log = Log.getLog(ToolRandoms.class);
	
	/**
     * 序列化
     * 
     * @param object
     * @return
     */
    public static byte[] serialize(Object object) {
        ObjectOutputStream oos = null;
        ByteArrayOutputStream baos = null;
        try {
            // 序列化
            baos = new ByteArrayOutputStream();
            oos = new ObjectOutputStream(baos);
            oos.writeObject(object);
            byte[] bytes = baos.toByteArray();
            return bytes;
        } catch (Exception e) {
        	if(log.isErrorEnabled()) log.error("序列化异常：" + e.getMessage());
        	e.printStackTrace();
        }
        return null;
    }

    /**
     * 反序列化
     * 
     * @param bytes
     * @return
     */
    public static Object unserialize(byte[] bytes) {
        ByteArrayInputStream bais = null;
        try {
            // 反序列化
            bais = new ByteArrayInputStream(bytes);
            ObjectInputStream ois = new ObjectInputStream(bais);
            return ois.readObject();
        } catch (Exception e) {
        	if(log.isErrorEnabled()) log.error("反序列化异常：" + e.getMessage());
        	e.printStackTrace();
        }
        return null;
    }

}
