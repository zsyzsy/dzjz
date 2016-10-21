/**
 * 
 */
package test;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.ContextLoader;

import com.common.BaseAction;
import com.dzjz.xtpz.login.action.LoginAction;
import com.dzjz.xtpz.qx.po.Yh;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TaskJob extends BaseAction{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1451469838547483350L;

	public static Logger log = Logger.getLogger(TaskJob.class);
    
    protected LoginAction action=new LoginAction();
    public void SayHello() {
           // TODO Auto-generated method stub
           try {
                  log.info("处理任务开始>........");
                  System.out.println("时间[" + new java.util.Date().toLocaleString()
                                + "]----->啊啊啊啊啊");
                  Map map = System.getenv();  
                  String username = (String)map.get("yh");  
                  String compname = (String)map.get("COMPUTERNAME");  
                  String userdomain =(String)map.get("USERDOMAIN");  
//                 System.out.println(getLoginUsername());
                  System.out.println(username+"/"+compname+"/"+userdomain);
//                  System.out.println(request);
                  ActionContext ctx = ActionContext.getContext();
                  log.info("处理任务结束!");
           } catch (Exception e) {
                  log.error("处理任务出现异常", e);
           }
    }
    

}