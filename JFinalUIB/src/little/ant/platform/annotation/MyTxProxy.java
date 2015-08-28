package little.ant.platform.annotation;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

/**
 * service层cglib事务代理
 * @author 董华健  dongcb678@163.com
 */
public class MyTxProxy implements MethodInterceptor {

	private Object target = null;

	private MyTxProxy(Object target) {
		this.target = target;
	}

	@SuppressWarnings("unchecked")
	public static <T> T newProxy(Class<T> targetClass) {
		if (null == targetClass){
			return null;
		}
			
		Object proxy = null;
		try {
			T t = targetClass.newInstance();
			Enhancer en = new Enhancer();
			en.setSuperclass(targetClass);
			en.setCallback(new MyTxProxy(t));
			proxy = en.create();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return (T) proxy;
	}

	@Override
	public Object intercept(Object proxy, Method method, Object[] args, MethodProxy methodProxy) throws Throwable {
		Object result = null;
		if (method.isAnnotationPresent(MyTx.class)) { // 需要事务控制
			TxInvoke invoke = new TxInvoke(this.target, method, args);
			Db.tx(invoke);
			result = invoke.getResult();
		} else { // 不需要事务
			result = method.invoke(this.target, args);
		}
		return result;
	}

}

/**
 * 数据库事务控制
 * @author 董华健  dongcb678@163.com
 */
class TxInvoke implements IAtom {
	
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
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			throw new SQLException(e); // 异常信息继续往外抛，否则在外层无法捕获异常信息
		}
		return flag;
	}

	public Object getResult() {
		return this.result;
	}

}