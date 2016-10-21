/**
 * 
 */
package com.common;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

/**
 * @author change
 *
 */
public class OnlineUserListener implements HttpSessionListener{
	     public void sessionCreated(HttpSessionEvent event){
	          HttpSession session=event.getSession();
	          String id=session.getId()+session.getCreationTime();
	          HttpServletRequest request = ServletActionContext.getRequest();
	          System.out.println("创建一个sesee");
//	          SummerConstant.UserMap.put(id,Boolean.TRUE);//添加用户
	      }
	      
	      public void sessionDestroyed(HttpSessionEvent event){
	         HttpSession session=event.getSession();
	         ServletContext application = session.getServletContext();

	         // 取得登录的用户名
	         String username = (String) session.getAttribute("username");
//	         String dwbm= (String) ActionContext.getContext().get("dwbm");
	         System.out.println("删除session_username:"+username);
//	         System.out.println("删除session_dwbm:"+dwbm);
	         String id=session.getId()+session.getCreationTime();
	         System.out.println(id);
	         synchronized(this){
	        	   System.out.println("删除一个sesee");
	         }
	     }
	 }
