package test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dzjz.xtpz.qx.po.Yh;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport {
  protected Logger logger = LoggerFactory.getLogger(getClass());
  // 重定向视图
  public static final String RELOAD = "reload";
  // session里面登录用户的key
  public static final String USER_IN_SESSION = "loginUser";

  protected void putContext(String key, Object value) {
    ActionContext.getContext().put(key, value);
  }
  protected Yh getLoginUser() {
	    return (Yh) ActionContext.getContext().getSession().get(USER_IN_SESSION);
	  }

}
