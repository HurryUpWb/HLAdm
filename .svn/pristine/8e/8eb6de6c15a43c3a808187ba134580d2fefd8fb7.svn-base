package com;

import java.util.HashSet;
import java.util.Set;

import com.auis.auib.fw.jfinal.model.IdGenerater;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.log.Logger;

/**
 * 拦截器.如果用户没有登陆,则直接跳到用户登陆页
 * @author Administrator
 *
 */
public class AccessInterceptor implements Interceptor {
	public Logger log=Logger.getLogger(getClass());
	protected static IdGenerater idGenerater = new IdGenerater();
	
	public static final Set<String> excludedActionKeys = new HashSet<String>();
	 
	public static void addExcludedActionKey(String actionKey) {
	   excludedActionKeys.add(actionKey);
	  }

	public void intercept(ActionInvocation ai) {
		if (!excludedActionKeys.contains(ai.getActionKey())) {
//	    	//session中不存在值或不存在"sessionvo" 对象,则表示已超时
//	       if(ai.getController().getSession(false)==null || ai.getController().getSession().getAttribute("SessionVO")==null){
//	    	    ai.getController().getRequest().getSession().invalidate();
//   	   		    ai.getController().redirect("/Admin/login/login.html?id=22",true);
//	    		return;
//	       }
	    }
	    ai.invoke();
	}
}
