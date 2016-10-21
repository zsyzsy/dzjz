/**
 * 
 */
package com.common;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * @author change
 *
 */
public class MyInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1482554935139974820L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation invoke) throws Exception {
		ActionContext context = ActionContext.getContext();
		String methodName = invoke.getProxy().getMethod();
		String actionName = invoke.getProxy().getActionName();
		String dlbm= (String) ActionContext.getContext().getSession().get("dlbm");
		//登录页面单位树型结构
		if(actionName.equals("dwlist")&&methodName.equals("queryList")){
			return invoke.invoke();
		}
		if(actionName.equals("loginAction")){
			return invoke.invoke();
		}else{
			if(dlbm!=null){
				return invoke.invoke();
			}else{
				return "login";
			}
			
		}
		
	}

}
