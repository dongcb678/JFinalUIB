package little.ant.platform.annotation;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;

/**
 * 事务代理
 */
public class MyTxProxy implements MethodInterceptor {
     
    private Object target = null;
     
    private MyTxProxy(Object target) {
        this.target = target;
    }
     
    @SuppressWarnings("unchecked")
    public static <T> T newProxy(Class<T> targetClass) {
        if(null == targetClass) return null;
        Object proxy = null;
        try {
            T t = targetClass.newInstance();
            Enhancer en = new Enhancer();
            en.setSuperclass(targetClass);
            en.setCallback(new MyTxProxy(t));
            proxy = en.create();
            System.out.println("创建代理：" + targetClass.getName());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return (T)proxy;
    }
 
    @Override
    public Object intercept(Object proxy, Method method, Object[] args,
            MethodProxy methodProxy) throws Throwable {
        Object result = null;
        if(method.isAnnotationPresent(MyTx.class)) {
            TxInvoke invoke = new TxInvoke(this.target, method, args);
            Db.tx(invoke);
            result = invoke.getResult();
        } else {
            result = method.invoke(this.target, args);
        }
        return result;
    }
     
    private class TxInvoke implements IAtom {
        private Object target = null;
        private Method method = null;
        private Object[] args = null;
        private Object result = null;
         
        public TxInvoke(Object target, Method method, Object[] args) {
            this.target = target;
            this.method = method;
            this.args = args;
        }
 
        @Override
        public boolean run() throws SQLException {
            boolean flag = false;
            try {
                this.result = this.method.invoke(this.target, args);
                flag = true;
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            return flag;
        }
         
        public Object getResult() {
            return this.result;
        }
         
    }
 
}
